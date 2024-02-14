Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4E8855856
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 01:36:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pz+Du/nR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZx245Ty8z3cFX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 11:36:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pz+Du/nR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:240a::600; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=rrameshbabu@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZr9F4xlkz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 07:57:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6CsN4lWBkkUSCOoUJ7l0h+QUKBenFrV2B3G1Ps7EJ41ZUcFb3adf12bG2Os6PdtD56TycS0gpPEeNH5iK62XCDQoocPSgBw8ZrjBKak6MscPHG3oCC8VPzPMYQRCwVcGTTHJ9zIKHwR8nAxqLre7V4sR9E/McRyVD6KaI9vEVHZdZ6KqHzKBHSwFYs288j+LMRXMww0q72u41fkN69Zc5rZH2/Zp6zw+kFAJ43gZzZNYXpHHAz5Mr/QEB7ne+T5qkjcbq/+NONKQi0hKR7R9X6dQh49MpS9Tl2kZXccFYOIkB86aSMIjKhgTXQ1jWkKhQplOH5H1xKirkoEryN5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1maQEiuNSLlkxHXSAx3IxLnHu1GLwhzZrm8AjMqDSBU=;
 b=TPuvA3vW8U78aPFgWaBiGiSn0bBJLghMeDt2wP2qHxbpk2DK/6qxC3fmrDMBu0rx6PyEHRz+5X5PPWXo77ZHG/4QEJR+VjA57Lg6JMJuynR6yLuhgbEUl+w3K4jgzwsIkotebTSBR55QXkbJK+9tiKinpWLN8JLnRBQmCMPTpSaLdcX8LdNTJXzygWqxw8A1cPi9pnvTy1buAtQFOSuHFCbvUqaW8QV9zoowsKHRfuOa0miVUZnTie3GM9UIcV5WZlBXwwIq5SPqcG+kbNnFXZW5N6UTFVsqA2jx+jU4Y1mbrsjgOYU4Ok5jQFykmaX4ysksrI+rJSuDT9WsmLm6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1maQEiuNSLlkxHXSAx3IxLnHu1GLwhzZrm8AjMqDSBU=;
 b=Pz+Du/nRttgHHCM9o536srXh7QNBSDfjQckWfPmr9mX8+NeC8F5PW+Dt2cZoN0/Hyn+lRZcI/3LbA7QXZQFrGCtLiwC4cPiB9CWY/C/uJZtYrYDpU2b3KFA9oGxpOiqBOd8csi2MMiz9ZXVgOatAwLtc212PytSPVZqvdJy5tg+qIVCB4kkntNYswft79eJ3cqlCVOyqu4BIiBRexV69DYy0Igh7d8VEfRJ4Z2WSYzKQC7A826i4qYGe8AMo/PvQs4z6Td+SPoEqKlKLTBPkKgNsSaIbefbGKANfpyPcoWMnRbD+/w5eX06QZiTy07asml7RwmyFjexVIYjVAYFh4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2743.namprd12.prod.outlook.com (2603:10b6:a03:61::28)
 by BL3PR12MB6522.namprd12.prod.outlook.com (2603:10b6:208:3be::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 20:56:40 +0000
Received: from BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::d726:fa79:bfce:f670]) by BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::d726:fa79:bfce:f670%7]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 20:56:39 +0000
References: <20231215124449.317597-1-mpe@ellerman.id.au>
User-agent: mu4e 1.10.8; emacs 28.2
From: Rahul Rameshbabu <rrameshbabu@nvidia.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Increase default stack size to 32KB
Date: Wed, 14 Feb 2024 12:47:39 -0800
In-reply-to: <20231215124449.317597-1-mpe@ellerman.id.au>
Message-ID: <87ttmau5mg.fsf@nvidia.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To BYAPR12MB2743.namprd12.prod.outlook.com
 (2603:10b6:a03:61::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2743:EE_|BL3PR12MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: c37e8175-53c2-414a-cdd9-08dc2d9f70e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fmVi7XDqFXWH/1G5SVFd1N+HMgTj3g7O6mLJ4Ag/1Hgg0aGApg0UPYvNARkxxqkKOYXzjl3AEwmN281+szJtnrWFbFD2IgvvEKfuGWysEmvFnGJBlDVb4m+EpZY6Oyttv10h/I+jAhuAfFW2deJWG3aRfHRj5XDnTeFrKhhyM938C6Kof/TM55K90kA1GuA10vjFigQe2KiIwhCgTXxTsfhDrb+7RAEyJH6qYHTHqZuEQ2si5CMWOVA87NMf/VEv8lQn7/hWMUiq9Jz0Q2bXOXkdkVqH3c6dh6vWSiuULuHBJK1QAZ1KxNDWEjmgLldD7kyK4K8rGtm2d3rsKD79vmRLFe98JpnD8GYOmpPxAPwfgyh8V4UEjOIiXE85OyEoNbMJpuAb8KndLKDbtPawuBWhgFjFoigJvuGBlyJQFfubI3VSoWi/2/txlxVq30qHW0GSHxAlCzwU9kb4npLJDU6N3Es5D/oh3aMUg6+Dl85M6hwfuqU+3S7g0Pz2982Yj2VZvNntSldQnuOIELbzA1xoT+RIU9VrAFIVssS9TKFm8GLufSYqywRaaZLz8XcD
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2743.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2906002)(66946007)(5660300002)(38100700002)(6506007)(86362001)(107886003)(6512007)(83380400001)(316002)(6916009)(26005)(36756003)(66476007)(4326008)(66556008)(6486002)(8676002)(8936002)(2616005)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?1T4mhS79BNoBLAzAoKtgfguAxcI0Om9tm2HAI9WZk5mwirlQC1SrX2AT3zcM?=
 =?us-ascii?Q?ym/aK9Lrb1OlUgeBUTNkdupc8QIu6V1eaaid+wCZYPgCgXsr6kYEvq8hFvEG?=
 =?us-ascii?Q?4P7+8hUcXqi4PTM70Wdft1gPrMgHezEC0KTk+dxfYitYbQxMZo8tjUHBmrrJ?=
 =?us-ascii?Q?1xgHSTSPS/MngnsxgRqp3nJCyoQ8iDSVzSXGWXMrDCxDHMvMfC9hIGAs29NS?=
 =?us-ascii?Q?ws0YU6DgbFiKNJ5EheWFoss7c6fhnS2QNKPlrwkTrUjPffPL2fRX/dZUUfOj?=
 =?us-ascii?Q?88S4Npp9drjaMSecOcAFZb5mc51eYEBd7WRrkMyBErU33Y/3Jye8CtLnlfMV?=
 =?us-ascii?Q?xnqo/lhn0f7oaIZsZlci2WvMOOYIBZdm5kyspFKHEoC+aiB9Xr1Uu3fr2c3K?=
 =?us-ascii?Q?A1nHFDStkxrn0jkeqdVx1eFqyRyym3GVA+2R6Hn0Q5Xl3+GztPPhBYfPIB49?=
 =?us-ascii?Q?UkOZjqEVfPvR/qSxt7hAU7jEEzYnleNqVOh+61n9WCvFK7qwEDHiVai2d/Li?=
 =?us-ascii?Q?+JpDa86WXdTd43QCzLkyS13al47OVfFS4hWWPt+KixIPaUC3EaV0V0cumTiE?=
 =?us-ascii?Q?WdeAo6qOHplDly3bT6xskoNnQGwjZojLlGMZiAgkpBPAEUp27ZEstQc32l1Q?=
 =?us-ascii?Q?QT+wSF73vWajU5jVHYZ+9KEkgkY7vkvVUhvVz6kB2pP0jFQX38zJF3ZS3f30?=
 =?us-ascii?Q?ojHmzP+gjNpD7C0TCI5fCwqo6YZQ6vkQSRqqGzJYbeEYFivuZrVCpKQugJ7r?=
 =?us-ascii?Q?gDfKMdBrYRAw8YyDUgmCCnpwJf+IfGeEMJJBq0XRIEr/Mi6Z6waRXUr8NDHV?=
 =?us-ascii?Q?g40fcTQIXsY4QVBmZAPTl1xZ+TEKOaMGFHiAJsy7jq8KHRu4GuFzLAeZysr+?=
 =?us-ascii?Q?os3bgZj5Y8qFhPMQ+5of75g5uVmFTn1WOFncKhvdNQEYzzGriKLZDVwXsGpK?=
 =?us-ascii?Q?pOIrVuuojX8APcvFMY1+tGETzs6eKDvWi8hicqHKRvd1z+uS4W5B+Vs9xNs7?=
 =?us-ascii?Q?ocoLia+ufAOb0Nq1FLBGS2B9qwO6PcYNg+cQYR4GNPgMk8mKecbIkx30ALyN?=
 =?us-ascii?Q?oE2iH9e7s1vfdfLy6DGC+rFFakzm2VxSnudH9HfAFSiSALU7LahY09V5fwkM?=
 =?us-ascii?Q?TY+6JbotIjWDlJ4Pt/prUQdG3X5s7JDeCuRCifITslZoa+b+oFaK+0hXxZlo?=
 =?us-ascii?Q?JIhHCmyRZD+4d1ChddwnandqR7newtfexo9/ukwFCGyIGKejHpkfScouiCOf?=
 =?us-ascii?Q?OKZ/lTNHWsjPG2QieL18H0KZuLeTnHCitvGLdw91xYBO3hMZkg03MvSGkU2Q?=
 =?us-ascii?Q?UPHrSl9Mv6/pG2OlH7SFzZMI5qQbnPrpj4lJovfLbdzzGtc0iPzXd1z+pFxp?=
 =?us-ascii?Q?TScMCa8hX1otK4zGROhhii3fZrVtZSsX/yNFD6f9IDUCB9tpmV9YlDfecXHb?=
 =?us-ascii?Q?t1iGCYzBFgGPi6FH59X3ibpw09LTjHRSzYbKRzOIwGmKowpnSwjidJkTKgRe?=
 =?us-ascii?Q?ukkVaihe/JQ2g+sAIsN51i8GPSpec3t4zDuTi4p6c00SDoj83N5DeVO0ByXa?=
 =?us-ascii?Q?I3Hv3cTKBUGuMgWY+zo6j0+Sp2gGmIdNX3/uvowhoapcDNi8CttWP2mtjgjZ?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37e8175-53c2-414a-cdd9-08dc2d9f70e3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2743.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 20:56:39.7852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: squ7KroZS/trb7EWjx9ydVrweylK8RmPtATiBi90j9apBCYBW0MWQSjdYXK377DjKEh79ysiRVmW3KAOfo2pmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6522
