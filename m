Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D253E84F216
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 10:14:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gYodIvIb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWSq85hXbz3dLc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 20:14:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gYodIvIb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWSmB17r4z3cRs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 20:12:09 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6e2bb7dc4dfso318616a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 01:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707469927; x=1708074727; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueRelljhUpFIYjZZj8MkfM076AFkfPtPKMcEp6Rqelo=;
        b=gYodIvIbVMG/WhMgomUiqxv51LhIdY2j06Lt4oMkMnzdmrtt4I3Cu5dunjeQy+dXcd
         hIJj4hm0aOQfW3m8u56+dQWHAnUqmtzvAdQtvwP2OvaT2DeDETgLNe/bQhKV0z+l0pxb
         UFwfJq7eTXtRture2JJNBuCw9bLsZpnH3bogAjpxNU6Gk41E896VQVD1itQfArpoAIoN
         mstlgAf8nkiCTwE47j0GX3n5QeoStlGeyhbt51QlMwvazGlxJFqTvyerOf7Nge/+7sdm
         u5O2D+WweLV6lp5BxuPF+nXZO7qMKdnLpJCdQloIhChqV9bQkkx4NQZVJ3gs0fw28jHF
         okxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707469927; x=1708074727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueRelljhUpFIYjZZj8MkfM076AFkfPtPKMcEp6Rqelo=;
        b=nDmNo1v0mmQtQ5+SUyDaWITVYUjnuOrbRKLMO9Dmq13PnPpvOSn9adGr3EZwz7WGSD
         skMBAmWPlRE13fnV6ybb3h9Fpi/3BaLrTe8AF1ssItIGUX5E7lM9u4vEsROnfSh8AvzY
         MHOz2xy52EBafqftiTMlFf7AYH5/lXwjmJ+TDBseFK8BRSqH8D3HQ/JWvlKLOm+PixnR
         xfSFH3Rk6PUjNPSQHfGPqmmLJrO/tyjCwEoLcjs+VME+a/cQHYA5ZjK2P0wKA9G3v9G9
         JqAIVeE2kh60qNEc5wh0mZacIbsmceA9Xs/aLNGoZcuKXWXyIvalyN91cTll3ucp/2y3
         SRTA==
X-Forwarded-Encrypted: i=1; AJvYcCUVrC8w5Es8C2m+O+Fw7WbwXaCv2x5l1iXKLlNuFohybBnCShvFjBoeSqz2jla6pEQApBtvm6Q02a2uSh8iS86J6E5DxBlHHWR+qGjLDg==
X-Gm-Message-State: AOJu0YxrD8ykBlU9vN0s8/hrbMmgpf0C6eNXE3gmTBE49qeo+gnxOrAd
	cSn7hvkyIHgNr6gRhllTJRcTb3U7IOkG6zE62W/aL7pHioC0JOru
X-Google-Smtp-Source: AGHT+IG+uF1AVKltLLT/Mxy+BTg+RrPJAlXJIq8b820qvd3G5/GdkhJ+6IWxpDYFMlAC1NwZY+uNog==
X-Received: by 2002:a05:6830:2646:b0:6dc:9cb:bd76 with SMTP id f6-20020a056830264600b006dc09cbbd76mr792620otu.4.1707469927219;
        Fri, 09 Feb 2024 01:12:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzWA83VkewDTZfCMZdk6G5YgheMq3t4JNWJCTTx5tmNSX/1gsPYIiH3qmJJq/ijinLpb3xeiH2zs443nSPQUpC0/Em/eeE7RoY4CHLfiXosNuS/3XgeKdOWIC5vELsZJATbQJwpPKfQrAO6jTEODObtJTizbk7H/mPboAdVVqcEZXaUUJ1i35iJVQQ8TdtU37SY4l4vA/HecyN0hGa4ZQftCxlT82HavH0PWHaEow8h9L//3jq2ViO6p3heq9tcsCsGDGWifqycdAeJ+NG+ZZJJKMPQtmF2rgY2/VimIYYSsdsigD8uaLiwOPw7UmRAKWGnWc5vZmpNzTmQfLXihvaHpkTSfTh7yoa65zAimrjVwsQgHs0YjUoUUWuAj9uMmBmpX3UuPk6qu6f5FgJpKJvRVgAcyzBf4Rodf1M7Cd2pAfF5wAiVnR5IDVF6VF4H+eehWMNzS3VqYzuE5TlrklgZg9CX4fK4r7Ikjgvg4oznWMvy/CcF4gKGTZUQi3spCoNRwXFsT1963QqFGp43gEXpqK/iBwlMrv+ntA9/McSpbkv+Y4icgFi
Received: from wheely.local0.net ([118.208.150.76])
        by smtp.gmail.com with ESMTPSA id cb1-20020a056a02070100b005c1ce3c960bsm1101742pgb.50.2024.02.09.01.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:12:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v4 3/8] migration: use a more robust way to wait for background job
Date: Fri,  9 Feb 2024 19:11:29 +1000
Message-ID: <20240209091134.600228-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209091134.600228-1-npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
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

Starting a pipeline of jobs in the background does not seem to have
a simple way to reliably find the pid of a particular process in the
pipeline (because not all processes are started when the shell
continues to execute).

The way PID of QEMU is derived can result in a failure waiting on a
PID that is not running. This is easier to hit with subsequent
multiple-migration support. Changing this to use $! by swapping the
pipeline for a fifo is more robust.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index c1dd67ab..9a5aaddc 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -130,19 +130,22 @@ run_migration ()
 	fi
 
 	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
-	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
+	trap 'rm -f ${migout1} ${migout_fifo1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
 
 	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
 	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
+	migout_fifo1=$(mktemp -u -t mig-helper-fifo-stdout1.XXXXXXXXXX)
 	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
 	qmp2=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
 	fifo=$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
 	qmpout1=/dev/null
 	qmpout2=/dev/null
 
+	mkfifo ${migout_fifo1}
 	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
-		-mon chardev=mon1,mode=control | tee ${migout1} &
-	live_pid=`jobs -l %+ | grep "eval" | awk '{print$2}'`
+		-mon chardev=mon1,mode=control > ${migout_fifo1} &
+	live_pid=$!
+	cat ${migout_fifo1} | tee ${migout1} &
 
 	# We have to use cat to open the named FIFO, because named FIFO's, unlike
 	# pipes, will block on open() until the other end is also opened, and that
@@ -150,7 +153,7 @@ run_migration ()
 	mkfifo ${fifo}
 	eval "$@" -chardev socket,id=mon2,path=${qmp2},server=on,wait=off \
 		-mon chardev=mon2,mode=control -incoming unix:${migsock} < <(cat ${fifo}) &
-	incoming_pid=`jobs -l %+ | awk '{print$2}'`
+	incoming_pid=$!
 
 	# The test must prompt the user to migrate, so wait for the "migrate" keyword
 	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
@@ -164,6 +167,10 @@ run_migration ()
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

