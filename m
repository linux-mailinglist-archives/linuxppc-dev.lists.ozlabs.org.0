Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FF5866EED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 10:43:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V+CkjGK/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjwfD5l2Wz3vkp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 20:43:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V+CkjGK/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjwYj6ns2z3cJ9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 20:39:21 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso2136838a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 01:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708940359; x=1709545159; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfqFlNeWfcRgXj7UGW4upVJVIE+P49J1N2eRNhWx+y8=;
        b=V+CkjGK/kWdweusosVB2jTnl2kUQPo882UWCtkKjUN/lnu+gVbSOWRp3IdefiX8Cc3
         91dCXUAYM7Dj/bHF+lYVC+TH1F60m/RXFnSRXVa34uZCoAFeEynVpRuVRFybyDfPfIW3
         QxhedCP0JllxZk7OUHaf+SW3qb35sknUrn1QjjVmQXEPm71VuCwv32L7fWw0/0T5+DiX
         LBwvIkHZDrxngzMZGl3vdt7nZZVpkJsNNDgK8gbgGveTEo6BqNT61w/ilpj0EOqXljLK
         w/Mg75ft6vN0ZECjDjtNeGHXocV8ZRu5ceougvKAB34jlzVkwSm5ZnoSrDs2OIahPsOJ
         I9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708940359; x=1709545159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfqFlNeWfcRgXj7UGW4upVJVIE+P49J1N2eRNhWx+y8=;
        b=shHf8fD3e5X+K0MQ+ny7BGeeZJE2RVbKitFvgic+QVtw1bqeS6Kj4CNOtD9te/fDyN
         XGUg1m2lZFwKsLalDUsHGr7Aj+lRBOj1R9RzgsG6ptsxai/TaamKEAIxY7yXLPY1nCUz
         wrI5kDSav00No8Edmk3xeF7sKLkJhpbte5CGwfn2bq27TCTwarlYQdhNP8t4JSxk1cjy
         sz+Hf5oL+I0ZeME/tb1kifCF9pGhtTWFHFd+yvujWH9LYaHXfQPr54L0i1D17gapHNTV
         SEvVKOnd8x4HUbG2ynM0b+hYdJyCdhNWC287UNReS+ybwfhaP1xcJV9gYEPBMwPopj3i
         xTjA==
X-Forwarded-Encrypted: i=1; AJvYcCUtRraSU/ylCtx4o8aGY9xsX5MPvHtDEPIQ6rwB/99bBB61sTZr9uw3yMzphtAgsFmpQxjrIeUFAt9qZw1T0D2QBUtg9b8cYfjUIkVoEg==
X-Gm-Message-State: AOJu0YyvtdPD4Vej5kbpEuAt9ScCcWFqKCqFkGO7+1JGK00II5dsU466
	mnXkdArJu7dXeTDbrb1FuSGARw4H7Sw4cZMpyJqa8XWFD2WZBpIupaGLTeKz
X-Google-Smtp-Source: AGHT+IHbh6SI8T6/s0c3UOyoHhOzc5xA5DNsPoVfksWo0VGv11hLE0/hAfkwS0iY70YPjKgUhGHHIw==
X-Received: by 2002:a05:6a20:9694:b0:1a0:e09d:8ed1 with SMTP id hp20-20020a056a20969400b001a0e09d8ed1mr3838940pzc.53.1708940359344;
        Mon, 26 Feb 2024 01:39:19 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id pa3-20020a17090b264300b0029929ec25fesm6036782pjb.27.2024.02.26.01.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 01:39:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 5/7] arch-run: Add a "continuous" migration option for tests
Date: Mon, 26 Feb 2024 19:38:30 +1000
Message-ID: <20240226093832.1468383-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226093832.1468383-1-npiggin@gmail.com>
References: <20240226093832.1468383-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
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
index d0f6f098f..5c7e72036 100644
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
+		if [[ ${continuous_migration} -eq 1 ]] ; then
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
+	while [[ ${continuous_migration} -eq 0 ]] && ! seen_migrate_msg ${src_out} ; do
 		if ! ps -p ${live_pid} > /dev/null ; then
 			echo > ${dst_infifo}
 			qmp ${dst_qmp} '"quit"'> ${dst_qmpout} 2>/dev/null
@@ -229,12 +235,32 @@ do_migration ()
 		sleep 0.1
 	done
 
+	if grep -q "Begin continuous migration" < ${src_out} ; then
+		if [[ ${continuous_migration} -eq 1 ]] ; then
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
+		if [[ ${continuous_migration} -eq 1 ]] ; then
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
+		if [[ ${continuous_migration} -eq 0 ]] ; then
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
+	if [[ ${continuous_migration} -eq 0 ]]; then
+		# keypress to dst so getchar completes and test continues
+		echo > ${dst_infifo}
+	fi
 
 	# Ensure the incoming socket is removed, ready for next destination
 	if [ -S ${dst_incoming} ] ; then
-- 
2.42.0

