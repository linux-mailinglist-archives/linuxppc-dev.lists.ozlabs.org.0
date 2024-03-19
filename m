Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FF887F8AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:01:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WJxXTgbO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPL56rlrz3vbq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:01:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WJxXTgbO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPJZ0wSgz3cDk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 18:59:41 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6c8823519so5020571b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835179; x=1711439979; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV1GkDUYdGk6FpqIRujPCzrSPB/odnEVLVEaqpwb+zI=;
        b=WJxXTgbOlEfzbYJ602Mly9ljVa5MtGxRjAfMKSRa2LsYp5B+h9G17WTrEqu5blO0WX
         irdAKnQrNymzS77yjuqcPgzUR3w7qOckau7nTcMsuRYU4McOqf5mwGEaZmhzRv3me2NR
         l32cDnsnxgvf0Qxbj6AGxVYFxlaMLIm6x52CfHfIrVC1009nwE1cFOTIJQ1VVFsQmhjo
         ut8boUW/BQo3DJPenoCS+CUvFgg4BfFJilBMJYW1dVmyG8KTMNtcQePhjAQTc5pBLjyu
         W8QzzJcEwg5hH67Ss68kfDYXL5lwq/OR2ndozfyiVXrRhhNdw5qtoMkIZWWqXCC0Iz0q
         9MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835179; x=1711439979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV1GkDUYdGk6FpqIRujPCzrSPB/odnEVLVEaqpwb+zI=;
        b=A5/5xcb3OrluBBtRwDnciCB3JiE9T1lvf71YDBgPy1NiMTpj2GXi/rUSzUQ8+lC6xc
         8J79UO+7vhacw7vGnho4C6JI1yuAJkhHvwtwq57qPfnwO0aqLYsjT2KRFBeh+rXDod1T
         eC1PrLWQKmeufcu64Of6h9CskgEsABlip0EQDFSH/7Q55+7H2v8Hq6kmzKlsw4URujLH
         H+4W/CBhuDsJwYZQjez6T92K0BDSOg03kRMx3VprVxKPfkDEeVlXbHAEApCkTeJiY2ub
         1DFLEAl29eSjJpRIcqmOMvL60P9bf5TEeF0dYOMLE1uthv5id+GdEJeSD2sL+fq1vzMC
         eCiw==
X-Forwarded-Encrypted: i=1; AJvYcCXfFZHlL+9lUIlK1kz3xh5aGeRiST60ZIolLWqZ/8ZRwN73bNMdt0abxsptTYkW5jLUU0taGUYEUef20umpB1RYy4OcFr2t/ahszV3QiA==
X-Gm-Message-State: AOJu0YxbG8C9p36ioP3/JWsbrCiQXffi1GBR+9H6Vc+oCmTa6p7LNcnZ
	z7JW2cgOCWLNyxOPBI2k5GFA0/9BIwi1+eTLrK+dss8UDwTYbUb4
X-Google-Smtp-Source: AGHT+IHeL4fHra/9GDTXS1doTdE3e+vFe2XbaH0TFQXn1QEOJgVJ8PGJhTMXeVyepFJKOTtmHxwhkg==
X-Received: by 2002:a05:6a00:3d10:b0:6e7:2dd1:6e7d with SMTP id lo16-20020a056a003d1000b006e72dd16e7dmr2352807pfb.18.1710835179082;
        Tue, 19 Mar 2024 00:59:39 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.00.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 00:59:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 01/35] arch-run: Add functions to help handle migration directives from test
Date: Tue, 19 Mar 2024 17:58:52 +1000
Message-ID: <20240319075926.2422707-2-npiggin@gmail.com>
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

The migration harness will be expanded to deal with more commands
from the test, moving these checks into functions helps keep things
managable.

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
2.42.0

