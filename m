Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFD539F33
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 10:20:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LChss1PQpz3cFr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 18:20:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=o6iTqo28;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=o6iTqo28;
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LChrs34KKz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 18:19:41 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 97F79240009;
	Wed,  1 Jun 2022 08:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654071573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gPI47XC9OtqT4bQ9DbJLoCocyaCj0Ouilt5roec+84k=;
	b=o6iTqo28Xqs6KtnHgCDjk5nBtVxArCq9giMQSB+f+HdYoa9gm/3y5cd6Kd4j0YAYwJs9KE
	jOK8bn07Z2l4TLjAvJdwbkf9RtN8ETVakOQm6rqBsC6RiFlT1cacBoOfrg1KzOWGB2m8z9
	UqvRV7Ewn6ffhzoAjEKlKbjZ/WTKZypZZldTIbTzTrgEF1Hdvnd+2OHEhuoGXycDR1YRJ0
	6yFGcd80dFg+guNHLh1+8fqowPuuzX2G5N9rnDHmA+QhxnjpqYTtY/2TP2W1g5Pz1md677
	4oe/4/Zg+QPXSHnKJbxfQG6XZN7FogKxvbUyxT9iV4OrQaCIYmnVg+7sjlwQSw==
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Nathan Lynch <nathanl@linux.ibm.com>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Ohhoon Kwon <ohoono.kwon@samsung.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v2 1/4] of: constify of_property_check_flags() prop argument
Date: Wed,  1 Jun 2022 10:17:58 +0200
Message-Id: <20220601081801.348571-2-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220601081801.348571-1-clement.leger@bootlin.com>
References: <20220601081801.348571-1-clement.leger@bootlin.com>
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>, Steen Hegelund <steen.hegelund@microchip.com>, linux-kernel@vger.kernel.org, Lizhi Hou <lizhi.hou@xilinx.com>, Allan Nielsen <allan.nielsen@microchip.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org, Horatiu Vultur <horatiu.vultur@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This argument is not modified and thus can be set as const.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 include/linux/of.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index f0a5d6b10c5a..d74fd82a6963 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -207,7 +207,7 @@ static inline void of_node_clear_flag(struct device_node *n, unsigned long flag)
 }
 
 #if defined(CONFIG_OF_DYNAMIC) || defined(CONFIG_SPARC)
-static inline int of_property_check_flag(struct property *p, unsigned long flag)
+static inline int of_property_check_flag(const struct property *p, unsigned long flag)
 {
 	return test_bit(flag, &p->_flags);
 }
@@ -814,7 +814,8 @@ static inline void of_node_clear_flag(struct device_node *n, unsigned long flag)
 {
 }
 
-static inline int of_property_check_flag(struct property *p, unsigned long flag)
+static inline int of_property_check_flag(const struct property *p,
+					 unsigned long flag)
 {
 	return 0;
 }
-- 
2.36.0

