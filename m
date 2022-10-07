Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (unknown [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A4F5F81EF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 03:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mkngt2bnrz3dyh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 12:31:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ccdd1y68;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iqoqcecD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ccdd1y68;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iqoqcecD;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkXhj6tB7z3bnH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 02:45:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665157554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMgaXogbXPhOabUcxt7UADYdICMU0udr545Ze04p+j4=;
	b=Ccdd1y68C2ekmrFHqSG9jbEK3A1XBnnspQPMR5rK0O1F03ZbM5GN1PYYXtela+4BdUnNe+
	+bCgOflR/x6wjJYj0OjU0B3tcU8Pdj0R6VB1IqMALJltYpm0cMk0ndshRHhjqzz5nCNJ3b
	xF1+eZRVpEZdqMZu3ozwaqOUc1wYQOE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665157555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMgaXogbXPhOabUcxt7UADYdICMU0udr545Ze04p+j4=;
	b=iqoqcecDeaIstp2JVOjChGBh2pDECjVChQrtRYOcWvL0q/39cfien/ID8fxTDobKzE8exa
	PcRwpzfnkqn7kcagv4ZmNpElPoBVHiKqszywTwNxQ8hURs7zTgaKholwxTALvgT9WM40ej
	esrDK9M4ZbAWnxLg9zuBGPbfxL04Pdw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-B71E1ymDO4ioq7uqV9pWnA-1; Fri, 07 Oct 2022 11:45:53 -0400
X-MC-Unique: B71E1ymDO4ioq7uqV9pWnA-1
Received: by mail-wr1-f72.google.com with SMTP id t12-20020adfa2cc000000b0022adcbb248bso1563174wra.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Oct 2022 08:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMgaXogbXPhOabUcxt7UADYdICMU0udr545Ze04p+j4=;
        b=R5jhxYmc0zWLckyCmnjHJrWPB+Po8ZpuqBhD5RLVpSGUnYpTanae0UhuERMoWaZ/v6
         Ghj+E5txLrar7657vhC/c1p0WAg3uWtNf8QR20fPJXa476LqEWha0YNb0irp9/OP7e0l
         KTLvXhXilPJw90r3jvyKHowesoiN7YwO5tgmYqAz815fYILYnQ21VzertufRjk6/S/tE
         V4DyZ1JvqikyzKED430w2Z24wTkL5SP6AuRVoEOuxrS6VIDRtt4k8fV39RpVqzWCMWv9
         pWiPhxNTYgmGQFdXsqZC0K5ppeLBrBvhtQIWdgCRQKo/4oA/+rZnG3dSR5m5ZfnSGX+i
         Ns2g==
X-Gm-Message-State: ACrzQf01L56huBMyiNa17QIDCatcLUnB7AFKm2SIwTrLF97UJGxuDgjN
	eSDqaFv1POakxFGpYx+SfRXBWf5uEuk/gwb3d1j8HbqTVqC07IuW7I6sPbpUpKwb/hA6zZLQ3jf
	bi2nQ+B4ks+Nis5bCDtHWEVtXsg==
X-Received: by 2002:a05:600c:458d:b0:3c3:bf4e:5c60 with SMTP id r13-20020a05600c458d00b003c3bf4e5c60mr1331382wmo.189.1665157552451;
        Fri, 07 Oct 2022 08:45:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM53pm8pDMF8tAvcpsQYCd9DEpAeQROExvsQCCHMjVMrngwHmXq+ii3h5Ne2OaugbAyINh7v6Q==
X-Received: by 2002:a05:600c:458d:b0:3c3:bf4e:5c60 with SMTP id r13-20020a05600c458d00b003c3bf4e5c60mr1331352wmo.189.1665157552172;
        Fri, 07 Oct 2022 08:45:52 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id i18-20020adfb652000000b0022e38c93195sm2339428wre.34.2022.10.07.08.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:45:51 -0700 (PDT)
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
Subject: [RFC PATCH 1/5] trace: Add trace_ipi_send_{cpu, cpumask}
Date: Fri,  7 Oct 2022 16:45:29 +0100
Message-Id: <20221007154533.1878285-1-vschneid@redhat.com>
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

trace_ipi_raise is unsuitable for generically tracing IPI sources; add a
variant of it that takes a callsite and a CPU. Define a macro helper for
handling IPIs sent to multiple CPUs.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 include/trace/events/ipi.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/trace/events/ipi.h b/include/trace/events/ipi.h
index 0be71dad6ec0..fd2f2aeb36fe 100644
--- a/include/trace/events/ipi.h
+++ b/include/trace/events/ipi.h
@@ -35,6 +35,33 @@ TRACE_EVENT(ipi_raise,
 	TP_printk("target_mask=%s (%s)", __get_bitmask(target_cpus), __entry->reason)
 );
 
+TRACE_EVENT(ipi_send_cpu,
+
+	TP_PROTO(unsigned long callsite, unsigned int cpu),
+
+	TP_ARGS(callsite, cpu),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, callsite)
+		__field(unsigned int, cpu)
+	),
+
+	TP_fast_assign(
+		__entry->callsite = callsite;
+		__entry->cpu      = cpu;
+	),
+
+	TP_printk("callsite=%pS target_cpu=%d", (void *)__entry->callsite, __entry->cpu)
+);
+
+#define trace_ipi_send_cpumask(callsite, mask) do {		\
+	if (static_key_false(&__tracepoint_ipi_send_cpu.key)) { \
+		int cpu;					\
+		for_each_cpu(cpu, mask)				\
+			trace_ipi_send_cpu(callsite, cpu);	\
+	}							\
+} while (0)
+
 DECLARE_EVENT_CLASS(ipi_handler,
 
 	TP_PROTO(const char *reason),
-- 
2.31.1

