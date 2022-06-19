Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38671550D98
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 01:31:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LR8Dw13KXz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 09:31:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qf5/yJrH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LR8DH2KQkz307g
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 09:31:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qf5/yJrH;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LR8DF1c12z4xL4;
	Mon, 20 Jun 2022 09:31:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1655681469;
	bh=DfFYSplzCGpw1G5j40S++Z74it3zuvgSDqazPUPVhoU=;
	h=From:To:Cc:Subject:Date:From;
	b=qf5/yJrHWCr76MD59gqYCqsP2H4jhu1X1FSGUYhzw7RqNYnCjUNCYeEXnetHxMI0t
	 INbwFD8AyCyMid1nwKqrNVP7noxmpHudRWHoKygjdeyKGdMEE4UrhMMOVEYZD7P+77
	 HmUKqXP4Nb8xSPmv+2lQCJPrdyv+fA/x1nRWbnqZLHMuYlImp3yuZxaJTZlBTQbKN+
	 EoxJHDlZrc2yjOvIwTmhYKW4m6XKqtngLpcFiKpu9tuJ07OfKlL9Wwtg6qruxsvr/a
	 L2wP2fkbUbTL7vWVw/mBTbczG9A/dwu/eXm0LNe55BkZMHTbmTjTtph28odIaC/67I
	 yd1riAKDXnc5Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/powerpc: Skip energy_scale_info test on older firmware
Date: Mon, 20 Jun 2022 09:31:03 +1000
Message-Id: <20220619233103.2666171-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Cc: psampat@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Older machines don't have the firmware feature that enables the code
this test is testing. Skip the test if the sysfs directory doesn't
exist. Also use the FAIL_IF() macro to provide more verbose error
reporting if an error is encountered.

Fixes: 57201d657eb7 ("selftest/powerpc: Add PAPR sysfs attributes sniff test")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../powerpc/papr_attributes/attr_test.c       | 30 +++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/powerpc/papr_attributes/attr_test.c b/tools/testing/selftests/powerpc/papr_attributes/attr_test.c
index bab0dc06e90b..9b655be641c9 100644
--- a/tools/testing/selftests/powerpc/papr_attributes/attr_test.c
+++ b/tools/testing/selftests/powerpc/papr_attributes/attr_test.c
@@ -7,6 +7,7 @@
  * Copyright 2022, Pratik Rajesh Sampat, IBM Corp.
  */
 
+#include <errno.h>
 #include <stdio.h>
 #include <string.h>
 #include <dirent.h>
@@ -32,7 +33,7 @@ enum type {
 	NUM_VAL
 };
 
-int value_type(int id)
+static int value_type(int id)
 {
 	int val_type;
 
@@ -54,15 +55,21 @@ int value_type(int id)
 	return val_type;
 }
 
-int verify_energy_info(void)
+static int verify_energy_info(void)
 {
 	const char *path = "/sys/firmware/papr/energy_scale_info";
 	struct dirent *entry;
 	struct stat s;
 	DIR *dirp;
 
-	if (stat(path, &s) || !S_ISDIR(s.st_mode))
-		return -1;
+	errno = 0;
+	if (stat(path, &s)) {
+		SKIP_IF(errno == ENOENT);
+		FAIL_IF(errno);
+	}
+
+	FAIL_IF(!S_ISDIR(s.st_mode));
+
 	dirp = opendir(path);
 
 	while ((entry = readdir(dirp)) != NULL) {
@@ -76,25 +83,24 @@ int verify_energy_info(void)
 
 		id = atoi(entry->d_name);
 		attr_type = value_type(id);
-		if (attr_type == INVALID)
-			return -1;
+		FAIL_IF(attr_type == INVALID);
 
 		/* Check if the files exist and have data in them */
 		sprintf(file_name, "%s/%d/desc", path, id);
 		f = fopen(file_name, "r");
-		if (!f || fgetc(f) == EOF)
-			return -1;
+		FAIL_IF(!f);
+		FAIL_IF(fgetc(f) == EOF);
 
 		sprintf(file_name, "%s/%d/value", path, id);
 		f = fopen(file_name, "r");
-		if (!f || fgetc(f) == EOF)
-			return -1;
+		FAIL_IF(!f);
+		FAIL_IF(fgetc(f) == EOF);
 
 		if (attr_type == STR_VAL) {
 			sprintf(file_name, "%s/%d/value_desc", path, id);
 			f = fopen(file_name, "r");
-			if (!f || fgetc(f) == EOF)
-				return -1;
+			FAIL_IF(!f);
+			FAIL_IF(fgetc(f) == EOF);
 		}
 	}
 
-- 
2.35.3

