Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7F53F6FBD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 08:43:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gvbz61tT1z2yQB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 16:43:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=euqwfrYJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=euqwfrYJ; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gvby81xy8z2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 16:42:40 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id ay33so14485913qkb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 23:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bFYGx05HsHjbbBDCITQXjISDYjMAJovwLRHhmmvHL2Y=;
 b=euqwfrYJBAHrHzaLF3oDa3/4omT5QOIXAyafgBruf3Xedb/rmYSzGfG/PV6NfpCPwQ
 0CG27TLdcu7qSxrBJ4HwvC0ZGqlyV1a/rWqo/VrQSbIfdLmdnLHHJWxIL0vTFlhr9P5K
 qx0F0XB0e+3o8IetQpE5Es6+iBTbosKW1sKciKoU5BIWrkCbge0an+mXMd/DIDawQX5K
 lWPOL5Owek9t/uWyJYBXdL8ludDazIH/o4Jmla1tutAgEXCPp+n1/+IKOgV48g0kwbVW
 Ee9gDGsMenc4SGKQwPkVMFniG9Z4Xzhx72GJqxP498ix/eBUILvvYpfIubkCrClaCoww
 WFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bFYGx05HsHjbbBDCITQXjISDYjMAJovwLRHhmmvHL2Y=;
 b=p82VHHqY4wm9I6DYV3YMH92RvSMWKeDMt1vP91eznsJCyOwPPsNQN4VbClPOtEHl6R
 lBGC6ixlShe+4ocQFkR4dyH3naJTBeFgDkrjNIRRTgt3Qay979McKdLfLfhQO8YtYLlS
 uGs3lLkpQO7lweBhKHjtQXH/BuA/rqF6uea909TOrYKcD8SRUg+mUfPR666XorwTWj80
 sOnBoo4E1zaNYYqyro2IlnTnGXgMUQ89tWiuK7mLa0ljUvYDF//s9d45LrA1fr8fWxV+
 oYzsja2m+70OUqjEdeFmum5fIdssOimz4PUc1LzDdEgZqnFzsB3ZIN9/gRX4Kn/vysu/
 0WdA==
X-Gm-Message-State: AOAM532xzmCfA+iXTnKlE3oC+YKYQ4xsi6slpSujBwzMcAMX0gMpIMCl
 5uw4BLbmc9CYNE3/IruFHJM=
X-Google-Smtp-Source: ABdhPJz9cuBhiCQl3AhOKS9j6zyMvbY8uDFjCZBxlL+ObcXfzsmQUB25tMZKfMq+U2pclfye7g/S3g==
X-Received: by 2002:ae9:eb91:: with SMTP id
 b139mr30275671qkg.149.1629873756642; 
 Tue, 24 Aug 2021 23:42:36 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id c2sm5413442qte.22.2021.08.24.23.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 23:42:36 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH linux-next] power:pkeys: fix bugon.cocci warnings
Date: Tue, 24 Aug 2021 23:42:28 -0700
Message-Id: <20210825064228.70487-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Zeal Robot <zealci@zte.com.cn>, Jing Yangyang <jing.yangyang@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Use BUG_ON instead of a if condition followed by BUG.

./arch/powerpc/include/asm/book3s/64/pkeys.h:21:2-5:WARNING
Use BUG_ON instead of if condition followed by BUG.
./arch/powerpc/include/asm/book3s/64/pkeys.h:14:2-5:WARNING
Use BUG_ON instead of if condition followed by BUG.

Generated by: scripts/coccinelle/misc/bugon.cocci

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
---
 arch/powerpc/include/asm/book3s/64/pkeys.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pkeys.h b/arch/powerpc/include/asm/book3s/64/pkeys.h
index 5b17813..5f74f0c 100644
--- a/arch/powerpc/include/asm/book3s/64/pkeys.h
+++ b/arch/powerpc/include/asm/book3s/64/pkeys.h
@@ -10,15 +10,13 @@ static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
 	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return 0x0UL;
 
-	if (radix_enabled())
-		BUG();
+	BUG_ON(radix_enabled());
 	return hash__vmflag_to_pte_pkey_bits(vm_flags);
 }
 
 static inline u16 pte_to_pkey_bits(u64 pteflags)
 {
-	if (radix_enabled())
-		BUG();
+	BUG_ON(radix_enabled());
 	return hash__pte_to_pkey_bits(pteflags);
 }
 
-- 
1.8.3.1


