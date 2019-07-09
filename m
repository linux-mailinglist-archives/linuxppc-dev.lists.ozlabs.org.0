Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE9A63D57
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 23:29:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jwSc1FSHzDqZk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 07:29:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.14.70; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=maxg@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="qbor0LA/";
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140070.outbound.protection.outlook.com [40.107.14.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jlBv631kzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 00:32:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8P3OmtTtnq9YR2HNH68J11tK+WhGsrC68bYpgcq852M=;
 b=qbor0LA/0YVj8Kg+tcZmp8Fg1KDeKLd36ojfcqZf9n7BS7KS2Ig5Mf3XqtTw5pRfMCe/vwBn5wmcZGYhJ+sYLo/4IjObI7CvYzMWnayHkLaTjohF65OlH3yhubtDtR7gBcWPsi18GPhRCKKxxcDSvH5Xvm648mLHdG5rrcOhoQU=
Received: from AM0PR05CA0057.eurprd05.prod.outlook.com (2603:10a6:208:be::34)
 by AM0PR0502MB3972.eurprd05.prod.outlook.com (2603:10a6:208:8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Tue, 9 Jul
 2019 14:32:02 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by AM0PR05CA0057.outlook.office365.com
 (2603:10a6:208:be::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Tue, 9 Jul 2019 14:32:02 +0000
Authentication-Results: spf=pass (sender IP is 193.47.165.134)
 smtp.mailfrom=mellanox.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=pass action=none
 header.from=mellanox.com;
Received-SPF: Pass (protection.outlook.com: domain of mellanox.com designates
 193.47.165.134 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=193.47.165.134; helo=mtlcas13.mtl.com;
Received: from mtlcas13.mtl.com (193.47.165.134) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 14:32:01 +0000
Received: from MTLCAS13.mtl.com (10.0.8.78) by mtlcas13.mtl.com (10.0.8.78)
 with Microsoft SMTP Server (TLS) id 15.0.1178.4; Tue, 9 Jul 2019 17:32:00
 +0300
Received: from MTLCAS01.mtl.com (10.0.8.71) by MTLCAS13.mtl.com (10.0.8.78)
 with Microsoft SMTP Server (TLS) id 15.0.1178.4 via Frontend Transport; Tue,
 9 Jul 2019 17:32:00 +0300
Received: from [10.223.3.162] (10.223.3.162) by MTLCAS01.mtl.com (10.0.8.71)
 with Microsoft SMTP Server (TLS) id 14.3.301.0; Tue, 9 Jul 2019 17:31:37
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
From: Max Gurtovoy <maxg@mellanox.com>
Message-ID: <ec1f8638-d97d-bfc7-23e1-9af555654562@mellanox.com>
Date: Tue, 9 Jul 2019 17:31:37 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709135935.GA2511@lst.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.223.3.162]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:193.47.165.134; IPV:NLI; CTRY:IL; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(189003)(199004)(65826007)(2616005)(186003)(16526019)(6246003)(31696002)(86362001)(70586007)(70206006)(8676002)(64126003)(107886003)(81156014)(26005)(81166006)(47776003)(76176011)(77096007)(65806001)(6916009)(476003)(2906002)(65956001)(126002)(230700001)(23676004)(2486003)(53546011)(486006)(36756003)(356004)(6116002)(3846002)(58126008)(31686004)(106002)(54906003)(305945005)(316002)(16576012)(229853002)(4326008)(446003)(336012)(5660300002)(478600001)(50466002)(8936002)(11346002)(67846002)(4744005)(7736002)(3940600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR0502MB3972; H:mtlcas13.mtl.com; FPR:;
 SPF:Pass; LANG:en; PTR:mail13.mellanox.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8f336c9-6ff7-4c94-51da-08d7047a351e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR0502MB3972; 
X-MS-TrafficTypeDiagnostic: AM0PR0502MB3972:
X-Microsoft-Antispam-PRVS: <AM0PR0502MB3972245BFE29038D2D63D2CEB6F10@AM0PR0502MB3972.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0093C80C01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +II5LsZhlmnRqxZ97DKSPnfOwzF8+QuTTyVdwLBnUJgFAbGwaj9XcGfCXabHdzqq0M0tHfvR1P1rrG66tzLuxc5DC8nUxsUt86vlaoyOf416lpoG2CI4QOGBxfLGiFc5NchaQ87CY1oB+lhXx3uw3A/4glOD6u2uvwGG9aDs621Qc7dI7/uUzF+hfCVqtlZAMW/3vIUIXP0trTBl6HBYbG/US2yUjE1MzndVOx8TWQLPTMOSR8Q8LnuSrSgbTecVmwno3OcCMTy9CqhXnxnrdJCdVyV3rUHBwTz2AjhK3zb6Is+vsAhpTG2tLemBGGPBPvvFT/CUcubNdVZkI/5hWrXeaXoZOu434tKB1Rm2T89xzhbsV/yKC/qk9xkL2Csxj2CZsdai1/JdQflavXTMQk6oWTcDowaEUzKwxX4FnXc=
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 14:32:01.7483 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f336c9-6ff7-4c94-51da-08d7047a351e
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a652971c-7d2e-4d9b-a6a4-d149256f461b; Ip=[193.47.165.134];
 Helo=[mtlcas13.mtl.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0502MB3972
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
 Frederic Barrat <fbarrat@linux.ibm.com>, Oren Duer <oren@mellanox.com>,
 Idan Werpoler <Idanw@mellanox.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/9/2019 4:59 PM, Christoph Hellwig wrote:
> On Tue, Jul 09, 2019 at 01:49:04PM +0000, Max Gurtovoy wrote:
>> Hi Greg/Christoph,
>> Can we leave it meanwhile till we'll find a general solution (for the upcoming kernel) ?
>> I guess we can somehow generalize the P2P initialization process for PPC and leave it empty for now for other archs.
>> Or maybe we can find some other solution (sysfs/configfs/module param), but it will take time since we'll need to work closely with the IBM pci guys that wrote this code.
> We do not keep code without in-tree users around, especially not if
> we have a better API with in-tree users.
>
> AFAICS the only thing you'll need is to wire up the enable/disable
> calls.

I guess you're right, but we still need to know the time frame we have 
here since this should be tested carefully on the P9 hardware.

Are we ok with working on a solution during kernel-5.3 cycle ?

