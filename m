Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8874E1A8F34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 01:37:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49222P47ZxzDqwb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 09:37:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ba4Nokhh; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49220R07YDzDqwV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 09:35:16 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n16so642927pgb.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 16:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+YmqX+iFmzpuLC39YXH9ihsyFQ9/x2YtAd8ekMEk1P4=;
 b=Ba4NokhhnIStzX97W+Y32o3gdVMO5Y3gk0nYFC1kQFnBa2ehZS+Jl9rjwzCSyMXkPU
 0VLJxzUuISB/8yuu1yh91XDcmSkaxi5/zhVn7nDon2AnU2DSBm262KPuJn1YlAGJGldA
 Q4jMa0z6T/YLqZm0VUHAxOD0nt1SeKMDDDYBmJ1LEs5Nm20IYgqpLxxsdk6+DKh05Syd
 NUJhXOcUrTmYQIjLbBnheZyGOnXi136Xsn+4TnYFlOiBy3WwabxbuwnvVZXojNdCvYpX
 KmqWfY6UesP/WBlzhsBWVKtz3uz7hLTVgBW7wiFffYLhLWOxsmt7iGCPAmb1GGL6C8qy
 Dxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+YmqX+iFmzpuLC39YXH9ihsyFQ9/x2YtAd8ekMEk1P4=;
 b=LYKRLkeeBB5C5c7h65f0VHUDdIpxWDckRYwSEXhHb1d51K9/IvtABo8Xsu37Ez96M/
 YOBxC1aBraO6285M4FH2x4+K4K00ZWxcaNTWH5Wa6bALxh7g61NmKAv6iaE877cHhd5Y
 q5/tJ+q9n0zcKuEcTx/PAy4ttxzwXJEeWEmGs8fHgOxigh5Ird07XckNnowG2wJvI/zy
 NzrgiZHMQ2/xA9nhe/RKg/2qFHLlFpUgdRmY4UGeweb9c3sodIY57/h2DTJWQFsfqiNI
 gP+f+yADX9P+TphI+sPi5Oz7LnShrUEhA2/yyzld4uP1BCrD9cbMeawVCPxx/JVMjJAC
 ugZQ==
X-Gm-Message-State: AGi0PuZbZJQosfArsdJXCND65UXGe+dcEu09ZwkHPebrtUrYbR5jS8RT
 uz5tKKirC0xD1fnjul0gSEUQJqGZ
X-Google-Smtp-Source: APiQypJFfT+ZVr/A+zJExA0JobhrC5QJlw6Qejjejt47a7VNU8AgLabKwrMIMEzxMtC57bhDFby7Vw==
X-Received: by 2002:a62:64c9:: with SMTP id y192mr25444512pfb.26.1586907312823; 
 Tue, 14 Apr 2020 16:35:12 -0700 (PDT)
Received: from localhost.ibm.com ([220.240.137.199])
 by smtp.gmail.com with ESMTPSA id i187sm11987996pfc.112.2020.04.14.16.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 16:35:12 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv/pci: Add an explaination for
 PNV_IODA_PE_BUS_ALL
Date: Wed, 15 Apr 2020 09:35:02 +1000
Message-Id: <20200414233502.758-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's pretty obsecure and confused me for a long time so I figured it's
worth documenting properly.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index a8cde70..51c254f2 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -33,6 +33,24 @@ enum pnv_phb_model {
 #define PNV_IODA_PE_SLAVE	(1 << 4)	/* Slave PE in compound case	*/
 #define PNV_IODA_PE_VF		(1 << 5)	/* PE for one VF 		*/
 
+/*
+ * A brief note on PNV_IODA_PE_BUS_ALL
+ *
+ * This is needed because of the behaviour of PCIe-to-PCI bridges. The PHB uses
+ * the Requester ID field of the PCIe request header to determine the device
+ * (and PE) that initiated a DMA. In legacy PCI individual memory read/write
+ * requests aren't tagged with the RID. To work around this the PCIe-to-PCI
+ * bridge will use (secondary_bus_no << 8) | 0x00 as the RID on the PCIe side.
+ *
+ * PCIe-to-X bridges have a similar issue even though PCI-X requests also have
+ * a RID in the transaction header. The PCIe-to-X bridge is permitted to "take
+ * ownership" of a transaction by a PCI-X device when forwarding it to the PCIe
+ * side of the bridge.
+ *
+ * To work around these problems we use the BUS_ALL flag since every subordinate
+ * bus of the bridge should go into the same PE.
+ */
+
 /* Indicates operations are frozen for a PE: MMIO in PESTA & DMA in PESTB. */
 #define PNV_IODA_STOPPED_STATE	0x8000000000000000
 
-- 
2.9.5

