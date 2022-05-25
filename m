Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F17533548
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 04:24:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7FJW2pFwz3c28
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 12:24:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X5t1Y6WK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=X5t1Y6WK; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7FHv0H4Fz300K
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 12:24:08 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id p8so18003323pfh.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 19:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lutp+DXK3CY+B1E0qLMzPjRyUjLMJ0wzHsG367bcYaw=;
 b=X5t1Y6WKVdqmdzdcWx/CBp5aQhr81UeJmxJ6/Tp5A/Mzf04fE37lhBwym4G5giLQbB
 NseVgdaDXGrroCoJp7f15AqHO9rrE7KBi93Ied5Rifx3MoIGYg2s20qnQlIPEa+2SgNx
 xm/Urzjm08lwroyFuLqJmw+rNdoXMerF8t9KmZHi8A4IeHgcZP/PGGqwiuPP2smtKNmV
 ML4u79zLZj/wAfr38zsBsJb7OY8ADauOQDjwBLhSbUbBOV9qpqXY9RUrcs6hsdjwdO1y
 E2iP+l1FlAFR9ExmMeTFKfGBytM5whqtUN6pUiClGdMRwkHxQd/RpCe6Lu5a11aB0etc
 +zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lutp+DXK3CY+B1E0qLMzPjRyUjLMJ0wzHsG367bcYaw=;
 b=OEMv4PcEBEqK17L8lpC7BtIiEKGbkRmyZKuTUEckqODsZsXuBJTx+v+21r8Myk2rQt
 Ocl/5eIXbqjDWtkDG/Q06u4nxt5SX3YCmYMT+5qZVdEbVJI2MqAmTW3gJG6DovcHyRz6
 uiAMk4VMtPXOO6lhG4wvUNxKrAMX5P9zCfjgJ7MZTzjnzWfGPy4J/pTxVjBvFTQsA6Yg
 6iP9eu8Dl4JUxgUOpXOj6X+vN9aeyPVPbXyWxN1LqxHR/lUHW0RfvgGRSH2DUYABw8iz
 mIcQel8QQHYY3YlipvyxgISBWOVKloPCz1xvmEhFtq1kUvJ5DSixccNqZpcRqpbOL3bH
 hjXg==
X-Gm-Message-State: AOAM530hvsAxkZaKNLqy2Daj8y1Z6JSDff+q2LpP9n5kUeBVlxbseLxq
 ScdCDFjwVq9+UNolqUVhG8MJdoJ6mfo=
X-Google-Smtp-Source: ABdhPJxZZpL9SE5UabtRRLGAhWNA6GKf/iik5ZG7vQ9vF2XiYTg5f6pvwHByM6VuSlRYy5NrHW928w==
X-Received: by 2002:a65:6c12:0:b0:3db:a518:ff1b with SMTP id
 y18-20020a656c12000000b003dba518ff1bmr26051828pgu.315.1653445445845; 
 Tue, 24 May 2022 19:24:05 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.209.250.103])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1709028a9300b00161a9df4de8sm7884617plo.145.2022.05.24.19.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 19:24:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] powerpc/64s: Restrict NMMU workarounds
Date: Wed, 25 May 2022 12:23:55 +1000
Message-Id: <20220525022358.780745-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER10 doesn't require the two Nest MMU workarounds according to the
workbook. Also remove the last vestige of the spurious fault flushing
for NMMU which shouldn't have been required anyway.

Thanks,
Nick

Nicholas Piggin (3):
  powerpc/64s: POWER10 nest MMU does not require flush escalation
    workaround
  powerpc/64s: POWER10 nest MMU can upgrade PTE access authority without
    TLB flush
  powerpc/64s: Remove spurious fault flushing for NMMU

 arch/powerpc/include/asm/book3s/64/tlbflush.h | 28 +++++++++++++--
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  | 10 +++---
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 35 ++++++++++++-------
 arch/powerpc/mm/book3s64/radix_tlb.c          | 14 ++++++--
 4 files changed, 64 insertions(+), 23 deletions(-)

-- 
2.35.1

