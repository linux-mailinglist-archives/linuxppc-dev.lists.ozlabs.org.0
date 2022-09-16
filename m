Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9547F5BA401
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 03:32:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTGlS0Xqmz3c7M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 11:32:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kzm71+yi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kzm71+yi;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTGkn23v8z2xrW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 11:31:43 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id w13so4382970plp.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 18:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=NrkT+luy00f9EHTpCkiwdhiyUmtgd2TjeK6uATk5/Xg=;
        b=kzm71+yiNl+w71JLpU/N0SoNP818xAPrHwCqdzgiRksCpbqDVQgI5vP5jlKs/wEJcb
         bPqjghpYDw2Zn3b3Wape/sMgl8zv5Kc8J4igwbeh7c5VBjrhG9wfUHEYIURT7fgY9b0/
         jRVDpVwRemnwth4W3PXzAMq7AmOefAB1p62sKDJNfnpcArObrwydBS7SQJicF+Q/812j
         SxuUeD+tUNUngke9s8BSe40J5HligWJRi78qu1gWd2Ld5KFhQ9sZ/wTPmPS9UwHh0Uts
         Xewf2DqVBeDG+sgDtu7j89qFUuuwb0i96uTXWhy3CjX7eN9KG43Ov4+fuhUMZoPnXURG
         oWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=NrkT+luy00f9EHTpCkiwdhiyUmtgd2TjeK6uATk5/Xg=;
        b=Dio2+YC5D+o4Fqvl9pgpz0lxC8iquVqtBo7nsmEmArF6wax57/+X7Hqnxx6KJWJvVu
         mC0l5BOWLKnzKLHVQ6IlDNSWzGXl4X64mtc3HnvVrETouJMRrs7EznhTAWBz8FmqHBcV
         KqdWSfZ2nqfyoq4JVBvp3lrIGNBmyqMkYfZcm1j45egxqDeduJ7B13eo5Cb+9Vd01etP
         TYqHMUarIAFmO7O1U+96hUiLi6NuO2MGPq1/aMUFF5mNEOpnv5Bml+RCJQpz02C4oAYv
         FOgNWBQnK0Vzv7O+sz8c24pD9EP9lPCUi6wWDDYqVz749NlPsfKhsspBpaicx/T9AYU5
         mD6Q==
X-Gm-Message-State: ACrzQf1CF2h/CtXkhRUk8QJ8mc2T0N8qxypyyxiZ9tS6fOdEWevbHhup
	OP2V5lfTyECzWl+/DFZho4w=
X-Google-Smtp-Source: AMsMyM7XfPxxX6KEgPtJ0RcHaRq+Hf9p2bqWkC847EKP51AxXG7cdun8dOJIBpQiDHGPlLl+ySn8zA==
X-Received: by 2002:a17:90b:17c5:b0:202:596d:6e40 with SMTP id me5-20020a17090b17c500b00202596d6e40mr13816488pjb.53.1663291901253;
        Thu, 15 Sep 2022 18:31:41 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id p14-20020a170902e74e00b001743ba85d39sm13663259plf.110.2022.09.15.18.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 18:31:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Sep 2022 11:31:36 +1000
Message-Id: <CMXFROL4N1OT.4DV7ZOHOP954@bobo>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>, "Nathan Lynch"
 <nathanl@linux.ibm.com>
X-Mailer: aerc 0.11.0
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
 <871qskve2f.fsf@linux.ibm.com>
 <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
 <87y1uotlfa.fsf@linux.ibm.com>
 <14e227181543ab45550ddf8e8fa1c53838361d61.camel@gmail.com>
