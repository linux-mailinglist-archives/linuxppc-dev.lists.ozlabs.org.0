Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19110310A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:16:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HlCG0brDzDqhR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:16:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Hl9G3DpNzDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:14:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="TK4FU2ZS"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47Hl9F2wtsz9s4Y; Wed, 20 Nov 2019 12:14:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47Hl9F1zQwz9sPW; Wed, 20 Nov 2019 12:14:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1574212497;
 bh=LsELJmCEH+NKbFlJOW2HIaU1dLS5CTN3LAfLHJrRp2M=;
 h=From:To:Cc:Subject:Date:From;
 b=TK4FU2ZS28s8JR8kdTv+V/MJZt0OSyR8/XkbK0R5J1TCOCNnr8lJPdR4YSt48b2qt
 yd9HSQTeVgwf7vwN4LcDTrPIE3l0jMjaGbi0hYk9yMFXpVvxjH83WjEIwsC+mU/Hsm
 r9WsuHLCP/BDVy6PpS3dr4XIXc2+TSSuDK48hxwiXBq9ucB+b7FgMGBtMCoP/keChM
 bh9KTgf/2eYbZLoHnrD0z3MYLYWCdSDEehl+WM1mbdrBCoJpbxUx/FRDMg7sizXqAb
 v9Dgr5BznEMQ9x0HYraW+Y5Ow2a8Qp1F8R8A5kQp6wgkSdD7d62ivv6Bom14nDRghM
 2Ek0HwtDxMTAw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: netdev@vger.kernel.org
Subject: [PATCH v2] powerpc: Add const qual to local_read() parameter
Date: Wed, 20 Nov 2019 12:14:51 +1100
Message-Id: <20191120011451.28168-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
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
Cc: linuxppc-dev@ozlabs.org, sfr@canb.auug.org.au, edumazet@google.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Eric Dumazet <edumazet@google.com>

A patch in net-next triggered a compile error on powerpc:

  include/linux/u64_stats_sync.h: In function 'u64_stats_read':
  include/asm-generic/local64.h:30:37: warning: passing argument 1 of 'local_read' discards 'const' qualifier from pointer target type

This seems reasonable to relax powerpc local_read() requirements.

Fixes: 316580b69d0a ("u64_stats: provide u64_stats_t type")
Signed-off-by: Eric Dumazet <edumazet@google.com>
Reported-by: kbuild test robot <lkp@intel.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/local.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2: mpe: Update change log with compiler warning, resend to netdev so it appears
in the netdev patchwork.

Dave can you take this in the net tree so the window of the breakage is as small
as possible please?

diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
index fdd00939270b..bc4bd19b7fc2 100644
--- a/arch/powerpc/include/asm/local.h
+++ b/arch/powerpc/include/asm/local.h
@@ -17,7 +17,7 @@ typedef struct
 
 #define LOCAL_INIT(i)	{ (i) }
 
-static __inline__ long local_read(local_t *l)
+static __inline__ long local_read(const local_t *l)
 {
 	return READ_ONCE(l->v);
 }
-- 
2.21.0

