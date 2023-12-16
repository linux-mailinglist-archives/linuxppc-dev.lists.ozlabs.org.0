Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9921D815984
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:45:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q32yqXVA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnRM2C2jz3cVc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:45:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q32yqXVA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnNk07Lcz30h0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:43:33 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-35f72db10f7so7139895ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734211; x=1703339011; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj0Mut5HzH8zVLvul2P8fFuIwv0JpWCZjoItb4hgRRc=;
        b=Q32yqXVAo9aGxEN/+6fhxPOGBijZszV7+YzqSjMbtDZH8mnnOAIWLMdegRgpgvLlMX
         33n8jNDSfY1+24mRKQFFsZWXHgAioU7bhbgqYfd+twdo6pMW7hy4lGG6NZR/Gsi4qNKB
         BRzoLKug32LrZkoYWUN5ECnFLhW4g22IprY1JGyINSs8e/shlOpLfb5ig+oqKbz1RGui
         XxogOXjdcaYanh/u0MU59r75COgbIglZ+qYVx8LcuxdNIvRGml/iESq8zWN2+HIug9gb
         gDPRm2YT78SGxbI6sAJneWpUB/gpY0i9414syVw4kwUxNfKrmlMlVBEpfbG1UBXCFctl
         Q2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734211; x=1703339011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wj0Mut5HzH8zVLvul2P8fFuIwv0JpWCZjoItb4hgRRc=;
        b=lh+zfsAn329s4BjdkVqc5aCYKQe4Dz1IJilED9Fyyz+R4N9RrW8Iki932WlUcmtAi9
         eGZ8J9kTMezrhThpbGxrOeM92zFWYp7HD3RdP0cZYy4lCTvV4D2t/XtYvViQuj/XvKA2
         kafe9NTULMOEjH5VvbWiYfXvvAiepxUO3r8ygJuOHUVSuWykdYy/lhhwUl3/tFBEE5UR
         W2GkGhKU8RzlN1lNxKDN0qVpK/ZrQPNFuKRmC10BoRJ//wdCWZV0QlFeF96btDAueuY3
         WFBuSwS3aSVwjX6lvMntWZieqOLGQuAww8zksSYO2qfLmYPB/SLnnfUBF7qZSStECpab
         hGqg==
X-Gm-Message-State: AOJu0YwYsJVMYEORVsL4dR5bfI0cyoLPx1aryzfQOCnoCiJK5OpmZ1Fd
	6qKmhSa7fgQJRir3krpBavI=
X-Google-Smtp-Source: AGHT+IHYh1+XYxyEnHjWdIM84spbdWJPQ3KCBdFOxFPfV06aBtENyzhLMMNQqIFziZJUqBKvpUzksg==
X-Received: by 2002:a05:6e02:1c8b:b0:35f:8102:aaa with SMTP id w11-20020a056e021c8b00b0035f81020aaamr6863917ill.59.1702734210761;
        Sat, 16 Dec 2023 05:43:30 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:43:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 03/29] migration: use a more robust way to wait for background job
Date: Sat, 16 Dec 2023 23:42:30 +1000
Message-ID: <20231216134257.1743345-4-npiggin@gmail.com>
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

Starting a pipeline of jobs in the background seems to not have a
simple way to reliably find the pid of a particular process. The
way PID of QEMU is sometimes causes a failure waiting on a PID that
is not running when stressing migration with later changes to do
multiple migrations.

Changing this to use $! is more robust in testing, and simpler.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index cc7da7c5..4d4e791c 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -131,6 +131,7 @@ run_migration ()
 
 	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
 	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
+	migout_fifo1=$(mktemp -u -t mig-helper-fifo-stdout1.XXXXXXXXXX)
 	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
 	qmp2=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
 	fifo=$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
@@ -143,8 +144,9 @@ run_migration ()
 	qmpout2=/dev/null
 
 	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
-		-mon chardev=mon1,mode=control | tee ${migout1} &
-	live_pid=`jobs -l %+ | grep "eval" | awk '{print$2}'`
+		-mon chardev=mon1,mode=control > ${migout_fifo1} &
+	live_pid=$!
+	cat ${migout_fifo1} | tee ${migout1} &
 
 	# We have to use cat to open the named FIFO, because named FIFO's, unlike
 	# pipes, will block on open() until the other end is also opened, and that
@@ -152,7 +154,7 @@ run_migration ()
 	mkfifo ${fifo}
 	eval "$@" -chardev socket,id=mon2,path=${qmp2},server=on,wait=off \
 		-mon chardev=mon2,mode=control -incoming unix:${migsock} < <(cat ${fifo}) &
-	incoming_pid=`jobs -l %+ | awk '{print$2}'`
+	incoming_pid=$!
 
 	# The test must prompt the user to migrate, so wait for the "migrate" keyword
 	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
@@ -166,6 +168,9 @@ run_migration ()
 		sleep 1
 	done
 
+	# Wait until the destination has created the incoming socket
+	while ! [ -S ${migsock} ] ; do sleep 0.1 ; done
+
 	qmp ${qmp1} '"migrate", "arguments": { "uri": "unix:'${migsock}'" }' > ${qmpout1}
 
 	# Wait for the migration to complete
-- 
2.42.0

