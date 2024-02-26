Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D83F867049
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:15:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LlAvg69U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxMP2bfWz3vh1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:15:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LlAvg69U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxJJ4KKFz3cgJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:12:48 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e4e7e25945so1185117b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942366; x=1709547166; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shnB3ixuxx3Kr4XN7+1/U2M5BodUI+jg6wVI3q2X2XY=;
        b=LlAvg69UJzcUIwqTHCq4m10d8vqRDjACn6+u0nSZeoRVShIMMfyA1uevq5hPBcWqn/
         fos2HIoEMHezI59s1KYViewcx6wvXZIHy3YNKQ5o3ybAguSyvupiXKidBt8cPhja5LwU
         i65IePYXJs+3k/IebUALtb/jUu9HQ30dZE+xWlUQI8y1131JKuPuczwJimS6grYifWM4
         NhpN3ppi8/ui8Q93WZ6xnIkNVxklozzrSjptwuyKfuB5E8PPccz7bBwZR9KHQ95SKYOr
         HUvZfPDsin3S1kW5xlESUO4UZvFsFvjZgKokGZqbubIvm2Fc28ZXXHeSMyMgix9zvV5i
         cQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942366; x=1709547166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shnB3ixuxx3Kr4XN7+1/U2M5BodUI+jg6wVI3q2X2XY=;
        b=rHmU51kUECUk4r76TdkhDBrYe9RC6FsDQVoKSUeI7eIZzkdcTi7Ye1iy90D80ks4Hc
         43t+LVwa8P7MKA598cKcqrsXZ5V/9yqZVDAUG48iTNEx6HOUWrs00XnfQnFxYu+aeJOz
         Y1BE+mpXpduOQ6p6iaVOihqop5aRd1MXPsQC8pkRkF08VkpYzvE5uhIXNeB5eQ3k9cKq
         XcY2My4RCPsCK0l25vzXtUMbAIoaFfqIZUhlvaZTHC7CJReuSAWJ65hzrCmMqntrCNGY
         4M3/XHf+qhPYStr8hRAGRu0TZAhS4RzaPMGMv+/QzKp1Z0OZ4Rx5XB2KfN2Skc87lzWh
         licg==
X-Forwarded-Encrypted: i=1; AJvYcCVHs7N0zOKM+VmgtGVnU4h6Thzcq2DISFsHwYY9NOnP9D5w1kBsjxJJF9I4vKeYvoXnCD6lSta3Qqm/qpTWsyyTclENgI6Gk3kWt1D49w==
X-Gm-Message-State: AOJu0YyhHcRr+mfPlSGOKEsCRJ53TH4wiWflqpUXYHPoIy79Wlhnmvwx
	NUmrhbHWPuQhf+KqQnjidTl0fPLACb6fKsOvDAn5YmzWxP1sm7YK
X-Google-Smtp-Source: AGHT+IFbe53n97yqDfweZxoom0Dd+DN8TQfpYMvjWilXLpYWRPk9UDIH5PI6pg2py4hep8BPKcZ4Jg==
X-Received: by 2002:a05:6a00:1949:b0:6e3:1fde:cb72 with SMTP id s9-20020a056a00194900b006e31fdecb72mr7900566pfk.23.1708942365663;
        Mon, 26 Feb 2024 02:12:45 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:12:45 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 03/32] powerpc: Fix stack backtrace termination
Date: Mon, 26 Feb 2024 20:11:49 +1000
Message-ID: <20240226101218.1472843-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226101218.1472843-1-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
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
index e18ae9a22..14ab0c6c8 100644
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

