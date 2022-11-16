Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0A162C6E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:54:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9f00Wj4z3dvg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:54:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SIfcTqKj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eab::61a; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SIfcTqKj;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9Xy1mG4z3fBd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:49:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZH9E0mdu1UhOcbt9KW3MuIri6RWKYxyKBcil7r9auaRwPOPut0ickE4Zb7RA3M4CRFXNQUpYTL3YAR29zfC4A1uxf1k3S9vq+SR69Qhjr4IpM+2uOVX0EPqH3Z9xDD2scK8mcWV8CJngTK0V2m1acswcclB2JwOLq98GAm5NQY0p5ELMtBDHiwoD6ns1syPdxjZFkLmXhzYTSagVqVMsVSi7TCLvvujROw+EwLxb2qkyqN81LfrjeoCoqBT9PWAl0nP2/KdqzzKogAdrfKUu+3RgPZ9O2Gu46EkTZAhDd8XpIQxD0OQtmJACv+0H7ASc51GrN4kji8Ive1uoCYIw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVbWblcr5UHpUoxBEeZLfGVj8gE27kVX8S61D/74qFA=;
 b=WLvlof6AxR2p+qIjxLcxOrGDz59JojK+BsVRM7Ja4vaJD3UmKJF3xP61+/cE7B7u/98/P8Jp2Abaz15T0WZc8OdGvRwNqsqwe0+4kSKfw6gLWoqPBHrMMbBRVJ8EC/+KAz4GXZqicI3yo6M9/sMwSwGFhNEfGjxf7aI4biBPVrshksRSEVY4lXQO/9FJIBy6ZmvVtgrApsLcnRxIeq7SpprK/rDyKhAJ2N4AtoOEp601obOoTbLZIoWxcer4f2uFgjzfX03HQ56YYVpiHJHWow0GlAl0H7HkjkaoOsSbbGdrAbOXDtwl7v2oNWubESOE0XdIs5lSJqBOk9CeE7ywdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVbWblcr5UHpUoxBEeZLfGVj8gE27kVX8S61D/74qFA=;
 b=SIfcTqKj4AyekMoSsl3CFB/EUfN7l9DuE7SNPPd3JplL1wGpwKKa0k6O3oYXU/JO3r+3UnXC+dN72c+eudyjGbuLs9u5nFzplIZmIAS3OX5FdsckHtIE0MzOVWFkblt65ab2wBi6MuMtv9f3r2/UUkK/GGIX5TLloTxU7nJtWjPmETTJcXhHUR8k0ljProcCVGEuhSzMZ/HrkD3PO7wCmeahJKxSERE4+BAr2mgIT1tYYhLLMEILU37Qfm+mNOqW/3jgLXCvWmHYNvoVZBeZpTOWTbASUS2n6bG4nBOFsJpwlTVeO5c/QfnYbW9i04jFvDh+jmbXW7dwvV5OSv+jGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB8145.namprd12.prod.outlook.com (2603:10b6:806:350::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 17:49:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 17:49:17 +0000
Date: Wed, 16 Nov 2022 13:49:15 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 12/39] genirq/msi: Add bus token to struct msi_domain_info
Message-ID: <Y3Uim3pC3hy3HwH8@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122014.294554462@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.294554462@linutronix.de>
X-ClientProxiedBy: MN2PR22CA0028.namprd22.prod.outlook.com
 (2603:10b6:208:238::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff9e9fa-0196-4346-705f-08dac7fae1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	JdgW1x+o6K7PSyyEQWDrsg41LwOOcgRVvBDFENrZ6Bdp/pAz9Dafyo2BeNishBG3eAT7Ql4lseiEDmr+tSc49kPOOt3cU5NP0XCCpxX6WcoESNw7v1sbJm8l55JEva1x2kORphdITJ3e/ctuCK8AfNGJE3SnOufMAdgTr9S42OCbnl32Hw9oqhB9wXQzzKMDCZN0K+i12/NRUzPd4VNm+gmg8ueK84XiTBpngvC32K22EI9SL3QLjsRk+OjFEZdX+J7ULBSro4M63sU0JYYDkd88+TkdYNozfWyYoF/hHLfVGdx1Veh0N/mabyvppYaqZn06r5+m7zGxXWsxxFCwiaAYD4TO9bawzjdrTT0dvxM7CAgWLl7DdMPE1kg9OHxhRwkh0Ppkp8q6nDjsNo5USb+Op1QIKPodqmoWe+BXQDyaEhakgGexD+eTLB2npjFQP5aV5rPJW4kFJg6B+bs9nvf+gTkcUxYTGYHyGHpAViCnXlhw8j47zmSb7kk9mkkhId6sXawH3eo232fOzP+pwL4ZI/SKOCnvVeGb43NbTMierqi/8bRFRRU04YBJ2VUh+kTCie3Eag/oKyqFejuHrZhbdy0cRXZsBrQErrS1kg94aZ+nc7vHcINp5D7bzEZMA1GpS3nh7LQLsc0jCkxLd2tp4MxcXMzSeHvqUE/gFyvDJXrW8yaRFbuCHSgalGqedw//GGz5odlIGY7qT2rLWA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199015)(5660300002)(7416002)(41300700001)(2906002)(6486002)(66556008)(8676002)(66476007)(66946007)(316002)(4326008)(54906003)(6916009)(6506007)(86362001)(2616005)(6512007)(83380400001)(478600001)(186003)(26005)(8936002)(38100700002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mI5rTn1F412KO9ruMqqTp7ydn5TBX5j8B1r4JO/I3kEixuP819WWJctxBE1M?=
 =?us-ascii?Q?KEY8k+OJbhY7IwRO8L+4nN4TJ6+p5PvE5Tv+03ZSv8ilV53lz7UqJqUcFhsU?=
 =?us-ascii?Q?Hfjhk9ND1p2/NVfVFLdJNtYWWQTZjJCOiiMnSnSlArHekKWMnmsWduRlZoCC?=
 =?us-ascii?Q?e4BkCyw8TnsanGtPfQY+Besaq5QGhHgkFRhnsQjs1wLFurcgKdYHXU6D15+b?=
 =?us-ascii?Q?mUdGXkofm21s1gwI8v5vo/LgrvITLA5KRpE4CnpPJCh/EBR2lraFKrZZXkA3?=
 =?us-ascii?Q?+pC8fko5r4aDKBkhJs9l1rPlwXKO/eVVMRjYZBZe8YnLMzG1FKVzaQ6B7gjI?=
 =?us-ascii?Q?iwz9Yqh9dYUESuV+CAWFP/bi/Lx1UTsihiJNAfS8Z69G1or0tOm/lhh+PI0F?=
 =?us-ascii?Q?ScDI48Z2e2NEGd1blrIxLWzQ2bS8vBEJXMVoY3N4OMUbiSYItkWzUnursjbT?=
 =?us-ascii?Q?aUeQctuH3TvyYhZgoDG8wf7qkAhaMvyr430HkdfAhbTYL/N+nN+CywxGNpGd?=
 =?us-ascii?Q?QSuzFtyL50u4pMzzGhqFaCbrM0Vx42kY3xA/x5g9+Mw14K8g4F7G775WYmbD?=
 =?us-ascii?Q?e+bqWa3HA8VhByTxXX6elkriUqkgF5fgb8ctGdFDMVIdIvLUHvfRJPKd19zq?=
 =?us-ascii?Q?IZtbrBvH3AAZVX/d30Gv8oZVHN/i58ULZW0tHI6Ym4NIH4c68YufEbUBiT5S?=
 =?us-ascii?Q?HpRP0vZZ20aZAK8SQ6M0N79vVUTR+DwwkHm73bQMSxL4U3bN1g8mND8YO78+?=
 =?us-ascii?Q?x2gZ7zjlqC0T9A+1nSt+YQSJdffZm7h3aUIG1A75nq3tuvs28ocsyoCeh737?=
 =?us-ascii?Q?KIwQjS0PdFgM4cl5XTYBxOc8Oixz+6FXam94BCh78XojaIfvuMCiif9cKaZ4?=
 =?us-ascii?Q?YOCCiYNDgR41hRgzf0/x9QBlP36sKfaIkSxZRIEP3EOmQ7S/l9NCM1SOmb0Z?=
 =?us-ascii?Q?fomZCjx/0OpwE8b70M7pk5aI5pnIM0y8jjS7egUJ+Fl6iLpDto7VKsgUf3dl?=
 =?us-ascii?Q?8vr7wZNCq3FaZYqy9PVr+YY947buA9a0+J1b7fZLKraWcilcpynHd4gIWigY?=
 =?us-ascii?Q?ZVa04y3NRlikDb6XBJjViyC9HATIgIlF4Olytzyy7T6c0ZcqjvSiaGLMwZEi?=
 =?us-ascii?Q?u+vOG+6D/XPRKj7gTD7bE8smFjuzX8jCzcZhgYdXe5V9/oX56zWHrYn0TwWS?=
 =?us-ascii?Q?ONzZm4K9Nk9dsjHTghX37OtN+cqfjcph58iteIyRjM7BFKxk6dFoZgn2bsak?=
 =?us-ascii?Q?RsEgOHSXU25PxVP4uRYw95KA17gfZH2D1UuDMQbxt2+wMgjkqgqM7qOlbu+Q?=
 =?us-ascii?Q?FZ2O1IHhOvVWjOyyY2UPhm63OKXDdLmwOlrr5HRwrRaly+aGEAlyfzDDkK6A?=
 =?us-ascii?Q?4rinZ8tbcAqjm2zdBv/EkoJw/bbf2B28SiMMXNQ0xaJoblizy3ZHrMPttF/p?=
 =?us-ascii?Q?6E8tsN0Kkct2Re6AaFaOB1ztjXHPQwUiFYlZF0ldnQNjF+1Zm8Xj9l4SvAi1?=
 =?us-ascii?Q?00+Zawa6yDhfZ5f0r6kug5SshDSuClTKF3/qJ6A7NFWmDx7NVL27lgC4UeAi?=
 =?us-ascii?Q?61qkf3tQHC4fL2onBiusGagApotr6FMIhvHPMyGw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff9e9fa-0196-4346-705f-08dac7fae1e4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:49:17.4129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Bv0P43cr4j2KiXUugb01rjekYovhjUYiORhcqoTegYWIjo59bOAFgoFocNwor85
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8145
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 11, 2022 at 02:54:33PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> Add a bus token member to struct msi_domain_info and let
> msi_create_irq_domain() set the bus token.
> 
> That allows to remove the bus token updates at the call sites.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  include/linux/msi.h |   19 +++++++++++--------
>  kernel/irq/msi.c    |    7 +++++--
>  2 files changed, 16 insertions(+), 10 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

>  struct msi_domain_info {
> -	u32			flags;
> -	struct msi_domain_ops	*ops;
> -	struct irq_chip		*chip;
> -	void			*chip_data;
> -	irq_flow_handler_t	handler;
> -	void			*handler_data;
> -	const char		*handler_name;
> -	void			*data;
> +	u32				flags;
> +	enum irq_domain_bus_token	bus_token;
> +	struct msi_domain_ops		*ops;
> +	struct irq_chip			*chip;
> +	void				*chip_data;
> +	irq_flow_handler_t		handler;
> +	void				*handler_data;
> +	const char			*handler_name;
> +	void				*data;
>  };

This is why I've been frowning on horizontal alignment :(

Jason
