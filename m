Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 885A3535DA7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 11:53:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8g9J1mgnz3bpH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 19:53:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l8Jb9mFx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::611; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l8Jb9mFx;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8d9W5dRyz2yPv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 18:23:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLilRM0R90JrugQ84auxbnUMpaNoK9Bk8XpVIDY4LubTPEu7OBTlPp0fFtD68FFxtuedYs9jLycmUlN0j/MHs+xI74rHbnM7AeDjM4BIS/SSvnCK7SL1Q1kJrv3C58Q/pxXrTQVo9/26d9SRjRKF2anPsX23NviGdeLd1n6Wy6K2pgYQ8hhU2E47RmBKzUVXLpGqFgO/HdmOGrTK+bQDTidG6nk28fBQEyUuzfGDrBnoCwdBsv8Vfscj5rxsGDAaE4bVkubtSIEd2MmIz5LeHlWJ7C4KTYa/8WXgDZBrWZdKdcko8dVQLvAcipcNHPW2v7JJRXf0Ti/ASZVBK8XGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge2Ge1Dw8QnsksEhX+SdUNc+bNc9k2HwnZ4IBhpexBo=;
 b=VaPRGypYyXMVMs5b7S5E0Pj+72mySzLqG6iF15tFBCjlWtYjWZEraLzAG1tfksonD2Y9ZjAKAP4ovXxV/xkZJOMmUv94Xk5cS8jxKLHrilpJPPNTBf4frD8Qi9x4z1sNktv6c9oNxMQN8H7f2anQeQh/kvIdEXjcjJHTz6lLG3bKP2U5Ck0gWdMsrxeg8CUdJLLl9qfm3ofTLV9R72en8RFoL6FM7GaceAN0l7QnUb1eAUHB+4bEZZSAyEWnWJqA0CfrOql+x6yzKEcBqsk1NQ36vVNYann7zXuBlVWKmoLDXm44yEIOGLyFW/hYm+umHY0nvJKbG449A1PkuuLOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge2Ge1Dw8QnsksEhX+SdUNc+bNc9k2HwnZ4IBhpexBo=;
 b=l8Jb9mFxsR3Kc9ujvFG0LuOPhyYn5nlXpCjBg5A7x8vEFsOU9d7pWrJ9BFjXJhcs4hrYxh/qHhTMxPz9HYyAw0tQ2dANtgTjTUVpSiaMysmwMprlmSNIVIHbOraABazS182a9s+K4/qigSJvv3tdmiklbjRVSCQnAgeZZcEVk8XY0HEFZ22nVYSPPxHcOCnj67mt9oQ4ZRqvGAgYrifu8t/fxTWqrnFk3cM63kNi/7bxZ5+xR768+tdp1aG9bdg03X5Yk0a6RvEOL+3TqMNU6zyNc/r/nYbHZQ60ccRpfrc9mdDHw7T/20kX5QZIlN5UNfYPN6tDaOWE5hOVvg1nng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 08:23:02 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::59cf:d090:5d26:6e7b%5]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 08:23:02 +0000
References: <20220524234531.1949-1-peterx@redhat.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
Date: Fri, 27 May 2022 18:21:37 +1000
In-reply-to: <20220524234531.1949-1-peterx@redhat.com>
Message-ID: <87pmjz9yfy.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0027.ausprd01.prod.outlook.com
 (2603:10c6:10:eb::14) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8144ea32-55a8-4338-aee2-08da3fba1dd0
