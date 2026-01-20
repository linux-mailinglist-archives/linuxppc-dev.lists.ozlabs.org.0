Return-Path: <linuxppc-dev+bounces-16067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPufIkSpb2kZEwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 17:11:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A140147279
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 17:11:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwRYs6vZvz3bsC;
	Tue, 20 Jan 2026 23:33:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768912385;
	cv=none; b=UrlM/HRyhqY7b8uFcffrztdRmjU7dB5CbEdJ4VSu5MUypUnKkXWTGjPl1MleXuHt6Oo5+pH9TpAAuMNbY5ZPoKD6X2oDJgsOgZQuL4vhehs8AivKayKHnXgipx8N7S7fPs5dMxSMMCGF4liLH6FRfgXyhCWK11e2BdQWkPC0kfajd49+tkZXMyUVaFkijVZ4m+VnJ275Y2JfZo5nmPhCYF3BHjLTlv07uaiO12obdEJrTR7rAbB4OB5YwF71hEh7UqZ4XnvcgcjnVnPQz7hwNh1xY98/XD7Lrttw1E3Xqi0dzYkO0sRMaKY+K83V236yx9f7tu9yirTxVzO/MS4DvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768912385; c=relaxed/relaxed;
	bh=hKUek6FSuV0wPD4SWpvfkGywVOzCCmdIBKSJNwkt6Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQkH7mBYP+4eIqY6M02yquK5Zs5xMkqzaeIV0J41cdza1/qRq2kLjU8zCzDVUtqhym1BugFDotEZveIUVinkV4HbicxceQXP8OXThkSXNvUEATjmLjq02vDwpgmGR2Re9GRz9QNApw2nz3MLGW1oCn0KIgIj6QiNgY4dgJ1oa9U2xQb8y/7wSbm503NmuXLGYC18NLeX7m5ng8clUBgNoeLpJJv+gnFyBDGKAXBP3OzHlFyLYvuh1gktAATKQrzTItVkxmaiv5kypYPz+ic8Q0b2d/cWUEqVDDyliu7GYlWhruHLFlR+4uzDmYP6S/btE+/A3PNWBgOJyVRuHmOagQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YVWyH7Q4; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YVWyH7Q4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwRYr74xwz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 23:33:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6528F4435D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 12:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E41C2BCB4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912383;
	bh=hKUek6FSuV0wPD4SWpvfkGywVOzCCmdIBKSJNwkt6Dg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YVWyH7Q4TCe+TRUc/lOMLGuLkZu02SKSLwY1q4JletUR2PKc7/gFISQcU6prwzCFg
	 Ux5NYqe1XhID7Ekn0QJOfUK8edzBnXIYZk+7HNDbdGpjAZt3vZ9aXSaQ7gULvoTP8/
	 lBdRmkkhrV23eglu9nIQSheVyQJ5v1OsdXP3V/3sY7qrihV4MnCwYjiU94IXzwiMTb
	 Mw/XBK09AEhLTJIVaAZdeohQtWClQi/ZtTwfX5wI+HSOESDLL1yb5mz6qVsk3mBoWX
	 S21EtCbAHIIpi9SVxh637bT8kdnYK+SEUdxE4OrtPR8PBKqwHSsRqdSJgkVItVpOkN
	 eNE2dxA+q1twQ==
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-459fa8b6044so3271867b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 04:33:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVncq6kefktOQWaAq08FwqwJgUuXa1atBK5cEg7t2TXP6JF+eHwuabK+UyUHGYsaZSWq+NISBbJLUaHVcc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJn4jBQY+8k7aTD9+uYQhzGUQeuvLuVkQvJUVW1W/ZOmMXOAQj
	b66jZLMuqniM7MyrqN+URn7UjK48CnsLcslBqKRa8pmPuB59uELrFu/4HGTNwFJh5pEbWvanjHz
	v26e7jOG80FCPQxYI2F5sgQOOjU1o7NU=
X-Received: by 2002:a05:6808:448a:b0:45c:916b:ef9c with SMTP id
 5614622812f47-45c9d78a867mr5196389b6e.29.1768912382060; Tue, 20 Jan 2026
 04:33:02 -0800 (PST)
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
References: <20260116145208.87445-1-frederic@kernel.org> <20260116145208.87445-8-frederic@kernel.org>
 <CAJZ5v0hn81J_0N0Hy6QYtc3655w-9hDqVgWWY1BVhW=DT56Deg@mail.gmail.com> <aW6rAjJ5hz5BYuAR@pavilion.home>
In-Reply-To: <aW6rAjJ5hz5BYuAR@pavilion.home>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 20 Jan 2026 13:32:50 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gfT1A9OtEzeyp0MJ7JmrPJXF0PWL-8dSdtJXp4pAE8fA@mail.gmail.com>
X-Gm-Features: AZwV_QjyzkHKMnzUGE3i8rgFOfKwikMCgd-Rrc-fDFsp25Vo0PeauBuKiyLm8dA
Message-ID: <CAJZ5v0gfT1A9OtEzeyp0MJ7JmrPJXF0PWL-8dSdtJXp4pAE8fA@mail.gmail.com>
Subject: Re: [PATCH 07/15] cpufreq: ondemand: Simplify idle cputime
 granularity test
To: Frederic Weisbecker <frederic@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Ben Segall <bsegall@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Kieran Bingham <kbingham@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mel Gorman <mgorman@suse.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Valentin Schneider <vschneid@redhat.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Xin Zhao <jackzxcui1989@163.com>, 
	linux-pm@vger.kernel.org, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16067-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[rafael@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:frederic@kernel.org,m:rafael@kernel.org,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:maddy@linux.ibm.com,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A140147279
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 11:07=E2=80=AFPM Frederic Weisbecker
<frederic@kernel.org> wrote:
>
> Le Mon, Jan 19, 2026 at 01:30:07PM +0100, Rafael J. Wysocki a =C3=A9crit =
:
> > On Fri, Jan 16, 2026 at 3:53=E2=80=AFPM Frederic Weisbecker <frederic@k=
ernel.org> wrote:
> > >
> > > cpufreq calls get_cpu_idle_time_us() just to know if idle cputime
> > > accounting has a nanoseconds granularity.
> > >
> > > Use the appropriate indicator instead to make that deduction.
> > >
> > > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> >
> > Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> >
> > or please let me know if you want me to take this patch.
>
> The patch is standalone but the rest of the patchset depends on it.
> Now I don't target this patchset for v6.20-rc1.
>
> So if you manage to sneak this patch in for v6.20-rc1, it works because
> I'll rebase on -rc1. Otherwise I'll need to keep it to avoid breaking
> some code assumptions.
>
> What do you think?

It can go into -rc1.

