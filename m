Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4658BBB3C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:29:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jZQHEAZg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWn6n1yXFz3cBK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:29:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jZQHEAZg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn621LRfz30Ss
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:28:57 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6f3e3d789cdso485649b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825735; x=1715430535; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I25dR1hp7l0QjjFDNAfUmrV/isLz0uJLZYj3XaBOpYk=;
        b=jZQHEAZgKDIADYpuoInYGlM8y0n5WK+cNWKaykBL4+ScxvUXd8vDcemCrf45hZ7qz+
         sHCyNELzCUsrdBT1N6eO0ScCPVZ36bgoMbIoetQ669OOPN4O+vfmSTHx9hKz3EQ4hyWJ
         L29TW3JQXqsJQUfy5JVWh2jq41HC2ncxTzRUVkV+dWOM2QeKztAJK2FN7dPZPz5SKsGK
         7pdwE8+RqtBRrCpoUSxs6C05yeNB1WHdkQ73UELX9IebiX/jsw2VOyffi03oGDv2mLyy
         Gjt97GVKX90GFQqt6CvFYgD7QlpQoIEc43fM1j36gdlytVfTEAdOBCfRo5u50oKuxON6
         owBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825735; x=1715430535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I25dR1hp7l0QjjFDNAfUmrV/isLz0uJLZYj3XaBOpYk=;
        b=lwoGyGPJ6MRPuZo3cD2wnzBVLKxSQ98NrQt8VXZCjYflwSvyeuPwlqRJG/qiRyFPpe
         lWCjSujAQ0phDxf1dw8GoMCVoh0613TkTm79x/Cn35UZIeApiC84U16zZXxvmH1NNITh
         /QYhwMrQ0I8bWqCgNfvnakk45vGF8Mpqr4Mq9q7V8zwAXHzfoJIe8nf5xv1y8H96rnI/
         LXvavm3LPWIpOChh7ifOuswMUNx6o8c56clwKJ7RSYORfgwRz7+RrEbzyA8qlLJIBWDc
         9aWDrBg0UXQGlnJTdig7R1dUAKfhSMwjZJvdrtyPM6NiMyz2z2rIlEAZCNzNW2O4rM2D
         tp1A==
X-Forwarded-Encrypted: i=1; AJvYcCXo/pAyH2BDSeuntlKkV3Wyszxh9gfIMtkSJco19bFqeDx6lo4BeJPlGTK9dA0HKb7mhBsoueslwsglsmM2KwWQZ1+jCpjKlkMsIGUOyQ==
X-Gm-Message-State: AOJu0Yy3f1FURg45CXSE+VGxxHwMcO6PbXYAj41A0dnD4T0AOtL0ET7C
	bWrfR1BKXQGYuiVWr+RNzI6kbbFYhTcpUBV3/uVj0AEQSwx1wPor
X-Google-Smtp-Source: AGHT+IGaFaM98B+g3awhLTc0POSb1Mkk5D3cQDh3d7Qwnrc2vPOZNBOGQtUtLg4E7fAYXpIWmzWJXA==
X-Received: by 2002:a05:6a00:18a0:b0:6f4:1799:c714 with SMTP id x32-20020a056a0018a000b006f41799c714mr7186679pfh.12.1714825735365;
        Sat, 04 May 2024 05:28:55 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:28:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 01/31] doc: update unittests doc
Date: Sat,  4 May 2024 22:28:07 +1000
Message-ID: <20240504122841.1177683-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds a few minor fixes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 docs/unittests.txt | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/docs/unittests.txt b/docs/unittests.txt
index 3192a60ec..7cf2c55ad 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -15,8 +15,8 @@ unittests.cfg format
 
 # is the comment symbol, all following contents of the line is ignored.
 
-Each unit test is defined with a [unit-test-name] line, followed by
-a set of parameters that control how the test case is run. The name is
+Each unit test is defined with a [unit-test-name] line, followed by a
+set of parameters that control how the test case is run. The name is
 arbitrary and appears in the status reporting output.
 
 Parameters appear on their own lines under the test name, and have a
@@ -62,8 +62,8 @@ groups
 groups = <group_name1> <group_name2> ...
 
 Used to group the test cases for the `run_tests.sh -g ...` run group
-option. Adding a test to the nodefault group will cause it to not be
-run by default.
+option. The group name is arbitrary, aside from the nodefault group
+which makes the test to not be run by default.
 
 accel
 -----
@@ -82,8 +82,10 @@ Optional timeout in seconds, after which the test will be killed and fail.
 
 check
 -----
-check = <path>=<<value>
+check = <path>=<value>
 
 Check a file for a particular value before running a test. The check line
 can contain multiple files to check separated by a space, but each check
 parameter needs to be of the form <path>=<value>
+
+The path and value can not contain space, =, or shell wildcard characters.
-- 
2.43.0

