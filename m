Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D05F81F2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 03:33:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mknl030ZBz2ywm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 12:33:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bQ6hPGYo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bQ6hPGYo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bQ6hPGYo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bQ6hPGYo;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkXj04vXPz3c5G
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 02:46:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665157570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8NlfJJNnBH1Hg+bNlEeNOaLSp643edXbrFkYOuHdj0=;
	b=bQ6hPGYo4FsYj8QPFvMdssGyeKTiMFuyGpseGcUi9Oz5qPshPYgmoNZvvM0C9Yy7STerd5
	jO9HKBjAWMyU/b5ngjI6kx7AO/3SYiWmrLNLyzRjyKX7L2n6uJJVfClXAn6+9fSg0qTvQE
	Qy1MIzSF9ygKP5Lbmbgz3i4ytg0qX0E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665157570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8NlfJJNnBH1Hg+bNlEeNOaLSp643edXbrFkYOuHdj0=;
	b=bQ6hPGYo4FsYj8QPFvMdssGyeKTiMFuyGpseGcUi9Oz5qPshPYgmoNZvvM0C9Yy7STerd5
	jO9HKBjAWMyU/b5ngjI6kx7AO/3SYiWmrLNLyzRjyKX7L2n6uJJVfClXAn6+9fSg0qTvQE
	Qy1MIzSF9ygKP5Lbmbgz3i4ytg0qX0E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-GXUWm6-3OMqyXUxYVdR5xg-1; Fri, 07 Oct 2022 11:46:09 -0400
X-MC-Unique: GXUWm6-3OMqyXUxYVdR5xg-1
Received: by mail-wm1-f72.google.com with SMTP id v191-20020a1cacc8000000b003bdf7b78dccso2852939wme.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Oct 2022 08:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8NlfJJNnBH1Hg+bNlEeNOaLSp643edXbrFkYOuHdj0=;
        b=wYlkf8z+Xrc/PXGX9ic2N8bn5UjB2WNutEmbsMqt5DswxC4qAEMjzZKdLFzBlTN9T8
         AGZkoBT+BURbaXlV9W4TEXlukeZv3/7n9JEzURM+JLvtVIWckAAv+FQZJn/+Xlw+e5KH
         Xmo0L0e4qiRoaHJ7+RNh6ryWaNoPKA0WlJOHrA4Jg0Xj4HZlhoXmo8dLtCV3W/JjQICS
         E8PgXqrW179yYrO+dvz4RE33ep5l+3rFnIFWGAnrYfsI4KClmDXP+N+LF3XHSNMaChY+
         jZw/H4kK7CnSrYhoc364ME8LLwbfvLJNwAPPHOwIAUw8dQfIFG2gMgsmX0xTKtCcyf7T
         leAw==
X-Gm-Message-State: ACrzQf2PHPl9PinjGlR/CvDpfOxU9v3DXHWHlxM6a0s644zzkDMMgVVO
	oFJbzQW2w0XfancSvF+g0fILaxmlRJ+w/sSLqfVUCCmviWG2VXsbliJum+TdMeyZxIJA+Hmof0E
	2Hs7KzsbtU9edqDLN0t7qFoQdGQ==
X-Received: by 2002:a5d:64cd:0:b0:22e:2fc1:9511 with SMTP id f13-20020a5d64cd000000b0022e2fc19511mr3566235wri.415.1665157568141;
        Fri, 07 Oct 2022 08:46:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4t9ram8oou3fr6TpdC1R8We+758fvnnqCUt2NCTCIakvPHOGi5POwCK/ARZj0LE9PFnGcXMg==
X-Received: by 2002:a5d:64cd:0:b0:22e:2fc1:9511 with SMTP id f13-20020a5d64cd000000b0022e2fc19511mr3566217wri.415.1665157567961;
        Fri, 07 Oct 2022 08:46:07 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id i18-20020adfb652000000b0022e38c93195sm2339428wre.34.2022.10.07.08.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:46:06 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	x86@kernel.org
Subject: [RFC PATCH 4/5] irq_work: Trace calls to arch_irq_work_raise()
Date: Fri,  7 Oct 2022 16:45:32 +0100
Message-Id: <20221007154533.1878285-4-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221007154145.1877054-1-vschneid@redhat.com>
References: <20221007154145.1877054-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Sat, 08 Oct 2022 12:28:34 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Marcelo Tosatti <mtosatti@redhat.com>, Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, "David S. Miller" <davem@davemloft.net>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Frederic Weisbecker <frederic@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adding a tracepoint to send_call_function_single_ipi() covers
irq_work_queue_on() when the CPU isn't the local one - add a tracepoint to
irq_work_raise() to cover the other cases.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/irq_work.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/irq_work.c b/kernel/irq_work.c
index 7afa40fe5cc4..5a550b681878 100644
--- a/kernel/irq_work.c
+++ b/kernel/irq_work.c
@@ -22,6 +22,8 @@
 #include <asm/processor.h>
 #include <linux/kasan.h>
 
+#include <trace/events/ipi.h>
+
 static DEFINE_PER_CPU(struct llist_head, raised_list);
 static DEFINE_PER_CPU(struct llist_head, lazy_list);
 static DEFINE_PER_CPU(struct task_struct *, irq_workd);
@@ -74,6 +76,14 @@ void __weak arch_irq_work_raise(void)
 	 */
 }
 
+static inline void irq_work_raise(void)
+{
+	if (arch_irq_work_has_interrupt())
+		trace_ipi_send_cpu(_RET_IP_, smp_processor_id());
+
+	arch_irq_work_raise();
+}
+
 /* Enqueue on current CPU, work must already be claimed and preempt disabled */
 static void __irq_work_queue_local(struct irq_work *work)
 {
@@ -99,7 +109,7 @@ static void __irq_work_queue_local(struct irq_work *work)
 
 	/* If the work is "lazy", handle it from next tick if any */
 	if (!lazy_work || tick_nohz_tick_stopped())
-		arch_irq_work_raise();
+		irq_work_raise();
 }
 
 /* Enqueue the irq work @work on the current CPU */
-- 
2.31.1

