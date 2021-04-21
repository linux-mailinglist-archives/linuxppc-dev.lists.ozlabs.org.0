Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2175366B49
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 14:54:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQL9N63mGz30Gd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 22:54:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=USMpRNM0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=USMpRNM0; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQL906T1qz2y0L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 22:54:12 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQL8y6H0Fz9sj5; Wed, 21 Apr 2021 22:54:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1619009650;
 bh=UNn+k+YHMI77WeDfeohXf8pe8DFCTIt9IK6+gRZP4yA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=USMpRNM0q/89MVXGyLSS0ns2sPQRmntkpmUnuM8oc02AkO/GTaPjlhFZpEKQ0TGwH
 yz0O0cq27FDColT3VDfsiYVo0v1Od/fDu2JiOx6P0/D9o5dLdjsF3RnK96tb3oKglP
 eBkkZcxx6g1Mpc9nGWGmDUfoCBuTAbMcMuBuWgqlJ49WfmXCgkZdptG5ljS46lQHAY
 xxzdENOoVqeDmEVrXZoN0kEPDt8RZNGuzUKdhEbGOh6h+WtXmJTOdJIQXv+snrveUs
 u5LfhG8gGAhZL4TgLgyOrFFVe0WoKs8nLhwg/XdQNnRYutu2q9Uj3cq5ZSW6jmftId
 oYiTl8AUndMlw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/powernv: Fix type of opal_mpipl_query_tag() addr
 argument
Date: Wed, 21 Apr 2021 22:54:02 +1000
Message-Id: <20210421125402.1955013-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210421125402.1955013-1-mpe@ellerman.id.au>
References: <20210421125402.1955013-1-mpe@ellerman.id.au>
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
Cc: hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

opal_mpipl_query_tag() takes a pointer to a 64-bit value, which firmware
writes a value to. As OPAL is traditionally big endian this value will
be big endian.

This can be confirmed by looking at the implementation in skiboot:

  static uint64_t opal_mpipl_query_tag(enum opal_mpipl_tags tag, __be64 *tag_val)
  {
  	...
  	*tag_val = cpu_to_be64(opal_mpipl_tags[tag]);
  	return OPAL_SUCCESS;
  }

Fix the declaration to annotate that the value is big endian.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/opal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 9986ac34b8e2..c76157237e22 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -307,7 +307,7 @@ int opal_secvar_enqueue_update(const char *key, uint64_t key_len, u8 *data,
 
 s64 opal_mpipl_update(enum opal_mpipl_ops op, u64 src, u64 dest, u64 size);
 s64 opal_mpipl_register_tag(enum opal_mpipl_tags tag, u64 addr);
-s64 opal_mpipl_query_tag(enum opal_mpipl_tags tag, u64 *addr);
+s64 opal_mpipl_query_tag(enum opal_mpipl_tags tag, __be64 *addr);
 
 s64 opal_signal_system_reset(s32 cpu);
 s64 opal_quiesce(u64 shutdown_type, s32 cpu);
-- 
2.25.1

