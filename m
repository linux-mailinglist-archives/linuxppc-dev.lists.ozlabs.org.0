Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E69FA47A48E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 06:29:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHSnF5P9qz3c5Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 16:29:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eNJUf4kB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eNJUf4kB; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHSmX573rz2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 16:28:26 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so9224021pjj.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 21:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=LgGuVCT0F/6TrN2uHwdLIvMqEvtCzAt7ARh3m1Xp+SU=;
 b=eNJUf4kB9P0gRDzEr5u0PuQN4W4XdD6M/yxrU3y8QptR82yV/qx/zrmIvMyCr+9Kma
 bah/vipHQErRSc16FzZJx8XxnPS83Il/FII8LNX5v/cPcqKJKVjbqF6q+IrpNe8blqEN
 6vpVHRt26yHJTUOCoIcFjCfYivjQKNfORh5/mIPG+qF4Ea884cUlp74IAG7hlhu/Bg8C
 k+X3MZUg/VQcrlJ46BDR6usoNXIvlW3dgSR3DC+3SsUrTQvv2V7wPSE+kOXuOVep9lyV
 4qqI27YxU4XJuydeczCwk4tT9Yqxa23Wi0Xa8KAlXHcmCmSi/rt1HH40FebpKQ8mAmC1
 fAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=LgGuVCT0F/6TrN2uHwdLIvMqEvtCzAt7ARh3m1Xp+SU=;
 b=dpJTmHWPizPgxVDezcQ+3O6OYWrCCUpAV2s/uhvw0u0qxAJKdc+gilndac8eDp77k7
 VPVGZag5HHurfsyvGa70j6N5oFMUvWEDzwZtvmxKH0CgYvgrZ/kdBGeKcMBKV0F0+QHg
 G5DxXsg8bs5Y5q4eZ20Z98p5y2tpxH67yu/+8ja5FfwQwu2MZMB2B6ZDWrDgNrEYUKog
 isFvRO4C9E/ZyvEW20oiqEoaN8gyekHFLH5RitO4qKhY73Ep/zc71fstwn0lkoS20nVZ
 XRfF2XYbWRHaCHbEUv+EUqJNf0WySSuobnq3kqv31w8UNycfNXf1hCq7vCDiOvzx87DM
 y1yA==
X-Gm-Message-State: AOAM533uh6MO9cZbsQqUdTrjiDr9hisYkcuX9BdRy8o9kPElwFdkNmZv
 VyiOu2382dj9C1cBuf0c8Xo=
X-Google-Smtp-Source: ABdhPJyn4kLYTEjVrWfMuQnXfB4qEbuWlebWvjWYaNn2pyzqiulBZw1NhMJJsvg8lu01CHnKvvxioQ==
X-Received: by 2002:a17:90b:4c8b:: with SMTP id
 my11mr26563102pjb.96.1639978101920; 
 Sun, 19 Dec 2021 21:28:21 -0800 (PST)
Received: from localhost (121-44-67-22.tpgi.com.au. [121.44.67.22])
 by smtp.gmail.com with ESMTPSA id k6sm4393729pff.106.2021.12.19.21.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 21:28:21 -0800 (PST)
Date: Mon, 20 Dec 2021 15:28:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc/signal: sanitise PT_NIP and sa_handler low
 bits
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
References: <20211130072933.2004389-1-npiggin@gmail.com>
 <BE11B400-C0DF-4478-9728-327C9232B75E@linux.vnet.ibm.com>
