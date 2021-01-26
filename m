Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BFA30341A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 06:16:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPw254BrzzDq9J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 16:16:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=to0uKAF7; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPvXf2ssjzDqx9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 15:54:24 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id e9so1528167pjj.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 20:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxNEOYhgKwvRvVfu2/k3ZgwDNvcTYU3oc8R54p0XWwA=;
 b=to0uKAF7Nj1QlCsWyg4IjE5lSdoDnjb+l9Ld6oFvxCEr+TdnupQouEo+9kBXa/CDTa
 CcWbs9nZMugSmys1AYrg0YzRl7gGvYIGqFcWo3m+tnDDoNP1eEytLw8r3y7GSwMyrmCe
 D1MkaErva8TKJARzEmQ3TRygPOnZWkae0oQNXH8nuBTl1tLbbILHBtIsNbb52vxMEmBG
 HQHRvco4f3ttmI5jpwD72uQoDxUVtsLsRLoXAOuHMtgh+IGcrxP5DwZ+4nZ3hWnf9Yc7
 BPYalDoaBtLHOmX56hB5YjYixLyMljyMwoz86Q8ScLyG6lL2uoJfpDdBof0J7WJ4hrPV
 oSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxNEOYhgKwvRvVfu2/k3ZgwDNvcTYU3oc8R54p0XWwA=;
 b=Pho4vI3YIwilZ7kIIghUbbv9t3MkRa5v4bDFQes/NXyYwlf6BFHtsq95xZivj/N0h7
 QyqIbYa5CWLDbPH3M5Ftn3gnTNoRARy0V4Q7OLDBGwaoYWbqEdi4uZNPZ+nRT32EbvGk
 0ztL4AaXwWgazNXmzGAkSm7ovp+M2S7dOu3il6Xfa+7mO0ooqhEP51bgWGuYl05yOuEs
 J1QGehOVJHW1B7VjhcCNxisvqknQYZ7+K8nbm/fBMQO92k1endo6tGZ/ChAXQs38MpiM
 tlSK11eMj/BkBatfvj9IVbsXc+gmqpdUGIMKEhUkY+ZqqdM/fSx3hUukXChnSiNBh+8Z
 VHhw==
X-Gm-Message-State: AOAM530CKnnl53X8dORwWhewRmcLlMYp5AMlwR8v5qS2iXwaGSwnz0Ld
 FOV2UV9wbormlhCA1jvdPg4=
X-Google-Smtp-Source: ABdhPJwtUyXXER9bmRZ+e2DThvE7nOQ7xV1I38TK3IzCWyGCRxyYZp+rA6/30YI7Bw+AQQF+pC05Lw==
X-Received: by 2002:a17:902:e844:b029:de:5abb:7df1 with SMTP id
 t4-20020a170902e844b02900de5abb7df1mr4028710plg.55.1611636862738; 
 Mon, 25 Jan 2021 20:54:22 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id w184sm18803382pgb.71.2021.01.25.20.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 20:54:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/5] powerpc/xive: remove unnecessary unmap_kernel_range
Date: Tue, 26 Jan 2021 14:54:02 +1000
Message-Id: <20210126045404.2492588-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210126045404.2492588-1-npiggin@gmail.com>
References: <20210126045404.2492588-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

iounmap will remove ptes.

Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/sysdev/xive/common.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 595310e056f4..d6c2069cc828 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -959,16 +959,12 @@ EXPORT_SYMBOL_GPL(is_xive_irq);
 void xive_cleanup_irq_data(struct xive_irq_data *xd)
 {
 	if (xd->eoi_mmio) {
-		unmap_kernel_range((unsigned long)xd->eoi_mmio,
-				   1u << xd->esb_shift);
 		iounmap(xd->eoi_mmio);
 		if (xd->eoi_mmio == xd->trig_mmio)
 			xd->trig_mmio = NULL;
 		xd->eoi_mmio = NULL;
 	}
 	if (xd->trig_mmio) {
-		unmap_kernel_range((unsigned long)xd->trig_mmio,
-				   1u << xd->esb_shift);
 		iounmap(xd->trig_mmio);
 		xd->trig_mmio = NULL;
 	}
-- 
2.23.0

