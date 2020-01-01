Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D70DC12E018
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2020 19:32:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47p0C66VWhzDqBr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2020 05:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inria.fr (client-ip=192.134.164.104;
 helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inria.fr
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47p04D65XDzDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2020 05:26:36 +1100 (AEDT)
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; d="scan'208";a="334542281"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 01 Jan 2020 19:26:25 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 10/10] powerpc/powernv: use resource_size
Date: Wed,  1 Jan 2020 18:49:50 +0100
Message-Id: <1577900990-8588-11-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
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
Cc: Paul Mackerras <paulus@samba.org>, kernel-janitors@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@ struct resource ptr; @@
- (ptr.end - ptr.start + 1)
+ resource_size(&ptr)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/powerpc/platforms/powernv/pci-ioda.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index da1068a9c263..364140145ce0 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -792,7 +792,7 @@ static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 		fcomp = OPAL_IGNORE_RID_FUNCTION_NUMBER;
 		parent = pe->pbus->self;
 		if (pe->flags & PNV_IODA_PE_BUS_ALL)
-			count = pe->pbus->busn_res.end - pe->pbus->busn_res.start + 1;
+			count = resource_size(&pe->pbus->busn_res);
 		else
 			count = 1;
 
@@ -874,7 +874,7 @@ static int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 		fcomp = OPAL_IGNORE_RID_FUNCTION_NUMBER;
 		parent = pe->pbus->self;
 		if (pe->flags & PNV_IODA_PE_BUS_ALL)
-			count = pe->pbus->busn_res.end - pe->pbus->busn_res.start + 1;
+			count = resource_size(&pe->pbus->busn_res);
 		else
 			count = 1;
 

