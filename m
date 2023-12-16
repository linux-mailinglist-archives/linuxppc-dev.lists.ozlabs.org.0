Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 613338159B0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 15:00:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WBfRgsmM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ssnlq0XChz3wBT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 01:00:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WBfRgsmM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnQ13X2rz3cXw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:44:41 +1100 (AEDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1f5bd86ceb3so1137490fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734279; x=1703339079; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm10TTUq6mWW/19mEp6XGWD63KvKGyPKlCPKzISaymg=;
        b=WBfRgsmM5dVN5PRmKlVrXNqwvYQfZKOfbc9shxxGU9ldUi3m7kUiATutmgdTfSx2zw
         WM2dnUng8O+QE382tnvrhEl0HS3K58AvueTxWadnBk2RQ2ED8AMkFFYJE7VmYL/3Cp6n
         w2vsO3fxM0u7wrYWWzu3pgy5TSe+tTpI+0yBa5i0Bk7GM8buWEjS412yKhAdOuqL8GVZ
         zxVtA5liYvvWclC4/yLEroL8T5eT7UHLF565yWlyRnkZldpRV68Nadm++ZVWWb9JIYIE
         gTKdtTp9pxbYh80khosu8KyE19nyQY8vZirvM4ZkCR15gfhxgCTRMfgWkByOtTr2bjtx
         YVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734279; x=1703339079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fm10TTUq6mWW/19mEp6XGWD63KvKGyPKlCPKzISaymg=;
        b=j51fKtTwxD4V07WK27AVJASkekEcd61E/qxqkfHggs711hRtnOACrV+P8PRQDED8IR
         MzEUh6tyGmGlgkc/ggI033x2GrF8T3ooAc+T8SqxR95/oWpzOe2z/V7hL+VihQvOpOuU
         osElm7QEPqIuOsCsWwdqPjswWuoESbmxJdiic9Y2MQx7Uf8+6xYbmdGW7IIa06A6rpiE
         d/a88DtuUtxEgwKlff9wYmpNUil6/h9A0F2TZmREu/HjvbUzFPNuKBwsxAQLplDInQBa
         oirq7sl5lnaPHLISvmKJyQuZNsXuT6ohoZMkMQseAa7844XIkONnquNKeUoBypQI5+sQ
         Qehw==
X-Gm-Message-State: AOJu0YzZAjJnF3X77uKOh/D/bxTcrpqd6Dni0HKXbvHbr4cetTsrz4Gb
	CRwgVusDktnEDzuyUBVLZik=
X-Google-Smtp-Source: AGHT+IEu7RSyMnW4RxFNlfg1dfk2N4v3nEjECprIufH7yM1SIl3U9tY/jVgdlxjeUNU+LDNh59sadg==
X-Received: by 2002:a05:6870:206:b0:203:8daa:2c2f with SMTP id j6-20020a056870020600b002038daa2c2fmr1577687oad.45.1702734279517;
        Sat, 16 Dec 2023 05:44:39 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 20/29] scripts: Accommodate powerpc powernv machine differences
Date: Sat, 16 Dec 2023 23:42:47 +1000
Message-ID: <20231216134257.1743345-21-npiggin@gmail.com>
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

The QEMU powerpc powernv machine has minor differences that must be
accommodated for in output parsing:

- Summary parsing must search more lines of output for the summary
  line, to accommodate OPAL message on shutdown.
- Premature failure testing must tolerate case differences in kernel
  load error message.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/runtime.bash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 0803d02a..96756a0d 100644
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
@@ -18,7 +18,7 @@ premature_failure()
     local log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
 
     echo "$log" | grep "_NO_FILE_4Uhere_" |
-        grep -q -e "could not \(load\|open\) kernel" -e "error loading" &&
+        grep -q -e "[Cc]ould not \(load\|open\) kernel" -e "error loading" &&
         return 1
 
     RUNTIME_log_stderr <<< "$log"
-- 
2.42.0

