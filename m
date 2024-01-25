Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFD283B8F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 06:13:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=TnCEtYXj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TL8BC1ps0z3cCM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 16:13:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=TnCEtYXj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:2c12::801; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=mhklinux@outlook.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn20801.outbound.protection.outlook.com [IPv6:2a01:111:f403:2c12::801])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TL89J6yMtz30NY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 16:13:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dd777VtAPtOmKebxxwyRYH09k8ojvygXBj/mJFZPlQapgnPzhK5No+H/gsps31dHOVyh0RRhCjiAxDV23DwegYanK/XVg2x9SB+V3KM8e6VDOnl622GiBa4qnjYSM28RbBIukkwDdpJ6wkUL4hVghxoZfxd5M4m7X5g6rtnv/Nw6/Cq2gYr+hC95Mc2TKWOzZStWn9D520Qc18sjpP+Li1nBx/VUvh8uJun7O2JuaL+dcfWLp1glYVLO9YR4iHYUQTUvwuBTUTxkGdaa5+5uEvlrEx+mGZAsW9xOh8TsTwMWm4Ut1SOXzh7prBwI/IZ4ekvSEfXmuJ2npMGUhx8uYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piEt+f2hjxMsWO9R+JZwe8J+xCJs/pLyITSwv0ELKus=;
 b=IKTP2fpLC7Cccw3t0NUVGrwSZ0/5EkBt0az/DpEhEOC/mMEAB5IAb/Ed5pW6tvRl4p4L1M8MQujeXBMNSz0HGi/xeRMj3i4GRmcB0aUmkXiA5NaJ3nkO70BmZ6ipkystSMY6rYtoImkRSSYsHbBshJJSYtLkq1l/o/SndKHCcbqP9h/1fm+owYj08F3/eTUQ5oDvDq3f3+dk/aRr90il0LzEqZqNDxsi4xdfeyRcbcQqpjDd+7R39dmrA4x9ciry8ZScugUORSIt4iOOmJ0SJpR5F/MtIWzA/t61BYg8XT06UmN18kSC6xojyadygfTN2MBhT/9ClVEn/VnZs9tV2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piEt+f2hjxMsWO9R+JZwe8J+xCJs/pLyITSwv0ELKus=;
 b=TnCEtYXjB13OJTB4ZpBjRKfXMIjSPk86SoPKDEzBUN+vwnBfjXGU3QndjWM5EavUPRKdxUyM6C+HugyqNC1Onje/L5OZWZ72qMAUQJk4B4gvOO2f/YwJsIhaYGAx8tKWdHyFOf5d68imBwFdobKbCER3Zu37IqkClahIsgFA1oT3H2M0YnCGFkLd/PwhsmcqDm2KgzTiY22pdkMLTzdN48P3lvVWrumSSMUEwOYBql9gvzXyNv7XFrjTbdDrEyZccV+HiEXWBF0g+TR32NCoSDVYIlkehyPOChMCLEvZ6T1vvrd8TpOQzCY20Arem+rL29qbDuxEOtUarddL3E2e3A==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SJ0PR02MB8765.namprd02.prod.outlook.com (2603:10b6:a03:3dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 05:12:45 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd%5]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 05:12:45 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Baoquan He <bhe@redhat.com>
Subject: RE: [PATCH linux-next v3 06/14] x86, crash: wrap crash dumping code
 into crash related ifdefs
Thread-Topic: [PATCH linux-next v3 06/14] x86, crash: wrap crash dumping code
 into crash related ifdefs
Thread-Index: AQHaToRG7EZBXaVit0yb4RXbyvoNjrDpkK1ggABa6ACAAA/3oA==
Date: Thu, 25 Jan 2024 05:12:45 +0000
Message-ID:  <SN6PR02MB4157E138C7EE4A281AB49C10D47A2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-7-bhe@redhat.com>
 <SN6PR02MB4157931105FA68D72E3D3DB8D47B2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <ZbHfACpwqi2U9vmK@MiWiFi-R3L-srv>
