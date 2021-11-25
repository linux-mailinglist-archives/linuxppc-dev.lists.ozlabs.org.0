Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A836645D9F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:23:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0H8k4SSRz3c91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 23:23:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qz4l5Cm1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Qz4l5Cm1; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0H825Cr1z2ypV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:22:40 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id k4so4416562plx.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=yKZ++NzL/iCtFkIPFWF9VThiYCcuH9sDScqXkbnIFJM=;
 b=Qz4l5Cm1/uX18iX4qP04T6zjdPpBjp74zIj+Dl+rpTXco0Cw72AgPPSmo3K1VCxbfa
 OFtVwrNQBw0H2a7mQIdSztwWSsozvl7xz+aPhIySxa06Ng7WojK7Gk6FoXsR+rQG8V2a
 rxAw/zTNOP6bkQPjp8vc8O1guN7/3Io0MZFucmHrFSm6NCpkIAA7qtvg2GPwOSLdo4V5
 VjOb0UwMyu7wO3rC9rPDaupBa7G+fqxbhjGKuEwrm5isMz32+P9h1Psr94pDE6VVZ5od
 2oTNjV2aJtFlGSfDkS+d/qiiKwt//BtMzegZBqDvLr/5fGpEN1qhBda4JaY8Ad2M4mA2
 mSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=yKZ++NzL/iCtFkIPFWF9VThiYCcuH9sDScqXkbnIFJM=;
 b=d6vbczlH1NLeuJmFauWvM4CAj4dvkVolqTX5YHJnemBr5uOs6pOWdih8v/J6pNTLNF
 ufTL0ECjiiWJFddRLWfuFj+v/HpbvMb7Q1GSDl+8o0HSInIqYj+zlD8BVxRCKkHhkKJ5
 2n4j1IvN2LKlSMSOFwy0ktPre7EnUbD3rfcGVKunzitaW915H/4tnROzdLdyh47vyh8M
 GAOcdK1T9N2MpiO7GRtPjAvb8QqspkzcWrw7jDjycvTEZssOO9Cxj7UNK7V74Qp1Lc9h
 0a+g3b66M3NFVecPjlfYSUWprivZ6m2hxLl6ptMG6VtsSyqtj2+nLXPZs3Zo7ubrSv5M
 XWjQ==
X-Gm-Message-State: AOAM533EyNZTe7N1r/p9G+/BY3fV67kP7MRV895/N1er+0ynaZLSYMi5
 B0HEt0hGznSL0ncKhQ5OO8I9bTX8KI4=
X-Google-Smtp-Source: ABdhPJx/DUUDkxYsmZfqO8cn3sRvgJiSA4BnLqat/s7uzAGool90i2516ekCvjsr0jxGMac/o+6ocg==
X-Received: by 2002:a17:902:e804:b0:142:1c0b:c2a6 with SMTP id
 u4-20020a170902e80400b001421c0bc2a6mr28016882plg.23.1637842957315; 
 Thu, 25 Nov 2021 04:22:37 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id y25sm2283278pgk.47.2021.11.25.04.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:22:36 -0800 (PST)
Date: Thu, 25 Nov 2021 22:22:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [5.16.0-rc2] Kernel warning while running sigfuz
 w/PPC_IRQ_SOFT_MASK_DEBUG
To: linuxppc-dev@lists.ozlabs.org, Sachin Sant <sachinp@linux.vnet.ibm.com>
References: <F75A81A9-1756-4368-99C7-DD5B3A712530@linux.vnet.ibm.com>
In-Reply-To: <F75A81A9-1756-4368-99C7-DD5B3A712530@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1637842187.e2kyh90mx9.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Sachin Sant's message of November 25, 2021 9:37 pm:
> While running sigfuz powerpc self test following warning is seen on a Pow=
er 10 LPAR.=20
> This warning is seen only with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=3Dy
> The kernel eventually panics.
>=20
> [ 1032.912973] sigfuz[2061671]: bad frame in rt_sigreturn: 0000000097830b=
2d nip 00007fff9d9a0470 lr 00007fff9d9a0464
> [ 1032.913430] ------------[ cut here ]------------
> [ 1032.913455] WARNING: CPU: 6 PID: 2061674 at arch/powerpc/kernel/interr=
upt_64.S:34 system_call_common+0x150/0x268
> [ 1032.913482] Modules linked in: bonding tls nft_fib_inet nft_fib_ipv4 n=
ft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_rejec=
t nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip=
_set nf_tables rfkill libcrc32c nfnetlink sunrpc xts vmx_crypto pseries_rng=
 ip_tables ext4 mbcache jbd2 dm_service_time sd_mod t10_pi sg ibmvfc scsi_t=
