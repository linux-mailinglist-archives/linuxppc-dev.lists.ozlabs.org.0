Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069FA7BB957
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 15:40:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gQ3XvieQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S28hN6DBCz3vXj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 00:40:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gQ3XvieQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eab::626; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S28gS5FHJz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 00:40:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bqgo8wvixtg0o5TpC80nh37CELGgI0eEmpYD4zONDQkDMdS9lEGpR+DEW9z/eyJmZjjQmWv2eEjl3OtJI9S+NbY3dUqx6+i8MQltABgv1I9fTUa4u4jfx1GbdpGr+ruyU8mPLtMLEpZXUvZfNUvJSDcP4mGOm4ZBq3acUpBW1SHyp7Bk0Bbg1RmGEcwh7NGQOpSwTjj1nl/5tp02Sh3MpGbwwQ+PWQMOxtdfoegY+SWNmpMW88Zj1ZCxrB7r/6+R17qoWTc0ZMMaQ0ASgOyVTX50GD9i6VW2MjPhlD+zMAnuP9hsL1hffXvx3DialNdnft/DWlfoiiQryHAwWj2XWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxfqm4qFf2jdSJfR72Og+72flvv3pO/CXHxJhaVG+0U=;
 b=AXe+9Pj/Id71/+4SBkVDVFlPQWHc0svR1d/2GIFfqHO5e/Gtgo6/gr+VfEZlJ5C3F01O4NC4vVAsWmpgn1PLOHuko6meLv3/0Fw9O/E0lEx3Jqyye0rPZtkSqKwx74At04J61uCStKBctMQ/uS9Y5mizPW8fBFRyfgPEWQuDggFq1RDoflhMeFXAVU+cKfyb/ReFThwOCCZJB8ZaPftNhyr0b/od9t4ePV7Pf0MAvoFaeVRBcnCT39bslEFUIPigo9V2+1p+5VJ9Q7dP+JLaOj3sQdRC/8uRae63u9lc93p7kt6kqUf2b18ls+m0NQUpN+LDgbamOOzhFcyG0++37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxfqm4qFf2jdSJfR72Og+72flvv3pO/CXHxJhaVG+0U=;
 b=gQ3XvieQnt0fVrRcuTMjXwxFxyhivAGaRlRAcvFN4QTYFkhd/5OqCry2ylKZqcc/JKEWslAkAOurgAz1nk7235v6iqA0mi64wMQOj0Ixu/tFJ6ZohxacqdZvuNiTeIpZSGtqPi8WBotmXQvC5ysLbu9xQDpb1WpenVA+jVFJINqWbYkj8NJP01ScQoqqKOQZD+LamgPFZBHQCxpU2+8QICjtyPuiA4+iDhFZQg0I9WcAafW+rEDfVuUewcZvjAzwkWG4EfxUEtajwX7J3vtgJ3bTC/R+VQrEvjWVz+j8K8jGD0ZVM9V+JNgTp278ds3CkL2qXICm5fcPD1ji/2ubsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5045.namprd12.prod.outlook.com (2603:10b6:208:310::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 13:39:37 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 13:39:37 +0000
Date: Fri, 6 Oct 2023 10:39:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: Re: [Bisected] [commit 2ad56efa80db] [Hotplug] WARNING while
 performing hotplug operation on 6.6-rc3-next
Message-ID: <20231006133936.GQ682044@nvidia.com>
References: <92db426f-4a31-9c2c-e23a-85a8d353fbae@linux.vnet.ibm.com>
 <20231006113644.GN682044@nvidia.com>
 <7ce42090-a768-ba3d-bd27-e86bc076ee57@linux.vnet.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ce42090-a768-ba3d-bd27-e86bc076ee57@linux.vnet.ibm.com>
X-ClientProxiedBy: BL0PR1501CA0016.namprd15.prod.outlook.com
 (2603:10b6:207:17::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3b5b18-9010-4c16-6e7a-08dbc671aef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PayoTtzGXDzJ7J53au0xgHMf1Eu9ZktuVELl0yhMuex0me+e7WUnOKkGBboA4+2NK0HmPPPZYuiI1zwMY8INpNkZopGjhQeFDA1ktuZQgzlo/pRvvuHDd8srdX2rJPqcTDo0qoo39u+ye4/Q0RhVdFH50Vzh+mFbATsngTf1aZP/PempVIvUDbsj6+L+0Elv4T57uDWcj9HZ8SiWKwIUQa9y+p0HtC8jwQDqoUZpSMv9Ls74PB2P4wUpzhUW3X6w2daQJWyPufccMkfXfEjCWuDwfF9IuDYb+N5+wr59rga5F27B02EJOQleltaqLaPJlE3tpbNJrn17YJ4eVa5rrskaibM82wp98r0Bf2b3Z7a8fLBWtT85jy2kBq8gcOanbmDsbi5cVV6ju6skFOyiYvYCGPHNhah/GCAKKsr660P/YfEMc4XLAoRYSMGR3zzAZR54tt/0McbnMDioNIokLj1S/tQ0K3vet3X1TLaPkAjtO0NgN0dP3RjNrOZ9kOvijBI5N+4nFy3ENNGcvg0ZIji2QQEJThWcV4jJ5KRv0qCSjG5Ph2HeMD3eRLZnyLlybn0RsLUhJPw5vpzXeupfPP8cBTf+8nUOJWuEAwnJeMI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(83380400001)(7416002)(316002)(2906002)(4744005)(36756003)(8936002)(41300700001)(5660300002)(4326008)(8676002)(66556008)(66476007)(6916009)(86362001)(26005)(66946007)(33656002)(6486002)(6506007)(6512007)(1076003)(2616005)(38100700002)(478600001)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?t6L2nsCUeWrE7ZEX5LWZTF1PV/svLPvvgt6m+FZyyCJ+azR0zW5piW3F9ZXQ?=
 =?us-ascii?Q?y6Do7jBSxkQSg8SIQm7p+gMT5slS+zlUSJw+ZdtWgkGfeXHNY6wja8B0OAKh?=
 =?us-ascii?Q?JF/x92yBFXJd/7m0J/Y53VXaVRUjOt85Op+SxXef/TCKgxX7enHAk+4hrsPp?=
 =?us-ascii?Q?qa7CL9W9CRL7EsYVJvzCrkqkeNNExzGwokoB+RjwrYkYqbTMKEQ5AwEiEIYk?=
 =?us-ascii?Q?dDwxorMudCfyZPZ0DPgVxj3RZRmSzLqOSro1n+fby0QXRZwajRcdqin6sAkd?=
 =?us-ascii?Q?Rz1kx0kHm+WTX3PlcXOaKUm2huqtzoNYeBXnFrICL/wcNzKBUTb4DcjHVZUl?=
 =?us-ascii?Q?30Gv27p96jh6wXvDHURGZYgRZQGirnqTZVHRarrWy12hqlyBf0cQCQttGGoB?=
 =?us-ascii?Q?xfAzAAkj9eJH3At31GHNpUi4pLJQSo+17JSuD/HaNFwZuHOvo65iq/r9fFuI?=
 =?us-ascii?Q?WzCcpsqZZk3VEhE+U7g6TxK9cW2TkVscPO1h/5YfqH/QcqtKDW9dW5Y2I0C6?=
 =?us-ascii?Q?ss0vXmBlcjVqAx/LYx0XJf5iaqY3Bfh4CYW2jEUq19zt0jRaaWQG2zJ6A5QZ?=
 =?us-ascii?Q?514EhXKyWQ+SPydwSNYdWbKWPPXFYTVRbnBjKhWRuIegiGBDYQCJZO0WYdqR?=
 =?us-ascii?Q?0xoypipKHUOk245NrJdKRQzQwkq8hG7McOZ+Arctv102mtbHVAhItQVvLus+?=
 =?us-ascii?Q?O9Rrks6qZdNI8orHZLhQcD2Wd3Sm1vDcs0/7d+J3B4GR44hrVjFpYOnAMQUz?=
 =?us-ascii?Q?NL9xqZF/jt7QC8rehzOoXWrFJ4wf//VpHC59Xkq6FfWo5OGMGN9+UOIxd6dE?=
 =?us-ascii?Q?RALxWsJ3ugvP08wovowW8jD3hJksjNPo+74NsyVuSpEeenpa4A77/0hrcljV?=
 =?us-ascii?Q?Iwzxi+XpB9sob8QEuMELOnFlyLl2NymJ4UjKc+1uSckQx1m83DewLvnGqMdb?=
 =?us-ascii?Q?a6FtwMbdrLWX2QuP3MOzZ2bAeJQ5rklFPfOYtJj/lhYKFoGBG3Y6BjTvWiNT?=
 =?us-ascii?Q?OKDY/RRaNQt7KckcHIH+PVzgt9TEtlul+5Xj38tB87FAc2CmVBjsX2p68c6d?=
 =?us-ascii?Q?5TLH3EFuvCL7+QXLewtS5fFOhUS7Qbhiz7P3szgx35HHrq9m/rljv8Y0MJmF?=
 =?us-ascii?Q?nj+K4xb2m/P98otv52E9ZQLf18NoB+u/kX9ZNW7Vv+8/DCSPuMHJ4CwNswYI?=
 =?us-ascii?Q?z+e2R9kVdgyIHbsvs9f2IVhZMV85R5ZOHI9eXNjkdbOHKMvdqmOylBJGg86a?=
 =?us-ascii?Q?B53s1QDI7HFrBw7z/1yFX1M71vyp5AgZisnG6/MWJvuWRFdmv/aj6E5Q3puO?=
 =?us-ascii?Q?LbdX0fG5qQ80qTQK4Y2DrCGKnEugRhfgT9QFAImlB8jvmwECgUWUdH33x5zl?=
 =?us-ascii?Q?m0QJJ6LOOWVatLU1U3TkBDG20syNuozya4Lpi+n6aeASn4XgdCA/hNl6Y3RJ?=
 =?us-ascii?Q?G8+YaEDk1fTiBYbIVKblhtv0hWYwXPRMw4m1hKMFvHR5FYCr1HE5rsAwpPt+?=
 =?us-ascii?Q?kkLPhADfpFulw0dEyzRxM81oNxjUsyXYSyPo72p3/vgvpGTs8vSobKD2NclG?=
 =?us-ascii?Q?P1mT5u/kxFPCin70ReTPwKG1DviAMB9KJ7PrdQzH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3b5b18-9010-4c16-6e7a-08dbc671aef4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 13:39:37.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwLrbuPl2OAX0j1GXkM1+uKi3q+2IcuAdNE96uleda6QAfGSjftUo23lngplzLjX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5045
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
Cc: sachinp@linux.vnet.com, jroedel@suse.de, will@kernel.org, linux-arm-msm@vger.kernel.org, joro@8bytes.org, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, abdhalee@linux.vnet.ibm.com, iommu@lists.linux.dev, linux-next@vger.kernel.org, mputtash@linux.vnet.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 06, 2023 at 06:50:00PM +0530, Tasmiya Nalatwad wrote:
>    Greetings,
> 
>    Thanks Jason.
> 
>    The fix provided by you works. It is not giving WARNING's but i am
>    seeing below logs. Would you please confirm on the logs.

I don't know anything about your environment but those logs don't
appear to be related to this series?

Jason
