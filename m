Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A092A4D19A4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:52:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcGR1Hdvz3byH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:52:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lzU2OvmU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lzU2OvmU; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDR33y9z30G0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:03 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id w4so6740967ply.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GRRJKXwWejMGknJKmtYz7Ykt2Hg5PpTL/7C96be1WX0=;
 b=lzU2OvmUjLcz/d/0N30727HNXObkDMZef3rNQHLHF/lx5Xie3K6TN74h1bGaH4H+Z9
 zW+LtW2PB2L61SxpcZxtil6sObXGYKfC48MRLHbIebkCVCRkuhBarakj4/M1kZXbHF9k
 Z+Ee9Z5vcIcSY6fCcrS2bO1Z49Ku2ZssfuD36NubB1UlvDyAA9i1Rgu5gFSjVMGUnyAp
 Tiu0uzncrBXcQ+UeMbWl2aNVXt0peXwTqiMpzkuZ4mg+xqor8W7u0tnuVgzsRehZP5Ui
 cEB1yjb6BCkMoclCJ4DIzgeowTtvH7DB9/ABQkspibz6eDSTG/7yw4N3fqZHY0893rQo
 7xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GRRJKXwWejMGknJKmtYz7Ykt2Hg5PpTL/7C96be1WX0=;
 b=UyQCql3yJ1luQ6gaQJXSvMWpT3OCUzQM3kwc8kFgwFqjDj53MqSAM4zlt7Yb2OOzn1
 AkR81ew23xD2iPAZI69ddUCnLzs1LdLdnGTTijurjzfnvNnKcSs1nAHwPJFJ8PL9o9JY
 o0lvh5j83ArDptCfDiOFGxQv2/+iTS1Xin9RTOB+xqOCVss+bIJqVYwr/NMBp4oKtSWW
 0bj5Rqf7hzpnetK5uXYpwq70KJdMX46QbV7K3syIUdxdCHLpXraLcLD/esl6iuee86eT
 zoeXvc9Ok/z4kSrePjOAZ5FtVdk4caYe1fOG/HS163g/t+ij423+rCjCN4L2uxj2H2l/
 JR1Q==
X-Gm-Message-State: AOAM532TYeeS2T4dn3b79WAaIA1XPkKNsPTWIMjE3zcCz6tdsqO+tdz6
 v9pGhbgXi5ynv8gjVkY88OyjZRYQu2M=
X-Google-Smtp-Source: ABdhPJxHjfQrpW2/nlix1yfTAWYm8Hs1YtbbJw39E6xvoCpPskFO4SaV+ko1s2HrtpXN4auQ3mRS1w==
X-Received: by 2002:a17:902:e849:b0:152:ed30:fa76 with SMTP id
 t9-20020a170902e84900b00152ed30fa76mr60380plg.161.1646747461994; 
 Tue, 08 Mar 2022 05:51:01 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/14] powerpc/rtas: Make enter_rtas a nokprobe symbol on
 64-bit
Date: Tue,  8 Mar 2022 23:50:35 +1000
Message-Id: <20220308135047.478297-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This symbol is marked nokprobe on 32-bit but not 64-bit, add it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas_entry.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
index 192fea342744..afe3b789bc36 100644
--- a/arch/powerpc/kernel/rtas_entry.S
+++ b/arch/powerpc/kernel/rtas_entry.S
@@ -165,6 +165,7 @@ rtas_return_loc:
 	mtspr	SPRN_SRR1,r4
 	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
+_ASM_NOKPROBE_SYMBOL(enter_rtas)
 _ASM_NOKPROBE_SYMBOL(__enter_rtas)
 _ASM_NOKPROBE_SYMBOL(rtas_return_loc)
 
-- 
2.23.0

