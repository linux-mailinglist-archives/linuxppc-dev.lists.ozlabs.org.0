Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0073741CF23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 00:13:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKVyD62WWz3bVR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 08:13:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ooHaE4+E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.212.49;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=idosch@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=ooHaE4+E; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2049.outbound.protection.outlook.com [40.107.212.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKK0t43WWz2xXm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 00:45:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJUgtKrqz8oSWF4pNVyIPuqp5h7VEnuNcY8koxeYvNKJzmN/6w5yBQdlbAQnXJesWGXJtkBcmRvnzhLVh67CJOiDW8hzJT2EJ+BN196bCgzTLmVEkP7/Yr2mmyE+f6lR3jbdkrcv03PqjB6UxG8zG7KAJCFWbYq36LXeQs/hUeZaXYcK02yN1r8+Ig/H+Cn8LwzMYjEmFZAJaIqXg0dxbEsHfQMfUgJ6VtL5/J8FGzTu9VnqfxNzsgWXSPe/OkZrG4mtQqTcBNoeF5ufQcQYuGZSyQ9OyeB+MKiSFROdM+gOMGJLHB4LJ91tslKE0OqTEvMW+wp4KzKn1hxzOWRfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ZYeW3Ri8eUu3hTK0UHDDxm+umkJ6sbQYE5YEOGT5H64=;
 b=KQu2f+8ZsDXJPc51VDh0BcSC18lmWuWJEwq+MQbXepS8De5Ax6hpWohwt9ZgKLUXqqijC/ms+vdbWLz+Z5nfVDrB5pz+K4pA4sOsLlF2jdzsZlrSXIZWuHri4l6CKjKYO6ae0JLXuaF/cQUNpYaPlEGVSPFqq+OTQodnn8f8D+xSNFwmlV5hxkdjcZ7a38i7WlMBZTS7io+WsKEvwiPC/Qw9TRrBGsrErG8HkngLigp0Xni10saLBEoNmqqtwcsj+xCqICnuB0A8J7/GibQSL4jr7+9sDBCOWdnYj3OmehvcL4NTKOfPEiXNNAaBfz/PGBdDfArKPd6kbH1FUiMbKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYeW3Ri8eUu3hTK0UHDDxm+umkJ6sbQYE5YEOGT5H64=;
 b=ooHaE4+EtWRYNKy9b7ZBz+Ikj3kmZwGgrKw8ZnaMhwxI36TTlGrB/CS9E3VUMtnf6Kyj/VYakf9xx+/EWLLhzkBx60rJZWhlvZcF1l7x59aMYyzsKbXVKPH6takE8pX3wIhBeCueoVSkYmXQuo+JOA141j2UaA2vuMl6smE56WzoVpScv5L43Q6HURg2P+/WMeU4WYSGvXYiFd6/CRlE3hV5rYYwBufuTDS5+JumTZmlN6502dO0/DU+ZPbH6qzAnP6kr9/2HiUS/oAotjDKOhOUPbdjsslx5xLJoheBvzy6k9mqhxMJ1fk1jh1nlfR0Q5bDbNUV4GPWaDAJr1kJXw==
Received: from DM3PR11CA0003.namprd11.prod.outlook.com (2603:10b6:0:54::13) by
 SJ0PR12MB5502.namprd12.prod.outlook.com (2603:10b6:a03:300::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Wed, 29 Sep 2021 14:44:57 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:54:cafe::9d) by DM3PR11CA0003.outlook.office365.com
 (2603:10b6:0:54::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Wed, 29 Sep 2021 14:44:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 14:44:56 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 29 Sep
 2021 14:44:55 +0000
Received: from localhost (172.20.187.5) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Wed, 29 Sep 2021 14:44:55 +0000
Date: Wed, 29 Sep 2021 17:44:51 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v5 07/11] PCI: Replace pci_dev::driver usage that gets
 the driver name
Message-ID: <YVR74+8Rw6XmTqDD@shredder>
References: <20210929085306.2203850-1-u.kleine-koenig@pengutronix.de>
 <20210929085306.2203850-8-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210929085306.2203850-8-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbc8531f-ebbc-4d27-834c-08d98357b4df
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5502:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB55025627DE95DC92EB9E51B9B2A99@SJ0PR12MB5502.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0BR+8ElyoKaO3+g2ZEPI7C3QlEytSvEmUDjy7n0W9y39UOp0Jg7Lzn3bHSUNGuA7AbAqxoewWssncw0J8Z1lKWwwJwjYyUUswq0Us1jfEsHit8ODiXqQLUgLu4vyPA4lNtPkmgHRw/ks/6kIWmHbjy0ZmAlykDbKw0c5p0eUGsAV6S3gGbivoMF1LvNVILVL2oKK0quaYeXd3E8dHfBTUU1ywvpwWKeIqncnV8CfLGSgIZODwmofeZxgnm2i5ZgTsEZLWB7XDbYPSqQuW925+zDLmgc0z+7uOgiFuD/wpudiYPPUKB3yx5CijzGU/PEwnHh+EFxkqpc0+KHEJ6smEfSGxyhxJC+r56O11+lvP0odDAWkmltZP2ikzW/y//gdTkAJNA/R6qWheoti+tOdh8UfXTxU51QQ4Z0xswSZVW9hOtYBB5dzr1AG+Ea/yBbF/XV3/4KHzlkSEMknzTqiVX0e4wcftXcT525n+HJw6v3bWLwrj+swwSp+aG2MkeU8H0wnc1qa70znSPGbfkSOVUodAwj4cBvzyhXpB3JA/mYCS+0XfJDKH/KsGIpf54eFp8gh1WxL1tWqpOWSV/YslR2nKWSjpbLuvgeunoEpJxwIxjOuwmfexoEzPT6kjpBZQeUg8WX06CJYi4W9DAVMSEGKvgeHKijX5qr8pKaTB/hPBPM9Xjvrtkz8P9rTjnnn04TTvbaVFjW+lzb9sFI93yFQUP17jI+4XchDaR/IX7A=
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(7916004)(36840700001)(46966006)(426003)(16526019)(82310400003)(86362001)(508600001)(8936002)(6916009)(26005)(6666004)(336012)(2906002)(186003)(8676002)(54906003)(356005)(70206006)(7636003)(7416002)(70586007)(5660300002)(4326008)(4744005)(9686003)(36860700001)(36906005)(316002)(33716001)(47076005)(67856001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 14:44:56.8237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc8531f-ebbc-4d27-834c-08d98357b4df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5502
X-Mailman-Approved-At: Thu, 30 Sep 2021 08:13:02 +1000
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
Cc: linux-pci@vger.kernel.org, Alexander Duyck <alexanderduyck@fb.com>,
 oss-drivers@corigine.com, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Vadym Kochan <vkochan@marvell.com>,
 Michael Buesch <m@bues.ch>, Jiri Pirko <jiri@nvidia.com>,
 Salil Mehta <salil.mehta@huawei.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taras Chornyi <tchornyi@marvell.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 Simon Horman <simon.horman@corigine.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 29, 2021 at 10:53:02AM +0200, Uwe Kleine-König wrote:
> struct pci_dev::driver holds (apart from a constant offset) the same
> data as struct pci_dev::dev->driver. With the goal to remove struct
> pci_dev::driver to get rid of data duplication replace getting the
> driver name by dev_driver_string() which implicitly makes use of struct
> pci_dev::dev->driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

For mlxsw:

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Tested-by: Ido Schimmel <idosch@nvidia.com>

Thanks
