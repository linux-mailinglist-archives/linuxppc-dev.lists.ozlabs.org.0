Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DCC39FF0E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 20:27:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzzH63j8Tz3bvv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 04:27:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=K/934Vzz;
	dkim=pass (1024-bit key; unprotected) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-sharedspace-onmicrosoft-com header.b=t756i6FJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=wdc.com
 (client-ip=68.232.141.245; helo=esa1.hgst.iphmx.com;
 envelope-from=prvs=78645c972=chaitanya.kulkarni@wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=K/934Vzz; 
 dkim=pass (1024-bit key;
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=t756i6FJ; 
 dkim-atps=neutral
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzzGb6zqlz2yXZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 04:26:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623176807; x=1654712807;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=FFLVRsCcASVsiIAsUT4PrF7+V5NBDaTHFgV0iJLcLK8=;
 b=K/934VzzeC3hj8oO3YdsYUlXsvlC3mdFXicakL19ePbnGJeiCxju02Ao
 W6Ps/4ZqCQhOP0FnPSRSBgxfK11ZuRtQUwu24/+8iFIFYCZ4W3Q1l6ykn
 FQTOFaIrSUeT4o6ieAMKRrPItSJDWvl8Sye7hhEUoSCIy3opCbmrJm0p/
 NO1HHdt2NXAnbpiPXn8aWmuCNSh1VhlfoTIYxspflBcp6RgnFJa4budtq
 pPY9Nu51M92IANYo/2/ejQJgA2wofdP99450JoO1tjoC9CCFPxQjmKX09
 q/nrU3cVylSAvDkoPbomYeA6nAKvpPIbiT1Tzy1MXl8HAMGK1+HTp40JC A==;
IronPort-SDR: MgdrN/n4VN9XcO/12eSiZOqpJuUtdxyuhoETkqenQngafsZRmj2VksIx6449F8xxFE8ORmIr50
 ULqGoRhvjzKLl5l3Qukq/3hiIri4cI/9HeRUDMTQdY3CbpChJ3zLFUF8QY76A8BN4RsoYYnuNv
 uouxKjCQW0vOXAzpCOpUJdT4/En0dIzBy4h11HBB+2Lo6uItQPeH5O2COWjYl6jchpMMhgD59K
 sW57JQS40AovUoO9vn4t9czQjtYezUw0eh73iqWdnNd4vZKmiRWKCg0PPa6f1+l5KbtCKzKTi4
 FlM=
X-IronPort-AV: E=Sophos;i="5.83,259,1616428800"; d="scan'208";a="282617504"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 02:26:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR2gZ04pjm1XWvE7RStrwIRylCwcRt/zpLNP/HhAd/LPnEzifTivyIx2D0lsUo0tGx8/NjRyKhaELUOR3B0osjZ9y2Qvzw4b+jY+ddjMEBgeQWKIylaqp24h0rZaEGhMciTnwk18JR4ctrmKqsAKpDTBxrcPCwcMuoG27QnIubYz72qBNzCykWwQGT8pzvA2DesFujTZw7ubF+8FYikpxAqC1Pd4qhEHh/GbXNYI4WnJB656suCSUnWW4f8FtE1LP66FKRb42ehMPmKI5wEdkDxyNWgkyv3VN21z0uwNgr/1hy7ZeJ/vjJDRlt3zyoCik4m5AlaE4x6+4ap4fUDXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFLVRsCcASVsiIAsUT4PrF7+V5NBDaTHFgV0iJLcLK8=;
 b=JzWc/JHcnVXDK26hztEdurFh3MtjJkTPV4vIgBeQ2ORJKkqRIWvUrc6frVpPqlOjQkMvGU2CNjai2u+iU9MW/lMK000hmkx3vpO0Cpcevr/Y1rai++llOMsQE26urm6XLfD4sAI9Rsmb92LgJDCwQia/GzpwIzO5TaDi1TsauWXUEAP+ZBMX4RWHClZGaAArytTDR1pmq8rCJZcCaC8d8H62MymdqgAroyYeHtuOEBBxHU13XAc1YgtIKuxTxpWpdIXOi/BPzZYyEHI+Kxku69V9svmLSuES0WFti3AyiF8lTQziOGVOwRn3KYODxt4KDKvS4ss1IFfCuCv1FpDHvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFLVRsCcASVsiIAsUT4PrF7+V5NBDaTHFgV0iJLcLK8=;
 b=t756i6FJ66QrkEw+s0rdsGol+Mu78Nv8OtPXpaUk9PQQ29jx6znue9JziTnu9kKs6zv910AlUmjqkWCUm6SvxgExAJ94+gfDK8Wo1OmDS5sWFrQvVI7U3+9tEJvRGra8+l6G+ZAV822uShGZNRo+ARWHJqGmpKI3RUHEAHE78mA=
Received: from DM6PR04MB4972.namprd04.prod.outlook.com (2603:10b6:5:fc::10) by
 DM6PR04MB6985.namprd04.prod.outlook.com (2603:10b6:5:244::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.25; Tue, 8 Jun 2021 18:26:43 +0000
Received: from DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f]) by DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 18:26:43 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 13/16] block: use memcpy_from_bvec in
 bio_copy_kern_endio_read
