Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E465C56C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 18:53:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmgMZ1YkDz3c9H
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 04:53:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=Ihpe2FB0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=Ihpe2FB0;
	dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmgJZ3lX4z3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 04:51:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
	In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BINV2dFSCVBzCvqXwBYpyqpW94qGwDmRoeZ4O/ofPkU=; b=Ihpe2FB03Sx53HKMd1dNgWUpmo
	iEpJDJC5BBUoakwJX6HDLFVk+/A9OdJMr7X2sdCc3jwY1FWU8Q40DEFdOtHG4A2n/5e1gy8QNREZM
	SjVAFOZ6WnnTTFnt2Hh34H6bFsN5AhCl7zq03uK4oirZsswHcUkDub7n9pucEEojXxlw/GpL9bbXK
	InorDtpigT12jBI/4R77oFyPBJOWlIF6ehnSxuAj+yJgP5wFxDx/t9C410/OMzXBSdwzwYZDxZixc
	2+sT3NVJ9y+2+QwqN/vsKbr7qhgdm2gOft/2ioDLVbKvngIlcxcQrEQLIX4t7n9pQx/u4IMz+xOVx
	KqN/WY0g==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pClRH-007YIs-QG; Tue, 03 Jan 2023 17:51:03 +0000
Message-Id: <2df879d982809c05b0dfade57942fe03dbe9e7de.1672767868.git.geoff@infradead.org>
In-Reply-To: <cover.1672767868.git.geoff@infradead.org>
References: <cover.1672767868.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Tue, 3 Jan 2023 09:42:16 -0800
Subject: [PATCH v2 1/2] powerpc/ps3: Change updateboltedpp panic to info
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 03 Jan 2023 17:51:03 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit fdacae8a84024474afff234bdd1dbe19ad597a10 (powerpc: Activate
CONFIG_STRICT_KERNEL_RWX by default) causes ps3_hpte_updateboltedpp()
to be called.  Change the panic statment in ps3_hpte_updateboltedpp()
to a pr_info statement so that bootup can continue.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/platforms/ps3/htab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/ps3/htab.c b/arch/powerpc/platforms/ps3/htab.c
index c27e6cf85272..9de62bd52650 100644
--- a/arch/powerpc/platforms/ps3/htab.c
+++ b/arch/powerpc/platforms/ps3/htab.c
@@ -146,7 +146,7 @@ static long ps3_hpte_updatepp(unsigned long slot, unsigned long newpp,
 static void ps3_hpte_updateboltedpp(unsigned long newpp, unsigned long ea,
 	int psize, int ssize)
 {
-	panic("ps3_hpte_updateboltedpp() not implemented");
+	pr_info("ps3_hpte_updateboltedpp() not implemented");
 }
 
 static void ps3_hpte_invalidate(unsigned long slot, unsigned long vpn,
-- 
2.34.1


