Return-Path: <linuxppc-dev+bounces-5398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27B6A16DAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 14:45:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcBSC63GJz304l;
	Tue, 21 Jan 2025 00:45:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737380747;
	cv=none; b=eu0TsxpmtNCyqMV0aUzk1Sf4WrRqx5rYxpSumcx51C1JR7rdd37dmswB/VuXxXGjqVlrYW1CLp4lvI7ARxjiFx2J2+pm4VNes/pzC4Y+CwEw8IlGvcgmm+0R/YRSFwZ0qHtY3N2Pn9gPmyM5L8c4XuhvZGW+QaG4plVjwBK8nXundRkWQ20OzxZaKhnDTO2Jh5tTotLx00bSzCtr+TD6nSD/OR6goNsTqT7f1XtkGUUCvRNt1T/DlyQILTomQ/qyRdif1F+QYi5Re+j9gxASH/NrS9F0INjAQVb9rW0rLOvt/UNcMs92WyFo6+cxZ1ACfogqv24tIPPJuVWlbhI3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737380747; c=relaxed/relaxed;
	bh=vfOTmMY2VnDeaFEXs43JEC9lE4+T6jIeb61gvtSteOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jhd2aUY78kQoWm3ot+AsYkeGOQpm1KUucjYPeRNRf+xgIfJ2n3hSUC5EicXte5aUvp1DzDOvNO04+/OIBbleleXEjK1efOHWpWHGtF0VMWuBMHTlGWzqSsxbIxQZELZpkbHkI91LmqXhCbrnb0XT6LgEPW3QSX4fZAHK5IoDkyY0rdMDHv+18Ike73YEFND1qnCs40E1s9klWJ+rfivrCDYnlynHA/L1g+S7EqHUyuLknYX6jsKkRTvWbsaxBgrk192OPEqNJ37tF+eUuMNSFEpr66lsAWwKA/lL57p0ffFhPCOHFUW5EiedAeeMfSyL6Uf/oYVmWS7FCzWQMhH1ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ah/ESxlb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=frcv4X/u; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ah/ESxlb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=frcv4X/u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcBSB6rrQz307q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 00:45:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=vfOTmMY2VnDeaFEXs43JEC9lE4+T6jIeb61gvtSteOc=;
	b=Ah/ESxlblZqzGEwwRPOifmrnD59Gmwt3bDstaG2vtiRoYVFQPiBwWl3PR9uX8X1Y+8n0An
	kZsyAF7s/O6k8onIJfvI5ipmwa8dOzXqGGqP+ux0AYglATnLtycrStDU9vmU/1lAoAMg6p
	HEPyP7v21F+rqk0uYtK3fzbx9kunyqE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=vfOTmMY2VnDeaFEXs43JEC9lE4+T6jIeb61gvtSteOc=;
	b=frcv4X/uRDbhz5unS74OsgImT3UJZoYUtQrRWywnDqM2HNyU9RfVAAeQnf8r/UjHgDZoFv
	HCrSV4W4JP1o4uEnmvGjrvw73R3Juez7PjZ6ATO5sgZ5enwZAezLx8393bOEguC0GD4QpH
	UcRCszqwhrhE6dT/udY71I7cBdMo/qU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-fqR8ZUFLPRugcQokSWegpg-1; Mon,
 20 Jan 2025 08:45:38 -0500
X-MC-Unique: fqR8ZUFLPRugcQokSWegpg-1
X-Mimecast-MFC-AGG-ID: fqR8ZUFLPRugcQokSWegpg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 773751954196;
	Mon, 20 Jan 2025 13:45:36 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.104])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id EA41619560A3;
	Mon, 20 Jan 2025 13:45:31 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 20 Jan 2025 14:45:11 +0100 (CET)
Date: Mon, 20 Jan 2025 14:45:05 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] seccomp: remove the 'sd' argument from __seccomp_filter()
Message-ID: <20250120134505.GA21290@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120134409.GA21241@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

After the previous change 'sd' is always NULL.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/seccomp.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index c29dfe82139e..75e293d3c1a1 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1213,13 +1213,12 @@ static int seccomp_do_user_notification(int this_syscall,
 	return -1;
 }
 
-static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
-			    const bool recheck_after_trace)
+static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 {
 	u32 filter_ret, action;
+	struct seccomp_data sd;
 	struct seccomp_filter *match = NULL;
 	int data;
-	struct seccomp_data sd_local;
 
 	/*
 	 * Make sure that any changes to mode from another thread have
@@ -1227,12 +1226,9 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
 	 */
 	smp_rmb();
 
-	if (!sd) {
-		populate_seccomp_data(&sd_local);
-		sd = &sd_local;
-	}
+	populate_seccomp_data(&sd);
 
-	filter_ret = seccomp_run_filters(sd, &match);
+	filter_ret = seccomp_run_filters(&sd, &match);
 	data = filter_ret & SECCOMP_RET_DATA;
 	action = filter_ret & SECCOMP_RET_ACTION_FULL;
 
@@ -1290,13 +1286,13 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
 		 * a reload of all registers. This does not goto skip since
 		 * a skip would have already been reported.
 		 */
-		if (__seccomp_filter(this_syscall, NULL, true))
+		if (__seccomp_filter(this_syscall, true))
 			return -1;
 
 		return 0;
 
 	case SECCOMP_RET_USER_NOTIF:
-		if (seccomp_do_user_notification(this_syscall, match, sd))
+		if (seccomp_do_user_notification(this_syscall, match, &sd))
 			goto skip;
 
 		return 0;
@@ -1338,8 +1334,7 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
 	return -1;
 }
 #else
-static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
-			    const bool recheck_after_trace)
+static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 {
 	BUG();
 
@@ -1363,7 +1358,7 @@ int __secure_computing(void)
 		__secure_computing_strict(this_syscall);  /* may call do_exit */
 		return 0;
 	case SECCOMP_MODE_FILTER:
-		return __seccomp_filter(this_syscall, NULL, false);
+		return __seccomp_filter(this_syscall, false);
 	/* Surviving SECCOMP_RET_KILL_* must be proactively impossible. */
 	case SECCOMP_MODE_DEAD:
 		WARN_ON_ONCE(1);
-- 
2.25.1.362.g51ebf55


