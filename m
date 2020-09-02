Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC7025A314
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 04:34:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh7Ln0csVzDqcv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 12:34:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh7Jt6rJtzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 12:33:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=lLNGBfO0; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4Bh7Jt5XNMz9sV7; Wed,  2 Sep 2020 12:33:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1599013982; bh=3HN/3EBvdb78tsfY8PadQdQ5z7NAekpcsOqrCfMPQqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lLNGBfO0pcebXNzR5mgwARaiB1s+uIQiGmmFYc+0Lnr9idyC1Cz3ht9OXTavvioxD
 l/WmNcValHRjmPwU+6yrqWmZy0PRWaxb/bnGUXCFGxitEfYpGlPwSTvMDcJNg0eoHr
 GQkvS4T3A6tDoH+kgz4/yND883xW/0cN/kjg9WHBkEw22OZUKNATt7P53rQJwekFKi
 wYCjUZO+TuBTjl5wR09qJ6l+7qqa0HpYuy4O9NlCeNndrLJgSd30u8JHb3f/qi4m3Q
 uOxtuuIwqCzYO03yU0nPpyZH8WNoLVNwltJJBb9y13T8GZ7aP7AxgfTSS56mv3nY6a
 DEcR1PurA6cpQ==
Date: Wed, 2 Sep 2020 12:32:59 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH 0/7] powerpc/watchpoint: 2nd DAWR kvm enablement +
 selftests
Message-ID: <20200902023259.GC272502@thinks.paulus.ozlabs.org>
References: <20200723102058.312282-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723102058.312282-1-ravi.bangoria@linux.ibm.com>
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

On Thu, Jul 23, 2020 at 03:50:51PM +0530, Ravi Bangoria wrote:
> Patch #1, #2 and #3 enables p10 2nd DAWR feature for Book3S kvm guest. DAWR
> is a hypervisor resource and thus H_SET_MODE hcall is used to set/unset it.
> A new case H_SET_MODE_RESOURCE_SET_DAWR1 is introduced in H_SET_MODE hcall
> for setting/unsetting 2nd DAWR. Also, new capability KVM_CAP_PPC_DAWR1 has
> been added to query 2nd DAWR support via kvm ioctl.
> 
> This feature also needs to be enabled in Qemu to really use it. I'll reply
> link to qemu patches once I post them in qemu-devel mailing list.
> 
> Patch #4, #5, #6 and #7 adds selftests to test 2nd DAWR.

If/when you resubmit these patches, please split the KVM patches into
a separate series, since the KVM patches would go via my tree whereas
I expect the selftests/powerpc patches would go through Michael
Ellerman's tree.

Paul.
