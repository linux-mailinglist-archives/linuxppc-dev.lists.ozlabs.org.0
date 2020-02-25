Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2BF16B6D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 01:41:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RKqJ6WSjzDqSK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 11:41:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RKnZ6g3wzDqQF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 11:39:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=R2j6qUcM;
 dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com
 header.i=@armh.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-armh-onmicrosoft-com header.b=R2j6qUcM; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48RKnZ2g7Jz8t9F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 11:39:30 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48RKnZ21gXz9sRR; Tue, 25 Feb 2020 11:39:30 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=40.107.4.89; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=grant.likely@arm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=R2j6qUcM;
 dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com
 header.i=@armh.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-armh-onmicrosoft-com header.b=R2j6qUcM; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40089.outbound.protection.outlook.com [40.107.4.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48RKnY1g01z9sRQ
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Feb 2020 11:39:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3NOB/oZeeetW1pmjFZnlfC533thLSUdkCelsVC5aAo=;
 b=R2j6qUcM72ABB03oxouQBhgmdkb/midr42iGNKjRgd6BxKl+jRrH1nb+nMrtQ2Ok8J6e1DOu2OM7G4LIyM7RLs97T1ibhsI/IzBCaTIJMvxkcs9CzGW3Vrw16QuU35FR2Rrka+1eM/0jt6HhLqqA4sUsgz2mdILJ+dukqN47R9Q=
Received: from VI1PR08CA0225.eurprd08.prod.outlook.com (2603:10a6:802:15::34)
 by AM0PR08MB4322.eurprd08.prod.outlook.com (2603:10a6:208:148::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22; Tue, 25 Feb
 2020 00:39:22 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by VI1PR08CA0225.outlook.office365.com
 (2603:10a6:802:15::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend
 Transport; Tue, 25 Feb 2020 00:39:21 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; ozlabs.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;ozlabs.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Tue, 25 Feb 2020 00:39:21 +0000
Received: ("Tessian outbound 846b976b3941:v42");
 Tue, 25 Feb 2020 00:39:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e85e8f10d8c1dcb
X-CR-MTA-TID: 64aa7808
Received: from 9f612cb00746.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBB851E2-A004-4632-A2DB-36C11BC61D5B.1; 
 Tue, 25 Feb 2020 00:39:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f612cb00746.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Feb 2020 00:39:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWRGmk5pgAzoT2D6oQR2ObL7lhSvXoF4rCAYLJrKFlzQp7WQyPNcTHR9Qy3r+ENvkXjTdR4/1a5C0WQfL3cIlMRYyVyKG1pasxegWAcdnbPVvnAay1/7Gzhx1E2vcKX1hEjNYd91KMzf6odIsfUEmyMzB8/2dTaNnU+rCyohTgfvEuqw/7hXGs8HRSkZu4YNeZUMkZFZ2NnaEWRq1BzaVXLMKvFTgKYv2kDoTFlJ9EqAx5xrRtRqfQD5rzKDmxXOC/ax84nEG3KdvzxAm7uxArjYYBKa+MNJUKdAiyAWluEc0wxFUkwI9tA0c+STMDdAH1xixEUoWd0yOXo1JhYBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3NOB/oZeeetW1pmjFZnlfC533thLSUdkCelsVC5aAo=;
 b=FTp+nazjD4d6uBLQa4D1yI6XpHZXT2DPE/uyp0a2lZ5cwpgEqmt0j8WHzgDk84Vm0+QdA90Y8Bx2oNIJxOZWctXzPcaubrRSFX3HtCUXmTq4aSwhuIhbxr5ILB66oBPQdJ8lHeApaKNno6b7M+z2YaEtQc2HVXqUmG1WTBHEBsYD11HzPcg0BxkjKzJT9f+qP5k4BRVl/HbMkboHHGFypSeJUGt1NByMXi2dxasJiFwLvT+JY5kQ0x6hsNVdxOuEcb+SC5epn3hyjs0miPbvs/uCDWrfKf7l8CvS5A6s9dvIlKMMnK5xndtmvXrID2ch4eIDINmc3LSALRYFv2brgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3NOB/oZeeetW1pmjFZnlfC533thLSUdkCelsVC5aAo=;
 b=R2j6qUcM72ABB03oxouQBhgmdkb/midr42iGNKjRgd6BxKl+jRrH1nb+nMrtQ2Ok8J6e1DOu2OM7G4LIyM7RLs97T1ibhsI/IzBCaTIJMvxkcs9CzGW3Vrw16QuU35FR2Rrka+1eM/0jt6HhLqqA4sUsgz2mdILJ+dukqN47R9Q=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Grant.Likely@arm.com; 
Received: from DB8PR08MB4010.eurprd08.prod.outlook.com (20.179.10.207) by
 DB8PR08MB4060.eurprd08.prod.outlook.com (20.179.9.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Tue, 25 Feb 2020 00:39:14 +0000
Received: from DB8PR08MB4010.eurprd08.prod.outlook.com
 ([fe80::69dd:a09c:8012:998d]) by DB8PR08MB4010.eurprd08.prod.outlook.com
 ([fe80::69dd:a09c:8012:998d%4]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 00:39:14 +0000
Subject: Re: [PATCH 5/8] powerpc: Drop XILINX MAINTAINERS entry
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20200224233146.23734-1-mpe@ellerman.id.au>
 <20200224233146.23734-5-mpe@ellerman.id.au>
From: Grant Likely <grant.likely@arm.com>
Message-ID: <2b9756b4-815d-c05d-e9ce-fc372172fd53@arm.com>
Date: Tue, 25 Feb 2020 00:39:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200224233146.23734-5-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0333.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::33) To DB8PR08MB4010.eurprd08.prod.outlook.com
 (2603:10a6:10:ab::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.16.147] (92.40.175.36) by
 LO2P265CA0333.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Tue, 25 Feb 2020 00:39:13 +0000
X-Originating-IP: [92.40.175.36]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ea64fcb-5118-470e-cacf-08d7b98b27b5
X-MS-TrafficTypeDiagnostic: DB8PR08MB4060:|AM0PR08MB4322:
X-Microsoft-Antispam-PRVS: <AM0PR08MB43227B83ADE1D564AC6FAF8E95ED0@AM0PR08MB4322.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;OLM:2582;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(189003)(199004)(2906002)(81156014)(8936002)(5660300002)(16576012)(8676002)(31686004)(81166006)(6486002)(31696002)(26005)(36756003)(52116002)(186003)(316002)(86362001)(66946007)(44832011)(4744005)(2616005)(956004)(4326008)(478600001)(55236004)(66556008)(53546011)(66476007)(16526019);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4060;
 H:DB8PR08MB4010.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: kA5D6Y3yX82rJtNHzmIke0MahlR61B7XnmZqYJBAFc5MGjHn58UbXn2bNtlVrRmV5AxQwzpl8NDEc/DMGzH7sMg1E5C5zE/mjUeyTkEKbw3ePLUSZRLNhTQfqs5g6MwQiskzdtg65B5kqGt9WOqJTkrtHsOD6QafF0S5998T/ETNRDLR9ZkRODDmcwerLFTD8NDhZtBKvsyFTQc8M7dYFqhvbLEvSC+fr1xqK9j0uRfOh4imemYPnGq7fXz2cTu21epwXmUR8eYw9Gx3kyu30YxerR1AwASc6x0vjNy5VxMwEYyOqHeBJUhKl/F/5+SxkH9jAp+aLNw7KQZPbaGiEBv+plfaSGmeR5w6jMLL6OirRW5oC2Usu7qvE683s/lxABWGO3bSoxoVPZdQH2GQsfrknNKc+DeGJW2dqN2xt54c6Lq3QUhqa+QxkCmIWgxn
X-MS-Exchange-AntiSpam-MessageData: q9WdC2RT+UIuY1aecowofi7KxajyDnwyFi9d25mZb1IeuufDnAT2ztx3VmZwwctJz2VGt1RlQZE1njT4TGUAS7m0n8DN0d9tuQagDyUPKqejdX+WAzYZhYsPFlRzDKfYA+FMTgmjoeKUvcen1soSBg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4060
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Grant.Likely@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(2616005)(8936002)(956004)(6486002)(26005)(186003)(36756003)(8676002)(16526019)(356004)(31696002)(336012)(53546011)(70586007)(4744005)(5660300002)(16576012)(44832011)(31686004)(316002)(2906002)(81166006)(4326008)(81156014)(478600001)(86362001)(26826003)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4322;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 01672665-4f9b-4290-3d5b-08d7b98b2380
X-Forefront-PRVS: 0324C2C0E2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ifbuAzXzJh13K505RHFpFYWvBqWA5UJe/SOKBVWjOlBRN+O0lmpRBJgNC6vqBYZzOaOG1hi/b2HGmLfj1ET8g/lMh08+Fcn3E7TzxNEsSPB1eRYlWq0+I4O7x4E7GYOKsmP7PR1Pdmh4BRQnVmdj7CXgb+83dH4ZKzfo/Cws6LMwllDPkdA3NdjZKhys4NAulFZp85sZd9/kv9AV7bBfyYtmMqrzHSMzGO3jsdRDhwTXCND3qAUl1K7rbk8iOQasJu0Y8QJt2PZ4QxpOryNgKsKrIqLO6nPqvGGUWPLAw2qb4QCHEg+rsL47fO0mhkHUZvoWCGpAuqrn4j8amfQqoTfpRW2VLQ+weoFEhJNIlwrXu7jwfrWayd5Rrs7Nc5DWm6YpIHkG8XxGs+0b1XX8dlDzMuvfN5U3j8tGi9XIb+Zv0UOMOSD9JxGNW/YaXqef
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 00:39:21.3972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea64fcb-5118-470e-cacf-08d7b98b27b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4322
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
Cc: nd <nd@arm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 24/02/2020 23:31, Michael Ellerman wrote:
> This has been orphaned for ~7 years, remove it.
> 
> Cc: Grant Likely <grant.likely@arm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Grant Likely <grant.likely@arm.com>

> ---
>   MAINTAINERS | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 939da2ac08db..d5db5cac5a39 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9668,12 +9668,6 @@ L:	linuxppc-dev@lists.ozlabs.org
>   S:	Maintained
>   F:	arch/powerpc/platforms/8xx/
>   
> -LINUX FOR POWERPC EMBEDDED XILINX VIRTEX
> -L:	linuxppc-dev@lists.ozlabs.org
> -S:	Orphan
> -F:	arch/powerpc/*/*virtex*
> -F:	arch/powerpc/*/*/*virtex*
> -
>   LINUX KERNEL DUMP TEST MODULE (LKDTM)
>   M:	Kees Cook <keescook@chromium.org>
>   S:	Maintained
> 
