Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9C78BBB68
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:35:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QvKNcIvV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnFc73VKz3dW3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:35:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QvKNcIvV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn6W2jZRz30Ty
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:29:23 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6f447976de7so456803b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825762; x=1715430562; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2oN58zMGF7viCDdv81NUvK9SW9hozVqH9VBnYqZITI=;
        b=QvKNcIvVVN4pI0yGHj0BcQV3KIaLPWZXwTF67MyfYPsvi6jCB25PyoDP3bEd5odZoJ
         ghTxVx1bQhwPGCNDuo3lJ2nJB9wXo4Y18d2gNNoPuAdFN3CWEq7YZJkQ547/FwuCttlk
         vZv7aK2UAEG47o9TN/oQ+Ucm2U5ySfbOBJ1HfBbDeAIBIwt4EfbnMDT/73ubgToJXpb4
         44tq8ob8B7qmsFm8BIEN/jWcGS8C+5rkrzNJ59tjYr6lepkWfdUTyfYZBSrerQ/2hDuI
         Ye4azxEer2YTWOvI/3HSRwT8FtxQYlehSPi3DCNkJO2nXh2MI40bDKgAvEdxE0b6NVe7
         VzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825762; x=1715430562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2oN58zMGF7viCDdv81NUvK9SW9hozVqH9VBnYqZITI=;
        b=vKGPLEiGtgByLtVmL6RXWOOftOMHa/fXzwYRE/z/O5tTzLpoK8TqImT8umLk92a4Fc
         VUU8lM0RTbdsE936hY0UAhJNatf82N+LRXUM24pveb77XVntCa0z8/KEUYEpzpQ0B7Q7
         L2UQMGQ0D9Flg18buy/v83FYK7wpbxpDmAututJtGFxkySYLhJNQuAkNt/ZQH5FRekTK
         k5ofWmtlGGptV/CdK5eTbtxyV/fyHU8zOpTRi0oraWH7OksJnYqG3Lm9rQI7J0A8F2Sz
         TsviGMcDzTe/VvpjoLqC/KWkd1e00bMJgwMaaVvK8++MP97N/wsbFkZvv3niOFx6zgeJ
         e0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCV0RvhrEZRh8QjIcMmsKO9SXdMhelDR0nAI3kyQEm6zEy+ImL+CNSp7+tnnnrx/hLlASxo17WvdxVWjWwR6lKYgsZRP6WYLOD3jsnxHyw==
X-Gm-Message-State: AOJu0Yz6CcjRvcwdOhAfw+9seeOYXWOEljhfHUlWY+jZmc89EJtuHgmu
	Uu2hVss2vWRmXU257ghXqInDMd2IsdFyC3+KdEtBJZrBR+yQXWTO
X-Google-Smtp-Source: AGHT+IFpF2KbAJADbX+vvZ9NgIXRALb0JcOtlo9568C/7j2tvWKU/CYfftgPnveWWLcunWzlgXYF+A==
X-Received: by 2002:a05:6a20:8410:b0:1ae:3f11:328e with SMTP id c16-20020a056a20841000b001ae3f11328emr5818088pzd.20.1714825761811;
        Sat, 04 May 2024 05:29:21 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:29:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 08/31] scripts: Accommodate powerpc powernv machine differences
Date: Sat,  4 May 2024 22:28:14 +1000
Message-ID: <20240504122841.1177683-9-npiggin@gmail.com>
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

The QEMU powerpc powernv machine has minor differences that must be
accommodated for in output parsing:

- Summary parsing must search more lines of output for the summary
  line, to accommodate OPAL message on shutdown.
- Premature failure testing must tolerate case differences in kernel
  load error message.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/unittests.cfg | 1 +
 scripts/runtime.bash  | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 699736926..f562de9f4 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -4,6 +4,7 @@
 # powerpc specifics:
 #
 # file = <name>.elf             # powerpc uses .elf files
+# machine = pseries|powernv
 ##############################################################################
 
 #
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 0c96d6ea2..4b9c7d6b7 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -9,7 +9,7 @@ FAIL() { echo -ne "\e[31mFAIL\e[0m"; }
 extract_summary()
 {
     local cr=$'\r'
-    tail -3 | grep '^SUMMARY: ' | sed 's/^SUMMARY: /(/;s/'"$cr"'\{0,1\}$/)/'
+    tail -5 | grep '^SUMMARY: ' | sed 's/^SUMMARY: /(/;s/'"$cr"'\{0,1\}$/)/'
 }
 
 # We assume that QEMU is going to work if it tried to load the kernel
@@ -20,7 +20,9 @@ premature_failure()
     log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
 
     echo "$log" | grep "_NO_FILE_4Uhere_" |
-        grep -q -e "could not \(load\|open\) kernel" -e "error loading" -e "failed to load" &&
+        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
+                -e "error loading" \
+                -e "failed to load" &&
         return 1
 
     RUNTIME_log_stderr <<< "$log"
-- 
2.43.0

