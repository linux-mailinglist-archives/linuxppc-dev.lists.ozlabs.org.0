Return-Path: <linuxppc-dev+bounces-3078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B99C33CD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2024 17:23:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmdJg3PwSz2xxx;
	Mon, 11 Nov 2024 03:23:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.170
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731255794;
	cv=none; b=IccOGdEucepw9dL71g0ptKOC9LXIoWsmsym5NsbMzy7Loj1oMIVhagqPITOC9jm8MePqHZbI5z59zAKlLmnbTrOoqw3adob1Xm+MhH2qxDnINkW1ME/EEmrV58aHeA2xuPhKj6SLg02UwhVtDaMLmoBSCp7J8REsMbg7O1GBGicVEp2eAawi8EUCX0wZ2G1xVBsOIrMz6+UFV86Dfv2VlIS6W9QbhZiDvmaXbp0++Kaqp0t4L09FZ6XGESBQBN7vFj8cJJxyAWiIZcr6qZu8/gmpzJZcnoYjEdwvkG4HnkrbFNKB3T1j7v7EBWIMb743HMUhA5X0BTnBcMFXxeiQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731255794; c=relaxed/relaxed;
	bh=UqFBbtKCvn2uiiJOd1o/KjH4nUtT3WyJ3xfVwaTrNto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wxk6PjlcU4DlzyAOBJZAidm7N8++xrVIe2JWS9vupgRivSCbJREhuhKJjGYmTyckQ5XT0xYuV8rcRXvJo9xdNsOUwDCJ+9BvW2NbsanOMQ1kBcxC5Gj/kgS8DgEotX0VNiMRUAiwhFdMkf55vy5FD0H5e/G0iEMdw4sL49DgE191lkfci+ROpyL6DyeJFru/2IK9dBegPioezbs07bwBW0pKMX95G2+qCthrnc4lGbTq8uqZqOHF5a6EGRH36Ajh4/KLneeI+tDCJJV5eFC50jnIUjEK03JHiMSALIU937dmQ4PJzA+EJJnQtjMFUz1w4VYHcBwm404Q7X6gLtteRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UqEvglzF; dkim-atps=neutral; spf=pass (client-ip=95.215.58.170; helo=out-170.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UqEvglzF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.170; helo=out-170.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XmdJW4RPyz2xgM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 03:23:05 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731255764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UqFBbtKCvn2uiiJOd1o/KjH4nUtT3WyJ3xfVwaTrNto=;
	b=UqEvglzFeNOhDzYxajvvlX0CDxH15EInV3wh39Dr57bxgbCcRLfzaF8qGFKCZNcoHn+gUI
	mAxVDFiTTPDGDS5LqLvOjKyAOiHd/Lp3KCuEtxEC+4RTivVsd0u3uCkmwSiNdJK6w6Xyse
	M4ZDObUYf/2Vd0uab8AM6ptY/ZbFvzU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Transliterate author name and remove FIXME
Date: Sun, 10 Nov 2024 17:21:37 +0100
Message-ID: <20241110162139.5179-2-thorsten.blum@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The name is Mimi Phuong-Thao Vo.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/boot/rs6000.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/boot/rs6000.h b/arch/powerpc/boot/rs6000.h
index a9d879155ef9..16df8f3c43f1 100644
--- a/arch/powerpc/boot/rs6000.h
+++ b/arch/powerpc/boot/rs6000.h
@@ -1,11 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* IBM RS/6000 "XCOFF" file definitions for BFD.
    Copyright (C) 1990, 1991 Free Software Foundation, Inc.
-   FIXME: Can someone provide a transliteration of this name into ASCII?
-   Using the following chars caused a compiler warning on HIUX (so I replaced
-   them with octal escapes), and isn't useful without an understanding of what
-   character set it is.
-   Written by Mimi Ph\373\364ng-Th\345o V\365 of IBM
+   Written by Mimi Phuong-Thao Vo of IBM
    and John Gilmore of Cygnus Support.  */
 
 /********************** FILE HEADER **********************/
-- 
2.47.0


