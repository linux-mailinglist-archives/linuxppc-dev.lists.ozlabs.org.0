Return-Path: <linuxppc-dev+bounces-9317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 765C3AD74FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 17:00:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ5LT6s8zz30PF;
	Fri, 13 Jun 2025 01:00:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749740432;
	cv=none; b=Rpjul+KMY1S3ksxaLQezHvMMwT3AZ36i5KpLt1R9eWsQb5NGDYE3xWczHi1LkDFQOcVyZ3CJVblVoWssYivZGQqNeIec+2Tcs8zvnZIykD1QtMSCh6AKzEzbpwJZgwU2Nq892ywG/JrVd4ygygor1w0FZj68uCF1ihTDxgJoDWLRfD1h6yhsCO0CQMpwKvWt95gtSlq6/MY1tYUtjg8lkzXPhRmqFamWDmo/jTYnd7DTgNgWjC3vFeCrEZiRew7v0IefWpJOsCUDyqL/vosq3NfzKg3DosBUlruITlns+MI9mjUrMmErMLWpikGsKHLHnz+3nb+EQERF4UmM+WvKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749740432; c=relaxed/relaxed;
	bh=F9sRKXE1KUFxcehCmonKOWhwUE856R+2WJ5NRNRx5JA=;
	h=Message-ID:Date:From:To:Cc:Subject; b=R1M+69Xcp8vXnVyR0/JxYlnU+PVc2fxY4qEiyMduMrYqpoz+A8CebZYpmbhA0FrPan/8EaMMj1nSaMndlMzFsdsF4NlR5/XZovf0hKlFfl1ubwmCn8neoysx8PFxxDR5yKoKtm6aiaJhYjKoYadSijY4/VkvHBobcvC/3TcQtnVKGZDy3k/f+FcKp02+QpnUVdcqgzVvJ/0CB2HpDFSh+DFkylKdMRH88T2R4pHmoaAtMwFd12pGtwKu8Q3rqNMa2233+XZ6VIpzWHlAcRrcEWN4TTKI6HHfHLz6e0BJRTOhp5wMLsSZZiokoyf+QxY16StBZzmJEJRJSCk/+xfH0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=216.40.44.11; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org) smtp.mailfrom=goodmis.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=goodmis.org (client-ip=216.40.44.11; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org)
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ5LR750Gz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 01:00:31 +1000 (AEST)
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 14D5E16172E;
	Thu, 12 Jun 2025 14:52:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: nevets@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 50B2120027;
	Thu, 12 Jun 2025 14:52:32 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uPjJf-00000001lO7-3fv0;
	Thu, 12 Jun 2025 10:54:07 -0400
Message-ID: <20250612145310.563358597@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 12 Jun 2025 10:53:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/4] PM: tracing: Don't compile in unused trace events
X-Rspamd-Queue-Id: 50B2120027
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Stat-Signature: 671yypn3d1k3f91qa3qgzfbjcctxm555
X-Rspamd-Server: rspamout07
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+HKFgC2IAPMdV6bVqFLIbbF0jglEfehXs=
X-HE-Tag: 1749739952-202480
X-HE-Meta: U2FsdGVkX18Zx3d1zrK96W9dRamojZiOj5sofUya+o14Daoe7ojSHmOmb2s5GCt5YqPHpM1G8bLnUG/WIUTBXwRBtJwYtlfgrxTX17b23DSwS0eZSUvTQkJFnB1mcwNkl+rR+yNlKs3HsGqZZZ/lU0baogzv2nP/UhAXHDG1oSB1QhuzC4BYT4Fr94+ZQJSMoxez9+vSEX6GDuWdy6ulboooEBha/F2H9AGjz8NDn6k4bqAf61sU3pb9w5KRCdc/TsCnaSiurMzym7k84yRzZW3IhWukYIFB5JY/R4GhyA8=
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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


I have code that makes unsued events trigger a warning. I'm currently cleaning
up the kernel to remove the majority of events that are defined but not used.
When an event is defined, it can take up to 5K of text and meta data per
event. An event should not be created if it is not being used.

The powernv_throttle event is only used by the powernv code so I moved it to
its own header file and it gets created when the powernv code is compiled in.

For the other power events, I just added #ifdef around them with the configs
that enable them.

Steven Rostedt (4):
      PM: cpufreq: powernv/tracing: Move powernv_throttle trace event
      PM: tracing: Hide psci_domain_idle events under ARM_PSCI_CPUIDLE
      PM: tracing: Hide device_pm_callback events under PM_SLEEP
      PM: tracing: Hide power_domain_target event under ARCH_OMAP2PLUS

----
 drivers/cpufreq/Makefile          |  1 +
 drivers/cpufreq/powernv-cpufreq.c |  4 +++-
 drivers/cpufreq/powernv-trace.h   | 44 +++++++++++++++++++++++++++++++++++++++
 include/trace/events/power.h      | 28 ++++++-------------------
 kernel/trace/power-traces.c       |  1 -
 5 files changed, 54 insertions(+), 24 deletions(-)
 create mode 100644 drivers/cpufreq/powernv-trace.h

