Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE6D85CECA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 04:32:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I1lMRc5h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfhg34XM0z3dXF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 14:32:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I1lMRc5h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfhZg301qz3cy4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 14:28:59 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d8da50bffaso31422755ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 19:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708486136; x=1709090936; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8OprHoI60WCjUrEFrRYccBS1NmFjGjrdIyTLJzB9cM=;
        b=I1lMRc5hvlMwH5TXlzHH2PmjITBFjz4UR0BVsiekvvSYmHS2IH0lI9BJeqfj1FYhMJ
         q9JmuliXuZ9ZIDCnwglUxxEr4s6HNbTHqgg2ojOwTlt4w2omLmxzcG2FbFcfjuSsAifY
         /lLjdHrk0ZLcBpEOBhOiQt+nxB3eVqESuro0XnTSGXFl+kP54F8v9FGxtrdWJnIXBydm
         Bh6u62BbCsoYg3q+JuW4fpCtmblvAEOoWc7yhD0rYuQxkHcZEtIbI7MjoyC2NCiDPaIn
         Jc3tEAePrYBI35IJ9snjuT4YhgiL6apLfAk7nZ6WajrT9W+POR4DlDN2vvskv4FK26dl
         7mHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486136; x=1709090936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8OprHoI60WCjUrEFrRYccBS1NmFjGjrdIyTLJzB9cM=;
        b=nX4Xbm2BXSWwbfZMFzfj0xVo52JrNcRyMEovGA7LixmAiPSyOgk5lFZWjnTT/Rz6n4
         FnXZK8eHpv67u5106KIcwP1oYhQeirwZ4Uv5FKLb/3v3AOEOuKRAj0dshbCMoMkEdUlr
         1/0TYFekN4GRu/hD52v8dkCcPFj7lbMedlnbY9z9Ma6n3fHBFrJNjhEi72FAnXZBieYK
         37dWClFMYEh/Ohspx7YwEojvmM0IkgVslOouXK88JaQ0f1TXw7nx9r9v9j7Iyq5TrCnA
         r88hz+7DFbd7hnXnRtXwju0p9Pv6Es+2xpaH+3DP+K0AUd59m+43cA8KBc4RfW5IZixm
         r1zw==
X-Forwarded-Encrypted: i=1; AJvYcCVqjMBAiCLqbhStMp8UKVbhTPwiX0vPHjpsIzN1CIYDLIXmYamijoHzlpvutjHdZQFGcFG4U4buZ6YHlYUhRDX2c3WpbL0Kd309MT+1og==
X-Gm-Message-State: AOJu0YyIPAPncwx+sppRt2q0ewLGKOw807HmYg4ahtLmCVbyS+Ohjo/F
	5vDyTEVV9z7g9jaW4huUniVrbODlpAWqiVue+y9PVDDT030+qDar
X-Google-Smtp-Source: AGHT+IEAXQef3gkWLv/2fQdnRK95TAMbbzGrHIx8+Ge20qaykjwlv3LOd0VxWSLbdmK49lX4ynq9WQ==
X-Received: by 2002:a17:902:b201:b0:1dc:fb2:d5fe with SMTP id t1-20020a170902b20100b001dc0fb2d5femr5082789plr.22.1708486136556;
        Tue, 20 Feb 2024 19:28:56 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902b10700b001dc214f7353sm1246457plr.249.2024.02.20.19.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:28:56 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v5 5/8] arch-run: rename migration variables
Date: Wed, 21 Feb 2024 13:27:54 +1000
Message-ID: <20240221032757.454524-6-npiggin@gmail.com>
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

Using 1 and 2 for source and destination is confusing, particularly
now with multiple migrations that flip between them. Do a rename
pass to 'src' and 'dst' to tidy things up.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 111 +++++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 55 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index c2002d7ae..c98429e8c 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -132,27 +132,27 @@ run_migration ()
 	migcmdline=$@
 
 	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
