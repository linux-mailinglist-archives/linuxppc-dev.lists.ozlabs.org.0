Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A9E89988D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:53:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PA01i5+7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9shX4lj1z3wX2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:53:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PA01i5+7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sLG3fKRz3vgC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:37:26 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3c36f882372so1060523b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306243; x=1712911043; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKkjA7IfVI+VKitW9SdzPybHeE1UNWoe/mszWlluEsY=;
        b=PA01i5+7TDuJ4oC3Cn4p55bbGhFNKEM1sUD/KC7gc1j1XPMfcIZV+tt1eBeeJ1hNnZ
         C2HaRZK23RjgRNvkZCDUS9/NzWRobN9muKJcbZJdr/CaGzPRPYvi4xq+Q9aUlYd1yRZs
         /Tvl179EtEX1zkN1IWwFSoBclEzcF9eeJQmzMcr0/Q4gF+SoPADTKfuXwB220fBi45NC
         rLdwRgauw+iQeKT3u2UOsS2c9FZcQeJj6b17HY2/OAlEYHrpUVhS32pD4EFQVWPKS3iO
         mkliFadsrhJf1/7Fn04uCwrr68mrwYJW9q3nHb/dhcBbRNhDFRwuF5Q6XFLadq3MeRLe
         pUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306243; x=1712911043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKkjA7IfVI+VKitW9SdzPybHeE1UNWoe/mszWlluEsY=;
        b=EFa/vQRoWyUg8LQgVz37sjHUKD1nsuQ7QHNXL1avJ+gK5jIvYSa0G+geFli8J1fGdb
         GS9Tw8wneBcOHB1YANwdAwLA9G1tAHCy18GLLyvqbTEcaI3vsrtg//XhfeoudjzlXJi+
         onlBdTI+fLnZUbHr9o2lcSRuOBM6lWcIMgDV+8DwwzUsnqc5AlICn8t3wLAFzlo+Odwj
         WIwzNgFJWTPfdVNN1BavcgiVoKYveTIq57fztmai7nDl67RojhFmt+AmLrg3H+/uq/QQ
         JcDB6aoph/DZBmrQz1nr0v+AVY3+OwGfFZS2H0Nf4Hj5hKCvd/xgK1sD2ZP9fTZ5/vTS
         sE8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXz8LpNL95srCZvfIPp/ojYbK+8d8Otbp6NT0nzXP8hqO2gfhpDgnJurmYVbn2bc2MGDrVMgb8Q6R0gmTK64skUJji2PtE/vFVnba9ifQ==
X-Gm-Message-State: AOJu0Yy4wegjqp42tNH4SXrFfb4gmupAXXE9D1UPZPdX7C3HRS0QFn+W
	1ODqN49C78ZNc6skIboZbSsS4gntZ6/W22JtnxnaAf5F52gkASOXYZerqTQ5
X-Google-Smtp-Source: AGHT+IFRqbUpDUDagRDS3ABNTAPHJ7QAg+lf/LEbp46fczhD/Tr6jlz/XlSB5uAQN4tx5GrzEuqszQ==
X-Received: by 2002:aca:d03:0:b0:3c3:739b:7635 with SMTP id 3-20020aca0d03000000b003c3739b7635mr885679oin.32.1712306243474;
        Fri, 05 Apr 2024 01:37:23 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:37:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 23/35] powerpc: Permit ACCEL=tcg,thread=single
Date: Fri,  5 Apr 2024 18:35:24 +1000
Message-ID: <20240405083539.374995-24-npiggin@gmail.com>
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

Modify run script to permit single vs mttcg threading, add a
thread=single smp case to unittests.cfg.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/run           | 4 ++--
 powerpc/unittests.cfg | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/powerpc/run b/powerpc/run
index 172f32a46..27abf1ef6 100755
--- a/powerpc/run
+++ b/powerpc/run
@@ -36,8 +36,8 @@ if ! $qemu -machine '?' 2>&1 | grep $MACHINE > /dev/null; then
 	exit 2
 fi
 
+A="-accel $ACCEL$ACCEL_PROPS"
 M="-machine $MACHINE"
-M+=",accel=$ACCEL$ACCEL_PROPS"
 B=""
 D=""
 
@@ -54,7 +54,7 @@ if [[ "$MACHINE" == "powernv"* ]] ; then
 	D+="-device ipmi-bmc-sim,id=bmc0 -device isa-ipmi-bt,bmc=bmc0,irq=10"
 fi
 
-command="$qemu -nodefaults $M $B $D"
+command="$qemu -nodefaults $A $M $B $D"
 command+=" -display none -serial stdio -kernel"
 command="$(migration_cmd) $(timeout_cmd) $command"
 
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index ddce409a8..71bfc935d 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -82,6 +82,12 @@ smp = 2
 file = smp.elf
 smp = 8,threads=4
 
+# mttcg is the default most places, so add a thread=single test
+[smp-thread-single]
+file = smp.elf
+smp = 8,threads=4
+accel = tcg,thread=single
+
 [h_cede_tm]
 file = tm.elf
 machine = pseries
-- 
2.43.0

