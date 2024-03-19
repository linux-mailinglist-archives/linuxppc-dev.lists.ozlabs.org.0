Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D74687F903
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:11:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZaN31w7s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPYt2jMVz3w9x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:11:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZaN31w7s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPKY22v7z3vXP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:00:33 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e6b54a28ebso5147187b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835231; x=1711440031; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iE7qlIRnEcs8kYKgLfZ1UH5UWYqf3U0H7OylMM9X6hk=;
        b=ZaN31w7sbPKUi29j+MWoSnPBaeXCWaDyVCl1bYGWhuB6sgcK3r5yHkEtZ8+B29bCcO
         kE1Cmh3yGZth/HNYWXyImc5bNuDHaAqxf5FbhL7SqyGiw3AHd4/cLDATLr+Rw2I+Q+xZ
         +IMANblB009i9p6IzbvNeICBK1sQaUwNBCpCxHTw4Zrihc6ur3yyJ2Ght6Y3js38rq7t
         nUDOl87GYWwz5Uc1Yw8r+wnJcEWpYVM5gN02CPdgP9e7rw/zhZyQBGw8mxqdgXo/VMm/
         HgE7oWUuQTd2Cdf+3YbnY2vTdDeF3v016rEo1D6Ug6bVlWPDdsWAynY2U8FHgnFXItoL
         jRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835231; x=1711440031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iE7qlIRnEcs8kYKgLfZ1UH5UWYqf3U0H7OylMM9X6hk=;
        b=mnx1GaUiP91MY92uePBIPl/yvmnOBGaCwex7RcUE/g5CMv/UVvq/ggUXOIDFRwi1P2
         c5+/oMlpyETkkaN0tfk1dUtPk3+Y105VBUQ5f1AthGvNZyPpfOvCAsEadGUoVMgllivW
         kFnwL8M8VVtSYrwPV6/DvoFohHkwpF/6jsUSamJPBmRubWuVm+c44VwI6RtroIuVO4tv
         dt00dwBkaPupDAO5c77KF3Jk6BsVnDaNnr4MSCfcqtFvnBK+pwXruGEY3Mu0f2EJhmaZ
         W5P+AXgZd2GHqvR8tnaW4spEDwMX2rh98EAenHJBHHFEeCjXzAAzIo6mNQhQe3m4okPV
         KGgw==
X-Forwarded-Encrypted: i=1; AJvYcCVr+6zn9JtvX69uIJnLVgzjSWvbsF3TmRnzJs5ExI14If8xQgsuV1qj4xk4p4FoNRFY5aOGf6j9Zrf/O7vuqvhSHIAUi0TPr9hItuaJig==
X-Gm-Message-State: AOJu0Yx806rGfwdMS7MA9MRz9aMRU9BdmVo4fkWBGaj4wOyHq+DrfQvF
	olqEHH1pXpmRRRjWbp0ZyWhv+SIV7VuJhsdMh9mkfzt7wqbp1LTu
X-Google-Smtp-Source: AGHT+IE3j83vagr9YQNSHx4O3hggYW3w01Qxw3BclgKX6y9IBAmrQryPE+Xgc1ShN/cEbvm0lP5Q4g==
X-Received: by 2002:a05:6a00:b4c:b0:6e6:f799:5480 with SMTP id p12-20020a056a000b4c00b006e6f7995480mr12594586pfo.4.1710835230661;
        Tue, 19 Mar 2024 01:00:30 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 15/35] scripts: Accommodate powerpc powernv machine differences
Date: Tue, 19 Mar 2024 17:59:06 +1000
Message-ID: <20240319075926.2422707-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
2.42.0

