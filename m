Return-Path: <linuxppc-dev+bounces-16111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEmOIQsFcWmgbAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 17:55:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD855A318
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 17:55:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dx9LH3Flgz2xrC;
	Thu, 22 Jan 2026 03:55:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769014535;
	cv=none; b=ndmJvpKGCRQ4d0b8Ymbre3U5bCpwiGh92RC2Ctc1MgOLHW6u7UvH9sRZTAMK92s1G/R48x7LPsqQ14VQOGkb9je6CqVgZdkVVSe1V1KRwShWNPWBYDs/vf/2R3UNz1pBjEF38Trq28e7FQqpNkogi9PJ/lr95XbHi+7BfXDORIkOSgjhsDWr9UdZl6da1plj0dR+loIsXmJu0UQXa3OpMKwoQGZ3ASDEqQXbqIWaliIN5ZBs9+kI3n+1f22qvkoj0ey7xcTip5BjWJcWN4ZTr5z1h8JeD1xUqRVyiQgA/3+ByvOBbxdo/Bj4MNkw4w/fLcrJUiG9gYPv/KgMAJyNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769014535; c=relaxed/relaxed;
	bh=bouEFs8AEKR3hpmuCbVACtSfuPWhxI+MJhmhnLd0A5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxfEWiMkPp2SbRffRnT/piCkROrAWErVpfffGHiaQA4ILfA3wxCDYy2q1DPvNPOOcfpfzKNixYnMMvzH77Z8+5qwzS5wwiO9Tsl6xsXb2USAxFGIPXAwaqBYt3izFHFGPqLNj1qZYHalrj/IxtYvYqhXz33dR/ebLLfg8rKl0tzPSPTcD94+ufkvrVl5t62SksTtoYywo0/P7b6rHZ3ewdgrwUIfK7g8LgaLLnfn3egMe6/7MfhiNxGl+T+k1CSkSfa5XJ4MNY9j2bNqS4qYghQ1o2NEsMhzJBkI4dqce0NtKBaeXSuTjACei9AINLs4EcYPyisU4zM1/Y+yQ6l8Rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i4zQlP9q; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i4zQlP9q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dx9LG3q7kz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 03:55:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54C7F60130;
	Wed, 21 Jan 2026 16:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F892C4CEF1;
	Wed, 21 Jan 2026 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769014531;
	bh=mxuQx8myh37sFEu9+vJLmpyCKKaNhjPDjdia8zaYzsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4zQlP9qJjB6AQvf49Y9Ufsh9lLsJ6bgZDrju7360I1I550ZnhpWAwEhlEoR9En0J
	 y6/+oLJdJnMdYltuM3MRou3lpBFM3dQjjN6PzEResWJIqV+XkmAk4eyCJq2+1ZLjyD
	 aQLh3joSmHc4hig6Ewwj3u3Tl6EQRXKppt8VR+cgGDTQdrlYJVRKNFZqvklqakPBWY
	 OWXFLzFKVuyDHwqGzad53oDQuURAzIfzlqt4EtTh8VHFtXd/0GY3pZh+ePdP1ub/q3
	 F4FRPA0IyGS9x8qxwRk/fYy0I+TKHGub9a3Sp7PBRLyZBWkY/dcH8M84Au0PkruVH+
	 OEqS1sr2cxlOg==
Date: Wed, 21 Jan 2026 17:55:27 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
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
Message-ID: <aXEE_5vT03dlTCyN@localhost.localdomain>
References: <20260116145208.87445-1-frederic@kernel.org>
 <aWpRxyt8HuXkSuxs@localhost.localdomain>
 <a4037857-b161-4536-9a2e-2cf4c168736d@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4037857-b161-4536-9a2e-2cf4c168736d@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16111-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:rafael@kernel.org,m:boqun.feng@gmail.com,m:tglx@linutronix.de,m:rostedt@goodmis.org,m:chleroy@kernel.org,m:kbingham@kernel.org,m:bsegall@google.com,m:mpe@ellerman.id.au,m:mingo@redhat.com,m:vincent.guittot@linaro.org,m:juri.lelli@redhat.com,m:neeraj.upadhyay@kernel.org,m:jackzxcui1989@163.com,m:maddy@linux.ibm.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:borntraeger@linux.ibm.com,m:jan.kiszka@siemens.com,m:linuxppc-dev@lists.ozlabs.org,m:paulmck@kernel.org,m:viresh.kumar@linaro.org,m:anna-maria@linutronix.de,m:urezki@gmail.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:linux-pm@vger.kernel.org,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gor@linux.ibm.com,m:joelagnelf@nvidia.com,m:npiggin@gmail.com,m:linux-s390@vger.kernel.org,m:peterz@infradead.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linutronix.de,goodmis.org,google.com,ellerman.id.au,redhat.com,linaro.org,163.com,linux.ibm.com,suse.de,siemens.com,lists.ozlabs.org,arm.com,nvidia.com,infradead.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 1FD855A318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le Tue, Jan 20, 2026 at 06:12:08PM +0530, Shrikanth Hegde a écrit :
> 
> Hi Frederic.
> 
> On 1/16/26 8:27 PM, Frederic Weisbecker wrote:
> > I forgot to mention I haven't yet tested CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
> > (s390 and powerpc).
> > 
> > Thanks.
> 
> 
> tl;dr
> 
> I ran this on powerNV(Non virtualized) with 144 CPUs with below config. (default ones)
> Patch *breaks* the cpu idle stats most of the time. idle values are wrong.

Right I somehow lost the TS_FLAG_INIDLE setting in tick_nohz_idle_enter(),
which ruins the whole thing.

You probably think I should have detected that with light testing and you're
right. Not checking dmesg was a bit sloppy from my end...

I'm fixing that and will send a v2 soonish.

Thanks a lot for testing!

-- 
Frederic Weisbecker
SUSE Labs

