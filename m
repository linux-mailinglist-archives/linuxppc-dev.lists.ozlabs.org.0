Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D43AE777
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 12:44:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7mPS12HCz3bsf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 20:44:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256 header.s=google header.b=N0nmYpd9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ugedal.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=odin@ugedal.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256
 header.s=google header.b=N0nmYpd9; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7kyg1KqPz2yYG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 19:39:53 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id c138so28793261qkg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 02:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uged.al; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LTw7iSPW13JwN5kzxuNV0UlTuZEX47G87Db9Dc/JG4I=;
 b=N0nmYpd9R3WFPjuXUQHp25KMYz1DUkN3uQXFCiEToOF2Ps0iJk63bvW1cXNiGtM5Js
 C7KK/kU4K3e72xi10AYwNtQVYcCfT4i8owmz7zADomlRpDXt8iUlcEIKyMU4lxYRQ/VX
 djr0Ucm4mGnP9wO9vCd+b4VsPjDS/DHlZ7R5yNyaMzrE9jrhvMHl+iZtVCizmxHLmBHj
 YEaSi8X4lvQvJ9cP4g7/gSsSR0iWhPVyphCLdceNlXtw2ZHeTRV/AIKW8+YTXdhJ+NdH
 jG3R5pQcjUhOpc2KwzqlYycF4tb4y+EuV0quQkT+FR3iYWf5N21BmlbfjRKtIerJLcHO
 U/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LTw7iSPW13JwN5kzxuNV0UlTuZEX47G87Db9Dc/JG4I=;
 b=Va3e0T9jcsO2sMWeQXu8Sbv9Tm7Tj42t53k+aUAqmj+WEl2n0xw4yHXM/fBb1Mxaol
 KUb0GbJ2Ra8eShdxdzHmNoetxgphhw/Cg03h1vv/wwD/5rZsZ+djvOaYMcy0umcbhnX2
 ZwkoYRG+s/JpukpK+XsiIIK2Rz18b4vSBij77whr02MLXJo/Y2bRgN7+JYoYcPub/YGA
 oJNfD6BeDHEPh0TVl7gxBeHCt/1jZq6GR2kegZDxIehRu80Mhnmq94WHDWXQDBOIpW9L
 Hajtv8gwp9K+J6DcGzcd98+iiOhP2Md3ynaRzP4/RvMCkVnv3WmUWKGRZ+mEINgjxyEF
 V6+g==
X-Gm-Message-State: AOAM530nawNaXCQE1gUr/aKxoH5ScPsfL9iE2TBf4V/Ub8MpYUsTU7K3
 SaGaBT5X6FwUOT2VqTy4WXO/JOz0pfwZjKL2XsyUXQ==
X-Google-Smtp-Source: ABdhPJzyRkriSsOpJ7Bib+UeWHp87yR1sqTXaOHyQ0IEDpiY43rLW7sdTQb42O16vlKrbjayD0KEbAIzZOVZPOdjXpA=
X-Received: by 2002:a37:66d0:: with SMTP id
 a199mr22118188qkc.238.1624268387809; 
 Mon, 21 Jun 2021 02:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
In-Reply-To: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
From: Odin Ugedal <odin@uged.al>
Date: Mon, 21 Jun 2021 11:39:08 +0200
Message-ID: <CAFpoUr3g5t3Z0BtW4-jnYomc3cdY=V5=Zt94-C+fHOjGWa107w@mail.gmail.com>
Subject: Re: [powerpc][5.13.0-rc7] Kernel warning (kernel/sched/fair.c:401)
 while running LTP tests
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Jun 2021 20:44:21 +1000
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
Cc: Peter Zijlstra <peterz@infradead.org>, Odin Ugedal <odin@uged.al>,
 linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

