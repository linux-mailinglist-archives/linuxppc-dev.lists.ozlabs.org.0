Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E2F6E16A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 23:45:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyCmf394Dz3fWn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 07:45:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=wf4Mrfej;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bp.renesas.com (client-ip=2a01:111:f403:700c::711; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=biju.das.jz@bp.renesas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=wf4Mrfej;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20711.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pxz5v08ryz3chy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 22:14:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pvxxk7CiqWmd4PqPi9SDqKBNIT69CPB+1g1mDRr4QDyCKlq7OWqhRWC3ulvGYGZLPHOAB7k2vl4QRKxLZDNx4wEYTx8B4SFxGRWibF9vCSi0qBM3xd33yc7J7tzney/W3yKfEQse0rqXme07joMlJ9H3779r5jBlemJkhQsrtryGUAeVitxIbHPZFL7h3qlBdHAjC0GswRKiaevPJ3tgBWerKV1yfA2MO/xAm+BSVnm+WqNW3UxEZ8D5PsewA25mu41pyR0HsZ8feY3F5qytvWFdTN0fcHH4fkDkWye+yMVYylf6qhifk0D6vCD9CCQZM0CfH171vSdRhFmBDZ/MlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ip5s/IgwZmsVWOTUTqLzT0Zyilev+U+cK2QX6cUwfg=;
 b=HVzUv3rT9kR2mQLJGLT46ir1wkgCqcHSjEp/2UaASLi4oeVe8DasVQpF2CYfnwzmGjo4nS7a5JMPc9/fFUo9rO+Wi0CbLkkJtIajtQa3KhR2iYqvxJOYO7/C00kEvmpmrpAfrt5yjvdfLXhIasdj5Tg+ar9fgLN9JYg6NaExlOYLu7q9ICPwGqnolXlXDD2wDLTMPjTEbzYpW18sgyyCaucjd6gnae7ibkJ6msZ49q2k3xZIBeEDrELWbeRA4Sh+fpuhc9fEcL8U1uh9frLRS0lbrzlfwJXVqlhQYVu7uEHyxv8hqhevwe7wQCgU0seouNJuXgJmypEp3cOY/wl8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ip5s/IgwZmsVWOTUTqLzT0Zyilev+U+cK2QX6cUwfg=;
 b=wf4MrfejHIlwPpeKvFa1R+XO7wp4gAKStuaKOlRB2bokTcsDw++GA5mrEthpOHt+T3jcrKOW6EJAjdONtnHyhCQEp6o3sMw5ewyLeH7H+NhlI30ka8gqgsIxjxY9hOK8KZkTNhdD4LEwkAIljZSi2/RU9m9ACshB1wSufW6sExA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8291.jpnprd01.prod.outlook.com (2603:1096:604:18f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Thu, 13 Apr
 2023 12:14:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%5]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 12:14:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Arnd Bergmann <arnd@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 21/21] dma-mapping: replace custom code with generic
 implementation
Thread-Topic: [PATCH 21/21] dma-mapping: replace custom code with generic
 implementation
