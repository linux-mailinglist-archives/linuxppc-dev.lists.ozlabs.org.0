Return-Path: <linuxppc-dev+bounces-5627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C48A20C85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:04:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj7pq3dNYz3039;
	Wed, 29 Jan 2025 02:04:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738076643;
	cv=none; b=lJU4zvmOVeqVYqa3xTY4TJD94V3vgAqkuFVsQKO5WOmo+HP5O0uaM1gnAejcFKW3jeDt4t+FLIsLs6CY6Bml9W7nLiYvB7GNKvxMHKUeCeF8kJ8sZQe/7SQW0bRDe3P/VXfbD+Uvl4JbmjtGS/SaHmi7PAgoBe5XMlqpM8Le93hxNL8JZImFS4WoCNmJRhO/0KRY28/gpcpQyYwBSPGSotGfDySo0GmJn+FnC7Fg7RQ+g76lQrcQZ1EzUJI1jAw0OTE6kC+CNElw3xsdHddacbed/lUjjrvQ1d64aw2m/OtTj9KjCXwtiWBPiP0KZiynpd5lthsjKjy1udgYtVnfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738076643; c=relaxed/relaxed;
	bh=3S1HoP4BKSfZ3ZmfcTThyau/NhkRMaBq/G/RNNc3iuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OzmiN+r2KyFCxQLk+u7cpbWzmY6+rkuEaCX98nw9Ljp3s88Icwql/jO+h/F55Lv7Z9hNT2rvbqxlWqBB+7bmih8YXBJOGO8VbAQ7UOE2cU9odSXbOBs0KQuqOrQ3IiJ1r3doVDhclxkADJFMWB9+LpfNjp+zeT2IS+dHeVbl0BD//w/Ds+0bUy9uOMkrLfUFbvF182IpUFpbEsgb5liOpimodgH4R1u5vnr3kkbr8doZstuUtxeCwwUplBucGFO4UB+pKN8Dj1MHu3WBHI6ILTTG1sjgarqZPP2Ak0sYRnRcthIqlisQuowf/Us2EQO41zzliGWdxxHkd+dLynybFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F1p1wxZT; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F1p1wxZT; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F1p1wxZT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F1p1wxZT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yj7pp4QFHz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:04:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=3S1HoP4BKSfZ3ZmfcTThyau/NhkRMaBq/G/RNNc3iuI=;
	b=F1p1wxZTdyG3XUn+UGKQRstRS2wIfIPIjjdqiLLujSDTL7X4QUNTOjSCvfAqsYPTbCiaXc
	7fRygpHaIYejhzq+xFarKwWBOpHTo23ZVzlhRdg26xu54H6kU403aOy7rEQEaaXbqhw2Kn
	pk/3IRawRIxqqq4PzwuH0p7ZTnCJKSg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=3S1HoP4BKSfZ3ZmfcTThyau/NhkRMaBq/G/RNNc3iuI=;
	b=F1p1wxZTdyG3XUn+UGKQRstRS2wIfIPIjjdqiLLujSDTL7X4QUNTOjSCvfAqsYPTbCiaXc
	7fRygpHaIYejhzq+xFarKwWBOpHTo23ZVzlhRdg26xu54H6kU403aOy7rEQEaaXbqhw2Kn
	pk/3IRawRIxqqq4PzwuH0p7ZTnCJKSg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612--w-z4kCvP0qbpID5ORpKUA-1; Tue,
 28 Jan 2025 10:03:52 -0500
X-MC-Unique: -w-z4kCvP0qbpID5ORpKUA-1
X-Mimecast-MFC-AGG-ID: -w-z4kCvP0qbpID5ORpKUA
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D6701955D81;
	Tue, 28 Jan 2025 15:03:46 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.70])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6BC9C1800344;
	Tue, 28 Jan 2025 15:03:41 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 28 Jan 2025 16:03:20 +0100 (CET)
Date: Tue, 28 Jan 2025 16:03:13 +0100
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
Subject: [PATCH v2 3/4] seccomp: remove the 'sd' argument from
 __secure_computing()
Message-ID: <20250128150313.GA15336@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

After the previous changes 'sd' is always NULL.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/powerpc/kernel/ptrace/ptrace.c |  2 +-
 include/linux/seccomp.h             |  6 +++---
 kernel/entry/common.c               |  2 +-
 kernel/seccomp.c                    | 12 +++++-------
 4 files changed, 10 insertions(+), 12 deletions(-)

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
index d55949071c30..9b959972bf4a 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -22,13 +22,13 @@
 #include <linux/atomic.h>
 #include <asm/seccomp.h>
 
-extern int __secure_computing(const struct seccomp_data *sd);
+extern int __secure_computing(void);
 
 #ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
 static inline int secure_computing(void)
 {
 	if (unlikely(test_syscall_work(SECCOMP)))
-		return  __secure_computing(NULL);
+		return  __secure_computing();
 	return 0;
 }
 #else
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
index 327b7b486f1c..281e853bae8c 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1060,10 +1060,9 @@ void secure_computing_strict(int this_syscall)
 	else
 		BUG();
 }
-int __secure_computing(const struct seccomp_data *sd)
+int __secure_computing(void)
 {
-	int this_syscall = sd ? sd->nr :
-		syscall_get_nr(current, current_pt_regs());
+	int this_syscall = syscall_get_nr(current, current_pt_regs());
 
 	secure_computing_strict(this_syscall);
 	return 0;
@@ -1353,7 +1352,7 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
 }
 #endif
 
-int __secure_computing(const struct seccomp_data *sd)
+int __secure_computing(void)
 {
 	int mode = current->seccomp.mode;
 	int this_syscall;
@@ -1362,15 +1361,14 @@ int __secure_computing(const struct seccomp_data *sd)
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


