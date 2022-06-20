Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD5A551628
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 12:44:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRR9J4BqXz3dsX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 20:44:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kypU7yXQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kypU7yXQ;
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRR7k3gpXz3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 20:43:11 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DE50D1C000B;
	Mon, 20 Jun 2022 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655721787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXHVUeNmneDajw+ibD51KpGlnvzBH9kCBPP2HDS3q8I=;
	b=kypU7yXQ/FHnAbnNy+uO0irNGl56e/VaBhr5vCfPYqeQgWB87sR9f4AzcGFNYJzwdeqKDj
	ni1+AxV6u6bhZpMqIvrlCITEXOircgyRFMQfEH/n8z5batTGeXPKfctmkyTSuxVd8JdOUU
	XvgF3MCbeEmvfcKO8vlUiEipFZxN6NOIX70T6w2Jh+nTE5FGLdMs/BqmtvAC9Pt5RAH871
	/IDH2CJbe65iniX9xUscqS5fSk8ZGxhpEWflf0hKierDj5fUYL2aMdyY4SvEg+yzrstnA9
	hxglqyxDbLdn9xgbGks+B629Z9y05eQEujsByK6V89/b3fjYcpOE5lsXaCu+8Q==
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
Subject: [PATCH v3 1/5] of: constify of_property_check_flags() prop argument
Date: Mon, 20 Jun 2022 12:41:19 +0200
Message-Id: <20220620104123.341054-2-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620104123.341054-1-clement.leger@bootlin.com>
References: <20220620104123.341054-1-clement.leger@bootlin.com>
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
2.36.1

