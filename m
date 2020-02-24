Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DCB16B5E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 00:41:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RJVg2gxQzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 10:41:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RJHY6s0wzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 10:31:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TSLzswJT; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48RJHY3JdDz9sRJ; Tue, 25 Feb 2020 10:31:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48RJHX3jXFz9sRG; Tue, 25 Feb 2020 10:31:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582587112;
 bh=njTLi7D5ip7n3f03+M5bR2JYHfPVMZZ1e3nNXFT2Clg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TSLzswJTlkFp3AllxzJXzByQVXuFj0PSpuq0gzkClTXPsZFbmhhdwicQWtFtbyDzk
 kAQs+o2OMCOj9RYOyvfNEO5mgUXz8LZ+HlJ94wvJLFYZQKxFoxuGHDLCwLwy1rB/H4
 D3hIop/r6BJx0im8ft/ZoJS9cyICkAmQv4oMLYX5G+a7X9+O4uXHOfsEkSY2+9whqm
 Ppt5oBOiGhToEzTTIW4m1ntbYHadpVWEjCyzBfYoUr4Js+4mT7ciSOnIc6U/y8VILB
 YATymtBYz7dyW9kSR+i3OC1CgX3PpKeIfH5Nh1DGgBCsudmPudBncsk/9EejcVP4jZ
 sTQ7YtSi0M8nA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 5/8] powerpc: Drop XILINX MAINTAINERS entry
Date: Tue, 25 Feb 2020 10:31:43 +1100
Message-Id: <20200224233146.23734-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200224233146.23734-1-mpe@ellerman.id.au>
References: <20200224233146.23734-1-mpe@ellerman.id.au>
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
Cc: Grant Likely <grant.likely@arm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This has been orphaned for ~7 years, remove it.

Cc: Grant Likely <grant.likely@arm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 939da2ac08db..d5db5cac5a39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9668,12 +9668,6 @@ L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	arch/powerpc/platforms/8xx/
 
-LINUX FOR POWERPC EMBEDDED XILINX VIRTEX
-L:	linuxppc-dev@lists.ozlabs.org
-S:	Orphan
-F:	arch/powerpc/*/*virtex*
-F:	arch/powerpc/*/*/*virtex*
-
 LINUX KERNEL DUMP TEST MODULE (LKDTM)
 M:	Kees Cook <keescook@chromium.org>
 S:	Maintained
-- 
2.21.1

