Return-Path: <linuxppc-dev+bounces-12981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C12BE74DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 10:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnzFj49rfz3069;
	Fri, 17 Oct 2025 19:56:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760681004;
	cv=none; b=IuZWnC9CXMMB4BHygIzZI+QiYK9qv94PVQqdboSpyDXFhpNInZoau4YAx26YIL4R7iC4T3au2cPtIl1DzJlgr0LvVaw/OXT3iVdom870AHeUFfskPjezfqb1hV2TFw4tdUGogPMuzi3+2ogo0R9nMcKladagNgoK8X5IrAqGYtThqayknJuiD3cwSn2vjOQ06ps6nW6H5w1JY2ld8dyT7B7NqGOvFqvklvt7hDxRywyyP9dsWq//PASPYVlrs6bNxrU9TDN20CNmoiZXY2i1MGvVX/9prFl0+F58SGI+zI7oWERAdVASaOgf1ljWIK2Pgp4bziQxwa4AaW9A1+ZBog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760681004; c=relaxed/relaxed;
	bh=7fM4AzR1nJU2ZM7NlVXiO8tBQaJZuL012ult4XXGHyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=nkB80IsIHptEo4Hts+/ZAZZoX8s19fMqsYs5Yh8BIU17Ot3QLnkhi0aq69Pr8GpuN3ruwpOGnWV2j4/48Aua8wX5q1YVx9pe/TYQkrYkJD/3j2HtchFXFYH9r35GEDqMwhypYTQyGii6ZXqN1CzAsmqqDdTpHES8HM73DKPlhwysvsmrWCm8LfqL3QTRJUrhk4Ma4VhjBrll9Vi3BAQo81Rr74irdgSxwZmr91+LAQ6cR6sy2zpT16f8UKWry7mZQpufoCGn17Ix0+9/99VU/B9K6qFYYt0RKDJMMEzllz4/4fGknlMvP4R3zM+DDiFSgxPfcSvP+LDo44ErUYpLtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=n63Sp1II; dkim-atps=neutral; spf=pass (client-ip=203.254.224.33; helo=mailout3.samsung.com; envelope-from=youngmin.nam@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=n63Sp1II;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=203.254.224.33; helo=mailout3.samsung.com; envelope-from=youngmin.nam@samsung.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 457 seconds by postgrey-1.37 at boromir; Fri, 17 Oct 2025 17:03:21 AEDT
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnvQ16L5yz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 17:03:19 +1100 (AEDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251017055530epoutp03b52e5138d32caddea1632d2802b956e1~vMZ0mdxOA1402614026epoutp03B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 05:55:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251017055530epoutp03b52e5138d32caddea1632d2802b956e1~vMZ0mdxOA1402614026epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760680530;
	bh=7fM4AzR1nJU2ZM7NlVXiO8tBQaJZuL012ult4XXGHyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n63Sp1IIwOthD6jdaTIkcWJ/vtBOuqyO5JrT9Scy2IM2kWC74eYknvd1xziPgIZ1A
	 FeZHC2mv+CRdvCImWvKCwrUhjLkGE3r4b0ozERJWSxBCkutZ9WpMkqz50h0oQq0//m
	 fxAh7BnwIBOsm4VXQFFQxrVWO2i/JJmyKfUJJQcE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20251017055526epcas2p31cac8ee16c0bb46abc3ae7b3eec7b3cc~vMZwktURS1352713527epcas2p3a;
	Fri, 17 Oct 2025 05:55:26 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.209]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cnvDs4mMKz2SSKd; Fri, 17 Oct
	2025 05:55:25 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251017055524epcas2p2b7cadb80f5d09c4003ccb66d4c39c9dc~vMZvaxaeS2233722337epcas2p2w;
	Fri, 17 Oct 2025 05:55:24 +0000 (GMT)
Received: from perf (unknown [10.229.95.91]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251017055524epsmtip17f2d85c56e9b08636122013814729936~vMZvVgE0t2236022360epsmtip1G;
	Fri, 17 Oct 2025 05:55:24 +0000 (GMT)
Date: Fri, 17 Oct 2025 15:01:05 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, peterz@infradead.org,
	mingo@redhat.com, vincent.guittot@linaro.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com,
	venkat88@linux.ibm.com, jstultz@google.com, d7271.choe@samsung.com,
	soohyuni.kim@samsung.com, bongkyu7.kim@samsung.com,
	youngmin.nam@samsung.com, jkkkkk.choi@samsung.com
Subject: Re: [PATCH] sched/deadline: stop dl_server before CPU goes offline
Message-ID: <aPHbXxJRUTdkBZVA@perf>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <aO4Tw1SzNpgWutK8@jlelli-thinkpadt14gen4.remote.csb>
X-CMS-MailID: 20251017055524epcas2p2b7cadb80f5d09c4003ccb66d4c39c9dc
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----PDOc320tARUDg5oiqWLD4tz058SOCZsoCdAHhD7Rt0rJ7P1y=_b9054_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251017055524epcas2p2b7cadb80f5d09c4003ccb66d4c39c9dc
References: <20251009184727.673081-1-sshegde@linux.ibm.com>
	<aO4Tw1SzNpgWutK8@jlelli-thinkpadt14gen4.remote.csb>
	<CGME20251017055524epcas2p2b7cadb80f5d09c4003ccb66d4c39c9dc@epcas2p2.samsung.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

------PDOc320tARUDg5oiqWLD4tz058SOCZsoCdAHhD7Rt0rJ7P1y=_b9054_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 14, 2025 at 11:11:31AM +0200, Juri Lelli wrote:
> Hello,
> 
> On 10/10/25 00:17, Shrikanth Hegde wrote:
> > From: Peter Zijlstra (Intel) <peterz@infradead.org>
> > 
> > IBM CI tool reported kernel warning[1] when running a CPU removal
> > operation through drmgr[2]. i.e "drmgr -c cpu -r -q 1"
> > 
> > WARNING: CPU: 0 PID: 0 at kernel/sched/cpudeadline.c:219 cpudl_set+0x58/0x170
> > NIP [c0000000002b6ed8] cpudl_set+0x58/0x170
> > LR [c0000000002b7cb8] dl_server_timer+0x168/0x2a0
> > Call Trace:
> > [c000000002c2f8c0] init_stack+0x78c0/0x8000 (unreliable)
> > [c0000000002b7cb8] dl_server_timer+0x168/0x2a0
> > [c00000000034df84] __hrtimer_run_queues+0x1a4/0x390
> > [c00000000034f624] hrtimer_interrupt+0x124/0x300
> > [c00000000002a230] timer_interrupt+0x140/0x320
> > 
> > Git bisects to: commit 4ae8d9aa9f9d ("sched/deadline: Fix dl_server getting stuck")
> > 
> > This happens since: 
> > - dl_server hrtimer gets enqueued close to cpu offline, when 
> >   kthread_park enqueues a fair task.
> > - CPU goes offline and drmgr removes it from cpu_present_mask.
> > - hrtimer fires and warning is hit.
> > 
> > Fix it by stopping the dl_server before CPU is marked dead.
> > 
> > [1]: https://lore.kernel.org/all/8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com/
> > [2]: https://github.com/ibm-power-utilities/powerpc-utils/tree/next/src/drmgr
> > 
> > [sshegde: wrote the changelog and tested it]
> > Fixes: 4ae8d9aa9f9d ("sched/deadline: Fix dl_server getting stuck")
> > Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > Closes: https://lore.kernel.org/all/8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> 
> Looks good to me.
> 
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> 
> Thanks!
> Juri
> 

Hi All,

Could we expect this patch to address the following issue as well?

https://lore.kernel.org/all/aMKTHKfegBk4DgjA@jlelli-thinkpadt14gen4.remote.csb/

Thanks,
Youngmin.

------PDOc320tARUDg5oiqWLD4tz058SOCZsoCdAHhD7Rt0rJ7P1y=_b9054_
Content-Type: text/plain; charset="utf-8"


------PDOc320tARUDg5oiqWLD4tz058SOCZsoCdAHhD7Rt0rJ7P1y=_b9054_--