Thread-Topic: [PATCH 13/16] block: use memcpy_from_bvec in
 bio_copy_kern_endio_read
Thread-Index: AQHXXICXL+hXOI9ud0+HHe7YcVMXyQ==
Date: Tue, 8 Jun 2021 18:26:43 +0000
Message-ID: <DM6PR04MB497233791A3AC31473747A6486379@DM6PR04MB4972.namprd04.prod.outlook.com>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-14-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7598f6be-66d2-4267-2bcf-08d92aaaf78a
x-ms-traffictypediagnostic: DM6PR04MB6985:
x-microsoft-antispam-prvs: <DM6PR04MB69857E617DE6CF0F91EA7A3086379@DM6PR04MB6985.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UqeL8ruPKP5mrGsqFQx0hu4uWEudRopcMlI2MjLI8beyUV2yM0BsJCvR+70DZkhxUyY6QchdClbz7WM+BxdTfYZp/sAU2jb2V/0BxQutd4Z/3DcU1vsiNL+KA0JyyOHxsOX9n/DGtyDQwB7fcxodZRbm3JZ+hiNHK2BuFUIa4D5l22LxdB/wB6QUqHcsBjUr1DkEmwJ8DlPcJKgFhFRR+lz4oaHPu+sWr4/sqbd6v0CTO5aOwdhTSajavw2rHSy898q1eynfJUot6aAHUW6jPTWMXXoPkMhUfIpHu+OLlr6d2TX0uv2GtcyAhImI+2qxiLkHR74FONWZbxcNkZhDIpuBCAxB1oXWsqNzWptJFpCaV8+XLsVdF835QZpKL5sf+XNOKZmS1jIvOppowOXUOSeorZ1gyPLUpsCZBJYukXdETKNvhCMvJhQMnu4lVnolZINeHKwUyBIgd9Gg2rUUAhrBAPF3wUWH+XdEZcl0bIYmE9hROC2OLpo82GqsxbpnhSt7KUwJFphSGi/fml/p0bZv9wpJzAWvJ8h16DIRo1LV0EfL78H9m0zBd8cB7mmRoeEvEWaIinloLS93lZz87g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB4972.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(38100700002)(122000001)(5660300002)(9686003)(316002)(7416002)(186003)(4326008)(66476007)(91956017)(55016002)(66446008)(558084003)(64756008)(52536014)(478600001)(54906003)(66556008)(110136005)(53546011)(26005)(71200400001)(66946007)(86362001)(33656002)(8936002)(76116006)(8676002)(7696005)(6506007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4d6t/H0C1J7T08fFTJtfiLHJ8FXxyBRadbmBZQdDE7lEg+5gIlnvS+NEOTbN?=
 =?us-ascii?Q?7ql4nGMoFwLXAzUNX6kBp4GAfMZTEpoPDouIMxnjpUSWA6e5E4AI/6HaRGa5?=
 =?us-ascii?Q?zgv9dVIsdFv6/PwwHxtesfekgJdjcO5kSk8VHCAF8WZ6phbicGeBpP804lal?=
 =?us-ascii?Q?F6q12U4zFmithELhpQroIgsO5GebpkZ4dI/dJNvmC6Ch92jDMVOB7SCS6lDn?=
 =?us-ascii?Q?C9+FONAdoJJi3S8o1HHoF+eMu2F940ca4u2bvw4LqN1qBjR8AH/LOOJoF1Zb?=
 =?us-ascii?Q?cPemMPZzhwwOvQqenEMjMkydqF954yX1sFCOw4e2uGJvRZx1m9inYscLuKMy?=
 =?us-ascii?Q?03M8n5nUNJ6vbYgdBootbZz9TmZIYXzujNUiWtd9XfjQm+/YmBLc7auo0U7/?=
 =?us-ascii?Q?pCJsZigvZT73tad6thSqY6L+Xi3p9bVC4qZkBN1Lo+zn6Ja5wI1ZI3D3di0s?=
 =?us-ascii?Q?CHlxEHq+Vsj3ZNSBQjnQ326o8QXF6D14UB/UQXmTu7Of6cyNHuLo0ILfgflu?=
 =?us-ascii?Q?BBoSbIJY+Sj6i4rH0jt0c3nMoLgCN3WuGiFjURrlViwTu+EY9+HKCdZhjS/B?=
 =?us-ascii?Q?g3ZG30QNKcEbJvzkYkFZurVw5Nnovimg167CPCDK13VrKn+dEypYpd5eJzot?=
 =?us-ascii?Q?+v+JPkbOJztjOn3sV/x1F0gMUGz2D5HUHETEViyHOV67aiZVUl0mzGF7DxYW?=
 =?us-ascii?Q?FZyGmPDVtctdyp6ZbzY1tKgCd8+0U45x+Rj8wv1l3ClCOSuAJWvOE3nsfY7q?=
 =?us-ascii?Q?BKzyNBCNy0TyG64gfujY43KP4qYja3RFybr3q1bQt3WnIQbvV3xScYnwfWYA?=
 =?us-ascii?Q?9TyeTXeSkglKEGy0kS3EZ/VYhbg8pyLZ+PIkcuI0UOK05u3VzZwZAbcwnWzd?=
 =?us-ascii?Q?pXjTvDP4C2nXLbzo2jBDFY3IS+86iWP9rH5k7BljFAmIWMXJPCT1Ji71l9Kx?=
 =?us-ascii?Q?y/VcBGVdS6I2ZfF867F7lXL+FMeRzfmfij1IzPVSwVnZ76WRRE0KyIcCeCXi?=
 =?us-ascii?Q?Ala9vH748sGci52r/a4lGi6Q1BIUtK4012j1tZttV6/KbgIoOQvt11b/uwXI?=
 =?us-ascii?Q?H4leATUY+fzrWxE41CjjOGLQtMAWOLzeewiFyXrgvpbtl0j+C6W4GRWoKtay?=
 =?us-ascii?Q?uCIr10TEs+mJKoueqx4xuGkyuyjRhdwv/+bNqZsNeTKyuiPp+JEV99T0PMRM?=
 =?us-ascii?Q?RVWi2edMIPcURl3kGyg+TlMsrkwVeGeHIz6GIjQUU7NvO+X7M14subh3BwaH?=
 =?us-ascii?Q?65FeXTQnczKv1yMlLZo9ySfciObvMDGnlaq2OYsDnC+arZcJJwnHiXanXGKB?=
 =?us-ascii?Q?Tj+jRTTZJkjrJCNzIOzgZw46?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4972.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7598f6be-66d2-4267-2bcf-08d92aaaf78a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 18:26:43.3521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pWkE2rApkEXLlDjnRSuOKRlnpQAi0sgnOy2G3AuTbZU7BH/prbb1hbgUdpf8It9+mUWfEv9M8O6poBEA/YvA53b0qYWInRXQtmPkam0coqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6985
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

On 6/8/21 09:09, Christoph Hellwig wrote:=0A=
> Use memcpy_from_bvec instead of open coding the logic.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
