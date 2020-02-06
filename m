Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8572154EDC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 23:21:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DCZd51Y3zDqQT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 09:21:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.22.42;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=KbcUOj5K;
 dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D9KY1MnBzDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 07:39:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBton7MILiifYopNzVNg9J7eLdah9xixMHZfMtbE4dyrHNxJiDD0MF/2kE6iVKaSWAWuNIphXuOAO67WUVeKqzcAovbUP2GIbK71eRHqaRX/epxL8+wbEKgairWaSCcQ3yWRS9Uwrwrm2KfYKOeXQLkcm7szRGkdrArMX8wpR9B+dMOMEy5+0WK6/5B+2ai3Sm+hZ3aGZmmxg/wiZGlBSHMe4Aira07Mf/ZsH5rU22byzWL0tkUwffkfSSTjgOVvtcBz5MfdYfyowmd1bxU48OfTQ3AEQjcg9jXMvQk8dGuhDkdv0Hv70WT3IhOzTgn4hT7teZ/YY9eXPp3exii6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gq+a+L50rHyh6inOlZOIfxM/PhMjPeWyz6kFhkI8DIE=;
 b=RmNEnpEzyHtQKJ5XPst8JEU4o0JkWisOhLACr5rOUDh1bjDT3rm4Tu8YK6f1taJA2b37T8BKFGV3NRDk2eayELiEvw8NBzToOoEn/07phwBdaqbRytKkwUrAGEH7GPmcdhpiIyENos6+e4HrPWNaDore/pQldwSLEdcGEjUMZLMQp6C5kcA0SFeSzsUT2G7hHuISOHy6dQ2liQ/El8uuZc8vlWH6wW6xBpgkgKdh6ZplMiNgnDrfYhU0nw9rXqRrTWDqhRYRl7+DIrQ8leZqNeAuEBS5g4ZgiqzTouOBPObTUxN+2oBRHJEaVidWU3ilnRMKjw0eJfOvBw5/RSA5HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gq+a+L50rHyh6inOlZOIfxM/PhMjPeWyz6kFhkI8DIE=;
 b=KbcUOj5Kx1c5nZpmCQaidopTxnDwMxWkReM1RCc/rW8C9f4QapQ7KEwZQ9h3mHSeGIM0XGwST9nDD5ttU2FdN+nlI88LGWldlRgsBpUYpS5hx7ApmV3i9j8iT0Q/9bC9no5IqQa9Mr8WmOyas7Op4y3bk/qWldea0oZ+zgITrG8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=roy.pledge@oss.nxp.com; 
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (20.179.253.21) by
 AM0PR04MB6195.eurprd04.prod.outlook.com (20.179.33.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Thu, 6 Feb 2020 20:39:50 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::3d09:6184:e6db:3dc6]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::3d09:6184:e6db:3dc6%7]) with mapi id 15.20.2707.023; Thu, 6 Feb 2020
 20:39:50 +0000
Subject: Re: [PATCH 0/3] soc: fsl: dpio: Enable QMAN batch enqueuing
To: Youri Querry <youri.querry_1@nxp.com>, Roy Pledge <roy.pledge@nxp.com>,
 Leo Li <leoyang.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Alexandru Marginean <alexandru.marginean@nxp.com>
References: <1576170032-3124-1-git-send-email-youri.querry_1@nxp.com>
From: Roy Pledge <roy.pledge@oss.nxp.com>
Message-ID: <a46accbc-becf-ad23-8504-70ce619e2b11@oss.nxp.com>
Date: Thu, 6 Feb 2020 15:39:39 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <1576170032-3124-1-git-send-email-youri.querry_1@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::23) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
Received: from [10.29.206.83] (72.142.119.78) by
 BY5PR17CA0010.namprd17.prod.outlook.com (2603:10b6:a03:1b8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.24 via Frontend
 Transport; Thu, 6 Feb 2020 20:39:47 +0000
X-Originating-IP: [72.142.119.78]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 25c1ee00-a74d-4203-cbdb-08d7ab44b69d
X-MS-TrafficTypeDiagnostic: AM0PR04MB6195:|AM0PR04MB6195:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB6195BA43B5AD077BB0F29359C71D0@AM0PR04MB6195.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0305463112
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(199004)(189003)(86362001)(26005)(5660300002)(186003)(16526019)(31696002)(53546011)(31686004)(81156014)(81166006)(8676002)(8936002)(2906002)(478600001)(16576012)(52116002)(6486002)(110136005)(316002)(6666004)(956004)(66476007)(66556008)(2616005)(44832011)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB6195;
 H:AM0PR04MB6452.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yNF4t63QV44QE5f8zPGwcfe1tWsrPWthrpHyYLj+IB4/bqpActF11nFFxO0Tsgz0S373YkFxR584MgyKcnGi9WrkhwVq59sLvywWNlJzbS5F6Ppg2aYs81JpCDqidXOaeUFQnSDuW7oxkq6atsL+klPhXbCtujSBUvLq9jV+dlpfJ8daM9rRoepBMwPZILHQWcAFedN9ObgLF/Vd8jji3SQ5c2/ZMX5Pd//J1B8ZTEHmrSWaUk705iQERVyKfaUEQORRSmFZr6hvRyExQ/hYkJ7+P4PEBeoJdhDhzmip94K79qoOrkq7I0XUB+HV78c9gjVlQYpkXniTgB6iudrH9TywneSAipedbX0mg3z9HZsmUibyPk7p88oohs9Bc3oOnmG/og+r+rGMTyFiwrb3txnQg1dRED6GWq7cR9lNDOepwONA9F71MsbVhvrapsk1
X-MS-Exchange-AntiSpam-MessageData: IoQ9O0vpAR8zf8wXqxjP+k5PypJfomwiGVp8UsNKwXeEqk9n4QEGZReuflolFEpN6PCqyADgJtPPeJpxsqKSqEnYbJQ3nCHcG+yoUZtPHZoPfOfZ3ZNsY1Vl986OZUKymRv6iP1sT4B3lZbLsDuHYg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c1ee00-a74d-4203-cbdb-08d7ab44b69d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2020 20:39:50.8483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkLxjxG1y5Z8kTUpiMrA9iMQNituL/DZ1qaoltf0MQXNp5yoOWf7icVBHAszYJ3OPOl0fvOBYqGGWXrk6Ihv6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6195
X-Mailman-Approved-At: Fri, 07 Feb 2020 09:19:42 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/12/2019 12:01 PM, Youri Querry wrote:
> This patch set consists of:
> - We added an interface to enqueue several packets at a time and
>    improve performance.
> - Make the algorithm decisions once at initialization and use
>    function pointers to improve performance.
> - Replaced the QMAN enqueue array mode algorithm with a ring
>    mode algorithm. This is to make the enqueue of several frames
>    at a time more effective.
> 
> Youri Querry (3):
>    soc: fsl: dpio: Adding QMAN multiple enqueue interface.
>    soc: fsl: dpio: QMAN performance improvement. Function pointer
>      indirection.
>    soc: fsl: dpio: Replace QMAN array mode by ring mode enqueue.
> 
>   drivers/soc/fsl/dpio/dpio-service.c |  69 +++-
>   drivers/soc/fsl/dpio/qbman-portal.c | 766 ++++++++++++++++++++++++++++++++----
>   drivers/soc/fsl/dpio/qbman-portal.h | 158 +++++++-
>   include/soc/fsl/dpaa2-io.h          |   6 +-
>   4 files changed, 907 insertions(+), 92 deletions(-)
> 
Acked-by: Roy Pledge <roy.pledge@nxp.com>

Leo - can you look at this series so we can get it integrated? Thanks
