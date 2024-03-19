Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD12887F8C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:03:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=URplWMMK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPNc3Shhz3vZm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:03:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=URplWMMK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPJr2BRFz3dVK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 18:59:56 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e6c0098328so4280999b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835194; x=1711439994; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwiLL+39rNvTnl3S/NlQsxl8YV1cuqwJpTXMZpjU20o=;
        b=URplWMMKDG1IRgyBLBfBrifcl+5+AbiZ10io0SWTlATwf+bEi21wThzcv+NWXs2Em8
         UoQTO+xZNINEWnuRXsZMrQUGpoA2y7Yo6EUvnIXik7Mb4T0I/wv9CjoP/HJpmXI4ZtXt
         wyhj2c3lcGWaQ80hvObRrG/1AvHKYYlbfUFaSXzo4yPoynbedxUdLZ5ciaOAhPj6RS0/
         SZayo5WyPhHjm5JvFLYU2jdxDNZuo/IjIvUP1bbHEP6d749cfJO/MKjFMaP8nzYr1u0t
         SS6ZcM+XiGao0PGpu/FnaOzUkhJCZcy9sETpsXfj5mkkBdPNwfJ/FHvnSgOkRRQk7xVF
         pgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835194; x=1711439994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwiLL+39rNvTnl3S/NlQsxl8YV1cuqwJpTXMZpjU20o=;
        b=jbMS5wQ71E9XSamKfk7h8vtruKgoq4OS8uDQrKFXgepUZveYxq0n7LsD875fNKSM15
         wVeFb2CH8qRjfutwHjZHzBd67/FwYe2+FQtF3e4BGBFWCLbeRu9DQFEStDc27PzoWtj1
         X5ZKyACkUoXwm38gp+mV0pfQ3aOhnZEozwrq/Bfrx54eNTFyGOFrgoFsLgaKOhWGtQ+l
         kBGlFjVQxFmhBBeHUqXytBCSY91giG3bs5Gb/0OFieT6o2isu+XyviDHt/E2dobE/F3x
         JKHArGu3h6Sc9sqHhWrAmc0EZFjdpZqqTEs9MpHd0Uc9LokOSfi+GQXB51y5TxAeYo78
         Ix3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyRbM30FzBCfhb8uAPv/+Bbp6LpihVysoIJ/inGZwvdwpjO1Rv7zekFUBBDAWeheKlqlWGeysLC0ZkXOd6TtGXliRCcLPTMT6N2jaZ1A==
X-Gm-Message-State: AOJu0YzHJfmbPLgdswy7GN4etb2P+AR4Gu8VJRB7ZHPSM80ZG/sIyB0F
	wYpOs5N8dv5/e1TgdiyLK0sDTweEQ5VYtUg7bpn2leFIj0UAcOp1xriApVx5t4A=
X-Google-Smtp-Source: AGHT+IF9J5BfMuicYhHFmGj3QmDkgtilbahQgsH/XQQp9Mr0YY71rN0t/oPLgM3FmJxBPiyt5H8umA==
X-Received: by 2002:a05:6a00:844:b0:6e6:fb34:2568 with SMTP id q4-20020a056a00084400b006e6fb342568mr2080064pfk.0.1710835193686;
        Tue, 19 Mar 2024 00:59:53 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.00.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 00:59:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 05/35] arch-run: Add a "continuous" migration option for tests
Date: Tue, 19 Mar 2024 17:58:56 +1000
Message-ID: <20240319075926.2422707-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The cooperative migration protocol is very good to control precise
pre and post conditions for a migration event. However in some cases
its intrusiveness to the test program, can mask problems and make
analysis more difficult.

For example to stress test migration vs concurrent complicated
memory access, including TLB refill, ram dirtying, etc., then the
tight spin at getchar() and resumption of the workload after
migration is unhelpful.

