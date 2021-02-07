Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5277C31245E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 13:57:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYThJ0gWjzDvXD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 23:57:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ousGFxye; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYTcz1nYNzDvbV
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 23:54:24 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id s15so6375313plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Feb 2021 04:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=xxWiIqDLffbReMbfmIfMvsUWXuHRnZ+FurHJ2+mcIeo=;
 b=ousGFxyeJhS8jn1uMXOAVVZ1BIUV5/fGlDBwkUwWfhG2CoWJ31XxoP6QcbSobKBLQP
 CA3VpC7UTdONb4yNLbxgCmMpgw+k/eye9yM+T2SJ33rxbrypmEhTQ9ZsGbTzMindCqET
 nL0Ol+/De7yUO1oKmndZ5JVAQ3/OfO4SmCnBKQrHO81/vaamY/txJTqzSXH4RUXvttjh
 PNWeH5YS2AZb6xfdKzvaF8u9peBYMqA8zKBsi8Bibga6XVCfWLIjXuM9dlNNY1ZXFemJ
 1EJ+0oU5xFDUtbdK8wzFItjTrJ5DOGOgRcOzzTDosT/UY4Rr6omvy62LmszARrvp8GNn
 RtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=xxWiIqDLffbReMbfmIfMvsUWXuHRnZ+FurHJ2+mcIeo=;
 b=b/+D8VET6PqcWTrGDgjTZc9z2Grm51W3Hhx1p6CLcNKq7zXSZTl5S1jW+kY+Tclppm
 WJdZh1nfnXhxqdVHQOJbJq8kvM3QTP+Iywyvyecv/m1ZhL4+nUV85ysy/JcpkUYJJ8Co
 hMBFoBeO1MgN3sLB1KeTbPRQXUfbFtNV1PiXKfwE0+QAfCNAP+ILnlMzyiAzckUMMEPo
 WZ+7OHgSmlzNKZl1VjkgblW5/0IFm8fDlPY+v8amrib3H8R9rWeKsfdQeonVF5EzDWUb
 ULyOoZHoO7+en0lpdpb387S7gq1QmEj4cLBM74wu0zOjxGDVe9zfRZ/7m4KpapjKRoDJ
 ICyg==
X-Gm-Message-State: AOAM532LFEIJfpbusHhXpK3TJy9mfWRS09hZuRK/nevCPh3gBy7pREw7
 kmfVrGB4jrFuDjWgWLKXXTiQUe7iou8=
X-Google-Smtp-Source: ABdhPJzsNNp/x2K6U+8NmFHajCEI5JpB8YFGEsWaDrpR4EUiTbJ/+r8Dr0Y1nhzN0xZPvsZ+fglKwA==
X-Received: by 2002:a17:90a:5305:: with SMTP id
 x5mr12764640pjh.127.1612702459462; 
 Sun, 07 Feb 2021 04:54:19 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id w4sm48180pfn.45.2021.02.07.04.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 04:54:18 -0800 (PST)
Date: Sun, 07 Feb 2021 22:54:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 39/42] powerpc: move NMI entry/exit code into wrapper
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-40-npiggin@gmail.com>
 <87k0rop29e.fsf@mpe.ellerman.id.au>
 <1612438069.44myr3nzfs.astroid@bobo.none>
 <875z36ozkq.fsf@mpe.ellerman.id.au>
 <1612579435.unncvipdys.astroid@bobo.none>
In-Reply-To: <1612579435.unncvipdys.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1612702361.lm7fqo56re.astroid@bobo.none>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of February 6, 2021 12:46 pm:
> Excerpts from Michael Ellerman's message of February 6, 2021 9:38 am:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> Excerpts from Michael Ellerman's message of February 4, 2021 8:15 pm:
>>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>>> This moves the common NMI entry and exit code into the interrupt hand=
ler
>>>>> wrappers.
>>>>>
>>>>> This changes the behaviour of soft-NMI (watchdog) and HMI interrupts,=
 and
