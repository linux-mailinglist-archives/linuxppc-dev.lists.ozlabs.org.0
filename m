Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1977BD4A5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 09:51:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IORiz0yS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3rnL4jvxz3vcJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 18:51:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IORiz0yS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=kevin.tian@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Mon, 09 Oct 2023 18:48:43 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3rkg0nBXz3cCx
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 18:48:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696837723; x=1728373723;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Z0QcbTO9/IqkxmS67PdzQjBQhChOsgPFe7sTOG8/KJY=;
  b=IORiz0ySb2WXvAkoQ/JuA49gvNWEDCg8WT9rQ+ibxHbqpgA18eumjxvE
   AdK0orN5vTQX8DRcmgrj5jgVxjzan9/VaIWOu6Na7PcN69TvUqk46HF3Q
   1gs3x2AqzV80xId0O6j4qa1jD1Ho0+l5hTaSZFXcYIaexsC9H248h/Vpb
   UZrvHLmFqF6C4Zv7re/rIf2+TYDoTjCCnS5QdrTHfaEszAjwakD3jrfKU
   BlLssUTpCyLl1dt9LBMoPnA7ZTI2jYQFa7O71lv9ONHCOiekVgMGedrYr
   pHig7JngCiW+EiyCanlYVTOLLZeNOh4ETbJwT2b+9Of0Go2CM3xV2wtXY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="381354599"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="381354599"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 00:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="782403988"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="782403988"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2023 00:47:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 00:47:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 00:47:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 00:47:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 00:47:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vn8xJKH3sBl5xyCMki1VtPX3LZXfO4PeH07NMu9qfHyzXzBhLyXeNj4oIfcQ1MV7TLUDYIRI8t8dZ9ju7shGBtCjnSmyCRO9CRXhKFS+4vTbLlqfM8AccN74DJHOtrOYlOjCKlFyI3piPy/3DaPPp5H1FEqJvg9NeTQtfg5R+zAIBsG1keMcWhawHnIu4uDyrjcRcW4EwcxrBLZZQk1mLEZtphJUdU5+hNgwVu/pME3O61wXR/ogldSs76O3hq0ezt89N2uBmG/ZcqgyxH7uN3E70jL8OyT/7Gtk5VP4HFqnY3h18URdTRV2EZwD2VYOwJzbz4L1dLkUoqXElh4l1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0QcbTO9/IqkxmS67PdzQjBQhChOsgPFe7sTOG8/KJY=;
 b=IFW1fjnxu60nnaNoxdMYnIRKz58CIvqhqu0p5E5t6yH53ziEEWOthh6XGDGMQfOFh7w1wanf27nVPjcOQ8njVtaGrmdbv3RKzzHo42ZDq6pitjjwVwRmBfDHjH7X+K4mxGtc28pcqoCDh4KnPfFiJfdvnIQmLEz1luOKj5lIuq2cGRuHcANtrTqSBQafNt5f5SrfavNPvy/P2CZS6t5BbNUHpqSpyXI8tqTywK8IvFwykIy6qnREB+xT9pD2Aw14L2aYy1oxtTrc9WppnJ6OzyKsmJU0oP9hOoAUzfxQjBYk7JQY+QpYlS4f0jk05DCJqIVCXMT+ScPcRKptBblh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH8PR11MB7045.namprd11.prod.outlook.com (2603:10b6:510:217::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 07:47:32 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::7116:9866:8367:95b4]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::7116:9866:8367:95b4%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 07:47:32 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alyssa Rosenzweig
	<alyssa@rosenzweig.io>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, David Woodhouse
	<dwmw2@infradead.org>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"Joerg Roedel" <joro@8bytes.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Hector Martin <marcan@marcan.st>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Robin
 Murphy" <robin.murphy@arm.com>, Sven Peter <sven@svenpeter.dev>, Will Deacon
	<will@kernel.org>
Subject: RE: [PATCH v2 2/9] iommu/vt-d: Update the definition of the blocking
 domain