X-Mailman-Approved-At: Thu, 15 Feb 2024 11:35:36 +1100
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
Cc: Gal Pressman <gal@nvidia.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Dec, 2023 23:44:49 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
> There are reports of kernels crashing due to stack overflow while
> running OpenShift (Kubernetes). The primary contributor to the stack
> usage seems to be openvswitch, which is used by OVN-Kubernetes (based on
> OVN (Open Virtual Network)), but NFS also contributes in some stack
> traces.
>
> There may be some opportunities to reduce stack usage in the openvswitch
> code, but doing so potentially require tradeoffs vs performance, and
> also requires testing across architectures.
>
> Looking at stack usage across the kernel (using -fstack-usage), shows
> that ppc64le stack frames are on average 50-100% larger than the
> equivalent function built for x86-64. Which is not surprising given the
> minimum stack frame size is 32 bytes on ppc64le vs 16 bytes on x86-64.
>
> So increase the default stack size to 32KB for the modern 64-bit Book3S
> platforms, ie. pseries (virtualised) and powernv (bare metal). That
> leaves the older systems like G5s, and the AmigaOne (pasemi) with a 16KB
> stack which should be sufficient on those machines.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

We noticed this change is causing assembler issues for us when building
the kernel.

  make ARCH=powerpc KERNELRELEASE=6.8.0-rc2_for_upstream_debug_2024_02_06_20_01 KBUILD_BUILD_VERSION=1
  arch/powerpc/kernel/switch.S: Assembler messages:
  arch/powerpc/kernel/switch.S:249: Error: operand out of range (0x000000000000fe50 is not between 0xffffffffffff8000 and 0x0000000000007fff)
  make[6]: *** [scripts/Makefile.build:361: arch/powerpc/kernel/switch.o] Error 1
  make[5]: *** [scripts/Makefile.build:481: arch/powerpc/kernel] Error 2
  make[5]: *** Waiting for unfinished jobs....
  make[4]: *** [scripts/Makefile.build:481: arch/powerpc] Error 2
  make[4]: *** Waiting for unfinished jobs....
  make[3]: *** [Makefile:1921: .] Error 2

The issue lies with the do_switch_64 macro.

--
Thanks,

Rahul Rameshbabu
