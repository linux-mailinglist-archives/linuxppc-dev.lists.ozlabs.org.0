Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5429253DA9C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 08:52:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LG6k922vNz3bwp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 16:52:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=etC4GCey;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=linmq006@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=etC4GCey;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LG6jT5FjSz3bhB
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jun 2022 16:51:40 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id j7so10439975pjn.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Jun 2022 23:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WgLvepossqYxUVw9ClZad/mto5k7o8Anzm/y5Yj+fuA=;
        b=etC4GCeyd4d0cZcDWCELzE23ufOSBZ/Ogr0TO86ojbcgGscfaGC6SDrMeeSwcFjqGZ
         TpaKCFYcoR99z6vef37qqqJBvTX7jjM60fsMiO0tp/MRAvWIwix1gfChvOCq9/pWd+kN
         xvP/18vCCsPHDOhOjRiYZUIh0u0YbE9fwRcIPLswHhFO8nZIGAj/74XxtvUmieilR+4X
         foxckJGbCC+Gd+YHoTvZ3Ph402WEWV/Pr9ILFj7Xu74YUGyEHKeEeEayd4eFfX5eMlqV
         BkmH81FCAUEFVjUQRL7Ycsp6GWQbloIcCFqBZll3abLesa88xwhHeZj55EAIn4YScCl9
         NVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WgLvepossqYxUVw9ClZad/mto5k7o8Anzm/y5Yj+fuA=;
        b=ZBHJWxytiMBdZeY2LtbTR/EkIgS6qUSNOEhgALozRHojZcjDvsT4gQgg0MBRUQwexC
         WnaMddlBjZlVy6OjqO2SMenAGs/lNYkDk8Yiv6i2uRDXrchPfXaPoSVx0O23WGLpEMIZ
         QxyY1WSfrNfo7oDitPxww9HeGfmxPi2qTlDIULrejy9Zhsg9wvYIqRe9chRVgZVjH8i4
         afvVmKRsr/357Si1cH9DID9bdHR6UiW3lzc3AmG3WVnMTFoIbI+LXkQImAZcaNdNRMIr
         /88AvE5XBUbR/3/EUWTJADGSBVKdvDrDjPXHvsN2h/CKOwmXTU4Az5kTEL/KHecig1GK
         o1VA==
X-Gm-Message-State: AOAM533vsH6H/X9b7ORrFUvOxY6HRUsg80DN+lqiLISQdk9pOHqzcBcb
	yPFwWecwUvc7tswh5BOv2+4=
X-Google-Smtp-Source: ABdhPJzVgwC+hEi6kwStpzn4oICo4kcq38lduufTqJH4dyo3N8ef1ZJFOaUBSHXH0ob6imm9qSJoqA==
X-Received: by 2002:a17:90a:c202:b0:1e2:e772:5f0a with SMTP id e2-20020a17090ac20200b001e2e7725f0amr19758314pjt.109.1654411898813;
        Sat, 04 Jun 2022 23:51:38 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id r6-20020a170902be0600b00162037fbacdsm8194582pls.187.2022.06.04.23.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 23:51:38 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/cell/axon_msi: Fix refcount leak in setup_msi_msg_address
Date: Sun,  5 Jun 2022 10:51:29 +0400
Message-Id: <20220605065129.63906-1-linmq006@gmail.com>
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
Cc: linmq006@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_get_next_parent() returns a node pointer with refcount incremented,
we should use of_node_put() on it when not need anymore.
Add missing of_node_put() in the error path to avoid refcount leak.

Fixes: ce21b3c9648a ("[CELL] add support for MSI on Axon-based Cell systems")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/platforms/cell/axon_msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
index f3291e957a19..5b012abca773 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -223,6 +223,7 @@ static int setup_msi_msg_address(struct pci_dev *dev, struct msi_msg *msg)
 	if (!prop) {
 		dev_dbg(&dev->dev,
 			"axon_msi: no msi-address-(32|64) properties found\n");
+		of_node_put(dn);
 		return -ENOENT;
 	}
 
-- 
2.25.1

