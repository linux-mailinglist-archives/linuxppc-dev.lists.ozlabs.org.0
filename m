Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 559816ACAC0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 18:37:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVm3z1g38z3f3v
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 04:37:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=KpZ/1BX9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=KpZ/1BX9;
	dkim-atps=neutral
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVm344B3bz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 04:36:32 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 958C937E2D60D1;
	Mon,  6 Mar 2023 11:30:42 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id HYDUPU0u9TJI; Mon,  6 Mar 2023 11:30:42 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 33B8537E2D60CE;
	Mon,  6 Mar 2023 11:30:42 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 33B8537E2D60CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1678123842; bh=kiK4u61n03Ewv9GiwNQjcFB9//YPBFFbrjx8hSx1Y+c=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=KpZ/1BX9ebbx6jGZSpuBBOBFbjFdvhoRBWG9+oBSQ+x4DVjNAuBhynoMcXBJ0WxBU
	 8kpfHHKMxWt77SgaObYmZNhveYByVYGIqNOo+fXDiR1HaUiu5pLHnlSrEle2YkruTt
	 b04EhKOKwc0jfOXQnIddNfibXi1qpWzHOd2jzBr4=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BL7M-Xkg8qh2; Mon,  6 Mar 2023 11:30:42 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 1362237E2D60C8;
	Mon,  6 Mar 2023 11:30:42 -0600 (CST)
Date: Mon, 6 Mar 2023 11:30:42 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: kvm <kvm@vger.kernel.org>
Message-ID: <12303156.16998521.1678123842049.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2 2/4] powerpc/pci_64: Init pcibios subsys a bit later
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC110 (Linux)/8.5.0_GA_3042)
Thread-Index: xJigH1RzbFL1MLjO/JsgLFkXazYTjQ==
Thread-Topic: powerpc/pci_64: Init pcibios subsys a bit later
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following patches are going to add dependency/use of iommu_ops which
is initialized in subsys_initcall as well.

This moves pciobios_init() to the next initcall level.

This should not cause behavioral change.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/pci_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index fd42059ae2a5..e27342ef128b 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -73,7 +73,7 @@ static int __init pcibios_init(void)
 	return 0;
 }
 
-subsys_initcall(pcibios_init);
+subsys_initcall_sync(pcibios_init);
 
 int pcibios_unmap_io_space(struct pci_bus *bus)
 {
-- 
2.30.2
