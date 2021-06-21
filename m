Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A213AE67F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 11:51:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7lD35wWtz3bnR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 19:51:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sHVP3zPm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sHVP3zPm; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7lCZ1lrGz2yYP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 19:51:05 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id d16so21686686lfn.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 02:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XXYvdNEWj/MGYTvITgwucVOE3a8z0n3hUXB9ArNi2L4=;
 b=sHVP3zPmgKC74+TAXz0sjDq/I+KEsZzxe4ir2EdYX+2ZFPYhljExDY9dSIqlCO2Ijm
 joMeBW+Q0vKPNayV6ZNHAQu8ZSBdc3PFQG+9gPhsyEVkjGTiWk51TkzMIo7iCB8H0OHH
 /LefYTxoYup225X73P95BkM3ma6FDfK/60l7M+3zS6xjZ+Rdk31HvvJlRfPMPsMfUMQY
 3qppAaGKtsLuyulZTwCaR73fIZjz3RaAjY222O2opoRi30uHroTv6b5Svk1sc66VOrKo
 B+e1iylEVChof49Pfef5Y0O6iMJcggLmMPIoJINKjvEpWpxTfA5/aA87vcU2txnGKPd1
 TR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XXYvdNEWj/MGYTvITgwucVOE3a8z0n3hUXB9ArNi2L4=;
 b=OwiUzualxu9i2mfJ0nwN1iVdC4YIuuGGVCeQASEyG9dIgMALiPpe9FGHitrTcevQ3y
 ktr5tc2G/QBuZlo4Y+7usvT1e/Ye1bl6uhMHc6pRr0/5CLG8Mj5QbHhyKkgPts5p6DU4
 6LSI+rpzzNL2TApw+MIHbxGBKAwoncCWM/VND44IFs65WA1wHRXQYpgrwON5StBCqbTv
 ksZZHVM0EgSoL4Dntfe5dqM7PZmNmC2wPUoJ0g6OvQbdmMj6GZNzrcLOTnY+JN7eHzjI
 2g4nBJ3tEMGHzzGyunKk84B8CCSRENEPMpViWHoCWA3d8EJTn/gxXSk+eE/J5A01Oqtq
 fzyg==
X-Gm-Message-State: AOAM531dq3dov5oPg2h3Ll/iz0qYYZXvjJW4hsFJL25nM6mzPxIuO1GK
 EtKWlHhCLxSDjeO0VwrMGyN6QEDcnf7aJcIdR3wFQA==
X-Google-Smtp-Source: ABdhPJyZ4ojzs4lKFe02BGMii8d3Kipd14Dac5QKr1UyEd+fYviMLZSMHEAtRc42sK1dMmN2gxpL3tp2K9Mi32GG4nk=
X-Received: by 2002:a05:6512:3483:: with SMTP id
 v3mr13765211lfr.154.1624269058666; 
 Mon, 21 Jun 2021 02:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
 <CAFpoUr3g5t3Z0BtW4-jnYomc3cdY=V5=Zt94-C+fHOjGWa107w@mail.gmail.com>
In-Reply-To: <CAFpoUr3g5t3Z0BtW4-jnYomc3cdY=V5=Zt94-C+fHOjGWa107w@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 21 Jun 2021 11:50:47 +0200
Message-ID: <CAKfTPtC=aXasuSNvn+A3152-4xoOTWROhJpZAVq6RLh1Hacpng@mail.gmail.com>
Subject: Re: [powerpc][5.13.0-rc7] Kernel warning (kernel/sched/fair.c:401)
 while running LTP tests
