Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 611778468CD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 08:01:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DtpB+hEx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR6Bx2GjTz3vhL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 18:01:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DtpB+hEx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TR67K5gQMz3cgJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 17:58:37 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d780a392fdso14972815ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 22:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857115; x=1707461915; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csZzn8Tts4GDrY3qLQnkSR7QOMG8LbSslE35UizKPQ4=;
        b=DtpB+hExVbgSyJ1gAfXppQhGjOf+GJpt2IRuJd6fG3XbbAYpXm0Jd8QnjrYMSwV+dX
         +okxXr+WSD+2qKr85w4N85wUS8c2LOwXKPwHAMhTlNgjWCVKrCdW6KDO96oTM3ee4FoK
         JcI+p6nVsBC4igNJJz5k8YuizdmWaPTmIWU9vWLFNxkLCRFKEiOMwQsiFzKopJ+zv2mI
         k5PzWKLa6Rp7ClJDKVmfEYMnPqR5U6lC58nZDqHYu+hVAL7FKCHcbfX0EcgB8kmXi3AV
         hFjpbxbZY4SZ44k5eNfjzRjxsEGlJftqGnp2tv1vc5XR2y3HCtA+4nbt8WAFtrJFClxy
         tHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857115; x=1707461915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csZzn8Tts4GDrY3qLQnkSR7QOMG8LbSslE35UizKPQ4=;
        b=np94PRw8Oao+D6i9KulyuuPzvUORotlQrFwNup+eo1jdxYyXOOqVpr+qmFvSE/Hg6+
         xTkvEdJWzERJHQz/14nOmfZ+jI4iyKTdZ0js0xdSX1scWBuJSwS8WkXDVaVHg7myGmci
         Dprd/GuYUhpZjLtSy5/laaNmRsG6QyXQODjCp/2mu//dugp9k0ubpNUmaX2ztYwWrum5
         js+jq2Sfa4ZLIzUtUsr1Rqi9VqlzfkeDB6go7VUK7wmCzTZEIklPsVmqBfHy/ttX2h/o
         mba3bSvtQa6oeIq3dAT4minidsql4xOOLpvRto+zV9AtS0yfeuK9GeICJGE817qTr9vC
         TwAA==
X-Gm-Message-State: AOJu0YxOoMmaKhcvjikRhmeIr4N46HlbLqZze7exhEbUo4WJkErd1uNo
	VefCBOEq8527lUknDRBSWgHugk5bjyWYBfRvq/JkfEF/MNqULS60
X-Google-Smtp-Source: AGHT+IHQJovP9cuDfLX1LEk4K/alkVzLIkRzxJY+QcE5oL7Dd9yHKan4WRASlSMcGCHpHROzl2ZLRQ==
X-Received: by 2002:a17:902:784a:b0:1d7:67ed:f359 with SMTP id e10-20020a170902784a00b001d767edf359mr4716325pln.4.1706857115153;
        Thu, 01 Feb 2024 22:58:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVSwo2DhWJztWTa9U1WjnG2OEHk75aqypz9EENMaN9rCVjm2aNTvzqOjqreNJITShoHo9T7x+ko5qmg+0mV1bnB2ksDTXi9h0E+gKzF0gwzaPU7sZRfQKEE5GBwSp3vXM5daMc87iFTEbp+kKmWIGcoKllxbyyc7GHbbHP2MYk2R6FbS5cCICb3jeBoC95PLl3gQXdpeY3YdDjwN4gufC5UMsFyXUoMhxStsJ7LBtInri13Lv8ml/nw6NMfYwKBWGeEJ8tZYTOh8QEzFmsxwtypjQFDMaYc+rxpO3wB6cftW99sR9jBOzuqUTKG+KBI89qEH5I6L5LJLboUVYgjQm0h4CApMhlBMlEHF30OUwc1tiunLj3s1xlRislLrnE6gQk4nxX+bgKMbXi7ZyK+VprLwbV1fjrSnPLI+OjdwQoV5pGegIY6Uq6Z/3Mb2gELJE4vKhs+PHAA27nlDncGqIpzsXgCDW3i017CdB2wccIpLULEqbD1ub59rwYxNwXZYWe6tGz+X72qL8Y=
Received: from wheely.local0.net ([1.146.53.155])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903209200b001d948adc19fsm905734plc.46.2024.02.01.22.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:58:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v2 4/9] migration: use a more robust way to wait for background job
Date: Fri,  2 Feb 2024 16:57:35 +1000
Message-ID: <20240202065740.68643-5-npiggin@gmail.com>
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

Starting a pipeline of jobs in the background does not seem to have
a simple way to reliably find the pid of a particular process in the
pipeline (because not all processes are started when the shell
continues to execute).

The way PID of QEMU is derived can result in a failure waiting on a
PID that is not running. This is easier to hit with subsequent
multiple-migration support. Changing this to use $! by swapping the
pipeline for a fifo is more robust.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index cc7da7c5..8fbfc50c 100644
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
@@ -166,6 +168,10 @@ run_migration ()
 		sleep 1
 	done
 
+	# Wait until the destination has created the incoming and qmp sockets
+	while ! [ -S ${migsock} ] ; do sleep 0.1 ; done
+	while ! [ -S ${qmp2} ] ; do sleep 0.1 ; done
+
 	qmp ${qmp1} '"migrate", "arguments": { "uri": "unix:'${migsock}'" }' > ${qmpout1}
 
 	# Wait for the migration to complete
-- 
2.42.0