In-Reply-To: <BE11B400-C0DF-4478-9728-327C9232B75E@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1639977910.h19vppmaz3.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Sachin Sant's message of December 15, 2021 8:49 pm:
>=20
>> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> I'm not entirely sure about the 32-bit / compat part. Or the 64-bit for
>> that matter except that it does seem to fix the bug caused by the test
>> program.
>>=20
>> Thanks,
>> Nick
>>=20
>> arch/powerpc/kernel/signal_32.c | 23 ++++++++++++++++-------
>> arch/powerpc/kernel/signal_64.c | 17 ++++++++++++-----
>> 2 files changed, 28 insertions(+), 12 deletions(-)
>=20
> Sorry for the delayed feedback. I was observing confusing test results
> so had to be sure.=20
>=20
> Test results are against  5.16.0-rc5-03218-g798527287598 (powerpc/merge)
>=20
> I ran some extended set of kernel self tests (from powerpc/signal and
> powerpc/security) on POWER8, POWER9 and POWER10 configs.
>=20
> On POWER8 & POWER10 LPAR with this fix tests ran successfully.
>=20
> on POWER9 PowerNV with the fix and following set of configs
>=20
> CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=3Dy
> CONFIG_PPC_RFI_SRR_DEBUG=3Dy
>=20
> the tests ran successfully.
>=20
> But with the fix and following set of configs
>=20
> CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=3Dy
> CONFIG_PPC_RFI_SRR_DEBUG=3Dn
>=20
> I still a warning and then a crash:
>=20
> [  550.568588] count-cache-flush: hardware flush enabled.
> [  550.568593] link-stack-flush: software flush enabled.
> [  550.569604] ------------[ cut here ]------------
> [  550.569611] WARNING: CPU: 21 PID: 3784 at arch/powerpc/kernel/irq.c:28=
8 arch_local_irq_restore+0x22c/0x230
> [  550.569625] Modules linked in: nft_ct nf_conntrack nf_defrag_ipv6 nf_d=
efrag_ipv4 ip_set nf_tables rfkill libcrc32c nfnetlink i2c_dev rpcrdma sunr=
pc ib_umad rdma_ucm ib_srpt ib_isert iscsi_target_mod target_core_mod ib_ip=
oib ib_iser rdma_cm iw_cm libiscsi ib_cm scsi_transport_iscsi mlx5_ib ib_uv=
erbs dm_mod ib_core ses enclosure tpm_i2c_nuvoton i2c_opal ipmi_powernv xts=
 ipmi_devintf uio_pdrv_genirq vmx_crypto ipmi_msghandler i2c_core opal_prd =
uio ibmpowernv leds_powernv powernv_op_panel sch_fq_codel ip_tables ext4 mb=
cache jbd2 mlx5_core sd_mod t10_pi sg mpt3sas ipr tg3 libata mlxfw psample =
raid_class ptp scsi_transport_sas pps_core fuse
> [  550.569752] CPU: 21 PID: 3784 Comm: NetworkManager Kdump: loaded Not t=
ainted 5.16.0-rc5-03218-g798527287598 #8
> [  550.569765] NIP:  c0000000000171dc LR: c000000000033240 CTR: c00000000=
0cf1260
> [  550.569774] REGS: c000000ae08bbab0 TRAP: 0700   Not tainted  (5.16.0-r=
c5-03218-g798527287598)
> [  550.569784] MSR:  9000000000021031 <SF,HV,ME,IR,DR,LE>  CR: 28004444  =
XER: 20040000
> [  550.569802] CFAR: c00000000001704c IRQMASK: 1
> [  550.569802] GPR00: c000000000033240 c000000ae08bbd50 c000000002a10600 =
0000000000000000
> [  550.569802] GPR04: c000000ae08bbe80 00007fffaea1ece0 0000000000000000 =
0000000000000000
> [  550.569802] GPR08: 0000000000000002 0000000000000000 0000000000000002 =
0000000001f3fb0c
> [  550.569802] GPR12: 0000000000004000 c000005fff7c9080 0000000000000000 =
0000000000000000
> [  550.569802] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [  550.569802] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [  550.569802] GPR24: 0000000000000002 0000000000000001 0000000002002000 =
0000000002802000
> [  550.569802] GPR28: 0000000000000000 0000000000000800 c000000ae08bbe80 =
0000000000040080
> [  550.569899] NIP [c0000000000171dc] arch_local_irq_restore+0x22c/0x230
> [  550.569909] LR [c000000000033240] interrupt_exit_user_prepare_main+0x1=
50/0x260
> [  550.569919] Call Trace:
> [  550.569925] [c000000ae08bbd80] [c000000000033240] interrupt_exit_user_=
prepare_main+0x150/0x260
> [  550.569937] [c000000ae08bbde0] [c000000000033744] syscall_exit_prepare=
+0x74/0x150
> [  550.569948] [c000000ae08bbe10] [c00000000000c758] system_call_common+0=
xf8/0x268

