Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A7362C695
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:43:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9Q1230pz3cLs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:43:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dP6A0SDT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::61b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dP6A0SDT;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9P43Bz2z3c38
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:42:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItusPQvy01XZf/jFwJGp6IdlNeZ3OUqQ6h9HEOIjU/KYgx/V/HaD25XfVasC2BvC2QB/sza9j/5j0R9FXIQWicg83d1hOSNsZdhOOOBZsdz9VVCxys4l1qUJMtVFsATnufkH21dSNDY3UAPLs9Kucg3/J7Q4srRc0Mg+QZvvSkQRhk4gRnjjO/gLyYthgP6EksHVD1/3L6DPMRReeDSVrBBcvO6IuL8crWzYqBSw5DtsJXx8nffhxvuihoGpQWoJJNdOMfPmM8SqKdLX05dS7s6yWvnwgNRlVUuOIxa1kDKhx4SYdk7sZV8MqYMfReuXqjvP/Utaoh1BMCff7cxJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAwIBM2KWkap8qFkngYS9Ko74bZLIjEaEzZvYGVzmfk=;
 b=UEXrdf0y+EyUJ18OfG0yIwbhEfT1W/+F+PiaivJiqZFx80UvI8JlQGfSjzGbYoWEuHqif5a7dxbIj2JxPobd6VZR5LGJkSx4Rv9OjfwtNxP0dPeNmiZ22JhBU9UpsNqyvhG+DftKdu0dSAbSNqAK9Ao/sddiSEXb50B09v+RpZP05pijiTMuXQuSeh16U6mEm8HRCOcCYX6yJswZtKukakW9ppxmmblahvmHmZ6OVDTeuCvR8r47lA/Nca3udJSD35d2CdVc0C3ljyLhAtXKKS3iWNrGxJ+BopbJmGNR4JlB8PKfw5MAYYT6fzrulCOpBxl+45P+Vq1L4kcQUDYraQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAwIBM2KWkap8qFkngYS9Ko74bZLIjEaEzZvYGVzmfk=;
 b=dP6A0SDT4htO0r+9SQm6zrnsAH6x4g0B4lZVNEDW2lhoPXj7x9VxxtwVN0G3IQPuhIkb+yZrFK5zo8goA7+W4yZgWJrkItbrtIF2xr4atIBkjGn88v+SDSWyPWPnJioeWhnvuvl8GS7SNAWLo0duEApc59H9sA79pwfqRcNQyNbDMQ47m5MlhX7OEYFGg8mmiaQlnhI/HpNKyeX8pnNgAczkudzDLW6X4JqYrGWKTH9Irhh7OyzdYE7jgoVtikyliA3m7xxL49ZDkNML/DeR4j3DXy5KKXUJPZ7mOlhJBrOBE2zpr+OB1bqSdWWYANddArpJjIERpj4XGrC+E7D/pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6268.namprd12.prod.outlook.com (2603:10b6:a03:455::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 17:42:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 17:42:25 +0000
Date: Wed, 16 Nov 2022 13:42:22 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 30/39] PCI/MSI: Move pci_msi_restore_state() to api.c
Message-ID: <Y3Ug/vWnDWBfKw1l@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122015.331584998@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.331584998@linutronix.de>
X-ClientProxiedBy: CH0PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:610:11a::34) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca37360-7821-46a5-35c5-08dac7f9eb9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9y9zBz4JtaHE35HD3Yt2AeZ9SVlrARrEgBYMGOanu9/UIO0cS1jLixLHjqonYQj0hrLvtrDMoz50i+Z+pbQ5FYt/xE5aOEBdHfUzBHaIEL91Tz0i8o6drFz6ZyH7lvu2f4rmt9uB5Awy1f0OcXzKYdEFBQfUqAljDhDBpw9yN7It8cwzSD5hNyRvjpMC8T9EI67IbfI9UMzl4pyFcs5Pcsa1+Yp+8FLVME10xgXK95O2YEgiJpjir5rq+arE8BaD9xPAkiMa5uh8JtuDdLrNVuIktXDdTUNo1p3MtI1HRj01URC5gJ78M6ccb9XqgGgYYHQhRF+IQZaUg0/oZhHE6f2gIWM1VQxBKnNrPaRgxfAJ1vTxd1AOqjG6ATlyiNVmB79xahDW9NRdGqkCgqo5oiE+97wdl+BII2FDJs17o77qsxwZkhM1PQhr5s/ehsIs9HYA3zu3GLIn5d4SR9iEXjZWwePDwLevifgTmoNk9Zv37OThCKCE6k6k0cdP/CdNTcCXDSkgOfiyDReon517M+9IAW86xxldy171TplJlXgyfAK+T3OWc0b7yXtxxxbKYJqyVvxB4fsdJs8fbBgO03rTCWfkIm+Oy899FMjgPjQB/oDc+CEh4901RKql6a4Gol2phiaNUDKdNUi/CkolN0rwgXOB+IXWvuWR2UPuE+FJkGQBavkY5u1HJVuKIm8RQCXfPI9Ttb6DMaXfp73LXg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199015)(2906002)(54906003)(4326008)(6916009)(8936002)(36756003)(66476007)(316002)(66556008)(5660300002)(7416002)(8676002)(66946007)(6486002)(478600001)(26005)(6666004)(6506007)(86362001)(6512007)(38100700002)(2616005)(41300700001)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TJedsFT2JeQQYxp1tRBULefV1Cbvo+8UEJ0ptxX+R3p266s78JV0eoFZ4Kcx?=
 =?us-ascii?Q?nAPLAsbY9c81KS50BBH/Jt5mYaToN/RWNN3+p4kDft3Q0f1sZ0IxCqL1+hJK?=
 =?us-ascii?Q?qDBIGCQsjo3nSnKSInRuR++Z6v3bxKQ4aQsq/HmuYv5vew7oBPiEmjfZHpvq?=
 =?us-ascii?Q?bpFcFT2uafopY6fiX7IZwk3Q8tav6UbIZdnXnFB2tXriVGL9ZpN+1ZZzZIlP?=
 =?us-ascii?Q?CA3f26kwu8ydKC6iByJbOPfro2gb7nE8jYLfXOcJMlSWdBSVkXyNKZX1EETZ?=
 =?us-ascii?Q?BqLKRSIZtGJBi+aKjbi85Dn9ESKuEdUcl8MCC1mODpPkozypRprLhYFt8W/D?=
 =?us-ascii?Q?l4aeJL/5LJgma+O6a/3BOHjH09kh2Lt1DS2z4cxq5APJnm06bpYx8T8CALDD?=
 =?us-ascii?Q?TEyDr1fkts3HDlkzeT9l4NR80YEMKB1O2jsJyFHSw8hVftl7FQhbUI9UMiLX?=
 =?us-ascii?Q?pKeXFiuljX4QKET7fAphj6eGTcdcvlZ/RlzA5LjKwrztHrYiaaLTIyf7zobs?=
 =?us-ascii?Q?766iSRVnN4ya6yKYvJ+cR19xcD3VeCE5Mr4ZWEA54zlf3nJP6jrkBdN8rtMu?=
 =?us-ascii?Q?y0WDQf4333sMzm/t0FuTLHqmhc/wYxLVA9n5TjuSs9RuzGeWJLEu7zmXRCau?=
 =?us-ascii?Q?QK9adZI8QdtQEPYLu7oXqsodMp5fnlm3+0Ywp/1byikhjOBPBTH3GEgTPkbi?=
 =?us-ascii?Q?N2r2R5tHVrbP9DHVu7dFBCZN/Mu0dV5hjvqHwen46uU6OBpqHk1Y0IGSIdY4?=
 =?us-ascii?Q?PC2OV0m1gJvtp7zWwuYSin0LcGWCskhzQJNT+lcMNC0/uU0SwUTAkGjwbdjW?=
 =?us-ascii?Q?HUIEr3AP3cKEwxl3wfwo6+/fUKdgeUPsEN2dwE8R4JbjKa+pSbEkftRWMNEI?=
 =?us-ascii?Q?A5LHovz1uQVYuY98ey4Y7xMRLCitRKrlz15l8cdfbBdcNR2FvczLRlAlN5kp?=
 =?us-ascii?Q?n1PSai6qNP/0i1RikNtOJSH2MrajFElfr42DgGLLMEsM5ZQ5+gFWH3cbi4E4?=
 =?us-ascii?Q?pl7SG8mvVvO1IIskQ0gfr5nqzFpNHaTD+YqtfO6ka7VhGMeFNc1NQXOJwwBX?=
 =?us-ascii?Q?u6ziHRFECyb79+VShncYw3imX14iMh7nOcEtBmV/ExhBIKo+YkYxmzr0jlt0?=
 =?us-ascii?Q?ZJ6p7rfUllf9T75pst9NM1C9Z80FtNmj9Y5OIIwq2QEpEDan3ncsR7Yoe/Z6?=
 =?us-ascii?Q?iX0bvSIqfO6sIKljoI9ojm5TTi/mEq4zhzL+0IjTtYRe5Afl3D7VN2HgPWJx?=
 =?us-ascii?Q?xCz/jh7Dw9psmcm+zahwGw71ZDFGec7dp98zhalx1c4aV9g2PDNnHXlCoW3j?=
 =?us-ascii?Q?PKBwQ58fawoTojptgCWZXcRXgIhnrriUdS8WTRhG89gwPif6tcHTPohb++cn?=
 =?us-ascii?Q?mt6hTErmuRzeXOByEBNQMMjUctJtZhuOnfU2apmvJHQ1xP64K2Ffy/abg+C0?=
 =?us-ascii?Q?dGgLdU7/bkl8nPvMkjMzDlx+VhSxvk+MX8a5nSvWm5IKGj45r9IBgVDdQ9aW?=
 =?us-ascii?Q?iV4G0zwcBaup9Kcmhlabm8UlpYyYzWp5eJwfCeLp3TzF6PL2OYQ9OcVHNwZF?=
 =?us-ascii?Q?SXrURTyF1UHpxGY7GAoosVHl/S+NPDR3OZ6sKsoM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca37360-7821-46a5-35c5-08dac7f9eb9d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:42:25.7432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDAHiW4v/sO5pR3Bn9gorKUyfaCLFnXL3at4gtKrxjMKKWhiJN1TGWVnneyfnQyp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268
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

