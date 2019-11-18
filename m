Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB64F100456
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 12:37:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gn4z73r5zDqSN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 22:37:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="J+Cxwki/"; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GmmW1SNBzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:23:38 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id w9so19019127wrr.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 03:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KoynnpqyM2T+oZqn3mX12olVYK6D1zjkp8rnCkTSUvs=;
 b=J+Cxwki/d2vafcsbRwzl1HC83/TeBwTy77THog0ctYpfI5nCMfU4IfEqfaZQh+0bjG
 Xr1AOxQ32n7o4XT4k/aiXq2NvB3mbfP+nzB82GzwilkSnj9tGbzRnO+X7p9rVSu6Am8p
 xXAXPP5Sm8ROdcRFtRf8iiXcAVOxWac3eyFac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KoynnpqyM2T+oZqn3mX12olVYK6D1zjkp8rnCkTSUvs=;
 b=C6LhPqoQnDp6GRipQbprIg6gwZ3pxCEn8QOHKaVi811thKAxSoXAVBwmv3KgqD14QH
 I0bEQDmg+NDpy8y1LJqXm55dE2m8U0wgzEW/PywRqxZ+bJmp8GZfKG18FSbd7LJa96EE
 nS60HJpl6EiPGOyCCPflQRPIrfyhL8Q9AMcryNrhipyRBx5sicRIjeIT6ZdXETckr3MI
 tKM8v3ri7sahEjnd/agrYHm7vFdLtdqHk6Xda50/M+9AQW5K4re2rHt9pRybYRcSYA3N
 uIOIdn2cKLfxA44RhZ3U+f3OX7y6NrCDuKMRS24te52KQPW5StrPu+I/x9yqzrL7fovL
 VatQ==
X-Gm-Message-State: APjAAAV2BaimaFVBn4arpAiiosaImZHWxeR/fR/JG9Cs6NoceWxQNxb/
 f6v83et37Z/g/7nrZLYi1j0gXA==
X-Google-Smtp-Source: APXvYqy5y/Lw0eRYVC6/15L8Sq6tO9dk7Qd7al4TRo3JfHEzvHz7TQFlCEhubCymAKhBxCKBg9+97A==
X-Received: by 2002:adf:f048:: with SMTP id t8mr14008877wro.237.1574076215200; 
 Mon, 18 Nov 2019 03:23:35 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id y2sm21140815wmy.2.2019.11.18.03.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:23:34 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 04/48] soc: fsl: qe: introduce qe_io{read,write}* wrappers
Date: Mon, 18 Nov 2019 12:22:40 +0100
Message-Id: <20191118112324.22725-5-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
References: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

