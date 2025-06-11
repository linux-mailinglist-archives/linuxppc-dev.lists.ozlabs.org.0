Return-Path: <linuxppc-dev+bounces-9284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C4AD50C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 12:03:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHLpL10sRz30Bd;
	Wed, 11 Jun 2025 20:03:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749636218;
	cv=none; b=ZKUcgdlDECFjd7F5f8RtbBxXnQ5zBsnz3EzrjgMhz9PzCfrDQlHGgAGna06EBix0h0M+RnmGKiv9iHN2OqRl2EqW8RfJqxDLf8rGIEUs8WWzSKx1YpIxOZnkiTkRzzIPqf4w18WpLhldhyjhwjExd8oP5T8ALe+YLEBMNDyZnq284eZWsh5dmg3Mg2HVtlT9UiGvlNVh+/xuy3RAnnXDSk5dlsODR4OB0NBZ1gHOUPxtEUShFRLicsXxPkUHhUhe2/OYAtdgmmkUlQLwUq5YhGwPEmCK6tPFLfRsT/ADFhLrqWPGmLPNTFNxn0TmgcjV3kw5aoKlE7SGHkmBzRdqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749636218; c=relaxed/relaxed;
	bh=ulOCkKaAQNTc+WdmUJul/A4wpjCEKAjEIzqw/O8NNpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enDKH6S7NE52eQuEAE1HPOv+wOQ56b6Fw4AT5udPU/7JCuZAfAT1z2n6bL8xgRaVwrw0QGppLGJJukfyDZeWRwxEpRtqkRopiVGxeOTr4vW5rYD3WFbspHDyZrA+GduiB9hm1F+dyUgPRyK1kUOs+7eEfBxY3AbHiLDxeZIIIrxDFZuSEgP285rXQ2sUk+BxL0q23oIKa6VLaN0eJzjTUf/3ybSvMz3XJTXHqwRqFIy7t2yRqGWeZWDZ1Id7oELVXazOa8VYg2Jqb19wMEc0RhEhz90tY0/l0cy1EYO948ZwQrV0YFEr23u+6ow4UP98OQpYXOAJsir8RewgfRHMRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q/uBsIAO; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q/uBsIAO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHLpK4Fmdz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 20:03:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0830949E8A;
	Wed, 11 Jun 2025 10:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC70EC4CEF2;
	Wed, 11 Jun 2025 10:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749636215;
	bh=xpdDYrvECMUpAFvfX9wlypgtkzObQJ4+g7Id2+pjsRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q/uBsIAOyPBot3EUTqSSUaJTbkIUqq3Tv1y31ih14lKsxANAk2Dg2UX8StEuqONUK
	 +AX7H5qsHobFYOtAAYp6ZB3dnuaWUyxC9bStGISrVs0LS1eVyxHXKjn4JrVEOj5xfA
	 P5pG7dQfyc22j8OMseUj5QlZpZS5vTLVi90ZIkzZrolUpJWVtWDIILnnwkKa+0kBP7
	 rOjxmVTriix+ZE5zKM/rtJf7C49KOOlxqc9LZj90uxuwjUL2CfnzSIW57kD+lw7G5Q
	 0/47f36oj9kPpZuC2Ghl+ZdlbaKM2UsMXbtcpR1oHOu9yX8iaVUZnFlMe8xdP6c725
	 FZr3MowarnW9Q==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/33] powerpc/powermac: remove unneeded tty includes
Date: Wed, 11 Jun 2025 12:02:51 +0200
Message-ID: <20250611100319.186924-6-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611100319.186924-1-jirislaby@kernel.org>
References: <20250611100319.186924-1-jirislaby@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All these includes must have been cut & pasted. The code does not use
any tty or vt functionality at all.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/powermac/setup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index e119ced05d10..eb092f293113 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -28,13 +28,11 @@
 #include <linux/ptrace.h>
 #include <linux/export.h>
 #include <linux/user.h>
-#include <linux/tty.h>
 #include <linux/string.h>
 #include <linux/delay.h>
 #include <linux/ioport.h>
 #include <linux/major.h>
 #include <linux/initrd.h>
-#include <linux/vt_kern.h>
 #include <linux/console.h>
 #include <linux/pci.h>
 #include <linux/adb.h>
-- 
2.49.0


