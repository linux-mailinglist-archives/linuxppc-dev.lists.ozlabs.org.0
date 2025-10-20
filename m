Return-Path: <linuxppc-dev+bounces-13050-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EBCBEF68A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 08:08:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqlNk2SKtz300M;
	Mon, 20 Oct 2025 17:08:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760940518;
	cv=none; b=XJRAbiJb/39HRqqlzK4AOZbXx7dqsYa26e2q/bpswVb8ylSpx2MKjDS4oSWPaWnCGIhFr56Wbob8pDoB/G4qVqraYD7YMAU0Ze4zPwostwIbCxrBNxx23nsyWYLfcvZlKZGe68M3K8YA7EjVNFtZztXGEfbSvmHO0RI6GnnmbAVfaisHokqeSKJkHTwcrStjeMgse0PkSDDcoThCh3fX5BxQyjaylQY8CVnphE/4Iv0yLt9d/73CVARA9tNHL6IKmMurcsGcEDilvEn+4R6ULydFHZu9dd1eERAsjo0n+n5mPLQTq4yVwI3uuDH1lmwQUw4EhuUT8PZVtRO/plUe3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760940518; c=relaxed/relaxed;
	bh=AQuFbzbaUqQeXmCypjw3/sdi/09uNDRdkvz6dGUNKB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=csXL4Yod5DcSlqlV/YNOsGxU3yf/HCQxRnJuqArjIV6eiLlxaSm1r52CY4K53k5xnhvOYo3AhAdeLg3SYzFLZAoABU1ND2IXAHtIa3OC5KKGbzURjqzgS8OZEbrb4pJgsYkP7kfBx44m08KLnqMYQ6AIHIUmHHJqi/aEXA/WzlkRgRMu8kWfBOv2sNgT99mFAj0R5L4w7w7EieCq0GzMNvX7CE9TVovRsJ8N0STXGYGwY4tPSpAClSR1i44Pv7Xf/z/Re4bKM44kFwJrY2m6mysR/uzgpXRS9WZst6T9Wd5crA9idZ65p09YT3lxm8LYxB4LUt8/IAOezOvXs2UJNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXkhDskn; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXkhDskn; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=juri.lelli@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXkhDskn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXkhDskn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=juri.lelli@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqlNj0SrVz2ySV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Oct 2025 17:08:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760940510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AQuFbzbaUqQeXmCypjw3/sdi/09uNDRdkvz6dGUNKB0=;
	b=IXkhDsknS5iFNUHtNaIeXOx2AyYoL2V3BOhw0FwUJwxhQlfsISa0bGZfRLzZz8mT94XIM6
	e4UkQjSctGHcwSoVlOKGe+Oo32g2dXE66Y229IuwnGA1AoFQsAzHqYC+Kz8vpR41o91ql+
	cUjKXuiNRegkq692+NerZpjDMCe8DRE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760940510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AQuFbzbaUqQeXmCypjw3/sdi/09uNDRdkvz6dGUNKB0=;
	b=IXkhDsknS5iFNUHtNaIeXOx2AyYoL2V3BOhw0FwUJwxhQlfsISa0bGZfRLzZz8mT94XIM6
	e4UkQjSctGHcwSoVlOKGe+Oo32g2dXE66Y229IuwnGA1AoFQsAzHqYC+Kz8vpR41o91ql+
	cUjKXuiNRegkq692+NerZpjDMCe8DRE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-EIxsqfD4MQaK7YRA0bjwzA-1; Mon, 20 Oct 2025 02:08:28 -0400
X-MC-Unique: EIxsqfD4MQaK7YRA0bjwzA-1
X-Mimecast-MFC-AGG-ID: EIxsqfD4MQaK7YRA0bjwzA_1760940507
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46b303f6c9cso48436555e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Oct 2025 23:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760940507; x=1761545307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQuFbzbaUqQeXmCypjw3/sdi/09uNDRdkvz6dGUNKB0=;
        b=IlR1HmPFVYcTZPaqq15Us4S85ipMh4AQ5LAmTnQVA4e1ont/f4HrgH+KIU0sU1vYKC
         4Ca8FOay3VCmmdlHY/4CeT1IAzCAyPbaraDVA416ez8gzgyLBCBpAxxgPcocC8sasadj
         G/G1OPOA8w/F6eP00RW/Oq4Bz2L7MQkrvIMykV61P0YpKyUbkilrI8gM4rvt3aiSGscn
         WFlw40PNMZB5UeQbSJmnX6SAiDOy/tMUoiYMnbkQUO81qpc1Eg/mf7ZYviNwpLZuMJ3V
         HHsOvJskybU50VPGh6+9t2AqM5Gic5tal1CR6fIJCDWx7mlRC72BznO//uuLh/bfHtQR
         qUtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUZJvRGlQpiwrWZuhalKMweGjgA5f/lU7pwFQ6ej4Ag3NZQkcGhXrCMNkaLeAj3swHVOceg/epn7LZh/0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywp4X7aIlwtE7ekQzMpuaXua9dolds4CtfGAPz2KLObagfBNqdM
	pxkxudP/L7g6gSnV93GGdvJBvwqTKOi79VeowKVThchC63apTaAhk1LOGS81mO46IEBjP0T4Jtp
	ftPlTiwwXuUTFEC2+oExwO7ZlAgI2A29ZceEZN8Dkw+n0T5uEZWLV74yS1hRJlLFm3yk=
