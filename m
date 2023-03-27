Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 709EC6CA48E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:49:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXgn1qvWz2xZp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:49:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UOf308or;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UOf308or;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXbr4lqyz3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:45:44 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id ix20so8320148plb.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7HUQqjeCU9xxuess/BilVQvbPRHx3dfJR9GG39px60=;
        b=UOf308ory3UnOGfi0PppTTQd7l5iXDJJXOaxA6/53htATAsUcWi/We6wwXVeHhDadl
         KR/XXgSVvCNdsEarceCq6hKlDXUjc7G9tfM+vJwi/rCfFx24jmfUK/ZtHA6uNMniaUsv
         /goXX4MzK+JVFCPD9SdTSSYPzyb5MFPzgameZzb8EWG7BCHFNJ4Im917gz4iDZrDZECG
         PH1EPumyz1rGjxgDmnj5n37JeFxGm/5ayABe+bU5v6RReWvOIqfYLDSguYSeAu06P/cC
         dgNkntx+cOn6Hh/eZXt/6HpfRFzOOe+XjcGOXOeHpu4JJtQKkK1vNZjYcKXbO5LGswok
         3uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7HUQqjeCU9xxuess/BilVQvbPRHx3dfJR9GG39px60=;
        b=lr1eVC/3835JNN5Pog2VhynvZagvfp06WDqo49UCW60R18ma1t3SXuQ8ClmY2lTFer
         HR50rsiZ9Rjpd7zijc1RIuMjCa1QK51ec1FGbhrIjz/ilj8EhmkeVCcLqqV+xzKU67Gk
         ssvc1oG4YejQvCIzEWZ8eZlbrXSeJzcH8kOyhPU7V5OE6LWPQnzaQhgc+Slk5tYjWFBv
         aIwC1ae/T5y98t8OucJKxf7k/KjJPFUPYZI5YjfFIR2WuYUEgYCpjwOgOHawag+exkhf
         i4D5yiubJAJMVKWiaxpKe+1Mf1j+AipJPCwAad9ZJCCQb+5yuFahtdbmCjAoR5MEQDVT
         ZZCQ==
X-Gm-Message-State: AAQBX9fb+30eI9c7kNnLQWyr+MEGsN1dPdy+Ot2HpZI0oWP+dNJEzBFt
	BZO2q2Au4QzGMl2BEbEHJmI=
X-Google-Smtp-Source: AKy350ZlpykYBDTbMnh8Zc7cbnq84TrAxlt+o7ve/mqys3lx8wvRjCBSVzF465oCXKa02Ccfxeu3JA==
X-Received: by 2002:a17:902:e5c8:b0:19f:8bbf:9c56 with SMTP id u8-20020a170902e5c800b0019f8bbf9c56mr13752162plf.3.1679921142323;
        Mon, 27 Mar 2023 05:45:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id ay6-20020a1709028b8600b0019a997bca5csm19053965plb.121.2023.03.27.05.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:45:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v3 03/13] powerpc: Add some checking to exception handler install
Date: Mon, 27 Mar 2023 22:45:10 +1000
Message-Id: <20230327124520.2707537-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327124520.2707537-1-npiggin@gmail.com>
References: <20230327124520.2707537-1-npiggin@gmail.com>
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
Since v2:
- New patch

 lib/powerpc/processor.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index ec85b9d..70391aa 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -19,11 +19,23 @@ static struct {
 void handle_exception(int trap, void (*func)(struct pt_regs *, void *),
 		      void * data)
 {
+	if (trap & 0xff) {
+		printf("invalid exception handler %#x\n", trap);
+		abort();
+	}
+
 	trap >>= 8;
 
 	if (trap < 16) {
+		if (func && handlers[trap].func) {
+			printf("exception handler installed twice %#x\n", trap);
+			abort();
+		}
 		handlers[trap].func = func;
 		handlers[trap].data = data;
+	} else {
+		printf("invalid exception handler %#x\n", trap);
+		abort();
 	}
 }
 
-- 
2.37.2