In-Reply-To: <ZbHfACpwqi2U9vmK@MiWiFi-R3L-srv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [NISCNTVr9jvOnz7R+68sGNU/5qSOTo7d]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SJ0PR02MB8765:EE_
x-ms-office365-filtering-correlation-id: 86f5c899-3c6c-4d09-678b-08dc1d6443e4
x-ms-exchange-slblob-mailprops:  WaIXnCbdHrOwhXVdeGZL77uy/MCF2FXuH2O8XtKFoSBIWHiMUCm9GLLfTibU/DWp6D1JtO0RmblZV74wuiys1tuj463WIjqYkbbhbkZOdd6Gs6NRZWUi5kp1ImJ2mGTQzQEESoaw3Qz8Ie13a+gwvmKP6J/UVl9rIc6s55TNG/P0qVOvuobRL/ebdSF9Vt3aCfTPwv9gpkkHNUmdPKvR9sV9luuAPnXhPnFw+E3nLnIFSh4mL4zSKJZutPKavF88xvCxXRP2DpUfITULGmIcjmDQ7TVqn+GkCIcz3kO6KpPuE+V9+2r1w0K8dJfeuNr5Y4PX6KqYNTUglbmqsgUbgcuiidS6Fn1D3mro4o8J3Hz3bof/q8eZTFPSMNkpODastcr4fcfKufAUAJGD5ay19J8/3SVMvetdGMOZOitS4CGOy8WmN26uzL+Q/m7XTofJO7hZYl0Zz/o68gBkfpgfkSDMzcvKaWQTx/F/Vauo7GCk0D+OYCXZqpvrpqFJw+6s4szuANQ884hokmVXh6iofU7UyTFi5Gu5PVe7qpPQ9GzbrUe/p/hm8coza3W56I/JoPZASjSynt9jMIr5TiRn26UYfWszdnbUoHLCMzn1z3Honp4ynFvDFfN+JJA4AdKDwHwEQ59hFF/NM3J3uJ/Na6/bhsEOYXsf/fry4l1LAI7N5+izLTrlUUgRbgtrsjZjCsoe/GiYluHl376EOhckta31F1BYdMB8gVy91USaQ4L1Icsg/enZcW3onG39hzvc3aTDyyzhm2U=
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  alY3iC2hQhYnRfo9NbxslDGFp5e7TNjV5xVjVeWzfZcp2aUgIVdBRgGaSd+Xmt64+ZDhMhlH7ho89cwUwvVR+NZXF1wY97YQZ8x189d0DPEi3qhzVaXtHIOMXS4b61U1YaJ97VphCen6UGOZfQWDOnZ1xnGA0bcgeewrxdfh1ZiQa1rPQXui+Nh+DIu7Vl3AhutImSgr4NTb7Y1WjEPMVP1w5T4GoP/bhAgT19gSASVv2SmQbXXsCtJ+0KNY5CGtgwUmQb7ZYlnjH7G1Fe5/yPrkavBKwj//pwNec8cjAtcv1iFbbFvpc9HQ8IpyW6QrXhigdeKfytgQELnOCaHgsqsmpFtfHsgNzQ1RZ+bC02cjaLv3qZ7eiJznHfPUCUjTlCjUj+snSmYL0J7JOdx5WqEekQyTQvzMf58GYHbAAGbQ71EP6FO4z9hK8kJcoVuZlv/8O/iiRVVQOK5UokdUyg8EIN9ht99bgt7gAgoLwp4HKf/DPpKtc33fpa1MwKsOuokvkiR9gJjnf8ndRfCPENQH+GLtLxpxz0vIZQ9fI07r6irFMCV3SdfI2604HUzW
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?pKQibq74HeDVDTsxKq/hwFYAfYro3gf5RZHFnGtMhBXhV1XGZkdqx5tHt8zF?=
 =?us-ascii?Q?H4kKli5yri/A6qH27LCxeeuvl3MKXgCJSqv+7Zrg3SMLQ/8GfOwQa9OfsGVU?=
 =?us-ascii?Q?g/roiC9AbL5+sdlDi8uuLqbNVZbqXOTCensjiWhzz5mnWTp8acgIH0MRa5sS?=
 =?us-ascii?Q?zGDoVRFTkMEJrGkMSu67m7VcmYkToR4WnN3sczC/q+vvmmejJFd9zaNUxrq1?=
 =?us-ascii?Q?lFaC/UcNpjTS/+udX0N7e2pvtK3tvr9FziqO+6HY4duhkbcjb+zMeo4TEhXj?=
 =?us-ascii?Q?L1v8mZWAKkfNFYgybdWMagCKykV658V35nOsZ1HYdv0iNmhm8QUqlqy5VUU7?=
 =?us-ascii?Q?bFTyttXdkgWxW6pBZdInrVU0604gXeiPVX8GbDVl6TVvFTS2Ly+xKv1T4hUN?=
 =?us-ascii?Q?IthKL9tP5vCwzfAIuEDDIht2EGIrAvKr1hbPv+SkeOCHBGttODdrA1R5bQUj?=
 =?us-ascii?Q?ytiMpSE7K3dECWVRE1Spb/lZguZqC8GQD4tSx/WL6RukTWd73lK7BQE9l4PB?=
 =?us-ascii?Q?NhRGmlOFBvg4SQtJmF2vwY1mDsSH1sg+/gRbI18rsSOEy4b9nXrVkkvblGoB?=
 =?us-ascii?Q?epQE0MKvprGZB5QwYW8RaWQgaQqAVXiZxRf3TvcbhW0dL8IfyjVVYKk2uYey?=
 =?us-ascii?Q?YyE583dBxkYJrya/6dGKJjrkPifm/2/gqE+ei0+jSDrs52lLsF85ULWH4HFo?=
 =?us-ascii?Q?5vbWU6tb1a+aOJFktUYTdYnSHCPOOurkXyXvDu3APDm6xx3gldz6XlN6Icr2?=
 =?us-ascii?Q?9KrGUjfZJfXXsg8/HArbg2uhuuMss3CZVZGURXpmQcuTY4BWSEts9o+VJXFr?=
 =?us-ascii?Q?RJnTVmPSR/ZRt4Zms2jFKTeuDK/wkYoH28Wr+fz5mIXg6FsrANUEzaS5uX73?=
 =?us-ascii?Q?5X8CAUaxAyhd1mEuFKloOp0XEwuNELEYHNWk/oc9W7f0OP3bIcvBXpalMMYK?=
 =?us-ascii?Q?rbN0WRewERHmTbjWZ7nWP98BzdWtnrurhBYN2UNS4tULxMZOXrghAhu+yIsI?=
 =?us-ascii?Q?G8l7vHcK9Y7MKjg13DyLVK+fXiTbKF5WVBeI1e0ZMwMJFmqCV3fQCfBtllkI?=
 =?us-ascii?Q?peCADJtp3S+0OdUjYXdXzEshFEX9QAMs9kYMLRSSIB32fEY+2lkhg+NY+7Na?=
 =?us-ascii?Q?w49pQ2XxBs56DFHwHJD3tdJky/tiJ0ZiCNMDs+MkyHnsWII8wp+A5KqbcqwI?=
 =?us-ascii?Q?wr2fLdQ31HbjhFGfJcBGGiEF1zqeY/nx0cyHZw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f5c899-3c6c-4d09-678b-08dc1d6443e4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 05:12:45.2178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8765
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "piliu@redhat.com" <piliu@redhat.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Baoquan He <bhe@redhat.com> Sent: Wednesday, January 24, 2024 8:10 PM
>=20
> On 01/24/24 at 11:02pm, Michael Kelley wrote:
> > > diff --git a/arch/x86/kernel/cpu/mshyperv.c
> > > b/arch/x86/kernel/cpu/mshyperv.c
> > > index 01fa06dd06b6..f8163a59026b 100644
> > > --- a/arch/x86/kernel/cpu/mshyperv.c
> > > +++ b/arch/x86/kernel/cpu/mshyperv.c
> > > @@ -210,6 +210,7 @@ static void hv_machine_shutdown(void)
> > >  		hyperv_cleanup();
> > >  }
> > >
> > > +#ifdef CONFIG_CRASH_DUMP
> > >  static void hv_machine_crash_shutdown(struct pt_regs *regs)
> > >  {
> > >  	if (hv_crash_handler)
> > > @@ -221,6 +222,7 @@ static void hv_machine_crash_shutdown(struct pt_r=
egs *regs)
> > >  	/* Disable the hypercall page when there is only 1 active CPU. */
> > >  	hyperv_cleanup();
> > >  }
> > > +#endif
> > >  #endif /* CONFIG_KEXEC_CORE */
> >
> > Note that the #ifdef CONFIG_CRASH_DUMP is nested inside
> > #ifdef CONFIG_KEXEC_CODE here, and in the other Hyper-V code
> > just below.   It's also nested in xen_hvm_guest_init() at the bottom
> > of this patch.  But the KVM case of setting crash_shutdown is
> > not nested -- you changed #ifdef CONFIG_KEXEC_CORE to #ifdef
> > CONFIG_CRASH_DUMP.
> >
> > I think both approaches work because CONFIG_CRASH_DUMP implies
> > CONFIG_KEXEC_CORE, but I wonder if it would be better to *not* nest
> > in all cases.  I'd like to see the cases be consistent so in the future
> > someone doesn't wonder why there's a difference (unless there's
> > a reason for the difference that I missed).
>=20
> I agree with you, it's a great suggestion. Thanks.
>=20
> Do you think below draft patch includes all changes you are concerned
> about?

