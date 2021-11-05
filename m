Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AD4445EE0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 04:52:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlmm74W3fz2ymg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 14:52:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bezl5dgu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Bezl5dgu; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlmkl1ZPxz2xtw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 14:50:55 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso2488872pjo.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 20:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w1qoMbDr+sdyPtmsxdT5TLHlTpk2WPuA7Fji3juVDGY=;
 b=Bezl5dgunI32HXF9j+O9V9UkpzYyuCKFtqNYHyMk6KWg5tXn/nyXPBN0OFlZAPgM6X
 5iS5Kqm6LZmjVtJyiecIF2erTMIT7RIaA09qSpxjgF5r0VH8kX5GF+SCodEPd+TbjO0l
 HeV5JWrrf0V84w2ALkQAojjqJio8MsKCxjh3xuy/ueqoX98tg4M/Tq+8nSNxi0tWAJGt
 WostPpgxQ1SIY0NKnk7Y8CIo40M1/EDHuCHElnAFB+luV8S0nbUUG6E17OeyPx+Ev5iv
 1lGqjCUcO4cri7RryZWRe6igSgjxa349nhQV14J6iWdRfW/pffhiY4MY0v67KGCsOyqj
 lEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w1qoMbDr+sdyPtmsxdT5TLHlTpk2WPuA7Fji3juVDGY=;
 b=KHxh9VEEOJmijD2Yo7O1Iw9H7+LRX0W8RMDnv5ZFqibIth7nEJnZYkovrc05qTCUyg
 WQwfLUuDVEwEM0i9xiTJ5auzOUEFpLP1V4WToFDq8DeE9osDdqTol0gEn4Zh+jVGPC1D
 QuqvdG3veNqROOnRhmVBzoffGu4IpxYLfbwDemIII8c91N0s3CJmv17d2pvty8YeNMu8
 r1fPN1P+KlcVdYWZ18bf9yaubweao0NPlCD55APnB7H8nCSSSChdREh48zHwhzdRMcB3
 Rdg5QyYGBwY0+WLrp40/XgSptWF6Pzl/zE5iVPO2HPHQ8zd/drjcQ7s/MMwtlSKl8yjk
 5iWw==
X-Gm-Message-State: AOAM533rpXSfB4EvslZJB/fwl9VeUUhQqtzYv2Rm5PPMU5jRp7n5HxQi
 /7r+SmVZ0BCqsRD0u9g5pEnPKczsCoA=
X-Google-Smtp-Source: ABdhPJzKTuvBrs2ROgz4rSSsm05aYxe+RIuBC8ieDC6fCPhy4zeo+9DgWVbx3lhI5+zPK9XyHwiTHg==
X-Received: by 2002:a17:902:8bc4:b029:12b:8470:e29e with SMTP id
 r4-20020a1709028bc4b029012b8470e29emr49328890plo.2.1636084252637; 
 Thu, 04 Nov 2021 20:50:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 q9sm6496222pfj.88.2021.11.04.20.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:50:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc: select CPUMASK_OFFSTACK if NR_CPUS >= 8192
Date: Fri,  5 Nov 2021 13:50:42 +1000
Message-Id: <20211105035042.1398309-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211105035042.1398309-1-npiggin@gmail.com>
References: <20211105035042.1398309-1-npiggin@gmail.com>
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

Some core kernel code starts to go beyond the 2048 byte stack size
warning at NR_CPUS=8192, so select CPUMASK_OFFSTACK in that case.
x86 does similarly for very large NR_CPUS.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ba5b66189358..b8f6185d3998 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -163,6 +163,7 @@ config PPC
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
+	select CPUMASK_OFFSTACK			if NR_CPUS >= 8192
 	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
 	select DMA_OPS_BYPASS			if PPC64
 	select DMA_OPS				if PPC64
-- 
2.23.0

