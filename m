Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B88C90C565
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 11:37:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3M9C5vl8z3clp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 19:37:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=jinglin.wen@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 111213 seconds by postgrey-1.37 at boromir; Tue, 18 Jun 2024 19:36:59 AEST
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3M8q0f2Jz3c5q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 19:36:58 +1000 (AEST)
X-QQ-mid: bizesmtpsz10t1718703288tudiii
X-QQ-Originating-IP: 24/5geplR+rievJGK0OhwNv2ND6azFg7OpJbguRyHhU=
Received: from HX01040082.powercore.com.cn ( [14.19.157.182])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Jun 2024 17:34:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14723788730099599002
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc: Fixed duplicate copying in the early boot.
Date: Tue, 18 Jun 2024 17:34:39 +0800
Message-Id: <20240618093439.16982-1-jinglin.wen@shingroup.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87le336c6k.fsf@mail.lhotse>
References: <87le336c6k.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-2
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
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael Ellerman,=0D
=0D
Michael Ellerman <mpe@ellerman.id.au> writes:=0D
> Jinglin Wen <jinglin.wen@shingroup.cn> writes:=0D
> > According to the code logic, when the kernel is loaded to address 0,=0D
> > no copying operation should be performed, but it is currently being=0D
> > done.=0D
> >=0D
> > This patch fixes the issue where the kernel code was incorrectly=0D
> > duplicated to address 0 when booting from address 0.=0D
> >=0D
> > Signed-off-by: Jinglin Wen <jinglin.wen@shingroup.cn>=0D
> > ---=0D
> >  arch/powerpc/kernel/head_64.S | 4 +++-=0D
> >  1 file changed, 3 insertions(+), 1 deletion(-)=0D
> =0D
> Thanks for the improved change log.=0D
> =0D
> The subject could probably still be clearer, maybe:=0D
>   Fix unnecessary copy to 0 when kernel is booted at address 0=0D
=0D
Thanks for your feedback, I will revise my subject.=0D
=0D
> =0D
> Looks like this was introduced by:=0D
> =0D
>   Fixes: b270bebd34e3 ("powerpc/64s: Run at the kernel virtual address ea=
rlier in boot")=0D
>   Cc: stable@vger.kernel.org # v6.4+=0D
> =0D
> Let me know if you think otherwise.=0D
> =0D
> Just out of interest, how are you hitting this bug? AFAIK none of our=0D
> "normal" boot loaders will load the kernel at 0. =0D
> =0D
> > diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_6=
4.S=0D
> > index 4690c219bfa4..6c73551bdc50 100644=0D
> > --- a/arch/powerpc/kernel/head_64.S=0D
> > +++ b/arch/powerpc/kernel/head_64.S=0D
> > @@ -647,7 +647,9 @@ __after_prom_start:=0D
> >   * Note: This process overwrites the OF exception vectors.=0D
> >   */=0D
> >  	LOAD_REG_IMMEDIATE(r3, PAGE_OFFSET)=0D
> > -	mr.	r4,r26			/* In some cases the loader may  */=0D
> > +	tophys(r4,r26)=0D
> > +	cmplwi	cr0,r4,0	/* runtime base addr is zero */=0D
> > +	mr	r4,r26			/* In some cases the loader may */=0D
> >  	beq	9f			/* have already put us at zero */=0D
> 	=0D
> That is a pretty minimal fix, but I think the code would be clearer if=0D
> we just compared the source and destination addresses.=0D
> =0D
> Something like the diff below. Can you confirm that works for you.=0D
> =0D
> cheers=0D
> =0D
=0D
As for how I discovered this bug, we use zImage.epapr for emulation, which =
=0D
loads vmlinux.bin at address 0. When vmlinux.bin is relatively large, I =0D
found that the boot time of Linux 6.6 is much slower compared to Linux 5.10=
.108. =0D
I discovered this issue while comparing the code between the two versions.=
=0D
=0D
> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.=
S=0D
> index 4690c219bfa4..6ad1435303f9 100644=0D
> --- a/arch/powerpc/kernel/head_64.S=0D
> +++ b/arch/powerpc/kernel/head_64.S=0D
> @@ -647,8 +647,9 @@ __after_prom_start:=0D
>   * Note: This process overwrites the OF exception vectors.=0D
>   */=0D
>  	LOAD_REG_IMMEDIATE(r3, PAGE_OFFSET)=0D
> -	mr.	r4,r26			/* In some cases the loader may  */=0D
> -	beq	9f			/* have already put us at zero */=0D
> +	mr	r4, r26			// Load the source address into r4=0D
> +	cmpld	cr0, r3, r4		// Check if source =3D=3D dest=0D
> +	beq	9f			// If so skip the copy=0D
>  	li	r6,0x100		/* Start offset, the first 0x100 */=0D
>  					/* bytes were copied earlier.	 */=0D
=0D
Indeed, your code looks much clearer. I will make the following modificatio=
ns =0D
based on your code:=0D
=0D
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S=
=0D
index 4690c219bfa4..751181dfb897 100644=0D
--- a/arch/powerpc/kernel/head_64.S=0D
+++ b/arch/powerpc/kernel/head_64.S=0D
@@ -647,8 +647,9 @@ __after_prom_start:=0D
  * Note: This process overwrites the OF exception vectors.=0D
  */=0D
        LOAD_REG_IMMEDIATE(r3, PAGE_OFFSET)=0D
-       mr.     r4,r26                  /* In some cases the loader may  */=
=0D
-       beq     9f                      /* have already put us at zero */=0D
+       mr      r4,r26                  /* Load the virtual source address =
into r4 */=0D
+       cmpd    r3,r4           /* Check if source =3D=3D dest */=0D
+       beq     9f                      /* If so skip the copy  */=0D
        li      r6,0x100                /* Start offset, the first 0x100 */=
=0D
                                        /* bytes were copied earlier.    */=
 =0D
=0D
Thanks,=0D
=0D
Jinglin Wen=0D