Thread-Index: AQHZYKb5U8i/u0u1SEW/mclXwEZl+q8pQR+Q
Date: Thu, 13 Apr 2023 12:13:59 +0000
Message-ID:  <OS0PR01MB5922EDAFCD6DA0313DB99C5E86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-22-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-22-arnd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8291:EE_
x-ms-office365-filtering-correlation-id: 37646254-6d13-4160-8b14-08db3c18902b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MJSt48yxqD1R9rIQkfFNzI5mG4yjY712K8Sb17m5lJ0+oObiU7cOM6TB9L9rn0uWiAM1Af2BxXVRll2oOtJduEMicjhaswgrW6r8+YOOC+8SqsZu/sJcjX8hgTeLpXYR8W6Bq+lB+Uv2852bkc/dB3vSBIjE4kbeKKrQD8hGv7Y5uVm9rRoxhOmVbqSfvUPG3CmTvflIIixqoERAlKgansSrnNnZ+zzc8alczlGuvm9XDm9yuJi5WwbKA09CUlqaOJJDIm1ufHAcuup0Kg1UXGadNCtACtZELA/FuF0WBkqSWq2U/DuxfK5PickHqQc3trnQUTzJavWlCtSed0xbH/9Pnspflwtq1P3Zma7FvQYkdeXmeOhO64O7WQh2nuXZSkqEClHExMODmHJnz5/iKeytowU+XqXwMs1DWgBPryIfwHjO7bvtrgTBuC52lFfsNGO7b+bQhG8PbWU9LYmeQiOXGig+OMPQMrgQX3Bji7Xv76jhmOqgbs1wb7IVdXUt3USycoKKHZkIAAGjLXcEKf/jD1Xrf/LtCa3CjLsmdMjPNOw60lQCgNvhWxYb/hhrgSOYa4a8r99y7kGpYV6e3AsiB0CISaTi03JRVezWc0Sphc3sqi6BxaYzCkMmpKKt
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199021)(54906003)(110136005)(83380400001)(45080400002)(71200400001)(9686003)(7696005)(55016003)(478600001)(26005)(6506007)(966005)(66446008)(64756008)(4326008)(316002)(66556008)(76116006)(66476007)(66946007)(53546011)(186003)(52536014)(5660300002)(7406005)(7416002)(8676002)(8936002)(41300700001)(30864003)(38070700005)(2906002)(38100700002)(122000001)(33656002)(86362001)(41533002)(579004)(559001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?ooFbk/TzX+ytqL3WdoX08khwmQY+iKgSddpsAAKThO1yE5rvL6CMXx8lQsuD?=
 =?us-ascii?Q?zL3F0tfLfX2Kjf7MW/JR45S8Py6xmZkvMJJN7jbSvVYkIkYKy1DaT7sflvtA?=
 =?us-ascii?Q?lTi8nSKW4iTuDQauDKoDnn2CQwpZutxI4vZdqSAVhQnSbRE1dwL6dGA8afed?=
 =?us-ascii?Q?2gOB68uOGT7lWKse5t2PNqPUGR8iFpJG+ZHqQeZhUULYcgjHmXu73rybrj5g?=
 =?us-ascii?Q?wyV9JvsiGeMhKhyt1L6vjNEAUpKN3tAq5oagnnp5lcV355svzHTsfBsL9ECe?=
 =?us-ascii?Q?oOUhMiGblW6C8rnv9CMIwJD9YH9qVE1gFNStXUFq0kogT3POS1APPyVluFZR?=
 =?us-ascii?Q?U/dHz6eQ20cOdVD/a1idKIh8GxnnzxUi1RBxLHFudMWSDK0GKOa6O0nspNfY?=
 =?us-ascii?Q?foY4RyLgZVCQW9uIpKFIO8O/SC3Ux/KKU1Gw6v/oPK5CQnGZpQsSVBKYRGzk?=
 =?us-ascii?Q?Gn11iw/4IKI0XFKKRZ04T7uQ8IyiGb3wrIbPDsa+XoKDcr2a2yneg/IZs6BS?=
 =?us-ascii?Q?e0ugCtBdaqkt9tkQkjoq9sz9z7Y3egCQRx5G4EiDtrE0LvCGx3FXlCPyrvYt?=
 =?us-ascii?Q?Sly6gYYPR7hzDspbs2AmyWeTXGpzY0Cd+b7fPQeYyxTQ5ORzxSW0MylvxhkB?=
 =?us-ascii?Q?rdnvS/oHC0hi/NMBQIPONKBiygUr+jfpTavx4nVGsyg5vIc7qOxcMIFkE8w5?=
 =?us-ascii?Q?Ng+RqjauSbuRST4VMccPQzhsXyHNWadou3q88Vlnun7RcVd5frRkKYZHOsEA?=
 =?us-ascii?Q?PiZ3+KoQgKUqudyZLnBnyUxP8BS2B5psOVUYAhFw1z8G+NS5NpchozI6YwBG?=
 =?us-ascii?Q?tpvkfhUVL0+Bsm3PMODjlSnpPDgb6OJyrVEemCo0GN6gaQPrtThTdul74lrm?=
 =?us-ascii?Q?p5Hk+xYnSwvSL26xE2pMA3i4NHkkDDLraitiY9acKZwXFvvOae9m30tcs41O?=
 =?us-ascii?Q?CwFlDLGf0W269mOHtL+HE7LQcymh4kq6PQPf6yG+dOfH9ksFhmOalzJdwGS8?=
 =?us-ascii?Q?xbHWj5BVbRAtlU5lPxnA4qig4aGT6ZVtcazCnevgF0RPhLHF/ztze/FRevlT?=
 =?us-ascii?Q?AazPs8JQSACLgCC+66/Sc5w7mwU4sotiHWPtpvWmaqBB1rG6OZC3yZWggDJi?=
 =?us-ascii?Q?JKIQebZ70QgZZvqxZ0j4g+QuAxWMEUBdgi6VlyFlaM7CLrrUbbaOlEmYE4O7?=
 =?us-ascii?Q?+nvDGoOoCEhXp7UWr/yFHodb0tJiRVBHU4n7aewzzS50J4e13PL1+5UphTS4?=
 =?us-ascii?Q?+OEumT2uZEvovcrHjdPG3Ci2MOnhaFHgXnZ/EaQNtWIc0KDtsxApqMvewXYV?=
 =?us-ascii?Q?x5dlo7toqY/OgtQmUjdV6s+eW35DtyNIRf0T08W7M3bipvpuqojn1BoKfq+U?=
 =?us-ascii?Q?coVMoQRNpaqGzPN06j3tYQPw1FHvlXuuIYB3qmrh72PDKm3Di1PfSX1+5KGR?=
 =?us-ascii?Q?rPvr6BU4hK1ZL1OGR95VZAi/xXH5LOdoJBc2xqrHiXDM7Na4ckPisEB2ZYbe?=
 =?us-ascii?Q?rpbvJqnHnfAkiXoaTa4w7fuWsd5qWSNR9VZ0VywH3qotWcyH0KmXDuCpo6J/?=
 =?us-ascii?Q?2r0n9jHu6b2DzHrbn2+JbYrDXs31t1cHjQBDZCZA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37646254-6d13-4160-8b14-08db3c18902b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 12:13:59.8400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 02JfLQ7nLwBB87+4u5N2yeEwClK7VWdV0eIVUg2hBbOBDSXLDEUkVF/qXUO8OoDgGuIaeAzctqOfwFF9DsnX3DH+WR7mGGdZsiO3i0ADSQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8291
X-Mailman-Approved-At: Fri, 14 Apr 2023 07:43:48 +1000
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
Cc: Rich Felker <dalias@libc.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.c
 om>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

FYI, this patch breaks on RZ/G2L SMARC EVK board and Arnd will send V2 for =
fixing this issue.

[10:53] <biju> [    3.384408] Unable to handle kernel paging request at vir=
tual address 000000004afb0080
[10:53] <biju> [    3.392755] Mem abort info:
[10:53] <biju> [    3.395883]   ESR =3D 0x0000000096000144
[10:53] <biju> [    3.399957]   EC =3D 0x25: DABT (current EL), IL =3D 32 b=
its
[10:53] <biju> [    3.405674]   SET =3D 0, FnV =3D 0
[10:53] <biju> [    3.408978]   EA =3D 0, S1PTW =3D 0
[10:53] <biju> [    3.412442]   FSC =3D 0x04: level 0 translation fault
[10:53] <biju> [    3.417825] Data abort info:
[10:53] <biju> [    3.420959]   ISV =3D 0, ISS =3D 0x00000144
[10:53] <biju> [    3.425115]   CM =3D 1, WnR =3D 1
[10:53] <biju> [    3.428521] [000000004afb0080] user address but active_mm=
 is swapper
[10:53] <biju> [    3.435135] Internal error: Oops: 0000000096000144 [#1] P=
REEMPT SMP
[10:53] <biju> [    3.441501] Modules linked in:
[10:53] <biju> [    3.444644] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.3=
.0-rc6-next-20230412-g2936e9299572 #712
[10:53] <biju> [    3.453537] Hardware name: Renesas SMARC EVK based on r9a=
07g054l2 (DT)
[10:53] <biju> [    3.460130] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -D=
IT -SSBS BTYPE=3D--)
[10:53] <biju> [    3.467184] pc : dcache_clean_poc+0x20/0x38
[10:53] <biju> [    3.471488] lr : arch_sync_dma_for_device+0x1c/0x2c
[10:53] <biju> [    3.476463] sp : ffff80000a70b970
[10:53] <biju> [    3.479834] x29: ffff80000a70b970 x28: 0000000000000000 x=
27: ffff00000aef7c10
[10:53] <biju> [    3.487118] x26: ffff00000afb0080 x25: ffff00000b710000 x=
24: ffff00000b710a40
[10:53] <biju> [    3.494397] x23: 0000000000002000 x22: 0000000000000000 x=
21: 0000000000000002
[10:53] <biju> [    3.501670] x20: ffff00000aef7c10 x19: 000000004afb0080 x=
18: 0000000000000000
[10:53] <biju> [    3.508943] x17: 0000000000000100 x16: fffffc0001efc008 x=
15: 0000000000000000
[10:53] <biju> [    3.516216] x14: 0000000000000100 x13: 0000000000000068 x=
12: ffff00007fc0aa50
[10:54] <biju> [    3.523488] x11: ffff00007fc0a9c0 x10: 0000000000000000 x=
9 : ffff00000aef7f08
[10:54] <biju> [    3.530761] x8 : 0000000000000000 x7 : fffffc00002bec00 x=
6 : 0000000000000000
[10:54] <biju> [    3.538028] x5 : 0000000000000000 x4 : 0000000000000002 x=
3 : 000000000000003f
[10:54] <biju> [    3.545297] x2 : 0000000000000040 x1 : 000000004afb2080 x=
0 : 000000004afb0080
[10:54] <biju> [    3.552569] Call trace:
[10:54] <biju> [    3.555074]  dcache_clean_poc+0x20/0x38
[10:54] <biju> [    3.559014]  dma_map_page_attrs+0x1b4/0x248
[10:54] <biju> [    3.563289]  ravb_rx_ring_format_gbeth+0xd8/0x198
[10:54] <biju> [    3.568095]  ravb_ring_format+0x5c/0x108
[10:54] <biju> [    3.572108]  ravb_dmac_init_gbeth+0x30/0xe4
[10:54] <biju> [    3.576382]  ravb_dmac_init+0x80/0x104
[10:54] <biju> [    3.580222]  ravb_open+0x84/0x78c
[10:54] <biju> [    3.583626]  __dev_open+0xec/0x1d8
[10:54] <biju> [    3.587138]  __dev_change_flags+0x190/0x208
[10:54] <biju> [    3.591406]  dev_change_flags+0x24/0x6c
[10:54] <biju> [    3.595324]  ip_auto_config+0x248/0x10ac
[10:54] <biju> [    3.599345]  do_one_initcall+0x6c/0x1b0
[10:54] <biju> [    3.603268]  kernel_init_freeable+0x1c0/0x294


Cheers,
Biju

> -----Original Message-----
> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On
> Behalf Of Arnd Bergmann
> Sent: Monday, March 27, 2023 1:13 PM
> To: linux-kernel@vger.kernel.org
> Cc: Arnd Bergmann <arnd@arndb.de>; Vineet Gupta <vgupta@kernel.org>; Russ=
ell
> King <linux@armlinux.org.uk>; Neil Armstrong <neil.armstrong@linaro.org>;
> Linus Walleij <linus.walleij@linaro.org>; Catalin Marinas
> <catalin.marinas@arm.com>; Will Deacon <will@kernel.org>; Guo Ren
> <guoren@kernel.org>; Brian Cain <bcain@quicinc.com>; Geert Uytterhoeven
> <geert@linux-m68k.org>; Michal Simek <monstr@monstr.eu>; Thomas Bogendoer=
fer
> <tsbogend@alpha.franken.de>; Dinh Nguyen <dinguyen@kernel.org>; Stafford
> Horne <shorne@gmail.com>; Helge Deller <deller@gmx.de>; Michael Ellerman
> <mpe@ellerman.id.au>; Christophe Leroy <christophe.leroy@csgroup.eu>; Pau=
l
> Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt <palmer@dabbelt.com>;
> Rich Felker <dalias@libc.org>; John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de>; David S. Miller <davem@davemloft.net>; Ma=
x
> Filippov <jcmvbkbc@gmail.com>; Christoph Hellwig <hch@lst.de>; Robin Murp=
hy
> <robin.murphy@arm.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; Conor Dooley <conor.dooley@microchip.com>; linux-
> snps-arc@lists.infradead.org; linux-arm-kernel@lists.infradead.org; linux=
-
> oxnas@groups.io; linux-csky@vger.kernel.org; linux-hexagon@vger.kernel.or=
g;
> linux-m68k@lists.linux-m68k.org; linux-mips@vger.kernel.org; linux-
> openrisc@vger.kernel.org; linux-parisc@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; linux-riscv@lists.infradead.org; linux-
> sh@vger.kernel.org; sparclinux@vger.kernel.org; linux-xtensa@linux-
> xtensa.org
> Subject: [PATCH 21/21] dma-mapping: replace custom code with generic
> implementation
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that all of these have consistent behavior, replace them with a singl=
e
> shared implementation of arch_sync_dma_for_device() and
> arch_sync_dma_for_cpu() and three parameters to pick how they should
> operate:
>
>  - If the CPU has speculative prefetching, then the cache
>    has to be invalidated after a transfer from the device.
>    On the rarer CPUs without prefetching, this can be skipped,
>    with all cache management happening before the transfer.
>    This flag can be runtime detected, but is usually fixed
>    per architecture.
>
>  - Some architectures currently clean the caches before DMA
>    from a device, while others invalidate it. There has not
>    been a conclusion regarding whether we should change all
>    architectures to use clean instead, so this adds an
>    architecture specific flag that we can change later on.
>
>  - On 32-bit Arm, the arch_sync_dma_for_cpu() function keeps
>    track pages that are marked clean in the page cache, to
>    avoid flushing them again. The implementation for this is
>    generic enough to work on all architectures that use the
>    PG_dcache_clean page flag, but a Kconfig symbol is used
>    to only enable it on Arm to preserve the existing behavior.
>
> For the function naming, I picked 'wback' over 'clean', and 'wback_inv'
> over 'flush', to avoid any ambiguity of what the helper functions are
> supposed to do.
>
> Moving the global functions into a header file is usually a bad idea as i=
t
> prevents the header from being included more than once, but it helps keep
> the behavior as close as possible to the previous state, including the
> possibility of inlining most of it into these functions where that was do=
ne
> before. This also helps keep the global namespace clean, by hiding the ne=
w
> arch_dma_cache{_wback,_inv,_wback_inv} from device drivers that might use
> them incorrectly.
>
> It would be possible to do this one architecture at a time, but as the
> change is the same everywhere, the combined patch helps explain it better
> once.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arc/mm/dma.c                 |  66 +++++-------------
>  arch/arm/Kconfig                  |   3 +
>  arch/arm/mm/dma-mapping-nommu.c   |  39 ++++++-----
>  arch/arm/mm/dma-mapping.c         |  64 +++++++-----------
>  arch/arm64/mm/dma-mapping.c       |  28 +++++---
>  arch/csky/mm/dma-mapping.c        |  44 ++++++------
>  arch/hexagon/kernel/dma.c         |  44 ++++++------
>  arch/m68k/kernel/dma.c            |  43 +++++++-----
>  arch/microblaze/kernel/dma.c      |  48 +++++++-------
>  arch/mips/mm/dma-noncoherent.c    |  60 +++++++----------
>  arch/nios2/mm/dma-mapping.c       |  57 +++++++---------
>  arch/openrisc/kernel/dma.c        |  63 +++++++++++-------
>  arch/parisc/kernel/pci-dma.c      |  46 ++++++-------
>  arch/powerpc/mm/dma-noncoherent.c |  34 ++++++----
>  arch/riscv/mm/dma-noncoherent.c   |  51 +++++++-------
>  arch/sh/kernel/dma-coherent.c     |  43 +++++++-----
>  arch/sparc/kernel/ioport.c        |  38 ++++++++---
>  arch/xtensa/kernel/pci-dma.c      |  40 ++++++-----
>  include/linux/dma-sync.h          | 107 ++++++++++++++++++++++++++++++
>  19 files changed, 527 insertions(+), 391 deletions(-)  create mode 10064=
4
> include/linux/dma-sync.h
>
> diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c index
> ddb96786f765..61cd01646222 100644
> --- a/arch/arc/mm/dma.c
> +++ b/arch/arc/mm/dma.c
> @@ -30,63 +30,33 @@ void arch_dma_prep_coherent(struct page *page, size_t
> size)
>       dma_cache_wback_inv(page_to_phys(page), size);  }
>
> -/*
> - * Cache operations depending on function and direction argument, inspir=
ed
> by
> - *
> https://lore.kerne/
> l.org%2Flkml%2F20180518175004.GF17671%40n2100.armlinux.org.uk&data=3D05%7=
C01%7
> Cbiju.das.jz%40bp.renesas.com%7C3db9a66f29fa416d938108db2ebe1b0c%7C53d825=
71d
> a1947e49cb4625a166a4a2a%7C0%7C0%7C638155166250292766%7CUnknown%7CTWFpbGZs=
b3d
> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300=
0%7
> C%7C%7C&sdata=3DvVMW38elUoLyGW9%2BPQhsBDW8N61ubjgJBsbL6ct6uOU%3D&reserved=
=3D0
> - * "dma_sync_*_for_cpu and direction=3DTO_DEVICE (was Re: [PATCH 02/20]
> - * dma-mapping: provide a generic dma-noncoherent implementation)"
> - *
> - *          |   map          =3D=3D  for_device     |   unmap     =3D=3D=
  for_cpu
> - *          |-----------------------------------------------------------=
---
> --
> - * TO_DEV   |   writeback        writeback      |   none          none
> - * FROM_DEV |   invalidate       invalidate     |   invalidate*
> invalidate*
> - * BIDIR    |   writeback        writeback      |   invalidate
> invalidate
> - *
> - *     [*] needed for CPU speculative prefetches
> - *
> - * NOTE: we don't check the validity of direction argument as it is done=
 in
> - * upper layer functions (in include/linux/dma-mapping.h)
> - */
> -
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             dma_cache_wback(paddr, size);
> -             break;
> -
> -     case DMA_FROM_DEVICE:
> -             dma_cache_inv(paddr, size);
> -             break;
> -
> -     case DMA_BIDIRECTIONAL:
> -             dma_cache_wback(paddr, size);
> -             break;
> +     dma_cache_wback(paddr, size);
> +}
>
> -     default:
> -             break;
> -     }
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size) {
> +     dma_cache_inv(paddr, size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size)
>  {
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             break;
> +     dma_cache_wback_inv(paddr, size);
> +}
>
> -     /* FROM_DEVICE invalidate needed if speculative CPU prefetch only *=
/
> -     case DMA_FROM_DEVICE:
> -     case DMA_BIDIRECTIONAL:
> -             dma_cache_inv(paddr, size);
> -             break;
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return false;
> +}
>
> -     default:
> -             break;
> -     }
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return true;
>  }
>
> +#include <linux/dma-sync.h>
> +
>  /*
>   * Plug in direct dma map ops.
>   */
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig index
> 125d58c54ab1..0de84e861027 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -212,6 +212,9 @@ config LOCKDEP_SUPPORT
>       bool
>       default y
>
> +config ARCH_DMA_MARK_DCACHE_CLEAN
> +     def_bool y
> +
>  config ARCH_HAS_ILOG2_U32
>       bool
>
> diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-
> nommu.c index 12b5c6ae93fc..0817274aed15 100644
> --- a/arch/arm/mm/dma-mapping-nommu.c
> +++ b/arch/arm/mm/dma-mapping-nommu.c
> @@ -13,27 +13,36 @@
>
>  #include "dma.h"
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -     if (dir =3D=3D DMA_FROM_DEVICE) {
> -             dmac_inv_range(__va(paddr), __va(paddr + size));
> -             outer_inv_range(paddr, paddr + size);
> -     } else {
> -             dmac_clean_range(__va(paddr), __va(paddr + size));
> -             outer_clean_range(paddr, paddr + size);
> -     }
> +     dmac_clean_range(__va(paddr), __va(paddr + size));
> +     outer_clean_range(paddr, paddr + size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
> -     if (dir !=3D DMA_TO_DEVICE) {
> -             outer_inv_range(paddr, paddr + size);
> -             dmac_inv_range(__va(paddr), __va(paddr));
> -     }
> +     dmac_inv_range(__va(paddr), __va(paddr + size));
> +     outer_inv_range(paddr, paddr + size);
>  }
>
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     dmac_flush_range(__va(paddr), __va(paddr + size));
> +     outer_flush_range(paddr, paddr + size); }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return true;
> +}
> +
> +#include <linux/dma-sync.h>
> +
>  void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>                       const struct iommu_ops *iommu, bool coherent)  { di=
ff --
> git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c index
> b703cb83d27e..aa6ee820a0ab 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -687,6 +687,30 @@ void arch_dma_mark_clean(phys_addr_t paddr, size_t
> size)
>       }
>  }
>
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
> +{
> +     dma_cache_maint(paddr, size, dmac_clean_range);
> +     outer_clean_range(paddr, paddr + size); }
> +
> +
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size) {
> +     dma_cache_maint(paddr, size, dmac_inv_range);
> +     outer_inv_range(paddr, paddr + size);
> +}
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     dma_cache_maint(paddr, size, dmac_flush_range);
> +     outer_flush_range(paddr, paddr + size); }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return false;
> +}
> +
>  static bool arch_sync_dma_cpu_needs_post_dma_flush(void)
>  {
>       if (IS_ENABLED(CONFIG_CPU_V6) ||
> @@ -699,45 +723,7 @@ static bool
> arch_sync_dma_cpu_needs_post_dma_flush(void)
>       return false;
>  }
>
> -/*
> - * Make an area consistent for devices.
> - * Note: Drivers should NOT use this function directly.
> - * Use the driver DMA support - see dma-mapping.h (dma_sync_*)
> - */
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> -{
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             dma_cache_maint(paddr, size, dmac_clean_range);
> -             outer_clean_range(paddr, paddr + size);
> -             break;
> -     case DMA_FROM_DEVICE:
> -             dma_cache_maint(paddr, size, dmac_inv_range);
> -             outer_inv_range(paddr, paddr + size);
> -             break;
> -     case DMA_BIDIRECTIONAL:
> -             if (arch_sync_dma_cpu_needs_post_dma_flush()) {
> -                     dma_cache_maint(paddr, size, dmac_clean_range);
> -                     outer_clean_range(paddr, paddr + size);
> -             } else {
> -                     dma_cache_maint(paddr, size, dmac_flush_range);
> -                     outer_flush_range(paddr, paddr + size);
> -             }
> -             break;
> -     default:
> -             break;
> -     }
> -}
> -
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> -{
> -     if (dir !=3D DMA_TO_DEVICE && arch_sync_dma_cpu_needs_post_dma_flus=
h())
> {
> -             outer_inv_range(paddr, paddr + size);
> -             dma_cache_maint(paddr, size, dmac_inv_range);
> -     }
> -}
> +#include <linux/dma-sync.h>
>
>  #ifdef CONFIG_ARM_DMA_USE_IOMMU
>
> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c in=
dex
> 5240f6acad64..bae741aa65e9 100644
> --- a/arch/arm64/mm/dma-mapping.c
> +++ b/arch/arm64/mm/dma-mapping.c
> @@ -13,25 +13,33 @@
>  #include <asm/cacheflush.h>
>  #include <asm/xen/xen-ops.h>
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -                           enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -     unsigned long start =3D (unsigned long)phys_to_virt(paddr);
> +     dcache_clean_poc(paddr, paddr + size); }
>
> -     dcache_clean_poc(start, start + size);
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size) {
> +     dcache_inval_poc(paddr, paddr + size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -                        enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size)
>  {
> -     unsigned long start =3D (unsigned long)phys_to_virt(paddr);
> +     dcache_clean_inval_poc(paddr, paddr + size); }
>
> -     if (dir =3D=3D DMA_TO_DEVICE)
> -             return;
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return true;
> +}
>
> -     dcache_inval_poc(start, start + size);
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return true;
>  }
>
> +#include <linux/dma-sync.h>
> +
>  void arch_dma_prep_coherent(struct page *page, size_t size)  {
>       unsigned long start =3D (unsigned long)page_address(page); diff --g=
it
> a/arch/csky/mm/dma-mapping.c b/arch/csky/mm/dma-mapping.c index
> c90f912e2822..9402e101b363 100644
> --- a/arch/csky/mm/dma-mapping.c
> +++ b/arch/csky/mm/dma-mapping.c
> @@ -55,31 +55,29 @@ void arch_dma_prep_coherent(struct page *page, size_t
> size)
>       cache_op(page_to_phys(page), size, dma_wbinv_set_zero_range);  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -     case DMA_FROM_DEVICE:
> -     case DMA_BIDIRECTIONAL:
> -             cache_op(paddr, size, dma_wb_range);
> -             break;
> -     default:
> -             BUG();
> -     }
> +     cache_op(paddr, size, dma_wb_range);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             return;
> -     case DMA_FROM_DEVICE:
> -     case DMA_BIDIRECTIONAL:
> -             cache_op(paddr, size, dma_inv_range);
> -             break;
> -     default:
> -             BUG();
> -     }
> +     cache_op(paddr, size, dma_inv_range);
>  }
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     cache_op(paddr, size, dma_wbinv_range); }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return true;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return true;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/hexagon/kernel/dma.c b/arch/hexagon/kernel/dma.c index
> 882680e81a30..e6538128a75b 100644
> --- a/arch/hexagon/kernel/dma.c
> +++ b/arch/hexagon/kernel/dma.c
> @@ -9,29 +9,33 @@
>  #include <linux/memblock.h>
>  #include <asm/page.h>
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -     void *addr =3D phys_to_virt(paddr);
> -
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             hexagon_clean_dcache_range((unsigned long) addr,
> -             (unsigned long) addr + size);
> -             break;
> -     case DMA_FROM_DEVICE:
> -             hexagon_inv_dcache_range((unsigned long) addr,
> -             (unsigned long) addr + size);
> -             break;
> -     case DMA_BIDIRECTIONAL:
> -             flush_dcache_range((unsigned long) addr,
> -             (unsigned long) addr + size);
> -             break;
> -     default:
> -             BUG();
> -     }
> +     hexagon_clean_dcache_range(paddr, paddr + size);
>  }
>
> +static inline void arch_dma_cache_inv(phys_addr_t start, size_t size) {
> +     hexagon_inv_dcache_range(paddr, paddr + size); }
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t start, size_t
> +size) {
> +     hexagon_flush_dcache_range(paddr, paddr + size); }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return false;
> +}
> +
> +#include <linux/dma-sync.h>
> +
>  /*
>   * Our max_low_pfn should have been backed off by 16MB in mm/init.c to
> create
>   * DMA coherent space.  Use that for the pool.
> diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c index
> 2e192a5df949..aa9b434e6df8 100644
> --- a/arch/m68k/kernel/dma.c
> +++ b/arch/m68k/kernel/dma.c
> @@ -58,20 +58,33 @@ void arch_dma_free(struct device *dev, size_t size, v=
oid
> *vaddr,
>
>  #endif /* CONFIG_MMU && !CONFIG_COLDFIRE */
>
> -void arch_sync_dma_for_device(phys_addr_t handle, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -     switch (dir) {
> -     case DMA_BIDIRECTIONAL:
> -     case DMA_TO_DEVICE:
> -             cache_push(handle, size);
> -             break;
> -     case DMA_FROM_DEVICE:
> -             cache_clear(handle, size);
> -             break;
> -     default:
> -             pr_err_ratelimited("dma_sync_single_for_device: unsupported=
 dir
> %u\n",
> -                                dir);
> -             break;
> -     }
> +     /*
> +      * cache_push() always invalidates in addition to cleaning
> +      * write-back caches.
> +      */
> +     cache_push(paddr, size);
> +}
> +
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size) {
> +     cache_clear(paddr, size);
> +}
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     cache_push(paddr, size);
>  }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return false;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/microblaze/kernel/dma.c b/arch/microblaze/kernel/dma.c
> index b4c4e45fd45e..01110d4aa5b0 100644
> --- a/arch/microblaze/kernel/dma.c
> +++ b/arch/microblaze/kernel/dma.c
> @@ -14,32 +14,30 @@
>  #include <linux/bug.h>
>  #include <asm/cacheflush.h>
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -     switch (direction) {
> -     case DMA_TO_DEVICE:
> -     case DMA_BIDIRECTIONAL:
> -             flush_dcache_range(paddr, paddr + size);
> -             break;
> -     case DMA_FROM_DEVICE:
> -             invalidate_dcache_range(paddr, paddr + size);
> -             break;
> -     default:
> -             BUG();
> -     }
> +     /* writeback plus invalidate, could be a nop on WT caches */
> +     flush_dcache_range(paddr, paddr + size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
> -     switch (direction) {
> -     case DMA_TO_DEVICE:
> -             break;
> -     case DMA_BIDIRECTIONAL:
> -     case DMA_FROM_DEVICE:
> -             invalidate_dcache_range(paddr, paddr + size);
> -             break;
> -     default:
> -             BUG();
> -     }}
> +     invalidate_dcache_range(paddr, paddr + size); }
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     flush_dcache_range(paddr, paddr + size); }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return true;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoheren=
t.c
> index b9d68bcc5d53..902d4b7c1f85 100644
> --- a/arch/mips/mm/dma-noncoherent.c
> +++ b/arch/mips/mm/dma-noncoherent.c
> @@ -85,50 +85,38 @@ static inline void dma_sync_phys(phys_addr_t paddr,
> size_t size,
>       } while (left);
>  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             dma_sync_phys(paddr, size, _dma_cache_wback);
> -             break;
> -     case DMA_FROM_DEVICE:
> -             dma_sync_phys(paddr, size, _dma_cache_inv);
> -             break;
> -     case DMA_BIDIRECTIONAL:
> -             if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
> -                 cpu_needs_post_dma_flush())
> -                     dma_sync_phys(paddr, size, _dma_cache_wback);
> -             else
> -                     dma_sync_phys(paddr, size, _dma_cache_wback_inv);
> -             break;
> -     default:
> -             break;
> -     }
> +     dma_sync_phys(paddr, size, _dma_cache_wback);
>  }
>
> -#ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU -void
> arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             break;
> -     case DMA_FROM_DEVICE:
> -     case DMA_BIDIRECTIONAL:
> -             if (cpu_needs_post_dma_flush())
> -                     dma_sync_phys(paddr, size, _dma_cache_inv);
> -             break;
> -     default:
> -             break;
> -     }
> +     dma_sync_phys(paddr, size, _dma_cache_inv);
>  }
> -#endif
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     dma_sync_phys(paddr, size, _dma_cache_wback_inv); }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
> +                    cpu_needs_post_dma_flush(); }
> +
> +#include <linux/dma-sync.h>
>
>  #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
>  void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> -             const struct iommu_ops *iommu, bool coherent)
> +               const struct iommu_ops *iommu, bool coherent)
>  {
> -     dev->dma_coherent =3D coherent;
> +       dev->dma_coherent =3D coherent;
>  }
>  #endif
> diff --git a/arch/nios2/mm/dma-mapping.c b/arch/nios2/mm/dma-mapping.c in=
dex
> fd887d5f3f9a..29978970955e 100644
> --- a/arch/nios2/mm/dma-mapping.c
> +++ b/arch/nios2/mm/dma-mapping.c
> @@ -13,53 +13,46 @@
>  #include <linux/types.h>
>  #include <linux/mm.h>
>  #include <linux/string.h>
> +#include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/cache.h>
>  #include <asm/cacheflush.h>
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> +     /*
> +      * We just need to write back the caches here, but Nios2 flush
> +      * instruction will do both writeback and invalidate.
> +      */
>       void *vaddr =3D phys_to_virt(paddr);
> +     flush_dcache_range((unsigned long)vaddr, (unsigned long)(vaddr +
> +size)); }
>
> -     switch (dir) {
> -     case DMA_FROM_DEVICE:
> -             invalidate_dcache_range((unsigned long)vaddr,
> -                     (unsigned long)(vaddr + size));
> -             break;
> -     case DMA_TO_DEVICE:
> -             /*
> -              * We just need to flush the caches here , but Nios2 flush
> -              * instruction will do both writeback and invalidate.
> -              */
> -     case DMA_BIDIRECTIONAL: /* flush and invalidate */
> -             flush_dcache_range((unsigned long)vaddr,
> -                     (unsigned long)(vaddr + size));
> -             break;
> -     default:
> -             BUG();
> -     }
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size) {
> +     unsigned long vaddr =3D (unsigned long)phys_to_virt(paddr);
> +     invalidate_dcache_range(vaddr, (unsigned long)(vaddr + size));
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size)
>  {
>       void *vaddr =3D phys_to_virt(paddr);
> +     flush_dcache_range((unsigned long)vaddr, (unsigned long)(vaddr +
> +size)); }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return false;
> +}
>
> -     switch (dir) {
> -     case DMA_BIDIRECTIONAL:
> -     case DMA_FROM_DEVICE:
> -             invalidate_dcache_range((unsigned long)vaddr,
> -                     (unsigned long)(vaddr + size));
> -             break;
> -     case DMA_TO_DEVICE:
> -             break;
> -     default:
> -             BUG();
> -     }
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return true;
>  }
>
> +#include <linux/dma-sync.h>
> +
>  void arch_dma_prep_coherent(struct page *page, size_t size)  {
>       unsigned long start =3D (unsigned long)page_address(page); diff --g=
it
> a/arch/openrisc/kernel/dma.c b/arch/openrisc/kernel/dma.c index
> 91a00d09ffad..aba2258e62eb 100644
> --- a/arch/openrisc/kernel/dma.c
> +++ b/arch/openrisc/kernel/dma.c
> @@ -95,32 +95,47 @@ void arch_dma_clear_uncached(void *cpu_addr, size_t
> size)
>       mmap_write_unlock(&init_mm);
>  }
>
> -void arch_sync_dma_for_device(phys_addr_t addr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>       unsigned long cl;
>       struct cpuinfo_or1k *cpuinfo =3D &cpuinfo_or1k[smp_processor_id()];
>
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             /* Write back the dcache for the requested range */
> -             for (cl =3D addr; cl < addr + size;
> -                  cl +=3D cpuinfo->dcache_block_size)
> -                     mtspr(SPR_DCBWR, cl);
> -             break;
> -     case DMA_FROM_DEVICE:
> -             /* Invalidate the dcache for the requested range */
> -             for (cl =3D addr; cl < addr + size;
> -                  cl +=3D cpuinfo->dcache_block_size)
> -                     mtspr(SPR_DCBIR, cl);
> -             break;
> -     case DMA_BIDIRECTIONAL:
> -             /* Flush the dcache for the requested range */
> -             for (cl =3D addr; cl < addr + size;
> -                  cl +=3D cpuinfo->dcache_block_size)
> -                     mtspr(SPR_DCBFR, cl);
> -             break;
> -     default:
> -             break;
> -     }
> +     /* Write back the dcache for the requested range */
> +     for (cl =3D paddr; cl < paddr + size;
> +          cl +=3D cpuinfo->dcache_block_size)
> +             mtspr(SPR_DCBWR, cl);
>  }
> +
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size) {
> +     unsigned long cl;
> +     struct cpuinfo_or1k *cpuinfo =3D &cpuinfo_or1k[smp_processor_id()];
> +
> +     /* Invalidate the dcache for the requested range */
> +     for (cl =3D paddr; cl < paddr + size;
> +          cl +=3D cpuinfo->dcache_block_size)
> +             mtspr(SPR_DCBIR, cl);
> +}
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     unsigned long cl;
> +     struct cpuinfo_or1k *cpuinfo =3D &cpuinfo_or1k[smp_processor_id()];
> +
> +     /* Flush the dcache for the requested range */
> +     for (cl =3D paddr; cl < paddr + size;
> +          cl +=3D cpuinfo->dcache_block_size)
> +             mtspr(SPR_DCBFR, cl);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return false;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
> index 6d3d3cffb316..a7955aab8ce2 100644
> --- a/arch/parisc/kernel/pci-dma.c
> +++ b/arch/parisc/kernel/pci-dma.c
> @@ -443,35 +443,35 @@ void arch_dma_free(struct device *dev, size_t size,
> void *vaddr,
>       free_pages((unsigned long)__va(dma_handle), order);  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>       unsigned long virt =3D (unsigned long)phys_to_virt(paddr);
>
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             clean_kernel_dcache_range(virt, size);
> -             break;
> -     case DMA_FROM_DEVICE:
> -             clean_kernel_dcache_range(virt, size);
> -             break;
> -     case DMA_BIDIRECTIONAL:
> -             flush_kernel_dcache_range(virt, size);
> -             break;
> -     }
> +     clean_kernel_dcache_range(virt, size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
>       unsigned long virt =3D (unsigned long)phys_to_virt(paddr);
>
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             break;
> -     case DMA_FROM_DEVICE:
> -     case DMA_BIDIRECTIONAL:
> -             purge_kernel_dcache_range(virt, size);
> -             break;
> -     }
> +     purge_kernel_dcache_range(virt, size); }
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     unsigned long virt =3D (unsigned long)phys_to_virt(paddr);
> +
> +     flush_kernel_dcache_range(virt, size);
>  }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return true;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return true;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-
> noncoherent.c
> index 00e59a4faa2b..268510c71156 100644
> --- a/arch/powerpc/mm/dma-noncoherent.c
> +++ b/arch/powerpc/mm/dma-noncoherent.c
> @@ -101,27 +101,33 @@ static void __dma_phys_op(phys_addr_t paddr, size_t
> size, enum dma_cache_op op)  #endif  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>       __dma_phys_op(start, end, DMA_CACHE_CLEAN);  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
> -     switch (direction) {
> -     case DMA_NONE:
> -             BUG();
> -     case DMA_TO_DEVICE:
> -             break;
> -     case DMA_FROM_DEVICE:
> -     case DMA_BIDIRECTIONAL:
> -             __dma_phys_op(start, end, DMA_CACHE_INVAL);
> -             break;
> -     }
> +     __dma_phys_op(start, end, DMA_CACHE_INVAL);
>  }
>
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     __dma_phys_op(start, end, DMA_CACHE_FLUSH); }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return true;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return true;
> +}
> +
> +#include <linux/dma-sync.h>
> +
>  void arch_dma_prep_coherent(struct page *page, size_t size)  {
>       unsigned long kaddr =3D (unsigned long)page_address(page); diff --g=
it
> a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c index
> 69c80b2155a1..b9a9f57e02be 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -12,43 +12,40 @@
>
>  static bool noncoherent_supported;
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -                           enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>       void *vaddr =3D phys_to_virt(paddr);
>
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> -             break;
> -     case DMA_FROM_DEVICE:
> -             ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> -             break;
> -     case DMA_BIDIRECTIONAL:
> -             ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> -             break;
> -     default:
> -             break;
> -     }
> +     ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -                        enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
>       void *vaddr =3D phys_to_virt(paddr);
>
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             break;
> -     case DMA_FROM_DEVICE:
> -     case DMA_BIDIRECTIONAL:
> -             ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> -             break;
> -     default:
> -             break;
> -     }
> +     ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
>  }
>
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     void *vaddr =3D phys_to_virt(paddr);
> +
> +     ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size); }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return true;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return true;
> +}
> +
> +#include <linux/dma-sync.h>
> +
> +
>  void arch_dma_prep_coherent(struct page *page, size_t size)  {
>       void *flush_addr =3D page_address(page); diff --git
> a/arch/sh/kernel/dma-coherent.c b/arch/sh/kernel/dma-coherent.c index
> 6a44c0e7ba40..41f031ae7609 100644
> --- a/arch/sh/kernel/dma-coherent.c
> +++ b/arch/sh/kernel/dma-coherent.c
> @@ -12,22 +12,35 @@ void arch_dma_prep_coherent(struct page *page, size_t
> size)
>       __flush_purge_region(page_address(page), size);  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>       void *addr =3D sh_cacheop_vaddr(phys_to_virt(paddr));
>
> -     switch (dir) {
> -     case DMA_FROM_DEVICE:           /* invalidate only */
> -             __flush_invalidate_region(addr, size);
> -             break;
> -     case DMA_TO_DEVICE:             /* writeback only */
> -             __flush_wback_region(addr, size);
> -             break;
> -     case DMA_BIDIRECTIONAL:         /* writeback and invalidate */
> -             __flush_purge_region(addr, size);
> -             break;
> -     default:
> -             BUG();
> -     }
> +     __flush_wback_region(addr, size);
>  }
> +
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size) {
> +     void *addr =3D sh_cacheop_vaddr(phys_to_virt(paddr));
> +
> +     __flush_invalidate_region(addr, size); }
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     void *addr =3D sh_cacheop_vaddr(phys_to_virt(paddr));
> +
> +     __flush_purge_region(addr, size);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return false;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c inde=
x
> 4f3d26066ec2..6926ead2f208 100644
> --- a/arch/sparc/kernel/ioport.c
> +++ b/arch/sparc/kernel/ioport.c
> @@ -300,21 +300,39 @@ arch_initcall(sparc_register_ioport);
>
>  #endif /* CONFIG_SBUS */
>
> -/*
> - * IIep is write-through, not flushing on cpu to device transfer.
> - *
> - * On LEON systems without cache snooping, the entire D-CACHE must be
> flushed to
> - * make DMA to cacheable memory coherent.
> - */
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -     if (dir !=3D DMA_TO_DEVICE &&
> -         sparc_cpu_model =3D=3D sparc_leon &&
> +     /* IIep is write-through, not flushing on cpu to device transfer. *=
/ }
> +
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size) {
> +     /*
> +      * On LEON systems without cache snooping, the entire D-CACHE must =
be
> +      * flushed to make DMA to cacheable memory coherent.
> +      */
> +     if (sparc_cpu_model =3D=3D sparc_leon &&
>           !sparc_leon3_snooping_enabled())
>               leon_flush_dcache_all();
>  }
>
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     arch_dma_cache_inv(paddr, size);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return true;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return false;
> +}
> +
> +#include <linux/dma-sync.h>
> +
>  #ifdef CONFIG_PROC_FS
>
>  static int sparc_io_proc_show(struct seq_file *m, void *v) diff --git
> a/arch/xtensa/kernel/pci-dma.c b/arch/xtensa/kernel/pci-dma.c index
> ff3bf015eca4..d4ff96585545 100644
> --- a/arch/xtensa/kernel/pci-dma.c
> +++ b/arch/xtensa/kernel/pci-dma.c
> @@ -43,24 +43,34 @@ static void do_cache_op(phys_addr_t paddr, size_t siz=
e,
>               }
>  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -     switch (dir) {
> -     case DMA_TO_DEVICE:
> -             do_cache_op(paddr, size, __flush_dcache_range);
> -             break;
> -     case DMA_FROM_DEVICE:
> -             do_cache_op(paddr, size, __invalidate_dcache_range);
> -             break;
> -     case DMA_BIDIRECTIONAL:
> -             do_cache_op(paddr, size, __flush_invalidate_dcache_range);
> -             break;
> -     default:
> -             break;
> -     }
> +     do_cache_op(paddr, size, __flush_dcache_range);
>  }
>
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size) {
> +     do_cache_op(paddr, size, __invalidate_dcache_range); }
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t
> +size) {
> +     do_cache_op(paddr, size, __flush_invalidate_dcache_range); }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +     return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +     return false;
> +}
> +
> +#include <linux/dma-sync.h>
> +
> +
>  void arch_dma_prep_coherent(struct page *page, size_t size)  {
>       __invalidate_dcache_range((unsigned long)page_address(page), size);
> diff --git a/include/linux/dma-sync.h b/include/linux/dma-sync.h new file
> mode 100644 index 000000000000..18e33d5e8eaf
> --- /dev/null
> +++ b/include/linux/dma-sync.h
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cache operations depending on function and direction argument,
> +inspired by
> + *
> +https://lore/.
> +kernel.org%2Flkml%2F20180518175004.GF17671%40n2100.armlinux.org.uk&data
> +=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C3db9a66f29fa416d938108db2ebe=
1
> +b0c%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638155166250449286%7CU
> +nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW
> +wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D04qDpyhP%2FT1wdPjg%2Bi0EzLz815r=
k
> +8AJmZFv8tq7tolM%3D&reserved=3D0
> + * "dma_sync_*_for_cpu and direction=3DTO_DEVICE (was Re: [PATCH 02/20]
> + * dma-mapping: provide a generic dma-noncoherent implementation)"
> + *
> + *          |   map          =3D=3D  for_device     |   unmap     =3D=3D=
  for_cpu
