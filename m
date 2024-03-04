Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6588701E0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 13:58:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KrhtaWsW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpJdq46hXz3dVf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 23:58:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KrhtaWsW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7ea9::62d; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpJd358bYz3cBG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 23:57:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3roZqUCGeCkG97c28EVN4rAO1IAs/KdsdO4LzH0+Q7CjrfnouD14z/44IxsGDnJUCdDdNGCJMYlPtRcJgSAn/NOD7/kCk84CzljFInv/ZlBNCAPjsCT0cSzWAJQIN+rRkVNAELsJCTcp0+n+PybGjxW4LBCch8sx/yLjGpVDLlimru04zMBoTt28yFEfK8fly7ai0EdRbIU24TX9dgpolYySd/vwrp9nOvF+Wgj3ZE9C/W4crrmLI6ulxyRoA3Em0nOgPThW3esnryyTBepkeG06h1JACJGDpMOYdokqbqroeFZQXjcarILpIiQSza6wumGa4SKk6Mj+ZrrwO741g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dz/VIKySif7YxyUk5CZ6N+BVAxb5wfqGWTPvmcJkres=;
 b=B0BXNg+Wy31inCZrXo5y8eofa9xa9Z8eqvkj5A5/kd/715UoOwEkhMkXgvNZy3Yc5d4hBb0t7RCBBXu3tTAaJxKIKFgjHJow03GATu1jUbWp16wtGn9EicUShs+JCmQvf2iZEGXF9wnKPtalTgveK4A6rGS3M2PhX2raIAZLbMuAzXFQAWvHBZXMlQJ9InTkxAC7rwBZGrvvYzTQampTfo7FJYui5zZkN2BHYpYbglq8t1WLbI1LMQL3FXcHOMvYbYeB3Ba3Vl8iN5Ir9rpuD/qpq0lAXRGOwPPA9PJYHMXkfvusHJfQzYkoeJSUSepgMJp8F/Lyu4qDRP+6ju4GUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dz/VIKySif7YxyUk5CZ6N+BVAxb5wfqGWTPvmcJkres=;
 b=KrhtaWsWY/Cm7Q24O/Wbmj2ODUQ+QdWzPKkcwgQFhjX15M4dAs1EiHsl3paHUaYcUd36k8l4qHAD/cIUrHZtxLeZ5QByuQfsl/aT4oOv48NekyLMXntwlmSDSEwGma4+SjaLuN35pZ0EarJJCP/Rs90rFkHnYFE/tNKHF0RlrBuXjPO4f+/BUpYiy1jJayOigEyn6ddIpz4t8XPbKKova6fo8ygmXaCvSSTdqA96YRt6qgR7qilmVgmqbo/P9Dz3sdh5Wd3KWcKLQxJrBl0MLIoGJF+3HghJwmMq7d77VGgjyFy1JrlA8yB0VBSK2A8KBPnDrXYVDZo5TYu8AW3SBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SN7PR12MB8102.namprd12.prod.outlook.com (2603:10b6:806:359::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 12:57:01 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3%5]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 12:57:00 +0000
Date: Mon, 4 Mar 2024 08:56:58 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 1/7] mm/ppc: Define pXd_large() with pXd_leaf()
Message-ID: <20240304125658.GO9179@nvidia.com>
References: <20240229084258.599774-1-peterx@redhat.com>
 <20240229084258.599774-2-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229084258.599774-2-peterx@redhat.com>
