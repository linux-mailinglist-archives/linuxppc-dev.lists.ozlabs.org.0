Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B9A1A06A2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:41:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGW66dRgzDr2m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:41:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nZopXDEZ; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG0d11sszDqwf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:18:56 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id m15so258756pje.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SHMWd8uDETi2/vN6LtZbQlAB8sad8yzKlsSJQhf9LQ0=;
 b=nZopXDEZUpQeBDkC+oMnum4baCXXtGEabxS4lM43/fJ3b7QFVsdbJYLGBl49uh5H4N
 xonlCuI0eC1LIbFnAqLDSf4INiM86HsiNLRBQegEvX2cvNBsvbLC7hdgBjgUs12omtD4
 Qs4OM43ZVdfPcGXJzhFH2nw67q/KDDfBaSBvb6omsudvfpvHWgw3oKCtOgPdnz8CgW1Y
 Ptro9WlloWxltLiBSmBFFoULoMXV/S8FjcQ9JhRxKKn63iEyClnDV97aF7nKL2jht6Ch
 2XyH8amsw5dP+NNmp5jQK9R8sOm0yte4wF1O4OSpVuYZTSmGTDV6NEO4aMrkfVMx8mll
 hiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHMWd8uDETi2/vN6LtZbQlAB8sad8yzKlsSJQhf9LQ0=;
 b=PXz2CAw46W8snDey+zLWb216PgKTOL2JQSVMW9a5MJp01ZYCKQ2ysHjoXQsGGHfwmm
 VNH3yFbQfAdJUbsukW9F2srVSS/1qSUWdr0Mjx1hx1A36DfN+o4/GCT0l1ujfIj/pTn8
 zPEkA2vPBDMntSO288QcRNZSKuT3tkZtKHHzSw7v7lPfbabn1spLXnx1KJhZ/TYi82SH
 ISwCFf9o6jKrvnb0CUxW0wEfxEHbUPe7MG2srv5hRqEzF5hlNkLPspoR7qEupILjr3Ri
 MfySoS6eNPNUTMfLjmCPnSSy7uz+7FaTAtr8jbjSVtC2EzQV2xBe6ga8u4uz2EZ8GlFL
 fKXw==
X-Gm-Message-State: AGi0PuaaBEXkNPSnQAFxZqUVSYwECY3aP0I2/rqU00X+We7wGDxuQnEL
 x9c2Z35ftwm/WjGNVJs/MlWc6haH
X-Google-Smtp-Source: APiQypLDRgQYS3vLdXnF/kujT4TLu4v5Rr9NKUxgkDrVI9UJcoOONJcS6ycwK/k67kmxPh8jiKGa+Q==
X-Received: by 2002:a17:90b:8e:: with SMTP id bb14mr661233pjb.13.1586236733333; 
 Mon, 06 Apr 2020 22:18:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 12/15] powerpc: ftrace_enabled helper
Date: Tue,  7 Apr 2020 15:16:33 +1000
Message-Id: <20200407051636.648369-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200407051636.648369-1-npiggin@gmail.com>
References: <20200407051636.648369-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ftrace.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index f54a08a2cd70..bc76970b6ee5 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -108,9 +108,23 @@ static inline void this_cpu_enable_ftrace(void)
 {
 	get_paca()->ftrace_enabled = 1;
 }
+
+/* Disable ftrace on this CPU if possible (may not be implemented) */
+static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled)
+{
+	get_paca()->ftrace_enabled = ftrace_enabled;
+}
+
+static inline u8 this_cpu_get_ftrace_enabled(void)
+{
+	return get_paca()->ftrace_enabled;
+}
+
 #else /* CONFIG_PPC64 */
 static inline void this_cpu_disable_ftrace(void) { }
 static inline void this_cpu_enable_ftrace(void) { }
+static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled) { }
+static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
 #endif /* CONFIG_PPC64 */
 #endif /* !__ASSEMBLY__ */
 
-- 
2.23.0

