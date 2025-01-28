Return-Path: <linuxppc-dev+bounces-5628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB044A20C87
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:04:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj7pr2vDtz2yyx;
	Wed, 29 Jan 2025 02:04:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738076644;
	cv=none; b=EQ156d8lZs55otnVJ4KZ1eoHYMHjBl9GJQnVeo0IpMSv6V82MSoeYi9dWg04xCAYdYb3iRdw9hNtpDHpXoSkAilx7IPq/sJdLRNh5ZNPCkQMKXUAZeC057jKU8jYOj93A8fXm6mwaJpkFwyawBpOpJ46kZ/WAzlxZe/TMciBNHeHOIwodzblvCxAruTkCC7AbeV/+Eu6OWIbQjknUxWUmU1gDMYVlCKONyvU2WXUfXsXVg0qj0i6bUDL6+At0TBK8KVSSAK0vm7BhoB+HUrTWZ5e2dkzHDA+frznLjSsUxya2tA6F9RE0fDT73rHS1u6lI/uc1WGjsbA8gr8ZmYr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738076644; c=relaxed/relaxed;
	bh=btlJRCMVX8HM/vAtA+YB6/NvVfnBpTstgXDDGM8tc9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lBxAg1EWn8hn/UFhL4cdLRpI3Wnus2zth68bvH1/I9A2nx4vVkQJfSXkyJVANs+LNb7Cl0XmzeA8OxQ2b40nyZAtL2lXpKEUTACq4EXn+dq/mqBzJEXxqza59hdhwo4pifVUpF5NvPt02IN2B/Q0MbMaCVUFfRbIhDiNQ7K6HY6nc+XIluGkxKZOa8JEcDR9dV2O8JFgE8duPb1DipivP1u7uwhMOyYMbjDbVc7mkA1a3+UXRv1wmiRkpQpqFr3sjTlmH2AH4Vt8dAyqFYV/6N4VATtqgOKtRxk31r5hAkeRdjE+5hH2lrKtlfXwPamCOQxgwHyEaUj9HbJ4yHQ1BA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UXmSO96Q; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UXmSO96Q; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UXmSO96Q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UXmSO96Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yj7pq52pLz3041
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:04:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=btlJRCMVX8HM/vAtA+YB6/NvVfnBpTstgXDDGM8tc9Y=;
	b=UXmSO96Qe3PJBZHfxZLyjQbYRIWM8ys/Rzb9DEIyJA7vu5W5KW3FA3HULkClC4MnWODngs
	Yho+YSChXjd/iUSQCOXYdyeTXHFH88xwYKaLwK3gHMvPlNa+dDfA3MmJxw92xUmIN9g1gp
	330LI4sHcBZaMt0oaum31LI5MngOIXs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=btlJRCMVX8HM/vAtA+YB6/NvVfnBpTstgXDDGM8tc9Y=;
	b=UXmSO96Qe3PJBZHfxZLyjQbYRIWM8ys/Rzb9DEIyJA7vu5W5KW3FA3HULkClC4MnWODngs
	Yho+YSChXjd/iUSQCOXYdyeTXHFH88xwYKaLwK3gHMvPlNa+dDfA3MmJxw92xUmIN9g1gp
	330LI4sHcBZaMt0oaum31LI5MngOIXs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-508-Xwn-8PiVM3S48MNRmEK_wA-1; Tue,
 28 Jan 2025 10:03:55 -0500
X-MC-Unique: Xwn-8PiVM3S48MNRmEK_wA-1
X-Mimecast-MFC-AGG-ID: Xwn-8PiVM3S48MNRmEK_wA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 736EA1801F20;
	Tue, 28 Jan 2025 15:03:53 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.70])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 9380E195608E;
	Tue, 28 Jan 2025 15:03:48 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 28 Jan 2025 16:03:27 +0100 (CET)
Date: Tue, 28 Jan 2025 16:03:21 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] seccomp: remove the 'sd' argument from
 __seccomp_filter()
Message-ID: <20250128150321.GA15343@redhat.com>
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
In-Reply-To: <20250128150228.GA15298@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

After the previous change 'sd' is always NULL.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 kernel/seccomp.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 281e853bae8c..4bd2eb50f77b 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1218,13 +1218,12 @@ static int seccomp_do_user_notification(int this_syscall,
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
@@ -1232,12 +1231,9 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
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
 
@@ -1295,13 +1291,13 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
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
@@ -1343,8 +1339,7 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
 	return -1;
 }
 #else
-static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
-			    const bool recheck_after_trace)
+static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 {
 	BUG();
 
@@ -1368,7 +1363,7 @@ int __secure_computing(void)
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


