Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B56B175BBDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 03:38:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CTjdYxvD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6XJN4myDz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 11:38:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CTjdYxvD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6XHW3swhz2ys8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 11:37:41 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b89600a37fso9473305ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 18:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689903458; x=1690508258;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huaVGGhZQpVTOeNhSkp/VFMLebO0fQZ3pm37DHtYusM=;
        b=CTjdYxvDVi+KrnR6GZSNYKrOZQ8IfRi/+LKfOjNxcThAfoI3xs1cexF+Yq8D1WdMCa
         5xKlxD5kt5heozyPXGY+l6hTzuAryGHU6oq6cRIejuWsUOJtnpTcEs3kcEG5yHHjP+BY
         EyH+Z/z5DJAvuiwmwuAJkk3dK57jGFfI8SzfgOtGG3bnGuZnWRZa0r81KgUdaVGmigCC
         KtvHNCS+dFzuHNfJfkeOLzl9P+w9JHVvEEPw6BGpUfhdkZxOxmR8kdlXcL/odcqigUIf
         si5AGX7UpPZNJkS773X2KEEIc5zGPffvYi8rNDIS8PNJbo6FOwycZZtdaZ+aqgM8/FZv
         WyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689903458; x=1690508258;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=huaVGGhZQpVTOeNhSkp/VFMLebO0fQZ3pm37DHtYusM=;
        b=VCzsG8Kr2EkjQglYQOr3p0LrvsXxQty6r19ymPdw6y4oQzzuIVJCXJ4Tupzx9lU4dv
         Rl8KNcJq0CQo+QRzJFVBIgD87fTfpzdMsXiYP4Ynr8doCtMeH4iidP4iH5qKw5FuL1gX
         VWk0y78wTaXvJMskXvPzp0G14/oIFJ9rxSPnUJ2qh2FhyRiyvJ/oJfvoXMdCUPNthxGM
         F+DA5Yr3K0G+wUfD0GEzkdlsvjTWkcUArJsQ7I1wZoaKHbpST3x6mbO/731XzFLXnZmk
         7jnUdbIMVVcssY3nWJe32WzfEjAuPAilf9v06vvF4mYlD9p9NwHLBQ1/SYzn/TdU1OfC
         88bA==
X-Gm-Message-State: ABy/qLbGwbbnn3Olqd4zsasG+e+MclfvNvfu347c+xpsJEtFFU7+3ivP
	xNodpDUlYCfVUL1mqDvIxQ1ayBaM3Nk=
X-Google-Smtp-Source: APBJJlGAvReEkpqHaHDm6pEROoltiSAv6+/32q1CAEn/F+FYwe8B0Q2tLlTYfEgRQM35WY35aMO+ew==
X-Received: by 2002:a17:903:11d2:b0:1b8:a67f:1c0f with SMTP id q18-20020a17090311d200b001b8a67f1c0fmr654571plh.39.1689903458222;
        Thu, 20 Jul 2023 18:37:38 -0700 (PDT)
Received: from localhost (193-116-195-56.tpgi.com.au. [193.116.195.56])
        by smtp.gmail.com with ESMTPSA id jg19-20020a17090326d300b001b9bebb7a9dsm2068507plb.90.2023.07.20.18.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 18:37:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Jul 2023 11:37:33 +1000
Message-Id: <CU7GS1C5BQE5.1REWHBJRWFS3R@wheely>
Subject: Re: [PATCH 4/4] powerpc/64s/radix: combine final TLB flush and lazy
 tlb mm shootdown IPIs
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.15.2
References: <20230524060821.148015-1-npiggin@gmail.com>
 <20230524060821.148015-5-npiggin@gmail.com> <877cqyj5eo.fsf@mail.lhotse>
