Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8F3A40EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 13:11:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1dT16n5Bz3c6Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 21:11:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Y2Nya1zi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Y2Nya1zi; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1dSd0lxVz3bpH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 21:11:13 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id i34so2165001pgl.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xh0TM+1nx8h9M9ijCxN00fgzffsVSTNhyhrfqo8z+BQ=;
 b=Y2Nya1ziNhQXyWYlbbktuy9BB7qzK6QeF/19JF9VuTbkYSOa5qkKkO40vyOk8CMfGT
 emUmUOC21vpFra+T4TVveItzxdI2viCTvB9ztkdh0bIsZSN8yvsvogEVhZl/upjt4sXr
 rY+RO3fu+oBR+yq44pjGotqgnID8JjcwnZbEs1P7XyFDWSQp9nrT7+UtXlDIv040h+2F
 fjgC4ZtsT1rcdlo/9pDAwQFHmgCriyZFbAsKCr5gJq4jDkh9RmXtJFB1psbV8fo8j8gm
 Y4ZXnxh9S39eJCV2kU+ai6BDnE9AesHDRW1KRsNUloLOkCPDTQREaeRK0rZx7NRX5MU/
 tcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xh0TM+1nx8h9M9ijCxN00fgzffsVSTNhyhrfqo8z+BQ=;
 b=Rzg+iqcLFKLgDZ/KxDXtiXlf9HJ309+V6Z/NXsLpXFGM9beK0SogOyg/3FxWOIYuGV
 q4/SD8AB+XfFoVcxp8O6C+sXp9AnwJLoiU1LlP6Fe+ZswkG424bTbjVqedQG3wBG1N7s
 /QYHMlZAk4NiWwWqr3GXw0DNVyauOwVcYIXLPQsHZr8FQknhD4NG55gX/kcNIVHHkZTj
 ujSGyPV0BUVas/751fJVAhmngvBH28+LEc0ukR09Oo0dyiy8xm/JSMGivZt/mHsxdA/F
 CfsN3gzn0Avlf48SE92G5f4pkwWyOUAeI/N+5ISMCnjtNHA9gNNALJfdTR4AOMoyRkPZ
 qNVA==
X-Gm-Message-State: AOAM5302OXhWqSLX73sXYsuzP/jLGsD7gmReNUIN7+1VEICvj1YXOL19
 H41OlN8pYBo4RyEMYHpnlroAGHfxxfs=
X-Google-Smtp-Source: ABdhPJysRT+ekM+yX+vZLdvABR5hckX2UvW0SzkIeWfhfWLyIijSa7hD8Q11Tq9jGUerce0T9oiy3w==
X-Received: by 2002:a05:6a00:b8a:b029:2ec:761e:33e3 with SMTP id
 g10-20020a056a000b8ab02902ec761e33e3mr7666418pfj.35.1623409869810; 
 Fri, 11 Jun 2021 04:11:09 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id z5sm4817165pfa.172.2021.06.11.04.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:11:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/boot: add zImage.lds to targets
Date: Fri, 11 Jun 2021 21:11:04 +1000
Message-Id: <20210611111104.1058991-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This prevents spurious rebuilds of the lds and then wrappers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index be84a72f8258..405acd2df160 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -229,7 +229,7 @@ $(obj)/wrapper.a: $(obj-wlib) FORCE
 
 hostprogs	:= addnote hack-coff mktree
 
-targets		+= $(patsubst $(obj)/%,%,$(obj-boot) wrapper.a)
+targets		+= $(patsubst $(obj)/%,%,$(obj-boot) wrapper.a) zImage.lds
 extra-y		:= $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
 		   $(obj)/zImage.lds $(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds
 
-- 
2.23.0

