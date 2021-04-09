Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A37B835985D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 10:55:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGsQn4lnKz30Ls
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 18:55:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UdnXpL95;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=syl.loop@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UdnXpL95; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGsQL1M4Jz309c
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 18:54:47 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id p12so3382398pgj.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Apr 2021 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oG2G658NtLLa0VJC0f0Y9Kde6tR+vyScuwahw6bMcWQ=;
 b=UdnXpL95mZV98AvOeCHKPOPkZ5KMjeFlk3PnTARizG5psZk+B+7Gk/2AhJjtqsLjLF
 DjPX2nRTgh4F57s2RjgIjjiGHBIWKEm+bWJA9MLJ1zqzM5lxCfK/yrG4lAhKkS7FNbj8
 2d2TjibQHiFyLyZuPTjVbf7KO6teMhrNkosmf3fy6Bmxw4qfNAGVsa4nmYHPYIOgzTXt
 HnjfyrlGTyiv0TXE0z+F9OmrJtwHPmIteVcmHk8YdgRYO4OPyI/iCvMdbH7Xe7GV+UHv
 KyZdzm5olyAM7XXr7axmsrn4T+EX/ikyLo+nG+8Qfy87ci7oXXB/9TrYBmsUQ5iZEqv1
 r1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oG2G658NtLLa0VJC0f0Y9Kde6tR+vyScuwahw6bMcWQ=;
 b=cyIPhiOM9dNgftVDdYtDo6b6rpkuTM6py3R+BGR1+cTqfQESxJi/YWJPmJ3y38pCij
 kEJ5EolR+upF+pdhBrPRELGAvbCAcCfOvF53wgr9/4cx2mXxGX1Dkr3Btn3FReLe1DHz
 sB+iprWbYE0cO2ECw7crbd6ivqldLMpPM9c9dbJtmjfMnymxXyWzgaqx6Vk1oPSi6ldQ
 5JDDnS6u0frjpQRPLtxPbONvo7hY+bzoNcMVg1OtEv87EPRb6QJ+t8GJ5uiSJPF7gPAV
 NUjGR4L6UOux4FzrkFycGazRv3kN/5bOEvNwJ6fJrbtkTLZGDREbH2HDVTjpSAbPF6ET
 PkRg==
X-Gm-Message-State: AOAM530jEI22NI3WHw4yaB7gerwQ56NqzqNjsFd3ixliVpbwa9D/OODh
 5egDQvPboKx/TxSjGeAnef0=
X-Google-Smtp-Source: ABdhPJyTU5x2EgEb3pLMsr2+wz5V+acWJ3AoNRqbdgiU3DWdydfNu1/Q0Xg5rkS99cLwUllGIaY/mA==
X-Received: by 2002:aa7:990a:0:b029:244:f35f:2b8e with SMTP id
 z10-20020aa7990a0000b0290244f35f2b8emr5948566pff.73.1617958483331; 
 Fri, 09 Apr 2021 01:54:43 -0700 (PDT)
Received: from localhost.localdomain ([116.246.26.50])
 by smtp.gmail.com with ESMTPSA id o9sm1643988pjr.43.2021.04.09.01.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 01:54:42 -0700 (PDT)
From: Youlin Song <syl.loop@gmail.com>
To: robh+dt@kernel.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
Subject: [PATCH] [V2]powerpc/dts: fix not include DTC_FLAGS
Date: Fri,  9 Apr 2021 16:51:35 +0800
Message-Id: <20210409085135.105821-1-syl.loop@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Youlin Song <syl.loop@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A central rule exists to create `$(obj)/%.dtb` from
`$(src)/%.dts`,DTC_FLAGS flag must be used with it.
See other architecture and Documentation:
arch/microblaze/boot/dts/Makefile
Documentation/kbuild/makefiles.rst +1433

Signed-off-by: Youlin Song <syl.loop@gmail.com>
---
 arch/powerpc/boot/Makefile     | 2 --
 arch/powerpc/boot/dts/Makefile | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 2b8da923ceca..a3bc3aec3c0c 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -72,8 +72,6 @@ endif
 
 BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)/$(obj)
 
-DTC_FLAGS	?= -p 1024
-
 $(obj)/4xx.o: BOOTCFLAGS += -mcpu=405
 $(obj)/ebony.o: BOOTCFLAGS += -mcpu=440
 $(obj)/cuboot-hotfoot.o: BOOTCFLAGS += -mcpu=405
diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
index fb335d05aae8..c21165c0cd76 100644
--- a/arch/powerpc/boot/dts/Makefile
+++ b/arch/powerpc/boot/dts/Makefile
@@ -2,5 +2,6 @@
 
 subdir-y += fsl
 
+DTC_FLAGS   ?= -p 1024
 dtstree		:= $(srctree)/$(src)
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
-- 
2.25.1

