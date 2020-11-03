Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C436A2A3BB8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 06:15:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQJ071G4czDqCt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:15:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q8frw9zv; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQHJw0nTNzDqGm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:45:19 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id o3so12688845pgr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=agvQ3ZyGhauvIfharAWAuaXeGE+xtDPU3qHRS9piZV8=;
 b=Q8frw9zvpRzTxfSNehqlCtumte2M+zu+ZubhumvDbV5LCmZTOXB3V8ZcoYGOOzMZPk
 ql49xa24cCmawDqywyG+9jdyNiEwBlFNngI6csypi02VAa21xZeSIffV03CWVTM2PNVj
 1McsHWzB4XauPJbMAXYfjZfCIL6HrzQKl7gq3QMx0T3D5Yoa6MhnNjRoy/ma4CnHwNMb
 8F2vs3M3vGVvKTWus0FcOR2ltZTZD1eM3hi+TppTyisJOBaepZIfrOJnZeIwhJz4MYX6
 EaJlTkEGTvnXCAbkVtW3CqiVwAf3FQlpBSFmB1UIH6/iykSICKE5PIbRldvYU0NltOHm
 K1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=agvQ3ZyGhauvIfharAWAuaXeGE+xtDPU3qHRS9piZV8=;
 b=OfD68o7VoixvgN36OERPq7syFV2wLX7GYoGdn0pakwdE+CYnlzfhr/+Kn3vHLAalK0
 BfgKm/OopK2v+7NIvgqPikKpPWYy/OkUgYsOOiNXisqGjlH9dHQKWL9mpNU0XRqW9HY9
 KV+zEviuHdEbQh4Oap1kg8a53u9yGlsKmxJSWOjk5rTi3XHf+cRwtChh9t9FC2T9YDLl
 WDNFLNXn+gSuexDV9YzwOqbRsFhegdUCe/k1VHhJXDbZm/XKAVvP9YnK9mNfa+fuaZ0Q
 04WHE54lla9yjwITtiyvr3ZlIpgxlGAad+nb+qRvuRqDiPN0T3TQA8E6jRVkc3xDdTYW
 Rhgw==
X-Gm-Message-State: AOAM531Ic3cKi03qjoMGwOqGxKgbU2SOrCyW+PWObiPLXBVhQllw9O2s
 3AfkBuDbVHAiXueEUT2hSPXFffhC/ec=
X-Google-Smtp-Source: ABdhPJz4HRsmCJypU/thUNXanEyiwHa4mzp/+EXBHr95zROCRLY0w8pAYG+K3InUZQSeLngcwPtfjg==
X-Received: by 2002:aa7:8548:0:b029:164:769a:353 with SMTP id
 y8-20020aa785480000b0290164769a0353mr24678487pfn.45.1604378716763; 
 Mon, 02 Nov 2020 20:45:16 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id a84sm494691pfa.53.2020.11.02.20.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:45:16 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] selftests/powerpc: Add VF recovery tests
Date: Tue,  3 Nov 2020 15:45:03 +1100
Message-Id: <20201103044503.917128-3-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103044503.917128-1-oohall@gmail.com>
References: <20201103044503.917128-1-oohall@gmail.com>
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

The basic EEH test ignores VFs since we the way the eeh_dev_break debugfs
interface works means that if multiple VFs are enabled we may cause errors
on all them them. However, we can work around that by only enabling a
single VF at a time.

This patch adds some infrastructure for finding SR-IOV capable devices and
enabling / disabling VFs so we can exercise the VF specific EEH recovery
paths. Two new tests are added, one for testing EEH aware devices and one
for EEH un-aware VFs.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 .../selftests/powerpc/eeh/eeh-functions.sh    | 108 ++++++++++++++++++
 .../selftests/powerpc/eeh/eeh-vf-aware.sh     |  45 ++++++++
 .../selftests/powerpc/eeh/eeh-vf-unaware.sh   |  35 ++++++
 3 files changed, 188 insertions(+)
 create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
 create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-vf-unaware.sh

diff --git a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
index 32e5b7fbf18a..70daa3925dcb 100644
--- a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
@@ -135,3 +135,111 @@ eeh_one_dev() {
 	return 0;
 }
 
