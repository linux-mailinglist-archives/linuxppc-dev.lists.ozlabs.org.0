Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CBB8998A5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:58:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mihCq5qO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9spJ6pjmz3wKR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:58:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mihCq5qO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sLq0qJqz3vcC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:37:55 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6e673ffbd79so1140273a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306273; x=1712911073; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/anYJVaYp4+LJwrTuPW6oFGib9vUgK/MVhC5XY9qERY=;
        b=mihCq5qO/Wm31dRSkWdNFzphq1YwDTi1X/ly1XAmZI/21uSCxOP/vNfaT1Emx1VpBd
         9lERQzJl5IOsZTcj/ohx/GM2rV3Bs+j9M0+1PURELQx4FRCoW9KE0Iybvqdlf0piGlww
         3xOQO9+YUdnvgwOFjCbIjMYBIdPWfyawts0ld9Z8MdpeMwUSbtrqIutZzYHz9RkxWRpt
         T4O4aJP76hs4athogIdm4nNhz6jml0r4I7w/Zc+D3zml6JhI+2qAkwf75mhbFgf0InZb
         E9RoUC0VebnJxCiM8MEY2xWtjaDSAf5JGfsVtaNb0eoLDrqARjqh99yLhxaX7BzPpEu6
         RAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306273; x=1712911073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/anYJVaYp4+LJwrTuPW6oFGib9vUgK/MVhC5XY9qERY=;
        b=nCfxaudIecWWiFpngclLENgu9/UYibOe8dt566cA4h8jURsh0D78REMLD47eUQtCih
         rl7qw9hXavjcCaVJSjc+igXGZcwk5UNu4P180yi9YJ9XRikrVER7EvX6BC9deZq/HM20
         ZssChzRZ0J54pjdYjHWApQYlnGI58c5IoCxcTCXchr3oIPzjIKkAJAoJB7OWNZKNz4VY
         OYcMJbFZ+AntPQtEcZYC0QV+ZsuYjQucTx2rv6Qf20gt2iomWu5YE8YDPoVtXdfNGFN+
         e8vCly/srnl+zAy7F2rU4arXTrq0U0ZVgxB1OE7ocrtgnv/8CbcYGxvozwewfr2g+g/j
         lbMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNNsz/KhXb3Q096X/t1Kw8CjR55+rjcPPaa9nnjy54sK+2JIsdR1XWz6TOBoSiNjQLLcXS0FU+/O+UNk0CQq1YdlBHdZBFZVZffFPTDw==
X-Gm-Message-State: AOJu0Yy6GfMtS9mCTekgaXEbndBDV9DXuHkgPTLWF5VLaAgbY4b/Cwvm
	g4OKXiV8DD4YARwKpU2+UMGCbrF9ntkbpRAd0BIDeAXnCZ1dW/80X+2lTfti
X-Google-Smtp-Source: AGHT+IEfFFniJ4CjxEZcpOY//2eHENbvegT1teSegPz3vIaxiVQ8+HEX0Tsj2qjjilKwI2bcCyeYVA==
X-Received: by 2002:a05:6870:15c4:b0:22e:a70f:158 with SMTP id k4-20020a05687015c400b0022ea70f0158mr910354oad.7.1712306273189;
        Fri, 05 Apr 2024 01:37:53 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:37:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 30/35] powerpc: Add sieve.c common test
Date: Fri,  5 Apr 2024 18:35:31 +1000
Message-ID: <20240405083539.374995-31-npiggin@gmail.com>
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

Now that sieve copes with lack of MMU support, it can be run by
powerpc.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/Makefile.common | 1 +
 powerpc/sieve.c         | 1 +
 powerpc/unittests.cfg   | 3 +++
 3 files changed, 5 insertions(+)
 create mode 120000 powerpc/sieve.c

diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 5871da47a..410a675d9 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -8,6 +8,7 @@ tests-common = \
 	$(TEST_DIR)/selftest.elf \
 	$(TEST_DIR)/selftest-migration.elf \
 	$(TEST_DIR)/memory-verify.elf \
+	$(TEST_DIR)/sieve.elf \
 	$(TEST_DIR)/spapr_hcall.elf \
 	$(TEST_DIR)/rtas.elf \
 	$(TEST_DIR)/emulator.elf \
diff --git a/powerpc/sieve.c b/powerpc/sieve.c
new file mode 120000
index 000000000..fe299f309
--- /dev/null
+++ b/powerpc/sieve.c
@@ -0,0 +1 @@
+../common/sieve.c
\ No newline at end of file
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 0be787f67..351da46a6 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -121,3 +121,6 @@ file = sprs.elf
 machine = pseries
 extra_params = -append '-w'
 groups = migration
+
+[sieve]
+file = sieve.elf
-- 
2.43.0

