Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5434F502A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:50:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478l8d0ZlbzF50Z
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:50:09 +1100 (AEDT)
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
 header.b="O/6AGo/Z"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gRB0Ll4zF6wZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:30 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id d6so4019436lfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eoU6yRz6gH6qOWyRe/vJLGf2pgvTpCjyg96xNihJCPI=;
 b=O/6AGo/ZGsFlsmLzJdyEPO3mV8xhZwNRXLRrD1SwfTKq6IMDjQUNw7j0VpK1oVFyLL
 wc5e8wLviGXZ87K0ZB9XM3865S7c5VlogZhWCTbefzWUbe06CEYaPSev0sIHG2QmP0NR
 92+WT/4laZ948//hxG0mEeosoGrg8VxvjMNyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eoU6yRz6gH6qOWyRe/vJLGf2pgvTpCjyg96xNihJCPI=;
 b=Po9FhWtpLiSDPwHG4VW4IaJs1QOOdyC1hDq6M4lB+HHXkuFKtn+vFAu54bpA4DnTVF
 1K4g1Xb4oPVs1JSFr8HViBK8lWlZAq8wC0WFssioNQkOTm5vhBZDZDyLnWqgqRMY+WXd
 bCMuW0ZVu8H0SaFLX0U0frd1UBQ5Ed0pgkt/a63GNbImio/z3WhddlA7TCXD3R/i4yXK
 n/YQz/YJy24kRT6sf6Oe+013ZmI4hVvt7letJPO4ymebFSo9afbzbo9Ou1Vlaf8+4dDc
 eAjAVjTrYCTCklipKzClkHcjVoDwTpL8Q02N0Fuprgq4d3WZU2C/zYLP8ESnLpY9sALo
 9ciQ==
X-Gm-Message-State: APjAAAUZA2OGevOL5ynYK2sgOtrfEcYMnxQqQal4t9WEymw8cavQRlx7
 w7x6gxHJr3gadj7Z5eG5XoQsrg==
X-Google-Smtp-Source: APXvYqwxS6IOvsV8gHqknaTDjoYrWzUraN+5B9FEomuPHvbNlLsU0KSDBbHmOzMq8nrZpelvp/lTbQ==
X-Received: by 2002:ac2:5097:: with SMTP id f23mr6576512lfm.90.1573218146378; 
 Fri, 08 Nov 2019 05:02:26 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:02:25 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 47/47] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
Date: Fri,  8 Nov 2019 14:01:23 +0100
Message-Id: <20191108130123.6839-48-linux@rasmusvillemoes.dk>
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

There are also ARM and ARM64 based SOCs with a QUICC Engine, and the
core QE code as well as net/wan/fsl_ucc_hdlc and tty/serial/ucc_uart
has now been modified to not rely on ppcisms.

So extend the architectures that can select QUICC_ENGINE, and add the
rather modest requirements of OF && HAS_IOMEM.

The core code as well as the ucc_uart driver has been tested on an
LS1021A (arm), and it has also been tested that the QE code still
works on an mpc8309 (ppc).

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index cfa4b2939992..f1974f811572 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -5,7 +5,8 @@
 
 config QUICC_ENGINE
 	bool "QUICC Engine (QE) framework support"
-	depends on FSL_SOC && PPC32
+	depends on OF && HAS_IOMEM
+	depends on PPC32 || ARM || ARM64 || COMPILE_TEST
 	select GENERIC_ALLOCATOR
 	select CRC32
 	help
-- 
2.23.0

