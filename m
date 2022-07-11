Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EAD570A1C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 20:47:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhXv44WM0z3c2b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 04:47:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NkwlMkJb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.223.61; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NkwlMkJb;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhXtJ29FHz305d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 04:47:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+G0hQXNZz6DvX2rrZWPRlc2uFK+pQy87tnoE9bcOohnuysV4FOWNGxU9awd7NHg+9EKTNK0FHjd1GZMzK1+TOiHurdF398GxSolesdZcX6/TiodlBJOfXJeouBzGZ35tSFT4sxTAtWGDuFYeaIoZ8m21TNW2yYpGjG63aBed+te7V8OMLwWLLdwwozbim9BR20C3pdK2wLdPhLUSG8CSuPgVBQvsnrvD42ig65ppyWZLzQlK1+aDO5lrJXworsvEEjxfPGaQlgbkVKeM0FrGsjHCVTZNVNANABZMzDT7KKvfjtpTau/E2lx1CksVs+jEoFeRt8ggCSsXyZt6zVNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk63goQ03cnwBFwkBY0xT7i+n4+Mibs4SE/ApmQbaG0=;
 b=V9IWgIm7iIkTBZGmJfuB0QeVx7Si6LK76FlDzFqEryQIUH0UHBndIU4/vBdwdp1ve1cTWHqD0IQQ7tG4pLxDIGuoTaa11l9fFIscBcBRRNJBCy1j2E1DaADZIJbqCshxvMP2m9WJ1TqO94vm9porWNCF/+y0LLOBw1wFLz3Go31HumnO9oJAZp/EuVqlFAbdv87OrtS8HlBOVJxfzuX3o8zA4lRmvCLmtTqj76K/mPEkCXep9x1YygBEglkoncdRVAMuaCa3DQt+80O16AWPR08paIcgI+uXuy4RuofDpmT0y3+BajyeTTsqUVTWsiRH0Ww169vdk1NQ6Y94XoL6Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk63goQ03cnwBFwkBY0xT7i+n4+Mibs4SE/ApmQbaG0=;
 b=NkwlMkJbgz0D+Znp+ZS7JA87ajAfk8tL+VT3AU1kI6bAcvMBBzUvLYdQt7NRmkm8xppRHNvLuxwc/oz+Vs5xp/V+ofSR1gDMnKXu15AgrgL3/8yNOZrnbCdQz1rbLrllZ89XWlec+IYgiUT2FBMhopJqaX5Wod9es5yoh5/erkzXQwUridvIkkfKIsC57SBWttbCLWHgs55S/9GHxqJ9Q9WMe27gXxn4IMpZak7JVjhQHOca+ZGtB5crRuOmuzNl5DddHhW4m4NIGS3xsmctRvnzcO6yPz68ugfL++K85pTQU1/EQa805XgkSzOpgvi0Mfnu5Aub2l5Ne/mPYBLkHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CH0PR12MB5299.namprd12.prod.outlook.com (2603:10b6:610:d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 18:46:42 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 18:46:42 +0000
Date: Mon, 11 Jul 2022 15:46:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Message-ID: <YsxwDTBLxyo5W3uQ@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <20220708115522.GD1705032@nvidia.com>
 <8329c51a-601e-0d93-41b4-2eb8524c9bcb@ozlabs.ru>
 <Yspx307fxRXT67XG@nvidia.com>
 <861e8bd1-9f04-2323-9b39-d1b46bf99711@ozlabs.ru>
 <64bc8c04-2162-2e4b-6556-03b9dde051e2@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64bc8c04-2162-2e4b-6556-03b9dde051e2@ozlabs.ru>
X-ClientProxiedBy: LO2P123CA0026.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::14)
 To MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c23c9d86-a4a4-417f-d925-08da636db25d
