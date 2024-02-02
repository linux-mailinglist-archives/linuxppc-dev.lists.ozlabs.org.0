Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F1F8468E3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 08:03:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SRVUfOep;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR6Db0P9sz3vnQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 18:03:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SRVUfOep;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TR67g1xvXz3dFx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 17:58:55 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d93edfa76dso14804705ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 22:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857132; x=1707461932; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSBY/qUR3vEv/4J5fGD2VKLCaKXAp4kdXbDH3R5DRjk=;
        b=SRVUfOep6Md9mHGO0rjX0A/cNGpLzwU1ttWuI1BJhplfC/+Jq8csCTlbVTkfdXR7fc
         zuGW5GIYVKfp8Brjb4SMnQ2RC0X0J/mKtIrMzLYoyYGDl5UNKHnvWqP/OQ48bGjMyZqZ
         M8UZ8WPyDVZsJJ2HBZNRg3NaO2Y+jzYNR86oR5WUkvWIO5IoGC8KilY7ycf+6xkZnj02
         v478m9tIciWjLy7B7DkKomLLXWQfOYPLkJS9UDv2gQqvOqAWoghfXrG3GgsIMQS61AaG
         I1O+X12op16YjkonRnV651QeR4TFd/oGXZP0vUcfEN34mb2wTU2yvrbQ93zsqZadmwqE
         U+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857132; x=1707461932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fSBY/qUR3vEv/4J5fGD2VKLCaKXAp4kdXbDH3R5DRjk=;
        b=XoYL2Y8VPIRWzF/s/MPL+CJ8RDBiQGlhiqNZaBdR8tgosaPhljaX5tfZKBpLAYMiam
         WUAqFF301m0h9Sp7p4DtNihV27xit6oLLMDbDdoRxKm5QjYmHXDJUPwP7apXWmVFE4Ne
         vDm/KpS15Fl8FCPupTTxHphSdsI8NIWB51bq/keTIXSdl99K7nB0UTwJWWxOAQ9XxdGa
         P3x73dVosmwcjg/eXNi6gVAYWvdw2LPD+RxZ6JbMgyo0GyhdEwSKGorHRpSxhmA43pAB
         Z81H62YlEJCUbPyIvGbcQiLHsWYO04k/2xiU7ahci1nomfgdVW88Y3mByHySgJkdWXXe
         Amqw==
X-Gm-Message-State: AOJu0Yw43hHz8JcAmIdBgMiDsr30u3ipt7vPL/rd6g2DZdS9KsoCdBdv
	t6SUkSriqOvQMFgl2MNESiTepMb85xBSfXEDl8DP3eWhWOpA50AZOTrugnAQ
X-Google-Smtp-Source: AGHT+IGGWkPpz9cV+EqJznvJjULk/Kf3RcDOGkpaaivKSaza5AuYnVyC7UlPmSNta4kkSAyCE2hL7w==
X-Received: by 2002:a17:902:f807:b0:1d8:cda6:7ed0 with SMTP id ix7-20020a170902f80700b001d8cda67ed0mr3751650plb.59.1706857132599;
        Thu, 01 Feb 2024 22:58:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWPJuGCnjBjriAPBKYD/3la8s9SF0GNZmQhuTi4oGje0EqvGe991nJDa7WAr6cANvY8FPwcs0OC8ql+ygmQkAHSnysMxDYXxrNd4qV7sceYT8SxGULB/MPFHFxSFeKbwRKDR0P6eMrg/1WotJ6ph6aRHP43SkeoB2zAFIe6ur4ZmaZU5vwJw1YsdBA12p4+RcwdOISurqTGwcc+czNFCVJfy9uZ/cckNoIWoSq97IyW7aDv+36iBFHLC1YmKW3d3FAPiak+CoKcbvvcHBfhjjql8rJwq0peYKbIPd5uopOVkw2GaFIeDagnYdxwESRog044MC9FUVa1fMw0KMYK+NxEir0l7sWuj5BFRMw8897j3MPsmvkaEGjsN2gvOLgCoMsSFBHKHiTMiqa5ILmKXC7VAoBe822BA2XhBWzwYATv8wFJRR1ZV/nCufn83p35DSBI08qjQaNr3FVHSG3WvuSBN4lzpAOOl0I6/pHGWof7xS39HDZ5GPeObntRDXiafRLamzQEpzrO9eg=
