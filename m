Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48647899861
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:47:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ifvRJE6e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sYq644vz3vXb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:47:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ifvRJE6e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sKY0Ddgz3vck
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:36:49 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6e6b01c3dc3so1164852a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306207; x=1712911007; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPh2KrH1pN0KnvIbdchGvxk45KM224D/ayF8HNf5mvs=;
        b=ifvRJE6eg1TkZ4oV/Fi+ZlHP62xkhxhxGpFBY2CJ2qCxs1/3wrPr0arQRa1rrKM5Xi
         1f3XMwjZ7+37iD8QzwYz/qO8O6qDUhLrwGxuDrF/aS0C2ICFZY/hzSu3Hz+XbcvwYduE
         IwABv3nDOcoMiDapWPtRFXzmlhnZHeii1+aWwFJ2EldXuiCWVpA7Y3Aep1Oy3WS6WkFF
         EcdWTNhLM2WPk1DlV1y9CNdgm4aufMYDnHVlqJr4zuZdGLUklStBu7Qy5PvDSDK7po9i
         9nXtnEfWEcFNcQaCzUmPYDgux0Zxmi2NDlRJNoANTZA8WxLY5xmWuir+JyKkXdeRWLid
         +C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306207; x=1712911007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPh2KrH1pN0KnvIbdchGvxk45KM224D/ayF8HNf5mvs=;
        b=pB1Z4By+vMNuBrkVhLbFdtCeAUHc/dkE4g8frQZbhOFSv7ks521BLvz5sLhyQwifQz
         TFyDCyd5GMW9UDVEX+HnRk2trOSZS78d1FHmubYtuAxKEHHQcoaZbs7nh2w8l1XDMn0o
         TPD4cOzQdVzwHs8gg6F2e1YAr6llaB8An+6NS8QVBc37J7+SitK8Dau+bYAZjlTfkhE7
         vSBil/6TB7eLM3z/MrpNTs8PTydfPoBd60+mIvpeqkocan4u+4rE5GmLnMfZgPgwVn55
         EsmQcMKtlWoo1lMmTt6q8bkdLi3whWwBcqypOsg4CDLUcrYFK5VdtFrXfEiy1PauJkzP
         dbyA==
X-Forwarded-Encrypted: i=1; AJvYcCUm58Frr6Ru6miOrJvGZCsRxUJl8a0IVAtmUycqMe+vLFlZdDqfROcdP49IjEV7gCWeAYpW1/fGf1wd0c40Lh1xaBJSV0aEXeqVkTq8gw==
X-Gm-Message-State: AOJu0YwUYvT283woMt5Urbp8sREpN6D5OsevFBS3r6w1Bg64Y8Lz6M85
	+/oWXlB5/fjIg1LP91GP3qI8CynCs1gTIGlDNxP2l0qS52mVxlFR
X-Google-Smtp-Source: AGHT+IH9gewYhR3dPOmwrOod8u5lYCnhzL769heby6OhTBOHLGjReCvX+OFbriDPQRmb2zonSVKtKA==
X-Received: by 2002:a9d:674b:0:b0:6e6:ce61:3ee3 with SMTP id w11-20020a9d674b000000b006e6ce613ee3mr737004otm.18.1712306207099;
        Fri, 05 Apr 2024 01:36:47 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:36:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 15/35] scripts: Accommodate powerpc powernv machine differences
Date: Fri,  5 Apr 2024 18:35:16 +1000
Message-ID: <20240405083539.374995-16-npiggin@gmail.com>
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
index 432c81d58..4929e71a1 100644
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
index a66940ead..e4ad1962f 100644
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
@@ -18,7 +18,9 @@ premature_failure()
     local log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
 
     echo "$log" | grep "_NO_FILE_4Uhere_" |
-        grep -q -e "could not \(load\|open\) kernel" -e "error loading" -e "failed to load" &&
+        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
+                -e "error loading" \
+                -e "failed to load" &&
         return 1
 
     RUNTIME_log_stderr <<< "$log"
-- 
2.43.0