X-MS-TrafficTypeDiagnostic: CH0PR12MB5299:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cFuhIUUYJjKf0In6v+tyMLNVmeEg+Sjs1irVXkLjsNXIDvSgqxkPJ35nDHb5zQKUiLG3YxuOXyu6Om1oWcTa3iF2qyIEbTpuB9mkR1z8MYXvOZzYXt5dHLB+lq+5n3FbKKq6BaVeyrjYWjBUHq4dQEhs9L9l/RPtA3CbodKxwjddYvI3cxCeitOWNkgCWoOkOGab/yefJe/o08r74+LWnbiqy59isQ0IL4ne81iLrdjZoBusoN7yH8R8SofdYWHN5UNOnFsAJ01vqOFFgYp76GeRoXRM9jU7ab5sq10PA+olLwOTUG6YuQAl6gfUoStV8bKIcD7q/fwrheys9jbTLaey3j4UL9i6KV2xkTZTbhisKqzWtvF+2mxk5sEYeEEcPkqsIruyHz5HT6Y4A8pzE+YKOfp34Lsh5AcHX4Ctk7zcip/UBXdux4lb1dRtEimMEBg8IAdlEGaYkbAYJOZ47tNCbQ13Ss5AJBjPcaJRjlRDqIKdDCLBLZ7kN7TBtvEOelWMCluGounczl58OcmOI9+rfzEWOUHnF3X6UJkJAAQxCyHqHDS7RaElXdNYb1kTuKfAjNyloCiqyhpHQDultxKflXbses8pd/yAGt8DZU7NiPbcGHTnr100ll8JQE91nXOUvL5kPK4pV6gstZOsTn0pqE5K5WqGnr1ZUEuUR+DtQziY1lhhFDw6oj6wBrCr94bDphiHYrXFJRAoWfYsbaCUbNisYP2cDxdTYktGctRc41yBNoRhyPdMepUl8AB1YTx7xBrYFXTLS1tGaOyyfSAnXuUbthzSTxz2WK/4eq0dqFGXm0ML6bV1fgvCsSiQYk9iSb6KHiDNIMLz2avLog==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(316002)(8936002)(83380400001)(2906002)(86362001)(6916009)(7416002)(54906003)(66946007)(4744005)(66556008)(8676002)(66476007)(4326008)(5660300002)(36756003)(26005)(186003)(6512007)(966005)(6486002)(478600001)(2616005)(6666004)(41300700001)(6506007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?dnUn6mxhIYkmanj9h0nxUsCZycJHheU6tD4y9ipDfg2INIJYyVMXya5lNdSV?=
 =?us-ascii?Q?EL3cfoQRo4Bf+1Ndrw+jOy/r6Dymgrr3PmGgKMuKr4xGbZikPngP/KfrwLXp?=
 =?us-ascii?Q?m6MmTYMMG0lTd0g/cIy5cO/JeN0hJnUcysO6qDkPFwrjlfNTsWWxBr1q2KFk?=
 =?us-ascii?Q?nkV6y3yyNXaaScrieTDEvkz5dwGg5ZF3Y7swhP+GQqVCP9QtkxDPAksKaULV?=
 =?us-ascii?Q?veYld3bbVWSMZILJJBbqHSCooor55z3G9TuZbqBJBD+7O/gTY2hR7Lr5OJw6?=
 =?us-ascii?Q?AWsDpZrrvwGey1fme2iuA48jVGYGGOs3gEnJ3kVaMZ4Wz2lCXm2EpznILNhH?=
 =?us-ascii?Q?TPYjRjXmQTNezQ9aUAwcMlGowWG04F5ITM3BJj/7nPlpM7H/K+bLixG/X4YE?=
 =?us-ascii?Q?K8NrADCB+rTiaFkdNMA+Nyg6O1X/lnFUbdfrndrDAMO4o7+jTQ4Ag90dUS+U?=
 =?us-ascii?Q?px78LfuI/6zQSZN5fGv4ux8xJOlJJryvVzP+20ppOrNNxfLcTo3NuH0Ggs3d?=
 =?us-ascii?Q?lsqGqHrmWEmV6RWsLmTZzYZRWdCzxc9puaq9W127X/Ijw3GFACsjnQ1j33/G?=
 =?us-ascii?Q?5J4BHkl4p+0YmU/4lATxR4thoWB7fQn28tPi3zqVbtDh98e+fqg+nIGCTyrL?=
 =?us-ascii?Q?Ra8pU30PcKHMafH60aeGE9OX3JX07EOA8Rwl9C+yUUOCn3KqHj51LreoJihW?=
 =?us-ascii?Q?AcZLohXD0oUdf2gqVTRtO7q01lNrhGkjiLrCjpXoTRig+drUZ28/yR3hssbK?=
 =?us-ascii?Q?Vxsc71wKToHQUja/XmwTG3zKRN5bYQVNpmtE7oY7dgUuimUIvrgLFI4PuKCZ?=
 =?us-ascii?Q?GY/ty+H7lNdPWXoctaPJ3kE3wBOq4xt9Rsz+BxdePmn6RsJcBYIukmud77tH?=
 =?us-ascii?Q?ku3AzExLApKlQA0WFIuf+A9CnChDeNKohAeiHqjkrNu8+71kr3x9VWhX5zQ2?=
 =?us-ascii?Q?kAZaAo+AIAPn9+qkTrRhYRj/8k1CrhzAUghj8Ai6f5O96FJaxHFogW10Tafu?=
 =?us-ascii?Q?4JuMexsxJw8JHHh97vesv7xOK3mr4IIIwqYCQXLHZ/q05FWYJ8JSLiY3wCz+?=
 =?us-ascii?Q?KV8Ps3+nDLVThWh/JnPwtNkWO8ZaKER2XAiYVTOGchj7W+3pdgFsRobwtiNQ?=
 =?us-ascii?Q?3pGMHnQ41oWnXtMtVBJ/nOC1BUqmEEzUc/5rKFdqY/ThD3uUCwKTrtfYhpEc?=
 =?us-ascii?Q?RQZO10spu1wJxCLwATdSv5D6jGLYi/Z01wKAr6/vjjJQLtLexnBy4lOfzcXb?=
 =?us-ascii?Q?rp3iXa4PMCP4QfhqDbRqq5F4j+SWUjPMuhK74MEIUkYTxNvleYS6PNEDqnRn?=
 =?us-ascii?Q?onoUOJMiZlQdyB6OEt1xhy8eupyTzMTEc4DIChSfy5nq3Dvcunw7FH311fx+?=
 =?us-ascii?Q?dt4zH258zebdIo6S5wOijmg3W5tMcPrYtCqHUTsTS9mw19Sf/lk1m/OO10Ec?=
 =?us-ascii?Q?TSTAXvCQHVOjxqbdzDUYS/DViAL9q23AP3ur0Akmdt1wqS2wG9qwj01FoUa4?=
 =?us-ascii?Q?kkebk3DHfg/IY9XbUf2wvHdPlH1rYPSIsN9Dvp/XBwDsXDoL0OCZyg/ZkUdR?=
 =?us-ascii?Q?p5xSdvevA13OafC4P34=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23c9d86-a4a4-417f-d925-08da636db25d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 18:46:42.3457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NBELNPxu4XvYQuR5eyVKcuChFPJuMhTw5OHRLUXpK/QZ8XdksOvE/qRVZP6dFZB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5299
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 11, 2022 at 11:24:32PM +1000, Alexey Kardashevskiy wrote:

> I really think that for 5.19 we should really move this blocked domain
> business to Type1 like this:
> 
> https://github.com/aik/linux/commit/96f80c8db03b181398ad355f6f90e574c3ada4bf

This creates the same security bug for power we are discussing here. If you
don't want to fix it then lets just merge this iommu_ops patch as is rather than
mangle the core code.

Jason
