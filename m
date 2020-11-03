Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5842A3BB4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 06:12:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHwS4pQ7zDq9J
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:12:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UtJ5h18B; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQHJs0pHRzDqVB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:45:16 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id i7so10774201pgh.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fx/MdenqqdHA29WmHjtZ9VoTDdPNYLEIpdi6rnltFmY=;
 b=UtJ5h18BQAPe36EmCTBU5lTdyHmPeaIPO2dEOFJP0q1lymLWCJAK1Ue5fJPxK6/9l3
 peMbaouzATAfvtjkJRjXw3mYRey+SodKhndbtbqKLMNKgTqZOZvtjDu1e2q1NB5QRYUl
 hXik9u4O19i0SFj2JBZvOB2cf8BPhg0CMTI+hnKw3XjV/AInXq90F8kxmkB4YViOL1iV
 N7sO6t8fKr0dtiX249u/RlorzsKrq1uM2gEQ4oS9UtJU4ZcQ42AQoz0otY7zYTKGRKRV
 yFajEzkBiiK6AXEWFr2jtTTq6i4Dug5TWABGObSr75gD92u7efVoNfQOOlPFi5cSTtro
 xREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fx/MdenqqdHA29WmHjtZ9VoTDdPNYLEIpdi6rnltFmY=;
 b=f9FCiLyuH4Y0gASUtIXmBPdCprUj9b8iwNYhZGtFei/uEySp9x+vJVYp7PKHAqSPCw
 UkbNtG1v5BPmvEe08Jgu9QzpDHBZu5C4u9QCP9MVKH5WVc+TG8yciECTC4V9eBuI4qCp
 GAKYfJIf00mdyqA1dMWnCkCuidjtXmbzG/9ew6xXfvHhaI/za69eA0sEhlpXs10+dXHW
 zZl6NU3rIWqJSGed0YPrVGXaaum3x5iojBSnA29doRLEud9aZTx/Hl2YCh4W7kzE/dKc
 aRVNkUgYmELs8DwkTTx+DAmfxAtyc+OSZGWuc4IlgQSXJ0j0nY18htQsdMrTtNLvBdBd
 sQYw==
X-Gm-Message-State: AOAM533tFtL4ti8hMGDgrCKGzNav39c+MfFdFEn7Yx3/Rp5THa5ViUtX
 yZk3sU8JFdg1bvt7vx3D/SvVepT4wgk=
X-Google-Smtp-Source: ABdhPJw5Yj15QbtoYNYCJkmqn6huRpDq8poKI0V3xhDtXoRzsn3F/PNPG4utSiFPsHp6MU7l+Rz3qg==
X-Received: by 2002:a65:568d:: with SMTP id v13mr15534412pgs.157.1604378712918; 
 Mon, 02 Nov 2020 20:45:12 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id a84sm494691pfa.53.2020.11.02.20.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:45:12 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] selftests/powerpc: Hoist helper code out of eeh-basic
Date: Tue,  3 Nov 2020 15:45:01 +1100
Message-Id: <20201103044503.917128-1-oohall@gmail.com>
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

Hoist some of the useful test environment checking and prep code into
eeh-functions.sh so they can be reused in other tests.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 .../selftests/powerpc/eeh/eeh-basic.sh        | 39 ++-------------
 .../selftests/powerpc/eeh/eeh-functions.sh    | 48 +++++++++++++++++++
 2 files changed, 51 insertions(+), 36 deletions(-)
 mode change 100755 => 100644 tools/testing/selftests/powerpc/eeh/eeh-functions.sh

diff --git a/tools/testing/selftests/powerpc/eeh/eeh-basic.sh b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
index 0d783e1065c8..16d00555f13e 100755
--- a/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
@@ -1,28 +1,13 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-only
 
-KSELFTESTS_SKIP=4
-
 . ./eeh-functions.sh
 
-if ! eeh_supported ; then
-	echo "EEH not supported on this system, skipping"
-	exit $KSELFTESTS_SKIP;
-fi
-
-if [ ! -e "/sys/kernel/debug/powerpc/eeh_dev_check" ] && \
-   [ ! -e "/sys/kernel/debug/powerpc/eeh_dev_break" ] ; then
-	echo "debugfs EEH testing files are missing. Is debugfs mounted?"
-	exit $KSELFTESTS_SKIP;
-fi
+eeh_test_prep # NB: may exit
 
 pre_lspci=`mktemp`
 lspci > $pre_lspci
 
