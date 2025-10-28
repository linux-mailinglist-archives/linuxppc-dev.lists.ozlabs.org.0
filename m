Return-Path: <linuxppc-dev+bounces-13433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 879BCC14521
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 12:18:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwnth0pP0z3dW6;
	Tue, 28 Oct 2025 22:18:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761650315;
	cv=none; b=hnsGOEuN1zWRc8we+qZA/bTbXHzkRFRVGKWDwyJaWCfG2CHkNuCooTb9cQ32peDVIElTKHO31GE9dYSXyTVu+W8ZRRmuaZ1ASDGAmnymD1zTAaNJKx0m6/AZsmYydxm5ScrHxVshufRin59Uec5jYHh+0SuTsX12R9othkgP0xJNc2kDPG24yZCcpWuVFy7GhD/EFPz4ZCWq+i2bc93X+iDxM02/H+Qfq/tzlyXkQ7KEatX1529vT9I5pOc+940ZviKZsZO5gq6BeTW28Ful/sJaDmtvPZUcYGSfJx9QQuiVYlF2WOxPdrFJPe+q7NPv/5bHZA4Z9ZfrMGRrFb+3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761650315; c=relaxed/relaxed;
	bh=vSp+YiyfoR78QY2XyJUcfKupefIxdmPNK1VTkoa8Zdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2zIqYEy80aTwoKwUcL44igg5XscYC9uWKw2V4rRBmSSwi+LnBe5WrxmNyRrvGemVEZBXv2jLWPE+vm46TVz525ZtjOA5KBW/RGSk+jS6HYdT+GhzkHOKDQLvpZM6bkAx/9ufQGHPPCksbl1B/hpDzoi/6rzksEQT0t2zU7tKo67UBkpgLqOSzSRnDVTkwb40yHEF6qIoMSn2qeZSMgFPtCMB4aWicx0urOSfB1Jd332WBJh+TVr/9ngGAQvoI8tjYHh7BVvWInp2eI20MipH0hLKx+XToczcLH3+YhX1hjfUlqW2nv5U340dgMGgRhGMbZ6Udq/fOHjgNhYIiEnQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwntW6xjbz3dVX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 22:18:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vSp+YiyfoR78QY2XyJUcfKupefIxdmPNK1VTkoa8Zdg=; b=dbzwL+jCe+J1unmK9BbV0fKvjc
	UBfKAjh42+TTTgJmApwft5wjwpkdcxvxgNHLx9u7vasliZDZRLeEdioO988FYS5RliSvAKZE2hmsB
	eqPd9l/NL8XmImHq8QauCql7a00i9XXUYRZ+AbFmIwkPqnXWxCNwBtpmEbuFVZ4TVonM0lKemY3/E
	e75wk3VJVO1rYPpEQaClUn9M456SN/+D2MdfODVfgmrOZhU88vbcf5H8/5QLsjsLgK5P3eBCRIp+l
	M0Um2lKsyhJBy21rJVSLw8f3nfEjvjVTpEw4+q1vf/l0TIjCDMJ6mczQC1d1G1uwxZKaXP/RsqGdM
	0s5EtNEw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhiP-0000000CthW-0MPW;
	Tue, 28 Oct 2025 11:18:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3CF2C300323; Tue, 28 Oct 2025 12:18:13 +0100 (CET)
Date: Tue, 28 Oct 2025 12:18:13 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Ben Segall <bsegall@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Nicholas Piggin <npiggin@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH 1/2] sched: Feature to decide if steal should update CPU
 capacity
Message-ID: <20251028111813.GK3245006@noisy.programming.kicks-ass.net>
References: <20251028104255.1892485-1-srikar@linux.ibm.com>
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
In-Reply-To: <20251028104255.1892485-1-srikar@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 04:12:54PM +0530, Srikar Dronamraju wrote:
> At present, scheduler scales CPU capacity for fair tasks based on time
> spent on irq and steal time. If a CPU sees irq or steal time, its
> capacity for fair tasks decreases causing tasks to migrate to other CPU
> that are not affected by irq and steal time. All of this is gated by
> NONTASK_CAPACITY.
> 
> In virtualized setups, a CPU that reports steal time (time taken by the
> hypervisor) can cause tasks to migrate unnecessarily to sibling CPUs that
> appear to be less busy, only for the situation to reverse shortly.
> 
> To mitigate this ping-pong behaviour, this change introduces a new
> scheduler feature flag: ACCT_STEAL which will control whether steal time
> contributes to non-task capacity adjustments (used for fair scheduling).

Please don't use sched_feat like this. If this is something that wants
to be set by architectures move it to a normal static_branch (like eg.
sched_energy_present, sched_asymc_cpucapacity, sched_cluster_active,
sched_smt_present, sched_numa_balancing etc.).

