Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB0E3B1997
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 14:09:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G92B21QXYz309H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 22:09:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZZUdc7qe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZZUdc7qe; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G929W1lRLz2yYV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 22:08:44 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id h11so2376738wrx.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=zq3t0u5xMRyYy+PPOyfs2BszvfOMB0nPqPP+zibTZic=;
 b=ZZUdc7qeHObZt/0a9R44fVRmlXcKBsqAGwLiCYe0piSSFEReOAsaMbp/iKDJzuzN7L
 +lCnvXHLRu9Lb8QuJYgpNRCoXyuoCfu3Fhx9TPpLNmqg7LB4tqN61tDOvjHOkhJYmmwu
 ZsruUQ8igSBVh/NpTW967yfDuMx7+rZDlhlBz9YP6DRX84h7j/FZCPQHyO+M+HaSLJIT
 pOLOZuKng5FF149edH/WqipQlfwCCuZl9yU+PdxcSxbcT7QwKxLXrXOlKvMiTnIkZW3J
 N5WLGZWJl59JlOLdMzLk8eLjAWR9AiZDmK6UxkjLYuT/w/exqOApPrwAtzp2rjVOWuT0
 qWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=zq3t0u5xMRyYy+PPOyfs2BszvfOMB0nPqPP+zibTZic=;
 b=iEp5LFc5fs2bmEv1a2Yv115FMOmzCEP9Aj0M2fcwhpgcETc5bnYHs60bjaluQbl2bU
 McdqNYQR+YrT69qhvitUWJ97GkIcbY2/5UdIlwhnCqDx3G6LxzpTdOkVu3So7CXnWcWv
 k9X8+YW2Ep143b1VL9qTF6XfhmcUaCZV98zWxKw6aFj8gf5MtqSGDhovnl/KEKOQY+bU
 zblGTLQAnpGVfXgSdIe2oVsnljTlvwyWiPBiEHVa1eNdnz813rVwy2WhoDosKdwTbk7F
 eP2TEuixlm1UDiPGNp9zW99Fv/YfHF36tk7TpaapZcNklEABWCBqUMqwiLN/6Sfz3cxT
 O0JA==
X-Gm-Message-State: AOAM530I+CIW5i9teYS9t86jatw36je9pe9c/PT7ooMvQM29rcxbgpQr
 5Hdn0BM/EYd+bTFZCtK1mMv1Ug==
X-Google-Smtp-Source: ABdhPJx2mCd7us3M8obVXjyPpGyOdgxdmNhWipAnEhf0QduR6HI5p50wWdDiSe4EykcEAgfsaQTpbw==
X-Received: by 2002:adf:fa0a:: with SMTP id m10mr11009382wrr.135.1624450117831; 
 Wed, 23 Jun 2021 05:08:37 -0700 (PDT)
Received: from vingu-book ([2a01:e0a:f:6020:d0f0:91e2:cc37:7fd9])
 by smtp.gmail.com with ESMTPSA id z9sm5570745wmf.43.2021.06.23.05.08.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Jun 2021 05:08:36 -0700 (PDT)
Date: Wed, 23 Jun 2021 14:08:35 +0200
From: Vincent Guittot <vincent.guittot@linaro.org>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
Message-ID: <20210623120835.GB29143@vingu-book>
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book>
 <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book>
 <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Odin Ugedal <odin@uged.al>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le mercredi 23 juin 2021 à 15:52:59 (+0530), Sachin Sant a écrit :
> 
> 
> > On 23-Jun-2021, at 1:28 PM, Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:
> > 
> > 
> >>>> Could you try the patch below ? I have been able to reproduce the problem locally and this
> >>>> fix it on my system:
> >>>> 
> >>> I can recreate the issue with this patch.
> >> 
> >> ok, so your problem seem to be different from my assumption. Could you try
> >> the patch below on top of the previous one ?
> >> 
> >> This will help us to confirm that the problem comes from load_avg and that
> >> it's linked to the cfs load_avg and it's not a problem happening earlier in
> >> the update of PELT.
> >> 
> > 
> > Indeed. With both the patches applied I see following warning related to load_avg
> 
> I left the machine running for sometime. Then attempted a kernel compile.
> I subsequently saw warnings triggered for util_avg as well as runnable_avg
> 
> [ 8371.964935] ------------[ cut here ]------------
> [ 8371.964958] cfs_rq->avg.util_avg
> [ 8371.964969] WARNING: CPU: 16 PID: 479551 at kernel/sched/fair.c:3283 update_blocked_averages+0x700/0x830
> ……..
> ……..
> [ 8664.754506] ------------[ cut here ]------------
> [ 8664.754569] cfs_rq->avg.runnable_avg
> [ 8664.754583] WARNING: CPU: 23 PID: 125 at kernel/sched/fair.c:3284 update_blocked_averages+0x730/0x830
> …….
>