>>>>> also MCE interrupts on 64e, by adding missing parts of the NMI entry =
to
>>>>> them.
>>>>>
>>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>>> ---
>>>>>  arch/powerpc/include/asm/interrupt.h | 28 ++++++++++++++++++++++
>>>>>  arch/powerpc/kernel/mce.c            | 11 ---------
>>>>>  arch/powerpc/kernel/traps.c          | 35 +++++---------------------=
--
>>>>>  arch/powerpc/kernel/watchdog.c       | 10 ++++----
>>>>>  4 files changed, 38 insertions(+), 46 deletions(-)
>>>>=20
>>>> This is unhappy when injecting SLB multi-hits:
>>>>=20
>>>>   root@p86-2:~# echo PPC_SLB_MULTIHIT > /sys/kernel/debug/provoke-cras=
h/DIRECT
>>>>   [  312.496026][ T1344] kernel BUG at arch/powerpc/include/asm/interr=
upt.h:152!
>>>>   [  312.496037][ T1344] Oops: Exception in kernel mode, sig: 5 [#1]
>>>>   [  312.496045][ T1344] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2=
048 NUMA pSeries
>>>
>>> pseries hash. Blast!
>>=20
>> The worst kind.
>>=20
>>>> 147 static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs=
, struct interrupt_nmi_state *state)
>>>> 148 {
>>>> 149 	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
>>>> 150 			!firmware_has_feature(FW_FEATURE_LPAR) ||
>>>> 151 			radix_enabled() || (mfmsr() & MSR_DR))
>>>> 152 		nmi_exit();
>>>>=20
>>>>=20
>>>> So presumably it's:
>>>>=20
>>>> #define __nmi_exit()						\
>>>> 	do {							\
>>>> 		BUG_ON(!in_nmi());				\
>>>
>>> Yes that would be it, pseries machine check enables MMU half way throug=
h=20
>>> so only one side of this triggers.
>>>
>>> The MSR_DR check is supposed to catch the other NMIs that run with MMU=20
>>> on (perf, watchdog, etc). Suppose it could test TRAP(regs) explicitly
>>> although I wonder if we should also do this to keep things balanced
>>=20
>> Yeah I think I like that. I'll give it a test.
>=20
> The msr restore? Looking closer, pseries_machine_check_realmode may have
> expected mce_handle_error to enable the MMU, because irq_work_queue uses
> some per-cpu variables I think.
>=20
> So the code might have to be rearranged a bit more than the patch below.

Here is a patch, it should go anywhere before this patch. Seems to
work with some test MCE injection on pseries hash.

Thanks,
Nick
--

powerpc/pseries/mce: restore msr before returning from handler

The pseries real-mode machine check handler can enable the MMU, and
return from the handler with the MMU still enabled.

This works, but real-mode handler wrapper exit handlers want to rely
on the MMU being in real-mode. So change the pseries handler to
restore the MSR after it has finished virtual mode tasks.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/ras.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/=
pseries/ras.c
index 2d9f985fd13a..377439e88598 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -722,6 +722,7 @@ static int mce_handle_error(struct pt_regs *regs, struc=
t rtas_error_log *errp)
 	struct pseries_errorlog *pseries_log;
 	struct pseries_mc_errorlog *mce_log =3D NULL;
 	int disposition =3D rtas_error_disposition(errp);
+	unsigned long msr;
 	u8 error_type;
=20
 	if (!rtas_error_extended(errp))
@@ -747,9 +748,21 @@ static int mce_handle_error(struct pt_regs *regs, stru=
ct rtas_error_log *errp)
 	 *       SLB multihit is done by now.
 	 */
 out:
-	mtmsr(mfmsr() | MSR_IR | MSR_DR);
+	msr =3D mfmsr();
+	mtmsr(msr | MSR_IR | MSR_DR);
+
 	disposition =3D mce_handle_err_virtmode(regs, errp, mce_log,
 					      disposition);
+
+	/*
+	 * Queue irq work to log this rtas event later.
+	 * irq_work_queue uses per-cpu variables, so do this in virt
+	 * mode as well.
+	 */
+	irq_work_queue(&mce_errlog_process_work);
+
+	mtmsr(msr);
+
 	return disposition;
 }
=20
@@ -865,10 +878,8 @@ long pseries_machine_check_realmode(struct pt_regs *re=
gs)
 		 * virtual mode.
 		 */
 		disposition =3D mce_handle_error(regs, errp);
-		fwnmi_release_errinfo();
=20
-		/* Queue irq work to log this rtas event later. */
-		irq_work_queue(&mce_errlog_process_work);
+		fwnmi_release_errinfo();
=20
 		if (disposition =3D=3D RTAS_DISP_FULLY_RECOVERED)
 			return 1;
--=20
2.23.0

