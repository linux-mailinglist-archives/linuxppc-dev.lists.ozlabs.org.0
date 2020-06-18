Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 329441FE2B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 04:03:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nQGF2VkfzDqxh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 12:03:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=GItDV1A1; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nP8F0XgZzDqnD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 11:13:33 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A80121974;
 Thu, 18 Jun 2020 01:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442810;
 bh=3FCVTIUBK2FrT/pFejJuUW8MW0xWwlLn2woVgszM86s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GItDV1A18buH7DxTDQVPKPpFe26FGjQlqE5zh6cl0jeDMGzv2WQjZviOclyJzuDwS
 ZwIva4l75sxWWNo/+h9+IN+vMPn76871NDY9moTNu6RVFm2tMZNow3l/GrZflhrcaH
 TP7Feb1gOIXjxbafTXIA04xSdm/DVf+UcaQWiadM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 249/388] powerpc/powernv: add NULL check after
 kzalloc
Date: Wed, 17 Jun 2020 21:05:46 -0400
Message-Id: <20200618010805.600873-249-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Chen Zhou <chenzhou10@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chen Zhou <chenzhou10@huawei.com>

[ Upstream commit ceffa63acce7165c442395b7d64a11ab8b5c5dca ]

Fixes coccicheck warning:

./arch/powerpc/platforms/powernv/opal.c:813:1-5:
	alloc with no test, possible model on line 814

Add NULL check after kzalloc.

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200509020838.121660-1-chenzhou10@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powernv/opal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 2b3dfd0b6cdd..d95954ad4c0a 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -811,6 +811,10 @@ static int opal_add_one_export(struct kobject *parent, const char *export_name,
 		goto out;
 
 	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
+	if (!attr) {
+		rc = -ENOMEM;
+		goto out;
+	}
 	name = kstrdup(export_name, GFP_KERNEL);
 	if (!name) {
 		rc = -ENOMEM;
-- 
2.25.1