On Fri, Nov 11, 2022 at 02:55:03PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
>     
> To distangle the maze in msi.c, all exported device-driver MSI APIs are
> now to be grouped in one file, api.c.
>     
> Move pci_msi_enabled() and add kernel-doc for the function.
>     
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> 
> diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
> index ee9ed5ccd94d..8d1cf6db9bd7 100644
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -308,6 +308,21 @@ void pci_free_irq_vectors(struct pci_dev *dev)
>  }
>  EXPORT_SYMBOL(pci_free_irq_vectors);
>  
> +/**
> + * pci_restore_msi_state() - Restore cached MSI(-X) state on device
> + * @dev: the PCI device to operate on
> + *
> + * Write the Linux-cached MSI(-X) state back on device. This is
> + * typically useful upon system resume, or after an error-recovery PCI
> + * adapter reset.
> + */
> +void pci_restore_msi_state(struct pci_dev *dev)
> +{
> +	__pci_restore_msi_state(dev);
> +	__pci_restore_msix_state(dev);
> +}
> +EXPORT_SYMBOL_GPL(pci_restore_msi_state);

This leaves behind two functions that are only called from here.

I think they should be moved into this file as well.

Or perhaps more broadly, it would make sense if the functions
were split up into 'for irq chip implementors' 'for drivers' and
'shared utilities'.

There are several other examples, like
__pci_enable_msix_range()/__pci_enable_msi_range() that are only used
by api.c and could reasonably move as well, plus their tree of
single-use support functions.

And if you think about it that way - things have ended up so that
api.c is really all about vector allocation (as that is the only thing
the drivers actually do) so it would be tempting to call it
allocator.c and consolidate everything in that topic.

Jason
