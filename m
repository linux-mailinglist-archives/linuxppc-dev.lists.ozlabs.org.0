Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF0C396D56
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 08:25:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvMbW6jcBz3c81
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 16:25:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TMuuo1b+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TMuuo1b+; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvMYG4Ccgz3014
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 16:23:30 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id 11so2817183plk.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 23:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PZkiKtXqsSUWsFPxoaMD52BWVXcB9txjh0r70N9gfwg=;
 b=TMuuo1b+x5/KjM8834zLhSTP9eYuo7t0tW46rm7j4SnXrgLEDWE0TOlUaFMqu8a+wI
 vbs8XSGlHrRcHcTNztnJ6FzCBPFzIdXlEHvPisjfSNJtPoi22YsCPwpfGpRVCfOzBEyA
 qIpgYtAQFvdrhvVyPuJFVlv69Dqy2++lkPLlvSfYFcFCmgn46h+CL735k7uWPO2iR6ib
 F/kGzqky6oCb6NGOI9e7WIPMpMGVye8FitjlLICcOtIpc9ld3zB5Wx8ELsL60gT36dHI
 97jMnbIhzGPVji0u7wu9KoHMx8MMSH5LNriPf5FvHIo0aVVgBAQXAvYl2+p+Q7UssMwq
 afpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZkiKtXqsSUWsFPxoaMD52BWVXcB9txjh0r70N9gfwg=;
 b=DCqIDqqfmTLEYimHS8v4Jeiy66ABLSzgvZcmhaBmiho+FVpIPvu+O7+A0E1OP6lqLW
 7u8bCtyk4mrvke5SWCgPoafgBCBvHxccRc22E/R+oV9GT+BEd4vGZ4F/8ZpkHiGGo59X
 N4KlCdPshwgXxfXvqG2wz/MhbCs5E7qq2yM721QKIoT1d/SlyQRJiXUtsoi4vfA/JUFS
 MbkoWEeXd4Qg2TcwfLf4J14sPz09bO1b2TAoKiksGyEBGU+j+uhHruc/JhJJ097OUCmx
 cI2UFpb4urTxUbXGVlY5uopXQzSwr1ZvXyLXWUWhgtFMbhA3qwSlHbvq6FXlTyQqJA9H
 BcPQ==
X-Gm-Message-State: AOAM530f7X6qHpzZZmyXvdkts7/drDJdx0inGU8Dz3gsVgnc8zm9Z38z
 7oii/7OXan5gxtoBDdGRRME=
X-Google-Smtp-Source: ABdhPJzO7M0Hh974CEgDAeZuPzkos1it6HgA9FTrTsKtUq98J+3jqEoDd6tOI7VI/NdE9fIIB6URYw==
X-Received: by 2002:a17:90b:1094:: with SMTP id
 gj20mr14135765pjb.45.1622528607822; 
 Mon, 31 May 2021 23:23:27 -0700 (PDT)
Received: from bobo.ibm.com (60-241-69-122.static.tpgi.com.au. [60.241.69.122])
 by smtp.gmail.com with ESMTPSA id h1sm12519100pfh.72.2021.05.31.23.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 23:23:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 4/4] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
Date: Tue,  1 Jun 2021 16:23:03 +1000
Message-Id: <20210601062303.3932513-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210601062303.3932513-1-npiggin@gmail.com>
References: <20210601062303.3932513-1-npiggin@gmail.com>
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
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a 16-socket 192-core POWER8 system, a context switching benchmark
with as many software threads as CPUs (so each switch will go in and
out of idle), upstream can achieve a rate of about 1 million context
switches per second. After this patch it goes up to 118 million.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 088dd2afcfe4..8a092eedc692 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -252,6 +252,7 @@ config PPC
 	select IRQ_FORCED_THREADING
 	select MMU_GATHER_PAGE_SIZE
 	select MMU_GATHER_RCU_TABLE_FREE
+	select MMU_LAZY_TLB_SHOOTDOWN		if PPC_BOOK3S_64
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE		if PPC64 || NOT_COHERENT_CACHE
 	select NEED_SG_DMA_LENGTH
-- 
2.23.0

