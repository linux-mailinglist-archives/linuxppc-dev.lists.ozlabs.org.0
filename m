Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB7D616C49
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 19:35:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2bCn2CSNz3cFb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 05:35:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iEAB1kap;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iEAB1kap;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iEAB1kap;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iEAB1kap;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2bBs3cCtz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 05:34:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667414051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iOwZQK5qeETgL3wqlfHaHMAHqEn7+FhbLCJ4P7hdM2o=;
	b=iEAB1kapFIZPuLTEkTWEl8QlKKl9pRe/EnVXE7rRc7Wk2hTgU0sKMA3QG7nezjTw6+yNVk
	2TUZBPcPtMdnl247IagpfzeQBmhXX7fOC0dBKnXaVqnk/3dIpdG0jlwm3bwhkueuC38gD5
	c5MdymvTcOXotkD/LOwSYbBXzGV8ZPc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667414051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iOwZQK5qeETgL3wqlfHaHMAHqEn7+FhbLCJ4P7hdM2o=;
	b=iEAB1kapFIZPuLTEkTWEl8QlKKl9pRe/EnVXE7rRc7Wk2hTgU0sKMA3QG7nezjTw6+yNVk
	2TUZBPcPtMdnl247IagpfzeQBmhXX7fOC0dBKnXaVqnk/3dIpdG0jlwm3bwhkueuC38gD5
	c5MdymvTcOXotkD/LOwSYbBXzGV8ZPc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-338-2uBAoMlZMaiG-dxiULgkFA-1; Wed, 02 Nov 2022 14:34:09 -0400
X-MC-Unique: 2uBAoMlZMaiG-dxiULgkFA-1
Received: by mail-qt1-f198.google.com with SMTP id cm12-20020a05622a250c00b003a521f66e8eso7118270qtb.17
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 11:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOwZQK5qeETgL3wqlfHaHMAHqEn7+FhbLCJ4P7hdM2o=;
        b=mneAexUb8rsff9OJsmCSDErcM0FW9KuSEHk+LaDiNKVFd1KloJQHjfEXFPkQItSsT3
         dibxEgapOgpGG2HT88go8I245YCWTfnSzifoqsBitwEpF042ttoY9BIedh5YiK5wujsS
         HvQ7wzECFmpFEzOMTiw8evN21bWQK/XE0utiqoAzsB23tTqpZcLI/jgh4/oOpwfw1nJF
         fQmuTPvErLSLJq3saSffkNNIlT2eIqxRfa1dnD146QVWFlqMl3RT2c5pS3pclBaqjldu
         xQz9qr+Ptmi3pko7KEkYVY6WyQ2FJlrxvLVGtu1caXEcUa1fJ59O8XWvaMa8nX5Fh3bs
         0sTA==
X-Gm-Message-State: ACrzQf0ZIlnRTMvNtzm2jLOR5zlm4yOeQGfLTJ4VTloj0RRIoycjcCHg
	ib1a/g+Rjp8SukKPkbSD50fR/qJtFEKEWq3EnQsZbZoP07uGpOTBNHX5Y0q7yNKP/51n6scE/BR
	rqqDH2PtASPYmkhkuswdlgJYYWQ==
X-Received: by 2002:a05:622a:183:b0:3a5:4255:a0fe with SMTP id s3-20020a05622a018300b003a54255a0femr5122045qtw.441.1667414048634;
        Wed, 02 Nov 2022 11:34:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM513iTu4ts5GTQjgBcRtTQiZ5hV5vnGyMiejNr5eqgULDfvGkfyMfW7xqa9AO3zDpp+iTddyQ==
X-Received: by 2002:a05:622a:183:b0:3a5:4255:a0fe with SMTP id s3-20020a05622a018300b003a54255a0femr5122009qtw.441.1667414048423;
        Wed, 02 Nov 2022 11:34:08 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id w187-20020a3794c4000000b006eed47a1a1esm8757820qkd.134.2022.11.02.11.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:34:06 -0700 (PDT)
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
Subject: [RFC PATCH v2 2/8] trace: Add trace_ipi_send_cpumask()
Date: Wed,  2 Nov 2022 18:33:30 +0000
Message-Id: <20221102183336.3120536-1-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221102182949.3119584-1-vschneid@redhat.com>
References: <20221102182949.3119584-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

trace_ipi_raise() is unsuitable for generically tracing IPI sources due to
its "reason" argument being an uninformative string (on arm64 all you get
is "Function call interrupts" for SMP calls).

Add a variant of it that takes a exports a target CPU, a callsite and a
callback.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 include/trace/events/ipi.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/trace/events/ipi.h b/include/trace/events/ipi.h
index 0be71dad6ec03..b1125dc27682c 100644
--- a/include/trace/events/ipi.h
+++ b/include/trace/events/ipi.h
@@ -35,6 +35,28 @@ TRACE_EVENT(ipi_raise,
 	TP_printk("target_mask=%s (%s)", __get_bitmask(target_cpus), __entry->reason)
 );
 
+TRACE_EVENT(ipi_send_cpumask,
+
+	TP_PROTO(const struct cpumask *cpumask, unsigned long callsite, void *callback),
+
+	TP_ARGS(cpumask, callsite, callback),
+
+	TP_STRUCT__entry(
+		__cpumask(cpumask)
+		__field(void *, callsite)
+		__field(void *, callback)
+	),
+
+	TP_fast_assign(
+		__assign_cpumask(cpumask, cpumask_bits(cpumask));
+		__entry->callsite = (void *)callsite;
+		__entry->callback = callback;
+	),
+
+	TP_printk("cpumask=%s callsite=%pS callback=%pS",
+		  __get_cpumask(cpumask), __entry->callsite, __entry->callback)
+);
+
 DECLARE_EVENT_CLASS(ipi_handler,
 
 	TP_PROTO(const char *reason),
-- 
2.31.1

