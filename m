Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D825A163
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 00:23:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh1mq1lKwzDqXr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 08:23:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qlO5fZKX; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh1dy632dzDqNb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 08:17:26 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id x18so1261521pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 15:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8oVSt+XXgts9V9hBX8ORH+AS6m2J43vGA4wo7bjMGSw=;
 b=qlO5fZKXWIaweztfSZt5lscCfMeb95G8MhWsQ/lSaJ+FDb1SNokcNpp+7z3DLE4rF3
 2dysm9rS4OSd3k64RrCb2iDLfTihhQIBsWHIM4pO3zun/ZZiHw5M0ZYz7xotRRp0Vl6H
 gVuKb6zzb+/D4Aziqs+kgokfp0Tdgx+wAi7EGpiAZ/wFNGynAtvTJuP+UbdooYJgbhjP
 o7AepCWbCypJyziUVIcTQr08TEiIxGgWthqCZQfDFV+gKNvojJajEcK9KwneuTuD6th6
 msoaUb3F3Quj/oIp2iNYcujpjaBrVxAyuvNikmWWuoEg7qjTdOjx5lIdZ2jVaiaUQPfR
 XRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8oVSt+XXgts9V9hBX8ORH+AS6m2J43vGA4wo7bjMGSw=;
 b=VHG/WMJV1bIaudBi9vltMrrlq5aGo2mjVV7O0NsiXqBNxPXE2v7C07bR/hbaQZGVGf
 MuegR0N8s8EwHRyYcJd4mvI+R0elJoFSdVH3wKdEVbxdsxFaJbDKuYlxhZCqE7ypvFew
 XdbXH1PZOjCZWVP3O/dOGD6+44dOC4eqX6uQQQbf+TEa7iPv6EyNy7CTJEy+/o4g/ZnJ
 /xi6yn/zQAJto84sG/etT+i0Ca7v1owTvBCxY3TOsGmdo4u6sfMTvvvKQx7cN+CWQiqD
 8McuQI517Arj8c8xPJ10PDwG7Fcil+gMrXjXxlqR+rxKdTn5sqSEU5GN0PJIbRDO7KRp
 PBsQ==
X-Gm-Message-State: AOAM532wNvX6OBTnO9ka/aC+dm5jDLCoQp2FpLdaB+cHqUWdB6RMDtHZ
 eU7THoVFtcJ7qfsWqp17ZsE=
X-Google-Smtp-Source: ABdhPJzdJq9eyRVuKNEYyNWukVThnPxVvwkVZFW01G6oPEDkIuTUBku5fZJKBabSN7o4EGbI7+mmXA==
X-Received: by 2002:a17:902:6ac2:: with SMTP id
 i2mr3270568plt.71.1598998644148; 
 Tue, 01 Sep 2020 15:17:24 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id w203sm3201356pfc.97.2020.09.01.15.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 15:17:23 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: hch@lst.de
Subject: [PATCH 2/2] dma-mapping: set default segment_boundary_mask to
 ULONG_MAX
Date: Tue,  1 Sep 2020 15:16:46 -0700
Message-Id: <20200901221646.26491-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901221646.26491-1-nicoleotsuka@gmail.com>
References: <20200901221646.26491-1-nicoleotsuka@gmail.com>
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
Cc: linux-ia64@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org,
 sfr@canb.auug.org.au, deller@gmx.de, x86@kernel.org, borntraeger@de.ibm.com,
 mingo@redhat.com, mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com,
 schnelle@linux.ibm.com, hca@linux.ibm.com, ink@jurassic.park.msu.ru,
 tglx@linutronix.de, gerald.schaefer@linux.ibm.com, rth@twiddle.net,
 tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The default segment_boundary_mask was set to DMA_BIT_MAKS(32)
a decade ago by referencing SCSI/block subsystem, as a 32-bit
mask was good enough for most of the devices.

Now more and more drivers set dma_masks above DMA_BIT_MAKS(32)
while only a handful of them call dma_set_seg_boundary(). This
means that most drivers have a 4GB segmention boundary because
DMA API returns a 32-bit default value, though they might not
really have such a limit.

The default segment_boundary_mask should mean "no limit" since
the device doesn't explicitly set the mask. But a 32-bit mask
certainly limits those devices capable of 32+ bits addressing.

So this patch sets default segment_boundary_mask to ULONG_MAX.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 include/linux/dma-mapping.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index faab0a8210b9..df0bff2ea750 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -629,7 +629,7 @@ static inline unsigned long dma_get_seg_boundary(struct device *dev)
 {
 	if (dev->dma_parms && dev->dma_parms->segment_boundary_mask)
 		return dev->dma_parms->segment_boundary_mask;
-	return DMA_BIT_MASK(32);
+	return ULONG_MAX;
 }
 
 /**
-- 
2.17.1