X-MS-TrafficTypeDiagnostic: CY5PR12MB6455:EE_
X-Microsoft-Antispam-PRVS: 	<CY5PR12MB64553261448A45E4B9AFEC81DFD89@CY5PR12MB6455.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Kj8bER77f9MfJ7wFOf1nvXTihsoUeIjY9Cg6TU3S3b7MqbjtEozcxTFW44gn/2X97AkdzkQ9DP7kldgn8Cmb7tlUG/kdso8FLwJxiqoaoix4CkW3lYHTinbl7mqLVJhy94EEAPqiIbP3ELhwJFDvESGl7S8aeJs/8rYXU6NN4jbVlpXAv/52MSYcZGDFmjhNgMrrRb13BsUsvXiwovKsg82H9dMaRua3afS6e8/4BkxsCMtKRX+rrUGIX9uac6CFe96usXrWXZjT9vpQdm5DHNE8atoLKiwHP2aSYMWPacd2tDo4CfIEeF+7+LadAsVnJdWD3rUNReHcu7UDEyC9ljphJsILc1/6NOPtaTKEL1KI5tPVZ5Xg34VskiJMs6yVWdK1XEQ4tS02f7vyQWwmlaHbD5t7UoYYdR4RXYFSdzEIg+HjcjEFSzWTUOVjjHebjv1aBlCn76KOxXlwwAyqJ8tT2MOzrDLG55O05CtSJj31193EA9MgDk9tBlQ3i55INKcfxpv/Lxs9Ysc62tLu7uT5Kvom8TWn90tCveOjm94kUdcASTDeWB8PC8SeHNthB6vE/CRBXEW9bguhwtwc14hx07ngwZVeA+gp/ios+Vp1K0Nl5U1r6K+zlQq7Ox50nCrn1TWfgslJSBrlT8sMLg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(186003)(26005)(6512007)(9686003)(6506007)(316002)(508600001)(6666004)(54906003)(8936002)(2906002)(4326008)(86362001)(66476007)(66556008)(66946007)(6916009)(5660300002)(30864003)(7416002)(7366002)(7406005)(38100700002)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Egn9Wkx74BIZHqY/XDodUFckr6eFUG9bbPHni9EKWgGPSJHJNSmGPR0F3fuA?=
 =?us-ascii?Q?4wc6KfDU7GIGlWizYFMMXfnoZCoEdlxjSZfwk2gtVOVLyqiH0z8gaN8dscS3?=
 =?us-ascii?Q?8K9ZKD9oxzbp5P4rJzRi9DrMYnk9k7pZrKXtpIRfkQUZatO996FWF5aluZuS?=
 =?us-ascii?Q?J2olYl8fUgTJ9kIgRq9fNE52vW3eliYgCrgGUH+2ok3FoLiga96p1PZH3+JE?=
 =?us-ascii?Q?6AOJ8Nx/VpY4WWWRwbQFS44tX5/hIgVx/pJJ6O3kUYsINN+pdnp6hYdAzh4b?=
 =?us-ascii?Q?q4T/D7KyntTYR3+1qn3edJSAwH/RtrsOh5BXMcu69GgMwQM1B4cQfzoH+EWP?=
 =?us-ascii?Q?gNcs0mukX04pNnNskX2b6KSMLmoxljJySFwOY15+MFx4baxBqpFK26GlHCUw?=
 =?us-ascii?Q?Ocgx17VIXNzZLjLJTMRA4wFejXsc9Ghx6Z+9KV1IHflW1lCTGaF8T4sUOyUm?=
 =?us-ascii?Q?V/w02wnsIzaKXAy0SnRdQ+zkTuqpGHgXSiCJpvTxjCxOyBL0XOUaaV3TAT6+?=
 =?us-ascii?Q?XpVWaHvvs/06/ibwooHrL4tvnJ4fhZ7Jf5Ueet7Tg+9oM97ESrYYYgKGm1Nx?=
 =?us-ascii?Q?MWJmtV3KQFvRmmiznQZmkZUmwMT5tYcxBjq7amv+6caJ+7cqqvgoAHPaA9ha?=
 =?us-ascii?Q?L/Z27IfJ1EjrKymHF1JJXQBrIzDbAq597CKlxvDSahSLTx6PX75K3fhmR2Al?=
 =?us-ascii?Q?tY/G6GvkzBX25bGIcRXh3jgj04GiNtuxWUX9pKqOYKTf3GXP+XPIQ1N24a1n?=
 =?us-ascii?Q?tkqymGbnrjXUlfvgFgN5T8P7eki08cbrMO2TpGrF1V5LW9+Rd6Tl5PE4WYKf?=
 =?us-ascii?Q?TnjiL9/41044cedZG9Z+5CZzubXG1wtIpGMLV0oGAGgRDBrUZqTLGeHJ6QQr?=
 =?us-ascii?Q?rkKN/2DDs4YDuwRFRKOnjQE2k31ieN2WuSyxe5We9khr1q/lPRaY/9KdWAYP?=
 =?us-ascii?Q?i+MTR+z+nUNCgbvQP88YawASx/ZuVTl1EtGFwUPpfi9giZelYK44i7lJNv+2?=
 =?us-ascii?Q?3sU8x84JLHB8CtyKodV1OlMuv1/IPy42eQUZrIX9E22h3xVhhXdbpjYOcjO6?=
 =?us-ascii?Q?nQqFS3Z/ANW0Qw0FpbdufBEfHQl41bZUHYFOrzTwQJSA4nvM9Pv9a+/bTjQz?=
 =?us-ascii?Q?n8J4vswVnF6SfRqVT5DafsXraJ3BJCb4Mlb2+cYonZXWHRjDL8qe4a+ZIJeO?=
 =?us-ascii?Q?4i93Bk+FKtcD89X4lWPZRboAgiS4VRiV92ycN5P5QCFZF1AFig/N3p6p4u3j?=
 =?us-ascii?Q?q89AluZ6MBmYUoZGBHqI3z8HMtKTR6d4zxajbP+F5M5igW1OwDnJ5k0bHpxl?=
 =?us-ascii?Q?ppqXfikR8mqR906CTb9pdtk+WtoyrplbWjijfbxsSV18keOxYVyuLvUZ49oo?=
 =?us-ascii?Q?3RQy+KrR1N7qp7xsSO38vetGwuHnEs9gG2funO/uPmTAnIn8fYWuh2JAWXbF?=
 =?us-ascii?Q?RBSDi+uQ5PU9bm0kSvj1GGaZHIkzuUbL1iax0tvZFMRZ2XXfJocLtnCLx7Oz?=
 =?us-ascii?Q?mK3yzLyqA08BKBMe/aUFf8bnAVl3uakX3rDjbMjG+xT/CyKV9MVfy9crVHKO?=
 =?us-ascii?Q?5bNJCPmckf3BgmK+nhk09x7j4DDa80EbEHwxU3Z2BpVqPdwL0R9zZIzTdDcA?=
 =?us-ascii?Q?+Dtg2jQSgxDHetz9ZIza/ZvbmbUtWBQmedj4dsZ2xXEx80GrthJHtkCmyNGE?=
 =?us-ascii?Q?WFpwrKB9olCVFbCoQETCOGt1NtrW0+3orkR48gO5tfkK7QryqpMvDkT2MMrf?=
 =?us-ascii?Q?NKghv5bSgQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8144ea32-55a8-4338-aee2-08da3fba1dd0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 08:23:02.6153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxkO0kvHQzM27g99vaqFtwZDoywGJ0kZ/c66VgL9K5cNKTIkyk4X8h5pYQDwyq0FG8231QNboMVHXZ6XB3miNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6455
