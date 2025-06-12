Return-Path: <linuxppc-dev+bounces-9318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFD1AD750F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 17:02:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ5PF4gdqz308P;
	Fri, 13 Jun 2025 01:02:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749740577;
	cv=none; b=a59pG0nvBmKHzJ2Ms+1mDJCi9qAiHH5eag7x1sFNgn89yQ9B9VxKdG/f4GDnQNI0tlaP/GWItReD/fTLPoYTWHYD9zMZOmg2dv1lx5AsP4+FL1NeoyVLXcguRGZTeMuTFSBl+g97hWrHNLnfIo4w6Am2xzOG5e+an74iZsxWSfnq3uAxwdTTJuaAe89fjJ8+1Cifae6JyVglbdOKEefu38e4WxWUwmTU99FURCx2/zFQTwBaFXfUX469GbXJVZucOetdrIgs9dPUPs1YDAU/6zsUIVJFcnKWmOZZsA5KPTfyfpvT8zV4pU4XqWYRBTeMbWcMubtcTjqvn8u5Jg0BKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749740577; c=relaxed/relaxed;
	bh=POj3M3tQsEqauSipjh/cxJUXbUgjzhSRS7+96hiLwpU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=l3Jy1iNvdzuqGJCT0sWqGACZVbuqyt2a+8+iF6RAl15MGMedoOW9GVLBk8DfdKI6x6acCNnFbz01dFIxxdfbVVGhzzdh2RG/gyLo6w4GMdBpgFEhUzYq/C9UE70GBvD5VIVVDLjCcX4u/iGHEcG1H6XSb/60YsDmdwsGxVpfwdogP5mgshA5EQ0TVgtWex5vIdzdlStGesEnACExfluSakRUAaUATbnc6SifvNJd+OPtG10dH8jQHbTrlfBQ5qO+q6xteUIJ8zJq2I1bOKRU5a0R7yowuq46J51fwfSHTZ57ADKjDBLIwiT4edNDrEIaNDvlc7I19scL9rYHOrdYeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=216.40.44.16; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org) smtp.mailfrom=goodmis.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=goodmis.org (client-ip=216.40.44.16; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org)
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ5PD6n4xz307q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 01:02:56 +1000 (AEST)
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id B80275FBDE;
	Thu, 12 Jun 2025 14:52:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: nevets@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id D68DE20028;
	Thu, 12 Jun 2025 14:52:32 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uPjJg-00000001lQ5-2NL5;
	Thu, 12 Jun 2025 10:54:08 -0400
Message-ID: <20250612145408.415483176@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 12 Jun 2025 10:53:14 -0400
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
Subject: [PATCH 4/4] PM: tracing: Hide power_domain_target event under ARCH_OMAP2PLUS
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
X-Rspamd-Queue-Id: D68DE20028
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Stat-Signature: d779s6b79wo56idmtjbw44h7e3pmcfdt
X-Rspamd-Server: rspamout05
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+p9qLGefh3sHaR9HeWxLmuONQDxFeJOGA=
X-HE-Tag: 1749739952-78830
X-HE-Meta: U2FsdGVkX1+oktxM9QHJotdDuSoK5vAHsGppqxtCgNWEj1VK1VKxq7/y9psVHR+Bs2ogve3wyTswzYhgNOyT0RsushAuh86z1DNqREAWXAVYDIw2j/ZsYhMZLTVYjQ8tO3lOFw5W+hCQAnkWijSF0faDxdMJ9DJ6sGb8RQKmoR3SZNxnb7lAeFHLvABmw29eyA7HWOe3keGbV3AcW1SXcIb1HyTjyHcZ7NsmXrf4Kc7rI+8WmBBmycoB36t9bq5+LBgoUG3rcDrkB7/7MIJ6wtJaGJ+4hMxsfRR+6L3upigYysuBZt6mHOQGwhCgC8DnLSqMPjWh1mkigyDN9bMbVxUntrVmbY2x2r+jJZ9u3EJbauVyndWCWlvOSERxtbTuWU7ND/LoCS+VoL3L5cnl4w==
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Steven Rostedt <rostedt@goodmis.org>

The power_domain_target event event is only called when CONFIG_OMAP2PLUS
is defined. As each event can take up to 5K regardless if they are used or
not, it's best not to define them when they are not used. Add #ifdef
around these events when they are not used.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 include/trace/events/power.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index 5b1df5e1e092..82904291c2b8 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -319,6 +319,7 @@ DEFINE_EVENT(wakeup_source, wakeup_source_deactivate,
 	TP_ARGS(name, state)
 );
 
+#ifdef CONFIG_ARCH_OMAP2PLUS
 /*
  * The power domain events are used for power domains transitions
  */
@@ -350,6 +351,7 @@ DEFINE_EVENT(power_domain, power_domain_target,
 
 	TP_ARGS(name, state, cpu_id)
 );
+#endif
 
 /*
  * CPU latency QoS events used for global CPU latency QoS list updates
-- 
2.47.2