In-Reply-To: <877cqyj5eo.fsf@mail.lhotse>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Jul 18, 2023 at 12:54 PM AEST, Michael Ellerman wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> > This performs lazy tlb mm shootdown when doing the exit TLB flush when
> > all mm users go away and user mappings are removed, which avoids having
> > to do the lazy tlb mm shootdown IPIs on the final mmput when all kernel
> > references disappear.
> >
> > powerpc/64s uses a broadcast TLBIE for the exit TLB flush if remote CPU=
s
> > need to be invalidated (unless TLBIE is disabled), so this doesn't
> > necessarily save IPIs but it does avoid a broadcast TLBIE which is quit=
e
> > expensive.
> >
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  arch/powerpc/mm/book3s64/radix_tlb.c | 26 +++++++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
>
> This gives me:
>
> [    1.438910][    T1] Run /init as init process
> [    1.442759][   T96] ------------[ cut here ]------------
> [    1.442836][   T96] WARNING: CPU: 0 PID: 96 at kernel/smp.c:748 smp_ca=
ll_function_many_cond+0xe0/0xad0
> [    1.442920][   T96] Modules linked in:
> [    1.442960][   T96] CPU: 0 PID: 96 Comm: init Not tainted 6.5.0-rc2-g1=
954d181ea09 #168
> [    1.443028][   T96] Hardware name: IBM pSeries (emulated by qemu) POWE=
R9 (raw) 0x4e1202 0xf000005 of:SLOF,git-6b6c16 hv:linux,kvm pSeries
> [    1.443126][   T96] NIP:  c0000000002aab20 LR: c0000000000a5fc4 CTR: 0=
000000000000000
> [    1.443199][   T96] REGS: c00000000c36f5b0 TRAP: 0700   Not tainted  (=
6.5.0-rc2-g1954d181ea09)
> [    1.443280][   T96] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR:=
 44008244  XER: 20040000
> [    1.443382][   T96] CFAR: c0000000002ab524 IRQMASK: 0
> [    1.443382][   T96] GPR00: c0000000000a5fc4 c00000000c36f850 c00000000=
17f9000 c00000000617c580
> [    1.443382][   T96] GPR04: c0000000000a55b0 c00000000617bd00 000000000=
0000001 0000000000000001
> [    1.443382][   T96] GPR08: c0000000029fc88c c00000000c25aa00 000000000=
0000000 0000000044008244
> [    1.443382][   T96] GPR12: 00000000fd780000 c0000000036c0000 000000000=
0000000 c000000004042a00
> [    1.443382][   T96] GPR16: 0000000000000001 0000000000000000 000000000=
0000000 0000000000000000
> [    1.443382][   T96] GPR20: ffffffffffffffff c0000000000a5fc4 000000000=
0000000 c0000000029f85d0
> [    1.443382][   T96] GPR24: c00000000c25b518 0000000000000000 c00000000=
617be60 c00000000617bd00
> [    1.443382][   T96] GPR28: c00000000617c580 c0000000000a55b0 000000000=
0000000 0000000000000000
> [    1.443994][   T96] NIP [c0000000002aab20] smp_call_function_many_cond=
+0xe0/0xad0
> [    1.444069][   T96] LR [c0000000000a5fc4] radix__tlb_flush+0xf4/0x190
> [    1.444133][   T96] Call Trace:
> [    1.444172][   T96] [c00000000c36f850] [ffffffffffffffff] 0xffffffffff=
ffffff (unreliable)
> [    1.444250][   T96] [c00000000c36f920] [c0000000029f7fe0] __cpu_possib=
le_mask+0x0/0x100
> [    1.444326][   T96] [c00000000c36f950] [c0000000004f346c] tlb_finish_m=
mu+0x16c/0x220
> [    1.444402][   T96] [c00000000c36f980] [c0000000004ee894] exit_mmap+0x=
1b4/0x580
> [    1.444474][   T96] [c00000000c36faa0] [c00000000014c140] __mmput+0x60=
/0x1c0
> [    1.444546][   T96] [c00000000c36fae0] [c0000000005cf014] begin_new_ex=
ec+0x5d4/0xec0
> [    1.444622][   T96] [c00000000c36fb60] [c00000000066c6e8] load_elf_bin=
ary+0x4a8/0x1cf0
> [    1.444697][   T96] [c00000000c36fc60] [c0000000005cc410] bprm_execve+=
0x3b0/0xa60
> [    1.444773][   T96] [c00000000c36fd30] [c0000000005ce3a0] do_execveat_=
common+0x1d0/0x300
> [    1.444852][   T96] [c00000000c36fde0] [c0000000005ce524] sys_execve+0=
x54/0x70
> [    1.444928][   T96] [c00000000c36fe10] [c000000000031c24] system_call_=
exception+0x134/0x360
> [    1.445000][   T96] [c00000000c36fe50] [c00000000000d6a0] system_call_=
common+0x160/0x2c4
> [    1.445070][   T96] --- interrupt: c00 at 0x7fffb664cc98
> [    1.445119][   T96] NIP:  00007fffb664cc98 LR: 000000001004bcb0 CTR: 0=
000000000000000
> [    1.445189][   T96] REGS: c00000000c36fe80 TRAP: 0c00   Not tainted  (=
6.5.0-rc2-g1954d181ea09)
> [    1.445271][   T96] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,=
DR,RI,LE>  CR: 22004842  XER: 00000000
> [    1.445390][   T96] IRQMASK: 0
> [    1.445390][   T96] GPR00: 000000000000000b 00007fffd9d11ec0 00007fffb=
6767300 000000002b3f06e8
> [    1.445390][   T96] GPR04: 000000002b3f0780 000000002b3f07b0 000000000=
0000000 0000000000000000
> [    1.445390][   T96] GPR08: 000000002b3f06e8 0000000000000000 000000000=
0000000 0000000000000000
> [    1.445390][   T96] GPR12: 0000000000000000 00007fffb683a930 000000001=
00f0ff8 0000000000000000
> [    1.445390][   T96] GPR16: 0000000000000000 00007fffd9d12020 000000002=
b3f0780 0000000000000000
> [    1.445390][   T96] GPR20: 000000002b3f0778 000000002b3f1330 000000000=
0000000 00000000100c6cb0
> [    1.445390][   T96] GPR24: 0000000000000000 0000000000000000 fffffffff=
fffffff ffffffffffffffff
> [    1.445390][   T96] GPR28: 00000000100d34ae 00000000100c6cf8 000000002=
b3f0780 000000002b3f06e8
> [    1.446042][   T96] NIP [00007fffb664cc98] 0x7fffb664cc98
> [    1.446095][   T96] LR [000000001004bcb0] 0x1004bcb0
> [    1.446147][   T96] --- interrupt: c00
> [    1.446186][   T96] Code: 81490000 394a0001 91490000 e8ed0030 3d420097=
 394ae900 7cea382e 81490000 2c070000 394affff 91490000 41820044 <0fe00000> =
