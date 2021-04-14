Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B6835F0D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 11:28:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKxx737zLz3bv1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 19:28:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-Synaptics-onmicrosoft-com header.b=gCK3Woso;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=synaptics.com (client-ip=40.107.237.65;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=jisheng.zhang@synaptics.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Synaptics.onmicrosoft.com
 header.i=@Synaptics.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-Synaptics-onmicrosoft-com header.b=gCK3Woso; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKxwf6dxXz2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 19:28:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWfcPYzyYgdp2Z9UdLYDGnFSjv631FQt9ZqJ7mCpdN+Yo7moSq618V2qZAr9L8XqipdN6LqxoCG+HWIM18iRDfa4RiVUlJD90e18r0hywZd0wWTvkY9J0FpgJZTGnik7+G71Wg6y/G8BbYZvHcQD3BvFvHnsXnRXbuDzRD3BZtQcXCZZeBcq8m8Ca8Dy6LSd+dlP4Jk5Ye1XjgDmzYTPAU1M6bygJQIwHMdITceenp6wExDAVlKwJqMuuIYX7nVez2pwkH8h8Y/u1jYi1oSVRbfQ7fLBCADfFIxAaJqXhUrAOV4ZB03kBXvbUIN3vrgc+kuJzkWNAszjaynUk7APyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGn6HpN6f+b3HanJnFxiW4e/ZPzZpDDHYpCx/0xUmrs=;
 b=SLzQ7Wcpg7Yoe/g5QDjERPjuuj9daNLu1GQ2m+v9E/ptt0qU+/jxH0Y0D9g18eZTEWeALLOoYq8X8jVG4+L2+lTUiAGxQ9pPy1MT3HTZQzt2Q5MWLcgkuvnn4ZOR+FwqgAiSrp0u1VboVOQ9XfTuRHnzj8sOs+DnFbDcrlMOmo8035VcCfce1uWdpsjoM0mLXWKXpRd9VK6gYlpljZfPS7W1jHu1pJB9H6aJAq+T4OTYIpzDWeJEvNDoWMkV2Gpk0K6kHVMCVWyXDcfizZ5pU0CC36/lGwa1r2orWGqczA23qU6YJn0/fkQvV/90IvxVNdmw31G4uMu3tWuYLNdKkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGn6HpN6f+b3HanJnFxiW4e/ZPzZpDDHYpCx/0xUmrs=;
 b=gCK3WosoSkUVj9o0NyAZtww7Lm4CfCxWPidNUpYLeMu6Sx5UhkNxCg24QQa67fD0uHkCEMHNTnFVZcOjBaa2cCpUBa9PoaEBFqfxPsW/Vf07Wth9USxbPqE0dTb/45+WUEE7s4KKB8aP3OTsrqTP+9NQk8lspmbrQc12JcEMy0s=
Authentication-Results: csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=none action=none header.from=synaptics.com;
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by BYAPR03MB3622.namprd03.prod.outlook.com (2603:10b6:a02:b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 09:28:10 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%8]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 09:28:10 +0000
Date: Wed, 14 Apr 2021 17:27:57 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] init: consolidate trap_init()
Message-ID: <20210414172757.3ebfaa4c@xhacker.debian>
In-Reply-To: <44bdf1f1-117d-0f10-fc59-9edd32d1ad61@csgroup.eu>
References: <20210414165808.458a3d11@xhacker.debian>
 <44bdf1f1-117d-0f10-fc59-9edd32d1ad61@csgroup.eu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BYAPR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::29) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 BYAPR07CA0088.namprd07.prod.outlook.com (2603:10b6:a03:12b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 09:28:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5120a7f7-5623-41c8-77de-08d8ff279e49
X-MS-TrafficTypeDiagnostic: BYAPR03MB3622:
X-Microsoft-Antispam-PRVS: <BYAPR03MB36222C312A140D3F2A33A054ED4E9@BYAPR03MB3622.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BBoyky1dSeFRX0Ag+4ecLhEn/iqymRc0DygmvkAJG3qhX3BIAN+gpVB9ehyrxpTj5MK7V2fqC98QUaAKJlZMdsPp97mbd333mEaHQ06xvJ69BvHY7r8u5+tXHNuaxLXanEpftcMrJpg3RyQzLUNUYkD/+cGEy2SooAnCRWom7NRVDIkROqXPpJ9HXVWls63l27z9Q0jSLyakwF0dlu5mapmrbbVXVznyMqcj8wBXjQ6N0l4dETrBMZRqv7d9qixkbaWGZENrVAeCEKyAE8sw51HK0gqK8jhTXqVPuBBMs7vGDEN4G6ATNEwie6nGfBVKpih5ws45GL/BMD7hLHTuMVtMSL2PRW7HEdZ/F1Z9WijnNxPK5/Y6C8oXlqf+6EIR2B94+Q1QGLy5ASTmYack67TxVQEHXBRuJFYTb9p8dhmzzf1ExxyjWZMAsSo6O3pwL8zLWuDxaKOoaGQLC32NjIri66ndEgthYqub92SYWIs2bW3F4oH0xyQ6fnTJOhifKyBbNsp3/bqwtJMe/gZL5LBwAHdzyijp630WfUnMYwNHrefGq3UcJSoNm5A7DTTW3O4XSljjLtkbwtNq8JEIUbeDCnRiGTKaP5mV+/MQ0si9L7/L4HO2NUACU0JIf3ZEj9OZcQmnkJB8ukE0ooeAwl/l+SUPH0nxtUc5DUN0EzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(136003)(39850400004)(396003)(55016002)(66476007)(316002)(66574015)(66946007)(186003)(66556008)(2906002)(9686003)(4326008)(7416002)(16526019)(6506007)(26005)(478600001)(52116002)(38350700002)(5660300002)(8936002)(1076003)(38100700002)(7696005)(6666004)(8676002)(7406005)(83380400001)(54906003)(956004)(86362001)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MjY4SzdaNDlMNVhRcjBnY2hJcHJrazRPY0tkN1Z6ckd4YUZYa2sxekI4YXRC?=
 =?utf-8?B?U01vdzYydTljc0tMenhnaHRpV28zZWhCcm5hWGZBNzkyV0UxZGh6ZE5QYVlv?=
 =?utf-8?B?ZDljb0xYb1VtaDRqNjg4eFhCVWNsODV4NzBPNHdYOURNTnEyWTFHN0FJejJq?=
 =?utf-8?B?RWRnSHZ4MFU2c2RMWExMWktqN1ZFbTVSZDY5NjluZHhxN3RuUlozVlprT3My?=
 =?utf-8?B?Vkp5UnNMZjc1U29SZ3MycC80VkhOT2d0OU5WMUg2N0NCajFqQUlwcTd0MXY1?=
 =?utf-8?B?djhvQWxJdUtpMWhxRURYSkZtNEs1a2F0MFVCK0RZVUJSL09FSmk3d0dyQUVr?=
 =?utf-8?B?STNEZTBGcWxyOC9wMU4yWDUyVEZTRldRVm5BcXZPdkY1QnQvRG9qWlNkQlls?=
 =?utf-8?B?OURyUkVueUNVSXhkcFFCWHJ1Z2FyaU5Xa0lNQWV5MXo4LzMvQVNVZ2JUQXY2?=
 =?utf-8?B?SnAvWU13Uk8yZ1RBUzBaUDNvY04yN0wwTDkydE01R2FWcjAzTHRSU3FrSm5T?=
 =?utf-8?B?ZWVsWGUxc2tZNU5jOUsrSmxGS1BqbkFVczM4Tnh6cStRS0xkZGpDQ013OGg3?=
 =?utf-8?B?NU9jcENFVmowV2REZGEzckgrbm1aNWxHVFhMSXB5aGhFcEdTdEFoN2U4Sk1y?=
 =?utf-8?B?ZUxjYWYxSnAvY05qa1JDanRweUdQUWRNb2MwQms5OXRQNGNoUTV1RkdVZlg5?=
 =?utf-8?B?ajJ6bC90b0ZSSnNVVGRlSk53aHNVQXpBNGc0ekhrTVY0K1ZKOFVPc3lyRndV?=
 =?utf-8?B?Z3RTNXlRMk8zT2g2ejZxZldobk5wRWxUMno3WWp0MkQyUzZ2UWswOHl4dVNE?=
 =?utf-8?B?bHJBSTBoYnlQa3VIVWsxVDhndVhxaGtzV1p5UTRsTTV3Z1IveUpiaDR5ak9a?=
 =?utf-8?B?RlJWbFk0R1RPMmFnNFNpTzV5T2ZnYktLUU5wdklQRVNkQXNHUHdJV0NubUFx?=
 =?utf-8?B?NlhTZzljVVljNTRwTkdaOE9EQjVVMEFIMDlWSGQrNzRudk5IR0kxQmF1ZDB1?=
 =?utf-8?B?L0NKS1BONzh4VW5USUlyZWU3WWtObEJXdzE0MGczTzlPcVBzc0FuNTMra21h?=
 =?utf-8?B?cDRtUFlVNDRIUkRXelloVWc5NEJiK1pZa0F4MFVqWU9KUGhwVlNXQk1hL2E1?=
 =?utf-8?B?TUtjS0krSEM4cHA1NjB3QVpxcUZMbC9CZjVQZVJockx1dXBZOUNDbkJ6UnAz?=
 =?utf-8?B?SUlJWTI0L3ZZVFlGZHZlT05HbTEwQk5PdnRuYktiMTQ2SEV0d2d4NkdWMjBL?=
 =?utf-8?B?TS9oTm9mMFVPMnZObUI1dVRWV3IwdCtZR1JQVzd4UWhINFFubjFtY2FVQXds?=
 =?utf-8?B?VUNBeFlIbzNudHM4VStoaHJ1OFB5enV1TEsvU250Z1hHRnF4UDNoUUI0Z1U2?=
 =?utf-8?B?UGZBb2xOVytveDNTc3d3bnN3OFNQOTd2UDJlNW5oRjlrUEc2OWtvbzF3TENz?=
 =?utf-8?B?R3poSllndHRESEI1N2F6NWNNK0NsdzFHZzFxNGV0ZGtUbmR2azBnYXd5Q1NB?=
 =?utf-8?B?K2p2Y2F0TEwyd1RnZDh3OEZsNHVOOWxJMWVENzdUV0xGRmZRd0tPRk9udUht?=
 =?utf-8?B?STd0VzBaQWdVREtDVUJLL09pMmp4TzM4TUhiU21TV09hWmJOUEJIK2dxM0xV?=
 =?utf-8?B?YmZnRTJlNDBSWjlFc2pVTHUycGl1NDNQVmJRY0FZQTY5Szl2TWJ6bHREaktK?=
 =?utf-8?B?Q3FxQUVWVjZoQWRKb0x6d2pSdnRJUVZCc0ZhTjhlWU90ck51VkRCeWgwdXFi?=
 =?utf-8?Q?D3GmPb0EMi3pdCwfFb4tp/A+lzyS75V5Z67/b0v?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5120a7f7-5623-41c8-77de-08d8ff279e49
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 09:28:09.9985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbSQwoe9+sk+OIeMD2fVJIdjwRYcFjMH/krNmyYNJFJsAtaRccxFVAkceNwNekPD/uStkHEqycl7udIev9Ns4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3622
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
Cc: Anup Patel <anup@brainfault.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Brian Cain <bcain@codeaurora.org>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 linux-parisc@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Albert Ou <aou@eecs.berkeley.edu>,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Apr 2021 11:10:42 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

>=20
> Le 14/04/2021 =C3=A0 10:58, Jisheng Zhang a =C3=A9crit :
> > Many architectures implement the trap_init() as NOP, since there is
> > no such default for trap_init(), this empty stub is duplicated among
> > these architectures. Provide a generic but weak NOP implementation
> > to drop the empty stubs of trap_init() in these architectures. =20
>=20
> You define the weak function in the __init section.
>=20
> Most but not all architectures had it in __init section.
>=20
> And the remaining ones may not be defined in __init section. For instance=
 look at the one in alpha
> architecture.
>=20
> Have you checked that it is not a problem ? It would be good to say somet=
hing about it in the commit
> description.

For those non-nop platforms, I can only test x86/arm64/, but both has
__init mark. I'm not sure whether this is a problem for alpha etc. Maybe
I can check which section the trap_init() sits. Or to avoid any possible
regression, I can add __init mark to those remaining ones without it in
preparation patches.

>=20
>=20
> >
> > Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> > ---
> >   arch/arc/kernel/traps.c      |  5 -----
> >   arch/arm/kernel/traps.c      |  5 -----
> >   arch/h8300/kernel/traps.c    | 13 -------------
> >   arch/hexagon/kernel/traps.c  |  4 ----
> >   arch/nds32/kernel/traps.c    |  5 -----
> >   arch/nios2/kernel/traps.c    |  5 -----
> >   arch/openrisc/kernel/traps.c |  5 -----
> >   arch/parisc/kernel/traps.c   |  4 ----
> >   arch/powerpc/kernel/traps.c  |  5 -----
> >   arch/riscv/kernel/traps.c    |  5 -----
> >   arch/um/kernel/trap.c        |  4 ----
> >   init/main.c                  |  2 ++
> >   12 files changed, 2 insertions(+), 60 deletions(-)
> >
> > diff --git a/init/main.c b/init/main.c
> > index 53b278845b88..4bdbe2928530 100644
> > --- a/init/main.c
> > +++ b/init/main.c
> > @@ -790,6 +790,8 @@ static inline void initcall_debug_enable(void)
> >   }
> >   #endif
> >
> > +void __init __weak trap_init(void) { }
> > + =20
>=20
> I think in a C file we don't try to save space as much as in a header fil=
e.
>=20

This is to follow most weak NOP implementations in init/main.c to make
the style unified in the same file. I'm not sure which is better.

> I would prefer something like:
>=20
>=20
> void __init __weak trap_init(void)
> {
> }
>=20
>=20
> >   /* Report memory auto-initialization states for this boot. */
> >   static void __init report_meminit(void)
> >   {
> > =20

