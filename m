Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD805711EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 07:45:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhqTc6lfTz3cC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 15:45:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pMTaRe0g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.236.41; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pMTaRe0g;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhqSv4Bqgz3bnY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 15:44:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIv558AtD5JyBAZzDYbJV7IwLoG6N9gJ6GglHObSTB7T8LEW8rzm2vN7bdltll34sah2IcQlTju3QNOBS8zh+8nTUiZWo95T0inrXEYAjtB6jMpRWYiPtNCGhbriAoxbLaVKJSGuZ5K9m99mOUMiedrB0F7PStAtxHapZR3J5Se74aqkHqGrIExUyOHljRmAWtLzWQ71Iw4bXFncNpMqP1GNGib+jcmIvV3LwnaL5iQrLzIQ1F32r+QyGP5+6XHwnlvEjfkgToRhEKzscBfNjESfCTwEABc9+1s4XKWD1s+7ZLTEv8N9VETkeIaegeNu3scHwgCjsqQCa6Y8FXNf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqa7BZiS5fKvQxw5/cc3sdwLicEWAFWev657NrCkfs0=;
 b=nDAOW/sB+xq8GONg2VFp1ksYXClWqAMmMlLfGGwm2B5HXbo/sbJM+D99Qc66MtxufwHO3OgMEP9qBI0+8IdikIlK8vLEd1aZ7HvC/407OCiafa4JVr78vc0CyYeb0Uo3S2CRM8pwsOdHWWejHST/+Cj9Fw3Y+7qKkhiPojBQzTwVYuEFrmn1OotliXlu72n1pfgdlz18X+8WH6sN2nSMGQbYL5JLLHPW9ys29yXp4nsoZ2WHAOfcsCQ0+s947LmHM27IVtIkqFWB+664XpSwl84yRVc01qdp2PEvbi4FcO7ADA3Z1zR36jMm5AScoQaT+teQxuJZJyzhy3zCFV06Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqa7BZiS5fKvQxw5/cc3sdwLicEWAFWev657NrCkfs0=;
 b=pMTaRe0gmF6nvM9FPrgG1AhhiHSAWq4K+ZN7BqiQRrkETZ0Y2r5I97h1crP/+EAV3Z8W1nBb0yjdh6rkrkFE312z5P+QsxXPQ1n6n4ZJwEOpQQxMd3ESTBEejRlUge1MU8e87PSY88wf4p85ig9Ec4S1roxrO3iUjKyAsVcSWdI0juhwKBhF+NFjzyhYOzmGQKCPARegsw2Tx1VVbWzzVWnCmEUhv+8d7VS54cc98spl//x9gLwDWLyUoOV7DJiSxYH17D0Yx9cuFHXTjEFIBIWxBWwI2q3y8rA+HLgDJtpCPTNkZuH1YLupjxhY0JcE2V0PBWxOHvKlASOA2G62kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM5PR1201MB2488.namprd12.prod.outlook.com (2603:10b6:3:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Tue, 12 Jul
 2022 05:44:09 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 05:44:09 +0000
Date: Tue, 12 Jul 2022 02:44:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Message-ID: <20220712054405.GA4027@nvidia.com>
References: <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <20220708115522.GD1705032@nvidia.com>
 <8329c51a-601e-0d93-41b4-2eb8524c9bcb@ozlabs.ru>
 <Yspx307fxRXT67XG@nvidia.com>
 <861e8bd1-9f04-2323-9b39-d1b46bf99711@ozlabs.ru>
 <64bc8c04-2162-2e4b-6556-03b9dde051e2@ozlabs.ru>
 <YsxwDTBLxyo5W3uQ@nvidia.com>
 <b39583f2-e054-8fc7-430c-d52bf6ed5016@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b39583f2-e054-8fc7-430c-d52bf6ed5016@ozlabs.ru>
