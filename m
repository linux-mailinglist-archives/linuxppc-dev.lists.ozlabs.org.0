Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5AA81597A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:44:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nO11PLNf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnQK0tFQz3cWn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:44:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nO11PLNf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnNZ0Bplz30fZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:43:25 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5c690c3d113so1308913a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734202; x=1703339002; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cu8pXvZrMvEyGfJqwo7jShQ/A2yK8wN3uOSg+62bGgw=;
        b=nO11PLNfyF0dUFyJkEApml/AxS18BEFMZETjkD58WGdhY+AzbpMpsE5014Eq0hLfP4
         nKSCL/fmpZ44u1E0tmM0r7IVzdVd5WHd4zotrHTmB7c5MzrVyKxq8MG+0ZRsaPLrvEOP
         dIZkU94Nj9punQHDtyk/2Y1yBNygjwHzOMUA91tnmyeSGzp0tHWWFfBXTA+6QR2ek17o
         /sdfRqrX9vy+0rdbrtBc+ICsVGSYi1SYDp0x4xzPqTTUIrFAPGMnhh2xA1i9nyqjAJVF
         BbImYv9gYGZomKmqub+Mdf1jkpXWXuNIHmwS5nw4oebqx3V7nl84JG7v0MDViaM9vHZ7
         HkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734202; x=1703339002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cu8pXvZrMvEyGfJqwo7jShQ/A2yK8wN3uOSg+62bGgw=;
        b=Eto6j6JCkQ6SXtYtJM6FkigWIlkMGCXECC4v0JTTYUK2ToQBNIFzkfjQ+Z6cMVSn9o
         LzJ/26k1cq9avf01y/Pl13xynGQ3HOI320z28kGsujqisMZSN4jOjDhn8U+Jh+th+vbz
         8GjEnVSRLb0SHJJuMmFe+ufR8NEmeF6SHatBwJIjXiggTN4l8DdvjIaJ9gi0okaIfdF+
         37/0UmPA7MEuBwQUmK0gPUHoTMVUPceqMnYWduYzJ+Q4IwVpudfJoc5GylmTqF9zYa0d
         4hktj9hpLreBdQ2t5eiXLtmZ87Sv7hSXFsP8LQYKPIa+LNRWvNSO728HhDh+5mSVKbqH
         6ouA==
X-Gm-Message-State: AOJu0Yyo7NaSuCYY19ax50u5J73NO8zMYur4KgF++q4lvk4/NIiXbQvd
	f6m6Z8dTtX+peTAlZ7TM3U0Q2kIxZv4=
X-Google-Smtp-Source: AGHT+IEiHRMq62KMzmdGnFRpRmshtiSJoLYOJvPsJPszWrTjzN8bYf1c0gnjybqQW4DZYo2pugFxdA==
X-Received: by 2002:a05:6a20:4caa:b0:18f:97c:617c with SMTP id fq42-20020a056a204caa00b0018f097c617cmr10932258pzb.121.1702734202709;
        Sat, 16 Dec 2023 05:43:22 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:43:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 01/29] arch-run: Clean up temporary files properly
Date: Sat, 16 Dec 2023 23:42:28 +1000
Message-ID: <20231216134257.1743345-2-npiggin@gmail.com>
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

Migration files weren't being removed when tests were interrupted.
This seems to improve the situation.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index d0864360..f22ead6f 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -134,12 +134,14 @@ run_migration ()
 	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
 	qmp2=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
 	fifo=$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
+
+	# race here between file creation and trap
+	trap "trap - TERM ; kill 0 ; exit 2" INT TERM
+	trap "rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}" RETURN EXIT
+
 	qmpout1=/dev/null
 	qmpout2=/dev/null
 
-	trap 'kill 0; exit 2' INT TERM
-	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
-
 	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
 		-mon chardev=mon1,mode=control | tee ${migout1} &
 	live_pid=`jobs -l %+ | grep "eval" | awk '{print$2}'`
@@ -211,8 +213,8 @@ run_panic ()
 
 	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
 
-	trap 'kill 0; exit 2' INT TERM
-	trap 'rm -f ${qmp}' RETURN EXIT
+	trap "trap - TERM ; kill 0 ; exit 2" INT TERM
+	trap "rm -f ${qmp}" RETURN EXIT
 
 	# start VM stopped so we don't miss any events
 	eval "$@" -chardev socket,id=mon1,path=${qmp},server=on,wait=off \
-- 
2.42.0

