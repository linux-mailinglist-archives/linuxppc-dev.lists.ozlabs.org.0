Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711A8670D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:27:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K07xsY4l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjxd40YCdz3wFc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:27:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K07xsY4l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxKb0q2mz3vbG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:13:54 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e45d0c9676so1585060b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942432; x=1709547232; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDeKQ2lObUUr4KHptgoHZEcycW9DzgxeUjc+q6aUnYk=;
        b=K07xsY4l2zIg3cGFWjVCiKrpUEKJUGmZJw1pLBFfV1d1qprvyUCZmDrIEZ67rcD2mT
         RkVIz47Egk0s2QRR7eYXaHTo+xlWHHVBMw9ix+OPcjaytSwtlHkaIdwG/YHqSsWM4jnd
         6mAvJiQGvyqgGDpl+AJj3FaIvTj0Tg6g+R4fR/ApzMhIdfz9PwP4gYUDiXbvBD/ZVWQh
         P/XAk72ZrhxV/eMiY8uuVCxzIQm901EoF0rovH1vmJi4YXugKLB6UF2eLS1iUz9+9rLI
         V2IXR5jFE9meI3qg8hnT262JdTalRTTHOV3+y7/LAiVeAXfmvetX8Wv//TPPO44IP6PC
         d7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942432; x=1709547232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDeKQ2lObUUr4KHptgoHZEcycW9DzgxeUjc+q6aUnYk=;
        b=keEBfnWGGO46evPHZjYoHXedaGGQqdRZTe5ZEJz9gusA5baQ4SNuLUCgJbW50KwkI+
         JtF503AV287fBsbACuk1QopufVYFl/ORFJZwuSnR/WXiK//zY1fig9kF/YdZ1LgfV9OK
         tB+fz+cBtoLbxrOYl6tXrT8Dj+CjFrqLR/BZHj1T3JaQBoudRD9jCSCBbj/Be7CrrobE
         hPtGTUtb6+xnl5Qj2hs6K149/FfRJCOs6i+PZGt21aqJYDxQ/88I5c9ma3NOc5IM7TB3
         C/hweSeNm1HYoqVsf7rmd9XmhyZ0tM2iGZ9KUbI5/xp+BtjPbqvzPE0wtSbHWsK5zKcy
         Kr4g==
X-Forwarded-Encrypted: i=1; AJvYcCX7fMhnd9vnRf5KFiSDmFlAZbgBWZ6TOlwHz1p4VJ3XyHhA3tYc4XKhPmQkQCD55HIjxfShx26RJoYGCdDRkX+5BGIxXJ69ffK+MZ5fjA==
X-Gm-Message-State: AOJu0YxSWBahAiFgo2U3zbfINfEPvy2KzYu7leErHRuAwRmWC5OQRH4C
	OXjdJxJwKTiVpXAIPNvH9sfuhDahVwC12CJuiDxSURNXHijxaS5E
X-Google-Smtp-Source: AGHT+IFOoUcECAFT4/BUkgpIcoKXR61NJdzPTx/1R4n+6sp35G90zSsoZYx8Hxeslp4JTEQ0PkUPIw==
X-Received: by 2002:a05:6a20:9f86:b0:1a0:b5cb:36d4 with SMTP id mm6-20020a056a209f8600b001a0b5cb36d4mr9052247pzb.19.1708942432602;
        Mon, 26 Feb 2024 02:13:52 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:13:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 19/32] powerpc: Permit ACCEL=tcg,thread=single
Date: Mon, 26 Feb 2024 20:12:05 +1000
Message-ID: <20240226101218.1472843-20-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226101218.1472843-1-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
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
index 97a549c0d..915b6a482 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -97,6 +97,12 @@ smp = 2
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
2.42.0