X-ClientProxiedBy: LO6P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::19) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40be6efc-fbfa-4a1f-d83a-08da63c98a7a
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2488:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NEnkr4gd2HEZER5VTYhUfJvp3WT4WUj/ldJjG5im+eZJL6KBcwCPQJX+gBT+V8UzAd+FpKArq4msJYgGYVso8OMJ04XHjkWA0KP5frYlhBbZ1ldEYUekLt+LThDOQ7twvB+stBSjJbZXnNUOpus/BxoUmYy4ENoE9xSd0Ib7MkXAGmOAPNF//Sq691IJpMIhpDsHA4uxbVgucRN6Ro80em6rjMNMZhJqn/Qf3LHMht5LzDz79rLa9bd1T/hM+2CqTDXFsejZ4DkzuND4h2C6OLwfs3iRUZ7FQxjD6pYBmo/60xLOunbsHC9sMbOrYmPLcmVlXsYQCpwWgQM0COIKik9EkQPxaW+FlrdG0UaSFH7tDZInkoZBpWryOdWP8RLwJpOS8AvXcRdAY7bL4R+lFciFZF+6YuqoTMqwYs4YvSrNKoyqwGEbcswbRt0ddKGqKusVvbeL0Ba50wtOLbV6jvoMtbOptoSDz9EJTu2yiSljE1tCkYbFTyxy5Urr3xNszQ0vMdVWZCLurMHo3HrbDNWqqJrKBPhZLBUvU/CjcVHy+BEZHgx3uRFBIQl3oyAom6V8EzyTn5Wpq7TScftspxB8FbuTgABWJPdE0fNSyvxc8BkceLkhv1bBqd1bMLPICIRfSqhoFiYL2VTNX3GRNLhFnIXjC/s1ZyXu1OvpVfQ3yxQguwcAp0/+t6cq/BxD6x3ADgL3GO+vHEPYZnBNMxqbVvA3MYmip7E9+lcHak8V2R+xCT2iipk2qPPZOJjatHAaiKfbdidhgQ1J+AV/ktFGLLQOfBJ6dHPOsFDIrugl3/RnCspR+fICorUvpInp8J+1EGnREnUlZrU34fcF2Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(54906003)(8936002)(2906002)(6512007)(6666004)(86362001)(966005)(6486002)(478600001)(26005)(41300700001)(6506007)(2616005)(53546011)(7416002)(1076003)(33656002)(4326008)(316002)(6916009)(38100700002)(186003)(8676002)(36756003)(83380400001)(5660300002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ME1wbRJIvQt4Wh10OlQf0wgW3gUFUWSM7vrtQ6pxqdwhptP76LWMjZyPRPmE?=
 =?us-ascii?Q?vjWPwwn8Dd+NwaqQxm0at+q4enZOUHtOCMY+mRpxbDf1/YYmdgobYo9c01Nm?=
 =?us-ascii?Q?YTjSWJ1LfkqdzrEUfBBWxbp884qggX8A/t2U7ByNzg/w3nY6XcqQ6up4JX2J?=
 =?us-ascii?Q?Kbsb34yCe872l6Y8CsWDP94tNZ4Hy1vFYloz3V7b0akKWzszjGZqjX38D80J?=
 =?us-ascii?Q?nKi7e7SSQbNxKX/f5LUdlSmaTbvCvq7IuUJsFiAm/lxlODes5hD1Mpcac8pD?=
 =?us-ascii?Q?rIof3bC7wu16U3rIH81tGM/zokGDH028ulkbWFApyA6LzN/FoUXZViYwK4bF?=
 =?us-ascii?Q?kgN08rE7w3N8oIS8rspobpBGW1dwH8BfVhRpCY3yY9ID9gfMtbGRSjW/pFyS?=
 =?us-ascii?Q?hzS7jstcI8SHql0IEsFul3HicIFZhBNb+roShzujHDwqmXakE+MNLveuylkY?=
 =?us-ascii?Q?UTVAywFhKSHotPWsILTp5SwJzEqSAlr1wtJNnGSnPs82FNpVQWPaiSCJJTT5?=
 =?us-ascii?Q?7cqyuK91VkUsK5WwFadb129SFWxnQOD7AhsDwj+nTvdHdMZu7QyOM0XVL1tJ?=
 =?us-ascii?Q?R3mpaHQLg/oVKHwtPVn/fG/miw5gLq3wWogC8sUI/Ba/5e64MSa+8G7J0NY6?=
 =?us-ascii?Q?r3vafDG/CbqcUfIiAES/2dSOkS90Ud8VS/IzRwo+o1nsCUqIGyYOwpqWtdxJ?=
 =?us-ascii?Q?lh1Qu92ylKPmAHZ2X3HsL9zkp7tKDXZnistq7sBspVqA/805zKRu+eIKYzJY?=
 =?us-ascii?Q?UAjQakbf1uCMPuFU+XhNb0eJE+xX4eVNzJzMUg4+M7PuiisvSPLFWjEB472x?=
 =?us-ascii?Q?TJWyVTIY6QaZO773cXrKB/fFT/aIfV9hcITjdB5TRq7CMantRNbP5jw7Pzo2?=
 =?us-ascii?Q?vIvZRtazrSursdoeA0yIe/HYhtQRjVzmyCBdg3/W/JbawcUxJOQOw7l5nLb1?=
 =?us-ascii?Q?+YDn5bG3zZ0n8/ptsfppT5Abx/Ct5J7b3xrUvH/uXiQGauhXSdH6hqv5N0uo?=
 =?us-ascii?Q?buZQBuuu0xc9yZE5o7+kAQu0bEyJn7upBpxg85AMsrySngIzAYitIdM5IYNO?=
 =?us-ascii?Q?31jxUhdyfDJkD4S56zZF+J3NXolxlgV4sJ7JAMwvaZygup9PKQozlNfYfx6A?=
 =?us-ascii?Q?hRl/PvRI+fy2j7bF4/awtPRjBq5ObKCVBkp1V2ouj4TG3nrYxg7iR/+JyULk?=
 =?us-ascii?Q?DdAq3HP/lbRf0QvS7OWNag2UWQCO9uF/eVQN5MO5BWe5AOK4ubtLkO74OFEa?=
 =?us-ascii?Q?5r+CG6ZTBlh90r6tFX2Em9by58fHx4S9e3fpD1ybMzK18PY6WNrNX0MQIIbY?=
 =?us-ascii?Q?42CQSdLa4OouIZAMowGQWFLmxh/mU+Bv0lY6zptiCdOTPwE5S/b/ghH7AJMo?=
 =?us-ascii?Q?zocIVxV7RpapuZhk47eDw+fl8HZmYvkkDzXBHNkFsKcQSTpJaZ3IO3N9qqFr?=
 =?us-ascii?Q?v+4owVfVj4pfnEB6nG13nTb/m+Mm7GcKsoxdTvGim8YK2ux4x6gdsCfeXxfO?=
 =?us-ascii?Q?hvpXTRu13lI5esHtf4SC+D7c79skU6efNBqfq3HDiCF3zHES5wTolL6YV73m?=
 =?us-ascii?Q?n/zC0S/ESLWamMgKhgs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40be6efc-fbfa-4a1f-d83a-08da63c98a7a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 05:44:09.0791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVArzL5p2pgcYcwcGIqiOVBKUYvesKgLXc0c6L/hwipbyo/4l8ZjWUvF0xac2hOm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2488
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

