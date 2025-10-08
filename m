Return-Path: <linuxppc-dev+bounces-12709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A479EBC4316
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 11:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chStk0hz3z3057;
	Wed,  8 Oct 2025 20:50:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759917053;
	cv=none; b=dxuWZ4YbGRGQiLB+ipuyG8g5ZGHEEsAoP+tJGKTzNzZoM+aN5wctYxWeUSzZ1O6OUsahIc4hd+wZCjU1AqEWIX30nvB54I0qOO5pmPhJTjkVodXgsDUb3/TLAnnFd+FqSLrs5I/SKJJxEw2hVINtF605ePYLe9XIJsMUlfqTYpPSB96rxSnJpwaSeRpZAfMdxOONIuQhiWQ5m3NvHFHajwJh6R0K2y8f0JT5xVDvMvbdes2MvGy2F3DxG1T8TfKO0avOjnVRxu1vXh8CULvOc4FbjGX0zhPwdEim9gL2X4Rb9wIhLieH4dkm6y1+u5eyBb+vzcXj+0oSyedpGpNFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759917053; c=relaxed/relaxed;
	bh=r11xdNoRZFdbSIutkJtNqLxC5mByf5evL0hzeiweqVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHh93m8moOtkKwU2GX6PB2g9I86xZTmd/j1oq2OQ7BLJh/bspHI35qjUAH8adUqtPqnmhzWkenHylTGVCZ83oUgF5PAC6qCi6HzeHeA5lUBwKFIjtXJJU0w/4bbzLefPBXRY7XIjUyde2IDzykfmihWbF/m8pvmlof7a/DXXxFxnwBIIhfbKBj0+B/nq2hP81Khi1J5JuDCSXvbWFyxk2usXowPKmfbz6PBtcWYFZ1I5pfUO5PRaNRmt9qea9RZK8o22t6UrNf5PKOxkGpqZlPXPdQ4PQJAgfe/fbXmsK6s8HqRWrD85SFofFI2N/NmAj+9ozqOcWsMdbkW73b1c3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mK3doMt2; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mK3doMt2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chStb5gRXz302l
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 20:50:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=r11xdNoRZFdbSIutkJtNqLxC5mByf5evL0hzeiweqVI=; b=mK3doMt25J0J6oXNI8JXX+ZTsw
	EjDr2Cmz4B2QCPIg5cM1NEg11KCvH1jeoENL8gk7Rw8PzMkxg1BgCCWMJ5Yd3vUZWljpg4OtJsBqL
	b6MiinzAMIs9HHl9kE4FpgQzk4tO2fNvoCrz79HDSzmGbqku1DMbq2yyqqronyKqq/C9qGedAcn58
	AhRtrKz8DJWqxR57fTDX5RfHah1WX/aqOV9G1P8LrG0vHbGrZev7Tx640+S1gHK5+mkEEY7RSYTRP
	FWXvL9XXXRosFV61UMjYs16I0aYXH4v+hvMJXuDTYSu46cTKCFqfQVVqO94T4uUe+uwqG2bQvZYeP
	KGcgg6CA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Qoh-00000002Slw-2sck;
	Wed, 08 Oct 2025 09:50:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D9C5A300220; Wed, 08 Oct 2025 11:50:39 +0200 (CEST)
Date: Wed, 8 Oct 2025 11:50:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, jstultz@google.com,
	stultz@google.com
Subject: Re: [bisected][mainline]Kernel warnings at
 kernel/sched/cpudeadline.c:219
Message-ID: <20251008095039.GG3245006@noisy.programming.kicks-ass.net>
References: <8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 08, 2025 at 07:41:10AM +0530, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> 
> IBM CI has reported a kernel warnings while running CPU hot plug operation
> on IBM Power9 system.
> 
> 
> Command to reproduce the issue:
> 
> drmgr -c cpu -r -q 1
> 
> 
> Git Bisect is pointing to below commit as the first bad commit.

Does something like this help?

(also, for future reference, please don't line wrap logs, it makes them
very hard to read)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 198d2dd45f59..65f37bfcd661 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8328,6 +8328,7 @@ static inline void sched_set_rq_offline(struct rq *rq, int cpu)
 		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
 		set_rq_offline(rq);
 	}
+	dl_server_stop(&rq->fair_server);
 	rq_unlock_irqrestore(rq, &rf);
 }
 

