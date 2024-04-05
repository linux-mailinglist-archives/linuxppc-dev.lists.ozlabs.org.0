Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9C5899804
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:38:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kDH15kp1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sM02ZqWz3vj9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:38:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kDH15kp1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sJd0Jk1z3dCH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:36:01 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3c396fec63aso755869b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306158; x=1712910958; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wkxgvl2lBcYYrU/QBID/gDLdeRQX9cHSJck6VIsk4M=;
        b=kDH15kp1HoA7MiC0jrjYLc81KqbqJsJuEPBoMMRDlwuGx0Jyh920uokut9VSHb+w/u
         Gu5LifA4mEJpFXP+MgYJaHkcvFmmXm8Q3+mruQjHVQRX1okU+wnGl7Yj0eQCwfLpYAWH
         0F599TuGFmt7KUUIq4n2vy5UeLpjmqjDmtNLm4OxxPthHco3PYdZBALfv3auZ9LDrYwl
         4JfZT3WS273Ys3Ybpvql/43sBFe0da7Wp4Y0vTdRo62FW2AGGPFNJ0aI1KzF+0c1hEHn
         JNQzJeqxCv1tlswzas1qgh7MXefBY0uoKmJ7J6JDmSfjeq3j4IJUWy8P/TmMMcxzXmZX
         eKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306158; x=1712910958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wkxgvl2lBcYYrU/QBID/gDLdeRQX9cHSJck6VIsk4M=;
        b=dLxJaHBPXITFJCtKZva83HZYRNpCmsXBCM8QfAtViJPhAULXvZln9Tp25Kb4ST9zfG
         qGCHNcpvLRoa/ZNQAKW2r4LTWzbP5tRbXuhoSZHGejryjyPUZeojkg1qj84ZhMtJznJ3
         KRKkp6ef2D5/KxJZJ7MeywZqDDdhviHO+j0Tx0reiR8yLvILunBXZtcX68I9ewtes/NB
         nI8iyJUhQ40woz/zOE5NrCzq5n4L5/ZzWqkNzM0CrnpkK2OjRRwdZmteLPfTxOTSp1cG
         jK/xuuSYxP1z6pJxBPUFx52dtCgFv8TkN/0R2hHN85gUjtWu01dINXbDpd96CmLWmSw5
         dm5w==
X-Forwarded-Encrypted: i=1; AJvYcCWGRhdc944KPvfPkmtfcHJYzRt57TtgqvLb+bLsFCcE86NFn3jHUVL3UDfJ7cTwfl8hMvpQm2WeVY9A13nUCTFiVKp8bYQf6iMGT6RzWg==
X-Gm-Message-State: AOJu0Yz1j4gSPpT5rMtH/mejBT5ZvnvD073m8ekf5JCCyLs1qe2RuAsp
	WCCcFxMgN5z5sBch3AkWmavZglJbbH2GCJKU7x9KMBS73YTAc0Ua
X-Google-Smtp-Source: AGHT+IHeF5xwGRwVs7WDSnDlg791YkyJ/sdhiRw2D0J1EmpmyvkwrLKfq91/UNQJENVPB3rqo3jBgA==
X-Received: by 2002:a05:6358:5b17:b0:183:bdbb:3ad4 with SMTP id h23-20020a0563585b1700b00183bdbb3ad4mr885549rwf.2.1712306157795;
        Fri, 05 Apr 2024 01:35:57 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:35:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 02/35] arch-run: Keep infifo open
Date: Fri,  5 Apr 2024 18:35:03 +1000
Message-ID: <20240405083539.374995-3-npiggin@gmail.com>
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

The infifo fifo that is used to send characters to QEMU console is
only able to receive one character before the cat process exits.
Supporting interactions between test and harness involving multiple
characters requires the fifo to remain open.

The infifo is removed by the exit handler like other files and fifos
so it does not have to be removed explicitly.

With this we can let the cat out of the subshell, simplifying the
input pipeline.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index e34d784c0..39419d4e2 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -158,6 +158,11 @@ run_migration ()
 	mkfifo ${src_outfifo}
 	mkfifo ${dst_outfifo}
 
+	# Holding both ends of the input fifo open prevents opens from
+	# blocking and readers getting EOF when a writer closes it.
+	mkfifo ${dst_infifo}
+	exec {dst_infifo_fd}<>${dst_infifo}
+
 	eval "$migcmdline" \
 		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
 		-mon chardev=mon,mode=control > ${src_outfifo} &
@@ -191,14 +196,10 @@ run_migration ()
 
 do_migration ()
 {
-	# We have to use cat to open the named FIFO, because named FIFO's,
-	# unlike pipes, will block on open() until the other end is also
-	# opened, and that totally breaks QEMU...
-	mkfifo ${dst_infifo}
 	eval "$migcmdline" \
 		-chardev socket,id=mon,path=${dst_qmp},server=on,wait=off \
 		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
-		< <(cat ${dst_infifo}) > ${dst_outfifo} &
+		< ${dst_infifo} > ${dst_outfifo} &
 	incoming_pid=$!
 	cat ${dst_outfifo} | tee ${dst_out} | filter_quiet_msgs &
 
@@ -245,7 +246,6 @@ do_migration ()
 
 	# keypress to dst so getchar completes and test continues
 	echo > ${dst_infifo}
-	rm ${dst_infifo}
 
 	# Wait for the incoming socket being removed, ready for next destination
 	while [ -S ${dst_incoming} ] ; do sleep 0.1 ; done
-- 
2.43.0

