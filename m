Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1F219741F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 07:55:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rM9v19b2zDqNT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 16:54:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=d-silva.org (client-ip=66.55.73.32;
 helo=ushosting.nmnhosting.com; envelope-from=alastair@d-silva.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256
 header.s=201810a header.b=bMbioP7E; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48rM7P5jGVzDqKr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 16:52:49 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id BB2D52DC6849;
 Mon, 30 Mar 2020 16:52:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585547566;
 bh=usgtpWwfPqN3Po8Erc64Din9rr6Mrn4qoxSsihnBfcI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bMbioP7EtdRIN7Psu7rzMUpwa2C/X6QC4z279/qrlgZqOuYGPlOwaH67cXt1O9uFN
 yOjDqQ7nMQ+tvZeiC3hFYQ7HkNgHSBbyXfOcwjqnoGGaTF/NmFZa/cZdks4yFx1rMN
 SY8i1g6ylE1zIvnQ4+BlwncOv6lIg8IPtu7wxpS04cV44QA+KZi2iMEu6bwkTuOfof
 Y49t6MWeq96LBdLMYXjaSmO54h9U3i1fSUQp5vBqUJ19SIAdr2sm6OAW6Z1Qkuv20U
 7r9tsLXd/jVSP2tx5O3YbfGLhX60JbQU/5G2VTu+b3ndMWAb430Gz2hu8VpwC6JFRp
 0ESQ++Zwi1ehD6oM/g89XDPAa1J5Rnn890kEAlVRB7y46BhGvxZbPZ4Vw9AkNpJsHB
 cMV5R2mdHXLLQgCpbDHpG6zziIq/nLlkrhCrNCg5beqdPmiTucYeBODFIHKReDK02p
 +bTsSrqanwYTuozWj8TiV9BtUYmI6YnNsfpXcEHcUATwh7NBNKNuNIDiN2vKdHC56v
 3MJRPUnWhYZg6Q2eB5TAj14uimXz9l5Y0LlG1MynoP2X+JYl/o4p5ZmKb9I2wE1J6z
 /JOLdd+DdJwF1YHIa2bnFcs514YF3C+C5vK1g2b0TyRT23PrKcfcG1qzvflCD9DxrC
 nzuS2Tu74wUp1I8IUt9lKT1M=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4B0045934;
 Fri, 27 Mar 2020 18:12:20 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 25/25] MAINTAINERS: Add myself & nvdimm/ocxl to ocxl
Date: Fri, 27 Mar 2020 18:12:02 +1100
Message-Id: <20200327071202.2159885-26-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:20 +1100 (AEDT)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The OpenCAPI Persistent Memory driver will be maintained as part ofi
the ppc tree.

I'm also adding myself as an author of the driver & contributor to
the generic ocxl driver.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f8670989ec91..3fb9a9f576a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12064,13 +12064,16 @@ F:	tools/objtool/
 OCXL (Open Coherent Accelerator Processor Interface OpenCAPI) DRIVER
 M:	Frederic Barrat <fbarrat@linux.ibm.com>
 M:	Andrew Donnellan <ajd@linux.ibm.com>
+M:	Alastair D'Silva <alastair@d-silva.org>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
 F:	arch/powerpc/platforms/powernv/ocxl.c
+F:	arch/powerpc/platforms/powernv/pmem/*
 F:	arch/powerpc/include/asm/pnv-ocxl.h
 F:	drivers/misc/ocxl/
 F:	include/misc/ocxl*
 F:	include/uapi/misc/ocxl.h
+F:	include/uapi/nvdimm/ocxl-pmem.h
 F:	Documentation/userspace-api/accelerators/ocxl.rst
 
 OMAP AUDIO SUPPORT
-- 
2.24.1

