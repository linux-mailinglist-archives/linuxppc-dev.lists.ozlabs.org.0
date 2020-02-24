Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E87B816B5CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 00:39:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RJS0716PzDqG0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 10:39:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RJHW4Cx5zDq6Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 10:31:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VutxjaFj; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48RJHW3QcKz9sQx; Tue, 25 Feb 2020 10:31:51 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48RJHW2JVVz9sRN; Tue, 25 Feb 2020 10:31:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582587111;
 bh=JzgZyPtOaifXii+bpzYFkorbOTXtLl84vde0igBpI0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VutxjaFjIPCAC+QUqHa7de4fOg3E1IPiTsRhP98+0Mhi3erfRWlnTIyktEYg1pP3I
 dO4jtMOYodRk/ezMNRiyGocluiy1onVaAM/02hQjkuBZmwBttuynzhKQqZ4oAzDsFZ
 EAC9B/iw6rJahhmdaStmAlyv0ghqwcRjRXeNDK1rtS4fkWrYInSEyD3rOT5iA59C6S
 F3hm1OBSckNw04wf+XeEGS3QeQawLYhRVdBx0akLzZ7yacEBOVFEDDh3o7fUNUox3I
 Vm9+eWc0/QsMCf0E/b6Mzw7nSrh/owEbSOeV6XIMuNp9wgMzMrUP2NvXHPLEig1TUb
 zyNr6MQ8Jr6/w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 4/8] powerpc: Mark 4xx as Orphan in MAINTAINERS
Date: Tue, 25 Feb 2020 10:31:42 +1100
Message-Id: <20200224233146.23734-4-mpe@ellerman.id.au>
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
Cc: Alistair Popple <alistair@popple.id.au>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 4xx platforms are no longer maintained.

Cc: Alistair Popple <alistair@popple.id.au>
Cc: Matt Porter <mporter@kernel.crashing.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c4f37c41188..939da2ac08db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9645,11 +9645,8 @@ F:	arch/powerpc/platforms/512x/
 F:	arch/powerpc/platforms/52xx/
 
 LINUX FOR POWERPC EMBEDDED PPC4XX
-M:	Alistair Popple <alistair@popple.id.au>
-M:	Matt Porter <mporter@kernel.crashing.org>
-W:	http://www.penguinppc.org/
 L:	linuxppc-dev@lists.ozlabs.org
-S:	Maintained
+S:	Orphan
 F:	arch/powerpc/platforms/40x/
 F:	arch/powerpc/platforms/44x/
 
-- 
2.21.1