-	trap 'rm -f ${migout1} ${migout2} ${migout_fifo1} ${migout_fifo2} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
-
-	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
-	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
-	migout_fifo1=$(mktemp -u -t mig-helper-fifo-stdout1.XXXXXXXXXX)
-	migout2=$(mktemp -t mig-helper-stdout2.XXXXXXXXXX)
-	migout_fifo2=$(mktemp -u -t mig-helper-fifo-stdout2.XXXXXXXXXX)
-	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
-	qmp2=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
-	fifo=$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
-	qmpout1=/dev/null
-	qmpout2=/dev/null
-
-	mkfifo ${migout_fifo1}
-	mkfifo ${migout_fifo2}
+	trap 'rm -f ${src_out} ${dst_out} ${src_outfifo} ${dst_outfifo} ${dst_incoming} ${src_qmp} ${dst_qmp} ${dst_infifo}' RETURN EXIT
+
+	dst_incoming=$(mktemp -u -t mig-helper-socket-incoming.XXXXXXXXXX)
+	src_out=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
+	src_outfifo=$(mktemp -u -t mig-helper-fifo-stdout1.XXXXXXXXXX)
+	dst_out=$(mktemp -t mig-helper-stdout2.XXXXXXXXXX)
+	dst_outfifo=$(mktemp -u -t mig-helper-fifo-stdout2.XXXXXXXXXX)
+	src_qmp=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
+	dst_qmp=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
+	dst_infifo=$(mktemp -u -t mig-helper-fifo-stdin.XXXXXXXXXX)
+	src_qmpout=/dev/null
+	dst_qmpout=/dev/null
+
+	mkfifo ${src_outfifo}
+	mkfifo ${dst_outfifo}
 
 	eval "$migcmdline" \
-		-chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
-		-mon chardev=mon1,mode=control > ${migout_fifo1} &
+		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
+		-mon chardev=mon,mode=control > ${src_outfifo} &
 	live_pid=$!
-	cat ${migout_fifo1} | tee ${migout1} &
+	cat ${src_outfifo} | tee ${src_out} &
 
 	# Start the first destination QEMU machine in advance of the test
 	# reaching the migration point, since we expect at least one migration.
@@ -162,7 +162,7 @@ run_migration ()
 
 	while ps -p ${live_pid} > /dev/null ; do
 		# Wait for test exit or further migration messages.
-		if ! grep -q -i "Now migrate the VM" < ${migout1} ; then
+		if ! grep -q -i "Now migrate the VM" < ${src_out} ; then
 			sleep 0.1
 		else
 			do_migration || return $?
@@ -184,80 +184,81 @@ do_migration ()
 	# We have to use cat to open the named FIFO, because named FIFO's,
 	# unlike pipes, will block on open() until the other end is also
 	# opened, and that totally breaks QEMU...
-	mkfifo ${fifo}
+	mkfifo ${dst_infifo}
 	eval "$migcmdline" \
-		-chardev socket,id=mon2,path=${qmp2},server=on,wait=off \
-		-mon chardev=mon2,mode=control -incoming unix:${migsock} \
-		< <(cat ${fifo}) > ${migout_fifo2} &
+		-chardev socket,id=mon,path=${dst_qmp},server=on,wait=off \
+		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
+		< <(cat ${dst_infifo}) > ${dst_outfifo} &
 	incoming_pid=$!
-	cat ${migout_fifo2} | tee ${migout2} &
+	cat ${dst_outfifo} | tee ${dst_out} &
 
 	# The test must prompt the user to migrate, so wait for the
 	# "Now migrate VM" console message.
-	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
+	while ! grep -q -i "Now migrate the VM" < ${src_out} ; do
 		if ! ps -p ${live_pid} > /dev/null ; then
 			echo "ERROR: Test exit before migration point." >&2
-			echo > ${fifo}
-			qmp ${qmp1} '"quit"'> ${qmpout1} 2>/dev/null
-			qmp ${qmp2} '"quit"'> ${qmpout2} 2>/dev/null
+			echo > ${dst_infifo}
+			qmp ${src_qmp} '"quit"'> ${src_qmpout} 2>/dev/null
+			qmp ${dst_qmp} '"quit"'> ${dst_qmpout} 2>/dev/null
 			return 3
 		fi
 		sleep 0.1
 	done
 
 	# Wait until the destination has created the incoming and qmp sockets
-	while ! [ -S ${migsock} ] ; do sleep 0.1 ; done
-	while ! [ -S ${qmp2} ] ; do sleep 0.1 ; done
+	while ! [ -S ${dst_incoming} ] ; do sleep 0.1 ; done
+	while ! [ -S ${dst_qmp} ] ; do sleep 0.1 ; done
 
