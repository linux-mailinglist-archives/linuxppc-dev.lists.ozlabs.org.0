Return-Path: <linuxppc-dev+bounces-16072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id olD1ARqob2kZEwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 17:06:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC465470FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 17:06:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwV7D1FyXz3c5f;
	Wed, 21 Jan 2026 01:28:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768919320;
	cv=none; b=V6KxOIVB/+mXa6sebxhGdNQeOJOyDIJEy7QZiJGV5wIS4BXJC72LP969ZkaLV7GdKbtaaEg/CRp/T4XKL3U0PIFsmOMrALtyTIHZuQtU5aw5VzWU3U+qfSNB7jETTAJZAKAKhNsxqePdi39Lr8W1NR+LfuOkHGD/0zc+JwU8UuYg6EppfHyF91AJRuRL7xutC7fh7Bx1IqMlyGJUUymS7LIK8hYg/+cKFe9/UOVc3XNW/CXCnvLfo+yRW2P1iCKblhmNlG/5JOkDxZVCXUuT+OMz2OkPtIl8E4/Gf6rKaY9ixRIo+ChjgmKTeSGDlAQVaf9hHpZ2xznCt2/YAE3vKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768919320; c=relaxed/relaxed;
	bh=+Lguxp45Sf7JjnDUGuCBY/lTM/RSA32E8lpcuumw7Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChPAInhiiJtMAMz2s/rrIPORBi22SWjh7CNk5apK9PsFuv0nXz1uwVOs7MpN5YW5HdcKBZJVYjQZQaDWSKa936+D9wmA1Ns6M2D8IaftIEL1H0j11QXzyyEOj1gxkJAu+xBoN88WERShXJkuzfyJ/F7BH2X+1Z9/c/8zNEfLJkAfMKNwyyg4FNTO692Y0qVEXEiutomh4c07XI83ig7rnAgyh4rRVjusOgusTdvY0vSRGodPVcabpswZEOsEa1HJAhRK0bMjuaWOZhIsDvU37VXpfYG3FpBg1etOHsQHg+YGOmAdXbAm4az3mtx4esxUrfasKMocL//tLmMNq0e2RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fn4JA8d1; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fn4JA8d1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwV7B4F6pz3c55
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 01:28:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B97344024;
	Tue, 20 Jan 2026 14:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D304CC19423;
	Tue, 20 Jan 2026 14:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768919316;
	bh=OtwTnDpvDtbMBHvqPMZewcBZYEUS5NfRqaxfbB7joZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fn4JA8d1pUoK5IYDAD/REmgz3XFxvQ+4EMUiivOVIwX0mBUNuj1YudA6H2j/KP2js
	 1u7RZ3bveDlNfpGQfj5OGzCZJjpb35llivcWTSd1DS9XVszq78JeigVaaDJt30fVNe
	 m8EiHvICvqta/R6tBqkwUokrutW8CSVjFsCTw82ts94PN7Wb23kyOBNOizq+Fel7E3
	 RpxysRXLhJfosaVgI0e4cwNxSR+D+4cuGZXBmV9O3xQa+5Ik08YXEiNzb0UdVRDW//
	 xY4ofNxvVqahQAvNh0AywkWtlNbS4RWT6M+8pUp5n0ah3jDMHxD4+LYjUSU0SYsqyP
	 4vxzGPayTPZrQ==
Date: Tue, 20 Jan 2026 15:28:30 +0100
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
Message-ID: <aW-RDkr-KQ5pkFAX@localhost.localdomain>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-8-frederic@kernel.org>
 <CAJZ5v0hn81J_0N0Hy6QYtc3655w-9hDqVgWWY1BVhW=DT56Deg@mail.gmail.com>
 <aW6rAjJ5hz5BYuAR@pavilion.home>
 <CAJZ5v0gfT1A9OtEzeyp0MJ7JmrPJXF0PWL-8dSdtJXp4pAE8fA@mail.gmail.com>
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
In-Reply-To: <CAJZ5v0gfT1A9OtEzeyp0MJ7JmrPJXF0PWL-8dSdtJXp4pAE8fA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16072-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:maddy@linux.ibm.com,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,localhost.localdomain:mid]
X-Rspamd-Queue-Id: EC465470FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le Tue, Jan 20, 2026 at 01:32:50PM +0100, Rafael J. Wysocki a écrit :
> On Mon, Jan 19, 2026 at 11:07 PM Frederic Weisbecker
> <frederic@kernel.org> wrote:
> >
> > Le Mon, Jan 19, 2026 at 01:30:07PM +0100, Rafael J. Wysocki a écrit :
> > > On Fri, Jan 16, 2026 at 3:53 PM Frederic Weisbecker <frederic@kernel.org> wrote:
> > > >
> > > > cpufreq calls get_cpu_idle_time_us() just to know if idle cputime
> > > > accounting has a nanoseconds granularity.
> > > >
> > > > Use the appropriate indicator instead to make that deduction.
> > > >
> > > > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > >
> > > Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> > >
> > > or please let me know if you want me to take this patch.
> >
> > The patch is standalone but the rest of the patchset depends on it.
> > Now I don't target this patchset for v6.20-rc1.
> >
> > So if you manage to sneak this patch in for v6.20-rc1, it works because
> > I'll rebase on -rc1. Otherwise I'll need to keep it to avoid breaking
> > some code assumptions.
> >
> > What do you think?
> 
> It can go into -rc1.

Very nice, thanks for taking it!


-- 
Frederic Weisbecker
SUSE Labs

