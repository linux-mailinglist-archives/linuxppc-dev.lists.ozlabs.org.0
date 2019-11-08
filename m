Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5501F4D00
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 14:19:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478gq74BSRzF3lL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 00:19:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="arBXPaYv"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gQ86tntzF6t8
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:01:36 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id j14so4393156lfb.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KoynnpqyM2T+oZqn3mX12olVYK6D1zjkp8rnCkTSUvs=;
 b=arBXPaYvk7b9VQYEk27Lbsm2eaj47OMjYlVYaqSiH0ymjHtJ0z8jMJOs56Fvd8UuBJ
 NKk3dJoZqQrq8Qd6neEX/y/JOno76+Cbx1L38NbXMark/8C5i8DIGjC8HDXiz6AkmhZZ
 Zs4D4v6HFqp/TvlK8kAms9Xw0N+CDuG7slgBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KoynnpqyM2T+oZqn3mX12olVYK6D1zjkp8rnCkTSUvs=;
 b=luo7mTCg8IZxNHcRvffd6fAAdZjYIDSwreSp4eXVLyskEoIldLFsQBKEIRpUGxTeEA
 39HZKso4cn4V9hYINDwMiM8tyx1rWHI9Tj4l3bLJv0ZuAjNTjch5eVsiJN/nfNY0wbR7
 l3amaag0j/2hO/z2MRi1yIH+JJ0dkzbjsBLlWbV6xexrYPv4gEDQHq8jiCF+e7MzLPVd
 ToK8IJS+dTbn2clG6DPFMDMSMdIRjtsJZzGI1SD+qffxvTt5hMVmT9xc7A+xSXOLQfLT
 nfnhaYJHsBBfIVwOskbzMLvTpndTj27qRIkKVDaJ08sLWosb1jVHSAG48sb4dvZuOPvV
 DAoA==
X-Gm-Message-State: APjAAAVn+5UNQmOo0DZGFAONhDu8LvHHy4QGt1izb4YvRJQ+Eq+NVjz3
 l/b0SR+mzFxgthwbFZvnexY3zw==
X-Google-Smtp-Source: APXvYqw8ntNr9Y7KtuD0WwqwQ/l6wehUmvqisdSJSXgT0uYQXoY9XMkvlc3TmtbKf6RhjcbTykfXxg==
X-Received: by 2002:a19:f107:: with SMTP id p7mr6501640lfh.91.1573218092860;
 Fri, 08 Nov 2019 05:01:32 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:01:32 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 04/47] soc: fsl: qe: introduce qe_io{read,write}* wrappers
Date: Fri,  8 Nov 2019 14:00:40 +0100
Message-Id: <20191108130123.6839-5-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
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
Cc: Scott Wood <oss@buserror.net>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The QUICC engine drivers use the powerpc-specific out_be32() etc. In
order to allow those drivers to build for other architectures, those
must be replaced by iowrite32be(). However, on powerpc, out_be32() is
a simple inline function while iowrite32be() is out-of-line. So in
order not to introduce a performance regression on powerpc when making
the drivers work on other architectures, introduce qe_io* helpers.

Also define the qe_{clr,set,clrset}bits* helpers in terms of these new
macros.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 include/soc/fsl/qe/qe.h | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index a1aa4eb28f0c..9cac04c692fd 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -241,21 +241,37 @@ static inline int qe_alive_during_sleep(void)
 #define qe_muram_offset cpm_muram_offset
 #define qe_muram_dma cpm_muram_dma
 
-#define qe_setbits_be32(_addr, _v) iowrite32be(ioread32be(_addr) |  (_v), (_addr))
-#define qe_clrbits_be32(_addr, _v) iowrite32be(ioread32be(_addr) & ~(_v), (_addr))
+#ifdef CONFIG_PPC32
+#define qe_iowrite8(val, addr)     out_8(addr, val)
+#define qe_iowrite16be(val, addr)  out_be16(addr, val)
+#define qe_iowrite32be(val, addr)  out_be32(addr, val)
+#define qe_ioread8(addr)           in_8(addr)
+#define qe_ioread16be(addr)        in_be16(addr)
+#define qe_ioread32be(addr)        in_be32(addr)
+#else
+#define qe_iowrite8(val, addr)     iowrite8(val, addr)
+#define qe_iowrite16be(val, addr)  iowrite16be(val, addr)
+#define qe_iowrite32be(val, addr)  iowrite32be(val, addr)
+#define qe_ioread8(addr)           ioread8(addr)
+#define qe_ioread16be(addr)        ioread16be(addr)
+#define qe_ioread32be(addr)        ioread32be(addr)
+#endif
+
+#define qe_setbits_be32(_addr, _v) qe_iowrite32be(qe_ioread32be(_addr) |  (_v), (_addr))
+#define qe_clrbits_be32(_addr, _v) qe_iowrite32be(qe_ioread32be(_addr) & ~(_v), (_addr))
 
-#define qe_setbits_be16(_addr, _v) iowrite16be(ioread16be(_addr) |  (_v), (_addr))
-#define qe_clrbits_be16(_addr, _v) iowrite16be(ioread16be(_addr) & ~(_v), (_addr))
+#define qe_setbits_be16(_addr, _v) qe_iowrite16be(qe_ioread16be(_addr) |  (_v), (_addr))
+#define qe_clrbits_be16(_addr, _v) qe_iowrite16be(qe_ioread16be(_addr) & ~(_v), (_addr))
 
-#define qe_setbits_8(_addr, _v) iowrite8(ioread8(_addr) |  (_v), (_addr))
-#define qe_clrbits_8(_addr, _v) iowrite8(ioread8(_addr) & ~(_v), (_addr))
+#define qe_setbits_8(_addr, _v) qe_iowrite8(qe_ioread8(_addr) |  (_v), (_addr))
+#define qe_clrbits_8(_addr, _v) qe_iowrite8(qe_ioread8(_addr) & ~(_v), (_addr))
 
 #define qe_clrsetbits_be32(addr, clear, set) \
-	iowrite32be((ioread32be(addr) & ~(clear)) | (set), (addr))
+	qe_iowrite32be((qe_ioread32be(addr) & ~(clear)) | (set), (addr))
 #define qe_clrsetbits_be16(addr, clear, set) \
-	iowrite16be((ioread16be(addr) & ~(clear)) | (set), (addr))
+	qe_iowrite16be((qe_ioread16be(addr) & ~(clear)) | (set), (addr))
 #define qe_clrsetbits_8(addr, clear, set) \
-	iowrite8((ioread8(addr) & ~(clear)) | (set), (addr))
+	qe_iowrite8((qe_ioread8(addr) & ~(clear)) | (set), (addr))
 
 /* Structure that defines QE firmware binary files.
  *
-- 
2.23.0

