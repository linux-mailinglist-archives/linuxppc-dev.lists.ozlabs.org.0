Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD239FEE2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 20:19:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzz692qf2z3btR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 04:19:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=emqobxey;
	dkim=pass (1024-bit key; unprotected) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-sharedspace-onmicrosoft-com header.b=yvouCQTO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=wdc.com
 (client-ip=68.232.141.245; helo=esa1.hgst.iphmx.com;
 envelope-from=prvs=78645c972=chaitanya.kulkarni@wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=emqobxey; 
 dkim=pass (1024-bit key;
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=yvouCQTO; 
 dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir;
 Wed, 09 Jun 2021 04:18:38 AEST
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzz5B3yZtz308R
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 04:18:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623176318; x=1654712318;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=NUqXPjNS1LbN13nGam5wfMXaPs9pNiTKPeD5At6Ld5c=;
 b=emqobxeynISzpMcP4eXxQUTZgyt52HGB/ftAG5CfhiyTfuZaMEx3lTGS
 MPA70QahFUd97jOngN0j5LTb5LZVLWpeo7L8U0u0Osbp/lvYp6IZivZug
 6L2SjVAi49nJwNDtJXxCkYm5S+QyEm2tOEEzXjuzpwXpdGcDKDYHeSkay
 mPcLa/eqYaw/5s51hI4XMb7dMy5FhHq8ZcdJZPShqhKyexemEH+UtZpIG
 +L+f937qmm0RqogRLLzw3gEsWTsv+54tNOFkiYrrerCc1RJKfxP2a8Zoy
 lorfVYg3FUdJ0g5P1WnXbrHb7YKw5Z6HD1rmG7HpyMvNBg3D/hk/e/Gcq A==;
IronPort-SDR: BzS6SJuUoXgk71uTJDIjDvtVlhSymqi5vTqGpIuIluZL3VpBo96wmsoIXEOxMZLa9mS68W1X9Y
 8o16lZGK6XEgQ0OlSjviuH2yMOtUPqr8VAF/9T6XnOiO/xgvsSZkygZWSql4AbVP3lxkLVSukd
 We9RhfZuWYClXeFSHmzaN30+7IylCEwcLeHaMQXeNxoahjjKNi2SOppsGcNY+fTPzgRiPxPUXS
 TRBLVCb2fZnOVkBBaivuh8b67dmr/yuz3+NzZhmqn35O3qcneiLBcMndATuUOQXNQ6uoJNYWQb
 Amo=
X-IronPort-AV: E=Sophos;i="5.83,259,1616428800"; d="scan'208";a="282615982"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 02:17:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFSIhE0Ur4yex1YqR0Sq0kEhgucoEy7ZyEt6xU/JbDSH4+pNBoSPD6icXPXL42qcYJeyqYKmF0QtQj30fV3ohObX//pL0xNr7kwlkWbQBjUPDsdgbXeU7ocRE9HoEhjw6Q/nLp4N25iqyqy+UrNWVVfoK1GCTk+gedqqSqbiGeetiXppbOrD+zxQoK9LAjjaoyc5ZBvIOE9nel2AL/9kr4JJbTDgee1lHRbGQmmgydoUsGhliPNjPhi9tNYKEwSxSQhYCKSuNGhSaKLXgUWP0Uto1geALqvGLtpfolB5khtBqUU3RePYK1IBQMwjaNeIPh60yqaYl8JodNVswDfAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUqXPjNS1LbN13nGam5wfMXaPs9pNiTKPeD5At6Ld5c=;
 b=kBnrtMtI7v6W1N+0ZrocHqJfZHEEsknhcNTCPJmKnuuErI4FGqpsbDwC+4iu4jR8+fh/iajNfOb11dy+KDf3LIpdgc7ZK209azeFz0VZDmRlQyfzVzqFOB0ZWUnBP33Frt1sSeMYiAcKJz9Wp04DHkZGAbLRgBqk2C67AAn29LN2xsj2d0WFd0fnDPy1wJfN31p9mbAXg6bVCbF86pfF18Q5BgxeH76ukqqqZ7+eTmvcKgwyB42Ew/17TxtzImxxTK4k9N6eCmyyooeUPRJfm43FEvXP+0vL3NComdLABI+T7lauA05yJV5K2Sp9sgUbMf49/duvWbQfduAFwGgUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUqXPjNS1LbN13nGam5wfMXaPs9pNiTKPeD5At6Ld5c=;
 b=yvouCQTOpw/Vjk1ja7dYAvafm4Hb1UfPF8ScIoB/qgIBPMXr9c7sqX6+rC4Y9934wqJkkoSPmanRLKs7x5hhav7Q/HUdKnetAHz75c+SLbPuD24OPWNYpUJRo7BcTyy7quI5Pb+oDCiGEnu4CpeqEym37S5mOtIvMigJSSjcaRQ=
Received: from DM6PR04MB4972.namprd04.prod.outlook.com (2603:10b6:5:fc::10) by
 DM6PR04MB6282.namprd04.prod.outlook.com (2603:10b6:5:1ec::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20; Tue, 8 Jun 2021 18:17:25 +0000
Received: from DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f]) by DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 18:17:25 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 01/16] mm: use kmap_local_page in memzero_page
Thread-Topic: [PATCH 01/16] mm: use kmap_local_page in memzero_page
Thread-Index: AQHXXIBI2JSYXt6T1kCEOMTspmhp2A==
Date: Tue, 8 Jun 2021 18:17:25 +0000
Message-ID: <DM6PR04MB4972264CC608AB317399E61286379@DM6PR04MB4972.namprd04.prod.outlook.com>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43dfdd29-9d11-4890-a2e6-08d92aa9ab01
x-ms-traffictypediagnostic: DM6PR04MB6282:
x-microsoft-antispam-prvs: <DM6PR04MB6282DAB984B76ED96C63DBFE86379@DM6PR04MB6282.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ruaS8I+RUu2n9DmKOGmjVOd6HxJmTpIB4YOG8Ji4gGielpJqXh40A3JPqQpCpXrCr3OHEQSNAVuM2lMgKe1oMx0zXlNieHd+DrUQfO0XhoQwJtdPMl8vC4M8dDVLILkL3yhE24R3jYGVPtWxnI2sepWzx1itbqrf9BcYu0KNQyoGV80OXJ2anz9yJI3uoYF0+xqsYq0QcxQVuoisRumKY9cGuc3ou30/Iw8IxkoArfsPfok9+BCT+bZFS0L8ZcsNoP7h5k6o6u3BD7leCMjz3OzaIINxDbAQC0TGQ9ccttJ6y1zDduX/sxgMXE/lWRrSG6PWeTJd/0X8wlSdTvK4FALfJQ9d9u29TBIJBZC3iNQD/OZwMzA+1EEEGk9EnnP0cS2CE7c8csDVbYQO2bogW5Jl2e1VqVF3oR6fK3VXUcAmJr0L8L8joLSxv3Jwgy5EmTP+AqYndZdsfPJ0VIJa7AJ9Kwdnr4OpB4L3o03WOZOQAYqO35pskrMfdbg5Lpjv8aH4/qc+HAyMqtXWGfaXMA/omSEjDaq/ypMzheriLCu6+dxOCsQPmCcBDIe/SiHYzAAxxdvrS31zsJlFU31/RF31sA35YjOG4viMFtVjBU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB4972.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(66946007)(91956017)(76116006)(52536014)(7416002)(86362001)(558084003)(66556008)(33656002)(64756008)(54906003)(4326008)(66476007)(66446008)(38100700002)(5660300002)(316002)(110136005)(122000001)(6506007)(8936002)(9686003)(7696005)(55016002)(26005)(2906002)(478600001)(53546011)(8676002)(71200400001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KWu9ec+Btv+txWazbaPJ60igZinu79R1gzfg4g+t1hdCEIwwkjPMDWpaS8o3?=
 =?us-ascii?Q?waD0W5/nnjhvkxBYNen1UrZTljvjUzi/mGzon6traq4UuCngSwdEwjQ1si9E?=
 =?us-ascii?Q?PXhjpKzuJtyQ7c86DU1zgMufCwgvnnjdQJq9/CcYWUMymgchQGV4laDLT0N7?=
 =?us-ascii?Q?IkGQ7iwoIdULJBE871RfmKHomfKpWtgUfHGf4t1uHWmvPcHcSjdwdpM9fpUh?=
 =?us-ascii?Q?uz8l39qH6gpXYXeVcv5zt/GEhOioT1+pAQda23hlNlmrrbr4hp2ZMAk/zm7E?=
 =?us-ascii?Q?xAXtHKf3iBIbcEVIsNdL3TKfq4iQLKoRdM0YSz6hWkW5apT0viLaaouCRaxh?=
 =?us-ascii?Q?yh9HoxOWWJNcdWixg7EtR72L0o/UhMNuvGxePCJaRLltQO6kaokANBavthjb?=
 =?us-ascii?Q?fxNo2rimmBHo4uhHKjkzyrImQie5i1XwOcG/xvr3yG7MxeHZ1H0cLJOM8DNb?=
 =?us-ascii?Q?UVBsHVNOHauDx57kpg3J4A7wg5nejASM0RV/+lMsHM5EJp47+tAXAkju6esr?=
 =?us-ascii?Q?e6VanfyOCDCm5ta4MxWwyhrfGORhen5cANFz3rXXIRIpm9eZ4GAQDaS5KcYS?=
 =?us-ascii?Q?JvIFc5X3HcJmqG6+5r6o0WQpZTLOXQHmBWkKVhlnRc6SLaXHnOND4olh0XLg?=
 =?us-ascii?Q?VRhH2IfTdWLkAKEGZ3NA5TEW0AL3eZUh32HFMS2YQH+BSlJMenTNgDzFh3qw?=
 =?us-ascii?Q?Ve3BOZ6R0gUBlgNpzxjQyXJYw7SndvLxIemc84WT09pZV1E5fMwZEhEJEyz+?=
 =?us-ascii?Q?VJCJv8/KDYneWgHQI5AJOvbkPprxNPpZTfbPJzHSIVukbpg1AwgmbNFUcrss?=
 =?us-ascii?Q?2AEJwq6AzxrNJUI8w+1mXhw3V30u4opwe/059eLHkpS1Qq6v6Rpj+PFjWzfs?=
 =?us-ascii?Q?Ehjlt4sqk3HqNcKdjyY/TAKSXDS0SeggLRDCtwy8YGC0JdGtWlMmES7Z3S3g?=
 =?us-ascii?Q?sRz8k6H7uoWel+sZanGdnI7ODgnsix14kMeKy4Ya+yq2PtjHRRcwHevwnDzI?=
 =?us-ascii?Q?YxnRVflMOKIszEkpVYSpD12l7ZzpYH1gMbY6OqemS+F6kAY+EGAX5IUAl6te?=
 =?us-ascii?Q?rGfdUleJ6qLjcQSJ/FsJiKVUUUcI/U4OtbYMIRcxdEbs0U35u1W0JD2hqALP?=
 =?us-ascii?Q?0HNl7C0vujnCKO6OiBKccHs8iwpSkbZIALxJ/qvbQTqVgGtvwwbV4+BXpAUm?=
 =?us-ascii?Q?JeBRUcY2j/rqdnte0ppfDjOuWjpe6GuEYAoez/VmKP8/P8zLo1mAD288A32F?=
 =?us-ascii?Q?zZeIrSS9tOuf50BhMkDPQXj7kD9ezEEADin+qkxAOXtBoPp5lXNn4ArVpadP?=
 =?us-ascii?Q?r07+8XZWMICbON1JhAg3TUcm?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4972.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43dfdd29-9d11-4890-a2e6-08d92aa9ab01
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 18:17:25.4237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qAbO1QtoyijiRZ3KzjzmMBpSQJCTsiRuFkfAALgqjMzccajpDKEYvTLXNOH2bkqe2gO2SasHapjav/XGW9traQb2ZjE301Xf/XHRmKJeRF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6282
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/8/21 09:06, Christoph Hellwig wrote:=0A=
> No need for kmap_atomic here.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
=0A=
=0A=
