Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DDE539F32
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 10:20:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LChsK5jfWz3bkc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 18:20:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=fUPj3TY7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=fUPj3TY7;
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LChrp4VCLz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 18:19:34 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2A0F424000B;
	Wed,  1 Jun 2022 08:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654071569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fsD9Gd/LrdMMpUsb1FdogmpNtsHzQmr4i3zjYQ36MUs=;
	b=fUPj3TY7zmMxazQ2HzFkAnlCRyUde259vYVb6JU37Fvsu4E5DYlpDl8wKxTRhnb8a1hNwo
	9UwJvRaW1oW+P+apXriPdlbK+WbJPSTo9/jxIjtui7GktC547wOFGtUnUhVh1iuQ68taOD
	QzYYQdZzE4dhe4gOWi87le1gJ6EN4UQWMZJMoDLY0LU2ozlMryGBmdRWxLK4pNdnRUwXIt
	90hvP4iR2tZbp7aoeGWfioKs6PmLaSFTyrdWWbQXWo0kKIc+jHukKcYuVJddUE0pEcE91c
	n4RQH/TAt46scQhwqLYt6utkQc/xVwqMN6q4f4WybMTiQUHdP+RqI1nep1LjYg==
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
Subject: [PATCH v2 0/4] of: add of_property_alloc/free() and of_node_alloc()
Date: Wed,  1 Jun 2022 10:17:57 +0200
Message-Id: <20220601081801.348571-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.36.0
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

In order to be able to create new nodes and properties dynamically from
drivers, add of_property_alloc/free() and of_node_alloc(). These
functions can be used to create new nodes and properties flagged with
OF_DYNAMIC and to free them.

Some powerpc code was already doing such operations and thus, these
functions have been used to replace the manual creation of nodes and
properties.

---

Changes in V2:
- Remove of_node_free()
- Rework property allocation to allocate both property and value with
  1 allocation
- Rework node allocation to allocate name at the same time the node is
  allocated
- Remove extern from definitions
- Remove of_property_alloc() value_len parameter and add more
  explanation for the arguments
- Add a check in of_property_free to check OF_DYNAMIC flag
- Add a commit which constify the property argument of
  of_property_check_flags()

Clément Léger (4):
  of: constify of_property_check_flags() prop argument
  of: dynamic: add of_property_alloc() and of_property_free()
  of: dynamic: add of_node_alloc()
  powerpc/pseries: use of_property_alloc/free() and of_node_alloc()

 arch/powerpc/platforms/pseries/dlpar.c        |  51 +------
 .../platforms/pseries/hotplug-memory.c        |  21 +--
 arch/powerpc/platforms/pseries/reconfig.c     |  45 ++----
 drivers/of/dynamic.c                          | 134 ++++++++++++------
 drivers/of/of_private.h                       |  21 ++-
 include/linux/of.h                            |  25 +++-
 6 files changed, 153 insertions(+), 144 deletions(-)

-- 
2.36.0

