Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A669C25A302
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 04:26:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh7915X43zDqc1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 12:26:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh76p4V5bzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 12:24:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Lp+85cge; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4Bh76p1Lpdz9sV8; Wed,  2 Sep 2020 12:24:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1599013458; bh=EVixgcCRwMWQEliFU3rC3kvQfdu2zUDN7I19538RUFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lp+85cgesSbN4lHlJc86ML29C4qx3hCTYUlwbUvtWndDtjTon38aXbhOL4a+gPzEf
 zR/1jLvj6BaAqrcvn9oTJDo3SpVnGxm1Oxvy153U5wDdOXSRkHESwkIh0fxAx5yzL8
 TNp0lEUzgCSR2pDRI+HFIfIGMv5MNYu8I4XdKL7rahf+F7ba3rU8h5wpa2dyjlOuKi
 XkdDBiyKjDWvSo0Ov+pX1oIWfz9hMw3fbvLeZ02D8Nc22Z3vwv/v6g4uqLKb3QgpLh
 IshWK5zmMDEuDL249XkM5xtdy279iAHHIM79WHP0HERuIc2a9p2i6U2RoHP/KFyuhp
 WPQ4Qlv/ifY6A==
Date: Wed, 2 Sep 2020 12:01:24 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH 2/7] powerpc/watchpoint/kvm: Add infrastructure to
 support 2nd DAWR
Message-ID: <20200902020124.GB272502@thinks.paulus.ozlabs.org>
References: <20200723102058.312282-1-ravi.bangoria@linux.ibm.com>
 <20200723102058.312282-3-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723102058.312282-3-ravi.bangoria@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: christophe.leroy@c-s.fr, mikey@neuling.org, rogealve@br.ibm.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, jniethe5@gmail.com,
 pedromfc@br.ibm.com, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 23, 2020 at 03:50:53PM +0530, Ravi Bangoria wrote:
> kvm code assumes single DAWR everywhere. Add code to support 2nd DAWR.
> DAWR is a hypervisor resource and thus H_SET_MODE hcall is used to set/
> unset it. Introduce new case H_SET_MODE_RESOURCE_SET_DAWR1 for 2nd DAWR.

Is this the same interface as will be defined in PAPR and available
under PowerVM, or is it a new/different interface for KVM?

> Also, kvm will support 2nd DAWR only if CPU_FTR_DAWR1 is set.

In general QEMU wants to be able to control all aspects of the virtual
machine presented to the guest, meaning that just because a host has a
particular hardware capability does not mean we should automatically
present that capability to the guest.

In this case, QEMU will want a way to control whether the guest sees
the availability of the second DAWR/X registers or not, i.e. whether a
H_SET_MODE to set DAWR[X]1 will succeed or fail.

Paul.
