Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E081A4C98
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 01:19:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zYqt3c1DzDqfb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 09:19:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.236.125;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=mikelley@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=Qxl2bm0d; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2125.outbound.protection.outlook.com [40.107.236.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zVJW1pVkzDqvh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 06:40:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aw2ZeqTFUqbJByz0S3f+6uLIOSNLHFUDiomjjV8ua+GbcSaK+gCIn4rzEMQblmi5+p27h4GUw4uiopBnOVVX9NF96dKfST1HAj3iwUWIQPocJM11iN5419kd+NJLfqm22mKODVHV9E8h9Xx1bWh98JkLDhMtt2QrEwcaZKXZJQ92vpuV7g4Sf6THY+AU6ClalBZmqoGngult+UE5jVeQCHAIrkAl1PmjRgJF8448LC1xSDbNhlxVCqO/03Zr4K0Jyw2FeE3ALQQoB8xB9538jzVdcEveIiE/vBJFT3x9WasrphlGE0CwSH00gAWtB8cyb3pXbca8HnsVty2/oIl62A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxI15cV5ZOZn85Zvvz8N2nkqZ/SNnDxKOx5Qvn0sK2o=;
 b=A47fAhLmDhyOTdxby1MGYw7lMu+/zehb1fSTvG6tWqxGT0smEbuExsi1JXevWz+15txFJ877FRBDv7HbdzixP7BHla7e626Q7OHVEG4d5Djuzc4NnO4y498+7s10inuqzm+TDrMH/6McVYaecGI7O6fFeiPI/055EMy6QoC6DpLuRvs2hghd0t3lo2+jhFlCQ+TYACq6kgu42PY+ehLpabQzhm4re+3rnJAZz3USl8Ae6yDJO26ytRbOyuhnH1Ogq5jVxGw8UquN/6+Bm6Wjky8pxY5pMpFZAZgPVLUSQRuyoHhCrB6jKFt7XoocAJ2z+82cZkA07w3Y6zPaJkhptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxI15cV5ZOZn85Zvvz8N2nkqZ/SNnDxKOx5Qvn0sK2o=;
 b=Qxl2bm0d63GzV4vCOvZU6vbiYCA0bwSsF69cDss6OAfBrKUYZ4psysR9PjJR7Inm0DeexkrLFMrLZVpYv9b1zo4484fp9XeXTAbycifTYPqclAPiFdGAo0fCBJfa0QakGSG7iKoJlNjc9BDcyIM/G4VgZGajUOvMUeZ66Xemzck=
Received: from DM5PR2101MB1047.namprd21.prod.outlook.com (2603:10b6:4:9e::16)
 by DM5PR2101MB1110.namprd21.prod.outlook.com (2603:10b6:4:a5::39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.3; Fri, 10 Apr
 2020 20:40:21 +0000
Received: from DM5PR2101MB1047.namprd21.prod.outlook.com
 ([fe80::f54c:68f0:35cd:d3a2]) by DM5PR2101MB1047.namprd21.prod.outlook.com
 ([fe80::f54c:68f0:35cd:d3a2%9]) with mapi id 15.20.2921.009; Fri, 10 Apr 2020
 20:40:21 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, 
 KY Srinivasan <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 "x86@kernel.org" <x86@kernel.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: RE: [PATCH 01/28] x86/hyperv: use vmalloc_exec for the hypercall page
Thread-Topic: [PATCH 01/28] x86/hyperv: use vmalloc_exec for the hypercall page
Thread-Index: AQHWDZ0/CoajD68QRkqSIM4FKSNiaKhy1QmA
Date: Fri, 10 Apr 2020 20:40:21 +0000
Message-ID: <DM5PR2101MB1047BD681D8EDD0797DD1E28D7DE0@DM5PR2101MB1047.namprd21.prod.outlook.com>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-2-hch@lst.de>
In-Reply-To: <20200408115926.1467567-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-04-10T20:40:19.1960251Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=1dcf4db3-748e-409d-8f7c-447fe27e9023;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bd91a062-1bf1-46bf-b911-08d7dd8f638d
x-ms-traffictypediagnostic: DM5PR2101MB1110:|DM5PR2101MB1110:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR2101MB1110D1A5D643D6374EEBE4D0D7DE0@DM5PR2101MB1110.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 0369E8196C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR2101MB1047.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(8676002)(86362001)(8936002)(66476007)(8990500004)(7696005)(66946007)(71200400001)(81156014)(66446008)(54906003)(66556008)(64756008)(10290500003)(478600001)(7416002)(110136005)(316002)(76116006)(6506007)(33656002)(4326008)(82950400001)(55016002)(52536014)(4744005)(186003)(2906002)(82960400001)(26005)(9686003)(5660300002)(921003)(1121003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iPk50ujolCJd83GkVU8Q/GdEQxRbFm+HhFS2g3hzlQ3M61EOAzDmsYU7m+RWnkrXocM+HsEjPf9is5nPPFthji73D5Xp5Ed8eQyiIjms6PXaV8hi6LIA+PzuVCxyv0tzM2KSRI8J/0UN2ef2n21k5qp4IcuX/HwC7OLLVaioSzeDh2RPdp+6oVJPuNY1Itb9/b3+mtyFMXAv6vWk/8b0hzT6pxcQhjBond3LPQ762DrMG18Jqi1HfvEDKIUSjdDN6PxLmZy3+sgwx39EITjhSVpIS/Sdm7KqyU64jRGCJYS9XNxNNM8hm9BXfXXtPuJCxfN586xwrihjuR3wrgaZWMcKYjExOmUdG3E8n/zlNCcJDhmejfnWkIjNBnlGtLQI64Ihd+nbMzFuwtQW8BVNHqk2VN6FvWOW6pxiEn8+pQrlDp0oZSfGe81Lm40U0WueJkDGmRR7yiZtordaiODqu0t0ONDJn8+LsWdmzwJjkYfoH2/geWTzCwsOicrdobNi
x-ms-exchange-antispam-messagedata: +tXqJ9SngzkET2ajAkgQpDK07e5qYoklVTvFxbVst2EBqO3DkVFzhGNkyeSOIorrnaoTQMUGzbAGKw+XKL0lj/sUP5klkB6enTMgGsrq59DD/x3W6slha3C2qb10maI+10LsOHRcRWru3TrPfIlLUg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd91a062-1bf1-46bf-b911-08d7dd8f638d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2020 20:40:21.4349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZRCiv8Z7T3QM9EeSCGX8Y25Y1aZn3ejXpj1RdpMAAnRt2CHN5wCBdH+ON5JKRobDX7dRyxf/GdrzMHDy/MBMaoDe+dfn0eOaWJekJQejI5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR2101MB1110
X-Mailman-Approved-At: Sat, 11 Apr 2020 09:15:33 +1000
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christoph Hellwig <hch@lst.de> Sent: Wednesday, April 8, 2020 4:59 AM
>=20
> Use the designated helper for allocating executable kernel memory, and
> remove the now unused PAGE_KERNEL_RX define.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/x86/hyperv/hv_init.c            | 2 +-
>  arch/x86/include/asm/pgtable_types.h | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
>=20

Reviewed-by: Michael Kelley <mikelley@microsoft.com>
