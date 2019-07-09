Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1969B63D60
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 23:33:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jwXY3BCRzDqb9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 07:33:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.14.53; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=maxg@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="jmPsG4td";
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140053.outbound.protection.outlook.com [40.107.14.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jlzR6TNLzDqT2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 01:07:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1c6IbyzC40Vh9uYCno0k8vTU3H8eW816XgSGUEhUHc=;
 b=jmPsG4tdWzXetMI0jiJbj48w/8AcuEPD63a2cD5O0FUUi5U9Ai2kd3yuzAbW6uHPBIU75c1e6ZaO7tS40lKepD16PLQ/CMgOiVbzskfEf3WWTGXKOiBGAPAlbttp8ndFMTZqLoRfxFj5WjBMnwRJt84wtnKUL0oCDjQ5Jzmroxs=
Received: from HE1PR05CA0307.eurprd05.prod.outlook.com (2603:10a6:7:93::38) by
 HE1PR0502MB3099.eurprd05.prod.outlook.com (2603:10a6:3:e0::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 9 Jul 2019 15:07:09 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by HE1PR05CA0307.outlook.office365.com
 (2603:10a6:7:93::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.19 via Frontend
 Transport; Tue, 9 Jul 2019 15:07:09 +0000
Authentication-Results: spf=pass (sender IP is 193.47.165.134)
 smtp.mailfrom=mellanox.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=pass action=none
 header.from=mellanox.com;
Received-SPF: Pass (protection.outlook.com: domain of mellanox.com designates
 193.47.165.134 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=193.47.165.134; helo=mtlcas13.mtl.com;
Received: from mtlcas13.mtl.com (193.47.165.134) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 15:07:07 +0000
Received: from MTLCAS13.mtl.com (10.0.8.78) by mtlcas13.mtl.com (10.0.8.78)
 with Microsoft SMTP Server (TLS) id 15.0.1178.4; Tue, 9 Jul 2019 18:07:06
 +0300
Received: from MTLCAS01.mtl.com (10.0.8.71) by MTLCAS13.mtl.com (10.0.8.78)
 with Microsoft SMTP Server (TLS) id 15.0.1178.4 via Frontend Transport; Tue,
 9 Jul 2019 18:07:06 +0300
Received: from [10.223.3.162] (10.223.3.162) by MTLCAS01.mtl.com (10.0.8.71)
 with Microsoft SMTP Server (TLS) id 14.3.301.0; Tue, 9 Jul 2019 18:06:55
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
 <d9430488-e4ef-7d1f-6b74-c2b8158e4a59@mellanox.com>
 <20190709144049.GA3364@lst.de>
From: Max Gurtovoy <maxg@mellanox.com>
Message-ID: <14dee448-94bc-aaea-3661-baa92ac8c2f8@mellanox.com>
Date: Tue, 9 Jul 2019 18:06:54 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709144049.GA3364@lst.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.223.3.162]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:193.47.165.134; IPV:NLI; CTRY:IL; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(2980300002)(189003)(199004)(229853002)(53546011)(11346002)(16576012)(107886003)(81166006)(106002)(16526019)(54906003)(58126008)(186003)(31686004)(478600001)(7736002)(6246003)(26005)(77096007)(2486003)(23676004)(4326008)(2616005)(476003)(81156014)(76176011)(356004)(86362001)(8936002)(8676002)(316002)(446003)(67846002)(70206006)(126002)(65806001)(70586007)(47776003)(6116002)(65956001)(5660300002)(36756003)(230700001)(6916009)(2906002)(486006)(50466002)(305945005)(65826007)(4744005)(336012)(31696002)(3846002)(64126003)(3940600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0502MB3099; H:mtlcas13.mtl.com; FPR:;
 SPF:Pass; LANG:en; PTR:mail13.mellanox.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f8b136e-6962-468a-8179-08d7047f1c43
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328)(7193020);
 SRVR:HE1PR0502MB3099; 
X-MS-TrafficTypeDiagnostic: HE1PR0502MB3099:
X-Microsoft-Antispam-PRVS: <HE1PR0502MB3099BE282EA207B172346B9DB6F10@HE1PR0502MB3099.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0093C80C01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 81FB1Nl5hmXY6Gkml5gt3TWDM8UFbFKMQaf1kdqFIjqcWllBD2D1KlqI7vq/QlPTYkHef4IfpkQgKbAKGOSmy9NeKnVi2DcV6HbOXOKJfzz7cvJKombu2WX4YELN9xkdP5eCc3eos5QD3tXHtY525Ahs95r1v9IFipNNAu0/FwauMVFq9rkB9tZJ0VGlm9zX2/mn5fjhmGDQGqJEmcmOFMQQu//X2Bge+h29SjMkYSCL5g9aU9KX8KDQbhfaGaCRzfQVwndJaXyHay6fhgrcOmVOst4dL0E+Ikcno4LszsPfX1zenBTLp+hLly23T6ibZlELUhBe5YENiBDVfeowdfW92aa+T3ILBdRkNIunMPehNG1+85pq1aoTROT9JxmE32viFcUqEuKKJ2oT2Mv6/O6AIaJFEWOeApX+272dpFg=
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 15:07:07.5366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8b136e-6962-468a-8179-08d7047f1c43
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a652971c-7d2e-4d9b-a6a4-d149256f461b; Ip=[193.47.165.134];
 Helo=[mtlcas13.mtl.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0502MB3099
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:26:46 +1000
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


On 7/9/2019 5:40 PM, Christoph Hellwig wrote:
> On Tue, Jul 09, 2019 at 05:37:18PM +0300, Max Gurtovoy wrote:
>> On 7/9/2019 5:32 PM, Christoph Hellwig wrote:
>>> On Tue, Jul 09, 2019 at 05:31:37PM +0300, Max Gurtovoy wrote:
>>>> Are we ok with working on a solution during kernel-5.3 cycle ?
>>> You can start working on it any time, no need to ask for permission.
>> I just want to make sure we don't remove it from the kernel before we send
>> a general API solution.
> The code is gone in this merge window.

Ok, so we must fix it to kernel-5.3 to make sure we're covered.

Understood.

>
>> This way we'll make sure that all the kernel versions has this
>> functionality...
> Again, we do not provide functionality for out of tree modules.  We've
> had the p2p API for about a year now, its not like you didn't have
> plenty of time.

I didn't know about the intention to remove this code...

Also this code was merged before the p2p API for p2pmem.

