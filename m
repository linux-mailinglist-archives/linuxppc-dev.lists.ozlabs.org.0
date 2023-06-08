Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5907727968
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 10:00:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcGpk4yy8z3fGx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 18:00:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GvrbfRwJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GvrbfRwJ;
	dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGmy0Y69z3dwp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 17:58:41 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-3f8008cb772so2734081cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 00:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686211119; x=1688803119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uR4vGAi/HAsBM59SbR3YpKTHihC3NFHqV1mwlrVIWs=;
        b=GvrbfRwJpEXF0UUprcpAZJdJ/b/d7Ws/5/jJotwgMFcQJisi8DnObj8vX3sDGrE0Aa
         eTq6/vZfRVjQ32WZ5gh45Ezj4cOUPCCipmbMDv2uM0+rmf/W63IYRxcVk7O80yoVkszw
         nXiYhEnOnU10UlF0fT1eJrjjJmuGvaRUqIMYqpJHRtOClmYAw5yI0MDvuNGRBoXYCqwV
         2xY26viwzt13synhCLWvi4lgeY+DDDT0+GYfvOHCDWXeuKyfMmfBjNX0fxpFm7cP4Yub
         yrrCwkZvOmBnZ3D6PTY1YmGzs+7cU62WWcE93wUh3XzTeJe9PPwdKkqnaOlMJSxEoUiT
         3pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211119; x=1688803119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uR4vGAi/HAsBM59SbR3YpKTHihC3NFHqV1mwlrVIWs=;
        b=KRZHcSUtEWqCGR25lJF9sfPbZey9xy0KVZlUeBPoD1q1DLa1gkvhIpoVtuk6oBBcSZ
         IZcv0sUprIDZjedgKI7IUv/i5IB1lTHw9Xi0+KgK1i9ImLh3GJRCLn0v7EEDnI3Lbkye
         rZPLuda+vvBMpO+RVOfWv0xDwtgZTMAZCovXe7LilGsarFuViNXwlfaB0LSgF0CW3EMj
         2ApP0Bhtazc9bTHS1JAebSA1NLlnIGzJUDEOQ0BIcKi2n3htIfkLPYljXLZm/hS10NLR
         704CGQuDf/K7qXCUYFKwXvJEjTBfRvztQCQbyUJsoxuCdg211ht3oC7rR4s2HU/iWpIz
         +JZg==
X-Gm-Message-State: AC+VfDxU4EdhfXz88u/XSFde2WcosxrHeKT1ovWbbGR30DL5/esv3Tq4
	Hl5pHIU1efsVV4h/f/g2OsU=
X-Google-Smtp-Source: ACHHUZ52J1jHb+M/M/+4nUh1iyI5fsrCqpwzitxgH0ir7vG7XqcGRo1PiqB40N/R5HldTVTo5wvBag==
X-Received: by 2002:a05:622a:2c1:b0:3ef:37d5:49e0 with SMTP id a1-20020a05622a02c100b003ef37d549e0mr6059436qtx.21.1686211119213;
        Thu, 08 Jun 2023 00:58:39 -0700 (PDT)
Received: from wheely.local0.net ([1.146.34.117])
        by smtp.gmail.com with ESMTPSA id 17-20020a630011000000b00542d7720a6fsm673182pga.88.2023.06.08.00.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:58:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v4 01/12] powerpc: Report instruction address and MSR in unhandled exception error
Date: Thu,  8 Jun 2023 17:58:15 +1000
Message-Id: <20230608075826.86217-2-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v3:
- New patch

 lib/powerpc/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index ec85b9d8..05b4b04f 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -38,7 +38,7 @@ void do_handle_exception(struct pt_regs *regs)
 		return;
 	}
 
-	printf("unhandled cpu exception %#lx\n", regs->trap);
+	printf("unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n", regs->trap, regs->nip, regs->msr);
 	abort();
 }
 
-- 
2.40.1

