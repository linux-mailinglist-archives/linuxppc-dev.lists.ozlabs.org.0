Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE5063D5D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 23:31:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jwVf3P2vzDqH1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 07:31:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=2a01:111:f400:fe08::620;
 helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=maxg@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="UsTnKAzx";
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jlKY6CgVzDq7W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 00:37:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEC7CVTFvE0EigTEJX57+l9+ynB6ZQRIDWt1t8Bd0p4=;
 b=UsTnKAzxjTpwqz78+28zldroT8oB2ktPrAUiP14/0swnUX2kw9iD4H6J6uUDRxm8HefZg751MqlHkhAIModn9nA6rUmPb4aPtxIQOzLGunlzB/XppzfiWETZXfJWTU3IlnslSkg7F2fZq8BwMktWxDXJfGdXnI7eKv/5pTtEfuc=
Received: from VI1PR0502CA0030.eurprd05.prod.outlook.com (2603:10a6:803:1::43)
 by VI1PR0502MB3104.eurprd05.prod.outlook.com (2603:10a6:800:b6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Tue, 9 Jul
 2019 14:37:43 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by VI1PR0502CA0030.outlook.office365.com
 (2603:10a6:803:1::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19 via Frontend
 Transport; Tue, 9 Jul 2019 14:37:43 +0000
Authentication-Results: spf=pass (sender IP is 193.47.165.134)
 smtp.mailfrom=mellanox.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=pass action=none
 header.from=mellanox.com;
Received-SPF: Pass (protection.outlook.com: domain of mellanox.com designates
 193.47.165.134 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=193.47.165.134; helo=mtlcas13.mtl.com;
Received: from mtlcas13.mtl.com (193.47.165.134) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 14:37:43 +0000
Received: from MTLCAS13.mtl.com (10.0.8.78) by mtlcas13.mtl.com (10.0.8.78)
 with Microsoft SMTP Server (TLS) id 15.0.1178.4; Tue, 9 Jul 2019 17:37:42
 +0300
Received: from MTLCAS01.mtl.com (10.0.8.71) by MTLCAS13.mtl.com (10.0.8.78)
 with Microsoft SMTP Server (TLS) id 15.0.1178.4 via Frontend Transport; Tue,
 9 Jul 2019 17:37:42 +0300
Received: from [10.223.3.162] (10.223.3.162) by MTLCAS01.mtl.com (10.0.8.71)
 with Microsoft SMTP Server (TLS) id 14.3.301.0; Tue, 9 Jul 2019 17:37:19
 +0300
Subject: Re: [PATCH 1/3] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
To: Christoph Hellwig <hch@lst.de>
References: <20190426124917.23789-1-hch@lst.de>
 <20190426124917.23789-2-hch@lst.de>
 <99c4c4a9-8a18-61ed-174a-9ffaec3d2e44@linux.ibm.com>
 <20190523075253.GA12946@lst.de>
 <AM0PR05MB5810FF3B4A45B3CA722489EEB6F10@AM0PR05MB5810.eurprd05.prod.outlook.com>
 <20190709135935.GA2511@lst.de>
 <ec1f8638-d97d-bfc7-23e1-9af555654562@mellanox.com>
 <20190709143251.GA3222@lst.de>
From: Max Gurtovoy <maxg@mellanox.com>
Message-ID: <d9430488-e4ef-7d1f-6b74-c2b8158e4a59@mellanox.com>
Date: Tue, 9 Jul 2019 17:37:18 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709143251.GA3222@lst.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.223.3.162]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:193.47.165.134; IPV:NLI; CTRY:IL; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(2980300002)(189003)(199004)(58126008)(16576012)(316002)(54906003)(6246003)(107886003)(106002)(76176011)(53546011)(16526019)(67846002)(23676004)(2486003)(65826007)(6916009)(26005)(478600001)(4326008)(65956001)(2906002)(336012)(186003)(65806001)(31686004)(229853002)(446003)(8676002)(230700001)(47776003)(3846002)(6116002)(64126003)(70586007)(70206006)(11346002)(126002)(476003)(305945005)(2616005)(81166006)(81156014)(486006)(50466002)(36756003)(31696002)(7736002)(77096007)(356004)(4744005)(8936002)(86362001)(5660300002)(3940600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB3104; H:mtlcas13.mtl.com; FPR:;
 SPF:Pass; LANG:en; PTR:mail13.mellanox.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00fd57ed-d780-4bab-dc06-08d7047b0098
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0502MB3104; 
X-MS-TrafficTypeDiagnostic: VI1PR0502MB3104:
X-Microsoft-Antispam-PRVS: <VI1PR0502MB31040C6BF26C99CF7A94CD35B6F10@VI1PR0502MB3104.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0093C80C01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KB5N93i5oT4AiU7SdNS0JJ3DQn0eWQXLthwN7lAYihSIm2p9ZRzzgMvmpGD2lccTJBt9i+Amb8vPe1OyiTebcnEb5/9Hx8sdLCacnR3ePCDF/HiozRWhuLeiYK+SBXwRMOzRXJpqkgZRIhd6NKIoKZZr01Y5hkmmb3NnsAV3I/Y84Vhx4myRcKpLnU1C2VVsRdE/s7tMSUsz6dCnlrPSQtSgsYSM4t+dZlHyoOf5XVKH0bd1ou+/QCMvnlNUiRtwPv6v+xRuDfiAHPPygBBkIQLN+Tpg0dgAHowJoNPK9WAVwvJ9qAbWYniC/AT7CNlcPS6gbhpI/zeHbTqbhMZ/u0Or2FQJB5Y0yNN8EaseDBb0gbC2xpknu7ymVh3aUQGpjwDZwemUPpSxHzqR7+8Je1FOZgfo/ek/jsE6KfXnbrc=
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 14:37:43.1839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fd57ed-d780-4bab-dc06-08d7047b0098
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a652971c-7d2e-4d9b-a6a4-d149256f461b; Ip=[193.47.165.134];
 Helo=[mtlcas13.mtl.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3104
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:26:45 +1000
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
Cc: "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>, Shlomi
 Nimrodi <shlomin@mellanox.com>, Paul Mackerras <paulus@samba.org>,
 Bodong Wang <bodong@mellanox.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Oren Duer <oren@mellanox.com>, Idan Werpoler <Idanw@mellanox.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/9/2019 5:32 PM, Christoph Hellwig wrote:
> On Tue, Jul 09, 2019 at 05:31:37PM +0300, Max Gurtovoy wrote:
>> Are we ok with working on a solution during kernel-5.3 cycle ?
> You can start working on it any time, no need to ask for permission.

I just want to make sure we don't remove it from the kernel before we 
send a general API solution.

This way we'll make sure that all the kernel versions has this 
functionality...

