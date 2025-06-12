Return-Path: <linuxppc-dev+bounces-9314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D27AD74E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 16:59:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ5KH6WWWz2ypV;
	Fri, 13 Jun 2025 00:59:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749740371;
	cv=none; b=iX8NaDtYC8gp2ApBGl6K7OJ7JaLokvjqjwEdVt5+wDF9mdbdpZU1a28JpXnGxRE3Kr0VqneTr4eHD2kWDjGanm0yIrikDX3svxYO7pKNUgJbjfsez1k1xLvWzS0nd1iUruvg1aDoQu516r8QZS2YdP9D6o5D0vyf6aXxXaylr1saC67jVu/u0+ydzFVgynKUxK9XrU+yW1rvk7JARdtRRZVCK3aVoNCbEE/LsaXrD5kAjIyV+dOwHWmOlOmNAiuoETiS1DSSHqf2IO2/yc3CAgmliHBRnYyq+B2hB34Ag3JPSBmtp36//8Ri2eEXAjCNt7JuYA0O7Ce/7VQrqxLn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749740371; c=relaxed/relaxed;
	bh=yEaGNWI2rSJQF/8W/X5KhusGYkw8ca9e0TxE+VPx5Kc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=noIFQ3xtJzNOthiKEvhtab5R5CMWiTb7Z8YSJBOqdnYXnuT1Y1yhLVQYn5z9gvfqNzHKyzeeHFR45hhSI/eG8gyriFdJ6FOWxM8zbiyADa/Hz4QIYcHtHibwDZHgSnc8K5lBBhIAgVBDV1Lq4M4IhLapqVZK7tzufcVTatI+pQPbV2ont9lTCDVlaeVyPTeeNkMHSFnL/Gzn0ijOaou7AsN5YLLwuUazWJYaOcglI2oCdKj/q5G95BRl9RDFhgYMK3fQ/mAetJWLcghc2AnvwXb66iWPq6f7lVcnLIi8Mplz1XRvim3fTknqVqEBPiEC92ltS/IUgdqTwhK3GwuRfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=216.40.44.10; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org) smtp.mailfrom=goodmis.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=goodmis.org (client-ip=216.40.44.10; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 403 seconds by postgrey-1.37 at boromir; Fri, 13 Jun 2025 00:59:30 AEST
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ5KG3T8Mz2ynh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 00:59:29 +1000 (AEST)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 967A0BF42D;
	Thu, 12 Jun 2025 14:52:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: nevets@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id A99CF20;
	Thu, 12 Jun 2025 14:52:32 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uPjJg-00000001lPb-1eeF;
	Thu, 12 Jun 2025 10:54:08 -0400
Message-ID: <20250612145408.246703478@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 12 Jun 2025 10:53:13 -0400
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
Subject: [PATCH 3/4] PM: tracing: Hide device_pm_callback events under PM_SLEEP
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
X-Rspamd-Queue-Id: A99CF20
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Stat-Signature: fpyn74mhzgi6edsr6q5dyg95485qe48o
X-Rspamd-Server: rspamout06
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19j43D1p8tely174eW3U7IK9BarJsJXwwI=
X-HE-Tag: 1749739952-946871
X-HE-Meta: U2FsdGVkX19Y+FZTAuN70shmtNMQh8PF2z5w7Al6e+s8ndEXUZ5waGRazYm5aCm2Wr9+0EzyzaKU8+39h43/bI6vwC1JF3awrJxUzixgqFB3CkY/vNKmEsPT/OV5hI4lu+/m0RfUj7nkgQJbHak4qGw+xUParAwYSnfDYmsnUA8nJAyD6BG+V0ytFtMXWmALmab5EFfBTUI5MdjZAAdTv/cWm6PKSm5M9NWf1SX25RHOP6PmO6myilu4l5HiqBpSf6h20aPkkJZ6xNU6nuhYc2en4NRWWwSTYaJqJxRD5a1I7uOniuYR3SvoNNigOYTMI1LKxCHOU2Q1hJiFGU31S+MkEnNyOtsQ3FRNqXap5c/U/vbNbY4d1XhRVHkiS/T/NNdisUq1KQZm54tC8qipcA==
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Steven Rostedt <rostedt@goodmis.org>

The events device_pm_callback_start and device_pm_callback_end events are
only called when CONFIG_PM_SLEEP is defined. As each event can take up to
5K regardless if they are used or not, it's best not to define them when
they are not used. Add #ifdef around these events when they are not used.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 include/trace/events/power.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index a10ad300d660..5b1df5e1e092 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -212,6 +212,7 @@ TRACE_EVENT(cpu_frequency_limits,
 		  (unsigned long)__entry->cpu_id)
 );
 
+#ifdef CONFIG_PM_SLEEP
 TRACE_EVENT(device_pm_callback_start,
 
 	TP_PROTO(struct device *dev, const char *pm_ops, int event),
@@ -260,6 +261,7 @@ TRACE_EVENT(device_pm_callback_end,
 	TP_printk("%s %s, err=%d",
 		__get_str(driver), __get_str(device), __entry->error)
 );
+#endif
 
 TRACE_EVENT(suspend_resume,
 
-- 
2.47.2



