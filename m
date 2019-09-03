Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD99A66C0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:49:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N3cR5Q5RzDqQJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:49:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XuYvlS3a"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2tt2pbFzDqbx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:17:10 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id q21so5454396pfn.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuE/xU0WLbAKCushxzM6VLwrglMp5CDHJ8t2/oskUCE=;
 b=XuYvlS3a51NMP2ZlyTshaGF4ynnLB/z2Io9Ws1Jwr5ojzqEDGDCt5t/dG/mdZdfTuP
 7QaMEhtXqr2trngrNspe38gqHe5hz92g8P3U2dPd/wkvWNVRpWWJU4uafTk0CdEkbfw6
 NmJFOxARodHIG3URDC1GbUpFL33oEQm0Js3em1sj4sYG/A2Y9Zyv8ccElwlwJ/W8UQbq
 B/8LbqLqCWbZbPXDj/zr1f2lR//BWNH62IM+Ic0/BPKzBJXt3oVPjNQxE6im5aRnAKaV
 JnZiTHVH3GuQZXvdloIY49xxAeHpGX3r1oSo0SMs+0ZkSH1fd+dMqvx5CwvHqoEmWlnf
 3XWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuE/xU0WLbAKCushxzM6VLwrglMp5CDHJ8t2/oskUCE=;
 b=Nb7gOnjdM/Z8T4F98p/wRcoDXTAu0emI4UpNKXf5OnUZc74CXJuS14ByTex+PbWYKu
 qTpEg2jiJz4l3rVkODSQ/refoGskjSkOb3OWJluotl5S/cIo4k90o9jfhyenqm2p+xEY
 fFam5OXoaLkQi1jnnUETujqOld2kB8IDtV++tpNZhFqyBYWUs4wVeEBVeHbEbwlvfQmq
 EDfkMRvMuyJwz5JTkpHLGOhpWVl9/MVkvj2xCtU92dmMGN8wwe3oIrZ0gdaSwrV3wTET
 k5JejkrvErZtmWNjNOUBEhzWSl1+6awR50vT6+SISsS/5+TZi4tS9sLL4ulsDLjd1OCY
 OjGA==
X-Gm-Message-State: APjAAAU64bApMApVAXAWoYSE2GIn5A8fDzPpJW/1rigwuyBLna85OuRK
 +F5L+PBX3C6AqXD+I7858/BzGV3H
X-Google-Smtp-Source: APXvYqzOO8OLLjObnp0hQOzkOnfIfxYJin+oN4KncylQbfLt+PqKCe2yUb7Dt+jDa1scKYsk2XwEQw==
X-Received: by 2002:a65:621a:: with SMTP id d26mr23125656pgv.153.1567505827409; 
 Tue, 03 Sep 2019 03:17:07 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:17:06 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/14] selftests/powerpc: Add basic EEH selftest
Date: Tue,  3 Sep 2019 20:16:05 +1000
Message-Id: <20190903101605.2890-15-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903101605.2890-1-oohall@gmail.com>
References: <20190903101605.2890-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the new eeh_dev_check and eeh_dev_break interfaces to test EEH
recovery.  Historically this has been done manually using platform specific
EEH error injection facilities (e.g. via RTAS). However, documentation on
how to use these facilities is haphazard at best and non-existent at worst
so it's hard to develop a cross-platform test.

The new debugfs interfaces allow the kernel to handle the platform specific
details so we can write a more generic set of sets. This patch adds the
most basic of recovery tests where:

a) Errors are injected and recovered from sequentially,
b) Errors are not injected into PCI-PCI bridges, such as PCIe switches.
c) Errors are only injected into device function zero.
d) No errors are injected into Virtual Functions.

a), b) and c) are largely due to limitations of Linux's EEH support.  EEH
recovery is serialised in the EEH recovery thread which forces a).
Similarly, multi-function PCI devices are almost always grouped into the
same PE so injecting an error on one function exercises the same code
paths. c) is because we currently more or less ignore PCI bridges during
recovery and assume that the recovered topology will be the same as the
original.

d) is due to the limits of the eeh_dev_break interface. With the current
implementation we can't inject an error into a specific VF without
potentially causing additional errors on other VFs. Due to the serialised
recovery process we might end up timing out waiting for another function to
recover before the function of interest is recovered. The platform specific
error injection facilities are finer-grained and allow this capability, but
doing that requires working out how to use those facilities first.

Basicly, it's better than nothing and it's a base to build on.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 tools/testing/selftests/powerpc/Makefile      |  1 +
 tools/testing/selftests/powerpc/eeh/Makefile  |  9 ++
 .../selftests/powerpc/eeh/eeh-basic.sh        | 82 +++++++++++++++++++
 .../selftests/powerpc/eeh/eeh-functions.sh    | 76 +++++++++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/eeh/Makefile
 create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-basic.sh
 create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-functions.sh

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index b3ad909aefbc..644770c3b754 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -26,6 +26,7 @@ SUB_DIRS = alignment		\
 	   switch_endian	\
 	   syscalls		\
 	   tm			\
+	   eeh			\
 	   vphn         \
 	   math		\
 	   ptrace	\
