Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A490E8159AE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:58:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wj4H2S2c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ssnk32YfWz3w6y
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:58:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wj4H2S2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnPt23jZz3cXc
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:44:34 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cebbf51742so1155647b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734271; x=1703339071; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOKTCvhQ6ipHH9JB0uDwBswIVZydiLt1fgVOnkOxwyk=;
        b=Wj4H2S2cNTuFnDGLFZoxn3ULf9weKVVyjVqap8bdm47wDBsVSERU8C9uXWOCPWnKHQ
         NKXuguy/56UbOLzwSxkd+cMHFMFlpNFooZcYOQuEmjIxxSTPzHbYu8Ro+azQRvwkkEbH
         rhaqxZpTXVG1I8b1FCrnrcuNomQLAiATxN0OS9Rju0m9+ISm28BXY+CVki2gOt5p+xK3
         me6O5pRIdWtgIwy1IID1+gI574yh0riRd7lmIMjeHi4MH2KJ3WmyZ51gzB4ziPJDKn/9
         MKmsENzoRS6OgA7AmyiFXYkWE4WxstK8tOoa6DR2a8/MEuA0nc3p8uADnWvQBviRpsA6
         IrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734271; x=1703339071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOKTCvhQ6ipHH9JB0uDwBswIVZydiLt1fgVOnkOxwyk=;
        b=aD0NOIeQyA7nCIqrTEFfF9938RQ/1GRt7mq4tHB4zWlWbaRpiu6q0nfHqER87f1etP
         j2MB4BVarPpGDJ4WXq+x+rDZVDm29lcuHRwvTwDQIqIOWrmzk3VVpKN9MUNZaRZrXUla
         KI9tZvHPQ680qH7ydQXRfVFiqKaPoyivAW9tlq2kHgClEAmUKkYlBzGP7zXqoZiZIiA+
         0FlFGtJapfOyIJfaGo5LIdSFPLn7NlN2JIWSoA8dgLmK3632HQ2NS6dCIxwmicoTdkZo
         Mw2BHQfchWR0WPuRo197BRs78231kx3girt+qhWrD9KR9S8OcwgtbSDq1NBlTZjk3/L6
         GvOg==
X-Gm-Message-State: AOJu0YxjWEql7Xmz5sB2kVYRjzqWym+Y4Zwx0p9X/8M6fbowU9jD74Lo
	vWYhUA6hQSRdkc+wuFpKE08=
X-Google-Smtp-Source: AGHT+IG7hj9sLGXeYZkKkH5H5pl8t2utTIqzTJglNneFlWrNdlyX5SMkMWDraLPFpWFBSb4KQOkLhQ==
X-Received: by 2002:a05:6a00:181f:b0:6ce:4587:4d7b with SMTP id y31-20020a056a00181f00b006ce45874d7bmr18751595pfa.24.1702734271361;
        Sat, 16 Dec 2023 05:44:31 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:31 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 18/29] powerpc: Fix stack backtrace termination
Date: Sat, 16 Dec 2023 23:42:45 +1000
Message-ID: <20231216134257.1743345-19-npiggin@gmail.com>
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

The backtrace handler terminates when it sees a NULL caller address,
but the powerpc stack setup does not keep such a NULL caller frame
at the start of the stack.

This happens to work on pseries because the memory at 0 is mapped and
it contains 0 at the location of the return address pointer if it
were a stack frame. But this is fragile, and does not work with powernv
where address 0 contains firmware instructions.

Use the existing dummy frame on stack as the NULL caller, and create a
new frame on stack for the entry code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/cstart64.S | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index e18ae9a2..14ab0c6c 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -46,8 +46,16 @@ start:
 	add	r1, r1, r31
 	add	r2, r2, r31
 
+	/* Zero backpointers in initial stack frame so backtrace() stops */
+	li	r0,0
+	std	r0,0(r1)
+	std	r0,16(r1)
+
+	/* Create entry frame */
+	stdu	r1,-INT_FRAME_SIZE(r1)
+
 	/* save DTB pointer */
-	std	r3, 56(r1)
+	SAVE_GPR(3,r1)
 
 	/*
 	 * Call relocate. relocate is C code, but careful to not use
@@ -101,7 +109,7 @@ start:
 	stw	r4, 0(r3)
 
 	/* complete setup */
-1:	ld	r3, 56(r1)
+1:	REST_GPR(3, r1)
 	bl	setup
 
 	/* run the test */
-- 
2.42.0

