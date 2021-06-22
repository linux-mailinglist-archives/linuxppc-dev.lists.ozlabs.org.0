Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA553B0772
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 16:32:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8TPq2yj2z306q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 00:32:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eiKKQMIz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eiKKQMIz; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8TPM6chmz3021
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 00:32:05 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id f15so8491258wro.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=IZkPpMEsSDnOlQDtsQEJ5cUHL3YA0u4F9dGrO3u8/zw=;
 b=eiKKQMIzILeA3F1JbbiKyY1Awzk5u4m1j6jIBzmk/TwFgZ4kdJpGDWWtEsj/vBbm9+
 hU9ADzQjVLsjBQeaGuco8wKQu9BZYTJeIg3bBhlDM7IANBt9SCYMs1RF0nx3b2znvsok
 RtHHW25m1nlLVzMpvUDFSA417G6hLxZga1kutRzd65pJ3oj2VB03nK1+aLhZUwavjbzB
 lHqOv+rhDqIzJDynXSYnBFXy4RRAGqoZ/iOUlbr3uZ2DHrPgni89IYgm3orODGc+hmPO
 Ry2S3NViMZgZCODnkTxLhZ1PBTt48l4MkmsNi6eJt6ooZsmnLkBLhEDjcU41VOuef+4B
 tVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=IZkPpMEsSDnOlQDtsQEJ5cUHL3YA0u4F9dGrO3u8/zw=;
 b=AvzVRA6s+DPrmTv9LKkiTOi1TbwE241RuEcwvoWlT9fkqSyJl3UUa4B240zZaJ5gIM
 k5Hd/JfnezbYewxSJPV8kEYOHfsenlOq0+pZlk5uFZlv7CDSjq32Dl44gITxbS0Vl6Sx
 KypeSFJXV6gfYeU5C4ZTq3Emi2z+1LiHzOGTT9JSLZlyuBaWW7B8EN43wnhH6MKzeihX
 XEtevlZjz9bHdf0KWhxKd5w93oneLzQoFlX86rZHU5VI0sijCMnftCwKi8LsruPdV1qz
 v4ztGPuyvXwLE9Lys3jJcuXGZsdg0mhm1Q8n2K8coAKoByk0B/DgBTaBNQiuaBlqq+Hq
 74lg==
X-Gm-Message-State: AOAM532edbO1E8TA/OU9/qNXgxt2BfPnIisDW48JrP8cXYpk6hsUfeFW
 Huw8n3uzp8SajJSDF0KDV4YT0A==
X-Google-Smtp-Source: ABdhPJz8dPyg9xIOpd4cJhynMnL+AFyo8sGKUOK9J9LlPhE6e6YmkzFv/Tcxzfs3yzTaD74WczyerQ==
X-Received: by 2002:a5d:530d:: with SMTP id e13mr1252771wrv.292.1624372316850; 
 Tue, 22 Jun 2021 07:31:56 -0700 (PDT)
Received: from vingu-book ([2a01:e0a:f:6020:1ca7:ec4c:5563:477f])
 by smtp.gmail.com with ESMTPSA id v15sm2728193wmj.39.2021.06.22.07.31.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 22 Jun 2021 07:31:56 -0700 (PDT)
