Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B291B353204
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 04:06:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FC0dW5hcTz3bxV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 13:06:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OnLcBdwB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=syl.loop@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OnLcBdwB; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FC0d31v4wz2yxX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 13:05:42 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id x126so4563143pfc.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Apr 2021 19:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jDmDmlQgBZSIrU2MP/TQeW+PUwzt+cJeJDtCDLSCiHA=;
 b=OnLcBdwBQB9Vwo7YGX1pIgbvtTMwzG6FHwLr9UoNKV46KyvOegmt53Y89NLsaQfN21
 fO/kLXHWveE2Wi+Kx8n2b3A4NxSnHmieke1kKcPZtYxHYRBUhgL1/dp35kLQt2xUwKq7
 v/LcjRAI3bjuBvzAWVn9d8cefGj1+/6d4CSLe+5OWPSeEek6jVH4s9LRDiDjQjpoVPft
 e0ETlME1Hd6Lv5o61HHOrV1ne3BcyYxez3omCSEtdVKd1Hg7aKRh9FF7UMITMVrjrutu
 XC3YfVpvI+44CvUkjpGZFnupEFjcIjnIMGwHEQo7VlcVW0c8m/f0BOUxLU/mUIGz9m2q
 EfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jDmDmlQgBZSIrU2MP/TQeW+PUwzt+cJeJDtCDLSCiHA=;
 b=GwXYnd/WGgS34LKiWapNGOAGe+zcdt8e/cB8Lj1HGZsNFwYeNV/sVo+Ii22obPZn0n
 7+QmnCgkWLepjUYfY27vAj0Xpc3ikiSbqsVpJpQANtOjMGrUfabagpKwXpgtR8fP1YQA
 ZUSKXggq882Al3C9eIRUfRNRysBtdqeGdDsHByew8bei4YxVk/xEBYDjZxXWWdjxFaCh
 A0nE3tMcZuofRgtQGztzXbtSiH9EnaiDupIFDVP6lrXiLUaydKearuG9SpYC04MSzHhF
 p37BO34W3UiwYJk1XMusOeJ+IrZe6RU50puIz6RQEKmEwUd+hAZC3/j0uKW0UQSqo4AL
 GORw==
X-Gm-Message-State: AOAM533Ef2eknYaGhwbQiQ6/LlaBqaZAwZECLj9jtDhvTGXFCPcm58lP
 4OOBTWhMhEELEm6Sx2KIKvE=
X-Google-Smtp-Source: ABdhPJxTadWTrGSrAJoCwI5/jjrL5p9pjDpr4boVyEUsCc/P8xeQrl0bH2k+B/WyJY7knMMezBJqIQ==
X-Received: by 2002:a05:6a00:80b:b029:22e:e873:7f0e with SMTP id
 m11-20020a056a00080bb029022ee8737f0emr14588464pfk.61.1617415537687; 
 Fri, 02 Apr 2021 19:05:37 -0700 (PDT)
Received: from localhost.localdomain ([116.246.26.51])
 by smtp.gmail.com with ESMTPSA id y29sm9513289pfp.206.2021.04.02.19.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 19:05:37 -0700 (PDT)
From: Youlin Song <syl.loop@gmail.com>
To: robh+dt@kernel.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
Subject: [PATCH] powerpc/dts: fix not include DTC_FLAGS
Date: Sat,  3 Apr 2021 10:04:23 +0800
Message-Id: <20210403020423.85278-1-syl.loop@gmail.com>
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

I wanted to build the fsl dts in my machine and found that
the dtb have not extra space,so uboot will cause about
FDT_ERR_NOSPACE issue.

Signed-off-by: Youlin Song <syl.loop@gmail.com>
---
 arch/powerpc/boot/dts/Makefile | 1 +
 1 file changed, 1 insertion(+)

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

