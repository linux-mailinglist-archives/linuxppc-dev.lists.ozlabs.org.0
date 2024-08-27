Return-Path: <linuxppc-dev+bounces-606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6289608F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 13:39:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtQY34M73z2yhR;
	Tue, 27 Aug 2024 21:38:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724758727;
	cv=none; b=C3FiC/0BNHAF+qKQ7B4+MjOkuDLjNrxErVlTlRGM6rJCadDdLlIt+1r44+zuXdUf7cEVxzAeatgS+MQHv/fkavRBZW8PsI2lZWXlMIMHe7Kgq8UmQIZwNg86O9vc4jW3gSKoZZPaPs38W/cWopKrd5II4mRgfdbDY+Qn4ZJg3ELmZiIS4wpqZlZ9BRUpgwoGK4JmuJqrouEo8qAGEFx/S768vlLgZN9L++mJfSmwK8pTp9WWXmkJcKwDtg1RngWgNpSjdDhFKk7eVT4xZCzMth1gjc+YLsNSdMUn3FYC8Fr7TRbCXh9+dIl/OclyR9RoMoBnnWV8iaX3ICLPIwinoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724758727; c=relaxed/relaxed;
	bh=RmI/Xg1AFnxD4Yy5w5fyH9m06SUAmvD8eY0ep/60C7c=;
	h=Received:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy; b=CS7ILxZkiSuRatMRSqRn+c3zJ1s0x92unOgo4L2zJjMHgvflWIc3ixTNViMadeS3JrTQX51Qnt5MgsqCBsa20raxQJWzgkEwcm/c5Lnx+sKgMoBfspNm3gyc+FWtmeoNkzhx1FBzj68hJwLxH+Ts4KAS7bMuzdJjuEnsweyEFMJXWan32yswNNsjsMtwuaP0JpUoXKwXH6DEw6d6XTdwTpF2+baZ3NbH4WI51aDXkz7BEzmo1l9xEylGOoaI76mlGFjJ92IybZtXFv896xMqBE8xq+hP6LkuBCwOQ8Jj9t5AwG+BlnDGEQHCi8PFUwKI/F0+U55XWpyJPTh3M2VAQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtQY31GJyz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 21:38:47 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WtQWS6HGQzyQYJ;
	Tue, 27 Aug 2024 19:37:24 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 0FFB6140137;
	Tue, 27 Aug 2024 19:38:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <andrew@lunn.ch>, <sebastian.hesselbarth@gmail.com>,
	<gregory.clement@bootlin.com>, <herve.codina@bootlin.com>,
	<qiang.zhao@nxp.com>, <christophe.leroy@csgroup.eu>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <nm@ti.com>,
	<ssantosh@kernel.org>, <petlozup@nvidia.com>, <pshete@nvidia.com>,
	<ruanjinjie@huawei.com>, <christophe.jaillet@wanadoo.fr>,
	<ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-tegra@vger.kernel.org>, <krzk@kernel.org>, <jic23@kernel.org>
Subject: [PATCH -next 0/8] soc: Simplify with scoped for each OF child loop and dev_err_probe()
Date: Tue, 27 Aug 2024 19:45:59 +0800
Message-ID: <20240827114607.4019972-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use for_each_child_of_node_scoped() to simplify code.

Jinjie Ruan (8):
  soc: fsl: cpm1: Simplify with scoped for each OF child loop
  soc: fsl: cpm1: Simplify with dev_err_probe()
  soc: fsl: cpm1: qmc: Simplify with scoped for each OF child
  soc: fsl: cpm1: qmc: Simplify with dev_err_probe()
  soc/tegra: pmc: Simplify with scoped for each OF child loop
  soc: dove: Simplify with scoped for each OF child loop
  soc: ti: knav_dma: Simplify with scoped for each OF child loop
  soc: ti: knav_qmss_queue: Simplify with scoped for each OF child loop

 drivers/soc/dove/pmu.c           |  9 ++--
 drivers/soc/fsl/qe/qmc.c         | 66 ++++++++---------------
 drivers/soc/fsl/qe/tsa.c         | 90 ++++++++++----------------------
 drivers/soc/tegra/pmc.c          | 12 ++---
 drivers/soc/ti/knav_dma.c        | 16 ++----
 drivers/soc/ti/knav_qmss_queue.c | 57 +++++++-------------
 6 files changed, 80 insertions(+), 170 deletions(-)

-- 
2.34.1


