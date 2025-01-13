Return-Path: <linuxppc-dev+bounces-5181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE6A0BEBD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 18:19:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWzWs5ZKJz3cmr;
	Tue, 14 Jan 2025 04:19:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.18.0.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736788761;
	cv=none; b=a5EGyhry9pI3Cz5YMQ0jHtUFVEe8qoUy7iAz04We6+B6rOccnYmg6ru6Vpl43hXIEn4x4QEpmfeCTiIFrHVGVAQD+9rZZXNSKyQarpUc7A5CfmjGdv/ygnqx5xPPQHyxHIygK7T+N1Y4m2BpdFwsArFsgxQZruqghbfyQlKLjRVEFqVOIwTt7yKd2xtHlZpnKHcHigxTnRGSr5vOw0fN0oVlKbTVd04TM0QfYk1ugCZp/TqDgb/vsrvmn8bRPY/ygQsYpmNZXkLdwRaVZs8l6GjXEi40eTZrlC350oomMN+LVllw/2Nfv410s2CRXQssR8cWPlrf9aLR1wDrXtU3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736788761; c=relaxed/relaxed;
	bh=T48R+Jt5s7mbtTulQr4CETUNI46CBtf2jMCYWuw8YZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AiIk4QguDVPYv6Y31jSKx2FRhEx8fibrUAqIG/J0Gw8YMNPEponT8cbBQ9Cr+SohPFzJIPP0CgKTkJeSqcnDV0S6lpm0JUzfayi13zw12Yf/ndsp/rifO3Ptl0Q4yrOKhUajJ0rnCZznnPcx9oNoxDB/4Se02h1ygeeXGi/nOIkpr5I251VEP10Xvbki9DC/hJV1s/yFLDLhz6VgYAmq6JMDH304r3FMEyobHxuv2DvVptAFPQmDypbDcZXtmubo8NXm7QGyERwdupuEOspZxnTk4oQLqRrIe3Hw2+BaalRYmFeDeGYiRmybt6y1uw308M6KFkYlu7LB/D8wih42KA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=212.18.0.10; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=lists.ozlabs.org) smtp.mailfrom=nefkom.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=lists.ozlabs.org)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWzWq4BSdz3clw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 04:19:17 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4YWzWg3XF3z1syCW;
	Mon, 13 Jan 2025 18:19:10 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4YWzWf4fXdz1qqlS;
	Mon, 13 Jan 2025 18:19:10 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id bKJXdFLjhbnz; Mon, 13 Jan 2025 18:19:09 +0100 (CET)
X-Auth-Info: RJP4YQIDgk2uuS6UlA0k7P2b2CGzg+Atfl66D+TZf71TOBLfLAQ05dRnW2RmzQ+w
Received: from igel.home (aftr-82-135-83-122.dynamic.mnet-online.de [82.135.83.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 13 Jan 2025 18:19:09 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 6C1FE2C1ADE; Mon, 13 Jan 2025 18:19:09 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <robh@kernel.org>, saravanak@google.com, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
Date: Mon, 13 Jan 2025 18:19:09 +0100
Message-ID: <875xmizl6a.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Similar to the PowerMac3,1, the PowerBook6,7 is missing the #size-cells
property on the i2s node.

Depends-on: 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-cells handling")
Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/powerpc/kernel/prom_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 8e776ba39497..24b1523eeea8 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2898,11 +2898,11 @@ static void __init fixup_device_tree_pmac(void)
 	char type[8];
 	phandle node;
 
-	// Some pmacs are missing #size-cells on escc nodes
+	// Some pmacs are missing #size-cells on escc or i2s nodes
 	for (node = 0; prom_next_node(&node); ) {
 		type[0] = '\0';
 		prom_getprop(node, "device_type", type, sizeof(type));
-		if (prom_strcmp(type, "escc"))
+		if (prom_strcmp(type, "escc") && prom_strcmp(type, "i2s"))
 			continue;
 
 		if (prom_getproplen(node, "#size-cells") != PROM_ERROR)
-- 
2.48.0


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

