Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 199BC51AEEA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:20:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktp9Z0Jwfz3cgL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 06:20:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dpXoNiNn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240;
 helo=mslow1.mail.gandi.net; envelope-from=clement.leger@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dpXoNiNn; dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KthBG5t5jz3bdC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 01:50:46 +1000 (AEST)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 8F6A8C964C
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 15:42:13 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5C93640012;
 Wed,  4 May 2022 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651678921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2uwE18lvQXGT+MV4DaiAsxn2e6wCWwqahOsIaa5OmaM=;
 b=dpXoNiNnHoTEgi2anyHIOlRxTKdUdoCcBE4AOUNKSbZ7q4lmtUqAcbev/Hn2l0PkyBslQy
 K3dXSLM0m95kki4zL31F1DZLzLuFzgSPE1GotvHNbqLb+IJv0RQPB96+PF5NmFpXco8Hjg
 sHLALex2BxwPMY3KS/FHok0EBEyVhw3JUwxO/Y6GzlS24WJ3COpoHDNyFHidj+qvNdYbGg
 RJGJCJXcUvYZKT6aSW/57wGku2rLotH6CGwbLoTNrfUwKcPb6h0PgyrBKUXSWeNv6f4tlo
 c5VtSkchhavu64cUsgDcZ1xJVJJh3qINYafdcb5G+GrpPTE9B62W67+FeGJseA==
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH 0/3] of: add of_property_alloc/free() and of_node_alloc/free()
Date: Wed,  4 May 2022 17:40:30 +0200
Message-Id: <20220504154033.750511-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 May 2022 06:17:57 +1000
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Steen Hegelund <steen.hegelund@microchip.com>, linux-kernel@vger.kernel.org,
 Allan Nielsen <allan.nielsen@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org,
 Horatiu Vultur <horatiu.vultur@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to be able to create new nodes and properties dynamically from
drivers, add of_property_alloc/free() and of_node_alloc/free(). These
functions can be used to create new nodes and properties flagged with
OF_DYNAMIC and to free them.

Some powerpc code was already doing such operations and thus, these
functions have been used to replace the manual creation of nodes and
properties.

Clément Léger (3):
  of: dynamic: add of_property_alloc() and of_property_free()
  of: dynamic: add of_node_alloc() and of_node_free()
  powerpc/pseries: use of_property_*() and of_node_*() functions

 arch/powerpc/platforms/pseries/dlpar.c        |  51 +-----
 .../platforms/pseries/hotplug-memory.c        |  27 +--
 arch/powerpc/platforms/pseries/reconfig.c     |  44 ++---
 drivers/of/dynamic.c                          | 160 +++++++++++++-----
 include/linux/of.h                            |  25 +++
 5 files changed, 166 insertions(+), 141 deletions(-)

-- 
2.34.1

