Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F58BBB79
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:42:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hyns2iVK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnPt2dwzz3gKV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:42:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hyns2iVK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn7H0DTmz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:30:02 +1000 (AEST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2343ae31a9bso288498fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825800; x=1715430600; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4h54USUHBKAJcfNGm1VvT3BcXAZlUGZA4uOX+ggTWE=;
        b=hyns2iVKNteHdUKE8L1CfDbmpcBP/fmbNCuW3sCPK9J6Whw4OrZ4YvTJvyL0IXT2T7
         gJBtclGgU+ViQ0yqrzJY+jTFuFTSA0zGrdhJUtqc6QyMO1QSClUFz3IMbQ+p7dRv3K6z
         Ei5foj+1A7VcV9b0UDuQNphcjJh+gmBNNPQuMHGyKWv+AzMI4o5lc3S4TQAnjgFEOmiA
         CCQb02O0lIlhU6h6zNhdw6pnvabY9o+XM7TFW8fKHWI3uF5rqMz8VtvZoVV7z2KLD4pZ
         V/JIQgjyPJZs+IlEr2inOCbmqaI/jpntzabU25POE2eefofiHNUkyf544SAIILk+JKIK
         TfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825800; x=1715430600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4h54USUHBKAJcfNGm1VvT3BcXAZlUGZA4uOX+ggTWE=;
        b=P8mhDdn36s1JRSzmxYYQZY1Bqsa47MYeqdL8Kqt+Ac5kSVhnC+5L2Px6I/+hV56swS
         u1uY/7MZCplAmG+6K8PHH65OkilGk+SeUDSeNINSn9quMTuFxr4Wwkvp55goNKC7rz2g
         gR4KPxZLZjxCjP7mE6iXbIxNkK5tx394ACS0vhC6JCqntPfKHneliKq9lzIRVq0fEp4u
         NJ78mx/eyl+mGeMVK545PEVl1JrlmJfbDj1cpSewesPtkNhD1V9K6TmoTtDts3Xf1TYT
         SA3vBkKhK2qjvMdiqJwYwPM+0KVOLWMWXlMVPUm3bEtKGfzyBUKF+exOENPdrc17thUY
         zgKg==
X-Forwarded-Encrypted: i=1; AJvYcCUeB8RSOALLGTvToBzNrvA30No7tJm+Q2FCxuNKW8t18Pg9v7jOFdQy77kgPJMj420hG6c5qyjbVNS43JVTyd+3Pt2R0BjPlFzaZmXmaQ==
X-Gm-Message-State: AOJu0YzYSh0eG3Nkpr/zFgoRlHLTheb0nyn2sBWsFajaIWRdYC5RAUyY
	j3w5OCkxTKYrHdoB+b13XNJShyyoQ+bAPQNcLD5K+6f/cY2EoiD/
X-Google-Smtp-Source: AGHT+IEvzIyj5q/YWunpbhcGD2rfjuIoMmYhPDFOu5tKaJohsYhSC3wKPUC/yABZy9c9/DJ3fHCG+g==
X-Received: by 2002:a05:6871:5213:b0:23c:e7b:9208 with SMTP id ht19-20020a056871521300b0023c0e7b9208mr7091453oac.17.1714825800287;
        Sat, 04 May 2024 05:30:00 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:30:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 18/31] powerpc: Permit ACCEL=tcg,thread=single
Date: Sat,  4 May 2024 22:28:24 +1000
Message-ID: <20240504122841.1177683-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
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
index aa707e0f3..5c458996b 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -77,6 +77,12 @@ smp = 2
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

