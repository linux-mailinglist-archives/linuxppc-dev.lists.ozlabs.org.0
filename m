Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EFB196AAA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 04:30:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qfgm0zbBzDqhR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 13:29:56 +1100 (AEDT)
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
 header.s=201810a header.b=gd3j0Duo; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48qfdY2mrSzDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 13:27:59 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 5E12D2DC67FE;
 Fri, 27 Mar 2020 18:12:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585293141;
 bh=bEfzXRR0cTBf+yBtWTvEdtXlD5xDUP18rOvIDgiLves=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gd3j0DuoeTtlWmyHUBUazlQ1VFusMIA9aMaYhizfgDpSKt92Sy7qNXsG96bPw/XxL
 9QhMWe73iJYRcKatLqQyH20jrk2zgVkqk6EZ71FermuqUedtDX+/a0Nl0KdpTvyQGX
 TI7AMhz5XxEnv3yAqHVIW9qqxXNSXJloUqB4fVEgjJLPiAyElMs9/sGcUgkKv9wRiT
 pVzWhJmqwR4it0c5Jr1sRPCU+d7RO8j9kbV60yXlW6plmXpocT8DiJaRVac54Kl5bx
 iykZ94QQC1lJiJhk6vSgbqe3hvFn4jc4B7ggDCo3TAcwMB0jDRWxoQ9t48F2xrqoxc
 Uc7oM3knlUNd38QNUCVGzKSnmF0yYLUaLZOpbB6nKsaWWmft6E6+3oQTcHtQjB8Ja/
 f9bmXSMg7fOd70wY0ezYnuB6dFA38AdcPEhax50weTdofK/DbxqRRk+Nn/8pWP3THe
 yfQFCXqYYY7dSVktejI9B3aDo17PWhaE3+ZCC1FDLqmXe9TesqrQPPeQ8B/8Lnk3jm
 +jdLoxFPBf78IBZA6+JcRjRAKDCxDsrWUAW8qhRPf595Us6aILG5DUC852KzjPL4me
 SGVCPNuhRq371astBd/3M8cq2ByQeoJvs2+NtXwgbRW4GSgBLQwfL719g3fE041XB8
 93xnLU1sO4dAMbvZvsnBeSS8=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Ah045934;
 Fri, 27 Mar 2020 18:12:16 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 08/25] ocxl: Emit a log message showing how much LPC memory
 was detected
Date: Fri, 27 Mar 2020 18:11:45 +1100
Message-Id: <20200327071202.2159885-9-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:16 +1100 (AEDT)
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

This patch emits a message showing how much LPC memory & special purpose
memory was detected on an OCXL device.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 drivers/misc/ocxl/config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
index a62e3d7db2bf..69cca341d446 100644
--- a/drivers/misc/ocxl/config.c
+++ b/drivers/misc/ocxl/config.c
@@ -568,6 +568,10 @@ static int read_afu_lpc_memory_info(struct pci_dev *dev,
 		afu->special_purpose_mem_size =
 			total_mem_size - lpc_mem_size;
 	}
+
+	dev_info(&dev->dev, "Probed LPC memory of %#llx bytes and special purpose memory of %#llx bytes\n",
+		 afu->lpc_mem_size, afu->special_purpose_mem_size);
+
 	return 0;
 }
 
-- 
2.24.1

