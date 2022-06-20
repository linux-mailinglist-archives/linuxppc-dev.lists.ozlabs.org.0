Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DCA55161D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 12:44:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRR8n106Zz3cdB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 20:44:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=CW8ekHH7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=CW8ekHH7;
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRR7k3qCLz3bnR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 20:43:11 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 98C631C000D;
	Mon, 20 Jun 2022 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655721783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8HmuiD0Wo+tdZIhp+vs0Aw78V+tuRHzEd0BRSRg3hb4=;
	b=CW8ekHH70yp2UEX+lty3nRQ6qoZUUHMZTI1U2No9V7IL/svmi6QQJ/sHRHowZszQGjCCnm
	cjd6LjNohWfiQm6jNe+ahzKIVpUurR1lKSaJsYArLloWMsrFTMXGZDx1VSFS07QL2y0xLy
	kjDLz5EIRRO1vKdfOd0nR+6EUHPMYfS96ShrHY5BnIR+5pHymXC01UOIIMLB2u7z/I7ycP
	emM+j4fKyUXZkfe1L3bmcPUfI6cj04BsRrSFM2MY03EYZdujIigjYR4g1jTPbuiTmXmtbw
	gUdwW/hQIdmjSjjlW7GL496TRZ/T9ZxuzdvsjkqYr5Gqng3vKp7/hfwCnegYyQ==
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
Subject: [PATCH v3 0/5] of: add of_property_alloc/free() and of_node_alloc()
Date: Mon, 20 Jun 2022 12:41:18 +0200
Message-Id: <20220620104123.341054-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.36.1
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
properties. This code has been more than simply replaced to allow using
of_node_put() rather than a manual deletion of the properties.
Unfortunately, as I don't own a powerpc platform, it would need to be
tested.

---

Changes in V3:
- Remove gfpflag attribute from of_node_alloc() and of_property_alloc().
- Removed allocflags from __of_node_dup().
- Rework powerpc code to only use of_node_put().
- Fix properties free using of_node_property in OF unittests.

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

Clément Léger (5):
  of: constify of_property_check_flags() prop argument
  of: remove __of_node_dup() allocflags parameter
  of: dynamic: add of_property_alloc() and of_property_free()
  of: dynamic: add of_node_alloc()
  powerpc/pseries: use of_property_alloc/free() and of_node_alloc()

 arch/powerpc/platforms/pseries/dlpar.c        |  62 +-------
 .../platforms/pseries/hotplug-memory.c        |  21 +--
 arch/powerpc/platforms/pseries/reconfig.c     | 123 ++++++----------
 drivers/of/dynamic.c                          | 137 ++++++++++++------
 drivers/of/of_private.h                       |  19 ++-
 drivers/of/overlay.c                          |   2 +-
 drivers/of/unittest.c                         |  24 ++-
 include/linux/of.h                            |  24 ++-
 8 files changed, 191 insertions(+), 221 deletions(-)

-- 
2.36.1

