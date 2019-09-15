Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8509AB2DBD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 04:03:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WCN85VS0zF6BP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 12:03:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tFH/lWxx"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBcF0NBZzF5qB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:29:16 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id m9so14941159pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qO1cTnvV48lP79pf8aYl/XVEkyju6LgKodKnPL2OG/A=;
 b=tFH/lWxxp++ruIaX/kMm8uLROILGOYYCyU82bWjBFMaSbOKX0Bp7xCasN6oKyee4Gz
 sR2smEdV/bre3d3s/XBI8Zn1bYKlKs5GSki0O48CcYyTNjReq5idtXww75UrnpNumOc9
 eaK1bGrtYFRD9qsQbe8FmbIhwaJa2Nt679YIWgsz2qUd764cwdYNta9nCq6H+saOdUYI
 fI40ZBF6xfvyTLKLn7TnA/xbneP164YMUp1Zk3FeAXX60TgfpD+Er6nnakpnnsyWs2Aq
 /4M0l2Gt2cskYcelmXnVwuGgJdGFsGQAWRCDLjGZW0+uwoy7YHXhsspFlVxmPcswvTBe
 JCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qO1cTnvV48lP79pf8aYl/XVEkyju6LgKodKnPL2OG/A=;
 b=c37CZhzWRLQbK0U0m5sHNILkUB8zS4XbweK/qGWiX8FZnm/Z9xJ9BImtcZaObxhiDS
 5Y8xXp5/LmjFX5l278FsDi90Ho7uIzmGnRZlEzu4S/qUzW8Iv0Br0gVjXNTx9P6MM8D4
 1vAVcL5fsa5/8icIIah+K2d0LJaAndZQBdyjDPvi6lF65OtZPe2HgflIxWTy4cGf0Yj2
 9F3sPMKMzwPvge31vUleA+PsQcBqD2Lfh2pcChPzKsWm9jBUeLk9oS9lMxomnDrGJCW3
 fFKVe9gTs1FF4JImwCa6/ogaWxPOIqhjVqMSo6zj3z6VFfDLupYshrZkzbukSpJqrnC4
 GRAg==
X-Gm-Message-State: APjAAAXZmjOY5ujun4RA1OuA/OBB2/T7SAJo1F/NhvWEXVqa6PEZvXHI
 k2NJYlwK+mIxaITsE+F6gYzEFA7O
X-Google-Smtp-Source: APXvYqwh0f/VebzAGEM+P6ZXEE78wr+nhQqF6fzrjMKh9S/ReWq+YJ9drTUEj66DvY4FjQ6UxbGZzQ==
X-Received: by 2002:a17:902:a50a:: with SMTP id
 s10mr48607986plq.336.1568510953556; 
 Sat, 14 Sep 2019 18:29:13 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:29:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 17/27] powerpc/64s/exception: re-inline some handlers
Date: Sun, 15 Sep 2019 11:28:03 +1000
Message-Id: <20190915012813.29317-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The reduction in interrupt entry size allows some handlers to be
re-inlined.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 7a234e6d7bf5..9494403b9586 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1186,7 +1186,7 @@ INT_DEFINE_BEGIN(data_access)
 INT_DEFINE_END(data_access)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
-	GEN_INT_ENTRY data_access, virt=0, ool=1
+	GEN_INT_ENTRY data_access, virt=0
 EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 	GEN_INT_ENTRY data_access, virt=1
@@ -1216,7 +1216,7 @@ INT_DEFINE_BEGIN(data_access_slb)
 INT_DEFINE_END(data_access_slb)
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
-	GEN_INT_ENTRY data_access_slb, virt=0, ool=1
+	GEN_INT_ENTRY data_access_slb, virt=0
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 	GEN_INT_ENTRY data_access_slb, virt=1
@@ -1472,7 +1472,7 @@ INT_DEFINE_BEGIN(decrementer)
 INT_DEFINE_END(decrementer)
 
 EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
-	GEN_INT_ENTRY decrementer, virt=0, ool=1
+	GEN_INT_ENTRY decrementer, virt=0
 EXC_REAL_END(decrementer, 0x900, 0x80)
 EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 	GEN_INT_ENTRY decrementer, virt=1
-- 
2.23.0

