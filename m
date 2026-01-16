Return-Path: <linuxppc-dev+bounces-15912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 199AED32F45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 15:57:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt2y54ZTLz2ySb;
	Sat, 17 Jan 2026 01:57:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575437;
	cv=none; b=FmPRSRBemuS0W1O49qi9hZ+mdAwD9ECSsyM43PuWItHF8EiyCgabx9kbpKA+U1vL4YLTKwZ1M56PTbU2DfeM5gB4p93J12DpIQkkuaDs3NFOgMSbxpfSpWGZvV2oQZA/1gaFYdr83CAgE5FQVWHH3Bj+IWt1lhc6QPoLGRlIRn9AH1izU4umqpr17KBu0b8HXB1YkQ0fpnO/OainK3+z886VGv/NDL+IC2+BYo00F4vLQ51QIdmkr2jmcGgG8NTdJG3lP7mtbdD1SLHOU2JWmfnSMn5Y1bPuRKAwNOO0br+h6RR8DWce4c/YGgswcpMexeoecnGxDt2YnBvdx9LvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575437; c=relaxed/relaxed;
	bh=MaxWatC6BXDD9MxNLBGBdUdv+FaJKviCzEvHGFX/ndU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPcUwyEXu8uWh51hJ1MB1aY1i0kUkEx7+kxrd4rv3WD5k2W+nPYRsIOm3eBniygzXgLKhDMqtfdwGDC20w4IdsDbm5Zf8xzJ7GsJv9vFHbhdcCSaMZbTBWhMqVLM+y2R1Why1ATvkz+0vEmpZncXKF1NBeDbL1fd1UH9+RbnDgAkVxFHQgiUHew9mKwIGsLmuJVq+y8TD/OcmHxAYtfam/5srL1wYBdhKoKfPaRe4pP1066E8b28tEgYUy4j3ZxEWYC8QBGn/JRlwZBFfNTAhTZTUNhFkhbGDY/zsmCCIrQH4mgLBzYZmO/SX9UeFwunfxadsW6p/bFSdtLndOwHqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i1RwDlWF; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i1RwDlWF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt2y44xRlz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 01:57:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD11143E19;
	Fri, 16 Jan 2026 14:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23473C116C6;
	Fri, 16 Jan 2026 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575434;
	bh=MaxWatC6BXDD9MxNLBGBdUdv+FaJKviCzEvHGFX/ndU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1RwDlWF4zmzyFZbSx5OidA/+WFRcuq22Me/qt7d0WzVBLoMhOI0t+l6v0daYAatm
	 953IxDldYcPn7EkgpHIDFA7QU0DlFZqoyuTDFzwqqTZO7oGf5g3UOjc684CSh6cLkM
	 pk3Iy2EQx7aOjiXCS9sKoO+Tn0LnZzKJJnfKRyUl6qDhwoxJfNxNIDKkWELwamyqOB
	 CDY5kLMmbmGp2XbeQWlj7Mvwhp8JSjZOlwE0uRPq7pFkQz2NVGVSgiD0cVvBUu8+VF
	 xXLXhxDgxWK/+c9YOxkbYJ9KoAp3rcXvzXLCZDRM4rzHixmMN+84JKTwAgr/ZMCIHA
	 Wqet92hhJ6A3w==
Date: Fri, 16 Jan 2026 15:57:11 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Kieran Bingham <kbingham@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Xin Zhao <jackzxcui1989@163.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Jan Kiszka <jan.kiszka@siemens.com>, linuxppc-dev@lists.ozlabs.org,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>, linux-pm@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Nicholas Piggin <npiggin@gmail.com>, linux-s390@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 00/15] tick/sched: Refactor idle cputime accounting
Message-ID: <aWpRxyt8HuXkSuxs@localhost.localdomain>
References: <20260116145208.87445-1-frederic@kernel.org>
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
In-Reply-To: <20260116145208.87445-1-frederic@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I forgot to mention I haven't yet tested CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
(s390 and powerpc).

Thanks.