X-ClientProxiedBy: SA9PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:806:27::28) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SN7PR12MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c66146-ef2e-403b-cb0e-08dc3c4a9525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bcGj7NS6x6KptUWmtTG8gyyC/fVmJFoU2OVlWvgrRqt2Z6tZ2DKrUuBImIjmwjRiGiokdxoE6sJT7G6bJ2P2T5YH4XmTHD88/YcuZROYvayLKJqIh+O3bbSf63vm7HJQm7+QXi3XSDlHG4v5Yt5rQnPqXKtqmqGQe+4Rxag/ZwJHFX26LicxudFZcFwNT7FBLWRDPqG2JE8HcKkcI+8BTrR/axTqPmoFjVn3ykniJFlF0bIzQvAguVAKtb4T1JLBfqWvAJHSAsVb7AxVseJS9SyH9nwd/Y7rWVXuE01iaB+behEC/+A3L7VffuP7IhU5YEn2VK4k3CkSI0875Zr0/7VvAjuPDLTElBeQOyHIN77xmixmDHlgaRqHELzIfQMkGRfWWAtpBYzamB/lGWTGiC2zTUkwme4krOf3+K5Ll+zkJH4wYus0xkJO5JSDGdT6UVNIpkWaqHM4jAg/yPSOTp9P/4C8FfdFmRWuoUXK5rsH3FEXlBmZ6aaUVAU0UxjoB4PfRky8y4qk1wkY2DQCTJBABRpb4+TpklpDBLMs7e9YksaKDOjF8M8xvcZX4ZIxDQr+TZjXHO8AmALmHvgcqj92diR17pMGsLw7RJEiw8ERA4SIxtDwLm2Ny7oo26Wloo67qWMOlzf794Hqkfd7SJGswDOeqQzCA6ZCV2738ro=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3ZLSK6vx0PuJjpwC/dtd4APjFbaUGZEh37Y/xzviyTSLoWaOoEiN58lBH5kP?=
 =?us-ascii?Q?Pk8+WRrvj6rrm8gFFi954quSjY9QYqA7h7nWqUALqMjoNbTtphBjz+oTXqrJ?=
 =?us-ascii?Q?3z0Mq3ML/s1rpqzUb3ZiFkzI7o18CVMZ+DoMDrExl7UZnInj2oF63a6GGAqk?=
 =?us-ascii?Q?F1xhb4VpLlIH4AYc2oR1G9T/Wn6pY8IFFVHOFYX8Pm1yZpim4j2a7eLd7Qz5?=
 =?us-ascii?Q?FfiorBIIYIg1XWIKm7jbtcz+OFGhOe1sHmMWsgEQfh1D+gJK9sqjT2OCnqPJ?=
 =?us-ascii?Q?kH6WEBoIJEvf9aQJ2XbwAmXu3TqkfgF+nVewyEVY78bIOdLdkHkdwT3ftKFz?=
 =?us-ascii?Q?IVQhlY5yebjqcYgmYiZqhA6KhpFnEZ920YnO5PMsbfNl33rHhEbCejMr+A2y?=
 =?us-ascii?Q?OguqCiuNiIUB3kAEYL64enMZMbruYrzFfGFoWlvcV5aGF193K6ox/Vc+PcKy?=
 =?us-ascii?Q?9D+KeaFV2K2zd5f7I33b9KAZhJ1xUmmUi2+xGpKFkLzML0uYCkzBPoKT4EYx?=
 =?us-ascii?Q?TQOXI/6oE1FImd2OrFBx9AbC7yub6OogDyWl+MT5Y2mrdp/vbiRn1UlSBdj0?=
 =?us-ascii?Q?Y7jeZe0mDB3LtUzeK47n0+kVANZH1thVznG+BiU5DaDpsGEaQ3LYcOk3ULQR?=
 =?us-ascii?Q?qqVUg0EWcMOm3N1DmbfDoBVNpReWs/m13MKZXiH/KSD3FnpXPsoWsgpeD4OW?=
 =?us-ascii?Q?AskbxW49DOPRPSaOfpRKp+Kp4Yhh69/aun0yNFYyf98VY1JfZ8Z9Q1ZobN/S?=
 =?us-ascii?Q?gn4EqYTqlLD+39fhqv+tzHt1mUTjz3tepW1uglYzGQqVutmIrzxmQpbTCdcE?=
 =?us-ascii?Q?QRMrU0UtRu23tQNz+iU3RGWFjnu5zXZ6ISDqtNAYbMLIZPEC2/owZCEMIzgw?=
 =?us-ascii?Q?+vKSQuya2KgplcAa8xXym5xW22x+xrI0xZRq2fZgZ/rI0aF8/Sl2/qGYA4c4?=
 =?us-ascii?Q?EzbxCaLvweKazRLkRAEEJIRCjXjOIxY0te9P9fDjV1VLUpoDqKPbAEyoks0X?=
 =?us-ascii?Q?KAQwPpVVwHY5gRlSJ0z8d71HMrFO2KKt2rQ8bZKyybdXBMYCt+HWyu88cD1V?=
 =?us-ascii?Q?C0adpyWbGPfYk41XbO/ez3NF+JzAr0UYDdPfu2xTTNqKk3OGF51aiA6NNom0?=
 =?us-ascii?Q?fX/FSikgQXkBQ5appEKjN7JE3xp/wCWaqMojr0seI+zeFDUIzabP5yOV012X?=
 =?us-ascii?Q?uSmVvZu6FgT56iNJCmSUO8TCRcgHPbDJPpR9dJowgInkarbmcdqPPXViLWgw?=
 =?us-ascii?Q?oXvaH3OtKLQmk943jeXJyZBoK+JkpG7DvaOg9TnKHwkMkI4xKJ2Wjexx/tVu?=
 =?us-ascii?Q?ryK6VmXYAgQTCBbNrmVI1FZccwkRgXaHzysoyujUHcpp8hgzzdxjMT5Nk7PE?=
 =?us-ascii?Q?024imH0ZZMXFUS2o2vN1Jf/CnRlMsjT8gcAcIb+3lqgw7LKxEcqTTJgQ+9Pv?=
 =?us-ascii?Q?Rpp+fOAPAA7SrR+Z14WeJylxDVlfGCUzMFTBcWjo3CrjVmwn3P1qHlqEHUak?=
 =?us-ascii?Q?O0CPrNfP4HKHDvgxPKual46xibEYcED/5cM0/9vfiK1uf7OkZfpdg9Q7X1et?=
 =?us-ascii?Q?Dos521BVeq/gJOcImKw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c66146-ef2e-403b-cb0e-08dc3c4a9525
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 12:57:00.8576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlSYmGJrkRnPbpxhJQY6ZK/P4L/md3J0UZzKqPWUXzTaDqJ2CtQ64UmEJOHfuyH6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8102
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 04:42:52PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> The two definitions are the same.  The only difference is that pXd_large()
> is only defined with THP selected, and only on book3s 64bits.
> 
> Instead of implementing it twice, make pXd_large() a macro to pXd_leaf().
> Define it unconditionally just like pXd_leaf().  This helps to prepare
> merging the two APIs.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 16 ++--------------
>  arch/powerpc/include/asm/pgtable.h           |  2 +-
>  2 files changed, 3 insertions(+), 15 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
