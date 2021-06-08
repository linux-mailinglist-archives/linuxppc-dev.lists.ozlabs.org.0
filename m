Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1C39FEE6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 20:19:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzz6j6SPDz3c7y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 04:19:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=g8ww+H3K;
	dkim=pass (1024-bit key; unprotected) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-sharedspace-onmicrosoft-com header.b=cn1gQ13I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=wdc.com
 (client-ip=216.71.153.141; helo=esa3.hgst.iphmx.com;
 envelope-from=prvs=78645c972=chaitanya.kulkarni@wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=g8ww+H3K; 
 dkim=pass (1024-bit key;
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=cn1gQ13I; 
 dkim-atps=neutral
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzz5d448Cz3bs1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 04:19:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623176340; x=1654712340;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=ukeCxdP2gZK9Ft56N1yDUz0wDl3aVHyPCcuavWijjvg=;
 b=g8ww+H3K5afwic5x4tfAeF8Mj8MPW/mZAD9odtQAYB9L4e34AtWxPGwj
 /kf+kiWd8Ofhm6r7rWHYS+wxhReGBug9aMyGGQxoH8pJQi2uA1OD+SJMv
 zdGCPyVvFGveStaAfWf3wTHZ6gBV2b8yyHbY+4om4j1b2X30CzuWWiXzA
 Lan4nF1QTz7NtfEbMscT0B75zLj6fwcQdcv4iODVFkhR3jzoeqJoQCXys
 fIXwc9I6Cvr5XyHo8QYbrIQ9GhDw+y0+bxoXPiqpnzQNweJt0Sgbc5QWn
 H5dxLPrH69yAifCwYsG1TkeyqAx0tDrQyhHJufDJt7BK4PJ8+RkHsPSz9 A==;
IronPort-SDR: aTGnzPY4efArGnJmTnYPjJwD8L2XqK4S11bzILJRAHQ5WruZ5y/+UDEz7YiOFiXtzs6bjgkwfS
 i6RlS6AvIss7zztYUIQc4Pl24pe7OpQ3IQanyHYvaRATTNCU3mHs1WlM4iFDk2YBrCTgHC5JH0
 XMI1rkSwVsjmUuekMQKBHH4ETDE/oNaV2NZhi1MZHpU4B/dq1FU8FpwQML9TnzJ6hPWkGkq/GB
 3G2D2LNmPu+Mno26H3MfCitN1CEHS8Q7OQvAoPyB3gqUljEfq5P0YKonjk3Zy3T/f3yWZM7EBs
 Tno=
X-IronPort-AV: E=Sophos;i="5.83,259,1616428800"; d="scan'208";a="175946872"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 02:18:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8XntCQDMzEEGYJpUUdtk28OxBqPbR17YpoeU4VT854NSpqrb+FXe2I2TShnYr80k4eu36HDQuwndP5b9/f4QDXHUw02TolsXXbm9ddLV8Cmc2dKKoWuDJ5XoQ0NbeeiuftglY6JJ6leGZ1lzyO/ZHE0gqAWGtX52tIsBc3naE86n7LzZOrQIFUTas60DKC6+X4jFw/OMLsv8aOqhRz2SbyEglBN1IEQyrdCZvodkdyyPcUpEx6SHT7Vmei197DJ7cCOziuuWvqZaUZvD+0UWRLfuMtsB+D9FlqdKm6mLZcfFewWUVWhYQwqimmTrOuBQ74ea2y+dDHjlpAz6cVyMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iB2UZonkXdsjBzdIQ+pQLUOVuOPnH9Xm+OEOr63XvI=;
 b=L2hkYSqXcUAKzuHQUKQP0z90FfJAjbjcc1AqNpKx1045tMy469vNJJAZEMR8Y5TdnbPP5UP2HNmJpr4lrAUqy/DxFC5gFRwUv4F5NwF3b7g2B69SOdVKqZB+YaX8b7RHRwcASYGfNATJmN0eWpyTgipmWmb7yHKDDkbRSZD09jYIJE1wll5y+nNwF9wBXh4F03W805uDxkPkDDODq0aHFcuftVWqOkZZkGU/kTd1iOdNHgJhNLVn4fkcGYzNjFPqt/+n4ZjefdafEJVFB4EQ8YSs1CpW8LKAkV1pQsC92XFP37Eb6GbLHWEcMEbePU+UtHu8A5liu6fRL9VrEWS9zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iB2UZonkXdsjBzdIQ+pQLUOVuOPnH9Xm+OEOr63XvI=;
 b=cn1gQ13IgokXw4JXiauZmy262fFzZqjktWcP3JjcFchu8Df8OA1nZesA+w/gxZVolrk0JRzNzAebL7SLWzns4IADY2uNVP4gQTJrNunRoRHmhfuBiVhKz+FKiqXtoR4cu05LYD+/vTVmHtLJYEsrhzjHlWQxIKBl1tnjJakIntM=
Received: from DM6PR04MB4972.namprd04.prod.outlook.com (2603:10b6:5:fc::10) by
 DM6PR04MB6282.namprd04.prod.outlook.com (2603:10b6:5:1ec::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20; Tue, 8 Jun 2021 18:18:56 +0000
Received: from DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f]) by DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 18:18:56 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 04/16] bvec: add a bvec_kmap_local helper
Thread-Topic: [PATCH 04/16] bvec: add a bvec_kmap_local helper
Thread-Index: AQHXXIBKuzXRKdg1xEu3AM/eJuOS8w==
Date: Tue, 8 Jun 2021 18:18:56 +0000
Message-ID: <DM6PR04MB4972E31296A75C338342A9C486379@DM6PR04MB4972.namprd04.prod.outlook.com>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fef6021a-c832-4828-aad5-08d92aa9e14d
x-ms-traffictypediagnostic: DM6PR04MB6282:
x-microsoft-antispam-prvs: <DM6PR04MB6282A8B37C40A4A39F3EC9CB86379@DM6PR04MB6282.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HXqweQSAtZQb89123JePJrcKHXLbzo5V/ddycV8JqXC0jo6LqnGabzr5WhPgFQgc5HZKwJrk7KHSa9pDrlnz/jTwt0RwxgTVeGEYvwdxmrMSJuq7hMx5SPjsFTc0kmEGSnGN0mmmcY61dfg2zf2lDcVi9Qi0IlloGK6ZBf0l59PuvQoK8ZzPlww9s1zMRNL3QzHrlXCk3moVHxrecZifbKX4Gaj0PP0tq1ASGCWCsk3aMKAe09x6gviZ1oammOvHOdYjRpYwoP1h/rii7Ku/ArfMgq7fxo2qj9wtaKBT/ycc0HJlvvUSxdy0+i3CXfIsPEoJSkIN7SfelvblPRnWaoHzo+JLPT+SuS+nGcQTdrBlr3vy1ESC11jD5AZRne6HQBiMwM6mufB5fvROUk617pWpwSP6o0IhIWd7wgyyEpCGRs4IdixzgBKN4CBxixzGSOFfYiQha3LSZ8UqXr3sIlm1FHYy/400hTLORZTKL920xnY99CrnB2Pa2uE99hX9kOk1960OtzIL7L0AaaQ4M9XEmxQSNGIrHfnTqXmNisiNVpd8CSRw4UB3qQUtMrL0nV2xDVy4LbrOZ5P6s0aXhHRyqQneZxYlZM4FeZeOsMs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB4972.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(66946007)(91956017)(76116006)(52536014)(7416002)(86362001)(558084003)(66556008)(33656002)(64756008)(54906003)(4326008)(66476007)(66446008)(38100700002)(5660300002)(316002)(110136005)(122000001)(6506007)(8936002)(9686003)(7696005)(55016002)(26005)(2906002)(478600001)(53546011)(8676002)(71200400001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d5ZAg2vkrWHYkLyztsAo1/L5ZnLWIP6fGCDN1077tmwggYtQ5cyUsVgKvtax?=
 =?us-ascii?Q?Kdvy4k6Zbp109wcnqM1a0J8a1m9AV1VycBkeSBD9Xt6ASiEWERWQ/hFuDIgK?=
 =?us-ascii?Q?1z1JprpJuPDEoBYKD2tv0fLhc5/ZJzOeEMb3j7sjTeXR8qLDhxlHHn3QrclL?=
 =?us-ascii?Q?6X9Fetgs5T8OchjMAoMF6PxMOAwihCxCz1jA2K9NQXgENS8kZKRFTIEHgYMU?=
 =?us-ascii?Q?vWePKXAtK8GS1Hr45WD/txK1yQAQ96M3gYiq1Ds7vbyJWibRxgRrXjHtqe2D?=
 =?us-ascii?Q?Fg+QCCznUWkIfTwLp/ONzs4uo2vJYXzyUvMHd0v97tlZp/hABBpl2Y3fGKo7?=
 =?us-ascii?Q?nRBGQj3VUDJporQV+YhuWWLRYZE9mvKIKidoxAe3jplPdmnxuikjuOGcixot?=
 =?us-ascii?Q?asereL6MQvULqON8UWSS+O5sTVq1038zqYG/dvllIgiaWq4EyfNGOoPW43cW?=
 =?us-ascii?Q?UYwg5naaLe05Ra8wCtx16VtwLNHGcKWycZqGaoBbGO7aDyK7JI54yRBFN9Od?=
 =?us-ascii?Q?Y/uXa3STQ33e9FhgsYa0lVV/wKD4WwPmJPiqgazxFtmeJC28x90AgvF+z2D/?=
 =?us-ascii?Q?epgh9jH2hYzAS3Uo2hXL5J5lphZaRGOBthKPQhrW4IZ594zMM57puE2XPYqf?=
 =?us-ascii?Q?BnDcZ+8oFaZS/BUuQ2yRfetiVeN+/tlYoKtfnIyAzdFEHPmeu/0beyPBkELt?=
 =?us-ascii?Q?QmUnYDja1YAIzPTjN54KycKJqk4Oe9RaQMRpN98NT0m3jRkRdLtFKt96d0FY?=
 =?us-ascii?Q?5M6KSvBOf9IJ6+UzjK7ov6TeWQFQ85gdleIbqebwY6D7exVXNJWXTyI5fUkE?=
 =?us-ascii?Q?r+I7U/eT/TGjBTN41dI/HpsU02FvPhjSGWUhz6aKnWpoAt00x9TuJ8BGeZw7?=
 =?us-ascii?Q?6ql47vNh4Zf+j/ea7c8f3EkjjeW0HYkeqj0wsAX8QEsW9bm8RrjjqP4/6gqj?=
 =?us-ascii?Q?iG+ltpN+/HoESqLe9sbsGFr8au2XlN2iXHm/SVQbpTv36g9ukrT0kGJE32ij?=
 =?us-ascii?Q?usVQERhJ4gqSSx7DNsxkeXJfkWtxm6XuZgf4lJjp6wWEp7R5fWAhnF8tePgR?=
 =?us-ascii?Q?HApCJjj0pcjXPzmoiZ6Nay4249xmoiDD3Q1xg6Y7T1GSbOUnp0vyycZb2xcR?=
 =?us-ascii?Q?ar29p+fC36Ly0A5YzGuoXClJ0BWdkztmroI9pajsCAhLJ6TeNRkAAXH3/rMy?=
 =?us-ascii?Q?p6HVXL29HNlvlKNliYjNnJ+C/bTsFCdrPsbvoI1zDobU4FDED0wrKxmf7hFn?=
 =?us-ascii?Q?Pp52ozc32tJAHCEgZrySKWS4aEMwqRQ2VWoXlR+EL7K5IMCHEk/5lxMRNovy?=
 =?us-ascii?Q?nx6hArfVSmB+v1tN8DgurnCD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4972.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef6021a-c832-4828-aad5-08d92aa9e14d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 18:18:56.5730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vVzqEFL2CtnZheHAwPBCOEf6UAQaZly2VnuX2jt8ImzHpnNgU/BEtg0CM1sUDOdoovk1Hmf2FW+2/YWdKPFH7sA1E2xwsOhidtCY4/VkBOM=
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
> Add a helper to call kmap_local_page on a bvec.  There is no need for=0A=
> an unmap helper given that kunmap_local accept any address in the mapped=
=0A=
> page.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
=0A=
