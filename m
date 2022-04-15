Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE9502F24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 21:11:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kg5Y96vkrz3cfc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 05:11:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RzXW0JUf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RzXW0JUf; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kg5TQ44Vtz3bZq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 05:08:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDADE61AD1;
 Fri, 15 Apr 2022 19:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA50C385A5;
 Fri, 15 Apr 2022 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650049720;
 bh=QNhkR5f2VwsmRJLjyIIeuyQ3Ro0/ZTlpiHVGueu8khw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RzXW0JUf3FmmvjCkNLPg6xeSiQ00FCdgqtRjSiv750sCreQXBhr+haJGO3gaKecxK
 Ut63sQ0/8xIkmtE1di1uclIYjE3djP8GM/NAZvEmiQ50vNroamDnR8EJhVyHC90mAX
 DCjvBvyeNWljHEVX3CqMYuSlRG8rajCE4XkjMSePx9n1RQV1NZMCyYIazZvPVRo+0I
 GHgXCH+MAp6nGOF2EU4Ezu3OBddS8QZSxKM+2+OKfJ2EOMkezjpNIdTE3XnvMI4AIT
 BkT+aUHhioeRJQGiWGOXv1o/Fi2wCjLqpTFlNLS+zZ+1bOC9ECLuRExRrZ8wlP2c6J
 beDpycOtgITAA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Chas Williams <3chas3@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH 5/7] powerpc: Remove unused SLOW_DOWN_IO definition
Date: Fri, 15 Apr 2022 14:08:15 -0500
Message-Id: <20220415190817.842864-6-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415190817.842864-1-helgaas@kernel.org>
References: <20220415190817.842864-1-helgaas@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Remove unused SLOW_DOWN_IO definition.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 arch/powerpc/include/asm/io.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index fee979d3a1aa..c5a5f7c9b231 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -38,8 +38,6 @@ extern struct pci_dev *isa_bridge_pcidev;
 #define SIO_CONFIG_RA	0x398
 #define SIO_CONFIG_RD	0x399
 
-#define SLOW_DOWN_IO
-
 /* 32 bits uses slightly different variables for the various IO
  * bases. Most of this file only uses _IO_BASE though which we
  * define properly based on the platform
-- 
2.25.1

