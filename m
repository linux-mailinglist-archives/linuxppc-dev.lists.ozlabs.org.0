Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 402324F7ACA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 11:01:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYwNS2CV9z3bdB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 19:01:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YVbH4kfp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YVbH4kfp; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYwMn6RlPz2xVY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 19:00:53 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id b189so1644008qkf.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cpsn8zlGuEr895I52lJu8BAnUlOryrWv2Qhy+2V7ZP4=;
 b=YVbH4kfpa5m3GX7HPTL5Ve157W4wO+bLgK44lsQR5hIevYJyysuD0Jb1IFCgUHiVPk
 IudRTosA7GPp5f8GqswhyKClc2h1xLDD1KjlcX9VMbcWKh3qEhLdxfqBxhlBbJNaFcuq
 Jj7RQemXnX/40hRbYJStCKLEp0PJ0KARkvo7D4UxpGkkAgoY7dexvMHyDfYdQvAvswAH
 HuLRJyiVFiMO4xok2FpoMLN5uzUcGPQ8j/ShNlS74tY/RHtuajFZ9dZ4zRPmWs+lyiss
 3OmM4Dqlz0O2OrgRjIdbEIFNxaWhslLab64MkAavbsEa6NvmFDNEFco/kexE+tfn6eDK
 cGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cpsn8zlGuEr895I52lJu8BAnUlOryrWv2Qhy+2V7ZP4=;
 b=uczgn0CF8jkftG+lV9gWkx/b2y3g0m41Wu35DD7JhQhfSQiJIYY90xsujXVIjvUNDC
 JrJ/pnvMOBZOwDkqTeHxW5WMshz6JNWRTHvnxEMGg9Ch7l1pR4BN0uYDiI09JLiNRARS
 LsNZYh+HKVq96K2ZLgA4yAtHVVk6qsz49rVCmrPObvpjnftnLfrTV/yKZDJS/MA0kD3E
 CiB3D/DatOpMG9T++e6FcAzt1ddft48uCOJeSoiUSJ6k2/blxEviYVoUgEIS3cb/Czv2
 q8flXGBn6/gH24rRhxdKSV9v7FafpZiMiE21jwLcOEZom3WJH6Go4C+34CZVS9x+Pds9
 iggQ==
X-Gm-Message-State: AOAM532v/w5GwlZiMYLkvBGjZrexsXk7b6GQgjN1MZNOhsE7paLhWSVQ
 667/FW8hCE6hE80m0JOVCrI=
X-Google-Smtp-Source: ABdhPJy28M3cmBeS6IRvUM0efW6fbXHiokSkosHV1GY7AEKqurscM5QyDMVXdwfQ1dZETBvWnSWOJg==
X-Received: by 2002:a37:b502:0:b0:69a:ca1:298 with SMTP id
 e2-20020a37b502000000b0069a0ca10298mr469093qkf.133.1649322049430; 
 Thu, 07 Apr 2022 02:00:49 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 s16-20020ac85cd0000000b002e1ed82f1e5sm16813270qta.75.2022.04.07.02.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:00:49 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org
Subject: [PATCH] powerpc/powernv: fix missing of_node_put in uv_init()
Date: Thu,  7 Apr 2022 09:00:43 +0000
Message-Id: <20220407090043.2491854-1-lv.ruyi@zte.com.cn>
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
Cc: linuxppc-dev@lists.ozlabs.org, lv.ruyi@zte.com.cn,
 Zeal Robot <zealci@zte.com.cn>, paulus@samba.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

of_find_compatible_node() returns node pointer with refcount incremented,
use of_node_put() on it when done.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 arch/powerpc/platforms/powernv/ultravisor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powernv/ultravisor.c b/arch/powerpc/platforms/powernv/ultravisor.c
index e4a00ad06f9d..67c8c4b2d8b1 100644
--- a/arch/powerpc/platforms/powernv/ultravisor.c
+++ b/arch/powerpc/platforms/powernv/ultravisor.c
@@ -55,6 +55,7 @@ static int __init uv_init(void)
 		return -ENODEV;
 
 	uv_memcons = memcons_init(node, "memcons");
+	of_node_put(node);
 	if (!uv_memcons)
 		return -ENOENT;
 
-- 
2.25.1