This adds a continuous migration mode that directs the harness to
perform migrations continually. This is added to the migration
selftests, which also sees cooperative migration iterations reduced
to avoid increasing test time too much.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 common/selftest-migration.c | 16 +++++++++--
 lib/migrate.c               | 18 ++++++++++++
 lib/migrate.h               |  3 ++
 scripts/arch-run.bash       | 55 ++++++++++++++++++++++++++++++++-----
 4 files changed, 82 insertions(+), 10 deletions(-)

diff --git a/common/selftest-migration.c b/common/selftest-migration.c
index 0afd8581c..9a9b61835 100644
--- a/common/selftest-migration.c
+++ b/common/selftest-migration.c
@@ -9,12 +9,13 @@
  */
 #include <libcflat.h>
 #include <migrate.h>
+#include <asm/time.h>
 
-#define NR_MIGRATIONS 30
+#define NR_MIGRATIONS 15
 
 int main(int argc, char **argv)
 {
-	report_prefix_push("migration");
+	report_prefix_push("migration harness");
 
 	if (argc > 1 && !strcmp(argv[1], "skip")) {
 		migrate_skip();
@@ -24,7 +25,16 @@ int main(int argc, char **argv)
 
 		for (i = 0; i < NR_MIGRATIONS; i++)
 			migrate_quiet();
-		report(true, "simple harness stress");
+		report(true, "cooperative migration");
+
+		migrate_begin_continuous();
+		mdelay(2000);
+		migrate_end_continuous();
+		mdelay(1000);
+		migrate_begin_continuous();
+		mdelay(2000);
+		migrate_end_continuous();
+		report(true, "continuous migration");
 	}
 
 	report_prefix_pop();
diff --git a/lib/migrate.c b/lib/migrate.c
index 1d22196b7..770f76d5c 100644
--- a/lib/migrate.c
+++ b/lib/migrate.c
@@ -60,3 +60,21 @@ void migrate_skip(void)
 	puts("Skipped VM migration (quiet)\n");
 	(void)getchar();
 }
+
+void migrate_begin_continuous(void)
+{
+	puts("Begin continuous migration\n");
+	(void)getchar();
+}
+
+void migrate_end_continuous(void)
+{
+	/*
+	 * Migration can split this output between source and dest QEMU
+	 * output files, print twice and match once to always cope with
+	 * a split.
+	 */
+	puts("End continuous migration\n");
+	puts("End continuous migration (quiet)\n");
+	(void)getchar();
+}
diff --git a/lib/migrate.h b/lib/migrate.h
index db6e0c501..35b6703a2 100644
--- a/lib/migrate.h
+++ b/lib/migrate.h
@@ -11,3 +11,6 @@ void migrate_quiet(void);
 void migrate_once(void);
 
 void migrate_skip(void);
+
+void migrate_begin_continuous(void);
+void migrate_end_continuous(void);
diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 4a1aab48d..1901a929f 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -125,15 +125,17 @@ qmp_events ()
 filter_quiet_msgs ()
 {
 	grep -v "Now migrate the VM (quiet)" |
+	grep -v "Begin continuous migration (quiet)" |
+	grep -v "End continuous migration (quiet)" |
 	grep -v "Skipped VM migration (quiet)"
 }
 
 seen_migrate_msg ()
 {
 	if [ $skip_migration -eq 1 ]; then
-		grep -q -e "Now migrate the VM" < $1
+	        grep -q -e "Now migrate the VM" -e "Begin continuous migration" < $1
 	else
-		grep -q -e "Now migrate the VM" -e "Skipped VM migration" < $1
+	        grep -q -e "Now migrate the VM" -e "Begin continuous migration" -e "Skipped VM migration" < $1
 	fi
 }
 
@@ -161,6 +163,7 @@ run_migration ()
 	src_qmpout=/dev/null
 	dst_qmpout=/dev/null
 	skip_migration=0
+	continuous_migration=0
 
 	mkfifo ${src_outfifo}
 	mkfifo ${dst_outfifo}
@@ -186,9 +189,12 @@ run_migration ()
 	do_migration || return $?
 
 	while ps -p ${live_pid} > /dev/null ; do
