Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE6644A5B5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 05:14:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpF4S1Km4z3clm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 15:14:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U7/JfyAq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=U7/JfyAq; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpF0v5Nhxz2ywT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 15:11:43 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id k4so18550173plx.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 20:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aQc0DqPPO6kMsrpf1a2eMeG1Oqju7se8HtSuYmathZ0=;
 b=U7/JfyAqiO2MKMCYeQeqbbijFBcQVa5T0EkptTY/YLTW8QWwlexKfEOnJ2omEegvxB
 uF1/wE3YW1h247SpMruInOTDxwNMEHNxRUM8ZwHj2wTdxRKoG/gi5vhVbwzr4AR5BUIA
 TYAJHzhWN5PU5gktO9OyGWzMn74UepthW2QsG30UPTkL3g+BF53XW2m/LIEqD2I96WAW
 xgbt/dMqW6IQ8BU/BqiZ4glQm3cFt7qyiLtWRvORZ3DXfSaifWFIfeBi23oSWLSqgIHe
 e6abn8XTCHj+m4MpBFH2mmclMDomCC25gGe8Vrd/npO31J7O4U9IUPbRVWrbsuGbRQU0
 t+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQc0DqPPO6kMsrpf1a2eMeG1Oqju7se8HtSuYmathZ0=;
 b=t/4Bj9Gf7JqgfU9RIsXvoHJSYlRqKAr7ch0jl9ej6QDt5f8/54lJgAXxtQ0KkRN5mn
 +zfsLR5uA/0az+onYh2XHiYzKpIFjCwy0jDNbl0Gdh7BMW5sIZLEzJx+LSrhG5FVHdvZ
 Q0MYRn5xUgpvfyqUXlLocsQx7t6R+824/LNzYN8Sqhod3RFi/e1v0Xhf4G/KXim5pXc6
 NvwN5oPJ+mgtYxMy3mUJPOauPZKujC1SfyZan3htDyjFDacd1DAg26USWcxCR38+nnzS
 bvyseezRKlJhcE8ZlkoSElW3hPU07/uKrfw5hJDBMIbUit47H5Go4s49gAdKpFE3BZsN
 Uo1A==
X-Gm-Message-State: AOAM531on9vS3ZOlcUk63h69Q+Kki5l21HF8Zuuq/ZArdMEzGmU3ics4
 r9gR1X/jjJJLsNACL9Zqmcw=
X-Google-Smtp-Source: ABdhPJw5RAMBfn9DIjw2V4w3ZE2Oc2Ma5DmxWxSIog1/aLYNvg78RdgoN/I55DMnJioBaGhBoQdvSg==
X-Received: by 2002:a17:90a:b382:: with SMTP id
 e2mr3827572pjr.119.1636431101310; 
 Mon, 08 Nov 2021 20:11:41 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 o19sm18278063pfu.56.2021.11.08.20.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 20:11:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 4/4] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
Date: Tue,  9 Nov 2021 14:11:19 +1000
Message-Id: <20211109041119.1972927-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211109041119.1972927-1-npiggin@gmail.com>
References: <20211109041119.1972927-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a 16-socket 192-core POWER8 system, a context switching benchmark
with as many software threads as CPUs (so each switch will go in and
out of idle), upstream can achieve a rate of about 1 million context
switches per second, due to contention on the mm refcount.

powerpc/64s meets the prerequisites for CONFIG_MMU_LAZY_TLB_SHOOTDOWN,
so enable the option. This increases the above benchmark to 118 million.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ba5b66189358..8a584414ef67 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -249,6 +249,7 @@ config PPC
 	select IRQ_FORCED_THREADING
 	select MMU_GATHER_PAGE_SIZE
 	select MMU_GATHER_RCU_TABLE_FREE
+	select MMU_LAZY_TLB_SHOOTDOWN		if PPC_BOOK3S_64
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE		if PPC64 || NOT_COHERENT_CACHE
 	select NEED_SG_DMA_LENGTH
-- 
2.23.0

