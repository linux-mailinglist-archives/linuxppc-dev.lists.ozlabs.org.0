Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A14DAA1F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 12:35:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46v5Cn1kmlzDrCX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 21:35:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=msn.com
 (client-ip=40.92.254.52; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=adamliyi@msn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=msn.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=msn.com header.i=@msn.com header.b="AOwmIGXJ"; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254052.outbound.protection.outlook.com [40.92.254.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46v59f5WdBzDr81
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 21:33:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqRks2e5tp1YhSI0Ae0A6jOaQ1PmTewfvqkuJwG0bbRNZv3u8LCLa4sGKoVaapwkCwdNoqYDExhoEqsXVesaL2xM6o91KyO0+69kGeePiwQIvbO181hVwgeTqFOBQs0/29exB/i3KZkM82FaZy1Zqn3dvPv/25BihJ7+uax1LGlvfbruufbiBD23RLeLeKlMQ0VnHr2K8KoQkcjtNYo4e6/lJ+9fs7BFA+V1JAxMxrKh4tBAKmW4W2iqZbEn4qGrwc97++Jt+x026zr4x0DTGGele9iYmcdaDXNbYg1XI/c7Ogqod+bv2+TcBoV2OzzpKJkt9EC1uKBxyyGaR3poaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Al3uacAobC80mS/IU1sWFNbyj+COLh8x74TuI1/XwUA=;
 b=kTYQKMzl1w5+7duHHpynyxQ5j88uM4N+TxIxIqjJpq+pu2CZS1kVAO0o7rM0XLQDP6stlPbWKtmlAgcgBLRH/tZbKVeQkJbN8V23psX7paYODz2YiAafke/1dHdZSRIbVi9vu0M4Ye/7ww4Qm+z5tq/q4oDLP6xrzzeocwuGZDNGf983c0Koz5vdjQpNFNYDBXnVmdsxNMyn5DwmlsoI0YDk9Lai7Op3hpw2lYWbyJrqN58kK4CDA4Q39jrzVx1SCurmG6O6QHllGPUNME+hNn8cn2JdZBCmMwsgwkp/zAq4tOCVXEjEgknOcYQUVcp9vw7gAiP6JON8MZRJXf25jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=msn.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Al3uacAobC80mS/IU1sWFNbyj+COLh8x74TuI1/XwUA=;
 b=AOwmIGXJUWU+suO1ci+9XmWnB7WDCcNppGkxW8Kq3G7XbbHQlpWOxI9HCT9MDuUtE/FBrP4CYIk+Uc7pCPxlEX/eHct1P23rtaM3NUD9GXFQXrJHii0144baG2x0Xdv58s46MzKu1Xh/P6ZuwGwzTiicUKx5tV1HrgM2qgkojJxkwjL8pLUXqsa74UM58YShCSrn0fK6kDsogcWKLIwXhe5y5UhJvEZneuh21RCaYBfV7wh8Bq1HmVT/uuKY785p3JX24Cqs7HQI8p4ClwrLgZ9d9sS/wEBV0yOB5ZPWQ5ZhRye9AJ3gewTq9OIvPujpzROwSF1GDDdr6xrvLyxU/A==
Received: from PU1APC01FT018.eop-APC01.prod.protection.outlook.com
 (10.152.252.59) by PU1APC01HT085.eop-APC01.prod.protection.outlook.com
 (10.152.253.150) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.14; Thu, 17 Oct
 2019 10:33:35 +0000
Received: from HK0PR02MB3283.apcprd02.prod.outlook.com (10.152.252.60) by
 PU1APC01FT018.mail.protection.outlook.com (10.152.253.189) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 10:33:35 +0000
Received: from HK0PR02MB3283.apcprd02.prod.outlook.com
 ([fe80::31c7:818c:74cc:d7c0]) by HK0PR02MB3283.apcprd02.prod.outlook.com
 ([fe80::31c7:818c:74cc:d7c0%6]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 10:33:35 +0000
From: Yi Li <adamliyi@msn.com>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: system call hook triggers kernel panic
Thread-Topic: system call hook triggers kernel panic
Thread-Index: AQHVhI0S2xqYBin3+EmsoDD9WJ6P86dePduAgABlsgA=
Date: Thu, 17 Oct 2019 10:33:35 +0000
Message-ID: <9CF3614E-64FC-4673-845A-3F98FA564B56@msn.com>
References: <HK0PR02MB3283E73F2AA72D7EFA4350A3D96D0@HK0PR02MB3283.apcprd02.prod.outlook.com>
 <CAOSf1CF21ScwyJzHP+6t=Ev_ED4kW+M0f43VuhJmFucwXrtpQQ@mail.gmail.com>
In-Reply-To: <CAOSf1CF21ScwyJzHP+6t=Ev_ED4kW+M0f43VuhJmFucwXrtpQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:4A4DAE54EEEDE56866FDD331DD0891D2A348D8BE6F70B2850F33E5A7C1FFDD8B;
 UpperCasedChecksum:DF67AE876366EBFA20C5805D9C6FFDA9CA608FDCDC0ECD80A2C328DE37313A60;
 SizeAsReceived:6914; Count:45
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [yYtBxuknmt4VWesOy8j4rt8iDEAq0mT/]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: PU1APC01HT085:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lMLe1PALxrxboHdtp9wHcXewlDvNyNWiX0U8VQBatE5WFPaKo4Hu7OLz+FCbubUv1biEBcJZrIjaOHbcr9U+sEUcAUvDmBY1AXNBt/h7p6d1nxNpKB1tzaXFk0ou4jFF1uaofWqAOQ1BuQkpWONjyrFGbrk+Raq2nXyj9y7LtDiio4sfNhrvtBGi+9CPGmu0
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <831A8F96EAC86743B2E8186409DFA6F4@apcprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b96a3d6f-b103-43c6-b71d-08d752ed76f2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 10:33:35.1900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT085
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Oct 17, 2019, at 12:29 PM, Oliver O'Halloran <oohall@gmail.com> wrote:
>=20
>=20
> The ABI (v1 and v2) uses r2 as a pointer to the "table of contents"
> which is used to look up the addresses of global symbols. TOCs are
> specific to the current unit of execution and the vmlinux and each
> module has its own TOC. From the dump it looks like the r2 is pointing
> into the vmalloc area where modules are loaded so odds are the crash
> is because the TOC isn't being restored when we return from the
> patched function. One of the many reasons why you really shouldn't
> hook the syscall table ;)
>=20
> The vmlinux's TOC is saved somewhere in the PACA (legacy ppc specific
> per-cpu thing) so you could restore it with some inline asm before
> returning from your hook. Have a look at what we to load r2 in the
> system call entry path.
>=20

Thanks for the insight!
I tried to restore 'r2' before return from the system call, there is no ker=
nel panic:

"
static asmlinkage long umount_hook(char __user *name, int flags)
{
        char *dir_name;
        long ret;

        dir_name =3D strndup_user(name, 512);
        printk(KERN_NOTICE "umount %s 0x%x\n", dir_name, flags);
        kfree(dir_name);

        ret =3D orig_umount(name, flags);

        printk("umount2 returned %ld\n", ret);

        // PACATOC offsetof(struct paca_struct, kernel_toc)
        // asm volatile("ld 2,PACATOC(13)");
        asm volatile("ld 2, 16(13)");

        return ret;
}
"=
