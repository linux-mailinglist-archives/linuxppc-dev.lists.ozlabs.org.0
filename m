Return-Path: <linuxppc-dev+bounces-5395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C029AA16DA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 14:45:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcBRq35BRz304f;
	Tue, 21 Jan 2025 00:45:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737380727;
	cv=none; b=hWTVEdAo8L6T3+6EneJ5naToBXYXB6JlTsMXT6Hv6LAC+9U9IsN0yYxBgQPWy2rj19rKKMgwroYnsMGvYhE0kOOmCWakmuZM3MmDxzRFnj1rbX7HdhEy22Ybx0QJkYCyrJ+jli8e4NkBAL/EzMNFAHiwK3Saty/kX61u/zrJ9EeTHDUKaV+1MxP5yDLBO5e7k2yDXYhWAk97Ry8fxk/C3ZspptFOaS3O9b3++Z4omQ0oZoQLyTPX/qewVVv/uG9M+TT2FoOcPZH2Sp5BLLnoZlfcPkXOtp6tmVrtRm35wPsxgpEG/0POL1ZIZ1ZyKdR9qIFq44IrASxYQ792iHRrww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737380727; c=relaxed/relaxed;
	bh=Ga7QCRtOcrnYtWlk07C9MgkwegAMWWghsqDjUI+PWno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jJ8+PhPDZk5APteUexzadLh91wTGNqqePWdn8cJB3QjN4cScWEOawRtLgANB1jLUqVDH/yt8IvG8C6M3XJ0d7iakk4aoC3L1r809ch0b0PXW1FMnakO36jK7WORHtEX1+3sBNpDEVn8F0sLiN4agqXBEmCKbwObFt0AX8ysFNnV8bJtE8PC4Wyn75+K0ubvd2dDKgP8gdAqR7kB5lsEE8F0VjTAuyRcscmf1VeT+hC54FjVnOOH3oLPFF0wiAO28m7nQp8vy1xgEz4XjjCTtAMwKwcVTb2wFpnzyopiH4hhbBgDlM5So4srzkATbL+rKMeachgeaKGmpa8uHy/7YbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OkhCmq9I; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OkhCmq9I; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OkhCmq9I;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OkhCmq9I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcBRp1tnSz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 00:45:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=Ga7QCRtOcrnYtWlk07C9MgkwegAMWWghsqDjUI+PWno=;
	b=OkhCmq9Iy4PWGdWG4fMQ/3p//+EGrX8+SbGvt5oYCwKxD3JyV6AdWth8C9vUy23ravnAMk
	MVztnc7gZ3p50Xl6iHypgnjCTDp/ThBUyHTJBsTPwWNUf5T+ddJxcwp2s3ndd6jepcl4bU
	FLFLE8xh2n4R3ITYyo3IzqCyhdSsVFs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=Ga7QCRtOcrnYtWlk07C9MgkwegAMWWghsqDjUI+PWno=;
	b=OkhCmq9Iy4PWGdWG4fMQ/3p//+EGrX8+SbGvt5oYCwKxD3JyV6AdWth8C9vUy23ravnAMk
	MVztnc7gZ3p50Xl6iHypgnjCTDp/ThBUyHTJBsTPwWNUf5T+ddJxcwp2s3ndd6jepcl4bU
	FLFLE8xh2n4R3ITYyo3IzqCyhdSsVFs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-158-DhGEK2dkPqquqBt9d-3q1Q-1; Mon,
 20 Jan 2025 08:45:19 -0500
X-MC-Unique: DhGEK2dkPqquqBt9d-3q1Q-1
X-Mimecast-MFC-AGG-ID: DhGEK2dkPqquqBt9d-3q1Q
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20C0B1955DDB;
	Mon, 20 Jan 2025 13:45:17 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.104])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id AF8B619560A3;
	Mon, 20 Jan 2025 13:45:11 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 20 Jan 2025 14:44:52 +0100 (CET)
Date: Mon, 20 Jan 2025 14:44:45 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] seccomp/mips: change syscall_trace_enter() to use
 secure_computing()
Message-ID: <20250120134445.GA21268@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

arch/mips/Kconfig selects HAVE_ARCH_SECCOMP_FILTER so syscall_trace_enter()
can just use __secure_computing(NULL) and rely on populate_seccomp_data(sd)
and "sd == NULL" checks in __secure_computing(sd) paths.

With the change above syscall_trace_enter() can just use secure_computing()
and avoid #ifdef + test_thread_flag(TIF_SECCOMP). CONFIG_GENERIC_ENTRY is
not defined, so test_syscall_work(SECCOMP) will check TIF_SECCOMP.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
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


