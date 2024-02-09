Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE5B84F099
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 08:04:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E4GeIhhJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWPxB4X9yz3cWx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:04:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E4GeIhhJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWPtR3r7Dz3cG3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:02:23 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d95d67ff45so4728635ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 23:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707462141; x=1708066941; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH3i7c2rdDusoO9l0oYKXVEfYgOTk0BIl82whiOKoAA=;
        b=E4GeIhhJtVuNqSy7lgZnmx0DT0twW5ZraaSSUj4ct3KEWZIbpKEcGBdCnj9bdihm4i
         BJBFeYbTkH7dQkX6b2mxXFcTiPiun38f0mh/Nw9KPGFR4AFEj35v7DmXg/3/OzFwyJdi
         jXWPluTl90nfG8PTAaFTyGuk27Fs6428piUQDaHmMVKH8AQSyO5QAjxqXfPnUV7r4EME
         zNjM6flLExhbwFevMbWUOgnE00psCY2UUWkukagt3ozwajhsVNqXFRM8rOF4AMKewAF2
         1jv0GlHRMY1XIAf5kwMh2GhG8UYuUR5i6pMQxt91fa+hVXF+wY3wusz11uw8ohpkjU5J
         KcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707462141; x=1708066941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vH3i7c2rdDusoO9l0oYKXVEfYgOTk0BIl82whiOKoAA=;
        b=uN0AUVeoiUXT4Nq5rvYp2i8cQEa0WEQ4RnkcVyurpwTYZat8Zqh3Pj7b1oXlHmN6Km
         8DeYG7qsQKnaRiaqQUSvNNIrEQDY8TQtkXXlhDqX/Rf3QgakTcLElnsOdsRF8vpzENDk
         pVAQm+xPzyw+AZcZSgKpviC4+aTGNopF8fjRJHMCOZ/yBarrt7DDFVK/TYr1yFC8OTXQ
         kg9DBmx3sleOwga8OpqPXOSNJNYbfztWTIODkbxPBh4Ca7pEz78/wOQYpK16xfPqz5Fn
         weAYKNdsBzS/GQoXa7okktVjIqgf6FNSTRkxK4TfF0NmNHHupRww46+322atbp1Zs8E3
         /aMg==
X-Forwarded-Encrypted: i=1; AJvYcCUFUdpgrgIWUEBkHcf3SydY1DXPGPqg6hQ87GiJHoJCF7lttU7eENPd19TI5e/1fYmlAJM3pGzUcr8W5tt24DXaOBIoBHB7MxYA6xGIWQ==
X-Gm-Message-State: AOJu0YycWffmm7mK7WtTHvmLdB7yu+uTVFfCuaYqCsAiHQd6pmHEpDsh
	TU75XlZanIZe+HwMHFDv+JPdkRb0+yhCODxJbkt2IPJvK8E3CqYc
X-Google-Smtp-Source: AGHT+IFpcSgXgc2Pcdk1s+DGllDRanvp4qFa/hQemAtrKxUbxZjddPhfIOf9iXD5cVWfbfVbrQ/D5w==
X-Received: by 2002:a17:903:18e:b0:1d9:d300:a670 with SMTP id z14-20020a170903018e00b001d9d300a670mr877486plg.15.1707462140710;
        Thu, 08 Feb 2024 23:02:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWL7Y2HotGSsYV2teE21T1pi//Ty5QF4kXvFsWSIafNuJsAO3MdpE0xNs70oRHlkPzvlweKPlY/8NnoJ8Rsb8cukQkZw+68Z5QSNfUfNdmODTSgqvFjyszroItLiVTDAdeUhP9LFuIuX+Uju7ap+Lz1EMvexMEjb/B9p2DufbSDyBaJUkktaWqJP9nvgcFqgFg560PLWmmaa23cF6BVopZ1/UmkHIgJFimgDzVO1V7oFGPOVU5ql0AOYjueX9ujRNV4bF12YISbbSmk/s5JGaptqLnfCDz+eCPM31L6Z6qNuLePOq/7LKvdhpz0VQOH0pyizLsTq60z/7V6tTyyIJ9iFcEDCMSN+J823GoIPWzNLvMVtXrv+ua3FVf3eaNryFzlYO6TFJt0ZYrJMrYPX7BCvHnspo+9Pq2LJiNVd8JY3+fKt9h/h+beNkbL1k96JLlFMzGOyPPdfTWHRn88I/eqDVq/JFQkPn+Hll2fiMbqsZ8vDur/NYYW6n3grqy5i9qnk4H1YLx8Dyz+w0oSMAtp43SrwqkEnPDRbrzuPF/nMuSoHqeviQRI
Received: from wheely.local0.net ([1.146.102.26])
        by smtp.gmail.com with ESMTPSA id r10-20020a170903410a00b001d7284b9461sm839285pld.128.2024.02.08.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 23:02:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v3 3/8] migration: use a more robust way to wait for background job
Date: Fri,  9 Feb 2024 17:01:36 +1000
Message-ID: <20240209070141.421569-4-npiggin@gmail.com>
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
 scripts/arch-run.bash | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 1e903e83..3689d7c2 100644
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

