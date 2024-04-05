Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2938C899844
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:43:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eUshsrwp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sSm6n5Kz3d2m
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:43:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eUshsrwp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sK66sFmz3vb0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:36:26 +1100 (AEDT)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5a9ec68784cso484692eaf.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306184; x=1712910984; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioHEDmNSpPV3CVzPD4uBNP4il61ABDemBeuj9Mpla5o=;
        b=eUshsrwphLTYGOEFx6SXcnx4JwrZ1HzYxXWg5kxDxVpWAohSAfw0rbEChGdUSPEwBZ
         Ri43LojezpJu/tHWva7/EehTZNRyEZ3TA0BqWZPVqZCbAq3PqxzXsCM03zyth4E0Rcgu
         YZu4KDS1ag9fp6Q7i2Tr72BR3P2lzD8Z1LvGr1adj8iT+WB022m7i8E+KT5zdtg+eHlM
         OAuqF6xeWftf6PptTpJOXIjim0cQznU/ZbfEgVSbPCJTfb5O2ug7j02ddz35ojDu07U1
         fDkhEys3LPDj5yC4T15qyok0puVfbiQYoSDiEqO+eP5qf3nI28N5BS831dKv2K6mNfBi
         wesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306184; x=1712910984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioHEDmNSpPV3CVzPD4uBNP4il61ABDemBeuj9Mpla5o=;
        b=ri1f0CBpvZzOyf03tb40NLewhfeBQ8+o3gkJ7wtlvnjQrOV6EsXOpzvjVgTbeB9NJG
         95YhslIYSYZwezhtfyvaMrczC8JyjTasgirRjJRA6x9xtiU2lhhlhTmIPPC/2lGnPS/o
         deMPB3HG1wLLAD+Q5FJFnlk8kV/U5HIrKeRgs/xpz/lXz9SBn4G7ChiLkIubvuJxwxE8
         s9jCXHkBIysSvWEeR8NV1QQ3i2FXf8QhZOlk5EZ9alIUSSdqFYzbvzxQOQmK7PKQ9tZF
         x36hmCPq3sNj5lC/IYkmdCjiyq+4oRDMXQGHtgE6ymqxAEshkcxus8p97xA6WSafR6rc
         I89Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIeymrqdKrxR8nu7wnqaTZng7EoQ2sLTYAkFcf637u+8U6KANnhvj0VZvgsbINjRU8tJbmNQDFhz14oX0vIKFzXJ4dYRnF5hhzV6s3vw==
X-Gm-Message-State: AOJu0Yz3LIz+t+fz4Dpl6xEj9nJvEgUd890EzH2q2qXh2nAGWI3RfltD
	RTmzOGSf6uqUrZSYHoOGFIxk88WDtSD4r3A6Fs5YWzukeIsYDKcy
X-Google-Smtp-Source: AGHT+IF/HaACcR4qwBCyzQ99yORab14e4gy1iZuirZT+0brU69P5CDX/Z1F9DVMKNiS9oaMyU2PpYg==
X-Received: by 2002:a05:6358:7a8f:b0:17e:b887:5558 with SMTP id f15-20020a0563587a8f00b0017eb8875558mr1009509rwg.7.1712306184087;
        Fri, 05 Apr 2024 01:36:24 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:36:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 09/35] powerpc: Fix stack backtrace termination
Date: Fri,  5 Apr 2024 18:35:10 +1000
Message-ID: <20240405083539.374995-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
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
 powerpc/cstart64.S | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index e18ae9a22..80baabe8f 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -46,6 +46,21 @@ start:
 	add	r1, r1, r31
 	add	r2, r2, r31
 
+	/* Zero backpointers in initial stack frame so backtrace() stops */
+	li	r0,0
+	std	r0,0(r1)
+	std	r0,16(r1)
+
+	/*
+	 * Create entry frame of 64-bytes, same as the initial frame. A callee
+	 * may use the caller frame to store LR, and backtrace() termination
+	 * looks for return address == NULL, so the initial stack frame can't
+	 * be used to call C or else it could overwrite the zeroed LR save slot
+	 * and break backtrace termination.  This frame would be unnecessary if
+	 * backtrace looked for a zeroed frame address.
+	 */
+	stdu	r1,-64(r1)
+
 	/* save DTB pointer */
 	std	r3, 56(r1)
 
-- 
2.43.0

