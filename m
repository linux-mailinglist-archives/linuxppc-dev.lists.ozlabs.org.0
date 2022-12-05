Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6466424F3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 09:45:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQcZS3NV0z3bhT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 19:45:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VHG9BGw4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=linmq006@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VHG9BGw4;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQcYV30vbz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 19:44:45 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id 21so10683171pfw.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Dec 2022 00:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mfpI91j/Y0e7n9kSIKkB1eB3wJUrqLVm9u9ZvFip/8I=;
        b=VHG9BGw4G2xPBjZhyKDaIVmzz/QAFQ7pTzfNThhC9EAw3R6E9hL+pCGISJoH7Kz7eC
         2I2RPf1nH8+0duwh0RdsypagnCjxw+XFIlVu8cuxAS16n71Yr8pETszT7ulv9XX1I5qD
         IZiGDrk4Ldmb1G3zJQyFsOH90LoVGs0uFAaeq81cAWyZ92RZ0Ki6ECCkXprPRRIx0qwa
         pGkWE5f+CtAxa18zPZS4Vbgtz2rVfYJYPUdCiDr+CYR9lN1icqOJtb+x6u2RFibOhpXr
         PImnH+5qkcnb/ZAm7Is56SmkXjSvOVmnEFo8L/k6ECSo8hCm1nXmuQej0DhyHV/T19KG
         VPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfpI91j/Y0e7n9kSIKkB1eB3wJUrqLVm9u9ZvFip/8I=;
        b=v6UYF6yIHIvEM5wGckIpDc3J/Twe7KxgdK0yT7D41DpKxgTSE9fz/ODGvuYOpmbQbz
         HAUlSSMOoAkMTlx1Wfw21BRcK+BT/ce/M7cEcMmowaTims25mYcBdjMFZjsRuwtTqvuw
         d2XER6kXlU4YWV0wQj1BvlbwKNfT+WxVV2r6bVPTSeODpVC7ctDCj/PKex5BuRZEGl4T
         OVW0uDTfLZypUo0+p48eEMm9xU1TgTezptXTDZsxcOfecXzUGIqWVGyp72+U6ch+i7NK
         DqEnl5cOYuRfajOi7PMybxNr7zPPKa67rpcksm5Vit651MS4LUaDzgo8xVf24BbHlm69
         b54A==
X-Gm-Message-State: ANoB5plzvys3RUGFlqdnmy+RezMnqKJbr/RvgPMbucACDvb06gQ1EsKf
	VXNjWhU4+DI27k8vw3+pToc=
X-Google-Smtp-Source: AA0mqf4c9Aw2+V+i2qnJjaDCHslItpgdR1g1SCuzHmCPiG/NYtL3k6ZxQnBTweH92Q4OiFFuyJIKfA==
X-Received: by 2002:a63:941:0:b0:478:a350:77ed with SMTP id 62-20020a630941000000b00478a35077edmr7255134pgj.417.1670229882404;
        Mon, 05 Dec 2022 00:44:42 -0800 (PST)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id u11-20020a170902e80b00b0018996404dd5sm10045370plg.109.2022.12.05.00.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 00:44:41 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Shuah Khan <shuah@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Anshuman Khandual <khandual@linux.vnet.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/powerpc: Fix resource leaks
Date: Mon,  5 Dec 2022 12:44:27 +0400
Message-Id: <20221205084429.570654-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In check_all_cpu_dscr_defaults, opendir() opens the directory stream.
Add missing closedir() in the error path to release it.

In check_cpu_dscr_default, open() creates an open file descriptor.
Add missing close() in the error path to release it.

Fixes: ebd5858c904b ("selftests/powerpc: Add test for all DSCR sysfs interfaces")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
index fbbdffdb2e5d..f20d1c166d1e 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
@@ -24,6 +24,7 @@ static int check_cpu_dscr_default(char *file, unsigned long val)
 	rc = read(fd, buf, sizeof(buf));
 	if (rc == -1) {
 		perror("read() failed");
+		close(fd);
 		return 1;
 	}
 	close(fd);
@@ -65,8 +66,10 @@ static int check_all_cpu_dscr_defaults(unsigned long val)
 		if (access(file, F_OK))
 			continue;
 
-		if (check_cpu_dscr_default(file, val))
+		if (check_cpu_dscr_default(file, val)) {
+			closedir(sysfs);
 			return 1;
+		}
 	}
 	closedir(sysfs);
 	return 0;
-- 
2.25.1