In-Reply-To: <14e227181543ab45550ddf8e8fa1c53838361d61.camel@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Sep 14, 2022 at 3:39 AM AEST, Leonardo Br=C3=A1s wrote:
> On Mon, 2022-09-12 at 14:58 -0500, Nathan Lynch wrote:
> > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
> > > On Fri, 2022-09-09 at 09:04 -0500, Nathan Lynch wrote:
> > > > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
> > > > > On Wed, 2022-09-07 at 17:01 -0500, Nathan Lynch wrote:
> > > > > > At the time this was submitted by Leonardo, I confirmed -- or t=
hought
> > > > > > I had confirmed -- with PowerVM partition firmware development =
that
> > > > > > the following RTAS functions:
> > > > > >=20
> > > > > > - ibm,get-xive
> > > > > > - ibm,int-off
> > > > > > - ibm,int-on
> > > > > > - ibm,set-xive
> > > > > >=20
> > > > > > were safe to call on multiple CPUs simultaneously, not only wit=
h
> > > > > > respect to themselves as indicated by PAPR, but with arbitrary =
other
> > > > > > RTAS calls:
> > > > > >=20
> > > > > > https://lore.kernel.org/linuxppc-dev/875zcy2v8o.fsf@linux.ibm.c=
om/
> > > > > >=20
> > > > > > Recent discussion with firmware development makes it clear that=
 this
> > > > > > is not true, and that the code in commit b664db8e3f97 ("powerpc=
/rtas:
> > > > > > Implement reentrant rtas call") is unsafe, likely explaining se=
veral
> > > > > > strange bugs we've seen in internal testing involving DLPAR and
> > > > > > LPM. These scenarios use ibm,configure-connector, whose interna=
l state
> > > > > > can be corrupted by the concurrent use of the "reentrant" funct=
ions,
> > > > > > leading to symptoms like endless busy statuses from RTAS.
> > > > >=20
> > > > > Oh, does not it means PowerVM is not compliant to the PAPR specs?
> > > >=20
> > > > No, it means the premise of commit b664db8e3f97 ("powerpc/rtas:
> > > > Implement reentrant rtas call") change is incorrect. The "reentrant=
"
> > > > property described in the spec applies only to the individual RTAS
> > > > functions. The OS can invoke (for example) ibm,set-xive on multiple=
 CPUs
> > > > simultaneously, but it must adhere to the more general requirement =
to
> > > > serialize with other RTAS functions.
> > > >=20
> > >=20
> > > I see. Thanks for explaining that part!
> > > I agree: reentrant calls that way don't look as useful on Linux than =
I
> > > previously thought.
> > >=20
> > > OTOH, I think that instead of reverting the change, we could make use=
 of the
> > > correct information and fix the current implementation. (This could h=
elp when we
> > > do the same rtas call in multiple cpus)
> >=20
> > Hmm I'm happy to be mistaken here, but I doubt we ever really need to d=
o
> > that. I'm not seeing the need.
> >=20
> > > I have an idea of a patch to fix this.=20
> > > Do you think it would be ok if I sent that, to prospect being an alte=
rnative to
> > > this reversion?
> >=20
> > It is my preference, and I believe it is more common, to revert to the
> > well-understood prior state, imperfect as it may be. The revert can be
> > backported to -stable and distros while development and review of
> > another approach proceeds.
>
> Ok then, as long as you are aware of the kdump bug, I'm good.
>
> FWIW:
> Reviewed-by: Leonardo Bras <leobras.c@gmail.com>

A shame. I guess a reader/writer lock would not be much help because
the crash is probably more likely to hit longer running rtas calls?

Alternative is just cheat and do this...?

Thanks,
Nick

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 693133972294..89728714a06e 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -26,6 +26,7 @@
 #include <linux/syscalls.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/panic.h>
=20
 #include <asm/interrupt.h>
 #include <asm/rtas.h>
@@ -97,6 +98,19 @@ static unsigned long lock_rtas(void)
 {
        unsigned long flags;
=20
+       if (atomic_read(&panic_cpu) =3D=3D raw_smp_processor_id()) {
+               /*
+                * Crash in progress on this CPU. Other CPUs should be
+                * stopped by now, so skip the lock in case it was being
+                * held, and is now needed for crashing e.g., kexec
+                * (machine_kexec_mask_interrupts) requires rtas calls.
+                *
+                * It's possible this could have caused rtas state
breakage
+                * but the alternative is deadlock.
+                */
+               return 0;
+       }
+
        local_irq_save(flags);
        preempt_disable();
        arch_spin_lock(&rtas.lock);
@@ -105,6 +119,9 @@ static unsigned long lock_rtas(void)
=20
 static void unlock_rtas(unsigned long flags)
 {
+       if (atomic_read(&panic_cpu) =3D=3D raw_smp_processor_id())
+               return;
+
        arch_spin_unlock(&rtas.lock);
        local_irq_restore(flags);
        preempt_enable();