X-Mailman-Approved-At: Fri, 27 May 2022 19:52:13 +1000
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
Cc: Rich Felker <dalias@libc.org>, Catalin Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org, linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, linux-sh@vger.kernel.org, Ingo Molnar <mingo@redhat.co
 m>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, Stafford Horne <shorne@gmail.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Andrea Arcangeli <aarcange@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Brian Cain <bcain@quicinc.com>, Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson
  <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, 

Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Guo Ren <guoren@kernel.org>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David
 S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Peter Xu <peterx@redhat.com> writes:

> I observed that for each of the shared file-backed page faults, we're very
> likely to retry one more time for the 1st write fault upon no page.  It's
> because we'll need to release the mmap lock for dirty rate limit purpose
> with balance_dirty_pages_ratelimited() (in fault_dirty_shared_page()).
>
> Then after that throttling we return VM_FAULT_RETRY.
>
> We did that probably because VM_FAULT_RETRY is the only way we can return
> to the fault handler at that time telling it we've released the mmap lock.
>
> However that's not ideal because it's very likely the fault does not need
> to be retried at all since the pgtable was well installed before the
> throttling, so the next continuous fault (including taking mmap read lock,
> walk the pgtable, etc.) could be in most cases unnecessary.
>
> It's not only slowing down page faults for shared file-backed, but also add
> more mmap lock contention which is in most cases not needed at all.
>
> To observe this, one could try to write to some shmem page and look at
> "pgfault" value in /proc/vmstat, then we should expect 2 counts for each
> shmem write simply because we retried, and vm event "pgfault" will capture
> that.
>
> To make it more efficient, add a new VM_FAULT_COMPLETED return code just to
> show that we've completed the whole fault and released the lock.  It's also
> a hint that we should very possibly not need another fault immediately on
> this page because we've just completed it.
>
> This patch provides a ~12% perf boost on my aarch64 test VM with a simple
> program sequentially dirtying 400MB shmem file being mmap()ed and these are
> the time it needs:
>
>   Before: 650.980 ms (+-1.94%)
>   After:  569.396 ms (+-1.38%)
>
> I believe it could help more than that.
>
> We need some special care on GUP and the s390 pgfault handler (for gmap
> code before returning from pgfault), the rest changes in the page fault
> handlers should be relatively straightforward.
>
> Another thing to mention is that mm_account_fault() does take this new
> fault as a generic fault to be accounted, unlike VM_FAULT_RETRY.
>
> I explicitly didn't touch hmm_vma_fault() and break_ksm() because they do
> not handle VM_FAULT_RETRY even with existing code, so I'm literally keeping
> them as-is.

