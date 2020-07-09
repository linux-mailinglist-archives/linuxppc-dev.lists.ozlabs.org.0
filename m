Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1F921A001
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 14:27:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2b6g1bgLzDr5h
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 22:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xilinx.com (client-ip=40.107.237.62;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=draganc@xilinx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-xilinx-onmicrosoft-com
 header.b=QLje5vTv; dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Z2B6CJmzDqxB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 21:38:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWmjRlrltMhXgWEPhzLT1CVjQLHQ+ft2kanwk2l0GW75ozuiitMreZ9a9Kv2BvXBAATW6gWJv8diAFG3MwfdP4saFgOhnZBnPsFRusXVwiR2pIO6qLOaxQGQVKD66mD/qoKFHBAGax2t6T0LIwEeXK4z3xH7DoI9RApnpVaE5W+QK6F4Fw1XVwu4NUNW5GuMQoHBrLSFzaiKIWS6wL+ClfBoBnO/doF+ksJSvV+TJQp4UBzhBBWtdN6zZnkq+ckGj28HPHpTQLcgTwe1KlbgwXvWZala4Zm5z48zBcvuLIPpkVqp00POblSuyvACQQZIDApOpihps4D+js10NbZ+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtPwyE17w23Xtepx41hpf1jPV+4WEloaCDZ/u/gOBJE=;
 b=K0gAWNdrNp59Xkv6LArah6Byvk4SJw6sPyJ6kk3G0dXI9SGEBMHc9FrmUBkZ3iQW1coBJn2fEF7djSDMCpLfJzUAI+8KYAsFYPMO3/NE/SGFtoqRB9DL1BY+wnAmADeFg0gQV/u3X6qoNzu+M9Kuf57H57SpnNAhs0rXalntgee6ygIuvZ14zuwRk+b3Boai8pTjLKMqTSbTUb96542dF9NMdktqN0GbG7tuYx7apQgIU0VwwfquYp0jjzb2CQmWouXG78BaVTLrQBZnfaAqB69bFj9nSWcM4JfhxjmnENcZA2mt2AhLEgn9IaEJ/S19vQXyCRY5NyVowPSy3u8maQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtPwyE17w23Xtepx41hpf1jPV+4WEloaCDZ/u/gOBJE=;
 b=QLje5vTvGXjqB9Z/vM5fs0kZw3xZLUoM+4els9ImX/ngHmWtRd4bJGYeHIvb4HbMzG1X/TU6+LPiN/Lp58rF9SKA5zdTl1XacQxHvyob3xlkPDCcMPQhaO8XJUe48Ej82xVF0AosIgbS0oJk8CqVvXJ3EV2p0AU3iilVgyt/6iU=
Received: from DM6PR02MB4140.namprd02.prod.outlook.com (2603:10b6:5:97::21) by
 DM5PR02MB3720.namprd02.prod.outlook.com (2603:10b6:4:b2::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21; Thu, 9 Jul 2020 11:38:51 +0000
Received: from DM6PR02MB4140.namprd02.prod.outlook.com
 ([fe80::7885:10b5:7055:2ae8]) by DM6PR02MB4140.namprd02.prod.outlook.com
 ([fe80::7885:10b5:7055:2ae8%7]) with mapi id 15.20.3153.030; Thu, 9 Jul 2020
 11:38:51 +0000
From: Dragan Cvetic <draganc@xilinx.com>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 14/20] Documentation: misc/xilinx_sdfec: eliminate
 duplicated word
Thread-Topic: [PATCH 14/20] Documentation: misc/xilinx_sdfec: eliminate
 duplicated word
Thread-Index: AQHWVIl01j2WA8nZ+0qkTNSLOgAd4qj/IPtQ
Date: Thu, 9 Jul 2020 11:38:51 +0000
Message-ID: <DM6PR02MB4140D40A07411B0FA50A3913CB640@DM6PR02MB4140.namprd02.prod.outlook.com>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-15-rdunlap@infradead.org>
In-Reply-To: <20200707180414.10467-15-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.80.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b99db2df-7741-4c88-9845-08d823fca72b
x-ms-traffictypediagnostic: DM5PR02MB3720:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR02MB372060AA596D7BF97137A8F8CB640@DM5PR02MB3720.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qR+CT0TDr1hEwjC4JBQRtqtPfgA/sC5N4CmnJYREhBvJ7X7HQ9viUvQ2nEScuw7SMhOdq2b15tm6YR7ClyT2nWwe7ZiHimM/AIloSvl2mP/iWO7q7DVePjI17TVzEBMEv+fIcOuZqWNpJD53uSnc5Z03pFtdidFyt8lsJ0bKHhBUyE/P52fcteYiVnZhVxxqj85X6/jp7h8/A9hLCqfQwYGa/RlrFyIxrL98hMb4eYNyrppxEjO8QWYCEMulD5kMKfW6TWWcLJiqcHzYTj//98FU4wXM23GNqc2ypvg0Y79z6eSqAWQlICsaJTx2Z9kV1EMMSIao871x01XPoN9pPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR02MB4140.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(396003)(136003)(376002)(39860400002)(6506007)(86362001)(71200400001)(4326008)(26005)(55016002)(52536014)(7696005)(186003)(64756008)(66556008)(66476007)(66446008)(76116006)(66946007)(5660300002)(8676002)(7366002)(7406005)(7416002)(2906002)(53546011)(83380400001)(316002)(110136005)(54906003)(33656002)(478600001)(8936002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: yxDppt/H2ZM0nUizdJqLLgKHlViRAEOvc1OPAK+znjO+8f1XTKm7UWh30LQuj3xgaq7XNAbkoc1zF/IYumIg11lPBqod9GoYzN4x9WfO8oLqW1+Gd1YvC/wmpEx7tAcGq2i4l0fu+0mWZ3IRssqU7z0CQJibKFmWnM1L7GjAiAI3xvL+m8NYL9ePm0UaP8x7IbFpLqNolvIe9m7NgFD0MeCohqAkTrwuv5rxAvTan8Ca1fXRH2BbkwpX/lIifahd5/QpAUB4HsOlx4fPVl1Ijsqukd3nPh40irZfDqVI3BY8dy5jhc2Yza+ZjI7tM+IrKPLKOVJ0wokB6hs5JSzVRZQHIdDRalAS5yG1DpPrpqZXLtyd32kI70aTL0zoy1eOCayTjV6Mr6vIHMX5LeG1Edoj7QSYaF9kwwZGrYC/i/wGoNCP7N/wILfPhu6HDzUeL/3pZpKajfyTJ8Mt4zUQuJw/WMj2mZyP6L3x0mMHX70kBDp0OVOYnY2PLd3jqQng
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB4140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99db2df-7741-4c88-9845-08d823fca72b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 11:38:51.4539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zIfGVOCbBOp1mCjikYmTLat4R47fO8DM122rmCjbuAmLOkNMkzeszU/83YLFYmhoPdnI4mpER/bRNJrN1/HL/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3720
X-Mailman-Approved-At: Thu, 09 Jul 2020 22:23:07 +1000
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 "linux-mm@vger.kernel.org" <linux-mm@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Douglas Anderson <dianders@chromium.org>,
 Wolfram Sang <wsa@kernel.org>, Derek Kiernan <dkiernan@xilinx.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jason Wessel <jason.wessel@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> -----Original Message-----
> From: Randy Dunlap <rdunlap@infradead.org>
> Sent: Tuesday 7 July 2020 19:04
> To: linux-kernel@vger.kernel.org
> Cc: Randy Dunlap <rdunlap@infradead.org>; Jonathan Corbet <corbet@lwn.net=
>; linux-doc@vger.kernel.org; linux-
> mm@vger.kernel.org; Mike Rapoport <rppt@kernel.org>; Jens Axboe <axboe@ke=
rnel.dk>; linux-block@vger.kernel.org; Jason
> Wessel <jason.wessel@windriver.com>; Daniel Thompson <daniel.thompson@lin=
aro.org>; Douglas Anderson
> <dianders@chromium.org>; kgdb-bugreport@lists.sourceforge.net; Wu Hao <ha=
o.wu@intel.com>; linux-fpga@vger.kernel.org;
> James Wang <james.qian.wang@arm.com>; Liviu Dudau <liviu.dudau@arm.com>; =
Mihail Atanassov <mihail.atanassov@arm.com>;
> Mali DP Maintainers <malidp@foss.arm.com>; David Airlie <airlied@linux.ie=
>; Daniel Vetter <daniel@ffwll.ch>; dri-
> devel@lists.freedesktop.org; Srinivas Pandruvada <srinivas.pandruvada@lin=
ux.intel.com>; Jiri Kosina <jikos@kernel.org>; linux-
> input@vger.kernel.org; Wolfram Sang <wsa@kernel.org>; linux-i2c@vger.kern=
el.org; Masahiro Yamada <masahiroy@kernel.org>;
> Michal Marek <michal.lkml@markovi.net>; linux-kbuild@vger.kernel.org; Jac=
ek Anaszewski <jacek.anaszewski@gmail.com>; Pavel
> Machek <pavel@ucw.cz>; Dan Murphy <dmurphy@ti.com>; linux-leds@vger.kerne=
l.org; Dan Williams <dan.j.williams@intel.com>;
> Paul Cercueil <paul@crapouillou.net>; Thomas Bogendoerfer <tsbogend@alpha=
.franken.de>; linux-mips@vger.kernel.org; Derek
> Kiernan <dkiernan@xilinx.com>; Dragan Cvetic <draganc@xilinx.com>; Michae=
l Ellerman <mpe@ellerman.id.au>; Benjamin
> Herrenschmidt <benh@kernel.crashing.org>; Paul Mackerras <paulus@samba.or=
g>; linuxppc-dev@lists.ozlabs.org; Tony Krowiak
> <akrowiak@linux.ibm.com>; Pierre Morel <pmorel@linux.ibm.com>; Halil Pasi=
c <pasic@linux.ibm.com>; linux-s390@vger.kernel.org;
> Matthew Wilcox <willy@infradead.org>; Hannes Reinecke <hare@suse.com>; li=
nux-scsi@vger.kernel.org; James E.J. Bottomley
> <jejb@linux.ibm.com>; Martin K. Petersen <martin.petersen@oracle.com>; Ja=
rkko Sakkinen <jarkko.sakkinen@linux.intel.com>;
> Mimi Zohar <zohar@linux.ibm.com>; linux-integrity@vger.kernel.org; keyrin=
gs@vger.kernel.org; Paolo Bonzini
> <pbonzini@redhat.com>; kvm@vger.kernel.org; Andrew Morton <akpm@linux-fou=
ndation.org>
> Subject: [PATCH 14/20] Documentation: misc/xilinx_sdfec: eliminate duplic=
ated word
>=20
> Drop the doubled word "the".
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Derek Kiernan <derek.kiernan@xilinx.com>
> Cc: Dragan Cvetic <dragan.cvetic@xilinx.com>
> ---
>  Documentation/misc-devices/xilinx_sdfec.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> --- linux-next-20200701.orig/Documentation/misc-devices/xilinx_sdfec.rst
> +++ linux-next-20200701/Documentation/misc-devices/xilinx_sdfec.rst
> @@ -78,7 +78,7 @@ application interfaces:
>    - open: Implements restriction that only a single file descriptor can =
be open per SD-FEC instance at any time
>    - release: Allows another file descriptor to be open, that is after cu=
rrent file descriptor is closed
>    - poll: Provides a method to monitor for SD-FEC Error events
> -  - unlocked_ioctl: Provides the the following ioctl commands that allow=
s the application configure the SD-FEC core:
> +  - unlocked_ioctl: Provides the following ioctl commands that allows th=
e application configure the SD-FEC core:
>=20
>  		- :c:macro:`XSDFEC_START_DEV`
>  		- :c:macro:`XSDFEC_STOP_DEV`

Acked-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
Thanks Randy

Dragan
