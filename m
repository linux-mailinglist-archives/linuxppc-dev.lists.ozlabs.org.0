Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C220F079
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 10:27:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wyCs09FWzDqZm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 18:27:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wy9z0xYLzDqjb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 18:26:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Bdc3UNQK; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49wy9y650Xz9sR4; Tue, 30 Jun 2020 18:26:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1593505574; bh=JbOYm2XV+atwgocCfiD7EFquDxzd1zUoFHSLuxojxvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bdc3UNQK5NBUOHQw7ss2AdD1micdJVbavu7gcDloFI6Lljs882WfVaYGdVz7ngIAe
 xmHIVLcG94NVEWkPQ1vDB8onPqrXXUpTeT8GhRb6MCYyPKWtx57TQnbBD1/VxVSrYk
 zQGWAO4bKpQvA/ujp7IKZ03uHWF6UTqCR0zOUJ/ReS+HsnFaF7gxgL/l1uTWEQgW5W
 HiNTPahpWc+Qq/V8vT+2Uwdwt0/3QF8TiY06RsGH9eJyN1rEWjT71YmnnPLjid1vgq
 qM/K+7sCsQzDn46HdQkNuciK+JnHkNq4xgr33zBdaaM2St8vHGPmmtI1h545uOiFj4
 tvnam+sbO41LA==
Date: Tue, 30 Jun 2020 18:26:07 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc/pseries: Add KVM guest doorbell restrictions
Message-ID: <20200630082607.GB618342@thinks.paulus.ozlabs.org>
References: <20200627150428.2525192-1-npiggin@gmail.com>
 <20200627150428.2525192-4-npiggin@gmail.com>
 <20200630022713.GA618342@thinks.paulus.ozlabs.org>
 <1593495049.cacw882re0.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593495049.cacw882re0.astroid@bobo.none>
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
Cc: kvm-ppc@vger.kernel.org, Anton Blanchard <anton@linux.ibm.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 30, 2020 at 03:35:08PM +1000, Nicholas Piggin wrote:
> Excerpts from Paul Mackerras's message of June 30, 2020 12:27 pm:
> > On Sun, Jun 28, 2020 at 01:04:28AM +1000, Nicholas Piggin wrote:
> >> KVM guests have certain restrictions and performance quirks when
> >> using doorbells. This patch tests for KVM environment in doorbell
> >> setup, and optimises IPI performance:
> >> 
> >>  - PowerVM guests may now use doorbells even if they are secure.
> >> 
> >>  - KVM guests no longer use doorbells if XIVE is available.
> > 
> > It seems, from the fact that you completely remove
> > kvm_para_available(), that you perhaps haven't tried building with
> > CONFIG_KVM_GUEST=y.
> 
> It's still there and builds:

OK, good, I missed that.

> static inline int kvm_para_available(void)
> {
>         return IS_ENABLED(CONFIG_KVM_GUEST) && is_kvm_guest();
> }
> 
> but...
> 
> > Somewhat confusingly, that option is not used or
> > needed when building for a PAPR guest (i.e. the "pseries" platform)
> > but is used on non-IBM platforms using the "epapr" hypervisor
> > interface.
> 
> ... is_kvm_guest() returns false on !PSERIES now.

And therefore kvm_para_available() returns false on all the platforms
where the code that depends on it could actually be used.

It's not correct to assume that !PSERIES means not a KVM guest.

> Not intended
> to break EPAPR. I'm not sure of a good way to share this between
> EPAPR and PSERIES, I might just make a copy of it but I'll see.

OK, so you're doing a new version?

Regards,
Paul.
