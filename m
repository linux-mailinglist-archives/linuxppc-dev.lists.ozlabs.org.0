Return-Path: <linuxppc-dev+bounces-14653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A368BCA84FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 17:07:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNGVZ6yHyz2y7b;
	Sat, 06 Dec 2025 03:07:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764950854;
	cv=none; b=EKa5Ic2HJpGxatWdfCRKe+DPyWi1+QPsTYCNbYBeyBQs5nu89Cf9hw/v4v3l8W8zF1zgDpgaQIPCHY3Xy6eN3vN0VIMEuKP6c0BFD8hmQX17gzvRZhgxGkqdAAUlCVGVCCTvGZ8y85j6RduG5+47PLzw3oBLKTgsBvEt7aQVCCXi2cnNKgy8bURUvkcferqQVP6ExsHF2Gq/116OZ9ICSqBFPtvdENiswNxXBGAhmbf/WGM+/vAepIpQ3WJSb+Z/U9xLMctkSOIdlunJiKtFyUvps/U8+7Hwj6xlaGcfs/tovyWIj7XjJYsZQlKE4rQOLxhFcOs4BF0hdOyRRmFkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764950854; c=relaxed/relaxed;
	bh=ckQBtq+4Y7vdp+TM9yy2DQcYJ6E6z7FHH/8z11ZMWKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SINjb2RWXNv9SSvfLx93odPnBVCDTzLhOPcqq9RNzQpncx9OLVs3v0bHkb4t+aJ9Ysk2eV+Ipcb4MrL8wDqaO/lBpVyMi9C8FfTBJHre5wFcDoURY+LtbN3HEj6iF2e2habM2s4LB4aZ1CEUEw55/uc3M8FMSoktkWrNUhxSEdKt7+6Nh3sTRKZuGc1bdYNYRhhtoWkn+eNwTYOEbVuCZq+HrzusQY/C4wHOxGDXNJ0yx//ZJYh4YatpqPgUQ7oKzkMjY5W0sNoNMvBIewADgjQLSLKO9+QkuBsMbNBx6tzm6JjBdvKJYTQB4NBzpyTb0mZLjBv9577rpaBoyUh2Rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oZ/A7dKF; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oZ/A7dKF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNGVZ0y7wz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 03:07:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ckQBtq+4Y7vdp+TM9yy2DQcYJ6E6z7FHH/8z11ZMWKE=; b=oZ/A7dKFntf+0XHPiw4bQOKQCp
	ukDRjqI9iCRiV6BIFrOBiIXibk1yOtCfzEfsKxmKLRz0/aBv7RNJnbvASUF+JyeAzqAgp+60VwHAk
	9+qJWxLNsJCl9jaL+Ti25jPwQvnr5biHgTAb9mDJvjLBNW/3KcDaIM1VV5RrZr7znV1++/3M2jr0s
	j/+hhvWToyVNloYubOQbb46IckrqusIVVQPfZj2UUMUGJ1xZftHstw+op5W25ZpSLPh8HNVKsM/fm
	pR9nHEVh2+MtOJV9bJlaQ5ihkJCOxGyNPco7U7Vj3OWFruBfr748iYyveLdzyg5e4dhJ7wXqVtI4F
	eOkQ3HEQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYL5-00000005v8L-3UD5;
	Fri, 05 Dec 2025 16:07:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 626F4300499; Fri, 05 Dec 2025 17:07:23 +0100 (CET)
Date: Fri, 5 Dec 2025 17:07:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Ben Segall <bsegall@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	Thomas Huth <thuth@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	virtualization@lists.linux.dev,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 08/17] sched/core: Implement CPU soft offline/online
Message-ID: <20251205160723.GG2528459@noisy.programming.kicks-ass.net>
References: <20251204175405.1511340-1-srikar@linux.ibm.com>
 <20251204175405.1511340-9-srikar@linux.ibm.com>
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
In-Reply-To: <20251204175405.1511340-9-srikar@linux.ibm.com>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 04, 2025 at 11:23:56PM +0530, Srikar Dronamraju wrote:
> Scheduler already supports CPU online/offline. However for cases where
> scheduler has to offline a CPU temporarily, the online/offline cost is
> too high. Hence here is an attempt to come-up with soft-offline that
> almost looks similar to offline without actually having to do the
> full-offline. Since CPUs are not to be used temporarily for a short
> duration, they will continue to be part of the CPU topology.
> 
> In the soft-offline, CPU will be marked as inactive, i.e removed from
> the cpu_active_mask, CPUs capacity would be reduced and non-pinned tasks
> would be migrated out of the CPU's runqueue.
> 
> Similarly when onlined, CPU will be remarked as active, i.e. added to
> cpu_active_mask, CPUs capacity would be restored.
> 
> Soft-offline is almost similar as 1st step of offline except rebuilding
> the sched-domains. Since the other steps are not done including
> rebuilding the sched-domain, the overhead of soft-offline would be less
> compared to regular offline. A new cpumask is used to indicate
> soft-offline is in progress and hence skips rebuilding the
> sched-domains.

Note that your thing still very much includes the synchronize_rcu() that
a lot of the previous 'hotplug is too slow' crowd have complained about.

So I'm taking it that your steal time thing really isn't that 'fast'.

It might be good to mention the frequency at which you expect cores to
come and go with your setup.

