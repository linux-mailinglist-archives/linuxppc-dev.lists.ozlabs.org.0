Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DCE78E40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:42:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y2T41m8szDqGl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:42:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kPIB7J4E"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rP2v6fzDqC8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:41 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id w24so27572318plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xEsxeG444yzcJtuWUSv56xRP6n++uc8jNpqEvnRlTIU=;
 b=kPIB7J4EkK7fwjPCgFLANeYHAwAo2RrT8eFmI8Msfnn1bOro7J3QnE670NTUYMBqC4
 WoppYdFgxzFypo3dyWNJi8oCJ+YAZRY5VXQU9TeT8aD72fHtdA8CB/e08kv+TgFPdPTT
 d6Sqf/F0LdzRHxGkxfC6hNYLO6IGYTAlc6V/I2dCaH5ZCB1KLTu+zFkaF4AJqLzB2+/0
 LSM9UHV8RZuRV2uxs23XehDM8/+hMbLWsWRhqmYqZfGHLpkPDk0n/TErlTX/sxW3XVhH
 gIdTDcK02XSf4apFz0zm5LNpAkirdKJaoiIbgiauo45ykctFnXI51tQygmDDIaH3zBTZ
 tEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xEsxeG444yzcJtuWUSv56xRP6n++uc8jNpqEvnRlTIU=;
 b=MGKEvQDVJEFrORBiwjbebX0D2+AGDZF/8KJm5Py2U5Hcf+Fyt/RYP4f5qLqCAPLxD5
 chdLVy1fNB8BGF/UesCl0pNeslvAiQsP6gM/BTUmzC85LoH4eu2wfBPtyiiR1FRqq57I
 yb7HjTngnUMxgsZouc+GSxSd/DUrYzrVk6mEL+OTV9Av8s2Kvao+42+xDDb1vEGnlKuC
 qGw+VbjO7NR0dzw5o4eX/0lrkLNrbRA8FBApFbMgntL7SLK5b2qhWYTu3K+GAhqR//2V
 UXAMZ2iPC8A1ELH/EtdH/bsdnOVeCOnWtEeYSxFlfZxAYxH3M+Jt2mSNJWX7ojwv8UPD
 NU1A==
X-Gm-Message-State: APjAAAXrb+VUbp1LzDHBUkI1JqHHPtI1WQu5fwsJNifCteFOdJ/yqh2H
 mzJV19pDB+5j7nn1lKKrbMtEpoRCOto=
X-Google-Smtp-Source: APXvYqxEZ38iRzceJ+2JSjiAaHjoodLApxWMwLqqrdodE+hE1iGnToN4/GETOMmajA5JeOfsM/S1Rg==
X-Received: by 2002:a17:902:306:: with SMTP id
 6mr111872233pld.148.1564409619385; 
 Mon, 29 Jul 2019 07:13:39 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/18] powerpc/64s/exception: remove 0xb00 handler
Date: Tue, 30 Jul 2019 00:12:34 +1000
Message-Id: <20190729141247.26762-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729141247.26762-1-npiggin@gmail.com>
References: <20190729141247.26762-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This vector is not used by any supported processor, and has been
implemented as an unknown exception going back to 2.6. There is
nothing special about 0xb00, so remove it like other unused
vectors.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 723c37f3da17..9c407392774c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1563,10 +1563,8 @@ EXC_COMMON_ASYNC(doorbell_super_common, 0xa00, unknown_exception)
 #endif
 
 
-EXC_REAL(trap_0b, 0xb00, 0x100)
-EXC_VIRT(trap_0b, 0x4b00, 0x100, 0xb00)
-TRAMP_KVM(PACA_EXGEN, 0xb00)
-EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
+EXC_REAL_NONE(0xb00, 0x100)
+EXC_VIRT_NONE(0x4b00, 0x100)
 
 /*
  * system call / hypercall (0xc00, 0x4c00)
-- 
2.22.0

