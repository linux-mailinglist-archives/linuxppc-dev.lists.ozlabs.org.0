Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA482A4A02
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:38:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQYpM66nczDqkj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 02:38:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=josGJE8g; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQYc973grzDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 02:29:28 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id g12so18979716wrp.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 07:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBNjIzKKFLIKIRI5U9uzeH/MngM3x94OuZSkH5Dv/F4=;
 b=josGJE8g0cGm5dRus2hB4+zeisCPoF+VOurpXrjHOF2wKE+Z9FjCJs/AqIuTqc0sR5
 WamgHlkMDTUh07hEBCFvPLenTgMuPn7jxaqWjXXA7/uwO2zXUk+guh4d20HhL9ZohHzN
 vRDdMz1Viofb5Uavi/+/pI3qgQFa6xZaYXBha9NH3qSrwqwsOXZSkFx+3zewILTjBVL6
 SevRPEdVvn58RZyVPMLw/I6H5IFRZrd5HR0xqfuWpmubml8BZzCSnrMGpDleyPmEzUVp
 iOEN/HWUd11yRJADFVoQL3/TzEAtmxxxWVReIB/gRRcxvUDllbRi7pAy5ABg/H3quXke
 ZWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBNjIzKKFLIKIRI5U9uzeH/MngM3x94OuZSkH5Dv/F4=;
 b=XfUk0eWhA0lXGHmushEUpIRUfFO8pwDmrOQSIr1Kt1NzCSwJyN5oB2cWEKTrk7HxV2
 JVJg49G552G4n6AzcaZpp03Qs8JUrdg6M0HUYSsT1MhfV22y+pkFuhe5hTd63kGp+QQO
 Qa+YlNeBdjknWIs1o4r/TBnk7R8fE5u+FU4h29kGUUbwPh8tStXLDfOJg/xDFc74sBh+
 6dOjluM8O9u95vyykw5Pe05Hgw8dH/TD5/ZtGwaNcxbkaKuVx7ax3UScV6jQucaDugqt
 BrTQxD0VDopzw6VfwzbkU9hsgk626AsmMEddnQf5YISdbXvZsKXl4iLkpSgGebHB9OjD
 qLUw==
X-Gm-Message-State: AOAM530Cd/9elFO+1eqAg5l2Q2MbfJQVj+vX16j83KtXSvYsr98nw17g
 DDYjACnNUwK8r73ZIkCjIAE7gQ==
X-Google-Smtp-Source: ABdhPJx03S5vjk5hMfq3uHPc1HN4w5Uj192gBX1i3DR4VYLTiJ50hEydqw4F3+ykr1pITH8+ok1woA==
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr26792942wrt.221.1604417364750; 
 Tue, 03 Nov 2020 07:29:24 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 07:29:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/25] soc: fsl: qe: qe_common: Fix misnamed function
 attribute 'addr'
Date: Tue,  3 Nov 2020 15:28:24 +0000
Message-Id: <20201103152838.1290217-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
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
Cc: "Software, Inc" <source@mvista.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, act <dmalek@jlc.net>,
 Dan Malek <dan@embeddedalley.com>, Vitaly Bordug <vbordug@ru.mvista.com>,
 Scott Wood <scottwood@freescale.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/soc/fsl/qe/qe_common.c:237: warning: Function parameter or member 'addr' not described in 'cpm_muram_dma'
 drivers/soc/fsl/qe/qe_common.c:237: warning: Excess function parameter 'offset' description in 'cpm_muram_dma'

Cc: Qiang Zhao <qiang.zhao@nxp.com>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Scott Wood <scottwood@freescale.com>
Cc: act <dmalek@jlc.net>
Cc: Dan Malek <dan@embeddedalley.com>
Cc: "Software, Inc" <source@mvista.com>
Cc: Vitaly Bordug <vbordug@ru.mvista.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/fsl/qe/qe_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index 75075591f6308..497a7e0fd0272 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -231,7 +231,7 @@ EXPORT_SYMBOL(cpm_muram_offset);
 
 /**
  * cpm_muram_dma - turn a muram virtual address into a DMA address
- * @offset: virtual address from cpm_muram_addr() to convert
+ * @addr: virtual address from cpm_muram_addr() to convert
  */
 dma_addr_t cpm_muram_dma(void __iomem *addr)
 {
-- 
2.25.1