+eeh_has_driver() {
+	test -e /sys/bus/pci/devices/$1/driver;
+	return $?
+}
+
+eeh_can_recover() {
+	# we'll get an IO error if the device's current driver doesn't support
+	# error recovery
+	echo $1 > '/sys/kernel/debug/powerpc/eeh_dev_can_recover' 2>/dev/null
+
+	return $?
+}
+
+eeh_find_all_pfs() {
+	devices=""
+
+	# SR-IOV on pseries requires hypervisor support, so check for that
+	is_pseries=""
+	if grep -q pSeries /proc/cpuinfo ; then
+		if [ ! -f /proc/device-tree/rtas/ibm,open-sriov-allow-unfreeze ] ||
+		   [ ! -f /proc/device-tree/rtas/ibm,open-sriov-map-pe-number ] ; then
+			return 1;
+		fi
+
+		is_pseries="true"
+	fi
+
+	for dev in `ls -1 /sys/bus/pci/devices/` ; do
+		sysfs="/sys/bus/pci/devices/$dev"
+		if [ ! -e "$sysfs/sriov_numvfs" ] ; then
+			continue
+		fi
+
+		# skip unsupported PFs on pseries
+		if [ -z "$is_pseries" ] &&
+		   [ ! -f "$sysfs/of_node/ibm,is-open-sriov-pf" ] &&
+		   [ ! -f "$sysfs/of_node/ibm,open-sriov-vf-bar-info" ] ; then
+			continue;
+		fi
+
+		# no driver, no vfs
+		if ! eeh_has_driver $dev ; then
+			continue
+		fi
+
+		devices="$devices $dev"
+	done
+
+	if [ -z "$devices" ] ; then
+		return 1;
+	fi
+
+	echo $devices
+	return 0;
+}
+
+# attempts to enable one VF on each PF so we can do VF specific tests.
+# stdout: list of enabled VFs, one per line
+# return code: 0 if vfs are found, 1 otherwise
+eeh_enable_vfs() {
+	pf_list="$(eeh_find_all_pfs)"
+
+	vfs=0
+	for dev in $pf_list ; do
+		pf_sysfs="/sys/bus/pci/devices/$dev"
+
+		# make sure we have a single VF
+		echo 0 > "$pf_sysfs/sriov_numvfs"
+		echo 1 > "$pf_sysfs/sriov_numvfs"
+		if [ "$?" != 0 ] ; then
+			log "Unable to enable VFs on $pf, skipping"
+			continue;
+		fi
+
+		vf="$(basename $(realpath "$pf_sysfs/virtfn0"))"
+		if [ $? != 0 ] ; then
+			log "unable to find enabled vf on $pf"
+			echo 0 > "$pf_sysfs/sriov_numvfs"
+			continue;
+		fi
+
+		if ! eeh_can_break $vf ; then
+			log "skipping "
+
+			echo 0 > "$pf_sysfs/sriov_numvfs"
+			continue;
+		fi
+
+		vfs="$((vfs + 1))"
+		echo $vf
+	done
+
+	test "$vfs" != 0
+	return $?
+}
+
+eeh_disable_vfs() {
+	pf_list="$(eeh_find_all_pfs)"
+	if [ -z "$pf_list" ] ; then
+		return 1;
+	fi
+
+	for dev in $pf_list ; do
+		echo 0 > "/sys/bus/pci/devices/$dev/sriov_numvfs"
+	done
+
+	return 0;
+}
diff --git a/tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh b/tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
new file mode 100755
index 000000000000..874c11953bb6
--- /dev/null
+++ b/tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
@@ -0,0 +1,45 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+. ./eeh-functions.sh
+
+eeh_test_prep # NB: may exit
+
+vf_list="$(eeh_enable_vfs)";
+if $? != 0 ; then
+	log "No usable VFs found. Skipping EEH unaware VF test"
+	exit $KSELFTESTS_SKIP;
+fi
+
+log "Enabled VFs: $vf_list"
+
+tested=0
+passed=0
+for vf in $vf_list ; do
+	log "Testing $vf"
+
+	if ! eeh_can_recover $vf ; then
+		log "Driver for $vf doesn't support error recovery, skipping"
+		continue;
+	fi
+
+	tested="$((tested + 1))"
+
+	log "Breaking $vf..."
+	if ! eeh_one_dev $vf ; then
+		log "$vf failed to recover"
+		continue;
+	fi
+
+	passed="$((passed + 1))"
+done
+
+eeh_disable_vfs
+
+if [ "$tested" == 0 ] ; then
+	echo "No VFs with EEH aware drivers found, skipping"
+	exit $KSELFTESTS_SKIP
+fi
+
+test "$failed" != 0
+exit $?;
diff --git a/tools/testing/selftests/powerpc/eeh/eeh-vf-unaware.sh b/tools/testing/selftests/powerpc/eeh/eeh-vf-unaware.sh
new file mode 100755
index 000000000000..8a4c147b9d43
--- /dev/null
+++ b/tools/testing/selftests/powerpc/eeh/eeh-vf-unaware.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+. ./eeh-functions.sh
+
+eeh_test_prep # NB: may exit
+
+vf_list="$(eeh_enable_vfs)";
+if $? != 0 ; then
+	log "No usable VFs found. Skipping EEH unaware VF test"
+	exit $KSELFTESTS_SKIP;
+fi
+
+log "Enabled VFs: $vf_list"
+
+failed=0
+for vf in $vf_list ; do
+	log "Testing $vf"
+
+	if eeh_can_recover $vf ; then
+		log "Driver for $vf supports error recovery. Unbinding..."
+		echo "$vf" > /sys/bus/pci/devices/$vf/driver/unbind
+	fi
+
+	log "Breaking $vf..."
+	if ! eeh_one_dev $vf ; then
+		log "$vf failed to recover"
+		failed="$((failed + 1))"
+	fi
+done
+
+eeh_disable_vfs
+
+test "$failed" != 0
+exit $?;
-- 
2.26.2

