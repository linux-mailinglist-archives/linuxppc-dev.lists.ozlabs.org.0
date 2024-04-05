Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6028997FA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:37:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P5ETSWNt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sL421RWz3vcS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:37:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P5ETSWNt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sJY2tstz3dXF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:35:57 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6e6a1d24770so1075156a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306154; x=1712910954; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvdWm/EbdtyEDjLrieOZV8NQclxoYIlpjbHpwiUxG74=;
        b=P5ETSWNt/5GYpfe97JROcbmHlBsrAo1qaApPIsrlVgvDqM81SzwDQZZNJW0KuaXfOQ
         6V75uZOCDl9YENllA1/5QfdTW1cna0klZwSW0vTj+IZaY9Zr2jdpgiDIRPm9oXET/+mV
         +KNg8kXAQ0TJ/bcU0fi1IXSswdEUeFjBy+jG77EKrf4+FBrU9D95DIsNnme4U6INQ4ss
         36R+VC8CRZW9Vh91B9oCu5ioDjdV7qRYms8pXhj5I4zXAn+749zH8chHYFlGBJQTijUn
         UGAIiG22ptNWhfF5/SOe642S4FGC4ysPKYbHoNL+algFGFRfFzCaYV4ZJrNicB/aMFtH
         kzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306154; x=1712910954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvdWm/EbdtyEDjLrieOZV8NQclxoYIlpjbHpwiUxG74=;
        b=jPp5pOCJSwi5jbJLShRE+epeTrHGGPPOOKTyym80DFWoK0ZCdxlsOJa4BCZTstSqS4
         cu4kNn/KYxT+FDM6sxbBPP28iFNmDl0fu2n69DVK5jm0oGysDpgaQernqR/gQ0z7CZOw
         ZaeLTgGpqmxORu7OkCBPHEMd4dhksCykQumqotI3/e22mVCMdOpJJ/l3s0xdCP+tge/U
         95Izo+Su1VYURl1hldbEfzQj//ubXzDjKXWyW1wXGm+kavVrBUlrui0nsX3WqxoMZM1b
         VK238lsuMevINpcqzqe9+ETlL/zYSKt4TkHcLlTdolC3CqzmXmtqUoBlAiorrIBOhNoM
         zwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCwtDEQE1Xl33jK6y9CiPaW3o4KZeDXwNxWBA8hSKmblTcJxL8JfxNwrBaBSpavxUwdkMXvhThjYlj/HT8sYgplD26skMmZhr+1sR4AQ==
X-Gm-Message-State: AOJu0Ywq84NgqyVE/G2te6J/VQPrgk9J7HFLuy7JOb0jGNuIvcRokmlX
	91bb6+f/vDIFZyz1AMXJrh1cRmfcJm2jWL9h+paNgQdGu0uuHurI
X-Google-Smtp-Source: AGHT+IH82UhfFuAIgRLwTFl0nZz0Yzsgd5XfOtV6vE6Hjh/yxelgsV5p6fAAYYF1vGNcDF50X+CIaQ==
X-Received: by 2002:a9d:7f19:0:b0:6e9:e442:1588 with SMTP id j25-20020a9d7f19000000b006e9e4421588mr858662otq.8.1712306154017;
        Fri, 05 Apr 2024 01:35:54 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:35:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 01/35] arch-run: Add functions to help handle migration directives from test
Date: Fri,  5 Apr 2024 18:35:02 +1000
Message-ID: <20240405083539.374995-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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

The migration harness will be expanded to deal with more commands
from the test, moving these checks into functions helps keep things
managable.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 413f3eda8..e34d784c0 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -122,6 +122,16 @@ qmp_events ()
 		jq -c 'select(has("event"))'
 }
 
+filter_quiet_msgs ()
+{
+	grep -v "Now migrate the VM (quiet)"
+}
+
+seen_migrate_msg ()
+{
+	grep -q -e "Now migrate the VM" < $1
+}
+
 run_migration ()
 {
 	if ! command -v ncat >/dev/null 2>&1; then
@@ -152,7 +162,7 @@ run_migration ()
 		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
 		-mon chardev=mon,mode=control > ${src_outfifo} &
 	live_pid=$!
-	cat ${src_outfifo} | tee ${src_out} | grep -v "Now migrate the VM (quiet)" &
+	cat ${src_outfifo} | tee ${src_out} | filter_quiet_msgs &
 
 	# Start the first destination QEMU machine in advance of the test
 	# reaching the migration point, since we expect at least one migration.
@@ -162,7 +172,7 @@ run_migration ()
 
 	while ps -p ${live_pid} > /dev/null ; do
 		# Wait for test exit or further migration messages.
-		if ! grep -q -i "Now migrate the VM" < ${src_out} ; then
+		if ! seen_migrate_msg ${src_out} ;  then
 			sleep 0.1
 		else
 			do_migration || return $?
@@ -190,11 +200,11 @@ do_migration ()
 		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
 		< <(cat ${dst_infifo}) > ${dst_outfifo} &
 	incoming_pid=$!
-	cat ${dst_outfifo} | tee ${dst_out} | grep -v "Now migrate the VM (quiet)" &
+	cat ${dst_outfifo} | tee ${dst_out} | filter_quiet_msgs &
 
 	# The test must prompt the user to migrate, so wait for the
-	# "Now migrate VM" console message.
-	while ! grep -q -i "Now migrate the VM" < ${src_out} ; do
+	# "Now migrate VM" or similar console message.
+	while ! seen_migrate_msg ${src_out} ; do
 		if ! ps -p ${live_pid} > /dev/null ; then
 			echo "ERROR: Test exit before migration point." >&2
 			echo > ${dst_infifo}
-- 
2.43.0