ransport_fc ibmveth dm_multipath dm_mirror dm_region_hash dm_log dm_mod fus=
e
> [ 1032.913587] CPU: 6 PID: 2061674 Comm: sigfuz Not tainted 5.16.0-rc2-g9=
5c6ab13ec7e #1
> [ 1032.913612] NIP:  c00000000000c730 LR: 0000000045faa436 CTR: 000000000=
0000000
> [ 1032.913636] REGS: c00000000c7e7b70 TRAP: 0700   Not tainted  (5.16.0-r=
c2-g95c6ab13ec7e)
> [ 1032.913652] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 28004474  XER: 20040000
> [ 1032.913679] CFAR: c00000000003a2d4 IRQMASK: 0=20
> [ 1032.913679] GPR00: c00000000000c6d8 c00000000c7e7e10 000000002fcdac67 =
0000000000000800=20
> [ 1032.913679] GPR04: 0000000060d67006 800000000280f032 0000000045faa436 =
c0000001eb3d4c00=20
> [ 1032.913679] GPR08: 800000000280f032 0000000000000001 0000000000000001 =
0000000060d67004=20
> [ 1032.913679] GPR12: 0000000060d67006 c00000077fdf2300 0000000000000000 =
00007fff9da00000=20

SRR0 =3D=3D r11, regs->nip =3D=3D r12

I wonder if this is just that SRR0 does not implement the bottom 2 bits=20
so the check fails when the signal context sets them. Hopefully the=20
panic is just due to this warning 0x700 program check hitting at a bad
time.

We could always adjust the debug check but maybe something like this=20
would keep those bits clear which might be cleaner.

Thanks,
Nick

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_3=
2.c
index 3e053e2fd6b6..92a3a6982813 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -116,7 +116,7 @@ __unsafe_restore_general_regs(struct pt_regs *regs, str=
uct mcontext __user *sr)
 	int i;
=20
 	for (i =3D 0; i <=3D PT_RESULT; i++) {
-		if ((i =3D=3D PT_MSR) || (i =3D=3D PT_SOFTE))
+		if ((i =3D=3D PT_NIP) || (i =3D=3D PT_MSR) || (i =3D=3D PT_SOFTE))
 			continue;
 		unsafe_get_user(gregs[i], &sr->mc_gregs[i], failed);
 	}