faa100e0 f8410018 f9c10040
> [    1.446356][   T96] irq event stamp: 458
> [    1.446395][   T96] hardirqs last  enabled at (457): [<c00000000056863=
8>] __slab_free+0x228/0x560
> [    1.446481][   T96] hardirqs last disabled at (458): [<c00000000002a6a=
0>] interrupt_enter_prepare+0x90/0x220
> [    1.446577][   T96] softirqs last  enabled at (0): [<c00000000014f658>=
] copy_process+0x9f8/0x20b0
> [    1.446661][   T96] softirqs last disabled at (0): [<0000000000000000>=
] 0x0
> [    1.446723][   T96] ---[ end trace 0000000000000000 ]---
>
> Which is:
>
> static void smp_call_function_many_cond(const struct cpumask *mask,
> 					smp_call_func_t func, void *info,
> 					unsigned int scf_flags,
> 					smp_cond_func_t cond_func)
> {
> 	int cpu, last_cpu, this_cpu =3D smp_processor_id();
> 	struct call_function_data *cfd;
> 	bool wait =3D scf_flags & SCF_WAIT;
> 	int nr_cpus =3D 0;
> 	bool run_remote =3D false;
> 	bool run_local =3D false;
>
> 	lockdep_assert_preemption_disabled();
>
> Called from exit_flush_lazy_tlbs().

Hmm, I guess it just needs this?

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s6=
4/radix_tlb.c
index f1a1ec0d9820..30480e248183 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1322,6 +1322,7 @@ void radix__tlb_flush(struct mmu_gather *tlb)
                         * by batching), then it may end up being better to=
 use
                         * tlbies here instead.
                         */
+                       preempt_disable();
                        smp_mb(); /* see radix__flush_tlb_mm */
                        exit_flush_lazy_tlbs(mm);
                        _tlbiel_pid(mm->context.id, RIC_FLUSH_ALL);
@@ -1332,6 +1333,7 @@ void radix__tlb_flush(struct mmu_gather *tlb)
                         */
                        if (WARN_ON_ONCE(atomic_read(&mm->context.copros) >=
 0))
                                __flush_all_mm(mm, true);
+                       preempt_enable();
                } else {
                        __flush_all_mm(mm, true);
                }

