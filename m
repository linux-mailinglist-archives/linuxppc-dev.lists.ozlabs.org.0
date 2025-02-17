Return-Path: <linuxppc-dev+bounces-6242-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97766A37A76
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 05:23:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx8f06Qc8z3041;
	Mon, 17 Feb 2025 15:23:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739766184;
	cv=none; b=dNryqUVOFAILAimOAdeJ3LtB9v5n+e2qB3OXcgLf+xGbx7FbfUqxVip1lNK4oqj2eWqQ9I6VNOH1f1WRiaw4bX4YywHn7vy/arWEI6dmza0MpgSXXGhIQRxWTVyRgZJsYyXdBOkVQWKa/o/oTjiF7+17If/FVh3ZHEO4igJMYFcuFYmKE6pC2+gd57O7/abWmyrN1cbYTfKei2sQPS1dputxWkRMsRHDmnBYvbqIym5KgfotFe4NiIC7gHZ3iwZmwqEAD7jZ8q4hcclAk9ZO9aL7ii1rCOxmvXxWiZ4Pfz6d9q9bMeWS9twHCs26IH+iNWgkKbkAvExGanQtXFzsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739766184; c=relaxed/relaxed;
	bh=E214jS2EGCcF3/4nPKRtjJQAG5BCKqN8zuqIaa3wNnU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PoicgDKjwjcyKB7kaPgNd4yhdMjvq6GQEw7Vl50N0mMih8wgpaoN7Q2s/wqVsWiLcueMugjRItVKj2cx8bONmHQs3tkM+b6MIn5Q3cLD7gJh7IwTdchHU6UzTIwQUe5gjmIrmzH+S9qJkw9RjkaV5jyynXgtf32TOpzQmMaPC+Gc1JSX6iSNKRlqrjYUOWRAeiE0XT9gRGsDqqmTBvwuqk5mDeUWPa1uQYq/nOJ4ghkM3pR5A29idRDMLYtRZ+hnN5YQVPfuqkDa1f16JStn8eH6/6WMSXykXkPHLRRQgsjQuR1CigNwDrel07iMuyG2lijzBlMOXeyxcpnb/3XkJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx8f03SJQz2ykx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 15:23:04 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F32D4169E;
	Sun, 16 Feb 2025 20:22:52 -0800 (PST)
Received: from a077893.blr.arm.com (unknown [10.162.16.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A3D693F59E;
	Sun, 16 Feb 2025 20:22:29 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: steven.price@arm.com,
	christophe.leroy@csgroup.eu,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH V2 1/5] configs: Drop GENERIC_PTDUMP from debug.config
Date: Mon, 17 Feb 2025 09:52:16 +0530
Message-Id: <20250217042220.32920-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217042220.32920-1-anshuman.khandual@arm.com>
References: <20250217042220.32920-1-anshuman.khandual@arm.com>
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
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The platforms that support GENERIC_PTDUMP select the config explicitly. But
enabling this feature on platforms that don't really support - does nothing
or might cause a build failure. Hence just drop GENERIC_PTDUMP from generic
debug.config

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 kernel/configs/debug.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
index 20552f163930..8aafd050b754 100644
--- a/kernel/configs/debug.config
+++ b/kernel/configs/debug.config
@@ -73,7 +73,6 @@ CONFIG_DEBUG_VM=y
 CONFIG_DEBUG_VM_PGFLAGS=y
 CONFIG_DEBUG_VM_RB=y
 CONFIG_DEBUG_VM_VMACACHE=y
-CONFIG_GENERIC_PTDUMP=y
 CONFIG_KASAN=y
 CONFIG_KASAN_GENERIC=y
 CONFIG_KASAN_INLINE=y
-- 
2.25.1