@@ -156,7 +156,7 @@ static __always_inline
 int __unsafe_restore_general_regs(struct pt_regs *regs, struct mcontext __=
user *sr)
 {
 	/* copy up to but not including MSR */
-	unsafe_copy_from_user(regs, &sr->mc_gregs, PT_MSR * sizeof(elf_greg_t), f=
ailed);
+	unsafe_copy_from_user(regs, &sr->mc_gregs, PT_NIP * sizeof(elf_greg_t), f=
ailed);
=20
 	/* copy from orig_r3 (the word after the MSR) up to the end */
 	unsafe_copy_from_user(&regs->orig_gpr3, &sr->mc_gregs[PT_ORIG_R3],
@@ -458,7 +458,7 @@ static long restore_user_regs(struct pt_regs *regs,
 			      struct mcontext __user *sr, int sig)
 {
 	unsigned int save_r2 =3D 0;
-	unsigned long msr;
+	unsigned long nip, msr;
 #ifdef CONFIG_VSX
 	int i;
 #endif
@@ -473,6 +473,8 @@ static long restore_user_regs(struct pt_regs *regs,
 		save_r2 =3D (unsigned int)regs->gpr[2];
 	unsafe_restore_general_regs(regs, sr, failed);
 	set_trap_norestart(regs);
+	unsafe_get_user(nip, &sr->mc_gregs[PT_NIP], failed);
+	regs_set_return_ip(regs, nip & ~3);
 	unsafe_get_user(msr, &sr->mc_gregs[PT_MSR], failed);
 	if (!sig)
 		regs->gpr[2] =3D (unsigned long) save_r2;
@@ -560,7 +562,7 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 				 struct mcontext __user *sr,
 				 struct mcontext __user *tm_sr)
 {
-	unsigned long msr, msr_hi;
+	unsigned long nip, msr, msr_hi;
 	int i;
=20
 	if (tm_suspend_disabled)
@@ -576,7 +578,8 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 		return 1;
=20
 	unsafe_restore_general_regs(&current->thread.ckpt_regs, sr, failed);
-	unsafe_get_user(current->thread.tm_tfhar, &sr->mc_gregs[PT_NIP], failed);
+	unsafe_get_user(nip, &sr->mc_gregs[PT_NIP], failed);
+	current->thread.tm_tfhar =3D nip & ~3;
 	unsafe_get_user(msr, &sr->mc_gregs[PT_MSR], failed);
=20
 	/* Restore the previous little-endian mode */
@@ -646,6 +649,9 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 		current->thread.used_vsr =3D true;
 	}
=20
+	unsafe_get_user(nip, &tm_sr->mc_gregs[PT_NIP], failed);
+	regs_set_return_ip(regs, nip & ~3);
+
 	/* Get the top half of the MSR from the user context */
 	unsafe_get_user(msr_hi, &tm_sr->mc_gregs[PT_MSR], failed);
 	msr_hi <<=3D 32;
@@ -801,7 +807,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *=
oldset,
 	regs->gpr[4] =3D (unsigned long)&frame->info;
 	regs->gpr[5] =3D (unsigned long)&frame->uc;
 	regs->gpr[6] =3D (unsigned long)frame;
-	regs_set_return_ip(regs, (unsigned long) ksig->ka.sa.sa_handler);
+	regs_set_return_ip(regs, (unsigned long) ksig->ka.sa.sa_handler & ~3);
 	/* enter the signal handler in native-endian mode */
 	regs_set_return_msr(regs, (regs->msr & ~MSR_LE) | (MSR_KERNEL & MSR_LE));
=20
@@ -889,7 +895,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t *old=
set,
 	regs->gpr[1] =3D newsp;
 	regs->gpr[3] =3D ksig->sig;
 	regs->gpr[4] =3D (unsigned long) sc;
-	regs_set_return_ip(regs, (unsigned long) ksig->ka.sa.sa_handler);
+	regs_set_return_ip(regs, (unsigned long) ksig->ka.sa.sa_handler & ~3);
 	/* enter the signal handler in native-endian mode */
 	regs_set_return_msr(regs, (regs->msr & ~MSR_LE) | (MSR_KERNEL & MSR_LE));
=20
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_6=
4.c
index d1e1fc0acbea..0327e5c79c36 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -336,7 +336,7 @@ static long notrace __unsafe_restore_sigcontext(struct =
task_struct *tsk, sigset_
 	elf_vrreg_t __user *v_regs;
 #endif
 	unsigned long save_r13 =3D 0;
-	unsigned long msr;
+	unsigned long nip, msr;
 	struct pt_regs *regs =3D tsk->thread.regs;
 #ifdef CONFIG_VSX
 	int i;
@@ -350,7 +350,8 @@ static long notrace __unsafe_restore_sigcontext(struct =
task_struct *tsk, sigset_
=20
 	/* copy the GPRs */
 	unsafe_copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr), efault_o=
ut);
-	unsafe_get_user(regs->nip, &sc->gp_regs[PT_NIP], efault_out);
+	unsafe_get_user(nip, &sc->gp_regs[PT_NIP], efault_out);
+	regs_set_return_ip(regs, nip & ~3);
 	/* get MSR separately, transfer the LE bit if doing signal return */
 	unsafe_get_user(msr, &sc->gp_regs[PT_MSR], efault_out);
 	if (sig)
@@ -434,7 +435,7 @@ static long restore_tm_sigcontexts(struct task_struct *=
tsk,
 	elf_vrreg_t __user *v_regs, *tm_v_regs;
 #endif
 	unsigned long err =3D 0;
-	unsigned long msr;
+	unsigned long nip, msr;
 	struct pt_regs *regs =3D tsk->thread.regs;
 #ifdef CONFIG_VSX
 	int i;
@@ -458,8 +459,10 @@ static long restore_tm_sigcontexts(struct task_struct =
*tsk,
 	 * For the case of getting a signal and simply returning from it,
 	 * we don't need to re-copy them here.
 	 */
-	err |=3D __get_user(regs->nip, &tm_sc->gp_regs[PT_NIP]);
-	err |=3D __get_user(tsk->thread.tm_tfhar, &sc->gp_regs[PT_NIP]);
+	err |=3D __get_user(nip, &tm_sc->gp_regs[PT_NIP]);
+	regs_set_return_ip(regs, nip & ~3);
+	err |=3D __get_user(nip, &sc->gp_regs[PT_NIP]);
+	tsk->thread.tm_tfhar =3D nip & ~3;
=20
 	/* get MSR separately, transfer the LE bit if doing signal return */
 	err |=3D __get_user(msr, &sc->gp_regs[PT_MSR]);
