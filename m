Return-Path: <linuxppc-dev+bounces-5397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2707DA16DAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 14:45:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcBS66PRYz3057;
	Tue, 21 Jan 2025 00:45:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737380742;
	cv=none; b=kuz7bhK7GIC6TH6+4IJ4ARHhaubGQfDVzMfphoaZDjKrCO7NILfakinhreZ5Yfg5bcvTPln6PVJw9Ub0r5KdWQZk/o4XZETrRapTzM7nRxN999/ykNa3EzglLFTctEeDGHs2eNGBAkpLjlU7R48txU4D6puIBc8wqyl9LChDB7s9tXbYLSkeXshKNQO3QEQfuySTsMgbWzLyYrkW2rq9pDCGiDpLChRVvM5KKthdqjBIh1z8fRXnaxbcLwvZKzZK8hdEgjoE5USXWJTpVNXMZq26WfmX+2rVRmXEy/0YHq24hn6+bROQhdi8voaRkTHK1IpfYDjJ3gd8OG6ktX0y0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737380742; c=relaxed/relaxed;
	bh=4C//X0F2/vhqGqdyq38DMAz6+5GP64mgpWSnuLbKggM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hy60xB2RHH9nlfKyNTdjU0aW3jemqrdCzPWW+t4IecVMgLXhOfdTT1OLaO5kmPUOBYTbrKQdr9FMTACYwIYa0rH7hLxqbLL1jqtQeftJtm+6tCzyCOkrdN1FOQzSro+DfMIk41uBTfdLFWP+q84nLiL+ID6tiRkFJbw0LxwQJ4quvZJ+OIrroJAds8l2/aHcqOjxTVytot9UWgIWew7xkS52twuS4Wyvyhk9ACprap6o29o4J0weaeKaO39rlU3ohT53o3bGYWA9N/pRJtZim/o6pHRwgss1qmRvwxtwxTrIVjgZL0yh1dMM/xJbpOU82suFVBqP2s/PeNqlyyLiGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aFuDtXk9; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L4UcYX8F; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aFuDtXk9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L4UcYX8F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcBS60GZXz304l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 00:45:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=4C//X0F2/vhqGqdyq38DMAz6+5GP64mgpWSnuLbKggM=;
	b=aFuDtXk9taUFfI1JbcBtpViSoFL/NsjzyTozdlDbNHZ2piJsYjxBrHzIXQqTe8a6bWaU94
	W2PNtyH9GxxtlrDN4A3z3UMz9jEsJlRV1oRvPBEja1v8B+snDBmgVlczdVKOqwMxl3ygCE
	OmeFt1G5cX4a2rc9DMpoyRP7m+NFVGE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=4C//X0F2/vhqGqdyq38DMAz6+5GP64mgpWSnuLbKggM=;
	b=L4UcYX8FlEEAXR/9ib2xyxRqnP/UJomwEqvdhnfUU3z0+Q0tIvPkcsz+d+XJQ4ZG/2ydZf
	88jWS2As4TArf3dY9aZ9PrFn96x6r+VZPowBE2wlx3ImrE4oxox2lDFvw6awUs4NleMASL
	4SCM6gE+VpH7wEWCmJDxIdPPbQJKLMo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-AFSzlNzjNsio8oNRgiUEaA-1; Mon,
 20 Jan 2025 08:45:32 -0500
X-MC-Unique: AFSzlNzjNsio8oNRgiUEaA-1
X-Mimecast-MFC-AGG-ID: AFSzlNzjNsio8oNRgiUEaA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E571419560B8;
	Mon, 20 Jan 2025 13:45:29 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.104])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id AD5A23003E7F;
	Mon, 20 Jan 2025 13:45:25 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 20 Jan 2025 14:45:04 +0100 (CET)
Date: Mon, 20 Jan 2025 14:44:59 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] seccomp: remove the 'sd' argument from
 __secure_computing()
Message-ID: <20250120134459.GA21284@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

After the previous changes 'sd' is always NULL.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/powerpc/kernel/ptrace/ptrace.c | 2 +-
 include/linux/seccomp.h             | 8 ++++----
 kernel/entry/common.c               | 2 +-
 kernel/seccomp.c                    | 7 +++----
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 727ed4a14545..c6997df63287 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -215,7 +215,7 @@ static int do_seccomp(struct pt_regs *regs)
 	 * have already loaded -ENOSYS into r3, or seccomp has put
 	 * something else in r3 (via SECCOMP_RET_ERRNO/TRACE).
 	 */
-	if (__secure_computing(NULL))
+	if (__secure_computing())
 		return -1;
 
 	/*
diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
index e01dfe57a884..6125baa96b76 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -23,16 +23,16 @@
 #include <asm/seccomp.h>
 
 #ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
-extern int __secure_computing(const struct seccomp_data *sd);
+extern int __secure_computing(void);
 static inline int secure_computing(void)
 {
 	if (unlikely(test_syscall_work(SECCOMP)))
-		return  __secure_computing(NULL);
+		return  __secure_computing();
 	return 0;
 }
 #else
 extern void secure_computing_strict(int this_syscall);
-static inline int __secure_computing(const struct seccomp_data *sd) { return 0; }
+static inline int __secure_computing(void) { return 0; }
 #endif
 
 extern long prctl_get_seccomp(void);
@@ -54,7 +54,7 @@ static inline int secure_computing(void) { return 0; }
 #else
 static inline void secure_computing_strict(int this_syscall) { return; }
 #endif
-static inline int __secure_computing(const struct seccomp_data *sd) { return 0; }
+static inline int __secure_computing(void) { return 0; }
 
 static inline long prctl_get_seccomp(void)
 {
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e33691d5adf7..20154572ede9 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -49,7 +49,7 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
 
 	/* Do seccomp after ptrace, to catch any tracer changes. */
 	if (work & SYSCALL_WORK_SECCOMP) {
-		ret = __secure_computing(NULL);
+		ret = __secure_computing();
 		if (ret == -1L)
 			return ret;
 	}
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 385d48293a5f..c29dfe82139e 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1347,7 +1347,7 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
 }
 #endif
 
-int __secure_computing(const struct seccomp_data *sd)
+int __secure_computing(void)
 {
 	int mode = current->seccomp.mode;
 	int this_syscall;
@@ -1356,15 +1356,14 @@ int __secure_computing(const struct seccomp_data *sd)
 	    unlikely(current->ptrace & PT_SUSPEND_SECCOMP))
 		return 0;
 
-	this_syscall = sd ? sd->nr :
-		syscall_get_nr(current, current_pt_regs());
+	this_syscall = syscall_get_nr(current, current_pt_regs());
 
 	switch (mode) {
 	case SECCOMP_MODE_STRICT:
 		__secure_computing_strict(this_syscall);  /* may call do_exit */
 		return 0;
 	case SECCOMP_MODE_FILTER:
-		return __seccomp_filter(this_syscall, sd, false);
+		return __seccomp_filter(this_syscall, NULL, false);
 	/* Surviving SECCOMP_RET_KILL_* must be proactively impossible. */
 	case SECCOMP_MODE_DEAD:
 		WARN_ON_ONCE(1);
-- 
2.25.1.362.g51ebf55


