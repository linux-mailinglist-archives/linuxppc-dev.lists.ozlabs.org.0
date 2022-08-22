Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC9959C391
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 18:00:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBHB30BH3z3c5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 01:59:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=jImNE5fm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vmware.com (client-ip=2a01:111:f403:c100::1; helo=na01-obe.outbound.protection.outlook.com; envelope-from=namit@vmware.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=jImNE5fm;
	dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com (mail-eastusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBH9D44Pdz3bk0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 01:59:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmetKVAQu1LGAqEXvKXb/63ug8qR5aHYcjg5wrNHlqh++WxGQ7td+iBApzC5xXo8h8E0Eeb7aZ38QnxEhH3SNkEQpLawzTX0GRl2UYtpuHydXKW0bydub6JS7wJDSGLFzo3xzhXSweEjchyiQB/jY2AMMin8CDyq5TfIBMdiFR+HBICPUhiCdykPO2QCeyMimgA3QZCrj6ALwxJBXBtIjW2zl4rWETc5fccTVkaqb1M0KINIGyp6ymdjD2AzSAcvEXKfIuWEA0G+/mDNjMM9Wx9Pc+hZNtayBz3/26JHCsL6VRF+VJjW7MMn67SztC76EGbKFo/wdYXb6W8Cg06Qgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UD7YVNI+KLftqKKS09Y/6FtAAIvWF92eRiyhdXUMms=;
 b=XRnYSMMbPg0Took6AZ9wZoa34Wbpy0tq98c5D+VPWDvFvps4QBD15uUdaAETKQufvVl4GVX0o4bOamMDoiNKEvyYrWz1Sm2LuHeZBKNsa3e2jnHEQuzWdk15rS9TP0Wd/nNIvLduFubysCPTFia3pkXdVZBTTTOQO9rlURF24MqwRCPEM4+RdkESXoS2KpL/JjxNSEKCNPZfKRqAgVi21zrHtAWbLsvhGZJP0uFFiPHSWSMwgCqescD/u7UK8Sfb0ySK7XUUEgNYEQA8m018XmqPvz+ScGhLi6ur387IGBH/VGQmZmD6TjaTiilCUVdM+qNMIYgjk59UwOjdrAQjQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UD7YVNI+KLftqKKS09Y/6FtAAIvWF92eRiyhdXUMms=;
 b=jImNE5fmhrJVLbKfeMhs4+6KjZTNvQGarJ3jfPU3ui4Ym8Kh7l1GhcxkfsjeG5MIMGr798RZdlng4vDmtCs8UC1uiE4FIO7IfyRw+3I+0/tGDme6mp/dayPIk3AMeGGFS6tRht0YSOH1Z18fERWy83gqS+wYFT+5pNdLh6z99fg=
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by DM6PR05MB4972.namprd05.prod.outlook.com (2603:10b6:5:30::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.4; Mon, 22 Aug
 2022 15:58:46 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::d813:9300:4877:39d0]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::d813:9300:4877:39d0%9]) with mapi id 15.20.5566.014; Mon, 22 Aug 2022
 15:58:46 +0000
From: Nadav Amit <namit@vmware.com>
To: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
Subject: Re: [PATCH v3 1/4] Make place for common balloon code
Thread-Topic: [PATCH v3 1/4] Make place for common balloon code
Thread-Index: AQHYthvc5W82hOyqH0GkebcfYZVFV627E+WA
Date: Mon, 22 Aug 2022 15:58:46 +0000
Message-ID: <6B5E68C7-EDDA-4F39-B406-BF2556577890@vmware.com>
References: <20220822113747.3630776-1-alexander.atanasov@virtuozzo.com>
 <20220822113747.3630776-2-alexander.atanasov@virtuozzo.com>
