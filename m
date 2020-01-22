Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAFE144A3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 04:13:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482Vpn1hXZzDqGh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 14:13:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UriTVcjt; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482Vmt4Jr2zDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 14:11:42 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id d15so2420026pjw.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 19:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zD8EAOK9CWmtc3xm4OQjIg4+PVkn46tLhKGzGFvX0/g=;
 b=UriTVcjtk7phhNJDTRGozbvnq/TerEs8unezd2igkcxLn0pkxBIhjffXKbFGe+km3x
 H/Ujp+w+Am2i8bCGqedQAjsbZ8x+IRIy9F97EfMbt3sKelmpVB2JFjN/JHLWLN38Xzm8
 VJ71vRcUwHziNK874Dv64aVxeF9ssQRmLtaSMntH5PjLO8OV1Re1vUazevsPaLuUd6hF
 OBjYKv9ryhw0+IYtN+Hbv9HbXZRiihmqGajemLEqzzSWRyKr8qL/0l3gPdEeUUe9j3Vn
 snJKNh3sWL1flzgyS6dtfE8PgIWnk5RTSV5Pu7PSP5WdOWcjJhg4v8kaYKRrIbkq6ZkI
 WctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zD8EAOK9CWmtc3xm4OQjIg4+PVkn46tLhKGzGFvX0/g=;
 b=RB28t74tlXldFORYjiosLxWU7tGX295ulCXjC4xG+BO793+3QKgRfQ5CJ3dgdeLU0v
 isQnhQnNTdmQbQS5FNq+yYujFhYh58S1W/TqZmej6vQGQrf/4X1Spo5x8zaHIGnCtIvK
 9+whGVipEwwtw+pLLucu+YICqAhG2mutGAXcFbpwZeX9I7/+PcNK1krMFR2bVs0L4qQ5
 VC2K1N0wcI7LUwIc6Uo7G83FEeFvg1bLVmuMFvNBkvO5/wfGb/HxW4A9oUs1aFufMJkJ
 06R6prGtdmHGQvPlsPgFcfN1TVYJfVZo7DnIoMm3917GfRY/ZymJff9jvqB3EE25A6x0
 oMJw==
X-Gm-Message-State: APjAAAXOqRMSXSUR8ASq7yndHBpPXTEEMA6rR/aOI28kbdi4FW+cYLiR
 ubVjTIWpOsbvgmXk7Kv48ecjZF05
X-Google-Smtp-Source: APXvYqyuyWGJ2/6HRcUR92V9EyJxqdpZTQnyg2RNHy8ToIfEa1dmXEj/hADIlsPldtCOzZn66aHfuA==
X-Received: by 2002:a17:90a:d804:: with SMTP id a4mr504138pjv.11.1579662698434; 
 Tue, 21 Jan 2020 19:11:38 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d194sm476177pfd.159.2020.01.21.19.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 19:11:37 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/eeh: Bump EEH wait time to 60s
Date: Wed, 22 Jan 2020 14:11:25 +1100
Message-Id: <20200122031125.25991-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Cc: Oliver O'Halloran <oohall@gmail.com>, Douglas Miller <dougmill@us.ibm.com>,
 Steve Best <sbest@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some newer cards supported by aacraid can take up to 40s to recover
after an EEH event. This causes spurious failures in the basic EEH
self-test since the current maximim timeout is only 30s.

Fix the immediate issue by bumping the timeout to a default of 60s,
and allow the wait time to be specified via an environmental variable
(EEH_MAX_WAIT).

Reported-by: Steve Best <sbest@redhat.com>
Suggested-by: Douglas Miller <dougmill@us.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 tools/testing/selftests/powerpc/eeh/eeh-functions.sh | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
index 26112ab5cdf4..f52ed92b53e7 100755
--- a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
@@ -53,9 +53,13 @@ eeh_one_dev() {
 	# is a no-op.
 	echo $dev >/sys/kernel/debug/powerpc/eeh_dev_check
 
-	# Enforce a 30s timeout for recovery. Even the IPR, which is infamously
-	# slow to reset, should recover within 30s.
-	max_wait=30
+	# Default to a 60s timeout when waiting for a device to recover. This
+	# is an arbitrary default which can be overridden by setting the
+	# EEH_MAX_WAIT environmental variable when required.
+
+	# The current record holder for longest recovery time is:
+	#  "Adaptec Series 8 12G SAS/PCIe 3" at 39 seconds
+	max_wait=${EEH_MAX_WAIT:=60}
 
 	for i in `seq 0 ${max_wait}` ; do
 		if pe_ok $dev ; then
-- 
2.21.1

