Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95E5F69A8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:34:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjv904k04z3drM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:34:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R7Hx+Vjd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R7Hx+Vjd;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjv833s2tz2x9d
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:33:55 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id o9-20020a17090a0a0900b0020ad4e758b3so1897798pjo.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=D36QnAorX5F0WZWMDv2ifBUTUJIjBEssXkOt3WXl0tA=;
        b=R7Hx+VjdA4tMBY5qVupEZHoSOBlIbsGxw3yK6UDPGjUPeZWh+UmhDq58GxeDWbpWQr
         PLhqF09t8+nQ25PoiLyVgziQPQJ8BEP6nmiiW47k3Ho2uETcmJd8MLABHusocMdF+ccL
         Nw6sBOWgbq5owlAnZ6MQk+2FjHQhUZCh7fk3OvwMSUdlFEsDxDV1cfuPBM6Nip5Vex6Z
         3uATDRheNiPXI6k7SH0ttq8OGShhFU570Aq/Sya0xKJ857NlEcEKuG5eHyUdr33lZUM/
         5ogxnl/y3+nLCN094lB2PDCOI2k5D/yaXXMYlo4RumqeICyiEjt6KhfWSZNaHpzjlde9
         D14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=D36QnAorX5F0WZWMDv2ifBUTUJIjBEssXkOt3WXl0tA=;
        b=42fuODcL2is0mEXdF6J76OxTO4JVAH9iyOSJc7EetSlGQfRyt3sAa0jutnTgAIq/hI
         En4vV2ndkeimBB8eqZVtCT6ohTatoPyId/BhaZloEyancL1vMTRf08d1sj/95wskR7uo
         p+uZ+MTwzdZlEUIZMlkp1tRuiHhIrQ+6PO56pnk4PHdQf76LaUhno7hkkHByxlKvw+WV
         bhotGN5+BESdRLpUT46IehVnksSv39Jw0Ud9TYLXGuX4m3QjDumA7Mmyqe4hm5xCp/QW
         799XyYsoqqCRgOpJZERxgQkrIBB9SRQmvIdmuzlVxUheofMvkI+vT/30DyQNG3iFDWpA
         xHvA==
X-Gm-Message-State: ACrzQf0FkbVfZ1yfoJkjopfEEtzY7edK5xy1xNEyRPLHls+uLxAKKYNq
	tV10J1OdpvC0oe2vwz5dr04qH0aI/kQ=
X-Google-Smtp-Source: AMsMyM5Q507V/T8QVthHGc4zNSf0eEQ74v6T4KQTwfVz9B7jUwFPRc0ZJXL4EzyFeEhQy+wcZy70pA==
X-Received: by 2002:a17:902:7c91:b0:17f:6711:1fac with SMTP id y17-20020a1709027c9100b0017f67111facmr228042pll.118.1665066832071;
        Thu, 06 Oct 2022 07:33:52 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id w8-20020a170902e88800b0017f93a4e330sm1477097plg.193.2022.10.06.07.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:33:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S HV: Fix stack frame regs marker
Date: Fri,  7 Oct 2022 00:33:45 +1000
Message-Id: <20221006143345.129077-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hard-coded marker is out of date now, fix it using the nice define.

Fixes: 17773afdcd15 ("powerpc/64: use 32-bit immediate for STACK_FRAME_REGS_MARKER")
Reported-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index c984021e62c8..37f50861dd98 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -2728,7 +2728,7 @@ kvmppc_bad_host_intr:
 	std	r5, _XER(r1)
 	std	r6, SOFTE(r1)
 	LOAD_PACA_TOC()
-	LOAD_REG_IMMEDIATE(3, 0x7265677368657265)
+	LOAD_REG_IMMEDIATE(3, STACK_FRAME_REGS_MARKER)
 	std	r3, STACK_FRAME_OVERHEAD-16(r1)
 
 	/*
-- 
2.37.2

