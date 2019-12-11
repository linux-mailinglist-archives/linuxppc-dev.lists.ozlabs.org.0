Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA0911A190
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 03:42:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xh6x6kXQzDqfW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 13:42:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="t4GBXkBU"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xh0Y54xnzDqf0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 13:37:17 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id x184so999436pfb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 18:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=45Oryhl0wN7p0XGM00VXrx6uiufh/K+5Df2iqk4EoOA=;
 b=t4GBXkBUEwoP148UMSsFYPWYfry9zV+kG7HZWvyt2CARdAhjyvHr33cQo9YHdiXbUN
 sQtLunZyHDRc4xAM4det4cV7v6sBfOXXzpP3QE42H8/gE5OsnUovz8dLvCWCknhHcpFU
 A96C1Id0ih/UABo2yN3MJtNdWPiFxLL+8YYWWHndosDWzvwHBIoHj0FdeJFP/jSP5stc
 lK7KATBm5/ndkT7Tml7F0luAq4sBNXxHCAfPizFX/UySUmz6aCCEjwK5uS1xZQqNa4BO
 hxmjihvhd0XaIfwWKplFAxq1aqYI3ldz2lIzzYMCfrDaC6QDGMBnBBMAwxq0NIQCAj7S
 pMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=45Oryhl0wN7p0XGM00VXrx6uiufh/K+5Df2iqk4EoOA=;
 b=cClMkfRecCUuKkkeRp9ZOZ28ft+LWjYEURfu1lb4jqKaoA+Q//fVxk0lBwNaajcoSl
 liA5dugZVUs3zYJ+EE3JCqI8aidAlqa/lSbxk9dz1Z+rpaq187bF6k3R3GiVRzRXf7Ri
 H8rgZ6HDvivZBvZewaUcd4sY6+9VFv26rA75Omsdi0dic/eHRSpCLQPJC2rycpsjDswC
 DcgRvxGurvDcBlZI5PgyIAN5BIhJPSX5xPokG2/JMEKbaNxzpLyofblaDXAuf/ReyRgl
 Fze7nTN9Fcc8YRQTovWCNytcAce2gjAqmNh1Q9FXzjkPej7igdCOMWkVNeyXGhatOQ+8
 jgug==
X-Gm-Message-State: APjAAAVc4JW+6ioYPond+aNBhudwwnCL8LhVT6rwsMGII7W47kzWiPyd
 1w05rzZm4gwfxOvcxLxC8ttXkJiV
X-Google-Smtp-Source: APXvYqyO0SiUgbEoFjPQLlu/Ws0rDC1vk0qk/UWs4ikSSTnsydo0rUVvvFQ3r1cA2o4JgPde8yBcjg==
X-Received: by 2002:a63:cf41:: with SMTP id b1mr1476066pgj.53.1576031834734;
 Tue, 10 Dec 2019 18:37:14 -0800 (PST)
Received: from tee480.au.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j1sm396459pff.107.2019.12.10.18.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 18:37:14 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s/exception: Add missing comma to
 INT_KVM_HANDLER macro for system_reset
Date: Wed, 11 Dec 2019 13:37:03 +1100
Message-Id: <20191211023703.16837-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211023703.16837-1-jniethe5@gmail.com>
References: <20191211023703.16837-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The INT_KVM_HANDLER macro for system_reset is missing a comma so add it
to be consistent.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8bcf562242a2..528c893deefd 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -828,7 +828,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 */
 EXC_REAL_END(system_reset, 0x100, 0x100)
 EXC_VIRT_NONE(0x4100, 0x100)
-INT_KVM_HANDLER system_reset 0x100, EXC_STD, PACA_EXNMI, 0
+INT_KVM_HANDLER system_reset, 0x100, EXC_STD, PACA_EXNMI, 0
 
 #ifdef CONFIG_PPC_P7_NAP
 TRAMP_REAL_BEGIN(system_reset_idle_wake)
-- 
2.17.1

