Return-Path: <linuxppc-dev+bounces-5626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AB3A20C83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:03:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj7pf6b5mz3024;
	Wed, 29 Jan 2025 02:03:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738076634;
	cv=none; b=cI6OC7SzKDYosIWDbnwpiXZhau7uzAezik12jASVqsVLsY/SOmH/dR8/Vmx7uAzddJP2uLbMcSlipljtZ7LnzS/Gp0abt3LhZOe35aZTdhSGan29bxH5jE437OS4XQk7PUTwM1ZTciUOqZzOjy4Fpf89dVg1n35NbxYrQauy7i83Pzbd6ZX5Hu1WpZI1GLj97OiPWmlIBQJjE3h+nLWC5bkS6Zi+AYNq1O3VpExAVLYNAteXm2ukWHVNCjjzhwPXAXSWUofj4QeAkiD6UmL7T8HBJ9sSnw9L02LdqWfp9plHX7EcNulc2gb5NdBaY8QjwVyuol3wdJqtd7UCVM+v7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738076634; c=relaxed/relaxed;
	bh=YgaHt1BjGG/a+d49/WKiHz6AgENMlYHggiszKNlUzeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZnkyqQKe2xiS9NsJKJppvufyoQ00YJ4v/btYszOvz7dBjL319R38Z1EscVZwBGM7cedwrH6RwCq0sl9MfG/AVRFvRBhgFb3T9hcz2yjX+eACZxGc3tilpHfd8C74/xpesbWlbPDIFLFpCzlJ/B4XqDhmCTs0onZNFhqMUN/2Al6jFr9CISlZNcChLq6SRsHbK8SnmBWnqb3DWxOmW1wDIrl+HF+yz/6Zeru4p1Z0RIYoK7qcl6oQjUszkyPKAZLXXtGyqSGZLjkQKtCIbA8vHjWVlClCUoiRLH/UtTuVqAzNGr92Zxxb51U2HMnocne4/BwuJPpdO1wizsaKtqK+CA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T0PL73gs; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T0PL73gs; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T0PL73gs;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T0PL73gs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yj7pd6TBbz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:03:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=YgaHt1BjGG/a+d49/WKiHz6AgENMlYHggiszKNlUzeU=;
	b=T0PL73gs3I0G4YCGAfo+nVkNW+ZB64cwqUBrzP9qZaXfnV6HozGOxzX+bRkozQA0+KdYrP
	jMJI3CP2PImmwkKULaZ9+sVcFqWK0sCiJT5URIR/ff31LScXDzdH7DO7+n4yuoqudHThWg
	m0kTxPDYkrQV7TqTYdAMcj0J1mE3kpo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=YgaHt1BjGG/a+d49/WKiHz6AgENMlYHggiszKNlUzeU=;
	b=T0PL73gs3I0G4YCGAfo+nVkNW+ZB64cwqUBrzP9qZaXfnV6HozGOxzX+bRkozQA0+KdYrP
	jMJI3CP2PImmwkKULaZ9+sVcFqWK0sCiJT5URIR/ff31LScXDzdH7DO7+n4yuoqudHThWg
	m0kTxPDYkrQV7TqTYdAMcj0J1mE3kpo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-7mE_cV5NMdKI6UF7JSXxfQ-1; Tue,
 28 Jan 2025 10:03:44 -0500
X-MC-Unique: 7mE_cV5NMdKI6UF7JSXxfQ-1
X-Mimecast-MFC-AGG-ID: 7mE_cV5NMdKI6UF7JSXxfQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B3741800A11;
	Tue, 28 Jan 2025 15:03:39 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.70])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id F01681956094;
	Tue, 28 Jan 2025 15:03:34 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 28 Jan 2025 16:03:12 +0100 (CET)
Date: Tue, 28 Jan 2025 16:03:07 +0100
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
Subject: [PATCH v2 2/4] seccomp: fix the __secure_computing() stub for
 !HAVE_ARCH_SECCOMP_FILTER
Message-ID: <20250128150307.GA15325@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Depending on CONFIG_HAVE_ARCH_SECCOMP_FILTER, __secure_computing(NULL)
will crash or not. This is not consistent/safe, especially considering
that after the previous change __secure_computing(sd) is always called
with sd == NULL.

Fortunately, if CONFIG_HAVE_ARCH_SECCOMP_FILTER=n, __secure_computing()
has no callers, these architectures use secure_computing_strict(). Yet
it make sense make __secure_computing(NULL) safe in this case.

Note also that with this change we can unexport secure_computing_strict()
and change the current callers to use __secure_computing(NULL).

Fixes: 8cf8dfceebda ("seccomp: Stub for !HAVE_ARCH_SECCOMP_FILTER")
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 include/linux/seccomp.h |  8 ++------
 kernel/seccomp.c        | 14 ++++++++++----
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
index e45531455d3b..d55949071c30 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -22,8 +22,9 @@
 #include <linux/atomic.h>
 #include <asm/seccomp.h>
 
-#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
 extern int __secure_computing(const struct seccomp_data *sd);
+
+#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
 static inline int secure_computing(void)
 {
 	if (unlikely(test_syscall_work(SECCOMP)))
@@ -32,11 +33,6 @@ static inline int secure_computing(void)
 }
 #else
 extern void secure_computing_strict(int this_syscall);
-static inline int __secure_computing(const struct seccomp_data *sd)
-{
-	secure_computing_strict(sd->nr);
-	return 0;
-}
 #endif
 
 extern long prctl_get_seccomp(void);
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 385d48293a5f..327b7b486f1c 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -29,13 +29,11 @@
 #include <linux/syscalls.h>
 #include <linux/sysctl.h>
 
+#include <asm/syscall.h>
+
 /* Not exposed in headers: strictly internal use only. */
 #define SECCOMP_MODE_DEAD	(SECCOMP_MODE_FILTER + 1)
 
-#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
-#include <asm/syscall.h>
-#endif
-
 #ifdef CONFIG_SECCOMP_FILTER
 #include <linux/file.h>
 #include <linux/filter.h>
@@ -1062,6 +1060,14 @@ void secure_computing_strict(int this_syscall)
 	else
 		BUG();
 }
+int __secure_computing(const struct seccomp_data *sd)
+{
+	int this_syscall = sd ? sd->nr :
+		syscall_get_nr(current, current_pt_regs());
+
+	secure_computing_strict(this_syscall);
+	return 0;
+}
 #else
 
 #ifdef CONFIG_SECCOMP_FILTER
-- 
2.25.1.362.g51ebf55


