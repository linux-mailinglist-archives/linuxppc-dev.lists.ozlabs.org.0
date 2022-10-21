Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72819607F42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 21:47:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvFPP2SlKz3dwM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 06:47:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fDsZbqxu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.95.85; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fDsZbqxu;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2085.outbound.protection.outlook.com [40.107.95.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvFNN5fdsz2yy7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 06:46:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdtB4rcmlmvu/n2w3AxtjDCY3GWEX0zVlHF/vfcLS7EDGIBYIQqA3XAifvuXWmCE38yuF84SS/0/z3dfj/Cum6pueeA4OzwYye0GF2UIZlduUjRJQm/yVKfuAW0RH1q7LI6sK6eaBvyuXV+m9AXA3hnw/KH2rSeeqjTZ3+h+lPkkH8yu8tK2j/cWUaJf4n/9SirZVkQMvndTsK1Jq8tQTzMIqMlDqFT0i0rnx2jqMJI1NvN8YK9gnHbw4epLv7QxiO3QUbpJSgSEVqVsdlOcH9AxOJNalzr9MP9i8sKtfMYP8BVI+7aVgpTco5hl/83vQJgoMohPrYXqZxRdi/3R8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3OE8lN2UmOsQG2wmJC2/HQ+WSzOmyhczHWqmqYKLtM=;
 b=lXqVDKO/sl1LfWHiKGKulnqRZbKK+A+3/cpzEArUltaJCpA3M47Qxh8kKSNJ6AX78W+jSabp1/kxam3HGSvY3KRfYa6nufaAgqC1fGcxR/+7ZmvA1MjFHK+O/1XQIqDoUdvuCNv2iI2ZaB5FTfzbtALX4aKn8sBZ/TSABwck36hCo/8y/cwvIkBthBoe7fIwkfZhgoaVxkgZMmFmtFHgFM90XePzpMQZfbcLLg3KbGO83eVgBpeKeGe+xDwxt0WAzcLda28lsUHpmraFJfmhGoTk3NDG5BFDWCz4Q5gUm6VD9RaRSAJr64NYpDljLQSX47V/K+pA6Vtvt5uwnbJo5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3OE8lN2UmOsQG2wmJC2/HQ+WSzOmyhczHWqmqYKLtM=;
 b=fDsZbqxuWLmdRj6MXQEC5XJP7SpLjiPf3EgNt0cgWbZEsL9y/lNCRbsADDI3seJTuTQ1cT8AVNth6wCFLiDrzxoHiyPYNn/Rk8Brpm/C6aLElcP94sp3MCXjMlWBZQlkBOMrCMy3xT7KzJCChZ5/lSvj9oRDDzHhfCWJns1IQ82ZQWK5RXLYgxUx5DopS+yzL9wGTOLO7+NeIo+cB6KgwdazjT3r8Lxp95V2eQ3l5vbXgEKqzrZRFKCdNasC0x01exAXebfwHGJM3Xh2n+jjUP9kpDXopgNjDBuRB+st1nyI1/PgMwgRXknlrH8dbR/WXTA1HESwT731VmaLuJ2b3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB6888.namprd12.prod.outlook.com (2603:10b6:806:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 19:46:50 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5723.033; Fri, 21 Oct 2022
 19:46:50 +0000
Date: Fri, 21 Oct 2022 16:46:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 4/5] vfio: Remove CONFIG_VFIO_SPAPR_EEH
Message-ID: <Y1L3KYwWe/reh3TY@nvidia.com>
References: <0-v3-8db96837cdf9+784-vfio_modules_jgg@nvidia.com>
 <4-v3-8db96837cdf9+784-vfio_modules_jgg@nvidia.com>
 <Y05C4xT7r+Tz9Jn3@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y05C4xT7r+Tz9Jn3@infradead.org>
X-ClientProxiedBy: BL1PR13CA0314.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb5f05c-7e10-4174-3d21-08dab39cff1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	q7c36EYF+/7Mh9EeLILJ0NMTPwFPcNvj6BTcAQ5TLqklixYv9/9XQFygLNg0/evBDAEWrEuWQxQgF9PVyryoIM8a1HqhzlEUOq+6U1MMNr6XruMLVKL8n47JNtxa3Tpxm6YLMGtICRXyIC749mLeBUx4dt0kVpJFolAYO+tnai0wG0xXoP4B6pgw7L9ohxquIMS7Os9azVZcKlogRYWsHnAuOxvy12eHeP8Q36HU36w/fsKFsNdzDKGYN35jNTCrjNAIB5mFeGunopH+9FHdTKevuxAki4LLUNOrMr/aZiv3imQ5kdxlylfL5gc7XLaTCaMqSTxNG8zHtNIZtntiolq/+9kcxPIXwg+2cZWxWnH5p+XvY6tuM1iZv3lh3u/YlBe/I66d5AFTsdu+qMbUHtx0mvVAfT/PA7eLuoj9IgrQzxEM0GHVWlYgW1YWetP5CEJ4LiGqKjcMoJQWLvnWCByvfk+bpjjVKRD4GwWnkuuOfRNIIA5qHRodog+Lgtm9YzrdkFF1NeP+W4dfCbMQNG1/mA+eEa2UdWKyf31H2PfwHpFg+XRlq/hEb4twjpZ8DIotHOSP6926C+F74304AkDKhU/3NPTIRn7b3zfW6qPNgX5FW8XJcg3AN41DbxV9GOaB1o9N7rqekitZupASpX8OivMQx+HYWpyl/37yKVevQ+Yp8MH7cwnrWULsLsCJiN34DGCUZvS7PtebXQ5Luw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199015)(8936002)(41300700001)(4744005)(54906003)(316002)(6916009)(4326008)(66476007)(8676002)(66556008)(66946007)(5660300002)(38100700002)(478600001)(86362001)(6486002)(186003)(83380400001)(6512007)(26005)(6506007)(2616005)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?e9El/uPh27foOiF2kvkI3QMSoWywwSwLeu69BwHszJo6jOeQHQIZEdT8lJi3?=
 =?us-ascii?Q?fyJhnU0Qky3id9d3biPLvF6DWWQUGU3t1na6BZy+Ioe/2x+eXAojRTSNaD0P?=
 =?us-ascii?Q?/l3mNDNiDo2ujLdpgOaMunO528enwTg1yll2NCxWTEG0tHsZAsfABkLd2Z8l?=
 =?us-ascii?Q?9nSNk9dPh7KjVVuqtj5g/4eeAOrv5MxlCfKRyw5VoyfJbta5Iu0rFE7SWOPv?=
 =?us-ascii?Q?TK0tWy8exBhLrB5mV0udN3hviS2JXBKw609fPCDyD+IeGLZ1idFe6gMgGGix?=
 =?us-ascii?Q?QTDWNvdrY9ZudyA36f2zKBjLAsw0BysZ5wNvmFNOd47S8jtbStSjIQ8nfuwR?=
 =?us-ascii?Q?5XNoDCitOtICoGaS1qkdGNArGdJkJAa+epRnborJ3+enPjYtjTCD9G7UUg2I?=
 =?us-ascii?Q?Wt5H0g0t8n13NmXXVxWH7McybMFKW51Awj4g2FhClDQT2OUlkO0/GnNRsSBH?=
 =?us-ascii?Q?f0gkDgqoJMm5pWSE5mrIayw9RXwgrPJEIUZmzd/u5pKI9cVifmmjJe475Cf7?=
 =?us-ascii?Q?UDjTrqYfOEbAa3t1pRFysZYktNrkj3gZz74jQKv/J/j5k4qdkLk05SlKSNsf?=
 =?us-ascii?Q?TarusVhLlzdjlkLnq60Fm+Cc5JsOqm1FeU5enANdJPi5mBk56peYJGdw+YzE?=
 =?us-ascii?Q?x0QZKg0gVypUwyWfOHPawzKLkRix1An4PrwRJwFrE36fQPGnesPYM6TDGdUo?=
 =?us-ascii?Q?tJCCtJGLAjHCbjmAsHmxcXIW3e1thzcUVIeZ3KnrRMiM5QLrdcmk3nJeLxVF?=
 =?us-ascii?Q?rQbw2RMdwE2n7PmDQ1Kt8mMLJjUDhXfceaZ6JAz438Kv8BgXTBy6Jmaa2pwM?=
 =?us-ascii?Q?2cICDQV5AilqG7itHSJYYhIKhhFMrMPUNyewcM6CB5AR52FhKa4VrkGMr9PG?=
 =?us-ascii?Q?sEHoyt1gLNhmOoogJW7a/BlpVCo/3MAcY7ZGlrDqRCHVCRiNTRS4fa+MVFa9?=
 =?us-ascii?Q?VOhvrIWbl1BojoWsHtXqrrTdfmvWMx73/BoaOgEDX68L9oJl8otkPAPd6Z+1?=
 =?us-ascii?Q?kLVLXD4c0t2eZa8xfZAdNpcOuZF94Xe4tHlZLX6dCoRTaPeYrzvpwS+e31Nr?=
 =?us-ascii?Q?19voArwvwG250uc+Y8tHtTY4RKT/0VXq8OxIsE+Zz1uT1cNoX7LlhkuQrII3?=
 =?us-ascii?Q?1La9WIDBo26Rft73LpHtiJ6UMVw0ztVHGkrnOJDwIWuf/wS1rwHCeaDZ2Eox?=
 =?us-ascii?Q?k+LBNJeCusK3fmDdKgEE2YtRzONgJ/wKt/VBxgt2l/ANDXCNBtwIDUsdgf5R?=
 =?us-ascii?Q?D6T2DG7fLvSSrdcPS9zIpT7TVxSXzF0we2g1n6t9brf1Xh7H1JLCp7AT4feU?=
 =?us-ascii?Q?kXPsJnPsVCzJmv8TvGYalbUHgR0OLOrCMYIbAd82AAAOsSghvANVtRX7Wxmx?=
 =?us-ascii?Q?258trSieXyw8bWheDPy+7G31+drc4UICwCQjw6YyhcHWE/xPtKwLJzoEl3pM?=
 =?us-ascii?Q?C/vrpUtXE1FZepvYNXltfyoc7AdA9Ic+CHwq2w3wsnIIEy3fEDc1FHv/+Y8v?=
 =?us-ascii?Q?rveBVhCrIDsNl6el3GvAhVVf0kGSEBCWXUiX2kuEnS3dYtf748xoMVBDAPLp?=
 =?us-ascii?Q?/mol4kr/cymdZyBSL4o=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb5f05c-7e10-4174-3d21-08dab39cff1c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 19:46:50.3907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyrtO9BF7PJAqBBA6rjIY8WwGVF0FBg92/FA8rM75q5BJcbCfQv5DuW4OvM7QTOP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6888
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
Cc: kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>, Cornelia Huck <cohuck@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 17, 2022 at 11:08:35PM -0700, Christoph Hellwig wrote:
> > +#if IS_ENABLED(CONFIG_EEH) && IS_ENABLED(CONFIG_VFIO_IOMMU_SPAPR_TCE)
> >  #include <asm/eeh.h>
> >  #endif
> >  
> > @@ -689,7 +689,7 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
> >  		vdev->sriov_pf_core_dev->vf_token->users--;
> >  		mutex_unlock(&vdev->sriov_pf_core_dev->vf_token->lock);
> >  	}
> > -#if IS_ENABLED(CONFIG_VFIO_SPAPR_EEH)
> > +#if IS_ENABLED(CONFIG_EEH) && IS_ENABLED(CONFIG_VFIO_IOMMU_SPAPR_TCE)
> 
> So while this preserves the existing behavior, I wonder if checking
> CONFIG_EEH only would make more sense here.

Yes, it does read better, done

Thanks,
Jason