Received: from wheely.local0.net ([1.146.53.155])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903209200b001d948adc19fsm905734plc.46.2024.02.01.22.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:58:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v2 6/9] arch-run: rename migration variables
Date: Fri,  2 Feb 2024 16:57:37 +1000
Message-ID: <20240202065740.68643-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240202065740.68643-1-npiggin@gmail.com>
References: <20240202065740.68643-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Using 1 and 2 for source and destination is confusing, particularly
now with multiple migrations that flip between them. Do a rename
pass to tidy things up.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 112 +++++++++++++++++++++---------------------
 1 file changed, 57 insertions(+), 55 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 1ea0f8bc..0feaa190 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -129,38 +129,39 @@ run_migration ()
 		return 77
 	fi
 
-	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
-	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
-	migout_fifo1=$(mktemp -u -t mig-helper-fifo-stdout1.XXXXXXXXXX)
-	migout2=$(mktemp -t mig-helper-stdout2.XXXXXXXXXX)
-	migout_fifo2=$(mktemp -u -t mig-helper-fifo-stdout2.XXXXXXXXXX)
-	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
-	qmp2=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
-	fifo=$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
+	dst_incoming=$(mktemp -u -t mig-helper-socket-incoming.XXXXXXXXXX)
+	src_out=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
+	src_outfifo=$(mktemp -u -t mig-helper-fifo-stdout1.XXXXXXXXXX)
+	dst_out=$(mktemp -t mig-helper-stdout2.XXXXXXXXXX)
+	dst_outfifo=$(mktemp -u -t mig-helper-fifo-stdout2.XXXXXXXXXX)
+	src_qmp=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
+	dst_qmp=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
+	dst_infifo=$(mktemp -u -t mig-helper-fifo-stdin.XXXXXXXXXX)
 
 	# race here between file creation and trap
 	trap "trap - TERM ; kill 0 ; exit 2" INT TERM
-	trap "rm -f ${migout1} ${migout2} ${migout_fifo1} ${migout_fifo2} ${migsock} ${qmp1} ${qmp2} ${fifo}" RETURN EXIT
+	trap "rm -f ${src_out} ${dst_out} ${src_outfifo} ${dst_outfifo} ${dst_incoming} ${src_qmp} ${dst_qmp} ${dst_infifo}" RETURN EXIT
+
+	src_qmpout=/dev/null
+	dst_qmpout=/dev/null
 
-	qmpout1=/dev/null
-	qmpout2=/dev/null
 	migcmdline=$@
 
-	mkfifo ${migout_fifo1}
-	mkfifo ${migout_fifo2}
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
 
 	# The test must prompt the user to migrate, so wait for the "migrate"
 	# keyword
-	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
+	while ! grep -q -i "Now migrate the VM" < ${src_out} ; do
 		if ! ps -p ${live_pid} > /dev/null ; then
 			echo "ERROR: Test exit before migration point." >&2
-			qmp ${qmp1} '"quit"'> ${qmpout1} 2>/dev/null
+			qmp ${src_qmp} '"quit"'> ${src_qmpout} 2>/dev/null
 			return 3
 		fi
 		sleep 0.1
@@ -173,7 +174,7 @@ run_migration ()
 
 	while ps -p ${live_pid} > /dev/null ; do
 		# Wait for EXIT or further migrations
-		if ! grep -q -i "Now migrate the VM" < ${migout1} ; then
+		if ! grep -q -i "Now migrate the VM" < ${src_out} ; then
 			sleep 0.1
 		else
 			do_migration || return $?
@@ -195,79 +196,80 @@ do_migration ()
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
 
 	# The test must prompt the user to migrate, so wait for the "migrate" keyword
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
@@ -290,8 +292,8 @@ run_panic ()
 	trap "rm -f ${qmp}" RETURN EXIT
 
 	# start VM stopped so we don't miss any events
-	eval "$@" -chardev socket,id=mon1,path=${qmp},server=on,wait=off \
-		-mon chardev=mon1,mode=control -S &
+	eval "$@" -chardev socket,id=mon,path=${qmp},server=on,wait=off \
+		-mon chardev=mon,mode=control -S &
 
 	panic_event_count=$(qmp_events ${qmp} | jq -c 'select(.event == "GUEST_PANICKED")' | wc -l)
 	if [ "$panic_event_count" -lt 1 ]; then
-- 
2.42.0

