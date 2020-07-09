Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7541D2197C5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 07:19:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2PcX4jTmzDqfK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 15:19:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2PZm6tw7zDqXN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 15:18:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=O0js+zgN; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4B2PZm2SR6z9sSn; Thu,  9 Jul 2020 15:18:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1594271888; bh=huY74zD08xEoQzzcmb++Utd5H1cZU8288xctuON9wUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O0js+zgNb7ws6jTLAind1YB8yKnA4vfBC+iMU6ZUPXuNjg8cepRfncN/qJVbh5TVu
 40srmNlGyIWCCYonsBBndk5dOChZP1I7URH/IEhOnLMiI9rTVGgHpRcvIaWpqGCKoi
 u+taSh819gz/QgXo/91MqbqofX4WivynW/HBWMSbWnWZL6h8rDaWFyf1ljahlt4Xph
 cXaZLr7YUMxLHDiQK2xarr+bvWAKBZh1Vs5OiZileECHXjOgAS3E9xxmgb3ize8aqR
 XPl3WMAsNU5VHjRvATWhkhWeZitSzdb/qYm5XIsKuff9vcpVxyBYsyLmoMkffh5iU+
 BLqDybuLS3bVA==
Date: Thu, 9 Jul 2020 15:18:03 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [RFC PATCH v0 2/2] KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in
 nested KVM
Message-ID: <20200709051803.GC2822576@thinks.paulus.ozlabs.org>
References: <20200703104420.21349-1-bharata@linux.ibm.com>
 <20200703104420.21349-3-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703104420.21349-3-bharata@linux.ibm.com>
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 03, 2020 at 04:14:20PM +0530, Bharata B Rao wrote:
> In the nested KVM case, replace H_TLB_INVALIDATE by the new hcall
> H_RPT_INVALIDATE if available. The availability of this hcall
> is determined from "hcall-rpt-invalidate" string in ibm,hypertas-functions
> DT property.

What are we going to use when nested KVM supports HPT guests at L2?
L1 will need to do partition-scoped tlbies with R=0 via a hypercall,
but H_RPT_INVALIDATE says in its name that it only handles radix
page tables (i.e. R=1).

Paul.
