Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B30463BB1EA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 01:12:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJ4NB4nlRz3f1P
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 09:12:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QULguvyZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QULguvyZ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJ4Ml01nPz2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jul 2021 09:12:02 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 353B661375;
 Sun,  4 Jul 2021 23:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625440321;
 bh=xNZHQJvcgNRFaQ8eiwggEpWrLCEadieOmm+NlS87DBc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QULguvyZPxA82Z+hbArm95IH3ck1+A+Pvh1JFaq0k3fuFLTYppOmFFPXPdQVVDWnk
 7bCMqZkUgW75CzhxuYzKRGtgDaDq8doytpTfqgVnWp08/azx4kLawWhTjqggRT6zgU
 LF3+rDBjW/rDErOfZ4GKLUblAS6Wnk8+kwrAYSLSyNUCZWfPIRGm2zTlnwhgjYS3BQ
 X6uDwkirCP08Zp+3gjJ6JAoGRSrxBJaToOuv3QYWFtXLvDkqyrnlWXflhSyv7CJ5q0
 0rTC5Tu2dwkwSZSuWsWERzNwWMB8UMGyDaErZbJCJgz/pRdwmHzIYTagCYqH2uO8se
 bOoRTPFX57ZLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 04/20] crypto: nx - add missing MODULE_DEVICE_TABLE
Date: Sun,  4 Jul 2021 19:11:39 -0400
Message-Id: <20210704231155.1491795-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704231155.1491795-1-sashal@kernel.org>
References: <20210704231155.1491795-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Hulk Robot <hulkci@huawei.com>, Bixuan Cui <cuibixuan@huawei.com>,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bixuan Cui <cuibixuan@huawei.com>

[ Upstream commit 06676aa1f455c74e3ad1624cea3acb9ed2ef71ae ]

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/crypto/nx/nx-842-pseries.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/nx/nx-842-pseries.c b/drivers/crypto/nx/nx-842-pseries.c
index cddc6d8b55d9..2e5b4004f0ee 100644
--- a/drivers/crypto/nx/nx-842-pseries.c
+++ b/drivers/crypto/nx/nx-842-pseries.c
@@ -1086,6 +1086,7 @@ static struct vio_device_id nx842_vio_driver_ids[] = {
 	{"ibm,compression-v1", "ibm,compression"},
 	{"", ""},
 };
+MODULE_DEVICE_TABLE(vio, nx842_vio_driver_ids);
 
 static struct vio_driver nx842_vio_driver = {
 	.name = KBUILD_MODNAME,
-- 
2.30.2

