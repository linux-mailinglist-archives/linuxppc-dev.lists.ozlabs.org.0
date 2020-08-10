Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B10812413FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 01:56:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQXsr6jSzzDqSZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 09:56:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.40; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=KcKkDyHF; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQJPH26nhzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 00:33:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbPOu3ULmQf7Ogod/cXDQ/mQwJE4pj3XlwHO0+FC4t/0Wq+g2WZOH7ZyJ9OB2+UoTq3yLJsLpvMUl7BY8RjGJWLqMiCllNwMxX22TpRVF6juQ3dxk9Kc1jlEESfrulXYWeX2v78TzKm6m7IoHWy5KEH2TvIfhi/GKy7kLVFHY8ZzRDoZQOVoSPekvYf7r/dN4NH9N9i9rTRwDk71lgsiQt4WAOC89kwBlq/xD22zWgp5/XbGWJYJ/9MHA1OuznVQcwpaaj6PXJpaVEg8r29kTwvaoeCrDMy1sqCEB+zCoFdvgycRwBUtZrnkovH9upjrnv2fUXE2iIIxgzgjYRRznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1ii/Izet5M8Db8YInQdGB3nftdv2DhbVv7JmeUG/0k=;
 b=dA81RkbOHQtviLBvuYHur3OJggU8jY0XtGxykjaKQ7pYiRP+SHB/qf9o7JOU1FCw0IUyoTXpzqBWV3Jqd0v23szPTam/W/zqi1UOAajDeqqI3FEM9opBtQ5H3wW/U74D0tmstHNC5kq1jXiCWzK2JJiwLR/WkCupMTHSAOqu6SraPPnwRpLv6MOvk3Xl0Y3lgAPAWkfXuZ9BE33zrHgl/42E1p66Y2RTqkRrdZ3uqux7RzAA57iS3Y4U02bJNOvESHx7v4kMraa6P332JrQ3gmPkNcs+YiY75q+NIngKcQkjuYqBsx2AK8f7dI8HfbA4BPUzT8n0HV80mybFYu5FGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1ii/Izet5M8Db8YInQdGB3nftdv2DhbVv7JmeUG/0k=;
 b=KcKkDyHFzXgaLu7iDt6HC1o2m+dgC7nm9uWJ77IcaL+NvHqilkQPHfnMnUpiKYEXncuL6dtQIB8GD9Bzz6/5AL5DqU+ijvyYduz8l4dEcmhQweIDmrA6GhAmnbG55lH5rgmsCG+CLXLWnXDoqkYdtbTkeBPPe0FP8KZyviuWn64=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4046.eurprd04.prod.outlook.com (2603:10a6:803:4d::29)
 by VI1PR04MB4237.eurprd04.prod.outlook.com (2603:10a6:803:3e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Mon, 10 Aug
 2020 14:33:42 +0000
Received: from VI1PR04MB4046.eurprd04.prod.outlook.com
 ([fe80::8459:4be8:7034:7a81]) by VI1PR04MB4046.eurprd04.prod.outlook.com
 ([fe80::8459:4be8:7034:7a81%6]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 14:33:42 +0000
Subject: Re: [PATCH 19/22] crypto: inside-secure - add check for xts input
 length equal to zero
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "Van Leeuwen, Pascal" <pvanleeuwen@rambus.com>
References: <20200807162010.18979-1-andrei.botila@oss.nxp.com>
 <20200807162010.18979-20-andrei.botila@oss.nxp.com>
 <CY4PR0401MB36528610C3ABF802F8CBF35FC3440@CY4PR0401MB3652.namprd04.prod.outlook.com>
 <20200810134500.GA22914@gondor.apana.org.au>
From: =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
Message-ID: <fd3e5862-3357-7dfc-6c75-30086ab19f82@nxp.com>
Date: Mon, 10 Aug 2020 17:33:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200810134500.GA22914@gondor.apana.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0083.eurprd02.prod.outlook.com
 (2603:10a6:208:154::24) To VI1PR04MB4046.eurprd04.prod.outlook.com
 (2603:10a6:803:4d::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.129] (84.117.251.185) by
 AM0PR02CA0083.eurprd02.prod.outlook.com (2603:10a6:208:154::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Mon, 10 Aug 2020 14:33:40 +0000
X-Originating-IP: [84.117.251.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41bd7969-bdab-40da-8e7a-08d83d3a612f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB423746628261C2719DC29C0198440@VI1PR04MB4237.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dc6aSZ3g09Fh64a1iE1NTXTvoWwNYcJ5nzRTThX2Cfs3p+Jt/rigUisaMB0A/cEa/Ps9SgB9le1jz//NpYQ08u59cNq9J58svyZHNNnnT8n9bAR3c4Q3JnLi5b7qGgfJ+0xfOURTGRFCTULs6V9bT2fRQHx7ypquuC+YQ+F7/sQr+mL18gnCbqKd//2yKpdr/zTQK5Y9Il5/LII4BO1aJr/u8MAiqt2L1fIkXIlTlCR1gWYdUVdp3nbMkmiGAxxlcQ5NmfMsqx479l3ybhg+qPhl8AawwHlr/K+Owfp2rVo2+MWjNzoW3rP3VOLhUQPZPWLBPa3eFzUKn9B4rH/ce41ep6udMGyzEZCV4V0qviVJhY0siNn3sk+tiK+CmV07
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(2906002)(83380400001)(16526019)(53546011)(8936002)(26005)(478600001)(4744005)(36756003)(8676002)(66476007)(86362001)(66556008)(66946007)(31686004)(5660300002)(186003)(52116002)(4326008)(31696002)(2616005)(7416002)(316002)(6486002)(956004)(110136005)(54906003)(16576012)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 9Aub7ZarZ4jYt1XvKycWoxbzkKPRd1EGDaAAWyr7lbibwWA+MuQC5D1sI2j7vHTvFO3mXKuTmnphDLtYswg1rAPXMrW0ikgl3Qya4YVJJTuhwbN152y0vqhoFZ88hA5UfsmQpGphmNbzCX62+NpQ8uSLzSV2i3DB6z9KI+0LkUELl/q2fhOAng1yaNZCX0LHE3ppg6ArnPH7rLGVjhKJ4n3r0MAXqfwv1GI3EYNvwuho/L92S+b6aA4CdevzvsQ32+NV/l3OTZM5ZzumPHQEFn+JKQpA6uncN9EMexfgG//bYI+YVD8xYnM4QGVgattpgr2UzggWLaKiV4QQCKSTaf+FQtmAl2N+RA/ATQmvvPGxlLk08kjT8X1Ya6VKpB9y8Br6zd9C5kIXdX7bJ35KKZbsl4OjNs9QzFSJ0+dskjYffoU+3dlcRLAFBsRbAKe0QOONPj+JJSK+exhDI4Z/xAg3a3nm5gNzYPLewyzlSS13fMuG0eMljeUIpJHKzV3eOofK8sKphymUENO29iHlHzGKxfFtlAnEpog1BIPBBFVSoLttCymF0uNglKtibHw9lkgCejN303gaAgT38YExmB6YyX5nx0WpLtzH+otuGV+iLdxmyze43wlNrJc+yXtHW7unLi0sUNryxtM+9LcbZA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bd7969-bdab-40da-8e7a-08d83d3a612f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 14:33:42.3337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJtoVlsHUndTVHtUFdJqq234rFHuixV8OtGvTETDLfT3qzFpJZX7ahUgdw3ve2KJJfRYl5bDNIIj5+FWKmex0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4237
X-Mailman-Approved-At: Tue, 11 Aug 2020 09:50:46 +1000
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
Cc: "Andrei Botila \(OSS\)" <andrei.botila@oss.nxp.com>,
 Andrei Botila <andrei.botila@nxp.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Antoine Tenart <antoine.tenart@bootlin.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/10/2020 4:45 PM, Herbert Xu wrote:
> On Mon, Aug 10, 2020 at 10:20:20AM +0000, Van Leeuwen, Pascal wrote:
>>
>> With all due respect, but this makes no sense.
> 
> I agree.  This is a lot of churn for no gain.
> 
I would say the gain is that all skcipher algorithms would behave the same
when input length equals zero - i.e. treat the request as a no-op.

We can't say "no input" has any meaning to the other skcipher algorithms,
but the convention is to accept this case and just return 0.
I don't see why XTS has to be handled differently.

Thanks,
Horia
