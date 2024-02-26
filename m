Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D2F86711F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:32:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CfA9dYgU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjxl10xQGz3wTN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:32:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CfA9dYgU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxL84sF1z3vZT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:14:24 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e0f803d9dfso1876402b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942463; x=1709547263; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WD4EgWO6jWpsny8sTO916nRWmkEIJB0yBQp0dWHoO/A=;
        b=CfA9dYgUmyQ2MelOfLaDXJh8rimfzkXhxLycfQ2x97h6KHeDQGOZDsiNO2oi+b8+pS
         lEOTwi9scvi6YB8Vn0ooQ9g8rCJVkWrFH/V0w1VCyjZsSRxFuo0amZmNxCpCwXxJau4z
         ao1aYU1qeaOy7ndbQ90fVLjHUhe5e9XA7ZsVsIrQdNRNt5bowXD2lSi7VHeYOEB+aZXk
         BmNA+NUp1vx0r554/F9iC9t5ENGwAcrKkHU5UspgkJgsUNWj7UDbAxJs0UfmiYXHeWWS
         pIi2AZOfDXPpaBE3USTJPyaUpElqWRRIEjl+yOwlP8KFDuD7W0arRIDXwHwv4gxd5sWm
         IpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942463; x=1709547263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WD4EgWO6jWpsny8sTO916nRWmkEIJB0yBQp0dWHoO/A=;
        b=KGhy+l8Et7eh10mNg2gCo6Shz+1IKTXwB+sFYnhR0rUgL1d+p5s8NxvExFo4bBNpU9
         CW3tAdPglL25Elju33CWQO9lpHrVw4lNxA08yW+Sp/oibeSHNro8DVd2hl92tpayqMEy
         OjgD2ikxW0FCMHPKOshXjot/gX2XW9vdS141SVpgBdLyQt1JBpYKz0dqbZriguShRx7N
         Tbz2cH0MqgGLWw1ZhJeiYsEqBO4ZMG4DSQByaQGoIVZaLjMxdfJRgRVXv4xglfp+T5CB
         8don0vjemw9jyjZqA2itwlu9riV1ilclAvaeJUQebXb6DC+XS4gnd46n77596n/f04nM
         QeGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7r65iBBBkpim83ZQwfwN4EPT6jpXTkdlHnWPVxLvtwECftLVGmS0O7DRx/FQHoQ/n1Z8LVAWYnM4WwqOIDX6KRwZGu1aYqYWf9FrH9g==
X-Gm-Message-State: AOJu0YyJcr/zeFW7OHDz/M3LO5gBnmasp660awREx/hnUvt1mR4/v2ZZ
	heq2udNMIDhEQkBIyx8r8Vg0kw6aFZfX4/QvWXLoDHxuX5fj/x9Y
X-Google-Smtp-Source: AGHT+IHa8gV23iRmCxzjDwE6B3Lo408Yo9xJnued9ZFME7J/7f6BXEdaCNTXLkFlJXnHIDSxz4g17A==
X-Received: by 2002:a05:6a00:b0d:b0:6e4:84db:e30e with SMTP id f13-20020a056a000b0d00b006e484dbe30emr6346753pfu.32.1708942463024;
        Mon, 26 Feb 2024 02:14:23 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:14:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 26/32] powerpc: Add sieve.c common test
Date: Mon, 26 Feb 2024 20:12:12 +1000
Message-ID: <20240226101218.1472843-27-npiggin@gmail.com>
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
index 3ebdf9dd3..008559b43 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -136,3 +136,6 @@ file = sprs.elf
 machine = pseries
 extra_params = -append '-w'
 groups = migration
+
+[sieve]
+file = sieve.elf
-- 
2.42.0

