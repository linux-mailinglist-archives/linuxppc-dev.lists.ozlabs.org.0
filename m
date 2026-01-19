Return-Path: <linuxppc-dev+bounces-16019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E197D3BA73
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 23:07:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw4Lf4h6Jz2xs1;
	Tue, 20 Jan 2026 09:07:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768860426;
	cv=none; b=OfK3TGcYrfe/FSIynGwYeodE2cEbtSAZWnIkjkdeO11ZhZvmzzaOz2oe2+NZfdv3A2Rx+O/HDEmNxVeoKNG4Xmy+/AL+cnRK71TUMX9FyRfy4urkzqivz+y7KkbptbuSVcLV2QSKUetFsBx8eMYPt3iOSinh3z2zg6+WInuRXAF6LKYeYewUPQ/zgP2GqYImWmekhUV2+GfzCGZwwAxSwKwFoJKrCeSU8PHLEXj4wqOCm14/bN6uSGvjPCmJNjM+8WghmZBdTjp8d0X/Pecj0ti1eQRBdrHGE77RwWtmeHWUAEer3/C4wkjEFsFpmFrpBIRBDXmoBDm/BsBAihr34w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768860426; c=relaxed/relaxed;
	bh=OfRXsePqJbsMYrcGxnajqF7i2ou0jO0y7bsapSQSC4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJGpQx7Qfrbc8mIq/oLv4GNTbZ+9vZZOpgcrFU8fM+gcgI2z13K34pxYopbUqfiez0W+su5vgZGzmg6NdOAgLLmWu0rNEQ3DpgYlOS4eTkQ0vSt14IfkUAYjoceGkBx8fKPNNMzq2kNYk5fIwRoJDLJp26qcP3eNLqi8dpUVTGAGLIrhYkGg/G9jWAxNtrDuaeclQTXA/xlIp3UT5PsJyJ00Brog+qrxCXeUkaz23D+iNrwly5pIZFEI3qxY3E5FCpbh+2YIVkCrno9N3ssTtccIIwAtgrOkPTXyoFaywvk9oc/rwu8JA9Z8mSdPdDMT+/SBtjddDIBiUna7qCL9tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cver8y8O; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cver8y8O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw4Lf07G8z2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 09:07:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9381043C79;
	Mon, 19 Jan 2026 22:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0330C19422;
	Mon, 19 Jan 2026 22:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768860421;
	bh=Nafb/OJ7lFPcWlC17ZXYnF4HcJUl+iFGvBaNeELuzy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cver8y8Oyj9J+Gx5rk8ecwY3aCbD1IfmObkpHKHd+ntNdp7WSN9l5Fvo128YUVZEo
	 dxmLHFXQSiZKeXmFPZYll3bz9QdryagTWut5BsZ2Ma/STcC4BRZjBg+qMk53k/oHJ8
	 ftMwZsIWBuhQ0JJD75ooZrtPxA+VqMuce12YEC6TwkjAXwEQ+9B9wuYwk4xj5vjpZc
	 9g5lY5aZi3XhMHDGsOLxeBb+Cbg/kCrdS/WtWzBrdbxEfpMhdqatlsUe2NnklsTgr/
	 nyG1GNOcsHbzJWf7d75pxNpQcwvjrGzQgRBlQ5iWlCFvqRDIkb9+XC1nol0jsHMkMB
	 6Eduzn7yGQo+g==
Date: Mon, 19 Jan 2026 23:06:58 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ben Segall <bsegall@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Xin Zhao <jackzxcui1989@163.com>, linux-pm@vger.kernel.org,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 07/15] cpufreq: ondemand: Simplify idle cputime
 granularity test
Message-ID: <aW6rAjJ5hz5BYuAR@pavilion.home>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-8-frederic@kernel.org>
 <CAJZ5v0hn81J_0N0Hy6QYtc3655w-9hDqVgWWY1BVhW=DT56Deg@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0hn81J_0N0Hy6QYtc3655w-9hDqVgWWY1BVhW=DT56Deg@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Le Mon, Jan 19, 2026 at 01:30:07PM +0100, Rafael J. Wysocki a écrit :
> On Fri, Jan 16, 2026 at 3:53 PM Frederic Weisbecker <frederic@kernel.org> wrote:
> >
> > cpufreq calls get_cpu_idle_time_us() just to know if idle cputime
> > accounting has a nanoseconds granularity.
> >
> > Use the appropriate indicator instead to make that deduction.
> >
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> 
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> 
> or please let me know if you want me to take this patch.

The patch is standalone but the rest of the patchset depends on it.
Now I don't target this patchset for v6.20-rc1.

So if you manage to sneak this patch in for v6.20-rc1, it works because
I'll rebase on -rc1. Otherwise I'll need to keep it to avoid breaking
some code assumptions.

What do you think?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

