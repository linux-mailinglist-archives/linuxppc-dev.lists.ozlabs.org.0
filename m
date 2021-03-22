Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F1343FE4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 12:33:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3sns2wFyz30DN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 22:33:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=g7W0bjQ4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g7W0bjQ4; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3snR3X18z2yR7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 22:33:12 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id i9so10074360qka.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 04:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OPF2bQHgVyJLJFI/awpdMJ0h6oH5lb8a5QcmD+rn2sk=;
 b=g7W0bjQ4et0F3+fWqOnm1Td1YLTPIorlvSq2a0H9lebFXW5QCmEDb6S6TbXRd5v/M0
 rk4DvpFuDriJ5HYQCNZKf2DiYlCj6dDDqOKiV3wfaVbgvJbV9zEklYP4AYOGh8rnitK3
 3/8iufKDS355PXbipeFJrkxT2Mh6wdvwyspGjoWMM6PrVzxC3AT73e1VVzEPqXkwuVX6
 oE0OcRFFiSTlLHnx7k6SkjmNzTB2H3Hn3RFEx3wf0eiAQ0RUWsnI5QRMfkioDG9bI/u6
 zWTsHhbYPb/EDRMOPtLW96pmz/jaVIgzjQnVIvP8oHVS2R6OeqfP8gUT9jLP6JvNN6yH
 fYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OPF2bQHgVyJLJFI/awpdMJ0h6oH5lb8a5QcmD+rn2sk=;
 b=JeRbikRd4PxeIecehXJXvI1p4kJMIlMvbz2Oo0U/Inw5BfXKw6WrZikGFAHgmnjzz4
 gVt+oJNDCZQmUCdTVg8N6xY28qZsN3Asz4MnwKEOvywlWsXx9fX5oHifWw7LOMgnsZcb
 45lCu4IdRCDFiJVMMVu1SqRQqYvQWd4/+nws2GFaoGE01X9Jv2ybvRpc7G4OqYahB8HT
 OTIanJAxId2Ydq7xyysKRPbNRahs5D3PixyurbyOzHam/scmVJxoeuXAA0eTF802hKla
 Pz2NLds5LycrhchTtuX6xhBeUp3uMIA89xPfgfUjAF0DatcnXi7vZo96AT28U8v6n3xJ
 vcwA==
X-Gm-Message-State: AOAM532MXFeuCTaaOD5wHIWGWM+31oxN83WEVLX2IpGr/SrXnRBqYWA/
 vEdDK2pPWI9kpa4F6PHZOmk=
X-Google-Smtp-Source: ABdhPJweKkhkRm201awkQPyNgwLXmDUlX+n8laSHEpcJvaNBnEckFy6A5g4SgZgi1/Ckfp0K2yHUzg==
X-Received: by 2002:a05:620a:3cb:: with SMTP id
 r11mr10411925qkm.148.1616412787096; 
 Mon, 22 Mar 2021 04:33:07 -0700 (PDT)
Received: from localhost.localdomain ([143.244.44.200])
 by smtp.gmail.com with ESMTPSA id h7sm10227746qkk.41.2021.03.22.04.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 04:33:06 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 unixbhaskar@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/asm: Fix a typo
Date: Mon, 22 Mar 2021 17:02:54 +0530
Message-Id: <20210322113254.2081445-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
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
Cc: rdunlap@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


s/poiner/pointer/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/powerpc/include/asm/cpm2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/cpm2.h b/arch/powerpc/include/asm/cpm2.h
index 2211b934ecb4..bda45788cfcc 100644
--- a/arch/powerpc/include/asm/cpm2.h
+++ b/arch/powerpc/include/asm/cpm2.h
@@ -594,7 +594,7 @@ typedef struct fcc_enet {
 	uint	fen_p256c;	/* Total packets 256 < bytes <= 511 */
 	uint	fen_p512c;	/* Total packets 512 < bytes <= 1023 */
 	uint	fen_p1024c;	/* Total packets 1024 < bytes <= 1518 */
-	uint	fen_cambuf;	/* Internal CAM buffer poiner */
+	uint	fen_cambuf;	/* Internal CAM buffer pointer */
 	ushort	fen_rfthr;	/* Received frames threshold */
 	ushort	fen_rfcnt;	/* Received frames count */
 } fcc_enet_t;
--
2.31.0