I looked at the change generally and in particular for hmm_vma_fault()
and didn't see any issues there so feel free to add:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>
> v3:
> - Rebase to akpm/mm-unstable
> - Copy arch maintainers
> ---
>  arch/alpha/mm/fault.c         |  4 ++++
>  arch/arc/mm/fault.c           |  4 ++++
>  arch/arm/mm/fault.c           |  4 ++++
>  arch/arm64/mm/fault.c         |  4 ++++
>  arch/csky/mm/fault.c          |  4 ++++
>  arch/hexagon/mm/vm_fault.c    |  4 ++++
>  arch/ia64/mm/fault.c          |  4 ++++
>  arch/m68k/mm/fault.c          |  4 ++++
>  arch/microblaze/mm/fault.c    |  4 ++++
>  arch/mips/mm/fault.c          |  4 ++++
>  arch/nios2/mm/fault.c         |  4 ++++
>  arch/openrisc/mm/fault.c      |  4 ++++
>  arch/parisc/mm/fault.c        |  4 ++++
>  arch/powerpc/mm/copro_fault.c |  5 +++++
>  arch/powerpc/mm/fault.c       |  5 +++++
>  arch/riscv/mm/fault.c         |  4 ++++
>  arch/s390/mm/fault.c          | 12 +++++++++++-
>  arch/sh/mm/fault.c            |  4 ++++
>  arch/sparc/mm/fault_32.c      |  4 ++++
>  arch/sparc/mm/fault_64.c      |  5 +++++
>  arch/um/kernel/trap.c         |  4 ++++
>  arch/x86/mm/fault.c           |  4 ++++
>  arch/xtensa/mm/fault.c        |  4 ++++
>  include/linux/mm_types.h      |  2 ++
>  mm/gup.c                      | 34 +++++++++++++++++++++++++++++++++-
>  mm/memory.c                   |  2 +-
>  26 files changed, 138 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
> index ec20c1004abf..ef427a6bdd1a 100644
> --- a/arch/alpha/mm/fault.c
> +++ b/arch/alpha/mm/fault.c
> @@ -155,6 +155,10 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
>  	if (fault_signal_pending(fault, regs))
>  		return;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_OOM)
>  			goto out_of_memory;
> diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
> index dad27e4d69ff..5ca59a482632 100644
> --- a/arch/arc/mm/fault.c
> +++ b/arch/arc/mm/fault.c
> @@ -146,6 +146,10 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
>  		return;
>  	}
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	/*
>  	 * Fault retry nuances, mmap_lock already relinquished by core mm
>  	 */
> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
> index a062e07516dd..46cccd6bf705 100644
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -322,6 +322,10 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
>  		return 0;
>  	}
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return 0;
> +
>  	if (!(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_RETRY) {
>  			flags |= FAULT_FLAG_TRIED;
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 77341b160aca..e401d416bbd6 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -607,6 +607,10 @@ static int __kprobes do_page_fault(unsigned long far, unsigned int esr,
>  		return 0;
>  	}
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return 0;
> +
>  	if (fault & VM_FAULT_RETRY) {
>  		mm_flags |= FAULT_FLAG_TRIED;
>  		goto retry;
> diff --git a/arch/csky/mm/fault.c b/arch/csky/mm/fault.c
> index 7215a46b6b8e..e15f736cca4b 100644
> --- a/arch/csky/mm/fault.c
> +++ b/arch/csky/mm/fault.c
> @@ -285,6 +285,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  		return;
>  	}
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (unlikely((fault & VM_FAULT_RETRY) && (flags & FAULT_FLAG_ALLOW_RETRY))) {
>  		flags |= FAULT_FLAG_TRIED;
>
> diff --git a/arch/hexagon/mm/vm_fault.c b/arch/hexagon/mm/vm_fault.c
> index 4fac4b9eb316..f73c7cbfe326 100644
> --- a/arch/hexagon/mm/vm_fault.c
> +++ b/arch/hexagon/mm/vm_fault.c
> @@ -96,6 +96,10 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
>  	if (fault_signal_pending(fault, regs))
>  		return;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	/* The most common case -- we are done. */
>  	if (likely(!(fault & VM_FAULT_ERROR))) {
>  		if (fault & VM_FAULT_RETRY) {
> diff --git a/arch/ia64/mm/fault.c b/arch/ia64/mm/fault.c
> index 07379d1a227f..ef78c2d66cdd 100644
> --- a/arch/ia64/mm/fault.c
> +++ b/arch/ia64/mm/fault.c
> @@ -139,6 +139,10 @@ ia64_do_page_fault (unsigned long address, unsigned long isr, struct pt_regs *re
>  	if (fault_signal_pending(fault, regs))
>  		return;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		/*
>  		 * We ran out of memory, or some other thing happened
> diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
> index 71aa9f6315dc..4d2837eb3e2a 100644
> --- a/arch/m68k/mm/fault.c
> +++ b/arch/m68k/mm/fault.c
> @@ -141,6 +141,10 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
>  	if (fault_signal_pending(fault, regs))
>  		return 0;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return 0;
> +
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_OOM)
>  			goto out_of_memory;
> diff --git a/arch/microblaze/mm/fault.c b/arch/microblaze/mm/fault.c
> index a9626e6a68af..5c40c3ebe52f 100644
> --- a/arch/microblaze/mm/fault.c
> +++ b/arch/microblaze/mm/fault.c
> @@ -222,6 +222,10 @@ void do_page_fault(struct pt_regs *regs, unsigned long address,
>  	if (fault_signal_pending(fault, regs))
>  		return;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_OOM)
>  			goto out_of_memory;
> diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
> index 44f98100e84e..6f72bac39bf2 100644
> --- a/arch/mips/mm/fault.c
> +++ b/arch/mips/mm/fault.c
> @@ -162,6 +162,10 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
>  		return;
>  	}
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_OOM)
>  			goto out_of_memory;
> diff --git a/arch/nios2/mm/fault.c b/arch/nios2/mm/fault.c
> index a32f14cd72f2..edaca0a6c1c1 100644
> --- a/arch/nios2/mm/fault.c
> +++ b/arch/nios2/mm/fault.c
> @@ -139,6 +139,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long cause,
>  	if (fault_signal_pending(fault, regs))
>  		return;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_OOM)
>  			goto out_of_memory;
> diff --git a/arch/openrisc/mm/fault.c b/arch/openrisc/mm/fault.c
> index 80bb66ad42f6..c18f7abd64df 100644
> --- a/arch/openrisc/mm/fault.c
> +++ b/arch/openrisc/mm/fault.c
> @@ -167,6 +167,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long address,
>  	if (fault_signal_pending(fault, regs))
>  		return;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_OOM)
>  			goto out_of_memory;
> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> index f114e102aaf2..fe57175a7792 100644
> --- a/arch/parisc/mm/fault.c
> +++ b/arch/parisc/mm/fault.c
> @@ -309,6 +309,10 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
>  	if (fault_signal_pending(fault, regs))
>  		return;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		/*
>  		 * We hit a shared mapping outside of the file, or some
> diff --git a/arch/powerpc/mm/copro_fault.c b/arch/powerpc/mm/copro_fault.c
> index c1cb21a00884..7c507fb48182 100644
> --- a/arch/powerpc/mm/copro_fault.c
> +++ b/arch/powerpc/mm/copro_fault.c
> @@ -65,6 +65,11 @@ int copro_handle_mm_fault(struct mm_struct *mm, unsigned long ea,
>
>  	ret = 0;
>  	*flt = handle_mm_fault(vma, ea, is_write ? FAULT_FLAG_WRITE : 0, NULL);
> +
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (*flt & VM_FAULT_COMPLETED)
> +		return 0;
> +
>  	if (unlikely(*flt & VM_FAULT_ERROR)) {
>  		if (*flt & VM_FAULT_OOM) {
>  			ret = -ENOMEM;
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index d53fed4eccbd..014005428687 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -511,6 +511,10 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
>  	if (fault_signal_pending(fault, regs))
>  		return user_mode(regs) ? 0 : SIGBUS;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		goto out;
> +
>  	/*
>  	 * Handle the retry right now, the mmap_lock has been released in that
>  	 * case.
> @@ -525,6 +529,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
>  	if (unlikely(fault & VM_FAULT_ERROR))
>  		return mm_fault_error(regs, address, fault);
>
> +out:
>  	/*
>  	 * Major/minor page fault accounting.
>  	 */
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 4e9efbe46d5f..d6a87f4137ca 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -330,6 +330,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  	if (fault_signal_pending(fault, regs))
>  		return;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (unlikely(fault & VM_FAULT_RETRY)) {
>  		flags |= FAULT_FLAG_TRIED;
>
> diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> index e173b6187ad5..9503a7cfaf03 100644
> --- a/arch/s390/mm/fault.c
> +++ b/arch/s390/mm/fault.c
> @@ -339,6 +339,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  	unsigned long address;
>  	unsigned int flags;
>  	vm_fault_t fault;
> +	bool need_unlock = true;
>  	bool is_write;
>
>  	tsk = current;
> @@ -433,6 +434,13 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  			goto out_up;
>  		goto out;
>  	}
> +
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED) {
> +		need_unlock = false;
> +		goto out_gmap;
> +	}
> +
>  	if (unlikely(fault & VM_FAULT_ERROR))
>  		goto out_up;
>
> @@ -452,6 +460,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  		mmap_read_lock(mm);
>  		goto retry;
>  	}
> +out_gmap:
>  	if (IS_ENABLED(CONFIG_PGSTE) && gmap) {
>  		address =  __gmap_link(gmap, current->thread.gmap_addr,
>  				       address);
> @@ -466,7 +475,8 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  	}
>  	fault = 0;
>  out_up:
> -	mmap_read_unlock(mm);
> +	if (need_unlock)
> +		mmap_read_unlock(mm);
>  out:
>  	return fault;
>  }
> diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
> index e175667b1363..acd2f5e50bfc 100644
> --- a/arch/sh/mm/fault.c
> +++ b/arch/sh/mm/fault.c
> @@ -485,6 +485,10 @@ asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
>  		if (mm_fault_error(regs, error_code, address, fault))
>  			return;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (fault & VM_FAULT_RETRY) {
>  		flags |= FAULT_FLAG_TRIED;
>
> diff --git a/arch/sparc/mm/fault_32.c b/arch/sparc/mm/fault_32.c
> index ad569d9bd124..91259f291c54 100644
> --- a/arch/sparc/mm/fault_32.c
> +++ b/arch/sparc/mm/fault_32.c
> @@ -190,6 +190,10 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
>  	if (fault_signal_pending(fault, regs))
>  		return;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_OOM)
>  			goto out_of_memory;
> diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
> index 253e07043298..4acc12eafbf5 100644
> --- a/arch/sparc/mm/fault_64.c
> +++ b/arch/sparc/mm/fault_64.c
> @@ -427,6 +427,10 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
>  	if (fault_signal_pending(fault, regs))
>  		goto exit_exception;
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		goto lock_released;
> +
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_OOM)
>  			goto out_of_memory;
> @@ -449,6 +453,7 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
>  	}
>  	mmap_read_unlock(mm);
>
> +lock_released:
>  	mm_rss = get_mm_rss(mm);
>  #if defined(CONFIG_TRANSPARENT_HUGEPAGE)
>  	mm_rss -= (mm->context.thp_pte_count * (HPAGE_SIZE / PAGE_SIZE));
> diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
> index d1d5d0be0308..d3ce21c4ca32 100644
> --- a/arch/um/kernel/trap.c
> +++ b/arch/um/kernel/trap.c
> @@ -76,6 +76,10 @@ int handle_page_fault(unsigned long address, unsigned long ip,
>  		if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(current))
>  			goto out_nosemaphore;
>
> +		/* The fault is fully completed (including releasing mmap lock) */
> +		if (fault & VM_FAULT_COMPLETED)
> +			return 0;
> +
>  		if (unlikely(fault & VM_FAULT_ERROR)) {
>  			if (fault & VM_FAULT_OOM) {
>  				goto out_of_memory;
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index d0074c6ed31a..12ed70b432d6 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -1408,6 +1408,10 @@ void do_user_addr_fault(struct pt_regs *regs,
>  		return;
>  	}
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	/*
>  	 * If we need to retry the mmap_lock has already been released,
>  	 * and if there is a fatal signal pending there is no guarantee
> diff --git a/arch/xtensa/mm/fault.c b/arch/xtensa/mm/fault.c
> index 06d0973a0d74..5f64305ba8d7 100644
> --- a/arch/xtensa/mm/fault.c
> +++ b/arch/xtensa/mm/fault.c
> @@ -118,6 +118,10 @@ void do_page_fault(struct pt_regs *regs)
>  		return;
>  	}
>
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return;
> +
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_OOM)
>  			goto out_of_memory;
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index c09b7f0555b8..decc275db3c9 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -729,6 +729,7 @@ typedef __bitwise unsigned int vm_fault_t;
>   * @VM_FAULT_NEEDDSYNC:		->fault did not modify page tables and needs
>   *				fsync() to complete (for synchronous page faults
>   *				in DAX)
> + * @VM_FAULT_COMPLETED:		->fault completed, meanwhile mmap lock released
>   * @VM_FAULT_HINDEX_MASK:	mask HINDEX value
>   *
>   */
> @@ -746,6 +747,7 @@ enum vm_fault_reason {
>  	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
>  	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x001000,
>  	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x002000,
> +	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x004000,
>  	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x0f0000,
>  };
>
> diff --git a/mm/gup.c b/mm/gup.c
> index 2e07cff3b31b..3347b083d70b 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -951,6 +951,25 @@ static int faultin_page(struct vm_area_struct *vma,
>  	}
>
>  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> +
> +	if (ret & VM_FAULT_COMPLETED) {
> +		/*
> +		 * With FAULT_FLAG_RETRY_NOWAIT we'll never release the
> +		 * mmap lock in the page fault handler. Sanity check this.
> +		 */
> +		WARN_ON_ONCE(fault_flags & FAULT_FLAG_RETRY_NOWAIT);
> +		if (locked)
> +			*locked = 0;
> +		/*
> +		 * We should do the same as VM_FAULT_RETRY, but let's not
> +		 * return -EBUSY since that's not reflecting the reality on
> +		 * what has happened - we've just fully completed a page
> +		 * fault, with the mmap lock released.  Use -EAGAIN to show
> +		 * that we want to take the mmap lock _again_.
> +		 */
> +		return -EAGAIN;
> +	}
> +
>  	if (ret & VM_FAULT_ERROR) {
>  		int err = vm_fault_to_errno(ret, *flags);
>
> @@ -1177,6 +1196,7 @@ static long __get_user_pages(struct mm_struct *mm,
>  			case 0:
>  				goto retry;
>  			case -EBUSY:
> +			case -EAGAIN:
>  				ret = 0;
>  				fallthrough;
>  			case -EFAULT:
> @@ -1303,6 +1323,18 @@ int fixup_user_fault(struct mm_struct *mm,
>  		return -EINTR;
>
>  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> +
> +	if (ret & VM_FAULT_COMPLETED) {
> +		/*
> +		 * NOTE: it's a pity that we need to retake the lock here
> +		 * to pair with the unlock() in the callers. Ideally we
> +		 * could tell the callers so they do not need to unlock.
> +		 */
> +		mmap_read_lock(mm);
> +		*unlocked = true;
> +		return 0;
> +	}
> +
>  	if (ret & VM_FAULT_ERROR) {
>  		int err = vm_fault_to_errno(ret, 0);
>
> @@ -1368,7 +1400,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  			/* VM_FAULT_RETRY couldn't trigger, bypass */
>  			return ret;
>
> -		/* VM_FAULT_RETRY cannot return errors */
> +		/* VM_FAULT_RETRY or VM_FAULT_COMPLETED cannot return errors */
>  		if (!*locked) {
>  			BUG_ON(ret < 0);
>  			BUG_ON(ret >= nr_pages);
> diff --git a/mm/memory.c b/mm/memory.c
> index 54d106e0c999..a8be2d7a8718 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3020,7 +3020,7 @@ static vm_fault_t fault_dirty_shared_page(struct vm_fault *vmf)
>  		balance_dirty_pages_ratelimited(mapping);
>  		if (fpin) {
>  			fput(fpin);
> -			return VM_FAULT_RETRY;
> +			return VM_FAULT_COMPLETED;
>  		}
>  	}
