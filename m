Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0284D22E397
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 03:03:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFM4P4pgFzF0m0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 11:03:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=E0XNll8+; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFM2f38zlzF0cD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 11:01:44 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d188so2105091pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 18:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwfiU4hjSq9OiXDZi7IiRXKGqNC37dxWDHjiJ5LHblY=;
 b=E0XNll8+IV2aXm4mIDdAOBxM6kiizV/j7vR4qf9CH1N6QXGpSJlQ30DHBjeC02MPOe
 yOoUOycViHIOr0pBoXjdGmUUvzBBpS8cobIBUs7vs3EmY1zHU0tin+/SzlMkIYr+Qgeh
 IDJQVRwZM/xSjz6DKO2ZjnHvh2d0BFDxk2p6KpggFdCpoDVq3K+HhFViGnK9oAdLnQMm
 uqGcB/3uWASR30FPxCCjbiOKJvt6GZDDNVuajk1m8RpZxOvyEPnhMvK23zUvSuQTrvVC
 JnpfnU/uFnz3uw2SQI6BEp1p/IglmuDPuyG3B7H0MyVXMeAgoTBnOhAEA/YCycKcASJx
 YxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwfiU4hjSq9OiXDZi7IiRXKGqNC37dxWDHjiJ5LHblY=;
 b=a9MJ4ch78F/hrgoxIXQlcvJKQMh6ov5kOmCkySPlxDBqhjgeSMuV/ME73L9WKgAQ6R
 z6vlP2GhuAN0FdppZ7vbgIDOLcdMV0w6H0UZf5yt2xcy6d3TiXB1692AeC4u7ee58yh/
 BWV2hBij20d/Kq25d1HIHS+KIeTXK8vuWK4AUPtda78dMa/6PAlebTuWjSL0uLqPpIVN
 kyTb32wHAta7pCulSyuz9lqUwHAj+bLtqqF3ljNm74iqcrbFPnucc1N2otULEGhJFFoR
 adtSjswhu1MfF6+KgXpdF32hyDCUCMMqBrksTqS0jLrUwbTkVuJvX2cSUqgJs1hgyLdw
 yaoA==
X-Gm-Message-State: AOAM531rBlBIr9aGTa9XBCrtE/vaD4ih3A+Rkr8TswKYxW92Fycr92Hu
 o8e6nZDzMNwGDu2xgrt/FqFR8TGKsLA=
X-Google-Smtp-Source: ABdhPJz9iOjpxbACdwvxuWfoxgYxn4QxAG3jtgivAcaPTs315ZpKK9s/HhfMXL1Ti6+0TxfXbOfiEg==
X-Received: by 2002:aa7:9f8f:: with SMTP id z15mr17737393pfr.73.1595811702349; 
 Sun, 26 Jul 2020 18:01:42 -0700 (PDT)
Received: from localhost.localdomain ([118.210.60.180])
 by smtp.gmail.com with ESMTPSA id q66sm12664139pga.29.2020.07.26.18.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 18:01:41 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Squash spurious errors due to device
 removal
Date: Mon, 27 Jul 2020 11:01:27 +1000
Message-Id: <20200727010127.23698-1-oohall@gmail.com>
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

For drivers that don't have the error handling callbacks we implement
recovery by removing the device and re-probing it. This causes the sysfs
directory for the PCI device to be removed which causes the following
spurious error to be printed when checking the PE state:

Breaking 0005:03:00.0...
./eeh-basic.sh: line 13: can't open /sys/bus/pci/devices/0005:03:00.0/eeh_pe_state: no such file
0005:03:00.0, waited 0/60
0005:03:00.0, waited 1/60
0005:03:00.0, waited 2/60
0005:03:00.0, waited 3/60
0005:03:00.0, waited 4/60
0005:03:00.0, waited 5/60
0005:03:00.0, waited 6/60
0005:03:00.0, waited 7/60
0005:03:00.0, Recovered after 8 seconds

We currently try to avoid this by checking if the PE state file exists
before reading from it. This is however inherently racy so re-work the
state checking so that we only read from the file once, and we squash any
errors that occur while reading.

Fixes: 85d86c8aa52e ("selftests/powerpc: Add basic EEH selftest")
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 tools/testing/selftests/powerpc/eeh/eeh-functions.sh | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
index f52ed92b53e7..00dc32c0ed75 100755
--- a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
@@ -5,12 +5,17 @@ pe_ok() {
 	local dev="$1"
 	local path="/sys/bus/pci/devices/$dev/eeh_pe_state"
 
-	if ! [ -e "$path" ] ; then
+	# if a driver doesn't support the error handling callbacks then the
+	# device is recovered by removing and re-probing it. This causes the
+	# sysfs directory to disappear so read the PE state once and squash
+	# any potential error messages
+	local eeh_state="$(cat $path 2>/dev/null)"
+	if [ -z "$eeh_state" ]; then
 		return 1;
 	fi
 
-	local fw_state="$(cut -d' ' -f1 < $path)"
-	local sw_state="$(cut -d' ' -f2 < $path)"
+	local fw_state="$(echo $eeh_state | cut -d' ' -f1)"
+	local sw_state="$(echo $eeh_state | cut -d' ' -f2)"
 
 	# If EEH_PE_ISOLATED or EEH_PE_RECOVERING are set then the PE is in an
 	# error state or being recovered. Either way, not ok.
-- 
2.26.2

