Return-Path: <linuxppc-dev+bounces-3185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 967FC9C8B19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 13:52:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0QS4xrTz307K;
	Thu, 14 Nov 2024 23:51:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731588688;
	cv=none; b=IptiaBI89JvEypOlF15uwJUXJN7dq5Vtr/rNJ8EiSr6GkKh3ksbIOANejAEqXLCjs7Gqfjcg2JNYxhZxVl1z07hI2FzSrixCdMLJHrebKrNPKlQmhMtu1qwHQu0TVVLnFdwVFv0J2IAz+Xo//lfo1V+vS8nAbh90WSSFsSyZKFd88gp6xiM4r2m36epnGpZEyCq2lsn1hVuihTVupRtNbY1yLr4cBtcZU2y4N2oPYTSfrMcD7uT83IyR8zy25TJBBYauUbnnCasVP/Hgo2Jl0e+FH4BqOwAXNudh75fwOjRcCsMacX3dz0XEIkfaV+sZlrQjX1rc6oxnExa0Y0S/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731588688; c=relaxed/relaxed;
	bh=Gwg1Wb/EnhMGpio5VQhUKOeR/ots8hhKw5ERQs6T44M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TFQFhZ/CY/CGMSi8othQ/p1tQM7el8sCnRzqax0TkxQHMiTbVvr1NBYcGrKCip/iHOklVsFzfbX0B5RLqe7PKcES0c1FgA83hZVBITnQuVZxF1aFuHdJF3oSa9EHvoDWS48EAMp89cPZ5M/vRMfJrX9dVP4y9MBtrzsdIV1T9gjhLzKNJdZqwqc6JqbUQKRL8J1e920vw0xSHCxew7LenF94FWe3xsQpuj3QfhIzG38qzI35Z6YbWMAV77lkE50QIk0XU7mmQHqD3GLlvTUkzfwKm4NiC13+Y5j45YfBJ4HptSAJ2s8OqsZ/uNDVjiGOAmeC9Q9MptUkEwrIYDmbyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U4gMUkmn; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U4gMUkmn;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0QP6qKkz302P
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 23:51:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731588683;
	bh=Gwg1Wb/EnhMGpio5VQhUKOeR/ots8hhKw5ERQs6T44M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U4gMUkmn8bsp5hjgPmdr++lAcre3BdiCwuVAgJ+S3q/ZShxj/RfJUKdIkChqfWd29
	 1CDqf46JkPSFcFiNSEzukkPWjbDvVgqV9WLIZLyyWlsjOxzTI0fOauY+qzrEFFEwu4
	 QKyMaO38269Ax7Db1745w+v2umhVi6HoQV2JuLB4pI/8/dctlcMKjRa9Y+0vfQvmpf
	 b9+ZkO5pSsAsy2x+gvUswBNwY3oTMj1MPq0wd+GD/YsUMUrX9am3NKNkWvoRI6UQ16
	 JiYPV+BO4V65uwoO22IVA3EfUIdvomx7KYK6yEAoBxGEVLaerKlLAfWMUmThi9burO
	 Kao0KpwdMcB2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0QM0n5Dz4xTM;
	Thu, 14 Nov 2024 23:51:23 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<jk@ozlabs.org>,
	<arnd@arndb.de>,
	<geoff@infradead.org>
Subject: [RFC PATCH 13/20] powerpc/io: Remove unnecessary indirection
Date: Thu, 14 Nov 2024 23:51:02 +1100
Message-ID: <20241114125111.599093-13-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Some of the __do_xxx() defines do nothing useful, they just existed to
make the previous hooking macros work. So remove them.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/io.h | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index faf868715eb5..fd7fe78be86f 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -505,13 +505,6 @@ __do_out_asm(_rec_outl, "stwbrx")
  * possible to hook directly at the toplevel PIO operation if they have to
  * be handled differently
  */
-#define __do_writeb(val, addr)	out_8(addr, val)
-#define __do_writew(val, addr)	out_le16(addr, val)
-#define __do_writel(val, addr)	out_le32(addr, val)
-#define __do_writeq(val, addr)	out_le64(addr, val)
-#define __do_writew_be(val, addr) out_be16(addr, val)
-#define __do_writel_be(val, addr) out_be32(addr, val)
-#define __do_writeq_be(val, addr) out_be64(addr, val)
 
 #ifdef CONFIG_EEH
 #define __do_readb(addr)	eeh_readb(addr)
@@ -607,27 +600,27 @@ static inline u32 readl_be(const PCI_IO_ADDR addr)
 
 static inline void writeb(u8 val, PCI_IO_ADDR addr)
 {
-	__do_writeb(val, addr);
+	out_8(addr, val);
 }
 
 static inline void writew(u16 val, PCI_IO_ADDR addr)
 {
-	__do_writew(val, addr);
+	out_le16(addr, val);
 }
 
 static inline void writel(u32 val, PCI_IO_ADDR addr)
 {
-	__do_writel(val, addr);
+	out_le32(addr, val);
 }
 
 static inline void writew_be(u16 val, PCI_IO_ADDR addr)
 {
-	__do_writew_be(val, addr);
+	out_be16(addr, val);
 }
 
 static inline void writel_be(u32 val, PCI_IO_ADDR addr)
 {
-	__do_writel_be(val, addr);
+	out_be32(addr, val);
 }
 
 static inline void readsb(const PCI_IO_ADDR a, void *b, unsigned long c)
@@ -688,12 +681,12 @@ static inline u64 readq_be(const PCI_IO_ADDR addr)
 
 static inline void writeq(u64 val, PCI_IO_ADDR addr)
 {
-	__do_writeq(val, addr);
+	out_le64(addr, val);
 }
 
 static inline void writeq_be(u64 val, PCI_IO_ADDR addr)
 {
-	__do_writeq_be(val, addr);
+	out_be64(addr, val);
 }
 #endif /* __powerpc64__ */
 
-- 
2.47.0


