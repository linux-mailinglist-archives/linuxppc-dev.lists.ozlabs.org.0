Return-Path: <linuxppc-dev+bounces-9316-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86461AD74F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 17:00:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ5Kv5ZZsz30MZ;
	Fri, 13 Jun 2025 01:00:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749740403;
	cv=none; b=UsRiBPbSOkJfBvpz98DRLL898e0yuYANDumYMDcDVBmiHynswnKzrW4fBnw5D/YPSdRBPd8CfWICtp+l9y03ddDDyZ769NHyZ2EpEZNuiilbxD2+Lc/aO4J0TJixyJhveEuRwwKEwZfm8YU8ajfFxEWdKfiK9HRtFsI9sUS9A16DFONdIIR8zPSH0cO++ydczBbONolp6saP+mh+/yKe+A9k2F71bNaMCyHJ6LxgiXU4fiSCc4MV5YpuruqhRXNpyr5/qBH1pRdC7xK21gL/5HGJEuehP1r2GsOlScjrKQZJfHQScamB5qYgYt/Gxr57Ut3GP9w8LydDKfgCyA/uGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749740403; c=relaxed/relaxed;
	bh=3Y/bPLNaomOhM8wNUdh03xFNmJypqwEIfChHmNFOT6c=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=kyVceYuaBWzHaqyyx130nRzT+P48CrkPVq+/Tn/TzOOJ9yW31zA1F3qKV/984CFIROEnGFP3kapRuhDizsuuR1PENUmU91qDoRwkloYnQYafKQfBc5bk+HkVpI5n9pI+4uQSo4LSWxF0+eH4xVoNRt8kjL8SpysMkO/uMC3nrCHxTsCuBjkgTSOBAzF+xtrSiU5CFJ2sJq+wacUzx+Fli8+tTd4Ubmwpx0WLxQcBaREaFGniRsKerrsjMacLR5s+duiLeuDAeE1Gsan+YUWn4zycTeS3rLEfaQ+yjdrMhd468avjmBxRZWaxGAk0329Ar2/KGJQrziJxYMx3q4Qcrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=216.40.44.13; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org) smtp.mailfrom=goodmis.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=goodmis.org (client-ip=216.40.44.13; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org)
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ5Kt409Nz309v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 01:00:02 +1000 (AEST)
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 7925A1D8149;
	Thu, 12 Jun 2025 14:52:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: nevets@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 926A542;
	Thu, 12 Jun 2025 14:52:32 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uPjJg-00000001lP7-0woS;
	Thu, 12 Jun 2025 10:54:08 -0400
Message-ID: <20250612145408.074769245@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 12 Jun 2025 10:53:12 -0400
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
Subject: [PATCH 2/4] PM: tracing: Hide psci_domain_idle events under ARM_PSCI_CPUIDLE
References: <20250612145310.563358597@goodmis.org>
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
Content-Type: text/plain; charset=UTF-8
X-Stat-Signature: t1gxukcmttsd57ypqjtoxhrrxmtqcbd4
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 926A542
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+DsACEpXW1Hxr3qrAKke4Xko/DKEfchDw=
X-HE-Tag: 1749739952-596550
X-HE-Meta: U2FsdGVkX1/IfiTNa6p40H7QmDBnX3sN/6qr5uRq/JvAr7V1bDaJdMzuHdv9rphnCS17FRaeM9YiG/hUMr8hC+mmUkKa0GYv6prfsggZcR30qEBOVcLhtOrcpWkG9Ke5VWnCKzJPAS+oVNTXZLKmnVNRgI8rHLYI+4BIgQ5P+8REpPm0IUyhvyqcvcR6ZrGJXdrvG26x+XwbyxFfx9pCY+/T72i8WHl5FLPqyaya7yCJu7mTuCI++6kdd2AdXw0heORM81ecFOTnPWDnlqGe5AJqYMSrMlgjV4UQkUVFoiPDyxArJdqWfPCA3AWG5OghmNV9H+jgpkjvSB7BKhddo4QqgJNLqXdaKjxk7wGsIF82E/1scem3bHrh9pxweG2gg0+cvTokxC3MRJ/u9tEdqw==
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Steven Rostedt <rostedt@goodmis.org>

The events psci_domain_idle_enter and psci_domain_idle_exit events are
only called when CONFIG_ARM_PSCI_CPUIDLE is defined. As each event can
take up to 5K (less for DEFINE_EVENT()) regardless if they are used or
not, it's best not to define them when they are not used. Add #ifdef
around these events when they are not used.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 include/trace/events/power.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index 913181cebfe9..a10ad300d660 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -62,6 +62,7 @@ TRACE_EVENT(cpu_idle_miss,
 		(unsigned long)__entry->state, (__entry->below)?"below":"above")
 );
 
+#ifdef CONFIG_ARM_PSCI_CPUIDLE
 DECLARE_EVENT_CLASS(psci_domain_idle,
 
 	TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
@@ -98,6 +99,7 @@ DEFINE_EVENT(psci_domain_idle, psci_domain_idle_exit,
 
 	TP_ARGS(cpu_id, state, s2idle)
 );
+#endif
 
 TRACE_EVENT(pstate_sample,
 
-- 
2.47.2