Ok. This becomes even more weird. Could you share your config file and more details about
you setup ?

Have you applied the patch below ? 
https://lore.kernel.org/lkml/20210621174330.11258-1-vincent.guittot@linaro.org/

Regarding the load_avg warning, I can see possible problem during attach. Could you add
the patch below. The load_avg warning seems to happen during boot and sched_entity
creation.

---
 kernel/sched/fair.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8a6566f945a0..5e86139524c2 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3753,11 +3753,12 @@ static void attach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
 
 	se->avg.runnable_sum = se->avg.runnable_avg * divider;
 
-	se->avg.load_sum = divider;
 	if (se_weight(se)) {
 		se->avg.load_sum =
-			div_u64(se->avg.load_avg * se->avg.load_sum, se_weight(se));
-	}
+			div_u64(se->avg.load_avg * divider, se_weight(se));
+	 } else {
+		se->avg.load_avg = 0;
+	 }
 
 	enqueue_load_avg(cfs_rq, se);
 	cfs_rq->avg.util_avg += se->avg.util_avg;
-- 
2.17.1


> > 
> >         Starting NTP client/server...
> >         Starting VDO volume services...
> > [    9.029054] ------------[ cut here ]------------
> > [    9.029084] cfs_rq->avg.load_avg
> > [    9.029111] WARNING: CPU: 21 PID: 1169 at kernel/sched/fair.c:3282 update_blocked_averages+0x760/0x830
> > [    9.029151] Modules linked in: pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables xfs libcrc32c sr_mod sd_mod cdrom t10_pi sg ibmvscsi ibmveth scsi_transport_srp dm_mirror dm_region_hash dm_log dm_mod fuse
> > [    9.029233] CPU: 21 PID: 1169 Comm: grep Not tainted 5.13.0-rc7-next-20210621-dirty #3
> > [    9.029246] NIP:  c0000000001b6150 LR: c0000000001b614c CTR: c000000000728f40
> > [    9.029259] REGS: c00000000e177650 TRAP: 0700   Not tainted  (5.13.0-rc7-next-20210621-dirty)
> > [    9.029271] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48088224  XER: 00000005
> > [    9.029296] CFAR: c00000000014d120 IRQMASK: 1 
> > [    9.029296] GPR00: c0000000001b614c c00000000e1778f0 c0000000029bb900 0000000000000014 
> > [    9.029296] GPR04: 00000000fffeffff c00000000e1775b0 0000000000000027 c00000154f637e18 
> > [    9.029296] GPR08: 0000000000000023 0000000000000001 0000000000000027 c00000167f1d7fe8 
> > [    9.029296] GPR12: 0000000000008000 c00000154ffe0e80 000000000000b820 000000021a2c6864 
> > [    9.029296] GPR16: c0000000482cc000 c00000154f6c2580 0000000000000001 0000000000000000 
> > [    9.029296] GPR20: c00000000291a7f9 c0000000482cc100 0000000000000000 000000000000020d 
> > [    9.029296] GPR24: 0000000000000000 c00000154f6c2f90 0000000000000001 c000000030b84400 
> > [    9.029296] GPR28: 000000000000020d c0000000482cc1c0 0000000000000338 0000000000000000 
> > [    9.029481] NIP [c0000000001b6150] update_blocked_averages+0x760/0x830
> > [    9.029494] LR [c0000000001b614c] update_blocked_averages+0x75c/0x830
> > [    9.029508] Call Trace:
> > [    9.029515] [c00000000e1778f0] [c0000000001b614c] update_blocked_averages+0x75c/0x830 (unreliable)
> > [    9.029533] [c00000000e177a20] [c0000000001bd388] newidle_balance+0x258/0x5c0
> > [    9.029542] [c00000000e177ab0] [c0000000001bd7cc] pick_next_task_fair+0x7c/0x4c0
> > [    9.029574] [c00000000e177b10] [c000000000cee3dc] __schedule+0x15c/0x1780
> > [    9.029599] [c00000000e177c50] [c0000000001a5984] do_task_dead+0x64/0x70
> > [    9.029622] [c00000000e177c80] [c000000000156338] do_exit+0x848/0xcc0
> > [    9.029646] [c00000000e177d50] [c000000000156884] do_group_exit+0x64/0xe0
> > [    9.029666] [c00000000e177d90] [c000000000156924] sys_exit_group+0x24/0x30
> > [    9.029688] [c00000000e177db0] [c0000000000310c0] system_call_exception+0x150/0x2d0
> >         Startin[    9.029710] [gc00000000e177e10 Hardware Monito] [c00000000000_common+0xec/0x2lling Sensors...
> > 78
> > [    9.029743] --- interrupt: c00 at 0x7fff943fddcc
> > [    9.029758] NIP:  00007fff943fddcc LR: 00007fff94357f04 CTR: 0000000000000000
> > [    9.029786] REGS: c00000000e177e80 TRAP: 0c00   Not tainted  (5.13.0-rc7-next-20210621-dirty)
> > [    9.029798] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28000402  XER: 00000000
> > [    9.029825] IRQMASK: 0 
> > [    9.029825] GPR00: 00000000000000ea 00007ffff59c0170 00007fff94527100 0000000000000001 
> > [    9.029825] GPR04: 0000000000000000 0000000000000000 0000000000000001 0000000000000000 
> > [    9.029825] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> > [    9.029825] GPR12: 0000000000000000 00007fff9466af00 0000000000000000 0000000000000000 
> > [    9.029825] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> > [    9.029825] GPR20: 0000000000000000 00007fff94524f98 0000000000000002 0000000000000001 
> > [    9.029825] GPR24: 00007fff94520950 0000000000000000 0000000000000001 0000000000000001 
> > [    9.029825] GPR28: 0000000000000000 0000000000000000 00007fff94663f10 0000000000000001 
> > [    9.029935] NIP [00007fff943fddcc] 0x7fff943fddcc
> > [    9.029944] LR [00007fff94357f04] 0x7fff94357f04
> > [    9.029952] --- interrupt: c00
> > [    9.029959] Instruction dump:
> > [    9.029966] 0fe00000 4bfffc64 60000000 60000000 89340007 2f890000 409efc38 e8610098 
> > [    9.029987] 39200001 99340007 4bf96f71 60000000 <0fe00000> 4bfffc1c 60000000 60000000 
> > [    9.030013] ---[ end trace 3d7e3a29c9539d96 ]---
> >         Starting Authorization Manager…
> > 
> > Thanks
> > -Sachin
> > 
> > 
> >> 
> >> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> >> index da91db1c137f..8a6566f945a0 100644
> >> --- a/kernel/sched/fair.c
> >> +++ b/kernel/sched/fair.c
> >> @@ -3030,8 +3030,9 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >> static inline void
> >> enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >> {
> >> +       u32 divider = get_pelt_divider(&se->avg);
> >>       cfs_rq->avg.load_avg += se->avg.load_avg;
> >> -       cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
> >> +       cfs_rq->avg.load_sum = cfs_rq->avg.load_avg * divider;
> >> }
> >> 
> >> static inline void
> >> @@ -3304,9 +3305,9 @@ static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
> >>        * Make sure that rounding and/or propagation of PELT values never
> >>        * break this.
> >>        */
> >> -       SCHED_WARN_ON(cfs_rq->avg.load_avg ||
> >> -                     cfs_rq->avg.util_avg ||
> >> -                     cfs_rq->avg.runnable_avg);
> >> +       SCHED_WARN_ON(cfs_rq->avg.load_avg);
> >> +       SCHED_WARN_ON(cfs_rq->avg.util_avg);
> >> +       SCHED_WARN_ON(cfs_rq->avg.runnable_avg);
> >> 
> >>       return true;
> >> }
> >> 
> >> 
> >>> 
> >>>        Starting Terminate Plymouth Boot Screen...
> >>>        Starting Hold until boot process finishes up...
> >>> [FAILED] Failed to start Crash recovery kernel arming.
> >>> See 'systemctl status kdump.service' for details.
> >>> [   10.737913] ------------[ cut here ]------------
> >>> [   10.737960] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg || cfs_rq->avg.runnable_avg
> >>> [   10.737976] WARNING: CPU: 27 PID: 146 at kernel/sched/fair.c:3279 update_blocked_averages+0x758/0x780
> >>> [   10.738010] Modules linked in: stp llc rfkill sunrpc pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables xfs libcrc32c sr_mod sd_mod cdrom t10_pi sg ibmvscsi ibmveth scsi_transport_srp dm_mirror dm_region_hash dm_log dm_mod fuse
> >>> [   10.738089] CPU: 27 PID: 146 Comm: ksoftirqd/27 Not tainted 5.13.0-rc7-next-20210621-dirty #2
> >>> [   10.738103] NIP:  c0000000001b2768 LR: c0000000001b2764 CTR: c000000000729120
> >>> [   10.738116] REGS: c000000015973840 TRAP: 0700   Not tainted  (5.13.0-rc7-next-20210621-dirty)
> >>> [   10.738130] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 48000224  XER: 00000005
> >>> [   10.738161] CFAR: c00000000014d120 IRQMASK: 1 
> >>> [   10.738161] GPR00: c0000000001b2764 c000000015973ae0 c0000000029bb900 0000000000000048 
> >>> [   10.738161] GPR04: 00000000fffeffff c0000000159737a0 0000000000000027 c00000154f9f7e18 
> >>> [   10.738161] GPR08: 0000000000000023 0000000000000001 0000000000000027 c00000167f1d7fe8 
> >>> [   10.738161] GPR12: 0000000000000000 c00000154ffd7e80 c00000154fa82580 000000000000b78a 
> >>> [   10.738161] GPR16: 000000028007883c 00000000000002ed c000000038d31000 0000000000000000 
> >>> [   10.738161] GPR20: 0000000000000000 c0000000029fdfe0 0000000000000000 000000000000037b 
> >>> [   10.738161] GPR24: 0000000000000000 c00000154fa82f90 0000000000000001 c00000003d4ca400 
> >>> [   10.738161] GPR28: 00000000000002ed c000000038d311c0 c000000038d31100 0000000000000000 
> >>> [   10.738281] NIP [c0000000001b2768] update_blocked_averages+0x758/0x780
> >>> [   10.738290] LR [c0000000001b2764] update_blocked_averages+0x754/0x780
> >>> [   10.738299] Call Trace:
> >>> [   10.738303] [c000000015973ae0] [c0000000001b2764] update_blocked_averages+0x754/0x780 (unreliable)
> >>> [   10.738315] [c000000015973c00] [c0000000001be720] run_rebalance_domains+0xa0/0xd0
> >>> [   10.738326] [c000000015973c30] [c000000000cf9acc] __do_softirq+0x15c/0x3d4
> >>> [   10.738337] [c000000015973d20] [c000000000158464] run_ksoftirqd+0x64/0x90
> >>> [   10.738346] [c000000015973d40] [c00000000018fd24] smpboot_thread_fn+0x204/0x270
> >>> [   10.738357] [c000000015973da0] [c000000000189770] kthread+0x190/0x1a0
> >>> [   10.738367] [c000000015973e10] [c00000000000ceec] ret_from_kernel_thread+0x5c/0x70
> >>> [   10.738381] Instruction dump:
> >>> [   10.738388] 3863c808 9be9eefe 4bf9a979 60000000 0fe00000 4bfff980 e9210070 e8610088 
> >>> [   10.738410] 39400001 99490003 4bf9a959 60000000 <0fe00000> 4bfffc24 3d22fff6 8929eefb 
> >>> [   10.738431] ---[ end trace 9ca80b55840c53f0 ]—
> >>> 
> >>> Thanks
> >>> -Sachin
> >>> 
> >>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> >>>> index 8cc27b847ad8..da91db1c137f 100644
> >>>> --- a/kernel/sched/fair.c
> >>>> +++ b/kernel/sched/fair.c
> >>>> @@ -3037,8 +3037,9 @@ enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >>>> static inline void
> >>>> dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >>>> {
> >>>> +       u32 divider = get_pelt_divider(&se->avg);
> >>>>      sub_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
> >>>> -       sub_positive(&cfs_rq->avg.load_sum, se_weight(se) * se->avg.load_sum);
> >>>> +       cfs_rq->avg.load_sum = cfs_rq->avg.load_avg * divider;
> >>>> }
> >>>> #else
> >>>> static inline void
> > 
> 
