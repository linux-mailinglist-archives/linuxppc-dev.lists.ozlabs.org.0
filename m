Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6C481598D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:47:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Btigtxqo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnT83jvKz3vdK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:47:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Btigtxqo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnNn3TG0z2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:43:37 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-35f418f394dso7224875ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734215; x=1703339015; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LS2wk0HqoVQXxTkAWKXFyNQT//H5V0Lk+DNT58M8Y8=;
        b=BtigtxqozelVQdAwPv4Zzm+EqPbgQ2ElFnAPmf7Ita4Qy4TKX5dl7xIWa60+ogBLv7
         0CHoCXE3QkUt60I8wEQX8pGzkUwlCLcnxdSyWC99tv6JrRN2zlFN5FEZZMnKetdh5vT3
         H4GIMsFWmpWBzBOKgiOQGO3Y9Sp+SSLPogaPeAkAXAKK6Fs5gIxiroqBthNN+0+jMuoD
         x9fxpp0v9IwR3c4epKjlgUzUJKi3nah3/D1EgyjbV7wheZXygmNYmsQ85wgaQP05flZN
         n9kva9PReauyIZ2uLB7tlDXGOJu2fbKDtgUFjU+AOLIEYHAKS7OTj4GXGR5/sk3H0P/F
         44RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734215; x=1703339015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LS2wk0HqoVQXxTkAWKXFyNQT//H5V0Lk+DNT58M8Y8=;
        b=v+sD4ZF9sphqi1xhUdVyabpPIaHwDUDgGuS6Hw2mK0YxwRz5Vro46IeMnyF9JP9Eyp
         lAeg60YBcCCRaUcMLVaLMmG8tfcG461IoxsZL/xsj9G8iMEM05FkDnbk3eHtx9Odqkzs
         6GXdOnmBqX6JBjifuLBUa7o9NTIcJ6HDRInXH8YHBngexk0pJ3oBXSg4eru+JbDL335J
         bPxUdAZZSwW38BQTpE1jWDGSEmOhNwa5e/hELoh3IsLKD5hq1KLwFi0uzduOuVarnJwl
         +P/0rLFuxLAJDm3FkrHT7T9FBGiZbuByXidGt/5M7bdS50ASscRnjgdH+dX+lx0q/LF8
         VLVw==
X-Gm-Message-State: AOJu0YxuNwckZJ47iRFvUOqLPwgHGLW48D20dZsemMZnPEWhGaq1I01K
	x4A8f+chuwL5lqgiKOBj3H3NHnhjDWo=
X-Google-Smtp-Source: AGHT+IGshhZvb1z6CrG2R2sGTX7f3QlSAvAP5H2THYME1OoWCfGtCprBeirIkMnuePbrF4XZ4bII/Q==
X-Received: by 2002:a05:6e02:1e0c:b0:35f:535a:9c65 with SMTP id g12-20020a056e021e0c00b0035f535a9c65mr15289520ila.29.1702734214788;
        Sat, 16 Dec 2023 05:43:34 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:43:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 04/29] migration: Support multiple migrations
Date: Sat, 16 Dec 2023 23:42:31 +1000
Message-ID: <20231216134257.1743345-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Support multiple migrations by flipping dest file/socket variables to
source after the migration is complete, ready to start again. A new
destination is created if the test outputs the migrate line again.
Test cases may now switch to calling migrate() one or more times.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/migrate.c         |  8 ++--
 lib/migrate.h         |  1 +
 scripts/arch-run.bash | 94 +++++++++++++++++++++++++++++++++++++------
 3 files changed, 86 insertions(+), 17 deletions(-)

diff --git a/lib/migrate.c b/lib/migrate.c
index 527e63ae..b7721659 100644
--- a/lib/migrate.c
+++ b/lib/migrate.c
@@ -8,8 +8,10 @@
 #include <libcflat.h>
 #include "migrate.h"
 
