Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C54312968
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 04:34:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYs8810dNzDrbB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 14:34:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qqV60bQw; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYs3W4WMrzDqjT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Feb 2021 14:30:15 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id z21so9329594pgj.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Feb 2021 19:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gOxFb1uYaxdQPd5dRLwyNtq0+W6S2dH/x6Yto7IMl1g=;
 b=qqV60bQwZBljS/SijhlJDQHiThCL2BANExZJXbo4Iz1OxBuYKBNJeTLoy/ilT96sH2
 v0qBDLP8QDXmYXFdQwKhIOYogaTCHhdEo8ZbaiMZ2LsnBNcMVT/rhUe2l7+1qQbkCNOJ
 vdfTJui0nZA56zjpO3UZbOMhD8k8Sc9la5op8nfhzQPiFdJ+54TAF6+feZXo08vq2A0V
 OvRG4rnE9bxE6MNjoBRwtW33d0zBHEiVV1H8MuRuREFbSEKlyg33OxPLDBXBYUscBbEJ
 GJ4fADL4qLqeBx/diumjXfhTFIN3ZeE8t7zK4pFY5fLCd9RQ/gd0gG8QgOV65y+2dvOH
 75Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gOxFb1uYaxdQPd5dRLwyNtq0+W6S2dH/x6Yto7IMl1g=;
 b=mRFgrMwRyooZVUiuEGGuD4DMjrfqXEmZXcXV2j09z+AlOE4VpT8tLDr+MVoPvayBdD
 uZ20xCk/OwL8kOomK6nDzcwnWU57xhXfXVND+/QG23inFP89JrQ+sp/itCdp7Pqg7GnW
 Svi/WCJG2HbT6VHe3kKgsQLu7wQdDQkz1WwGAKd6Kgq4dbx3ZOAvDXiHR0IFJkoAvL5g
 BOgAM6pbE4kdtWmT2PrLIpA6VdDCUn2s2Kbl6csI8wEglFhxQvBHouUY1fUbkX42Uvm5
 ZuOmi7jaNKFMXW1dUbGU/X84zIL7OEzqzwDHS3MHW7wPfzWoK3piO6SUuENPgS3h2LYp
 ZNww==
X-Gm-Message-State: AOAM5316PK9rs630r6jUCPPCERhG7d0fQSe2eX3T4Nef39yQFWT6jV4w
 FXBOavMuwEBdQO/V3mXENumzIEgr48mWzg==
X-Google-Smtp-Source: ABdhPJziJmaFMSAyVeTtln2i511Kw8pAzVu0uuHsKh2pzKreJG2s9KgZ/HaFFq7ZpM08kdWqbJ0FUQ==
X-Received: by 2002:a63:c501:: with SMTP id f1mr15026274pgd.1.1612755012252;
 Sun, 07 Feb 2021 19:30:12 -0800 (PST)
Received: from tee480.ibm.com ([159.196.117.139])
 by smtp.gmail.com with ESMTPSA id i25sm16738740pgb.33.2021.02.07.19.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:30:11 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/2] selftests/powerpc: Test for spurious kernel memory
 faults on radix
Date: Mon,  8 Feb 2021 14:29:57 +1100
Message-Id: <20210208032957.1232102-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208032957.1232102-1-jniethe5@gmail.com>
References: <20210208032957.1232102-1-jniethe5@gmail.com>
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
Cc: npiggin@gmail.com, cmr@codefail.de, naveen.n.rao@linux.vnet.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Previously when mapping kernel memory on radix, no ptesync was included
which would periodically lead to unhandled spurious faults. Mapping
kernel memory is used when code patching with Strict RWX enabled.  As
suggested by Chris Riedl, turning ftrace on and off does a large amount
of code patching so is a convenient way to see this kind of fault.

Add a selftest to try and trigger this kind of a spurious fault. It
tests for 30 seconds which is usually long enough for the issue to show
up.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v3: New to series
---
 tools/testing/selftests/powerpc/mm/Makefile   |  1 +
 .../selftests/powerpc/mm/spurious_fault.sh    | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100755 tools/testing/selftests/powerpc/mm/spurious_fault.sh

diff --git a/tools/testing/selftests/powerpc/mm/Makefile b/tools/testing/selftests/powerpc/mm/Makefile
index defe488d6bf1..56c2896bed53 100644
--- a/tools/testing/selftests/powerpc/mm/Makefile
+++ b/tools/testing/selftests/powerpc/mm/Makefile
@@ -5,6 +5,7 @@ noarg:
 TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot prot_sao segv_errors wild_bctr \
 		  large_vm_fork_separation bad_accesses pkey_exec_prot \
 		  pkey_siginfo stack_expansion_signal stack_expansion_ldst
+TEST_PROGS := spurious_fault.sh
 
 TEST_GEN_PROGS_EXTENDED := tlbie_test
 TEST_GEN_FILES := tempfile
diff --git a/tools/testing/selftests/powerpc/mm/spurious_fault.sh b/tools/testing/selftests/powerpc/mm/spurious_fault.sh
new file mode 100755
index 000000000000..e454509659f6
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mm/spurious_fault.sh
@@ -0,0 +1,49 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+TIMEOUT=30
+
+DEBUFS_DIR=`cat /proc/mounts | grep debugfs | awk '{print $2}'`
+if [ ! -e "$DEBUFS_DIR" ]
+then
+	echo "debugfs not found, skipping" 1>&2
+	exit 4
+fi
+
+if [ ! -e "$DEBUFS_DIR/tracing/current_tracer" ]
+then
+	echo "Tracing files not found, skipping" 1>&2
+	exit 4
+fi
+
+
+echo "Testing for spurious faults when mapping kernel memory..."
+
+if grep -q "FUNCTION TRACING IS CORRUPTED" "$DEBUFS_DIR/tracing/trace"
+then
+	echo "FAILED: Ftrace already dead. Probably due to a spurious fault" 1>&2
+	exit 1
+fi
+
+dmesg -C
+START_TIME=`date +%s`
+END_TIME=`expr $START_TIME + $TIMEOUT`
+while [ `date +%s` -lt $END_TIME ]
+do
+	echo function > $DEBUFS_DIR/tracing/current_tracer
+	echo nop > $DEBUFS_DIR/tracing/current_tracer
+	if dmesg | grep -q 'ftrace bug'
+	then
+		break
+	fi
+done
+
+echo nop > $DEBUFS_DIR/tracing/current_tracer
+if dmesg | grep -q 'ftrace bug'
+then
+	echo "FAILED: Mapping kernel memory causes spurious faults" 1>&2
+	exit 1
+else
+	echo "OK: Mapping kernel memory does not cause spurious faults"
+	exit 0
+fi
-- 
2.25.1