> + *          |-----------------------------------------------------------=
---
> --
> + * TO_DEV   |   writeback        writeback      |   none          none
> + * FROM_DEV |   invalidate       invalidate     |   invalidate*
> invalidate*
> + * BIDIR    |   writeback        writeback      |   invalidate
> invalidate
> + *
> + *     [*] needed for CPU speculative prefetches
> + *
> + * NOTE: we don't check the validity of direction argument as it is
> +done in
> + * upper layer functions (in include/linux/dma-mapping.h)
> + *
> + * This file can be included by arch/.../kernel/dma-noncoherent.c to
> +provide
> + * the respective high-level operations without having to expose the
> + * cache management ops to drivers.
> + */
> +
> +void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> +             enum dma_data_direction dir)
> +{
> +     switch (dir) {
> +     case DMA_TO_DEVICE:
> +             /*
> +              * This may be an empty function on write-through caches,
> +              * and it might invalidate the cache if an architecture has
> +              * a write-back cache but no way to write it back without
> +              * invalidating
> +              */
> +             arch_dma_cache_wback(paddr, size);
> +             break;
> +
> +     case DMA_FROM_DEVICE:
> +             /*
> +              * FIXME: this should be handled the same across all
> +              * architectures, see
> +              *
> https://lore.kerne/
> l.org%2Fall%2F20220606152150.GA31568%40willie-the-
> truck%2F&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C3db9a66f29fa416d=
93810
> 8db2ebe1b0c%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6381551662504492=
86%
> 7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
Wwi
> LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DrMRR1qB7VTNcvosS73f04WZ5BI46kEoZXj=
4sTXl
> Sbf8%3D&reserved=3D0
> +              */
> +             if (!arch_sync_dma_clean_before_fromdevice()) {
> +                     arch_dma_cache_inv(paddr, size);
> +                     break;
> +             }
> +             fallthrough;
> +
> +     case DMA_BIDIRECTIONAL:
> +             /* Skip the invalidate here if it's done later */
> +             if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
> +                 arch_sync_dma_cpu_needs_post_dma_flush())
> +                     arch_dma_cache_wback(paddr, size);
> +             else
> +                     arch_dma_cache_wback_inv(paddr, size);
> +             break;
> +
> +     default:
> +             break;
> +     }
> +}
> +
> +#ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
> +/*
> + * Mark the D-cache clean for these pages to avoid extra flushing.
> + */
> +static void arch_dma_mark_dcache_clean(phys_addr_t paddr, size_t size)
> +{ #ifdef CONFIG_ARCH_DMA_MARK_DCACHE_CLEAN
> +     unsigned long pfn =3D PFN_UP(paddr);
> +     unsigned long off =3D paddr & (PAGE_SIZE - 1);
> +     size_t left =3D size;
> +
> +     if (off)
> +             left -=3D PAGE_SIZE - off;
> +
> +     while (left >=3D PAGE_SIZE) {
> +             struct page *page =3D pfn_to_page(pfn++);
> +             set_bit(PG_dcache_clean, &page->flags);
> +             left -=3D PAGE_SIZE;
> +     }
> +#endif
> +}
> +
> +void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> +             enum dma_data_direction dir)
> +{
> +     switch (dir) {
> +     case DMA_TO_DEVICE:
> +             break;
> +
> +     case DMA_FROM_DEVICE:
> +     case DMA_BIDIRECTIONAL:
> +             /* FROM_DEVICE invalidate needed if speculative CPU prefetc=
h
> only */
> +             if (arch_sync_dma_cpu_needs_post_dma_flush())
> +                     arch_dma_cache_inv(paddr, size);
> +
> +             if (size > PAGE_SIZE)
> +                     arch_dma_mark_dcache_clean(paddr, size);
> +             break;
> +
> +     default:
> +             break;
> +     }
> +}
> +#endif
> --
> 2.39.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infra/
> dead.org%2Fmailman%2Flistinfo%2Flinux-arm-
> kernel&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C3db9a66f29fa416d93=
8108d
> b2ebe1b0c%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638155166250449286=
%7C
> Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLC
> JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DjVWHs4FyF3gf99YGax4jl1vHNQ7JFMbsX3No=
IAHdw
> Zw%3D&reserved=3D0
