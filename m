Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E34FE72796F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 10:01:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcGqg4vWMz3bTG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 18:01:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lNu60NmQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lNu60NmQ;
	dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGn14H0hz3dxC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 17:58:45 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-3f9c60bc99cso2237311cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 00:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686211123; x=1688803123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SitJ5tO3augZ5mGlwD1goyJVO5IvzDnfv+6964OUjXo=;
        b=lNu60NmQZamk4+o0ec1N8PDbIGk1O/S0oEK57aE+ctpAh/O4qp9WLIIAdIQezdTgiX
         o6Ls+eydA+EeRXl+0aMSt1v+rqlPrA4aCmvJCFpRCfxDUrDregweOKFfrf62EWjCQLRs
         KKC0mzeezLCu6YITWUrFJ8z1FtnFoDlD1YBMpcs4CPor/h7tmcv9pdFBaeBjjMiSi0Rl
         aphn9UhaCaPyGeR/eRaBtJCXXSHlJ+fxFeiH0x9P7TJyBFpLQXgd/wOBW285NCBPkvq7
         HA8ljJisYJhKve38fjWMDfgUeSelgPK8HaO3XjJSQcZdAHXUcbOxLKHqyzRNFQI2ozb1
         CMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211123; x=1688803123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SitJ5tO3augZ5mGlwD1goyJVO5IvzDnfv+6964OUjXo=;
        b=hrKhrl8e4KWUTWsj31/tpgwBVwhs+AO9xmK62CVkeyWqUIEBnDyq35eCjQrJUco9l6
         z6bMmrVrQ2ZpWNhcsJMPht6f8sI+Na1FuoU4KteQZlXvMO9m6KZ0IH8EllcvvDcGQqB8
         Bo7O+epRQb1Sq7FONGwWUAtFSBP7UdvQxiwhAka5A3cmNpwiAGKF4IVnlMSsahkjiA9R
         ZEJcqeA6Jlt19f2lws7RzlNs+Hf6H6ytiqKYzXMDWKUPeSdKjJEjqNvpdhpEDgC+EJK2
         9m+vt/ayJxEkHJUIlBydmprRBnI+5xoMUhRKwPj9IabfuK2duqTA8RNwIadwQN3RkfM+
         Zjaw==
X-Gm-Message-State: AC+VfDzhGF07PpkQMiWxYC4WYbodYdQtQGyl1YWPt1LpLhP/8GXefmQ0
	tWRpr5aljK3x+wxqXpYdgAk=
X-Google-Smtp-Source: ACHHUZ6ARW2uj8qdrOXuVbPRfj5ufKNurBN5yT1b4EYZi7j6hSHx+3k87AvpqLrJ8GzmkkyHtnbS6Q==
X-Received: by 2002:ac8:7d4e:0:b0:3f9:c159:2656 with SMTP id h14-20020ac87d4e000000b003f9c1592656mr5131373qtb.66.1686211122855;
        Thu, 08 Jun 2023 00:58:42 -0700 (PDT)
Received: from wheely.local0.net ([1.146.34.117])
        by smtp.gmail.com with ESMTPSA id 17-20020a630011000000b00542d7720a6fsm673182pga.88.2023.06.08.00.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:58:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v4 02/12] powerpc: Add some checking to exception handler install
Date: Thu,  8 Jun 2023 17:58:16 +1000
Message-Id: <20230608075826.86217-3-npiggin@gmail.com>
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

Check to ensure exception handlers are not being overwritten or
invalid exception numbers are used.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v3:
- Simplified code as suggested by Thomas.

 lib/powerpc/processor.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index 05b4b04f..0550e4fc 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -19,12 +19,16 @@ static struct {
 void handle_exception(int trap, void (*func)(struct pt_regs *, void *),
 		      void * data)
 {
+	assert(!(trap & ~0xf00));
+
 	trap >>= 8;
 
-	if (trap < 16) {
-		handlers[trap].func = func;
-		handlers[trap].data = data;
+	if (func && handlers[trap].func) {
+		printf("exception handler installed twice %#x\n", trap);
+		abort();
 	}
+	handlers[trap].func = func;
+	handlers[trap].data = data;
 }
 
 void do_handle_exception(struct pt_regs *regs)
-- 
2.40.1

