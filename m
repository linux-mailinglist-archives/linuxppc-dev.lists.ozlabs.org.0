Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B222A3BB5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 06:14:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHyD3YV4zDqTW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:14:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F0TbC7pV; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQHJs42G6zDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:45:17 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id h6so12713748pgk.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0yChsQ5b8T69J36hGvLsMSMC6QOmHCCO5QKFa4zk1Ls=;
 b=F0TbC7pVKFZm/z4xFJyyQDCbBc5vpD2f9IjVgBLjfz3nNt98QXShWrtJ0UG7KYttzn
 vqenDdWrigpumnJLCGXkXDZDPVILua1bGUWRui5Cpw3N+aqeKEbvQHvHR+CV61E7D19O
 O2FzpZmziAkSjPAXmGtAVgTTVMEpXp+hvo2S8wI2fRRRgTo3Ea7tRKEUwUB0Tch7mE3+
 FFh07bOBiwPK4qosBwkoB55k9oDMm/mjv67e1dtRWlfVSojchBtFUPYQfjStlaoher/t
 ChqEIT9lYMLc0tY6W25aNnUFtJxHV2W549wLwCS0p4hxxq0vRwU+dlgyCycUqNJ0pZRo
 YfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0yChsQ5b8T69J36hGvLsMSMC6QOmHCCO5QKFa4zk1Ls=;
 b=QZXsEtv01zp5A5AoLq1VKEL8U52n0i7yEjNlCoIUG3s7VRHaBOyuAJcMAvRx9gIHUo
 S7mIRORCF0dxcLW+Hvpckvkt2X9Tn9e0u01xa3m6rPNESSrbds2cHgPn0l/V7CbO2UAQ
 ne2gcnHkvsfYYeFfN3DB4SOQJQfqCHYMRqDMCDLu+nAsRS5U0b5I/06PNZ4DtSQY4C0Q
 SNEutOtUy0oD6h9n/t952uWEX/EfksP0OkxcjxMaM8hg3J0yrTxBQo5IV8eX5f9za/vF
 y+L/Aefyj/Ub0iCrtGZDw0AjPdfQYYh0n8izdkyw5D5Xb4MbzAUt8xxfYbs9X+DqPLlQ
 U/yQ==
X-Gm-Message-State: AOAM531WveAjleKCVREMphhXAuogRkxExz9lcWFSiQUqA9YEgoQrRUoU
 xT+Ko+QYetzr8nGnwAfkwFsyLT4fd7s=
X-Google-Smtp-Source: ABdhPJxsLyNltqrdze94yszypdMu8z3dc6ZZiKiCch7ZS5P8QhCA31Tk8P0WsRaq0mtcRAaosvNdwQ==
X-Received: by 2002:a63:a5e:: with SMTP id z30mr8316169pgk.233.1604378714851; 
 Mon, 02 Nov 2020 20:45:14 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id a84sm494691pfa.53.2020.11.02.20.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:45:14 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] selftests/powerpc: Use stderr for debug messages in
 eeh-functions
Date: Tue,  3 Nov 2020 15:45:02 +1100
Message-Id: <20201103044503.917128-2-oohall@gmail.com>
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

We want to use stdout to return lists of devices, etc so log debug / status
messages to stderr rather than stdout.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 .../selftests/powerpc/eeh/eeh-functions.sh    | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
index 9b1bcc1fd4ad..32e5b7fbf18a 100644
--- a/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-functions.sh
@@ -3,6 +3,10 @@
 
 export KSELFTESTS_SKIP=4
 
+log() {
+	echo >/dev/stderr $*
+}
+
 pe_ok() {
 	local dev="$1"
 	local path="/sys/bus/pci/devices/$dev/eeh_pe_state"
@@ -49,7 +53,7 @@ eeh_test_prep() {
 
 	if [ ! -e "/sys/kernel/debug/powerpc/eeh_dev_check" ] && \
 	   [ ! -e "/sys/kernel/debug/powerpc/eeh_dev_break" ] ; then
-		echo "debugfs EEH testing files are missing. Is debugfs mounted?"
+		log "debugfs EEH testing files are missing. Is debugfs mounted?"
 		exit $KSELFTESTS_SKIP;
 	fi
 
@@ -61,7 +65,7 @@ eeh_test_prep() {
 eeh_can_break() {
 	# skip bridges since we can't recover them (yet...)
 	if [ -e "/sys/bus/pci/devices/$dev/pci_bus" ] ; then
-		echo "$dev, Skipped: bridge"
+		log "$dev, Skipped: bridge"
 		return 1;
 	fi
 
@@ -70,7 +74,7 @@ eeh_can_break() {
 	# it the system will generally go down. We should probably fix that
 	# at some point
 	if [ "ahci" = "$(basename $(realpath /sys/bus/pci/devices/$dev/driver))" ] ; then
-		echo "$dev, Skipped: ahci doesn't support recovery"
+		log "$dev, Skipped: ahci doesn't support recovery"
 		return 1;
 	fi
 
@@ -80,7 +84,7 @@ eeh_can_break() {
 	# result in the recovery failing and the device being marked as
 	# failed.
 	if ! pe_ok $dev ; then
-		echo "$dev, Skipped: Bad initial PE state"
+		log "$dev, Skipped: Bad initial PE state"
 		return 1;
 	fi
 
@@ -94,7 +98,7 @@ eeh_one_dev() {
 	# testing so check that the argument is a well-formed sysfs device
 	# name.
 	if ! test -e /sys/bus/pci/devices/$dev/ ; then
-		echo "Error: '$dev' must be a sysfs device name (DDDD:BB:DD.F)"
+		log "Error: '$dev' must be a sysfs device name (DDDD:BB:DD.F)"
 		return 1;
 	fi
 
@@ -118,16 +122,16 @@ eeh_one_dev() {
 		if pe_ok $dev ; then
 			break;
 		fi
-		echo "$dev, waited $i/${max_wait}"
+		log "$dev, waited $i/${max_wait}"
 		sleep 1
 	done
 
 	if ! pe_ok $dev ; then
-		echo "$dev, Failed to recover!"
+		log "$dev, Failed to recover!"
 		return 1;
 	fi
 
-	echo "$dev, Recovered after $i seconds"
+	log "$dev, Recovered after $i seconds"
 	return 0;
 }
 
-- 
2.26.2

