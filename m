Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 971DB86708A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:20:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M6WU5C/0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxTK31P6z3vx0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:20:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M6WU5C/0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxJt6Nypz3vXc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:13:18 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e4ca46ab04so1527791b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942396; x=1709547196; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzMbIs3gJ3U5zsDc5LA3bRRA3z8B3P/c5K9+wo8IYO0=;
        b=M6WU5C/09Sa969PDQGTCXLSLhI7FJa4UKOdjcpc8km/nzrTDpd9gBEN6OiZeWFohmV
         6mS9q+2xa5Nnwu3HY/qbaaSPL2oXC11SLmBHfcJrNuje7KdvcT3o+dAuWfHQ7k180yna
         GN7gTz7wMnsxRo0QsOocV2TzUYlHztYnVcz5GZIOlO8813Aw6bhtSKjNXyzz5T3MVhkf
         6D+IWfR4UIg8Qdq/knu6zRrM8aulp7cf1jnqYnWiOpjsE5LH1AbFEtY8A/Umpn3NW9gh
         KIa2u/QFu2ksRPmFWjMHuNA6T6dlv+tJNq6YSF2kRzwb3XEh6GmMBnCUUvDKSDsHPPJ8
         rcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942396; x=1709547196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzMbIs3gJ3U5zsDc5LA3bRRA3z8B3P/c5K9+wo8IYO0=;
        b=HS9I7+wLbw/gOICmlU1LLIYZN0cowWPVSRsVaIX/uokL82OLRLNLUR8Ezd+8UEF481
         mZ+glnicxXj75Bs0Hybgqp8pOzTI/uQ74iw6EPIgk/v5pjc2ToXyRVJAebG0VHsPY/8m
         zqHp2+o5+kZvylR8WnUp402K2S/Sb+Oi61XDsScVVQuzel9wChp94fIq6UzIthbR9Wf3
         ctSbtRdNpjZGVrD+X2Fbq5PpHVADDcZtQkV/+8b7pB5abENlPtjp9fT3SecoxM5x1nah
         iZGDB43VmLVO6GzLOXToo00l5AEhtHNiEBuXBGFmwBnmgbjxhNwwsdPFYDw7CgyvgzWU
         cHHg==
X-Forwarded-Encrypted: i=1; AJvYcCXZg18jGB7wcfa4ESLevgSR73L+V4i/gtF8oligMkfxHpooYJPI8HTOd750ElBLyJZqRW6KEfphPVb6deS4VHi+BF5TH/RE//GnzRM6Iw==
X-Gm-Message-State: AOJu0Yw61aX0n68YXgVWUSWlb8w3VcFbWhoq4Pyc/foiFcD4lV6hV2+H
	b/TprKfD2FdFZ2ehesRZiwPAw2ir9f9TArb7hDQs2JAavBVOel2Y
X-Google-Smtp-Source: AGHT+IGyoivjogRgGhhisbrK5W13r/wcaKqQ74eXnDeW7mVKgvAo2Cmj7WGfqlnuQGa7jYEqzuKqWg==
X-Received: by 2002:a05:6a00:23cc:b0:6e4:cdb2:636f with SMTP id g12-20020a056a0023cc00b006e4cdb2636fmr9145539pfc.4.1708942394954;
        Mon, 26 Feb 2024 02:13:14 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:13:14 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 10/32] scripts: Accommodate powerpc powernv machine differences
Date: Mon, 26 Feb 2024 20:11:56 +1000
Message-ID: <20240226101218.1472843-11-npiggin@gmail.com>
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

The QEMU powerpc powernv machine has minor differences that must be
accommodated for in output parsing:

- Summary parsing must search more lines of output for the summary
  line, to accommodate OPAL message on shutdown.
- Premature failure testing must tolerate case differences in kernel
  load error message.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/runtime.bash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 8f9672d0d..bb32c0d10 100644
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

