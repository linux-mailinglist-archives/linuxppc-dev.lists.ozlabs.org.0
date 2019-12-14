Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9382A11F378
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 19:16:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Zwhb60hqzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 05:16:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=tiny.windzz@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gv/VdsoR"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZwDK4W9JzDqxt
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2019 04:55:13 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id x184so3258304pfb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 09:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nt2pN2PNTd9g1AzNbzq97oeN58SK9gcKW9K3SpO8TF4=;
 b=Gv/VdsoRgHpB/c2yhY2FchQl8GlLj2LlyDV4SziV3wj7136aNHsMcLqaDjKfQbUYQ5
 Ldl81jRSZL58cvErn85BIIYXKzfWUj5bfw5iobZJgqKqqmNhqRE1ByUn0dqGpOHr+Rnw
 wuD3z+aSoLOmJQIgJTqLwfsPq9y1aaDENwT5ZKsDlK9a6T6/kGECY9UfcDScfSdw6M7c
 U0z6d7KxleQpb4fK+hl28q/5ksU/irT2Sm/TwLTtz3ifQDnwg8gLJbGCbseQbmcblxt2
 BYYdY6ud2OupWCJBTlY96/jwPXSOxJkm5e3elKHdaVSnBwj+rxXpCv7ev/+hyx4Lko4b
 e+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nt2pN2PNTd9g1AzNbzq97oeN58SK9gcKW9K3SpO8TF4=;
 b=RN1DFtjCyot3nEQ5arGcN0X9WYcDzjp4YhgZbgmssxk90ZjDvngxWL98Go8rmz3Brd
 CHgZVy0WYiRBSv0Edta5HDhh56O6EH/05kPMdlEeV6ANS/drEn0Ow00zDNqvSkkeYM6l
 BOsFjx6BUOf77c9Tm7T6k0aCF9Vye9pmRwLeKrPo0vbj0vDRZy+pwikmuoKN3YydBkXV
 1YxbxdSx9ezNEd1VWgImZd+VAHjjx8Phz6hp48pY9vBXp3OhA3yt2Gq7NiLnVQB8whdo
 JKgPPNpYM79z2mO05YH1xdv/0utMpASspFRPPBIjAmiY04a+nkeof0fSUMy7YnOcUpJO
 /5tg==
X-Gm-Message-State: APjAAAXp8LEAIuNzOIMti6vhwj76kTlGkLvfkP4KRYJiRYy/F6OW4ILT
 YiBZAhNQ2wyVQh02iNLz+FQ=
X-Google-Smtp-Source: APXvYqybjjn/TOWlA2h31OJeNnxlYt/SPwXnKosPeewYaqCCBb4gKJUgt8Nd9pDHs/jf79O1lcti/g==
X-Received: by 2002:aa7:848c:: with SMTP id u12mr6216069pfn.12.1576346111060; 
 Sat, 14 Dec 2019 09:55:11 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id p5sm15841692pga.69.2019.12.14.09.55.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:55:10 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 07/10] soc: ti: wkup_m3_ipc: convert to
 devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:44 +0000
Message-Id: <20191214175447.25482-7-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/ti/wkup_m3_ipc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 378369d9364a..e058f67e6333 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -429,7 +429,6 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 	int irq, ret;
 	phandle rproc_phandle;
 	struct rproc *m3_rproc;
-	struct resource *res;
 	struct task_struct *task;
 	struct wkup_m3_ipc *m3_ipc;
 
@@ -437,8 +436,7 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 	if (!m3_ipc)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	m3_ipc->ipc_mem_base = devm_ioremap_resource(dev, res);
+	m3_ipc->ipc_mem_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(m3_ipc->ipc_mem_base)) {
 		dev_err(dev, "could not ioremap ipc_mem\n");
 		return PTR_ERR(m3_ipc->ipc_mem_base);
-- 
2.17.1