Yes, these changes look good as a delta to your original patch.

But also look at xen_hvm_guest_init().  It looks like your original patch
does nesting there as well, and it could probably be "un-nested".

Michael

>=20
> diff --git a/arch/x86/kernel/cpu/mshyperv.c
> b/arch/x86/kernel/cpu/mshyperv.c
> index f8163a59026b..2e8cd5a4ae85 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -209,6 +209,7 @@ static void hv_machine_shutdown(void)
>  	if (kexec_in_progress)
>  		hyperv_cleanup();
>  }
> +#endif /* CONFIG_KEXEC_CORE */
>=20
>  #ifdef CONFIG_CRASH_DUMP
>  static void hv_machine_crash_shutdown(struct pt_regs *regs)
> @@ -222,8 +223,7 @@ static void hv_machine_crash_shutdown(struct
> pt_regs *regs)
>  	/* Disable the hypercall page when there is only 1 active CPU. */
>  	hyperv_cleanup();
>  }
> -#endif
> -#endif /* CONFIG_KEXEC_CORE */
> +#endif /* CONFIG_CRASH_DUMP */
>  #endif /* CONFIG_HYPERV */
>=20
>  static uint32_t  __init ms_hyperv_platform(void)
> @@ -497,9 +497,11 @@ static void __init ms_hyperv_init_platform(void)
>  	no_timer_check =3D 1;
>  #endif
>=20
> -#if IS_ENABLED(CONFIG_HYPERV) && defined(CONFIG_KEXEC_CORE)
> +#if IS_ENABLED(CONFIG_HYPERV)
> +#if defined(CONFIG_KEXEC_CORE)
>  	machine_ops.shutdown =3D hv_machine_shutdown;
> -#ifdef CONFIG_CRASH_DUMP
> +#endif
> +#if defined(CONFIG_CRASH_DUMP)
>  	machine_ops.crash_shutdown =3D hv_machine_crash_shutdown;
>  #endif
>  #endif
> diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
> index 1287b0d5962f..f3130f762784 100644
> --- a/arch/x86/kernel/reboot.c
> +++ b/arch/x86/kernel/reboot.c
> @@ -826,7 +826,7 @@ void machine_halt(void)
>  	machine_ops.halt();
>  }
>=20
> -#ifdef CONFIG_KEXEC_CORE
> +#ifdef CONFIG_CRASH_DUMP
>  void machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	machine_ops.crash_shutdown(regs);

