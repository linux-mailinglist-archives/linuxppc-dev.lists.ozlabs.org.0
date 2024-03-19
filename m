Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6124E87F8B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:01:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wsa9pfye;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPM2163vz3vfg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:01:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wsa9pfye;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPJd3kngz3cy8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 18:59:45 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso3170160b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 00:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835182; x=1711439982; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7znwqTVB8+8L1jJIfaQ7a8vMZg63pFuyoiAqB5ObgC4=;
        b=Wsa9pfyeKyZIhmusnxfOlH+IM3BejNvufPXsjjhn20jq6tQzoadKsJZgevUvBUf8BS
         vRvAFawNETnPIvEvVHGopnkm9rQr64b5ktXVkOp8do4QfbAZqgqqKkIjtQxvxNHwlp0d
         uqhIeG0itI+paetTjWj42OWCE+7V3H+nVsURXnCE/tw3JJ1g/VhUpBZOpHz9QlCrY3e/
         AJJ0SbljhilgCzHmsJTcvKhDf1zS8dTvWKk7Kaj4GcJHDCr55YLaITzQqQ3rnZdE7XRg
         55MnU9IbzLrEFqeZyxLfDGo3R5IW4VgJpIdaDc1FJAK23TiYs/kGOjFfg//AqtgUmAJV
         dFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835182; x=1711439982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7znwqTVB8+8L1jJIfaQ7a8vMZg63pFuyoiAqB5ObgC4=;
        b=hzyZWiFcQO7dToIPNRwEaPW7UmTF9wIkyS0d0/bUESz9SB7zFAZTC7s+Jwe/uV/IAm
         WE97oB/2u2ybnocRdg6Lqz+/XHVxmfEuRnWTDFifWyqEcMJ5nHDAaq1V0H20oNk4QOQ9
         1kolUGDAb1yNnqdhhLc3FxMMTCZmQa+EOgn/gL21Fsu5LSpjPa7myyBByL08vq5a8kiI
         VhZKA3fL7nZoRK47sQiOlmwoI/fQu5Ge8gKoXOkMr4zWRn52tM5KxpuhpxMMI00qu0us
         +ZaVOVEpv9QuW8ANvRI79mfFVPFJYknnt4was+SBL/9i2+pK9XJQxfJsPKWx4GbokvnV
         bJaw==
X-Forwarded-Encrypted: i=1; AJvYcCXTZMWbMVdQKA0lrz+v9o0Dc5+6bPyoMmax+CB7y7GBlDLLo/TreOzjaExDKrwwJDH5mOI6fs+RZ1WPGIPSsH4nRAUcMw0OnomWS7E1UQ==
X-Gm-Message-State: AOJu0Yx3Klq9pbz5lOiLKwYTwaVqtDG7KyPbWMkhQPYd+UO5ugCdZUKP
	HJJD11x4jD2hw3DVdvPqCnw1qQyzA5eV+vqeGj+nTn9lgP0mpEOh
X-Google-Smtp-Source: AGHT+IE4j+Tvbeu58NluMV0rzs1CQ2K9gXa/2zH3LKie41jBP9/lGyR0R3vWNoE8F5Vdq7v8pF2U6Q==
X-Received: by 2002:a05:6a21:3115:b0:1a3:647b:b892 with SMTP id yz21-20020a056a21311500b001a3647bb892mr2682650pzb.15.1710835182535;
        Tue, 19 Mar 2024 00:59:42 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.00.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 00:59:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 02/35] arch-run: Keep infifo open
Date: Tue, 19 Mar 2024 17:58:53 +1000
Message-ID: <20240319075926.2422707-3-npiggin@gmail.com>
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
2.42.0

