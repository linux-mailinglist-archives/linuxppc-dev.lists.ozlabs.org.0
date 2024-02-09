Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8503484F09A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 08:05:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SvbKGWtt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWPy838h2z3vZb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:05:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SvbKGWtt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWPtb1hh5z3cN7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:02:31 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d7393de183so4744635ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 23:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707462149; x=1708066949; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpqZHmKQT++Y4YOLTxyI6uDILUR5f0/cqNvHxqH8mFw=;
        b=SvbKGWttUUnQKyvVuVbyFvUBCm+k6Kdq6PCrtDsDEibPnboA8OPGn0dOp1fSaThYzd
         9hxgZCE8OiCm642joFTS8wnI6Mf13lW7DzRQMfcvog58w1jeO7tP09wcnGlRocmTTAPU
         h8ZeE9tlJfJQQg35Lhy8FKKtanTSILtYcdELNugmZve6vBubmeuq6t2WkLP07P5CXYcg
         GddFDWu4fvpwZvdJJvgDSAX2zu6JsJmnck0FsavP7zT0QNExYT968FuT3FfdUhxQgHTd
         2GSfqoLvon57OA0ENdyIx8w2IHY9Bz26eTMwBNpNVr/RS/qh7vyiNJTooqEkrHmVLLB0
         rUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707462149; x=1708066949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpqZHmKQT++Y4YOLTxyI6uDILUR5f0/cqNvHxqH8mFw=;
        b=TSINA2t+coLjzu70c5U9zEgcbsi7fEX5MvWfAfQ+gUinmgqSG0qknQHFgPiUwVZ6JS
         DwNmN5A4XNiRgbqv4X3dlxU0WVH0VysMaKaMpw2pcWBxFoMDUBWntNi/WLF/gTUbKKEB
         8I6F+wx6AYWD4qocEgwIzE3iGxiUR89IsuJjuaXclgxbPi9qnrP8bxoLKEyaJ4xW2JaN
         dl5oTyUDURJoznHMamoGUIR37QCqTbYpVD7S+LtG/lXydkiufrYcrjrn/+RciaeJDnyk
         tvw4Jw4HcuYDM0Tx0Rbkq9fZxzw8pSZxVtNCCEXjf2p0ZbwxUr+jCAHTl8HZFgFfmHoG
         o/AQ==
X-Gm-Message-State: AOJu0YzyTV9xTwUCBs1jI4jRp2Z61zyE+1BnkZANAbbHTW8nFhNYawq1
	/DLQobyZCoPruYzrc9ksXtuUwME62eMdY6ghZs4eBg9shDe66ECm
X-Google-Smtp-Source: AGHT+IE2tIcOzUjaHbEFDbBS5ugMbCwQY5qSy1ZC290ksdvjYfnwFlD/RrP/ga59ZKlW8QV7r/wUFg==
X-Received: by 2002:a17:902:c40e:b0:1d9:d444:313 with SMTP id k14-20020a170902c40e00b001d9d4440313mr904753plk.43.1707462149502;
        Thu, 08 Feb 2024 23:02:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgb6TKnUtHNlr8ipsjz4i1op2gc+f7F4d9VegZaGXA20hmCD99A/dslBGtMaI+Pav04qe5ou2LwgxvwZgseJGgy1Bc+fZw2A7XsD994oakvysOOyE6btj4338nDFtq65ODbJmey8AYyYSVi8+QTbf/HosjEZNzpJKHOJCb7p8rz06sgGaRYpSfN/8/RzcoJzWeMTXp7tjovHRok7nk1ir4/AO2QuMZNX9dp2ydB3YMDWkwfcmYqG17aismMgV98MEYGLrqOpBk8X5WIRDMeSzhyehmrhjPs36Z59IsMuscXZAbEuxNdEzRMTc5ZBbnVQEgwrvwJYzTirPHlYjKaWLBjA8BvA4zZM1kzBYiFJkf5ADxFJYFA+ZIh1b9720ojImzI7dMfJ5m6DfOENpqMniqONd4fMi/hcfDojYzuqw4vGoxWqztQSFRq4+YerCfnohjOwdEt/NOf3nJSlLeOn8Ts+3SMRcGAWXFVT55/R7vfNhjALDmO9h6pELO2lCPwBrLSJQyswnNvJkwHiNJ+V3aIgfULqC+y3zBD4YNmrhZYKrRBETlwpN3
Received: from wheely.local0.net ([1.146.102.26])
        by smtp.gmail.com with ESMTPSA id r10-20020a170903410a00b001d7284b9461sm839285pld.128.2024.02.08.23.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 23:02:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v3 4/8] migration: Support multiple migrations
Date: Fri,  9 Feb 2024 17:01:37 +1000
Message-ID: <20240209070141.421569-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209070141.421569-1-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
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
 scripts/arch-run.bash | 93 +++++++++++++++++++++++++++++++++++++------
 3 files changed, 85 insertions(+), 17 deletions(-)

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
index 3689d7c2..a914ba17 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -129,12 +129,16 @@ run_migration ()
 		return 77
 	fi
 
+	migcmdline=$@
+
 	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
-	trap 'rm -f ${migout1} ${migout_fifo1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
+	trap 'rm -f ${migout1} ${migout2} ${migout_fifo1} ${migout_fifo2} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
 
 	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
 	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
 	migout_fifo1=$(mktemp -u -t mig-helper-fifo-stdout1.XXXXXXXXXX)
+	migout2=$(mktemp -t mig-helper-stdout2.XXXXXXXXXX)
+	migout_fifo2=$(mktemp -u -t mig-helper-fifo-stdout2.XXXXXXXXXX)
 	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
 	qmp2=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
 	fifo=$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
@@ -142,18 +146,61 @@ run_migration ()
 	qmpout2=/dev/null
 
 	mkfifo ${migout_fifo1}
-	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
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
@@ -164,7 +211,7 @@ run_migration ()
 			qmp ${qmp2} '"quit"'> ${qmpout2} 2>/dev/null
 			return 3
 		fi
-		sleep 1
+		sleep 0.1
 	done
 
 	# Wait until the destination has created the incoming and qmp sockets
@@ -176,7 +223,7 @@ run_migration ()
 	# Wait for the migration to complete
 	migstatus=`qmp ${qmp1} '"query-migrate"' | grep return`
 	while ! grep -q '"completed"' <<<"$migstatus" ; do
-		sleep 1
+		sleep 0.1
 		if ! migstatus=`qmp ${qmp1} '"query-migrate"'`; then
 			echo "ERROR: Querying migration state failed." >&2
 			echo > ${fifo}
@@ -192,14 +239,34 @@ run_migration ()
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