-/* static for now since we only support migrating exactly once per test. */
-static void migrate(void)
+/*
+ * Initiate migration and wait for it to complete.
+ */
+void migrate(void)
 {
 	puts("Now migrate the VM, then press a key to continue...\n");
 	(void)getchar();
@@ -19,8 +21,6 @@ static void migrate(void)
 /*
  * Initiate migration and wait for it to complete.
  * If this function is called more than once, it is a no-op.
- * Since migrate_cmd can only migrate exactly once this function can
- * simplify the control flow, especially when skipping tests.
  */
 void migrate_once(void)
 {
diff --git a/lib/migrate.h b/lib/migrate.h
index 3c94e6af..2af06a72 100644
--- a/lib/migrate.h
+++ b/lib/migrate.h
@@ -6,4 +6,5 @@
  * Author: Nico Boehr <nrb@linux.ibm.com>
  */
 
+void migrate(void);
 void migrate_once(void);
diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 4d4e791c..02b15b4b 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -132,29 +132,77 @@ run_migration ()
 	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
 	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
 	migout_fifo1=$(mktemp -u -t mig-helper-fifo-stdout1.XXXXXXXXXX)
+	migout2=$(mktemp -t mig-helper-stdout2.XXXXXXXXXX)
+	migout_fifo2=$(mktemp -u -t mig-helper-fifo-stdout2.XXXXXXXXXX)
 	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
 	qmp2=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
 	fifo=$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
 
 	# race here between file creation and trap
 	trap "trap - TERM ; kill 0 ; exit 2" INT TERM
-	trap "rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}" RETURN EXIT
+	trap "rm -f ${migout1} ${migout2} ${migout_fifo1} ${migout_fifo2} ${migsock} ${qmp1} ${qmp2} ${fifo}" RETURN EXIT
 
 	qmpout1=/dev/null
 	qmpout2=/dev/null
+	migcmdline=$@
 
-	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
+	mkfifo ${migout_fifo1}
+	mkfifo ${migout_fifo2}
+
+	eval "$migcmdline" \
+		-chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
 		-mon chardev=mon1,mode=control > ${migout_fifo1} &
 	live_pid=$!
 	cat ${migout_fifo1} | tee ${migout1} &
 
-	# We have to use cat to open the named FIFO, because named FIFO's, unlike
-	# pipes, will block on open() until the other end is also opened, and that
-	# totally breaks QEMU...
+	# The test must prompt the user to migrate, so wait for the "migrate"
+	# keyword
+	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
+		if ! ps -p ${live_pid} > /dev/null ; then
+			echo "ERROR: Test exit before migration point." >&2
+			echo > ${fifo}
+			qmp ${qmp1} '"quit"'> ${qmpout1} 2>/dev/null
+			return 3
+		fi
+		sleep 0.1
+	done
+
+	# This starts the first source QEMU in advance of the test reaching the
+	# migration point, since we expect at least one migration. Subsequent
+	# sources are started as the test hits migrate keywords.
+	do_migration || return $?
+
+	while ps -p ${live_pid} > /dev/null ; do
+		# Wait for EXIT or further migrations
+		if ! grep -q -i "Now migrate the VM" < ${migout1} ; then
+			sleep 0.1
+		else
+			do_migration || return $?
+		fi
+	done
+
+	wait ${live_pid}
+	ret=$?
+
+	while (( $(jobs -r | wc -l) > 0 )); do
+		sleep 0.1
+	done
+
+	return $ret
+}
+
+do_migration ()
+{
+	# We have to use cat to open the named FIFO, because named FIFO's,
+	# unlike pipes, will block on open() until the other end is also
+	# opened, and that totally breaks QEMU...
 	mkfifo ${fifo}
-	eval "$@" -chardev socket,id=mon2,path=${qmp2},server=on,wait=off \
-		-mon chardev=mon2,mode=control -incoming unix:${migsock} < <(cat ${fifo}) &
+	eval "$migcmdline" \
+		-chardev socket,id=mon2,path=${qmp2},server=on,wait=off \
+		-mon chardev=mon2,mode=control -incoming unix:${migsock} \
+		< <(cat ${fifo}) > ${migout_fifo2} &
 	incoming_pid=$!
+	cat ${migout_fifo2} | tee ${migout2} &
 
 	# The test must prompt the user to migrate, so wait for the "migrate" keyword
 	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
@@ -165,7 +213,7 @@ run_migration ()
 			qmp ${qmp2} '"quit"'> ${qmpout2} 2>/dev/null
 			return 3
 		fi
-		sleep 1
+		sleep 0.1
 	done
 
 	# Wait until the destination has created the incoming socket
@@ -176,7 +224,7 @@ run_migration ()
 	# Wait for the migration to complete
 	migstatus=`qmp ${qmp1} '"query-migrate"' | grep return`
 	while ! grep -q '"completed"' <<<"$migstatus" ; do
-		sleep 1
+		sleep 0.1
 		if ! migstatus=`qmp ${qmp1} '"query-migrate"'`; then
 			echo "ERROR: Querying migration state failed." >&2
 			echo > ${fifo}
@@ -192,14 +240,34 @@ run_migration ()
 			return 2
 		fi
 	done
+
 	qmp ${qmp1} '"quit"'> ${qmpout1} 2>/dev/null
+
+	# keypress to dst so getchar completes and test continues
 	echo > ${fifo}
-	wait $incoming_pid
+	rm ${fifo}
+
+	# Ensure the incoming socket is removed, ready for next destination
+	if [ -S ${migsock} ] ; then
+		echo "ERROR: Incoming migration socket not removed after migration." >& 2
+		qmp ${qmp2} '"quit"'> ${qmpout2} 2>/dev/null
+		return 2
+	fi
+
+	wait ${live_pid}
 	ret=$?
 
-	while (( $(jobs -r | wc -l) > 0 )); do
-		sleep 0.5
-	done
+	# Now flip the variables because dest becomes source
+	live_pid=${incoming_pid}
+	tmp=${migout1}
+	migout1=${migout2}
+	migout2=${tmp}
+	tmp=${migout_fifo1}
+	migout_fifo1=${migout_fifo2}
+	migout_fifo2=${tmp}
+	tmp=${qmp1}
+	qmp1=${qmp2}
+	qmp2=${tmp}
 
 	return $ret
 }
-- 
2.42.0