In-Reply-To: <20220822113747.3630776-2-alexander.atanasov@virtuozzo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef768716-9cdc-4364-71ac-08da8457323c
x-ms-traffictypediagnostic: DM6PR05MB4972:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  R0LD6Kjj4/ZJNjiNe5azKaIJKCBtgY+TcwyE6lhSqDVeU7snH78iEbDvQ+JwwPwWl8tOzF49zRrC+Hg6321ra2OYX9FtuAxwWE6mJVRjb+z29KMmkmmp60TqcEMiHbHQmUn1b/lsz4GDXig0N/mDBFC7sPJ4HdBAranPdS2AeTlI9fIAtREtN3NxysLjPo/XkJeD9GMJunyxlAY+XOM2udu0us8tvNOeUvlQwBfutwS8eSvLol1EU+K3yVTAZ/WJUU9ikoiWYgU8Ah7pSNOrvbBZk0FTTom/+NS1mZ8wcsHacnt7X6uqcDy0DSDOSS4pkcQWtXIz7j3oKCf5CwtdXlwAvuHhlPLR7CPKaVVxOTPKt2LcyQk3mVNfxhcYZL1KAs99N2fABHKd9oO1wZrCf6Uhj8ngEoXmE8o9pVYR5LgqYlXQO8X6WZ/V/RiohiBbxv3hLyH3trRDPn2uXPI9AAPW6caqPlp+5dUFV2sJKZKFAjI6A1PnJoFl4bdSxM7LprT6kWsqs3auMGqunjEt3lh5zq8Q/CK7vZNwqReeieQAK7lgt7Elmq4msxOU5hMTPPWB1edh6zIyxxZ9y8bNTqSByhQj8vJ6ULHKOZStmMbP0f61+2YXqbPAn+sWLjrnWCrVtG8E6RgsXmwwQcRiKfJeECW8jq5eZItlzZq6jNzXJBV/lKM4K0qjBAJhCNQ6oWBzygDPbSnP+ZKp0DKGaCDT+XvmgKdYKdL2s5RnKHCPEB3gD+0ItZlyzKRAezXorrqEgTE3v5FaRPHoR15OK+xJrltUWBF9ycYYo2Xgge2g4RnH1rwP7aK4WmXlM8p7n1THXwV3yXEOi+baNn+a5zjsiyi5MClAf2AzMKaYuFM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR05MB8531.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(26005)(66446008)(122000001)(6506007)(38100700002)(53546011)(6512007)(186003)(64756008)(4326008)(66476007)(71200400001)(8936002)(5660300002)(4744005)(66556008)(8676002)(76116006)(7416002)(2906002)(6486002)(2616005)(66946007)(38070700005)(316002)(478600001)(41300700001)(54906003)(33656002)(36756003)(6916009)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?ez8QEj0urOZNcVzPbILPsNHrNu5EM4Bs/q5vSZKXUu783CWrBzaLsKYTUmQM?=
 =?us-ascii?Q?h40r6GPM3z04yynC59miRIrmeSJSLwIjyLizh0N/44U8zRznWlxBcGEEKk1o?=
 =?us-ascii?Q?nHv4BGJFVe4UyvbYSim7XUfFyJEtpmuQHGeJkuyqqyzjP3fAZGMwkbymtdXJ?=
 =?us-ascii?Q?XrZy8G+RE1M5AmYJqchCVQgOu6MjL06XsBGt2Lg2QWez+VwZyg6DxtTdeBUO?=
 =?us-ascii?Q?vtcpHq+/MaSLq/4ZiusJ97E51/2w3mra6c+tHXoY/vOiJyYTIUtTVGSe7Uvw?=
 =?us-ascii?Q?hW8aCcCd6Zg3gORHbduBnEiZc4Wtyo+CGd/ruHQLo5JQvH44oUGXRuYZqgYM?=
 =?us-ascii?Q?838bAjRlHAU5EYwYCCUwikcg8+XNx8g7Q2kGHfqAoD0FpNHmy3LQjfp2TwIL?=
 =?us-ascii?Q?fTMFaIn1oqB+o626zpSw4ZdYmCVdwUH4O1UupbYvr5ic72h2FonZkbVpG2t+?=
 =?us-ascii?Q?qZS25LyYxO4oOBCJdy+VhbN0h+hkFRjcOKyknmvKuTs41CgiJgkeUsPTgvIm?=
 =?us-ascii?Q?X1nL+bOjtfx3rMqx4uMuGq6r8Rr4UDWNLyZ4sYnlKFlbZbs9jrtYdMrCv+Hn?=
 =?us-ascii?Q?FRUf2FwFFAnLkN2Cws77awRyoSuxAqswLhDUvG2amJteF1QQ5gbiXEcX6EmI?=
 =?us-ascii?Q?f8F3VAlSPnn+BA9DLKDwXrQ5KDMqZQgWrk06L3zANb1kJrdwxT/WxvdMK6MR?=
 =?us-ascii?Q?6/hKkzNW9sRmJC+on1qwFlexHSCMJ7rS5YEy0dhtJrSnhlgV11zY5WmP0e5+?=
 =?us-ascii?Q?j/nqS6XATMal0ckaFtYWCVNMPp3cHGcaoi5DWWBQzJtLO60rPFjjsFAtdSPV?=
 =?us-ascii?Q?Yso0C0aIjeq/HAJ4QWy4YbIo0AGBiy509lLELq7wthM496BE66opvca/g0Or?=
 =?us-ascii?Q?Esycnampvqz1a/dGoKGCnDzO+HLX3X3YiPnb2pj5BtylffPSW7Wo8C8JkaL7?=
 =?us-ascii?Q?TIDCo7qWtLQbWCSJm2vgRHEuzfBbwUVipjLN0u513Am9zPB3Dj9olgS6v+Bc?=
 =?us-ascii?Q?ilY1PqLckOjbcKbZviMYVbPOf54AfPIFgCDfH/ByWiXGjdNeqExU5Vgo+/BH?=
 =?us-ascii?Q?sTGxyfC3hdvjtFedsoUuUT7zB8UC+4ZyIMWw6FzHCrtym4lkPqbCRoCGBJY3?=
 =?us-ascii?Q?Of9IHQBNnKdMYGv/YBZsqOy26vsivHV616pIA200Vh96NLl1OOXPXRBaPCAh?=
 =?us-ascii?Q?cXAc6pQUosM+5uiSEI5HVuYP8g3/kAr1PlEw9zANMAgcYcYV71+tAEYEq/t1?=
 =?us-ascii?Q?sLuM/mY3ZFoJhCLw1GKiRIM8vpsXslHXnqp/HcG3XTE5C3i6USZ1NKWR7myL?=
 =?us-ascii?Q?tmAWa618wGpAQdDRMbBhurvg8yPQ6XsTzeJzcmmSHEEw+83KKMgUbtKwwiNc?=
 =?us-ascii?Q?MG8U+OVmLcDLRnP3GnbANBGiJ4b1El34Tj5qNxhSynrD8i/W+gELpPPbHm9n?=
 =?us-ascii?Q?IAURWbG+aNEfkZzz2tTDQVirs3TiEo0vDv8J18szlhJ7yxCVdZ2nUcwEU2EX?=
 =?us-ascii?Q?Unrrvt5tkHzEMt2nRmfNEitpPJjGZF8Fl9uJCudTM8zTj0eLK0pujembVcUE?=
 =?us-ascii?Q?sl2Mi2gHLnLvF0myjvjOY6rQ4Etp7w9b/hz3hFMG?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EB7CC2F096B4CE44834D427A719BA854@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8531.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef768716-9cdc-4364-71ac-08da8457323c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 15:58:46.5564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 43MgqFBD8J1seLrVHiMYHHQBAeWJMCjgT2mAutsyVome+orjXnS+PW2VkrL/kjk730hPgCJNca9rzaJ/3C9Hqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB4972
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
Cc: Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>, Pv-drivers <Pv-drivers@vmware.com>, Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "kernel@openvz.org" <kernel@openvz.org>, Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Aug 22, 2022, at 4:37 AM, Alexander Atanasov <alexander.atanasov@virtuoz=
zo.com> wrote:

> mm/balloon_compaction.c -> mm/balloon.c
> File already contains code that is common along balloon
> drivers so rename it to reflect its contents.
>=20
> include/linux/balloon_compaction.h -> include/linux/balloon.h
> Remove it from files which do not actually use it.
> Drop externs from function delcarations.
>=20
> Signed-off-by: Alexander Atanasov <alexander.atanasov@virtuozzo.com>

Makes so much sense.

Acked-by: Nadav Amit <namit@vmware.com>


