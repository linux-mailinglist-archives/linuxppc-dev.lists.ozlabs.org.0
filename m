Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCE239FEEE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 20:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzz7S1Bh2z3cCS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 04:20:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=rIWyvsmx;
	dkim=pass (1024-bit key; unprotected) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-sharedspace-onmicrosoft-com header.b=LhrtLgjU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=wdc.com
 (client-ip=216.71.154.45; helo=esa6.hgst.iphmx.com;
 envelope-from=prvs=78645c972=chaitanya.kulkarni@wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=rIWyvsmx; 
 dkim=pass (1024-bit key;
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=LhrtLgjU; 
 dkim-atps=neutral
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzz6S4Xjhz3c30
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 04:19:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623176384; x=1654712384;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Mqvu9teWe/LYnrEBNhrwBh4n/xRSJC2MjsCKTowLjUs=;
 b=rIWyvsmx/iCo9cKY1PCY6WYav8jD4YgwcNAb2ebYj6I1QThCcdf3i9ox
 mQAf39BYosBPu0dWMLZoYTJ1nlasLYhXaApceL+qnSNwLFzN2bd4mJh0+
 c8NzqiqHjBonzg/4AeoM0BpkvbWfhcLVZDygdo1q+pARABaDZFz0OT1H1
 xjNpjEFmJUPpuWKBTZYHAXMg1SuyimGhRft6x4th1yRfh9qjMVFHP9k6D
 z0oQIuhW0IwReDy7sDSIzWmp+gi2dAQvl3FbmqauuRu71YdzkGx+A0gZ+
 aExolTV9VdulO3pq074NzSXeBcFvuxSdQbt8GMu8YIT9d25XomxeuyLYS A==;
IronPort-SDR: +fHlzF2yXWplSemJ6dhsII8kPzEu/8ZDHsX2UrS1Yj+P4+ghpak9VdbBulhYxHRrw5fH0lC4M7
 nrUWCFl6OftbV4u2ppVxOeZrROtEcupG67NOZiPpXptDMJwDU4coXWzGpTCS3Wf0kG6Yj9AnXw
 k5/DqCcKJOglqAwQrwCu7neMIB684TNlEzPhdyH1U3B7StR9wDcpd5XUzrqwMbKv70Tcyb8OkW
 MDyV8ytJt4s3zlu4Mc1mSjCNfthBWo7WRaeCAs+2fQisBjNcb7dQ9eYDeLSJml4W0eFakaqAeH
 /pY=
X-IronPort-AV: E=Sophos;i="5.83,259,1616428800"; d="scan'208";a="171733800"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 02:19:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdZmdqNN4Sazi/+fbjBk6lrFHiBmfu00l5Rp5ZeqdtoRgeoDNynWol/giYVd053YlTYBwPKY3FzU2792hWCSTqfAK6n+jzkmABA49WFIvHKsP2EUCRixDNr/qwyCGT3Ctx0hU1ssUpJx4ajaPb7NBBYw1Ougfa+6RZ/MNRF16TEDQyAc0vc5mo4zMiYAxwT3dB90ws8v9py9Nwh6HSUVebZvqdeIrARHsLL3YGw5rNbld++AiHkz8S7lniEfqoUX2Bhn4mN8zjIHtSYiuK7NzndtsNN5ETxpHlFsW5BmkktUIXrjE3W4zqQll9+FJ4u17XRne52fea1p43ojaOrv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mqvu9teWe/LYnrEBNhrwBh4n/xRSJC2MjsCKTowLjUs=;
 b=QVeyZcWNufftwgRpjxYAivsNu2hWP/26oo8o2IQgD3xi6k6SeMae3Fig/Mh9nFa5cOwFsEnRZ51SQR/11FEiK5zl+5eoWD8SSWOVrJUOmsNzuB0DwJf3TINRofx7Epd+gN6QomV1BfVy33sXDDXH8NifnMfz5tNMyDEOrxK+pmrnIEzaZsw/ktIVPbwOB+SuwLv6uaFgFnTm2wTg9wctAjogpQqhl2QwpBEFN88UmNO7/zIJ1wODTQLb7uWHZ0UKARoGvwkcr2B1AwiVQnNWwRmn4xJArLklDq8o7rsD+bhu0ADZHspKvt06jAVF3L/yLTVOGRtlBFD0ECeFC2Gw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mqvu9teWe/LYnrEBNhrwBh4n/xRSJC2MjsCKTowLjUs=;
 b=LhrtLgjUJluknOurOZJLkPmuA+KBqAmiEeZrgAn2BOFFUUAnoeukr9oDx8uWFUBH3Q6BZBCzNIGXBLH58TnO+IA3iad8aXpuvlslHb5jsJtxKDzLJER9dvJ/i728KCT05+0qg2yJn1ry9qrcZ0A9a80wukeHmhg4l9pMNpENCVM=
Received: from DM6PR04MB4972.namprd04.prod.outlook.com (2603:10b6:5:fc::10) by
 DM6PR04MB6282.namprd04.prod.outlook.com (2603:10b6:5:1ec::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20; Tue, 8 Jun 2021 18:19:37 +0000
Received: from DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f]) by DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 18:19:37 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 06/16] block: use memzero_page in zero_fill_bio
Thread-Topic: [PATCH 06/16] block: use memzero_page in zero_fill_bio
Thread-Index: AQHXXIBUmy2U+nAl70mrg5B0bpc0fw==
Date: Tue, 8 Jun 2021 18:19:37 +0000
Message-ID: <DM6PR04MB4972C1D2BDAC6DD3E58078DE86379@DM6PR04MB4972.namprd04.prod.outlook.com>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-7-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d24778ef-bfcf-4314-b542-08d92aa9f9bf
x-ms-traffictypediagnostic: DM6PR04MB6282:
x-microsoft-antispam-prvs: <DM6PR04MB62824F83457091758F77CD2A86379@DM6PR04MB6282.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 85OJgdQxhcDjEF7qO1pz2Zn2kqmwgjT+IuMQgPALiNTP9UGRnLhXQ9de405OPeiL89dVbw3+ZZ8hlsnVktJ0uc8PbGRPHSSr42wqujzy+tvUtCdKhffQgb58qsUf/kg/9V+xNGf+OQ8QY3arFkNYveDO/8sp02ajQs5DBNCLa9dD6FMy9OYcC3kPEfLpUyzXznr+Hcno2uUGp0V9Sl/Y4Te8YqgxXxt4+/b3AfsOwkwQpJAGoK/V8EhGj8UlH2K+CA+kHgecBo+5fd5yNAT8W79Sjvq8j4cDtG0axNL5C1FGY2ERnH3vfaB6qTz2IQv0hhJyBp5oLxqSgzu/EYYo+M7zDOaKBPr4cFuF1xuPmp9jgqdJVav6dqydikwWzXjEHtxtNRwNs9qHLH9Fq574YMtZ2wzYDOPDU4M3//0SdCXJ31eXe5M2muybVlXiyt5UawroDyrwmhIhAp2IzvSIBK0fVt5yngZ47qyQwgKFmRiMYutu3p9b7AoCJglYjS8NAlLZjSGYgX0+UI04fxOCToXI8jGWXBp5R917gVjSPQMU0wAHLwL7feQVqHyzml1pkleRc1mt8l2thRQSl7T4CsWJRKGtgfEzqpU7aRJlHRg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB4972.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(66946007)(91956017)(76116006)(52536014)(7416002)(86362001)(558084003)(66556008)(33656002)(64756008)(54906003)(4326008)(66476007)(66446008)(38100700002)(5660300002)(316002)(110136005)(122000001)(6506007)(8936002)(9686003)(7696005)(55016002)(26005)(2906002)(478600001)(53546011)(8676002)(71200400001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hp3T8BSX3nBFvTSG1y6DETvLbLZFQT/eejvS6X8nIrU/5zstlFkj7epBQkAJ?=
 =?us-ascii?Q?6Jumm9kY90mHkPQP7cwQncXZYLmgiR45X/8oLCFuk66Eu9jcRoKWevaoRabv?=
 =?us-ascii?Q?DcRinoEysN8sSp1cg9zR5Mei+ySeXUTSvoow6o2tX+88H7izO0Kbl/KfAxId?=
 =?us-ascii?Q?XzgT7CLTEU7psACbLDWrVz2wn9h5qfv/Zm3Rfwox1zXIRFRThdL97g+DFP2c?=
 =?us-ascii?Q?fWrCuae0XvdHquW425TwgDdARELsbikFpzj960cJhCBcgGnFcUmgAUpglRwJ?=
 =?us-ascii?Q?VUkPDA/z1Sgr3mfDThmze0ngnQd1d6g+wrhVifaR9mzKJU3Q5fOzDXtI4rYQ?=
 =?us-ascii?Q?K9loksHh7zNu/zzsr2VaFkkcxz95Hkq+pU9h8+vSnm8/tB3hB99lZnHGXafv?=
 =?us-ascii?Q?tPE6hSrLNs9T4Oq6uMqrS31f/e/aXTGB4V545rXMrWUAaSoeBil+KnXIlK1B?=
 =?us-ascii?Q?5+mw29meiZv6Uu2/wgVkcoSqQW94TRlL+fIZJf84kfWTwHJyQv7nvJ2JVNIR?=
 =?us-ascii?Q?YIU/47HSab/btdIJkPX+fq9zm4PsKCJRbG6V3ZF7lZGRB/YMbrMvQeGWgtEV?=
 =?us-ascii?Q?37loYDWp9M7TczEcCmeoJV50hZlzOgTh1hhl19v3dRmo0CLfO16VlxasZex5?=
 =?us-ascii?Q?MSEIVCUSOzxHzzm0cVrlMPx//xsS6Xh/+89j6Z3cmSCzgR0AA+L/yKPNleKQ?=
 =?us-ascii?Q?l/NjBIYKbL7E12n6Rz+R6H1hIRLuGX+5CamdHWkUlN8xB6ck5Bm60trhhzkH?=
 =?us-ascii?Q?FkEX/Jw99DJj9o74l1c5SAEeoA3Fe0Cnh8nge692sNfaOFiSlixzwMmwuS69?=
 =?us-ascii?Q?fTRcqbUbTu+fVGPSufwZjvi8OnrxmS22500XAkAuaYDlBKuopRHs2J8qU3no?=
 =?us-ascii?Q?10VIZUNa59dXYDV+Y8Y7vmKywikm3L+Ldj+DsW6pmOAjR/SqKqJbi9kB63vL?=
 =?us-ascii?Q?1r9g7uZvSliFnXqpmvBxqESibuv0uJmygsWxcWNzpiQ7BSmUM90Xzf8H5qTh?=
 =?us-ascii?Q?8P47zbrJ+ENviodj5AWeqNiYM5EqRFp8mW2HNkPtLxKRxpYsUsACfqkWh/fc?=
 =?us-ascii?Q?b3KFxN2/lbKncRnHFxTdGm4QP04QbMJmvKwZXgqYzqZ+TsJNt4wacWolm1Gp?=
 =?us-ascii?Q?Q8Lh1/mOXlm3de2S6xQBG4KGA4h/U5suw4in1OPCPe4CbDzyWRf07q5ILyAI?=
 =?us-ascii?Q?AXh19FYDOTsnFiNvxtBQMj5C1cDobYrqH1t2l2826OwKK0F5nMqan53qzqg/?=
 =?us-ascii?Q?s7kDlq4mt4pmFCjJ9Q4GOXFfN+ouGF3obqAgwEgW1TNNSYU+MLY1V35hx+XK?=
 =?us-ascii?Q?bw31S1ytSk0LLaGrzgiU4ei9?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4972.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24778ef-bfcf-4314-b542-08d92aa9f9bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 18:19:37.6176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y3zuJWkkTGQfBpuTohCAXSfWjyUQiBndJzbV130rtAGe2JLR6pb90J463LWJpWNl8ZGbFB2qGgvSh/2BeYvS7/Px52fLJrqaCs5fgc6HhPE=
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

On 6/8/21 09:07, Christoph Hellwig wrote:=0A=
> Use memzero_bvec to zero each segment in the bio instead of manually=0A=
> mapping and zeroing the data.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
=0A=
