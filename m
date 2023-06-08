Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6658B72798E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 10:06:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcGxg1GGlz3fvG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 18:06:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f2jBjOik;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f2jBjOik;
	dkim-atps=neutral
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGnT54qbz3dwD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 17:59:09 +1000 (AEST)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-558cb7f201cso192853eaf.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 00:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686211147; x=1688803147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uayp+LjPjVw28FmG8NCFIt7N1/ju2Hgrf901o8nifAs=;
        b=f2jBjOikHHJKWKIHBtgDcgtOAtCTwvKxNizDU6nwK2BrOOpcNpnHkdbScCO6urRxHp
         5OL88CeufnS1p/uO/asma+p0nxd02cr7+DQKBfyKm0mXfWJsuRvZPi7EAGnmT8HRqruh
         5uw5tDz+y9RM83rdHsG5POz3Ds8ilE4yO3MMNJPXLsaJZRqlkq7kXC6YrT7X3xHYqRZc
         tpfYovv3SPYiaPvlUEgDOSoaoZqQ6ZuXjiHarRQZByrndFLYYVkQIodsSEW6RSY4rAEs
         xYsod/hpM5B5Qkzsg9SoCOhajjF/+m0q4gsoGfRu44/uRmaMYUqKrxlsPDASLYN+teE1
         T55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211147; x=1688803147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uayp+LjPjVw28FmG8NCFIt7N1/ju2Hgrf901o8nifAs=;
        b=Kz/z8kEib3Vg69+GiE/N9MpGh8gMVoFg1zTCMvGUYzF0vltETrnAXgi5QAoskMv+qw
         CqetCuur3CecAuEm9aJrDwwgRkUQK1Y/z8prI/j49km4+aHCMhwDK2eaBpKHTwYQwVbp
         p17TGcw12Ci8sBAud6n/BhABEstOYNSmi8bnHhOQWrzcMVE9w5Z3cvRPtkhmr+AobXoy
         VFCYNRGwUU7nO2AKpKTqLvXFUcc4FFVDb+TMrG/SAfq1y14tjOpDG1+l2b+9bze1a4SE
         TMlB8LNKei0/OFMiw/4lGetUevldZnNFOkdlxlHYw1shwgkkLDpauii+A3H0wHWZip1B
         oKcQ==
X-Gm-Message-State: AC+VfDyzc4JsEBJgKu/1P/WJ/4sxa9gO8Q37oCBYSCm8OT+yYrwYXgpq
	vT1U2QQSZZVXHJoF6EyoFVE=
X-Google-Smtp-Source: ACHHUZ7cuvnV+T5mXGgUQWUCXG47Rhgq0xybAWQQXnWpZGzyJulsvyxaE7r0Rk/rAS2on5HmSA3Aag==
X-Received: by 2002:a05:6359:a90:b0:129:c27d:9f1f with SMTP id em16-20020a0563590a9000b00129c27d9f1fmr3491649rwb.5.1686211147081;
        Thu, 08 Jun 2023 00:59:07 -0700 (PDT)
Received: from wheely.local0.net ([1.146.34.117])
        by smtp.gmail.com with ESMTPSA id 17-20020a630011000000b00542d7720a6fsm673182pga.88.2023.06.08.00.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:59:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v4 08/12] powerpc: Expand exception handler vector granularity
Date: Thu,  8 Jun 2023 17:58:22 +1000
Message-Id: <20230608075826.86217-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608075826.86217-1-npiggin@gmail.com>
References: <20230608075826.86217-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Exception handlers are currently indexed in units of 0x100, but
powerpc can have vectors that are aligned to as little as 0x20
bytes. Increase granularity of the handler functions before
adding support for those vectors.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v3:
- Fix typo [Thomas]

 lib/powerpc/processor.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index aaf45b68..64d7ae01 100644
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
 		printf("exception handler installed twice %#x\n", trap);
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
2.40.1

