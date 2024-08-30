Return-Path: <linuxppc-dev+bounces-782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D8965607
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 05:58:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww4Bk0cxCz3045;
	Fri, 30 Aug 2024 13:58:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.35
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724990318;
	cv=none; b=oD5tte+l/2oIEVjodj6tO9HJo0ODomfnAdjDSg1e9dzSkW+iP2P9Uk5X2buFtfnA2rdLPV8eVvAMHBMSn0Ix7YrY+xjtcbQyNKvgJneSJ+ruN3pgf3aPSlTO1Z7l/Hv8iTW9bkNF1Wv2iR6eVgOLoQk7T+y/4CGxaHTD6qJzfmPE1WS3WTQVV5hGyf1tQp6M4ik98vLddx0rqsK2eOcjWNHcKzuCw+zIf+QanLw44kDN/gz92z3AyuB1RudSBRoVIg3j3NjHDx8YbEBmroF9ECX4FuFhaYxHoYNL5q0210/QzbVmLnaJe7C0+J7nrEAn8YQvQLpqHVa+xj2YeoA00w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724990318; c=relaxed/relaxed;
	bh=MhgrHDB1sdpthvh1DxVT5i8160sR2tfQII8zy+lQdn8=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy; b=bUVMsZG62/pdvNyxuuhizRNz5xQP/U8cs9nj7vXAkOgbBXyS2Yu1uidRh8zYmAmWDF6vhEMbD/si+N8qnJVNN0t1zHkjpl5DqCL5mXPJh6cC2kp5tj6AZE7yfeTpuY8TP+t1VSiDScrE4NaJwnLH8Yi7cJhpZ9/EnafJ0/TBqonJ0uiyBMtywpnuSQaYMBe/+ouLiNhxUPnN/LtDREqcBYZOOa58Ra8QUxw/Zjt5awsm42a5jzWp8AlGmmt0cgZvbVEYHuauNQKOtCzpT6NeS/cP0zrlLhh7I+IvwuwoAjf0NfMoWi72mJjGLAaZ3X+YPXrWolEt5eBjGY+8lwSIkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww4Bj2Pv7z303K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 13:58:35 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Ww4BH0P3mz1S9TT;
	Fri, 30 Aug 2024 11:58:15 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B4C81400F4;
	Fri, 30 Aug 2024 11:58:29 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 11:58:28 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <herve.codina@bootlin.com>, <qiang.zhao@nxp.com>,
	<christophe.leroy@csgroup.eu>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<krzk@kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 0/4] soc: fsl: cpm1: Simplify with scoped for each OF child loop and dev_err_probe()
Date: Fri, 30 Aug 2024 12:06:32 +0800
Message-ID: <20240830040636.3508679-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use for_each_child_of_node_scoped() and dev_err_probe() to simplify code.

Changes in v2:
- Split from the whole soc patch set.
- Update the commit message.

Jinjie Ruan (4):
  soc: fsl: cpm1: Simplify with scoped for each OF child loop
  soc: fsl: cpm1: Simplify with dev_err_probe()
  soc: fsl: cpm1: qmc: Simplify with scoped for each OF child
  soc: fsl: cpm1: qmc: Simplify with dev_err_probe()

 drivers/soc/fsl/qe/qmc.c | 66 ++++++++++-------------------
 drivers/soc/fsl/qe/tsa.c | 90 ++++++++++++----------------------------
 2 files changed, 50 insertions(+), 106 deletions(-)

-- 
2.34.1