man. 21. jun. 2021 kl. 08:33 skrev Sachin Sant <sachinp@linux.vnet.ibm.com>=
:
>
> While running LTP tests (cfs_bandwidth01) against 5.13.0-rc7 kernel on a =
powerpc box
> following warning is seen
>
> [ 6611.331827] ------------[ cut here ]------------
> [ 6611.331855] rq->tmp_alone_branch !=3D &rq->leaf_cfs_rq_list
> [ 6611.331862] WARNING: CPU: 8 PID: 0 at kernel/sched/fair.c:401 unthrott=
le_cfs_rq+0x4cc/0x590
> [ 6611.331883] Modules linked in: nfsv3 nfs_acl nfs lockd grace fscache n=
etfs tun brd overlay vfat fat btrfs blake2b_generic xor zstd_compress raid6=
_pq xfs loop sctp ip6_udp_tunnel udp_tunnel libcrc32c dm_mod bonding rfkill=
 sunrpc pseries_rng xts vmx_crypto sch_fq_codel ip_tables ext4 mbcache jbd2=
 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp fuse [last unloaded: =
init_module]
> [ 6611.331957] CPU: 8 PID: 0 Comm: swapper/8 Tainted: G           OE     =
5.13.0-rc6-gcba5e97280f5 #1
> [ 6611.331968] NIP:  c0000000001b7aac LR: c0000000001b7aa8 CTR: c00000000=
0722d30
> [ 6611.331976] REGS: c00000000274f3a0 TRAP: 0700   Tainted: G           O=
E      (5.13.0-rc6-gcba5e97280f5)
> [ 6611.331985] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 4800022=
4  XER: 00000005
> [ 6611.332002] CFAR: c00000000014ca20 IRQMASK: 1
> [ 6611.332002] GPR00: c0000000001b7aa8 c00000000274f640 c000000001abaf00 =
000000000000002d
> [ 6611.332002] GPR04: 00000000ffff7fff c00000000274f300 0000000000000027 =
c000000efdb07e08
> [ 6611.332002] GPR08: 0000000000000023 0000000000000001 0000000000000027 =
c000000001976680
> [ 6611.332002] GPR12: 0000000000000000 c000000effc0be80 c000000ef07b3f90 =
000000001eefe200
> [ 6611.332002] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [ 6611.332002] GPR20: 0000000000000001 c000000000fa6c08 c000000000fa6030 =
0000000000000001
> [ 6611.332002] GPR24: 0000000000000000 0000000000000000 c000000efde12380 =
0000000000000001
> [ 6611.332002] GPR28: 0000000000000001 0000000000000000 c000000efde12400 =
0000000000000000
> [ 6611.332094] NIP [c0000000001b7aac] unthrottle_cfs_rq+0x4cc/0x590
> [ 6611.332104] LR [c0000000001b7aa8] unthrottle_cfs_rq+0x4c8/0x590
> [ 6611.332113] Call Trace:
> [ 6611.332116] [c00000000274f640] [c0000000001b7aa8] unthrottle_cfs_rq+0x=
4c8/0x590 (unreliable)
> [ 6611.332128] [c00000000274f6e0] [c0000000001b7e38] distribute_cfs_runti=
me+0x1d8/0x280
> [ 6611.332139] [c00000000274f7b0] [c0000000001b81d0] sched_cfs_period_tim=
er+0x140/0x330
> [ 6611.332149] [c00000000274f870] [c00000000022a03c] __hrtimer_run_queues=
+0x17c/0x380
> [ 6611.332158] [c00000000274f8f0] [c00000000022ac68] hrtimer_interrupt+0x=
128/0x2f0
> [ 6611.332168] [c00000000274f9a0] [c00000000002940c] timer_interrupt+0x13=
c/0x370
> [ 6611.332179] [c00000000274fa00] [c000000000009c04] decrementer_common_v=
irt+0x1a4/0x1b0
> [ 6611.332189] --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x24
> [ 6611.332199] NIP:  c0000000000f6af8 LR: c000000000a05f68 CTR: 000000000=
0000000
> [ 6611.332206] REGS: c00000000274fa70 TRAP: 0900   Tainted: G           O=
E      (5.13.0-rc6-gcba5e97280f5)
> [ 6611.332214] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 28000224  XER: 00000000
> [ 6611.332234] CFAR: 0000000000000c00 IRQMASK: 0
> [ 6611.332234] GPR00: 0000000000000000 c00000000274fd10 c000000001abaf00 =
0000000000000000
> [ 6611.332234] GPR04: 00000000000000c0 0000000000000080 0001a91c68b80fa1 =
00000000000003dc
> [ 6611.332234] GPR08: 000000000001f400 0000000000000001 0000000000000000 =
0000000000000000
> [ 6611.332234] GPR12: 0000000000000000 c000000effc0be80 c000000ef07b3f90 =
000000001eefe200
> [ 6611.332234] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [ 6611.332234] GPR20: 0000000000000001 0000000000000002 0000000000000010 =
c0000000019fe2f8
> [ 6611.332234] GPR24: 0000000000000001 00000603517d757e 0000000000000000 =
0000000000000000
> [ 6611.332234] GPR28: 0000000000000001 0000000000000000 c000000001231f90 =
c000000001231f98
> [ 6611.332323] NIP [c0000000000f6af8] plpar_hcall_norets_notrace+0x18/0x2=
4
> [ 6611.332332] LR [c000000000a05f68] check_and_cede_processor+0x48/0x60
> [ 6611.332340] --- interrupt: 900
> [ 6611.332345] [c00000000274fd10] [c000000efdb92380] 0xc000000efdb92380 (=
unreliable)
> [ 6611.332355] [c00000000274fd70] [c000000000a063bc] dedicated_cede_loop+=
0x9c/0x1b0
> [ 6611.332364] [c00000000274fdc0] [c000000000a02b04] cpuidle_enter_state+=
0x2e4/0x4e0
> [ 6611.332375] [c00000000274fe20] [c000000000a02da0] cpuidle_enter+0x50/0=
x70
> [ 6611.332385] [c00000000274fe60] [c0000000001a883c] call_cpuidle+0x4c/0x=
80
> [ 6611.332393] [c00000000274fe80] [c0000000001a8ee0] do_idle+0x380/0x3e0
> [ 6611.332402] [c00000000274ff00] [c0000000001a91bc] cpu_startup_entry+0x=
3c/0x40
> [ 6611.332411] [c00000000274ff30] [c000000000063ff8] start_secondary+0x29=
8/0x2b0
> [ 6611.332421] [c00000000274ff90] [c00000000000c754] start_secondary_prol=
og+0x10/0x14
> [ 6611.332430] Instruction dump:
> [ 6611.332435] 4bfffc44 3d22fff6 8929f328 2f890000 409efea4 39200001 3d42=
fff6 3c62ff4f
> [ 6611.332451] 3863bcd8 992af328 4bf94f15 60000000 <0fe00000> 4bfffe80 7f=
6407b4 7f43d378
> [ 6611.332466] ---[ end trace 1346f865cd1cae91 ]=E2=80=94
>
> 5.13.0-rc6 was good. Bisect points to following patch
>
> commit a7b359fc6a37
> sched/fair: Correctly insert cfs_rq's to list on unthrottle
>
> The test runs to completion(without this warning) if the patch is reverte=
d.
>
> Thanks
> -Sachin
>

Hi,

Thanks for the report! I have a theory about what is possibly causing
this, so I will try to reproduce it and see if my assumptions are
correct.


Odin