-# Bump the max freeze count to something absurd so we don't
-# trip over it while breaking things.
-echo 5000 > /sys/kernel/debug/powerpc/eeh_max_freezes
-
 # record the devices that we break in here. Assuming everything
 # goes to plan we should get them back once the recover process
 # is finished.
@@ -30,34 +15,16 @@ devices=""
 
 # Build up a list of candidate devices.
 for dev in `ls -1 /sys/bus/pci/devices/ | grep '\.0$'` ; do
-	# skip bridges since we can't recover them (yet...)
-	if [ -e "/sys/bus/pci/devices/$dev/pci_bus" ] ; then
-		echo "$dev, Skipped: bridge"
+	if ! eeh_can_break $dev ; then
 		continue;
 	fi
 
-	# Skip VFs for now since we don't have a reliable way
-	# to break them.
+	# Skip VFs for now since we don't have a reliable way to break them.
 	if [ -e "/sys/bus/pci/devices/$dev/physfn" ] ; then
 		echo "$dev, Skipped: virtfn"
 		continue;
 	fi
 
-	if [ "ahci" = "$(basename $(realpath /sys/bus/pci/devices/$dev/driver))" ] ; then
-		echo "$dev, Skipped: ahci doesn't support recovery"
-		continue
-	fi
-
-	# Don't inject errosr into an already-frozen PE. This happens with
-	# PEs that contain multiple PCI devices (e.g. multi-function cards)
-	# and injecting new errors during the recovery process will probably
-	# result in the recovery failing and the device being marked as
-	# failed.
-	if ! pe_ok $dev ; then
-		echo "$dev, Skipped: Bad initial PE state"
-		continue;
-	fi
-
 	echo "$dev, Added"
 
 	# Add to this list of device to check
diff --git a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
old mode 100755
new mode 100644
index 00dc32c0ed75..9b1bcc1fd4ad
--- a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
@@ -1,6 +1,8 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-only
 
+export KSELFTESTS_SKIP=4
+
 pe_ok() {
 	local dev="$1"
 	local path="/sys/bus/pci/devices/$dev/eeh_pe_state"
@@ -39,6 +41,52 @@ eeh_supported() {
 	grep -q 'EEH Subsystem is enabled' /proc/powerpc/eeh
 }
 
+eeh_test_prep() {
+	if ! eeh_supported ; then
+		echo "EEH not supported on this system, skipping"
+		exit $KSELFTESTS_SKIP;
+	fi
+
+	if [ ! -e "/sys/kernel/debug/powerpc/eeh_dev_check" ] && \
+	   [ ! -e "/sys/kernel/debug/powerpc/eeh_dev_break" ] ; then
+		echo "debugfs EEH testing files are missing. Is debugfs mounted?"
+		exit $KSELFTESTS_SKIP;
+	fi
+
+	# Bump the max freeze count to something absurd so we don't
+	# trip over it while breaking things.
+	echo 5000 > /sys/kernel/debug/powerpc/eeh_max_freezes
+}
+
+eeh_can_break() {
+	# skip bridges since we can't recover them (yet...)
+	if [ -e "/sys/bus/pci/devices/$dev/pci_bus" ] ; then
+		echo "$dev, Skipped: bridge"
+		return 1;
+	fi
+
+	# The ahci driver doesn't support error recovery. If the ahci device
+	# happens to be hosting the root filesystem, and then we go and break
+	# it the system will generally go down. We should probably fix that
+	# at some point
+	if [ "ahci" = "$(basename $(realpath /sys/bus/pci/devices/$dev/driver))" ] ; then
+		echo "$dev, Skipped: ahci doesn't support recovery"
+		return 1;
+	fi
+
+	# Don't inject errosr into an already-frozen PE. This happens with
+	# PEs that contain multiple PCI devices (e.g. multi-function cards)
+	# and injecting new errors during the recovery process will probably
+	# result in the recovery failing and the device being marked as
+	# failed.
+	if ! pe_ok $dev ; then
+		echo "$dev, Skipped: Bad initial PE state"
+		return 1;
+	fi
+
+	return 0
+}
+
 eeh_one_dev() {
 	local dev="$1"
 
-- 
2.26.2

