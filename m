Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690AF85CEC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 04:31:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LRnm5nYk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfhf52Q8Wz3vXQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 14:31:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LRnm5nYk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfhZX0vddz3cZL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 14:28:52 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d73066880eso58665855ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 19:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708486129; x=1709090929; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3D869cFhRopw5qITnMcIX0RsIcUf5yocR4SzD+VoOnY=;
        b=LRnm5nYkYh9qV2MSl+xxLBzidSHcge/T5xJLXtAWZNBJdVT797YgdXhYB/CKneAX9v
         rUMErfTjK1xopPFcC+eq1dqRW9/ExvLBE/8W6UW44qMVe5Bg6c/wFDFe9qgrrG9NU1vs
         KeDM/50k0+4q9COKAMpTl0rL7gg0rxNZv8/zyHApqDb2a6OJsSRUKZ/g+JLOMrpakiHI
         9uWuqCANcpjaTCkS2wKbPfAT6GWGERFwyos2g0Yb8W8F8a1ntnDdV7FDJ6h4Bg+/Ktd2
         q+U1pqM6S9q4nzng4CmSNkW7w/PZDugQZLZpHjgM32AFsYhf0lsWBYoMKxcvt8w2Tp5n
         69aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486129; x=1709090929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3D869cFhRopw5qITnMcIX0RsIcUf5yocR4SzD+VoOnY=;
        b=m+sN7LC0QGFlem4AcnFTIzr6CATigHL1N+GulCliDQqVFpinhdqvKSgw9+0FI8/GIy
         yqsAqAQGQ4pjGxdXEV9K+yhJHHs6vkuuk3VzQWcwLi7N6Wg9wuITQ4j+m1uTM6S9VPB2
         xnceE3LU4azZgYjHmT02ah+Ixk96vhqa9/CtLBEk4pMy1wPQTMu80xzLarL2vj6dz7po
         oyMv+YMoXebtJ1qKWq775S5Rp51+p+6p9yS6IJlKIJChyFjO36AywXG6lv67r5B0Udii
         ULJMB/gqPDmlvW4q1juYth5Vd1e/aUGJEPGWZ6xQ6yhBuVsMKyFHseG6+hOYGTziukfQ
         Dd1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGhhxI+gH8zlCX2tDXc92ygsOSyIskivKdq0KXeydwV8nR3qkdU/wanBJDhKU4j/3blhF5MsmMeWOHVhz5I6Nr+NHQHk7jbHUG5K6vLA==
X-Gm-Message-State: AOJu0Yz4KQ/N6u0jwdyjI3yx4+u3gdDBpaLOEKrNB8cG0y/2k2a9e8IM
	pppFNHfmRQ2KERylJoSCBsHEmakr+6FA6B9mrocf4K715I4bsGa0
X-Google-Smtp-Source: AGHT+IHwwMBr2JmzFJDzZeVdYZUelRxdGLpWAB3n/eeLq7GSP7C3diyEMO0XE7I94wUzHFDofRzLAg==
X-Received: by 2002:a17:902:d58a:b0:1dc:29df:277e with SMTP id k10-20020a170902d58a00b001dc29df277emr1909586plh.47.1708486129301;
        Tue, 20 Feb 2024 19:28:49 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902b10700b001dc214f7353sm1246457plr.249.2024.02.20.19.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:28:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v5 4/8] migration: Support multiple migrations
Date: Wed, 21 Feb 2024 13:27:53 +1000
Message-ID: <20240221032757.454524-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240221032757.454524-1-npiggin@gmail.com>
References: <20240221032757.454524-1-npiggin@gmail.com>
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/migrate.c         |  8 ++--
 lib/migrate.h         |  1 +
 scripts/arch-run.bash | 86 ++++++++++++++++++++++++++++++++++++-------
 3 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/lib/migrate.c b/lib/migrate.c
index 527e63ae1..b77216594 100644
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
index 3c94e6af7..2af06a72d 100644
--- a/lib/migrate.h
+++ b/lib/migrate.h
@@ -6,4 +6,5 @@
  * Author: Nico Boehr <nrb@linux.ibm.com>
  */
 
+void migrate(void);
 void migrate_once(void);
diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 9a5aaddcc..c2002d7ae 100644
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
@@ -142,20 +146,54 @@ run_migration ()
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
+	# Start the first destination QEMU machine in advance of the test
+	# reaching the migration point, since we expect at least one migration.
+	# Then destination machines are started after the test outputs
+	# subsequent "Now migrate the VM" messages.
+	do_migration || return $?
+
+	while ps -p ${live_pid} > /dev/null ; do
+		# Wait for test exit or further migration messages.
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
 
-	# The test must prompt the user to migrate, so wait for the "migrate" keyword
+	# The test must prompt the user to migrate, so wait for the
+	# "Now migrate VM" console message.
 	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
 		if ! ps -p ${live_pid} > /dev/null ; then
 			echo "ERROR: Test exit before migration point." >&2
@@ -164,7 +202,7 @@ run_migration ()
 			qmp ${qmp2} '"quit"'> ${qmpout2} 2>/dev/null
 			return 3
 		fi
-		sleep 1
+		sleep 0.1
 	done
 
 	# Wait until the destination has created the incoming and qmp sockets
@@ -176,7 +214,7 @@ run_migration ()
 	# Wait for the migration to complete
 	migstatus=`qmp ${qmp1} '"query-migrate"' | grep return`
 	while ! grep -q '"completed"' <<<"$migstatus" ; do
-		sleep 1
+		sleep 0.1
 		if ! migstatus=`qmp ${qmp1} '"query-migrate"'`; then
 			echo "ERROR: Querying migration state failed." >&2
 			echo > ${fifo}
@@ -192,14 +230,34 @@ run_migration ()
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

