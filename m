Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC22866ED1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 10:40:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mkZOUH7i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjwZl4gzfz3vXQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 20:40:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mkZOUH7i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjwYD1x79z2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 20:38:56 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5dc949f998fso1889231a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708940333; x=1709545133; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vnjHCFtfaL9mXwWGPHpDHfEXciN5WUW1+wFbKGrPaI=;
        b=mkZOUH7iht9PZy8P/meemUblPGXlZmnva8NsSR+3uBoAt0WF+YbfUD/UZL/QTF0vDa
         sE/Qz4/DUIwSkLIHEFxrIwQXy29RbVPgwjcrzKN7pb4fdj4ppEGTu49ThM92XFz87dva
         sBrgsKw2wmxGvWUUtvw+Rg5cqrfmr2D02DBYagm4k1hdSV8M4wvnEFOx78c/9S/xiaHN
         b2Rw76R+GpeWmgEL1+Jmwxeapxq+7SyLMpeBDYLbb8OwqPBwmmK90WPJvc/l+50KEA7T
         VT85BUKPpBeeF6K7g5aI+u/161MHBRY2NDtlCn0IA6JXeiAqZABF+DoQBolDN3gmpgdL
         N+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708940333; x=1709545133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vnjHCFtfaL9mXwWGPHpDHfEXciN5WUW1+wFbKGrPaI=;
        b=gZJOccQvt5/YrGifZ01PEYa6dIAofB+9PW7sm44RNTxUCQj1k98GmZ3u32ulKBaMGP
         OrLJPlcybngWvqW648C1J01gbNCP/dM6O0qw+5VFv8Pd3jTejGQzdaceuzoeFyavebjl
         jtHsnY/upB3l9fV2ES7C11wJM1iWOPNJtevgCkI2XpSFIE288hOY5Eyp44cIcpW2uh9N
         OqjhzMdH0x3zHPhfnmW/IjusMdBj+QtM2y1qDdTm4EV0Q7hF4F6NPWpEvDn1x+gJPF0g
         pKuPrcVnxOBmE35tBAjTM077F/sghR1W1Gv8QVaX+Jmt6z/YL3tT/zQajAa8eU/DL9qi
         HRQA==
X-Forwarded-Encrypted: i=1; AJvYcCULW1Q2O243CBebEwbmehTj5dfkNmUvzfeYST0ZxjSbpm5rBqvZWWMwgm/kQh+fcbE7XgXlPguMpZZEuRFeyAvvWHhBzbAq6d46NLFdCA==
X-Gm-Message-State: AOJu0YyNGJpEeXGygryqUURRc9gqZ8aKfBeUAMBcKVc8zw58EOc6oBKw
	54YxNX+AYhxVmNkHPrd9DoDGaAZpXXTabF0YgQ4qphuVSImeFcV/
X-Google-Smtp-Source: AGHT+IG2EnUxjMz0a/WUt7Yj1hLPi5khQWrO2IMM+XfUlR+14mHZyrTHTnCdcYQxIaN+sjSzMymj9g==
X-Received: by 2002:a17:90a:9913:b0:29a:11b6:a333 with SMTP id b19-20020a17090a991300b0029a11b6a333mr4192571pjp.15.1708940333437;
        Mon, 26 Feb 2024 01:38:53 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id pa3-20020a17090b264300b0029929ec25fesm6036782pjb.27.2024.02.26.01.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 01:38:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 1/7] arch-run: Keep infifo open
Date: Mon, 26 Feb 2024 19:38:26 +1000
Message-ID: <20240226093832.1468383-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226093832.1468383-1-npiggin@gmail.com>
References: <20240226093832.1468383-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The infifo fifo that is used to send characters to QEMU console is
only able to receive one character before the cat process exits.
Supporting interactions between test and harness involving multiple
characters requires the fifo to remain open.

This also allows us to let the cat out of the bag, simplifying the
input pipeline.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 6daef3218..e5b36a07b 100644
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
 
 	# Ensure the incoming socket is removed, ready for next destination
 	if [ -S ${dst_incoming} ] ; then
-- 
2.42.0

