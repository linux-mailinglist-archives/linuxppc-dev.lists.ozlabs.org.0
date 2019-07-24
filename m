Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02572952
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 09:56:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tnjS0w5vzDqCT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 17:56:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=nishkadg.linux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DRB3NB38"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tngY0yW7zDqCT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 17:54:48 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id 4so14690575pld.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 00:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xuuerq01hI+vl9rnb4MEMb4bf4fzxdSxAGwMaZGuVJM=;
 b=DRB3NB38SxuG+lydWEZKXFdilJ8RuR2CPicUPzqjtkMbX/ply2EbIeXB01q1opVrGc
 AeYquhOe5gSB7LkrW3XG/bdJe8CfknTBs2z7eQ17LcVYa9VqJwC+7MlPkNd/YXqCjDbw
 /Stpiww1qzfTWnzSGzH8Whhec/hqUPk7uHRhu90sPEhfPQECw/AXQIXlToP86FDc/B5v
 O8GDc2A8NHA5EAaBNyYK/W6m4IkuSJ2BQq/a7A5BkKM+WiG6n7MO7VghhpWGDTOIsADG
 As4oczs5cbcYfQYMveerwo1WiMaGaxbdbUPo2ERztIieIcXTqe4hnD1zUr7FEUQtx/lb
 vSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xuuerq01hI+vl9rnb4MEMb4bf4fzxdSxAGwMaZGuVJM=;
 b=TTjcfOIBmLvTZSV0qp+GWIEgvsXBgsvu1ShluAbCdOvyd4mCKlIgbW1n88dk3DiC0Q
 s8NHxNJatjMRqou4k59l35P+8cOrtREIGfl4jZE72icZ+CyoX/nS1ScRN7vl5pyL4+ly
 l+X0r6XffI50LDcIVCaQQv3nF64xxF6ISntfY7GRrNzBmpvvb9SqbMyufgM45jiecTjO
 d47Nm1jwoQtTgc33t1ztdzcQt7+PYjRevkzIWvx1a6Sdaz8vooGHpjB+iE55voJpGIM9
 pqDy37N1NCFVEhOcGkN5ly6rZsaVmvUdVRxkWLOSRHir1bame0wg6Hp4E7MQN5/SK2vY
 LT8Q==
X-Gm-Message-State: APjAAAVFJl2y6prZnTJRSSw/QNUPSG3VRNlETxdMObB1DWuxOP/b1ZQ6
 6bg/I0949aF67oy01O1jrMQ=
X-Google-Smtp-Source: APXvYqznSF/YiWx6bW5BS3Sw9H4C6aV48SBnIKYhYXEA8W+q0aiaWzFs11Lb5qrnzS3lkhHn2SvSPw==
X-Received: by 2002:a17:902:4623:: with SMTP id
 o32mr83153528pld.112.1563954886243; 
 Wed, 24 Jul 2019 00:54:46 -0700 (PDT)
Received: from localhost.localdomain ([110.227.69.93])
 by smtp.gmail.com with ESMTPSA id o130sm74698084pfg.171.2019.07.24.00.54.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 00:54:45 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: haren@us.ibm.com, herbert@gondor.apana.org.au, davem@davemloft.net,
 benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] crypto: nx: nx-842-powernv: Add of_node_put() before return
Date: Wed, 24 Jul 2019 13:24:33 +0530
Message-Id: <20190724075433.9446-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Each iteration of for_each_compatible_node puts the previous node, but
in the case of a return from the middle of the loop, there is no put,
thus causing a memory leak. Add an of_node_put before the return.
Issue found with Coccinelle.

Acked-by: Stewart Smith <stewart@linux.ibm.com>
Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

---
Changes in v2:
- Fixed commit message to match the loop in question.

 drivers/crypto/nx/nx-842-powernv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/nx/nx-842-powernv.c b/drivers/crypto/nx/nx-842-powernv.c
index e78ff5c65ed6..c037a2403b82 100644
--- a/drivers/crypto/nx/nx-842-powernv.c
+++ b/drivers/crypto/nx/nx-842-powernv.c
@@ -1020,6 +1020,7 @@ static __init int nx842_powernv_init(void)
 		ret = nx842_powernv_probe_vas(dn);
 		if (ret) {
 			nx842_delete_coprocs();
+			of_node_put(dn);
 			return ret;
 		}
 	}
-- 
2.19.1

