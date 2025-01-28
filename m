Return-Path: <linuxppc-dev+bounces-5625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ED2A20C80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:03:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj7pX6vXNz2yZN;
	Wed, 29 Jan 2025 02:03:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738076628;
	cv=none; b=PNCi2LgO9BlsZR4g7hYvr9HAp2Pw56datlZV17DoI+9VA+Q1E82/zyk8L/OVyRUps7nwra9p7P1nPYmX/j+eDGQ8uocI4nwA7BGNK/NOXDnc0ow9lLCdez092pcP4wQhZKxhVbSDWjIkhaL9/ZJhwESzD3hnlUyY9dWNM7t265cP4lSOepsOBfGOLOlgbVU9kzqibgfUj3zaco1eNzOClE79QscrRFP0qHX/PlswezabxrOHKYXeVmtQXGAjr3tMUdjK2RghqSnIBjRBLCxHMPwT2d5WIRFcDKpZ4uBt8atmQB9KX4EmIfc87QJov+196y47HXZ8mFMcSpX4lbqRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738076628; c=relaxed/relaxed;
	bh=A7ChX7syTU7kQvpgxC35PjlmcI8srSLydm88ZSnfzAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=U1skmpYqIID7bgEThPTa+Bn5/FfWaaZNJ3JrTXHGlF02coIEOwW2F/FbUsAsbX76hJuGMeRdD1LDC/QNV6xRBCe3srowa1Om0esZcWz6bKXoDvM5At/MeFw/WztjlFJI3xamNPaKLhjY/JMuppcywA87kWMrxIiY1QtVBd4r+AD/uWAocST+KX4cuocbPdBT7fvach74HJHqwCGSBoICQPAHxp1SISI+5h3AGKUJdXfUg6GAfHBHFYwaTdrhpMZ2pLGznvi1Vwl5ziR8ed/GmUn3URylQ0B+jSVeAKmYqItWaH2X4JBcbV8X6EKlJlbgOL+Hx7zIXQGwrda0e7rG/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TuXCnSeC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TuXCnSeC; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TuXCnSeC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TuXCnSeC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yj7pW4hYNz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:03:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=A7ChX7syTU7kQvpgxC35PjlmcI8srSLydm88ZSnfzAs=;
	b=TuXCnSeCSRXM3d80KIoNpL7i6bLwBPHqeK1NKMwE3hjaoVXh0Nsc+jXP3hR3MQB6Re3rLa
	gKrCwZ9M9jjwp4+vWe1xh3/bvCroVtyIgoU4iYoMHg0jfQr13r+wLWvHO3LSLLRAWJQyN5
	YWntTKonSKQiqcb8BnESsZL90VYDYuQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=A7ChX7syTU7kQvpgxC35PjlmcI8srSLydm88ZSnfzAs=;
	b=TuXCnSeCSRXM3d80KIoNpL7i6bLwBPHqeK1NKMwE3hjaoVXh0Nsc+jXP3hR3MQB6Re3rLa
	gKrCwZ9M9jjwp4+vWe1xh3/bvCroVtyIgoU4iYoMHg0jfQr13r+wLWvHO3LSLLRAWJQyN5
	YWntTKonSKQiqcb8BnESsZL90VYDYuQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-227-zthpiRmcML2MbERzCpKDPA-1; Tue,
 28 Jan 2025 10:03:35 -0500
X-MC-Unique: zthpiRmcML2MbERzCpKDPA-1
X-Mimecast-MFC-AGG-ID: zthpiRmcML2MbERzCpKDPA
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ECDBF18009C5;
	Tue, 28 Jan 2025 15:03:32 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.70])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D6A621800352;
	Tue, 28 Jan 2025 15:03:27 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 28 Jan 2025 16:03:06 +0100 (CET)
Date: Tue, 28 Jan 2025 16:03:00 +0100
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
Subject: [PATCH v2 1/4] seccomp/mips: change syscall_trace_enter() to use
 secure_computing()
Message-ID: <20250128150300.GA15318@redhat.com>
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
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

arch/mips/Kconfig selects HAVE_ARCH_SECCOMP_FILTER so syscall_trace_enter()
can just use __secure_computing(NULL) and rely on populate_seccomp_data(sd)
and "sd == NULL" checks in __secure_computing(sd) paths.

With the change above syscall_trace_enter() can just use secure_computing()
and avoid #ifdef + test_thread_flag(TIF_SECCOMP). CONFIG_GENERIC_ENTRY is
not defined, so test_syscall_work(SECCOMP) will check TIF_SECCOMP.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/mips/kernel/ptrace.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index 61503a36067e..f7107479c7fa 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -1326,24 +1326,8 @@ asmlinkage long syscall_trace_enter(struct pt_regs *regs)
 			return -1;
 	}
 
-#ifdef CONFIG_SECCOMP
-	if (unlikely(test_thread_flag(TIF_SECCOMP))) {
-		int ret, i;
-		struct seccomp_data sd;
-		unsigned long args[6];
-
-		sd.nr = current_thread_info()->syscall;
-		sd.arch = syscall_get_arch(current);
-		syscall_get_arguments(current, regs, args);
-		for (i = 0; i < 6; i++)
-			sd.args[i] = args[i];
-		sd.instruction_pointer = KSTK_EIP(current);
-
-		ret = __secure_computing(&sd);
-		if (ret == -1)
-			return ret;
-	}
-#endif
+	if (secure_computing())
+		return -1;
 
 	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
 		trace_sys_enter(regs, regs->regs[2]);
-- 
2.25.1.362.g51ebf55