X-Gm-Gg: ASbGnctmwxuF4nrH4ir5Bie+YCP1WvmXIkT5FpBhq7QLIFu3eyZ1OF8r3ZTYL7ah+oX
	AIL21j+gw+BS25RmneQIPVw5IaqPspFj1Uv3gXiYh2pKfFGjlUoIni8VqLWs8/354vGXOSiOjcY
	8+4tK0bMw8ZO0I6H0txKiPRqRe2KKZqpP8L91ClMwu6RmCDJwn825dc36+DeYgCim3/L3haN8G7
	NEnaJvOTAKVfSi/02FuWNjgD8xOsLNizLr4Dh1D7TsNKqjfgSesa/48hmJBJ5yFk21RG7dCNV8c
	okRU7wjqg2wd4lgz0tXdJANttW4oIZvm5AH+9xWG0offu0ooaSsEDCbaW9PJ5rY9cvluXRVVE3b
	DQpdbO3exC4UBjChvMPDbvkyOYNrx1/M=
X-Received: by 2002:a05:600c:1e1f:b0:46f:b42e:e38d with SMTP id 5b1f17b1804b1-4711792a2admr85862415e9.40.1760940506878;
        Sun, 19 Oct 2025 23:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCfcVkBiu61OspSB+hr3+Eu+dpCS0oJKyzY5B2GW/2d+oKy9v8Txx/pdsyxDdViW8IOdN+1A==
X-Received: by 2002:a05:600c:1e1f:b0:46f:b42e:e38d with SMTP id 5b1f17b1804b1-4711792a2admr85862135e9.40.1760940506470;
        Sun, 19 Oct 2025 23:08:26 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.13.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b9fdfsm13385253f8f.40.2025.10.19.23.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:08:25 -0700 (PDT)
Date: Mon, 20 Oct 2025 08:08:23 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, peterz@infradead.org,
	mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	m.szyprowski@samsung.com, venkat88@linux.ibm.com,
	jstultz@google.com, d7271.choe@samsung.com,
	soohyuni.kim@samsung.com, bongkyu7.kim@samsung.com,
	jkkkkk.choi@samsung.com
Subject: Re: [PATCH] sched/deadline: stop dl_server before CPU goes offline
Message-ID: <aPXR1w8Sq-xiOu3K@jlelli-thinkpadt14gen4.remote.csb>
References: <20251009184727.673081-1-sshegde@linux.ibm.com>
 <aO4Tw1SzNpgWutK8@jlelli-thinkpadt14gen4.remote.csb>
 <CGME20251017055524epcas2p2b7cadb80f5d09c4003ccb66d4c39c9dc@epcas2p2.samsung.com>
 <aPHbXxJRUTdkBZVA@perf>
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
In-Reply-To: <aPHbXxJRUTdkBZVA@perf>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vW9s8z1PtiHPdNUhR_c4ZlKwesaWFuqEU-p6sLeMess_1760940507
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/10/25 15:01, Youngmin Nam wrote:
> On Tue, Oct 14, 2025 at 11:11:31AM +0200, Juri Lelli wrote:
> > Hello,
> > 
> > On 10/10/25 00:17, Shrikanth Hegde wrote:
> > > From: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > 
> > > IBM CI tool reported kernel warning[1] when running a CPU removal
> > > operation through drmgr[2]. i.e "drmgr -c cpu -r -q 1"
> > > 
> > > WARNING: CPU: 0 PID: 0 at kernel/sched/cpudeadline.c:219 cpudl_set+0x58/0x170
> > > NIP [c0000000002b6ed8] cpudl_set+0x58/0x170
> > > LR [c0000000002b7cb8] dl_server_timer+0x168/0x2a0
> > > Call Trace:
> > > [c000000002c2f8c0] init_stack+0x78c0/0x8000 (unreliable)
> > > [c0000000002b7cb8] dl_server_timer+0x168/0x2a0
> > > [c00000000034df84] __hrtimer_run_queues+0x1a4/0x390
> > > [c00000000034f624] hrtimer_interrupt+0x124/0x300
> > > [c00000000002a230] timer_interrupt+0x140/0x320
> > > 
> > > Git bisects to: commit 4ae8d9aa9f9d ("sched/deadline: Fix dl_server getting stuck")
> > > 
> > > This happens since: 
> > > - dl_server hrtimer gets enqueued close to cpu offline, when 
> > >   kthread_park enqueues a fair task.
> > > - CPU goes offline and drmgr removes it from cpu_present_mask.
> > > - hrtimer fires and warning is hit.
> > > 
> > > Fix it by stopping the dl_server before CPU is marked dead.
> > > 
> > > [1]: https://lore.kernel.org/all/8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com/
> > > [2]: https://github.com/ibm-power-utilities/powerpc-utils/tree/next/src/drmgr
> > > 
> > > [sshegde: wrote the changelog and tested it]
> > > Fixes: 4ae8d9aa9f9d ("sched/deadline: Fix dl_server getting stuck")
> > > Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > > Closes: https://lore.kernel.org/all/8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > 
> > Looks good to me.
> > 
> > Acked-by: Juri Lelli <juri.lelli@redhat.com>
> > 
> > Thanks!
> > Juri
> > 
> 
> Hi All,
> 
> Could we expect this patch to address the following issue as well?
> 
> https://lore.kernel.org/all/aMKTHKfegBk4DgjA@jlelli-thinkpadt14gen4.remote.csb/

I don't think I see a direct connection with it.

Thanks,
Juri