Yeah this looks like a different issue. Is there a test running which=20
flips the security mitigations rapidly? There is a race window with
the the static branch causing exit_must_hard_disable() returning two
different values.

We should update they key while single threaded AFAIKS.

Thanks,
Nick
---

diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-f=
ixups.c
index 57c6bb802f6c..a7cb317e7039 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -232,11 +232,22 @@ static DEFINE_MUTEX(exit_flush_lock);
=20
 static int __do_stf_barrier_fixups(void *data)
 {
-	enum stf_barrier_type *types =3D data;
+	enum stf_barrier_type types =3D *(enum stf_barrier_type *)data;
=20
 	do_stf_entry_barrier_fixups(*types);
 	do_stf_exit_barrier_fixups(*types);
=20
+	if ((types & STF_BARRIER_FALLBACK) || (types & STF_BARRIER_SYNC_ORI))
+		stf_exit_reentrant =3D false;
+	else
+		stf_exit_reentrant =3D true;
+
+	if (stf_exit_reentrant && rfi_exit_reentrant)
+		static_branch_disable(&interrupt_exit_not_reentrant);
+	else
+		static_branch_enable(&interrupt_exit_not_reentrant);
+
+
 	return 0;
 }
=20
@@ -257,18 +268,9 @@ void do_stf_barrier_fixups(enum stf_barrier_type types=
)
=20
 	// Prevent static key update races with do_rfi_flush_fixups()
 	mutex_lock(&exit_flush_lock);
-	static_branch_enable(&interrupt_exit_not_reentrant);
=20
 	stop_machine(__do_stf_barrier_fixups, &types, NULL);
=20
-	if ((types & STF_BARRIER_FALLBACK) || (types & STF_BARRIER_SYNC_ORI))
-		stf_exit_reentrant =3D false;
-	else
-		stf_exit_reentrant =3D true;
-
-	if (stf_exit_reentrant && rfi_exit_reentrant)
-		static_branch_disable(&interrupt_exit_not_reentrant);
-
 	mutex_unlock(&exit_flush_lock);
 }
=20
@@ -472,6 +474,16 @@ static int __do_rfi_flush_fixups(void *data)
 		patch_instruction(dest + 2, ppc_inst(instrs[2]));
 	}
=20
+	if (types & L1D_FLUSH_FALLBACK)
+		rfi_exit_reentrant =3D false;
+	else
+		rfi_exit_reentrant =3D true;
+
+	if (stf_exit_reentrant && rfi_exit_reentrant)
+		static_branch_disable(&interrupt_exit_not_reentrant);
+	else
+		static_branch_enable(&interrupt_exit_not_reentrant);
+
 	printk(KERN_DEBUG "rfi-flush: patched %d locations (%s flush)\n", i,
 		(types =3D=3D L1D_FLUSH_NONE)       ? "no" :
 		(types =3D=3D L1D_FLUSH_FALLBACK)   ? "fallback displacement" :
@@ -495,18 +507,9 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
=20
 	// Prevent static key update races with do_stf_barrier_fixups()
 	mutex_lock(&exit_flush_lock);
-	static_branch_enable(&interrupt_exit_not_reentrant);
=20
 	stop_machine(__do_rfi_flush_fixups, &types, NULL);
=20
-	if (types & L1D_FLUSH_FALLBACK)
-		rfi_exit_reentrant =3D false;
-	else
-		rfi_exit_reentrant =3D true;
-
-	if (stf_exit_reentrant && rfi_exit_reentrant)
-		static_branch_disable(&interrupt_exit_not_reentrant);
-
 	mutex_unlock(&exit_flush_lock);
 }
=20
