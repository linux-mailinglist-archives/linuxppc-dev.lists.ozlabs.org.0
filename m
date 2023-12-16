Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 725608159A6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:55:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EEtFzij9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnfL15YLz3vkM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:55:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EEtFzij9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnPY5yw7z3cN9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:44:17 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5c690c3d113so1309186a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734255; x=1703339055; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LTJ7yfoalNlVXaP2XnSBJMkrcxD46lotdXo+rGR5gY=;
        b=EEtFzij9wXjgWEwZ5j80m8NmmPz4lzP9QWerdwePKl7/Z2NRHcrV0hAhLcAmGwMEem
         rngec/2dqyo2Y7pw/REtMJ+836qHhxHg/0FQQbuhR8euEhK9MpJVYugetAxvd4TQCdux
         MuwwDuHnnO4xz09nYAhusAaB3f3oRQtqrLUv4VxfIIQkoGuoEfq+W/3KzO7D2ble9ZKL
         VKS/l/rzLRIVjbvouck11ex+BICsNZ5K3LIBlsi/1S7zeCZ9F+jGs9fpvklbNORdeeBp
         rNzurNjHwrbtkibiNTOPgHnoVVsSHqAdhlIrBhl6SH9kCarIc1TEI0PvaFHFLgzoOytJ
         AI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734255; x=1703339055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LTJ7yfoalNlVXaP2XnSBJMkrcxD46lotdXo+rGR5gY=;
        b=N2kQXVIKhcGclVc7yPf910zLZJpRO/JtFsUYlG74QI8Xtmv3MZis3bS8Lk0L8+pAT5
         IWswN4MYM12ZU18kK++lcw6MtNTwG5SXWrrIJvDs7X59tN7UE/XIgzBvlcVhmPmS8Yav
         FcupIYxQCGHs+siW44Kd+eNydJozMygPoHb0fAxN2IPG+ZBkbGbnEaRniP5LiIQ1WOgc
         GJpPUH+slqWPV6IRHc5OcPUA0vBqCCNiSqVOe5Sf8B3GO8c9D/iemndSrtKlx79z9OfL
         QGdf79OUmYs7+rT1jVLBsGwl1DPFvSzeLObgrSf6cqk14rSdNxQ+fP0OoNUKpMe1l5bh
         tUDw==
X-Gm-Message-State: AOJu0Yy4n1xDYQ1SjomavXGcI6Qp0ZlS5IhfgfXYa+1/pbGCZEhtzk9c
	NWZLuVbPRkEJB3L8oDDqOFc=
X-Google-Smtp-Source: AGHT+IHm5PgsAe3mbsod6sKyHlyDb0fTItwc5+r26VfZ2zu5GEVfquaQMCfX879dAID5xru4PfL1Gw==
X-Received: by 2002:a05:6a20:320f:b0:18f:97c:6177 with SMTP id hl15-20020a056a20320f00b0018f097c6177mr13502828pzc.116.1702734255455;
        Sat, 16 Dec 2023 05:44:15 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 14/29] powerpc: Expand exception handler vector granularity
Date: Sat, 16 Dec 2023 23:42:41 +1000
Message-ID: <20231216134257.1743345-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Exception handlers are currently indexed in units of 0x100, but
powerpc can have vectors that are aligned to as little as 0x20
bytes. Increase granularity of the handler functions before
adding support for those vectors.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/processor.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index b4cd5b4c..b224fc8e 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -16,19 +16,25 @@
 static struct {
 	void (*func)(struct pt_regs *, void *data);
 	void *data;
-} handlers[16];
+} handlers[128];
 
+/*
+ * Exception handlers span from 0x100 to 0x1000 and can have a granularity
+ * of 0x20 bytes in some cases. Indexing spans 0-0x1000 with 0x20 increments
+ * resulting in 128 slots.
+ */
 void handle_exception(int trap, void (*func)(struct pt_regs *, void *),
 		      void * data)
 {
-	assert(!(trap & ~0xf00));
+	assert(!(trap & ~0xfe0));
 
-	trap >>= 8;
+	trap >>= 5;
 
 	if (func && handlers[trap].func) {
 		printf("exception handler installed twice %#x\n", trap << 5);
 		abort();
 	}
+
 	handlers[trap].func = func;
 	handlers[trap].data = data;
 }
@@ -37,9 +43,9 @@ void do_handle_exception(struct pt_regs *regs)
 {
 	unsigned char v;
 
-	v = regs->trap >> 8;
+	v = regs->trap >> 5;
 
-	if (v < 16 && handlers[v].func) {
+	if (v < 128 && handlers[v].func) {
 		handlers[v].func(regs, handlers[v].data);
 		return;
 	}
-- 
2.42.0

