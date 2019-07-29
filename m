Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEF378F2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 17:28:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y3V81Kx5zDqLq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 01:28:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.78; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=diana.craciun@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="mt/gTzcM"; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140078.outbound.protection.outlook.com [40.107.14.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y2Cg5wp9zDqFp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:30:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmzkZhD9rfo468Kfd7Mhc+h3vRlWO4Lvj7phir8E0BlgENE6BD9oVs9i81VxK76tzq18X/iHgzuqnABJ1M/IuaFA/k/VQpS5XaYb3AOtVHQsDQ3xJywQd+YKworz8IrcrpifZ3Gz1MIjwjJhmMQ8eWLWop4OWGJs6nIAYF+C4L9Q8IvCaGeEi+uVZk06ANJy17qOMY0WNnDVCT/RQIn61UHJz2bHRM3NRI6AI4lVwhcUFVeccSBn1pQZOI2VCMvQVN8cR/zO4Rj+h3F4VXjPBRbMIwP0x5db1qXaN+a9yplkVxZthg9Nzvpv4wj8+F/3sB2B0ZL8CGbSS6ydNfkr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+wCdu3SvhhI5Nq9aA0GPKeBPlhpLiUeh0ZGbhj8Xt0=;
 b=G2fOYIDl2fdx7HrVBrWy1+foilcK4b2e1rop8KcziRLdG572ztrEpqy/lDaeSJ8zfdh1NwZdifzPgvD60fxbxRYdlu029O+6+1ElGxfIVzHCVPAag1IrH8/8jrmrLJNcG/Rbtz6Wg+KGgD0FEL9Gl66FABTnclqrE+sx4eBOXMdQmLVtZZEjabErOrvLJVQUqa8F6AoC/hbxCjbAyzuokC/snwiWT9j6TkT14+U+WuaG7gEqdVYYNGTEAyhF9nM9ONYvIR/IhDS9wfEUP08shGT0Q2KMVIBXHXr2qQ7hv9G9KZq37fvwDTVDqnzux94a2BflIRgXQe2JB0MdpmtakQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+wCdu3SvhhI5Nq9aA0GPKeBPlhpLiUeh0ZGbhj8Xt0=;
 b=mt/gTzcMcUYriI0vKZGE6+LrhRyvCos2qVmdmLzJsRlVmpxY9OYoEAYA6wf1tAVD2J2nO8hZ0UDqxaS0acnJhLCUb5SvMZWTgOxi7xNSGvK31jKJD2OZEkKHYbL//C12z+P7136OM7CCyP7zewlJpdDUMWVpKs4dfJGQ6YFvkJY=
Received: from VI1PR0401MB2463.eurprd04.prod.outlook.com (10.168.61.13) by
 VI1PR0401MB2272.eurprd04.prod.outlook.com (10.169.137.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 14:30:15 +0000
Received: from VI1PR0401MB2463.eurprd04.prod.outlook.com
 ([fe80::49dc:1671:b13b:e382]) by VI1PR0401MB2463.eurprd04.prod.outlook.com
 ([fe80::49dc:1671:b13b:e382%9]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 14:30:15 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: Jason Yan <yanaijie@huawei.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "christophe.leroy@c-s.fr"
 <christophe.leroy@c-s.fr>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "paulus@samba.org" <paulus@samba.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "keescook@chromium.org"
 <keescook@chromium.org>, "kernel-hardening@lists.openwall.com"
 <kernel-hardening@lists.openwall.com>
Subject: Re: [RFC PATCH 00/10] implement KASLR for powerpc/fsl_booke/32
Thread-Topic: [RFC PATCH 00/10] implement KASLR for powerpc/fsl_booke/32
Thread-Index: AQHVPHQmPxsZ5ebrqkOb0IKUtKxd9g==
Date: Mon, 29 Jul 2019 14:30:15 +0000
Message-ID: <VI1PR0401MB24633E9C5475F8D50536C46FFFDD0@VI1PR0401MB2463.eurprd04.prod.outlook.com>
References: <20190717080621.40424-1-yanaijie@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=diana.craciun@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 078f2f98-c292-4f27-a3bb-08d7143145ef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0401MB2272; 
x-ms-traffictypediagnostic: VI1PR0401MB2272:
x-microsoft-antispam-prvs: <VI1PR0401MB22727C6BC38B9DE504EFFAA1FFDD0@VI1PR0401MB2272.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(189003)(199004)(91956017)(8676002)(446003)(66946007)(7736002)(7696005)(486006)(76116006)(476003)(2906002)(81156014)(81166006)(52536014)(71190400001)(55016002)(3846002)(66066001)(33656002)(256004)(14444005)(76176011)(64756008)(66556008)(9686003)(6116002)(66446008)(71200400001)(66476007)(53936002)(2201001)(14454004)(99286004)(305945005)(229853002)(6436002)(7416002)(2501003)(68736007)(8936002)(4326008)(110136005)(54906003)(86362001)(478600001)(5660300002)(186003)(102836004)(6246003)(6506007)(53546011)(25786009)(316002)(26005)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0401MB2272;
 H:VI1PR0401MB2463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q7M8rIkdoFNPpU/P2Oy9SYKAFR2WdSN/U5EtI4DErjW55sbqkLsSLM7Vr4zXxfZmKStqHBuMT6vMC9+vKVz3C7KJpGAGkP+yQ6W+NBCLgjLTHzSOyfMctRZ4ZJXZr7X1KsGzsb6dJf8jRcBzvr0r7lN6d45WDsjGt4bDhD9mRVLW6b0f4ruav0l0+ax8g4z++l6eP1gZ5JZUW+EmUi9n+7UDpGsuvsFTV6knugPZZrNZEk8UShXJBC0NRUDB3uL9CWLXnJCVFT1TzO4FqdHnDo4HsixAsrVagmZskTxMhRrcCxbgz8P/5T6JYdiLP1J1cLCev9HnLy0KrzfmGYKueIl+hDXXIM0akzgUe798PsN5fyZndUS/4FRAuEcTPZlIV5g4X/qtC986hLStS2wDdY+ijvB0FkX5Nd56KqMoHg8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078f2f98-c292-4f27-a3bb-08d7143145ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 14:30:15.4829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: diana.craciun@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2272
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jingxiangfeng@huawei.com" <jingxiangfeng@huawei.com>,
 "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
 "fanchengyang@huawei.com" <fanchengyang@huawei.com>,
 "yebin10@huawei.com" <yebin10@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Diana Craciun <diana.craciun@nxp.com>=0A=
Tested-by: Diana Craciun <diana.craciun@nxp.com>=0A=
=0A=
=0A=
On 7/17/2019 10:49 AM, Jason Yan wrote:=0A=
> This series implements KASLR for powerpc/fsl_booke/32, as a security=0A=
> feature that deters exploit attempts relying on knowledge of the location=
=0A=
> of kernel internals.=0A=
>=0A=
> Since CONFIG_RELOCATABLE has already supported, what we need to do is=0A=
> map or copy kernel to a proper place and relocate. Freescale Book-E=0A=
> parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1=0A=
> entries are not suitable to map the kernel directly in a randomized=0A=
> region, so we chose to copy the kernel to a proper place and restart to=
=0A=
> relocate.=0A=
>=0A=
> Entropy is derived from the banner and timer base, which will change ever=
y=0A=
> build and boot. This not so much safe so additionally the bootloader may=
=0A=
> pass entropy via the /chosen/kaslr-seed node in device tree.=0A=
>=0A=
> We will use the first 512M of the low memory to randomize the kernel=0A=
> image. The memory will be split in 64M zones. We will use the lower 8=0A=
> bit of the entropy to decide the index of the 64M zone. Then we chose a=
=0A=
> 16K aligned offset inside the 64M zone to put the kernel in.=0A=
>=0A=
>     KERNELBASE=0A=
>=0A=
>         |-->   64M   <--|=0A=
>         |               |=0A=
>         +---------------+    +----------------+---------------+=0A=
>         |               |....|    |kernel|    |               |=0A=
>         +---------------+    +----------------+---------------+=0A=
>         |                         |=0A=
>         |----->   offset    <-----|=0A=
>=0A=
>                               kimage_vaddr=0A=
>=0A=
> We also check if we will overlap with some areas like the dtb area, the=
=0A=
> initrd area or the crashkernel area. If we cannot find a proper area,=0A=
> kaslr will be disabled and boot from the original kernel.=0A=
>=0A=
> Jason Yan (10):=0A=
>   powerpc: unify definition of M_IF_NEEDED=0A=
>   powerpc: move memstart_addr and kernstart_addr to init-common.c=0A=
>   powerpc: introduce kimage_vaddr to store the kernel base=0A=
>   powerpc/fsl_booke/32: introduce create_tlb_entry() helper=0A=
>   powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper=0A=
>   powerpc/fsl_booke/32: implement KASLR infrastructure=0A=
>   powerpc/fsl_booke/32: randomize the kernel image offset=0A=
>   powerpc/fsl_booke/kaslr: clear the original kernel if randomized=0A=
>   powerpc/fsl_booke/kaslr: support nokaslr cmdline parameter=0A=
>   powerpc/fsl_booke/kaslr: dump out kernel offset information on panic=0A=
>=0A=
>  arch/powerpc/Kconfig                          |  11 +=0A=
>  arch/powerpc/include/asm/nohash/mmu-book3e.h  |  10 +=0A=
>  arch/powerpc/include/asm/page.h               |   7 +=0A=
>  arch/powerpc/kernel/Makefile                  |   1 +=0A=
>  arch/powerpc/kernel/early_32.c                |   2 +-=0A=
>  arch/powerpc/kernel/exceptions-64e.S          |  10 -=0A=
>  arch/powerpc/kernel/fsl_booke_entry_mapping.S |  23 +-=0A=
>  arch/powerpc/kernel/head_fsl_booke.S          |  61 ++-=0A=
>  arch/powerpc/kernel/kaslr_booke.c             | 439 ++++++++++++++++++=
=0A=
>  arch/powerpc/kernel/machine_kexec.c           |   1 +=0A=
>  arch/powerpc/kernel/misc_64.S                 |   5 -=0A=
>  arch/powerpc/kernel/setup-common.c            |  23 +=0A=
>  arch/powerpc/mm/init-common.c                 |   7 +=0A=
>  arch/powerpc/mm/init_32.c                     |   5 -=0A=
>  arch/powerpc/mm/init_64.c                     |   5 -=0A=
>  arch/powerpc/mm/mmu_decl.h                    |  10 +=0A=
>  arch/powerpc/mm/nohash/fsl_booke.c            |   8 +-=0A=
>  17 files changed, 580 insertions(+), 48 deletions(-)=0A=
>  create mode 100644 arch/powerpc/kernel/kaslr_booke.c=0A=
>=0A=
=0A=
