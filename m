Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CFC28D8B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 04:49:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9xhH5gRwzDqnV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 13:49:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oK3lseUv; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9xfZ4GjBzDqW4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 13:47:45 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id x13so1091249pfa.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 19:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Av/BLpgAn6P46+TW3WzA91m/eJdrqrTeYGbRPv+P6zA=;
 b=oK3lseUveczg+SShyTwjzwjHRoHUfPmnN/H3xp7aufC4gzWqpQC+5X+WqAb9G1nx4Q
 cHrXXgVy+mXbfP1JExO3ckAQQ5MfPUTS1XnKBf9GrSEThOwlfmIQrg5YDK4r0CQT4Dam
 WrKSUkdmM1W+P8I5PcMev9F/2EgcGabIQ+2gZywdBUtsZJQ+h1+bhbPqXb8At440VJCq
 HWww43vRc6NQQvpHwZXRIISTxufLS99LpE4PnoxkBb7TpbsneWMqzZEiTauyd8a3DyAN
 tMbdiOWp+6vcPRKeofbs+FReXdGhD1cO6v7SkW8H/ErlhxFk1rfBtNY5uM+9rVv1EMso
 uOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Av/BLpgAn6P46+TW3WzA91m/eJdrqrTeYGbRPv+P6zA=;
 b=TEqwFSDFqVc5gZT2aqfYX5S+YuP7gi4MJrOgKxyGBhd6aXFr8ERuuAH8t0Gm1zwdIP
 eBBvE9OWft3tKjg8FxAcSCZgU+5jG94D6WOaKM+EheOC3r6S8MkFY6sRnMJXaU0S5WVv
 Tf0qM2xDfZngjz0nHHy3YG+FQx5z7208nm++SD4u12EHq1TWE0F2VnqODv35N7KM7f2F
 Nkgn2DXCwDIJ6DH/kBn3BVJcW1CUekcYxnw1ec/1GuR8jnWC2LQdJgBBJwVH2Zz66qMM
 7tOQczNc88VA8fuP5lFfvk0O2XFW0+hKMIsiyVRp4diXPMiOY8ONoGUdr+SDImd29/Um
 NDkA==
X-Gm-Message-State: AOAM531hsSCNa6ue7NIvB8x2R5rfLUJ53G9wo0LyGNb1b4WpUCZhUTr6
 aa2m7M7/k/rJJqE57Z0EeFg81mV1I6hy0Q==
X-Google-Smtp-Source: ABdhPJyyK5d1rAe1+ztbV+vin5RZpwVkWiDninpFLfUXs/LZpKZNMu4IODOh5Mn+GiJW4hTmuOcsrw==
X-Received: by 2002:a62:7d14:0:b029:155:2add:290e with SMTP id
 y20-20020a627d140000b02901552add290emr2380538pfc.41.1602643661729; 
 Tue, 13 Oct 2020 19:47:41 -0700 (PDT)
Received: from localhost.ibm.com (14-200-206-90.tpgi.com.au. [14.200.206.90])
 by smtp.gmail.com with ESMTPSA id
 r201sm1227493pfc.98.2020.10.13.19.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 19:47:41 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Fix eeh-basic.sh exit codes
Date: Wed, 14 Oct 2020 13:47:11 +1100
Message-Id: <20201014024711.1138386-1-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kselftests test running infrastructure expects tests to finish with an
exit code of 4 if the test decided it should be skipped. Currently
eeh-basic.sh exits with the number of devices that failed to recover, so if
four devices didn't recover we'll report a skip instead of a fail.

Fix this by checking if the return code is non-zero and report success
and failure by returning 0 or 1 respectively. For the cases where should
actually skip return 4.

Fixes: 85d86c8aa52e ("selftests/powerpc: Add basic EEH selftest")
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 tools/testing/selftests/powerpc/eeh/eeh-basic.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/eeh/eeh-basic.sh b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
index 8a8d0f456946..0d783e1065c8 100755
--- a/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
@@ -1,17 +1,19 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-only
 
+KSELFTESTS_SKIP=4
+
 . ./eeh-functions.sh
 
 if ! eeh_supported ; then
 	echo "EEH not supported on this system, skipping"
-	exit 0;
+	exit $KSELFTESTS_SKIP;
 fi
 
 if [ ! -e "/sys/kernel/debug/powerpc/eeh_dev_check" ] && \
    [ ! -e "/sys/kernel/debug/powerpc/eeh_dev_break" ] ; then
 	echo "debugfs EEH testing files are missing. Is debugfs mounted?"
-	exit 1;
+	exit $KSELFTESTS_SKIP;
 fi
 
 pre_lspci=`mktemp`
@@ -84,4 +86,5 @@ echo "$failed devices failed to recover ($dev_count tested)"
 lspci | diff -u $pre_lspci -
 rm -f $pre_lspci
 
-exit $failed
+test "$failed" == 0
+exit $?
-- 
2.26.2

