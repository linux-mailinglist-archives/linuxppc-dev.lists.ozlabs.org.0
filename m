Return-Path: <linuxppc-dev+bounces-13449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0134C154B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 16:00:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwtpD1Pzrz3dW7;
	Wed, 29 Oct 2025 02:00:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761663604;
	cv=none; b=WdSuYQZiyldh5kE0QiSXJDDHl6P8VkIkBWpYdJtsuZCOukP+uDCMtYEtLjWM4yT3xnBnfE6V5f0W90SqqSPIqXZwrw9kYjLdcbGqelnDxCAubkIcMWK7Lu095zCkV6pZZJ/RavcOi6FQv9usybMo8CXPj3tY2/GR0YbI7p8mSmJV5JuTJcHXdGIdeIb/bry4Sb+MN4qlzN6hGdAvhXd8MHOUg03zPluf5ss5zx5rWHh7S3kzGDK+0T/F+ZaICgARf2gvaTdehXMvz4/uXUi6rSfeIoqWuutPtEsb7AiHp//iAB8ZJv80VhuATbYfXLOtnmwzvCgST/ZKEcc7Ria5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761663604; c=relaxed/relaxed;
	bh=T5vYWTnlFFB+lmGZzz49Yq0Qzd/tVca/qcRH6qhPziI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k+9Lt/IRHOzoC3Prn0so+qX7+c1YqltVZ7ahE0yLUR1O4f0ROBy8vvaR3rlmxeAU2t5mCsgdEfhExBuvchxN2TtlaYL4joETxsECBNc/qs9IBpop1jNBkTrqv6BAdzBkBMqiXRlpE52q/yB+pjfOMQi6ql7O2EY4XBDK26ozTvoEDaERXA4UX07MWIZgpwfrEhsuFAlSOH0XJbvWxufW/05jlL5ueg1JLVy1ltdGsbuuKULUPI2nd3Qsl2vsFv7AqrTqBxDxY3FkNpZHSWqZQbcCYVbPFV7MIZLy9sPWjGhc0GBnCq74jbvIQhYgfXWvMZ9ftxtoIyEoHfaWs6MzWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwtpC0Q5Zz3dVZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 02:00:01 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4cwtn53hFrzHnGf4;
	Tue, 28 Oct 2025 14:59:05 +0000 (UTC)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 44E651402EF;
	Tue, 28 Oct 2025 22:59:56 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 28 Oct
 2025 14:59:54 +0000
Date: Tue, 28 Oct 2025 14:59:53 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
CC: <linux-cxl@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	"Len Brown" <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Borislav
 Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>,
	"Davidlohr Bueso" <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>,
	"Alison Schofield" <alison.schofield@intel.com>, Vishal Verma
	<vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Sunil V L <sunilvl@ventanamicro.com>, Xiaofei Tan <tanxiaofei@huawei.com>,
	Mario Limonciello <mario.limonciello@amd.com>, Huacai Chen
	<chenhuacai@kernel.org>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Arnd Bergmann <arnd@arndb.de>, "Peter
 Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, "Guo
 Weikang" <guoweikang.kernel@gmail.com>, Xin Li <xin@zytor.com>, Will Deacon
	<will@kernel.org>, Huang Yiwei <quic_hyiwei@quicinc.com>, Gavin Shan
	<gshan@redhat.com>, Smita Koralahalli
	<Smita.KoralahalliChannabasappa@amd.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6n?=
 =?ISO-8859-1?Q?ig?= <u.kleine-koenig@baylibre.com>, Li Ming
	<ming.li@zohomail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Karolina Stolarek
	<karolina.stolarek@oracle.com>, Jon Pan-Doh <pandoh@google.com>, "Lukas
 Wunner" <lukas@wunner.de>, Shiju Jose <shiju.jose@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 5/6 v6] acpi/ghes: Add helper to copy CXL protocol error
 info to work struct
Message-ID: <20251028145953.00005372@huawei.com>
In-Reply-To: <20251023122612.1326748-6-fabio.m.de.francesco@linux.intel.com>
References: <20251023122612.1326748-1-fabio.m.de.francesco@linux.intel.com>
	<20251023122612.1326748-6-fabio.m.de.francesco@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 23 Oct 2025 14:25:40 +0200
"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com> wrote:

> Make a helper out of cxl_cper_post_prot_err() that checks the CXL agent
> type and copy the CPER CXL protocol errors information to a work data
> structure.
> 
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
LGTM
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