To: Odin Ugedal <odin@uged.al>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 21 Jun 2021 at 11:39, Odin Ugedal <odin@uged.al> wrote:
>
> man. 21. jun. 2021 kl. 08:33 skrev Sachin Sant <sachinp@linux.vnet.ibm.co=
m>:
> >
> > While running LTP tests (cfs_bandwidth01) against 5.13.0-rc7 kernel on =
a powerpc box
> > following warning is seen
> >
> > [ 6611.331827] ------------[ cut here ]------------
> > [ 6611.331855] rq->tmp_alone_branch !=3D &rq->leaf_cfs_rq_list
> > [ 6611.331862] WARNING: CPU: 8 PID: 0 at kernel/sched/fair.c:401 unthro=
ttle_cfs_rq+0x4cc/0x590
> > [ 6611.331883] Modules linked in: nfsv3 nfs_acl nfs lockd grace fscache=
 netfs tun brd overlay vfat fat btrfs blake2b_generic xor zstd_compress rai=
d6_pq xfs loop sctp ip6_udp_tunnel udp_tunnel libcrc32c dm_mod bonding rfki=
ll sunrpc pseries_rng xts vmx_crypto sch_fq_codel ip_tables ext4 mbcache jb=
d2 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp fuse [last unloaded=
: init_module]
> > [ 6611.331957] CPU: 8 PID: 0 Comm: swapper/8 Tainted: G           OE   =
  5.13.0-rc6-gcba5e97280f5 #1
> > [ 6611.331968] NIP:  c0000000001b7aac LR: c0000000001b7aa8 CTR: c000000=
000722d30
> > [ 6611.331976] REGS: c00000000274f3a0 TRAP: 0700   Tainted: G          =
 OE      (5.13.0-rc6-gcba5e97280f5)
> > [ 6611.331985] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48000=
224  XER: 00000005
> > [ 6611.332002] CFAR: c00000000014ca20 IRQMASK: 1
> > [ 6611.332002] GPR00: c0000000001b7aa8 c00000000274f640 c000000001abaf0=
0 000000000000002d
> > [ 6611.332002] GPR04: 00000000ffff7fff c00000000274f300 000000000000002=
7 c000000efdb07e08
> > [ 6611.332002] GPR08: 0000000000000023 0000000000000001 000000000000002=
7 c000000001976680
> > [ 6611.332002] GPR12: 0000000000000000 c000000effc0be80 c000000ef07b3f9=
0 000000001eefe200
> > [ 6611.332002] GPR16: 0000000000000000 0000000000000000 000000000000000=
0 0000000000000000
> > [ 6611.332002] GPR20: 0000000000000001 c000000000fa6c08 c000000000fa603=
0 0000000000000001
> > [ 6611.332002] GPR24: 0000000000000000 0000000000000000 c000000efde1238=
0 0000000000000001
> > [ 6611.332002] GPR28: 0000000000000001 0000000000000000 c000000efde1240=
0 0000000000000000
> > [ 6611.332094] NIP [c0000000001b7aac] unthrottle_cfs_rq+0x4cc/0x590
> > [ 6611.332104] LR [c0000000001b7aa8] unthrottle_cfs_rq+0x4c8/0x590
> > [ 6611.332113] Call Trace:
> > [ 6611.332116] [c00000000274f640] [c0000000001b7aa8] unthrottle_cfs_rq+=
0x4c8/0x590 (unreliable)
> > [ 6611.332128] [c00000000274f6e0] [c0000000001b7e38] distribute_cfs_run=
time+0x1d8/0x280
> > [ 6611.332139] [c00000000274f7b0] [c0000000001b81d0] sched_cfs_period_t=
imer+0x140/0x330
> > [ 6611.332149] [c00000000274f870] [c00000000022a03c] __hrtimer_run_queu=
es+0x17c/0x380
> > [ 6611.332158] [c00000000274f8f0] [c00000000022ac68] hrtimer_interrupt+=
0x128/0x2f0
> > [ 6611.332168] [c00000000274f9a0] [c00000000002940c] timer_interrupt+0x=
13c/0x370
> > [ 6611.332179] [c00000000274fa00] [c000000000009c04] decrementer_common=
_virt+0x1a4/0x1b0
> > [ 6611.332189] --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x=
24
> > [ 6611.332199] NIP:  c0000000000f6af8 LR: c000000000a05f68 CTR: 0000000=
000000000
> > [ 6611.332206] REGS: c00000000274fa70 TRAP: 0900   Tainted: G          =
 OE      (5.13.0-rc6-gcba5e97280f5)
