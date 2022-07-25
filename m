Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7830657F9FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 09:16:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrrv23B6Hz3c1b
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 17:16:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=aKKl4kYK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inria.fr (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=aKKl4kYK;
	dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir; Mon, 25 Jul 2022 17:15:54 AEST
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrrtL1Rblz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 17:15:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kG1YFRKxcbq+zSs5VKV9a0lQuS4b8911u6IYa7dyiHw=;
  b=aKKl4kYK8n9zjT/c1/cJvvic1NAhsKv0FOIN5j3RC+V/+fWiI7v/dPwZ
   Ca4UHnD0aHeNsfSoWctcyarLicKm2J2sr+8Ydk0IZwX2RJH8oJW/vjplE
   /7LoxvrdS+zYQktwNaL5TeV9WbvH+FONXwMFmMaJL2xu8JepDCbDBpbyo
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.93,192,1654552800"; 
   d="scan'208";a="20053995"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 09:14:44 +0200
Date: Mon, 25 Jul 2022 09:14:39 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kvm: fix repeated words in comments Delete the
 redundant word 'that'.
In-Reply-To: <87bktdd6s8.fsf@mpe.ellerman.id.au>
Message-ID: <alpine.DEB.2.22.394.2207250913290.2424@hadrien>
References: <20220724062920.1551-1-wangjianli@cdjrlc.com> <87bktdd6s8.fsf@mpe.ellerman.id.au>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, paulus@samba.org, liubo03@inspur.com, wangjianli <wangjianli@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Mon, 25 Jul 2022, Michael Ellerman wrote:

> wangjianli <wangjianli@cdjrlc.com> writes:
> > Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> > ---
> >  arch/powerpc/kvm/book3s_64_mmu_hv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> > index 514fd45c1994..73c6db20cd8a 100644
> > --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> > +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> > @@ -1601,7 +1601,7 @@ long kvm_vm_ioctl_resize_hpt_commit(struct kvm *kvm,
> >   * is valid, it is written to the HPT as if an H_ENTER with the
> >   * exact flag set was done.  When the invalid count is non-zero
> >   * in the header written to the stream, the kernel will make
> > - * sure that that many HPTEs are invalid, and invalidate them
> > + * sure that many HPTEs are invalid, and invalidate them
> >   * if not.
>
> The existing wording is correct:
>
>  "the kernel will make sure that ... that many HPTEs are invalid"

Maybe it would be better as "that the number of invalid HPTEs is the same
as the invalid count"?

julia