Date: Tue, 22 Jun 2021 16:31:54 +0200
From: Vincent Guittot <vincent.guittot@linaro.org>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
Message-ID: <20210622143154.GA804@vingu-book>
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
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
Cc: Odin Ugedal <odin@uged.al>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le mardi 22 juin 2021 à 09:49:31 (+0200), Vincent Guittot a écrit :
> Hi Sachin,
> 
> On Tue, 22 Jun 2021 at 09:39, Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:
> >
> > While booting 5.13.0-rc7-next-20210621 on a PowerVM LPAR following warning
> > is seen
> >
> > [   30.922154] ------------[ cut here ]------------
> > [   30.922201] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg || cfs_rq->avg.runnable_avg
> > [   30.922219] WARNING: CPU: 6 PID: 762 at kernel/sched/fair.c:3277 update_blocked_averages+0x758/0x780
> > [   30.922259] Modules linked in: pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables sd_mod t10_pi sg fuse
> > [   30.922309] CPU: 6 PID: 762 Comm: augenrules Not tainted 5.13.0-rc7-next-20210621 #1
> > [   30.922329] NIP:  c0000000001b27e8 LR: c0000000001b27e4 CTR: c0000000007cfda0
> > [   30.922344] REGS: c000000023fcb660 TRAP: 0700   Not tainted  (5.13.0-rc7-next-20210621)
> > [   30.922359] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48488224  XER: 00000005
> > [   30.922394] CFAR: c00000000014d120 IRQMASK: 1
> >                GPR00: c0000000001b27e4 c000000023fcb900 c000000002a08400 0000000000000048
> >                GPR04: 00000000ffff7fff c000000023fcb5c0 0000000000000027 c000000f6fdd7e18
> >                GPR08: 0000000000000023 0000000000000001 0000000000000027 c0000000028a6650
> >                GPR12: 0000000000008000 c000000f6fff7680 c000000f6fe62600 0000000000000032
> >                GPR16: 00000007331a989a c000000f6fe62600 c0000000238a6800 0000000000000001
> >                GPR20: 0000000000000000 c000000002a4dfe0 0000000000000000 0000000000000006
> >                GPR24: 0000000000000000 c000000f6fe63010 0000000000000001 c000000f6fe62680
> >                GPR28: 0000000000000006 c0000000238a69c0 0000000000000000 c000000f6fe62600
> > [   30.922569] NIP [c0000000001b27e8] update_blocked_averages+0x758/0x780
> > [   30.922599] LR [c0000000001b27e4] update_blocked_averages+0x754/0x780
> > [   30.922624] Call Trace:
> > [   30.922631] [c000000023fcb900] [c0000000001b27e4] update_blocked_averages+0x754/0x780 (unreliable)
> > [   30.922653] [c000000023fcba20] [c0000000001bd668] newidle_balance+0x258/0x5c0
> > [   30.922674] [c000000023fcbab0] [c0000000001bdaac] pick_next_task_fair+0x7c/0x4d0
> > [   30.922692] [c000000023fcbb10] [c000000000dcd31c] __schedule+0x15c/0x1780
> > [   30.922708] [c000000023fcbc50] [c0000000001a5a04] do_task_dead+0x64/0x70
> > [   30.922726] [c000000023fcbc80] [c000000000156338] do_exit+0x848/0xcc0
> > [   30.922743] [c000000023fcbd50] [c000000000156884] do_group_exit+0x64/0xe0
> > [   30.922758] [c000000023fcbd90] [c000000000156924] sys_exit_group+0x24/0x30
> > [   30.922774] [c000000023fcbdb0] [c0000000000310c0] system_call_exception+0x150/0x2d0
> > [   30.922792] [c000000023fcbe10] [c00000000000cc5c] system_call_common+0xec/0x278
> > [   30.922808] --- interrupt: c00 at 0x7fffb3acddcc
> > [   30.922821] NIP:  00007fffb3acddcc LR: 00007fffb3a27f04 CTR: 0000000000000000
> > [   30.922833] REGS: c000000023fcbe80 TRAP: 0c00   Not tainted  (5.13.0-rc7-next-20210621)
> > [   30.922847] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28444202  XER: 00000000
> > [   30.922882] IRQMASK: 0
> >                GPR00: 00000000000000ea 00007fffc8f21780 00007fffb3bf7100 0000000000000000
> >                GPR04: 0000000000000000 0000000155f142f0 0000000000000000 00007fffb3d23740
> >                GPR08: fffffffffbad2a87 0000000000000000 0000000000000000 0000000000000000
> >                GPR12: 0000000000000000 00007fffb3d2aeb0 0000000116be95e0 0000000000000032
> >                GPR16: 0000000000000000 00007fffc8f21cd8 000000000000002d 0000000000000024
> >                GPR20: 00007fffc8f21cd4 00007fffb3bf4f98 0000000000000001 0000000000000001
> >                GPR24: 00007fffb3bf0950 0000000000000000 0000000000000000 0000000000000001
> >                GPR28: 0000000000000000 0000000000000000 00007fffb3d23ec0 0000000000000000
> > [   30.923023] NIP [00007fffb3acddcc] 0x7fffb3acddcc
> > [   30.923035] LR [00007fffb3a27f04] 0x7fffb3a27f04
> > [   30.923045] --- interrupt: c00
> > [   30.923052] Instruction dump:
> > [   30.923061] 3863be48 9be97ae6 4bf9a8f9 60000000 0fe00000 4bfff980 e9210070 e8610088
> > [   30.923088] 39400001 99490003 4bf9a8d9 60000000 <0fe00000> 4bfffc24 3d22fff5 89297ae3
> > [   30.923113] ---[ end trace ed07974d2149c499 ]—
> >
> > This warning was introduced with commit 9e077b52d86a
> > sched/pelt: Check that *_avg are null when *_sum are
> 
> Yes. That was exactly the purpose of the patch. There is one last
> remaining part which could generate this. I'm going to prepare a patch

Could you try the patch below ? I have been able to reproduce the problem locally and this
fix it on my system:

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8cc27b847ad8..da91db1c137f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3037,8 +3037,9 @@ enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
 static inline void
 dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
+       u32 divider = get_pelt_divider(&se->avg);
        sub_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
-       sub_positive(&cfs_rq->avg.load_sum, se_weight(se) * se->avg.load_sum);
+       cfs_rq->avg.load_sum = cfs_rq->avg.load_avg * divider;
 }
 #else
 static inline void


> 
> Thanks
> 
> >
> > next-20210618 was good.
> >
> > Thanks
> > -Sachin
