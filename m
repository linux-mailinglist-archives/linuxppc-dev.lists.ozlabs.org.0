Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87962EC482
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 15:18:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474PRg3TSwzF4nR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 01:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="OHZGBP1T"; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474MKn1Ln2zF5CY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 23:42:53 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id g3so4005252ljl.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UljkrHErTTnMZOnzGC3cVx/3LEJEQ4UWt74UluMX0lk=;
 b=OHZGBP1TBQfvAP3vjunmLBhfNF02xeHIP7Z4YLcGpteSui6uUZ8cI8v7DR2EY9/BCx
 /3owyBaDZ2Gd2fli4JuN+3IgLGgFzsDaImq3Vsqm51EFCVUaX6ilJa2+PUc2BYjusPhN
 Dol3W59JbHgfpwUAyWr3hYt83wZJbYJzIYXTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UljkrHErTTnMZOnzGC3cVx/3LEJEQ4UWt74UluMX0lk=;
 b=Sm7S5PMdniK6lt/RtrB4HzSmBEkAoimXpjDBzlTrRkwTfF7QbCY4U26P7mlxElv7dX
 7zmv60/yDc5d/Ytb9PEQFjvSGf28VnIkweImGoO0kulmYa3jNEuYCbklgA7uRJQczQjh
 I3TuQy5GcQW7+tsRRuFPHvk4ZSjjWONaZhPmw+RM8MTrRQFmOZ2eXKY4FWkN/iPlXnlT
 BVvjdScKe8OruEK/Dsc8vOOQPpG+K9Y8iESpJBmMCVMk2vcM/rirm9topp6i+0tDTO0O
 FQJOuaCsiKjkKcybBu2rd3WZLJ6Js0P72KkAWH7dbE4FFI+mWoNy2SgJg57BmU+lUmvp
 vpRA==
X-Gm-Message-State: APjAAAUEEPNHrLSmZGxM3kqaORexcjn7WvT4SVc8RTNqEdslHtXv5RhO
 0vpvsZpcwYAhnLqsjE3NZPBQbw==
X-Google-Smtp-Source: APXvYqy0SISrUEfxbTNa4aExJBg3oQJd6fkt7CSidNJBY4f3WIpx0ZRsrM9/V23RU58OsjkGftFV5w==
X-Received: by 2002:a2e:7204:: with SMTP id n4mr580399ljc.139.1572612166096;
 Fri, 01 Nov 2019 05:42:46 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o26sm2458540lfi.57.2019.11.01.05.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 05:42:45 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 25/36] soc: fsl: qe: qe_io.c: use of_property_read_u32() in
 par_io_init()
Date: Fri,  1 Nov 2019 13:41:59 +0100
Message-Id: <20191101124210.14510-26-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101124210.14510-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
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

This is necessary for this to work on little-endian hosts.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_io.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
index 61dd8eb8c0fe..11ea08e97db7 100644
--- a/drivers/soc/fsl/qe/qe_io.c
+++ b/drivers/soc/fsl/qe/qe_io.c
@@ -28,7 +28,7 @@ int par_io_init(struct device_node *np)
 {
 	struct resource res;
 	int ret;
-	const u32 *num_ports;
+	u32 num_ports;
 
 	/* Map Parallel I/O ports registers */
 	ret = of_address_to_resource(np, 0, &res);
@@ -36,9 +36,8 @@ int par_io_init(struct device_node *np)
 		return ret;
 	par_io = ioremap(res.start, resource_size(&res));
 
-	num_ports = of_get_property(np, "num-ports", NULL);
-	if (num_ports)
-		num_par_io_ports = *num_ports;
+	if (!of_property_read_u32(np, "num-ports", &num_ports))
+		num_par_io_ports = num_ports;
 
 	return 0;
 }
-- 
2.23.0