> > [ 6611.332214] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>=
  CR: 28000224  XER: 00000000
> > [ 6611.332234] CFAR: 0000000000000c00 IRQMASK: 0
> > [ 6611.332234] GPR00: 0000000000000000 c00000000274fd10 c000000001abaf0=
0 0000000000000000
> > [ 6611.332234] GPR04: 00000000000000c0 0000000000000080 0001a91c68b80fa=
1 00000000000003dc
> > [ 6611.332234] GPR08: 000000000001f400 0000000000000001 000000000000000=
0 0000000000000000
> > [ 6611.332234] GPR12: 0000000000000000 c000000effc0be80 c000000ef07b3f9=
0 000000001eefe200
> > [ 6611.332234] GPR16: 0000000000000000 0000000000000000 000000000000000=
0 0000000000000000
> > [ 6611.332234] GPR20: 0000000000000001 0000000000000002 000000000000001=
0 c0000000019fe2f8
> > [ 6611.332234] GPR24: 0000000000000001 00000603517d757e 000000000000000=
0 0000000000000000
> > [ 6611.332234] GPR28: 0000000000000001 0000000000000000 c000000001231f9=
0 c000000001231f98
> > [ 6611.332323] NIP [c0000000000f6af8] plpar_hcall_norets_notrace+0x18/0=
x24
> > [ 6611.332332] LR [c000000000a05f68] check_and_cede_processor+0x48/0x60
> > [ 6611.332340] --- interrupt: 900
> > [ 6611.332345] [c00000000274fd10] [c000000efdb92380] 0xc000000efdb92380=
 (unreliable)
> > [ 6611.332355] [c00000000274fd70] [c000000000a063bc] dedicated_cede_loo=
p+0x9c/0x1b0
> > [ 6611.332364] [c00000000274fdc0] [c000000000a02b04] cpuidle_enter_stat=
e+0x2e4/0x4e0
> > [ 6611.332375] [c00000000274fe20] [c000000000a02da0] cpuidle_enter+0x50=
/0x70
> > [ 6611.332385] [c00000000274fe60] [c0000000001a883c] call_cpuidle+0x4c/=
0x80
> > [ 6611.332393] [c00000000274fe80] [c0000000001a8ee0] do_idle+0x380/0x3e=
0
> > [ 6611.332402] [c00000000274ff00] [c0000000001a91bc] cpu_startup_entry+=
0x3c/0x40
> > [ 6611.332411] [c00000000274ff30] [c000000000063ff8] start_secondary+0x=
298/0x2b0
> > [ 6611.332421] [c00000000274ff90] [c00000000000c754] start_secondary_pr=
olog+0x10/0x14
> > [ 6611.332430] Instruction dump:
> > [ 6611.332435] 4bfffc44 3d22fff6 8929f328 2f890000 409efea4 39200001 3d=
42fff6 3c62ff4f
> > [ 6611.332451] 3863bcd8 992af328 4bf94f15 60000000 <0fe00000> 4bfffe80 =
7f6407b4 7f43d378
> > [ 6611.332466] ---[ end trace 1346f865cd1cae91 ]=E2=80=94
> >
> > 5.13.0-rc6 was good. Bisect points to following patch
> >
> > commit a7b359fc6a37
> > sched/fair: Correctly insert cfs_rq's to list on unthrottle
> >
> > The test runs to completion(without this warning) if the patch is rever=
ted.
> >
> > Thanks
> > -Sachin
> >
>
> Hi,
>
> Thanks for the report! I have a theory about what is possibly causing
> this, so I will try to reproduce it and see if my assumptions are
> correct.

This means that a child's load was not null and it was inserted
whereas parent's load was null. This should not happen unless the
propagation failed somewhere

>
>
> Odin