On Tue, Jul 12, 2022 at 12:27:17PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 7/12/22 04:46, Jason Gunthorpe wrote:
> > On Mon, Jul 11, 2022 at 11:24:32PM +1000, Alexey Kardashevskiy wrote:
> > 
> > > I really think that for 5.19 we should really move this blocked domain
> > > business to Type1 like this:
> > > 
> > > https://github.com/aik/linux/commit/96f80c8db03b181398ad355f6f90e574c3ada4bf
> > 
> > This creates the same security bug for power we are discussing here. If you
> 
> How so? attach_dev() on power makes uninitalizes DMA setup for the group on
> the hardware level, any other DMA user won't be able to initiate DMA.

We removed all the code from VFIO that prevented dma driver conflicts
and lowered into the new APIs. You have to use these new APIs or
there are problems with exclusivity of the group.

The previous code that was allowing power to work safely doesn't exist
any more, which is why you can't just ignore these apis for
type2.

They have nothing to do with the vfio 'type', they are all about
arbitrating who gets to use the group or not and making a safe hand
off protocol from one group owner to the other. Since power says it
has groups it must implement the sharing protocol for groups.

> > don't want to fix it then lets just merge this iommu_ops patch as is rather than
> > mangle the core code.
> 
> The core code should not be assuming iommu_ops != NULL, Type1 should, I
> thought it is the whole point of having Type1, why is not it the case
> anymore?

Architectures should not be creating iommu groups without providing
proper iommu subsystem support. The half baked use of the iommu
subsystem in power is the problem here.

Adding the ops and starting to use the subsystem properly is the
correct thing to do, even if you can't complete every corner right
now. At least the issues are limited to arch code and can be fixed by
arch maintainers.

I think the patch you have here is fine to fix vfio on power and it
should simply be merged for v5.19 and power folks can further work on
this in the later cycles.

Jason