-	qmp ${qmp1} '"migrate", "arguments": { "uri": "unix:'${migsock}'" }' > ${qmpout1}
+	qmp ${src_qmp} '"migrate", "arguments": { "uri": "unix:'${dst_incoming}'" }' > ${src_qmpout}
 
 	# Wait for the migration to complete
-	migstatus=`qmp ${qmp1} '"query-migrate"' | grep return`
+	migstatus=`qmp ${src_qmp} '"query-migrate"' | grep return`
 	while ! grep -q '"completed"' <<<"$migstatus" ; do
 		sleep 0.1
-		if ! migstatus=`qmp ${qmp1} '"query-migrate"'`; then
+		if ! migstatus=`qmp ${src_qmp} '"query-migrate"'`; then
 			echo "ERROR: Querying migration state failed." >&2
-			echo > ${fifo}
-			qmp ${qmp2} '"quit"'> ${qmpout2} 2>/dev/null
+			echo > ${dst_infifo}
+			qmp ${dst_qmp} '"quit"'> ${dst_qmpout} 2>/dev/null
 			return 2
 		fi
 		migstatus=`grep return <<<"$migstatus"`
 		if grep -q '"failed"' <<<"$migstatus"; then
 			echo "ERROR: Migration failed." >&2
-			echo > ${fifo}
-			qmp ${qmp1} '"quit"'> ${qmpout1} 2>/dev/null
-			qmp ${qmp2} '"quit"'> ${qmpout2} 2>/dev/null
+			echo > ${dst_infifo}
+			qmp ${src_qmp} '"quit"'> ${src_qmpout} 2>/dev/null
+			qmp ${dst_qmp} '"quit"'> ${dst_qmpout} 2>/dev/null
 			return 2
 		fi
 	done
 
-	qmp ${qmp1} '"quit"'> ${qmpout1} 2>/dev/null
+	qmp ${src_qmp} '"quit"'> ${src_qmpout} 2>/dev/null
 
 	# keypress to dst so getchar completes and test continues
-	echo > ${fifo}
-	rm ${fifo}
+	echo > ${dst_infifo}
+	rm ${dst_infifo}
 
 	# Ensure the incoming socket is removed, ready for next destination
-	if [ -S ${migsock} ] ; then
+	if [ -S ${dst_incoming} ] ; then
 		echo "ERROR: Incoming migration socket not removed after migration." >& 2
-		qmp ${qmp2} '"quit"'> ${qmpout2} 2>/dev/null
+		qmp ${dst_qmp} '"quit"'> ${dst_qmpout} 2>/dev/null
 		return 2
 	fi
 
 	wait ${live_pid}
 	ret=$?
 
-	# Now flip the variables because dest becomes source
+	# Now flip the variables because destination machine becomes source
+	# for the next migration.
 	live_pid=${incoming_pid}
-	tmp=${migout1}
-	migout1=${migout2}
-	migout2=${tmp}
-	tmp=${migout_fifo1}
-	migout_fifo1=${migout_fifo2}
-	migout_fifo2=${tmp}
-	tmp=${qmp1}
-	qmp1=${qmp2}
-	qmp2=${tmp}
+	tmp=${src_out}
+	src_out=${dst_out}
+	dst_out=${tmp}
+	tmp=${src_outfifo}
+	src_outfifo=${dst_outfifo}
+	dst_outfifo=${tmp}
+	tmp=${src_qmp}
+	src_qmp=${dst_qmp}
+	dst_qmp=${tmp}
 
 	return $ret
 }
@@ -280,8 +281,8 @@ run_panic ()
 	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
 
 	# start VM stopped so we don't miss any events
-	eval "$@" -chardev socket,id=mon1,path=${qmp},server=on,wait=off \
-		-mon chardev=mon1,mode=control -S &
+	eval "$@" -chardev socket,id=mon,path=${qmp},server=on,wait=off \
+		-mon chardev=mon,mode=control -S &
 
 	panic_event_count=$(qmp_events ${qmp} | jq -c 'select(.event == "GUEST_PANICKED")' | wc -l)
 	if [ "$panic_event_count" -lt 1 ]; then
-- 
2.42.0