-		# Wait for test exit or further migration messages.
-		if ! seen_migrate_msg ${src_out} ;  then
+		if [ ${continuous_migration} -eq 1 ] ; then
+			do_migration || return $?
+		elif ! seen_migrate_msg ${src_out} ;  then
 			sleep 0.1
+		elif grep -q "Begin continuous migration" < ${src_out} ; then
+			do_migration || return $?
 		elif grep -q "Now migrate the VM" < ${src_out} ; then
 			do_migration || return $?
 		elif [ $skip_migration -eq 0 ] && grep -q "Skipped VM migration" < ${src_out} ; then
@@ -218,7 +224,7 @@ do_migration ()
 
 	# The test must prompt the user to migrate, so wait for the
 	# "Now migrate VM" or similar console message.
-	while ! seen_migrate_msg ${src_out} ; do
+	while [ ${continuous_migration} -eq 0 ] && ! seen_migrate_msg ${src_out} ; do
 		if ! ps -p ${live_pid} > /dev/null ; then
 			echo > ${dst_infifo}
 			qmp ${dst_qmp} '"quit"'> ${dst_qmpout} 2>/dev/null
@@ -229,12 +235,32 @@ do_migration ()
 		sleep 0.1
 	done
 
+	if grep -q "Begin continuous migration" < ${src_out} ; then
+		if [ ${continuous_migration} -eq 1 ] ; then
+			echo > ${dst_infifo}
+			qmp ${dst_qmp} '"quit"'> ${dst_qmpout} 2>/dev/null
+			echo "ERROR: Continuous migration already begun." >&2
+			qmp ${src_qmp} '"quit"'> ${src_qmpout} 2>/dev/null
+			return 3
+		fi
+		continuous_migration=1
+		echo > ${src_infifo}
+	fi
+
 	# Wait until the destination has created the incoming and qmp sockets
 	while ! [ -S ${dst_incoming} ] ; do sleep 0.1 ; done
 	while ! [ -S ${dst_qmp} ] ; do sleep 0.1 ; done
 
 	if [ $skip_migration -eq 0 ] && grep -q "Skipped VM migration" < ${src_out} ; then
 		# May not get any migrations, exit to main loop for now...
+		# No migrations today, shut down dst in an orderly manner...
+		if [ ${continuous_migration} -eq 1 ] ; then
+			echo > ${dst_infifo}
+			qmp ${dst_qmp} '"quit"'> ${dst_qmpout} 2>/dev/null
+			echo "ERROR: Can't skip in continuous migration." >&2
+			qmp ${src_qmp} '"quit"'> ${src_qmpout} 2>/dev/null
+			return 3
+		fi
 		echo > ${dst_infifo}
 		qmp ${dst_qmp} '"quit"'> ${dst_qmpout} 2>/dev/null
 		echo > ${src_infifo} # Resume src and carry on.
@@ -266,8 +292,23 @@ do_migration ()
 
 	qmp ${src_qmp} '"quit"'> ${src_qmpout} 2>/dev/null
 
-	# keypress to dst so getchar completes and test continues
-	echo > ${dst_infifo}
+	# Should we end continuous migration?
+	if grep -q "End continuous migration" < ${src_out} ; then
+		if [ ${continuous_migration} -eq 0 ] ; then
+			echo "ERROR: Can't end continuous migration when not started." >&2
+			echo > ${dst_infifo}
+			qmp ${dst_qmp} '"quit"'> ${dst_qmpout} 2>/dev/null
+			qmp ${src_qmp} '"quit"'> ${src_qmpout} 2>/dev/null
+			return 3
+		fi
+		continuous_migration=0
+		echo > ${src_infifo}
+	fi
+
+	if [ ${continuous_migration} -eq 0 ]; then
+		# keypress to dst so getchar completes and test continues
+		echo > ${dst_infifo}
+	fi
 
 	# Wait for the incoming socket being removed, ready for next destination
 	while [ -S ${dst_incoming} ] ; do sleep 0.1 ; done
-- 
2.42.0

