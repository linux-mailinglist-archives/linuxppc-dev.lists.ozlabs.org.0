Return-Path: <linuxppc-dev+bounces-5624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7506A20C7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:03:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj7nz1JVdz2yN3;
	Wed, 29 Jan 2025 02:03:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738076599;
	cv=none; b=R4zqWexPY8lSeEPpLttEbApF2pWOA/QB5LItBy/hbH8t3QI9cynMpc8LwtPvjE54/43Q4oaaO1f96Aj5HYXx1MJBT7rHLo95SpvMVWhgXznw1Jou10Sl0H7WoQjvcuXQO0CHmQ0ciBQ9qG5t3Ss8uK0IxsI9AuC6x8Sk+e0hXtZa7lV+jKXOt9MB7yZb0gEh6HmH34fWJOsJ19IZiHSKqudTZ6oxYCczE+IRobQ+B2jeFmnl7VzsgDiWoe8N7Z0cbXpzyPcUnnXk2E7YqKZ0YUPLhDNKP86jZTu/KuTsTVDIsMkb3cOMcLe2nxES3cme2pYtSp6iqyTklLYP0x+aMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738076599; c=relaxed/relaxed;
	bh=EknPAdcO0/rg2+vOEP6j8OFb71hw/N9FA5gNIK4Ypps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZNdaaK0l5YqiNFoP8FkZzLQ5dcPJfkzx5JE2DFJl1AGGoYSYxIeIxZENO3h+dgIB1zyTab0Vlp2FjERQfm41Pd1AMED6CZZ/65PArBgvK++CJoYJlCwnPw5QCvekIQM00hQWS71NFNIUBITRDtCc2yhXMjEsjqdewQqSpovNtmxLwtcQB5uTz8XcOvhfVau8G4bR/zkalcZytu1uoyQSH96pxuW79FwKGdaPtE91VDoo2yHecMZyKnuniyJsLx8Vr7bg8I54IDxbG1AuN3IhRq7gIvs9A9tdSmPMIGRhHlgSQsQxaMcEcpBUHshvrRQYJ0KLl3lwT6BcK/M9v6j23A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JEXsSfMv; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JEXsSfMv; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JEXsSfMv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JEXsSfMv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yj7ny0YWkz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:03:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=EknPAdcO0/rg2+vOEP6j8OFb71hw/N9FA5gNIK4Ypps=;
	b=JEXsSfMvjHD7BIBdSw9x+wz02mxilb+noT5+2x01GFJHleT/9/sbXLFSicw/ngGPNOOLQk
	sljR4OreW2pjSd2TyJJ44P9G3e17PMiWf0L+Qf2/9r7rhJd1nyj9Q+C1uGINYVVZdkqkcA
	BtPsbZYC7mHdPWFWg3ALYDsqISxh28k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=EknPAdcO0/rg2+vOEP6j8OFb71hw/N9FA5gNIK4Ypps=;
	b=JEXsSfMvjHD7BIBdSw9x+wz02mxilb+noT5+2x01GFJHleT/9/sbXLFSicw/ngGPNOOLQk
	sljR4OreW2pjSd2TyJJ44P9G3e17PMiWf0L+Qf2/9r7rhJd1nyj9Q+C1uGINYVVZdkqkcA
	BtPsbZYC7mHdPWFWg3ALYDsqISxh28k=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-ydiErNfsMyuFST3JLbQc6A-1; Tue,
 28 Jan 2025 10:03:04 -0500
X-MC-Unique: ydiErNfsMyuFST3JLbQc6A-1
X-Mimecast-MFC-AGG-ID: ydiErNfsMyuFST3JLbQc6A
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D2FB18009D5;
	Tue, 28 Jan 2025 15:03:01 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.70])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1312D1800268;
	Tue, 28 Jan 2025 15:02:55 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 28 Jan 2025 16:02:34 +0100 (CET)
Date: Tue, 28 Jan 2025 16:02:28 +0100
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
Subject: [PATCH v2 0/4] seccomp: remove the 'sd' argument from
 __secure_computing()
Message-ID: <20250128150228.GA15298@redhat.com>
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
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

Link to v1: https://lore.kernel.org/all/20250120134409.GA21241@redhat.com/
Only 2/4 was changed, please see interdiff at the end.

I've included the acks I got on 1/4, 3/4, and 4/4 (thanks!).

Oleg.
---

 arch/mips/kernel/ptrace.c           | 20 ++-----------------
 arch/powerpc/kernel/ptrace/ptrace.c |  2 +-
 include/linux/seccomp.h             | 12 ++++--------
 kernel/entry/common.c               |  2 +-
 kernel/seccomp.c                    | 39 ++++++++++++++++++-------------------
 5 files changed, 27 insertions(+), 48 deletions(-)

-------------------------------------------------------------------------------
diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
index 6125baa96b76..9b959972bf4a 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -22,8 +22,9 @@
 #include <linux/atomic.h>
 #include <asm/seccomp.h>
 
-#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
 extern int __secure_computing(void);
+
+#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
 static inline int secure_computing(void)
 {
 	if (unlikely(test_syscall_work(SECCOMP)))
@@ -32,7 +33,6 @@ static inline int secure_computing(void)
 }
 #else
 extern void secure_computing_strict(int this_syscall);
-static inline int __secure_computing(void) { return 0; }
 #endif
 
 extern long prctl_get_seccomp(void);
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 75e293d3c1a1..4bd2eb50f77b 100644
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
@@ -1062,6 +1060,13 @@ void secure_computing_strict(int this_syscall)
 	else
 		BUG();
 }
+int __secure_computing(void)
+{
+	int this_syscall = syscall_get_nr(current, current_pt_regs());
+
+	secure_computing_strict(this_syscall);
+	return 0;
+}
 #else
 
 #ifdef CONFIG_SECCOMP_FILTER


