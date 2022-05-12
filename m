Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD67F524D18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 14:38:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzWXS4b7wz3cHD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 22:38:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Yw+ak1Sy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=linmq006@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Yw+ak1Sy; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzWWr743Mz3bry
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 22:37:42 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id q4so4719163plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 05:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6CFViMJQOM5l59cZNiZSV+VZMyJ7ocJv3o9yD35geY=;
 b=Yw+ak1SylPEUFp4qRcjq1rFxni8CWqBy86jhLlH0Dby796+zoPoCW90mbXwOZNw46Z
 nJdn+cmyPfp/kCaYbY1Kzp2UhGVHHih/aw+LLoo/FPupKb05/lfCOMQeYDyYLBPYfKYd
 JH8qGLMxzO2pf8iNQOzehDwBohbOOUtYEjAR94eDP/mL/tfl1GFfizQUArmy9mC6O02n
 xA1ZAsDgMvDITUqUa1UmcYG7tme0NH2dTl/y5Olfto056hm3uuRYgUUWURBLjEr5Q5Jo
 I7hEXunGErlS57VSVO10JN+mH/AYnwRDBPbuzUsmTS7WuTMQfRt5mShDD27Xfmlw19OM
 zS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6CFViMJQOM5l59cZNiZSV+VZMyJ7ocJv3o9yD35geY=;
 b=E7D/I0ivGJsF+DgQeJD7MRGH/Yyu0hf4/B1RSAuw1Vl4HtoZ11Ge7uU/lHn1UiAeQ6
 E1gDJU2Lv/k3G1A+CMSwDwkuHmjKf9DVhbaNl9m7+L5rYe4cu/GW2+0BAcHxg39uERru
 WhVwVbqUvO5B47bp9YwySy0mEidb/jjI40F1f7h6bOM/MIqhgP/2jv3Za5KTj6tABWhz
 VcXJAC8nBnjAFQF41H08jOCFlP3rdoqhmbNc5jSf7KCHQWYv9aG+RsQLpmbqvsEbRg2y
 z9PwxHfsT1n7miAd1FPPDriJEPCKdQ8Ke/E6vkkCxged6TQjvHx6/6CvsZpYF0U534W/
 xQYg==
X-Gm-Message-State: AOAM533FkBjfJc6CcBFyPs+Ao6wJdk3zHHH9MZjnGYJOMV55DqCm1ynx
 C+DiqvLW9Z6STlTs6pI60Fs=
X-Google-Smtp-Source: ABdhPJy68VggfNTCd5j2856FnBuLiJrqP3Y8EuxTuwfCivGxvsAzhFVoo4tZ5/+fDCPbgaYMytyBqw==
X-Received: by 2002:a17:902:7296:b0:14b:4bc6:e81 with SMTP id
 d22-20020a170902729600b0014b4bc60e81mr30308708pll.132.1652359059094; 
 Thu, 12 May 2022 05:37:39 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 10-20020a17090a174a00b001d5f22845bdsm2471299pjm.1.2022.05.12.05.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:37:38 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Miaoqian Lin <linmq006@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Gang <Gang.Liu@freescale.com>, Jin Qing <b24347@freescale.com>,
 Alexandre Bounine <alexandre.bounine@idt.com>,
 Li Yang <leoyang.li@nxp.com>, Kumar Gala <galak@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/fsl_rio: Fix refcount leak in fsl_rio_setup
Date: Thu, 12 May 2022 16:37:18 +0400
Message-Id: <20220512123724.62931-1-linmq006@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: abc3aeae3aaa ("fsl-rio: Add two ports and rapidio message units support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/sysdev/fsl_rio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index ff7906b48ca1..1bfc9afa8a1a 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -505,8 +505,10 @@ int fsl_rio_setup(struct platform_device *dev)
 	if (rc) {
 		dev_err(&dev->dev, "Can't get %pOF property 'reg'\n",
 				rmu_node);
+		of_node_put(rmu_node);
 		goto err_rmu;
 	}
+	of_node_put(rmu_node);
 	rmu_regs_win = ioremap(rmu_regs.start, resource_size(&rmu_regs));
 	if (!rmu_regs_win) {
 		dev_err(&dev->dev, "Unable to map rmu register window\n");
-- 
2.25.1