Thread-Topic: [PATCH v2 2/9] iommu/vt-d: Update the definition of the blocking
 domain
Thread-Index: AQHZ8Z0NuJKqebTcrUKaxWUXdqunlbBBJnDw
Date: Mon, 9 Oct 2023 07:47:32 +0000
Message-ID: <BN9PR11MB5276A88AD16DC95E832EAC2F8CCEA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
 <2-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <2-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH8PR11MB7045:EE_
x-ms-office365-filtering-correlation-id: 5ceef612-d69d-4ebb-30d7-08dbc89bff0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6JPdmVIKAIAJxq3pAXNuP8n2kp/DVrO8YweaREfmFMxj46bAR5vVFJMMIXcFFlFlwqQcAbGyg50d5VxZTMaBWc8nTEXILIO6dKxz2IOHwPyPRbYEzxAZ+V/sE6H3Ak4MH5hPVhPz7ApvR10Gd2YovS0p/bp0DSW+14TaC+/Koe1Y9DkLMyEfczJ86r032vK5Y5cUzr8DnXaGeZUbCfz8EhW03mJE9OhshZHmncMS0fKOPIMwaXzzYM0/GJYA+GmAFTYbcBtKMhkCxVTtSxoVSm8HOWrL7Es7NFH1YCscEV/txmf177X6PZSkJp4JnNwu02MfE5rqClUz0p0Wn1dQeEzZ4gMk7rs8pui+N/5EStdCbMdw65Ld6omDjvf7YyFHueECRCXToAb8FmbzUxZ4h+w5Ke69JcNRju4bd8dyAugJgvzDgBDZLzQcRCoJn4HoC1m6eMd/w6d+155bcbQkfkesDmbLGBq6hvW5RbISSF8gqNDNMARnI5zdE8k113oAfo5YM+rp9JlJbRB6gI40kpZDCJI3CyUMovpSWy6okMgQK8UOf+QlkAUij8uc1C/uSeo2OkX3pO9eq8wh/Zt76G5+hqHQjf3qMpXExJzgTcpN3xHPndZXjSkEjXv00mhz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(55016003)(26005)(66476007)(66556008)(316002)(76116006)(110136005)(66446008)(54906003)(64756008)(7416002)(66946007)(8936002)(4326008)(5660300002)(8676002)(41300700001)(7696005)(52536014)(6506007)(9686003)(2906002)(478600001)(71200400001)(558084003)(33656002)(38070700005)(38100700002)(82960400001)(921005)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QpTKUt5U+Q/m9n3xj2R5HKMRieFzpv2joIRQctDz6y2BEzcD3Cl504pAJltE?=
 =?us-ascii?Q?4u9ZNNPxPnPrV1NHq0P2ygC8rJYIClTTSfs5Vu8sjjIbxs+rgv7/E3tYAPjw?=
 =?us-ascii?Q?bRWT/vSF5V6haguyUMbqte8UGZr/IBBTZ7pBzj/s6ZdHbCe/uzLALzsc+gdd?=
 =?us-ascii?Q?Tnal57WQhmaJjmGkm12aizhL/PP13DoBtN+dq9P3bwu4nD7OttF7MiW9GZyN?=
 =?us-ascii?Q?DC1RtnUFQgo92SEfYpvnnyCTskUrsAYR5Kv2Xqc24j2xzJz1c8+SejpOHbFV?=
 =?us-ascii?Q?Hw+RXzxgpEiCJBkM4izLn7onZbPNZoc69NkpTjruq2CwFmbO0YFv87UdWle7?=
 =?us-ascii?Q?0we5vNLe/yBY7Tmz1exUuC9tx2GAEcW/DH/rdQuzyUBPfNT8EJH0HlMTSFTZ?=
 =?us-ascii?Q?kTXIHrod2WsI411QRswOdvc5eGnlzCBl9XSzwojfMqlxc19sPFNwlCAl5pxC?=
 =?us-ascii?Q?FYE9NaZ2HwIINOPgqig5YcH3N+btM8iEEpCQbKoTzuVHt4rKix0OvxFzVzr2?=
 =?us-ascii?Q?nOPBDa7GUvafOufpkf4iSSj3fXm7Qxk1n/+gxNr1ipZp5hT6BogMI2e2gOB5?=
 =?us-ascii?Q?xM8ow2I0lQzCB0FN61S1zWxVn+2Wagj2X72yibl0sqP+kRovN+fIsOtJJC9r?=
 =?us-ascii?Q?l4fvxbdxaxcD7aMnGRTw7UtQFNBQttrHRLHJGdxHPq6/NLsZXXOPAH7Fp4mn?=
 =?us-ascii?Q?/IbCTEbTv8WyJTuFqsgB7aBzxc0NAxl+gkkIDagCbfdhz/JeyXI3kZ+JuSwW?=
 =?us-ascii?Q?C0ZXjAhU6xRUbwAOZ0TOBDfmn52RijbuYIo6SyW51+nlh870xb+Mnl0H9UUt?=
 =?us-ascii?Q?/lbD+4nwixW8JNh0sVz+DZIsqeohXjQicaVYZIZve8FtpQLKW+xByVBVJdVI?=
 =?us-ascii?Q?CGz5idxK2SGWvoLJSCsXDE9nZtftaM9dwY8+Eoca5ol6+B8kGBAgcWweiVy3?=
 =?us-ascii?Q?BhCc37iKzDAERpeBxvP/q0RnawFk4V+2V1S/oZjBtNeY7atSF4Fb5JpWgYCy?=
 =?us-ascii?Q?IE5y4AmPH4FiRzEv9+/lSNAZGhjLXt+kiHMA2JOsWRSHfEH4jy0AtUAtrnKb?=
 =?us-ascii?Q?mcXjFJC598/zotfYGe1dM5V3Qq2DsKQtvMN1uznW8ZdueLF/MXw9sdvsitmf?=
 =?us-ascii?Q?gIg0CUqQ3qTscuRKfoihkZqTLcPt5S0WqlTrJLVNKIiN3QnQskZHcPVNJ/I8?=
 =?us-ascii?Q?rrWO1gLHOWYRZhE8CZXHKWzzbp+rwym6kKhY/Q21gBuHsMoS13H8J9oE2yGt?=
 =?us-ascii?Q?gUiivKSN8SZTw79mQHQY9RRIEPwpta/C/6inlLz05v7swDwfrPPAbLt9vIp7?=
 =?us-ascii?Q?0OzosX5znTqB1N5WPiu8c1V+84fimhJnBXdZJKZYtXxTOI/kNMNHPwkEk6/w?=
 =?us-ascii?Q?ic7UtLWFi+kzPUBEtvGDUAx9agbLoV8q9NRg7xsn33b1wDUtMNl0LYW1KdrI?=
 =?us-ascii?Q?s0IknFx/dUV0mc49si/udy1z7desXQehOy6Sl3jEHgG0lNvrKbh1pG4c9EWp?=
 =?us-ascii?Q?/QQeuWhqcODsK9A5uGIX73wiNjTPRhiyoxOKHQhenfV26TemH1jTp00eQDVB?=
 =?us-ascii?Q?aWDOXWGZhVFkqw9VC8W0joI64khO1+bESNmLzn9C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ceef612-d69d-4ebb-30d7-08dbc89bff0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 07:47:32.7104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ECjET9CuK64MLqsNqunEJLKpu6Fd9juc2Ndjal9V5m0QuHnVnco1Jezlm35LllceUBM0wJ6gwX+hX0+cnGZOVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7045
X-OriginatorOrg: intel.com
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
Cc: Janne Grunau <j@jannau.net>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, September 28, 2023 7:48 AM
>=20
> The global static should pre-define the type and the NOP free function ca=
n
> be now left as NULL.
>=20
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