diff --git a/tools/testing/selftests/powerpc/eeh/Makefile b/tools/testing/selftests/powerpc/eeh/Makefile
new file mode 100644
index 000000000000..b397babd569b
--- /dev/null
+++ b/tools/testing/selftests/powerpc/eeh/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+noarg:
+	$(MAKE) -C ../
+
+TEST_PROGS := eeh-basic.sh
+TEST_FILES := eeh-functions.sh
+
+top_srcdir = ../../../../..
+include ../../lib.mk
diff --git a/tools/testing/selftests/powerpc/eeh/eeh-basic.sh b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
new file mode 100755
index 000000000000..f988d2f42e8f
--- /dev/null
+++ b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
@@ -0,0 +1,82 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+. ./eeh-functions.sh
+
+if ! eeh_supported ; then
+	echo "EEH not supported on this system, skipping"
+	exit 0;
+fi
+
+if [ ! -e "/sys/kernel/debug/powerpc/eeh_dev_check" ] && \
+   [ ! -e "/sys/kernel/debug/powerpc/eeh_dev_break" ] ; then
+	echo "debugfs EEH testing files are missing. Is debugfs mounted?"
+	exit 1;
+fi
+
+pre_lspci=`mktemp`
+lspci > $pre_lspci
+
+# Bump the max freeze count to something absurd so we don't
+# trip over it while breaking things.
+echo 5000 > /sys/kernel/debug/powerpc/eeh_max_freezes
+
+# record the devices that we break in here. Assuming everything
+# goes to plan we should get them back once the recover process
+# is finished.
+devices=""
+
+# Build up a list of candidate devices.
+for dev in `ls -1 /sys/bus/pci/devices/ | grep '\.0$'` ; do
+	# skip bridges since we can't recover them (yet...)
+	if [ -e "/sys/bus/pci/devices/$dev/pci_bus" ] ; then
+		echo "$dev, Skipped: bridge"
+		continue;
+	fi
+
+	# Skip VFs for now since we don't have a reliable way
+	# to break them.
+	if [ -e "/sys/bus/pci/devices/$dev/physfn" ] ; then
+		echo "$dev, Skipped: virtfn"
+		continue;
+	fi
+
+	# Don't inject errosr into an already-frozen PE. This happens with
+	# PEs that contain multiple PCI devices (e.g. multi-function cards)
+	# and injecting new errors during the recovery process will probably
+	# result in the recovery failing and the device being marked as
+	# failed.
+	if ! pe_ok $dev ; then
+		echo "$dev, Skipped: Bad initial PE state"
+		continue;
+	fi
+
+	echo "$dev, Added"
+
+	# Add to this list of device to check
+	devices="$devices $dev"
+done
+
+dev_count="$(echo $devices | wc -w)"
+echo "Found ${dev_count} breakable devices..."
+
+failed=0
+for dev in $devices ; do
+	echo "Breaking $dev..."
+
+	if ! pe_ok $dev ; then
+		echo "Skipping $dev, Initial PE state is not ok"
+		failed="$((failed + 1))"
+		continue;
+	fi
+
+	if ! eeh_one_dev $dev ; then
+		failed="$((failed + 1))"
+	fi
+done
+
+echo "$failed devices failed to recover ($dev_count tested)"
+lspci | diff -u $pre_lspci -
+rm -f $pre_lspci
+
+exit $failed
diff --git a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
new file mode 100755
index 000000000000..26112ab5cdf4
--- /dev/null
+++ b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
@@ -0,0 +1,76 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+pe_ok() {
+	local dev="$1"
+	local path="/sys/bus/pci/devices/$dev/eeh_pe_state"
+
+	if ! [ -e "$path" ] ; then
+		return 1;
+	fi
+
+	local fw_state="$(cut -d' ' -f1 < $path)"
+	local sw_state="$(cut -d' ' -f2 < $path)"
+
+	# If EEH_PE_ISOLATED or EEH_PE_RECOVERING are set then the PE is in an
+	# error state or being recovered. Either way, not ok.
+	if [ "$((sw_state & 0x3))" -ne 0 ] ; then
+		return 1
+	fi
+
+	# A functioning PE should have the EEH_STATE_MMIO_ACTIVE and
+	# EEH_STATE_DMA_ACTIVE flags set. For some goddamn stupid reason
+	# the platform backends set these when the PE is in reset. The
+	# RECOVERING check above should stop any false positives though.
+	if [ "$((fw_state & 0x18))" -ne "$((0x18))" ] ; then
+		return 1
+	fi
+
+	return 0;
+}
+
+eeh_supported() {
+	test -e /proc/powerpc/eeh && \
+	grep -q 'EEH Subsystem is enabled' /proc/powerpc/eeh
+}
+
+eeh_one_dev() {
+	local dev="$1"
+
+	# Using this function from the command line is sometimes useful for
+	# testing so check that the argument is a well-formed sysfs device
+	# name.
+	if ! test -e /sys/bus/pci/devices/$dev/ ; then
+		echo "Error: '$dev' must be a sysfs device name (DDDD:BB:DD.F)"
+		return 1;
+	fi
+
+	# Break it
+	echo $dev >/sys/kernel/debug/powerpc/eeh_dev_break
+
+	# Force an EEH device check. If the kernel has already
+	# noticed the EEH (due to a driver poll or whatever), this
+	# is a no-op.
+	echo $dev >/sys/kernel/debug/powerpc/eeh_dev_check
+
+	# Enforce a 30s timeout for recovery. Even the IPR, which is infamously
+	# slow to reset, should recover within 30s.
+	max_wait=30
+
+	for i in `seq 0 ${max_wait}` ; do
+		if pe_ok $dev ; then
+			break;
+		fi
+		echo "$dev, waited $i/${max_wait}"
+		sleep 1
+	done
+
+	if ! pe_ok $dev ; then
+		echo "$dev, Failed to recover!"
+		return 1;
+	fi
+
+	echo "$dev, Recovered after $i seconds"
+	return 0;
+}
+
-- 
2.21.0

