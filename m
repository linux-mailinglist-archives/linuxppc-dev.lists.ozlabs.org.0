Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A047AF874
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 05:09:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=knQXfY+o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwM5S6YPrz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 13:09:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=knQXfY+o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1f::61c; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwM4Y4QyRz2ym1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 13:08:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbwPwEm/nxJ8pWeDedthb7VXoSYdFI1KjX669wJ4zZq/zga2ZRBBvTr09hYtjQHjCUTiaaF8UJdZzFuUJ8Bm/2Ufi20oCv2Da+DqGXT9rnx7Jswr/itb+jDKggud8firH1qsx0jjdq4vilb0K1GTuYNnbtSFBIDkY4GiaYDQ+uYSGvGUqlWuF0EmdWyyyCUJxoZiyCvfejc7rcpF/zF6O6nHMDLtB6ap/M/fBHWxPc8qTRJcSawWpy2zb7s6NlVdB9C1dPf9hkC5neXkWr5PtsoUbadLh2rIKMT2VjdDXgzn26qol/7h4EokghzGO9YbGrIC6OehqwCgAU8fyezRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvS6Y11FeKDiIdyQeN6c+7+4yKd0kC/i+IUP0COeCss=;
 b=EUFfets9iv4e6h3tFw+s9BkWPyxkqEz3R5JitmZL9zKu01CMLc3Maf2roTaELtxtr1zfx6qsiGZLLT/qTA8wUEBsyD2jx85pxlKafqNPdMogmJz9C+MW56tps3gWp5jLIQkFt8u+JP9u2NUoD1QEiDDXXYt1L/VqXuQ3OZIjEIheO0JGHWGkhMxfOT4fTsKP8KeU6+tO+uRhsGSv4Tvc7j5xLqAiNYmATSjEaECjJ3zihGiuuS6EzKulLyO1wWj43dh+h8dsPAbsLm4v9IDpyodrMNqZ1p6KmR864Pg3XmdFrfKOxMHqMl/K0k6DCmqjnM/U3xBCjIqKKss+vcuW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvS6Y11FeKDiIdyQeN6c+7+4yKd0kC/i+IUP0COeCss=;
 b=knQXfY+oodCYGG8cRXaC8IdZJ3B/jE6C+zHiDl2lguCchOHmObFMn8unPM4v4R2SuVBcUs6YPhVCF6ztFkiOq8plyc9K+TYkorLX90HPCxTazi2k28hIsDrLDPNCJJXcXWnfmmKwQxoNbtD2fOIwsd0HFK6C1RtJaTsIttRAb30=
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB10033.eurprd04.prod.outlook.com (2603:10a6:10:4ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.26; Wed, 27 Sep
 2023 03:07:50 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 03:07:50 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl_rpmsg: List DAPM
 endpoints ignoring system suspend
Thread-Topic: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl_rpmsg: List DAPM
 endpoints ignoring system suspend
Thread-Index: AQHZ8O/MzWXts0FyqkyLsnXLlx8p+w==
Date: Wed, 27 Sep 2023 03:07:49 +0000
Message-ID:  <DB9PR04MB94987AC750B4AB02DCBC44C8E3C2A@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: <20230925110946.3156100-1-chancel.liu@nxp.com>
 <ZRF8KI11IVf6NzpL@finisterre.sirena.org.uk>
In-Reply-To: <ZRF8KI11IVf6NzpL@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|DB9PR04MB10033:EE_
x-ms-office365-filtering-correlation-id: acab4fa1-9e3e-407e-b29c-08dbbf06eea4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4BSghqefRO2lAHo45BTwO7xv/m1f21KdXZn4VnM/etR2WoE9Gef5TYIv6zW+WaDdqrM4D4y2+7ruI7TdBxR1GBMGmZSMSMvcCkh1LOo6+VbTZnA6i0pa0NJW/yG8LLxBZQvF86AFEyLsbMwomDkeCTn9P15kaD+TU7/r+v9U3+NnIpiD3CzaYXOHlZMqnWk0rV84K+OhMevRKehYauU3eStEcxkgh1Y97lmwI75avqEqAzPL9CoZgAIhi+P08xvZPfl+Tb00ozgiPRWMWcNE8XVLlI1YZCNRwu7R+2e4c3IRSAEPi8XPaRUW4jPC5whk4FXcA2/YXOn7Im/5WTSboPXUikV+r3xltxuX8F9NGCyWN8ugmupAV3X/u9OsCn/wVfHRmxetqrxnJwmQR+qxxiFkzFGkcMuEZZBRiu7MQtuSQWXIhsqRqQhP/jTdC692+M6jr44/t9iKY21ix78jPhsy8auU+CqV1NKEi49bkyHvWzZ6nFifpCxcRQPluCaZRaPPfEgPC7E6H2xZfpgoY8a5SG+3sYwp4gBShWXCU/vj37K/HV9yOjsTduCiIjSU79JLbxaDRfq+6M3S+XuTYSQq7W0swkuOOltHRitrF7F/nZunzOJ30E7He9FfnbU1
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(66946007)(7696005)(26005)(6506007)(9686003)(122000001)(86362001)(38100700002)(38070700005)(33656002)(55016003)(8936002)(83380400001)(316002)(6916009)(8676002)(41300700001)(4326008)(66446008)(66476007)(5660300002)(54906003)(66556008)(52536014)(76116006)(15650500001)(7416002)(2906002)(44832011)(71200400001)(64756008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?1C0bhttnTRgcJK4Yw+96NZTFxOi8T2zN8aRB0c3VKWtC3yeyxwgSwDkopmB3?=
 =?us-ascii?Q?mUWBu7RiuhDo4v7z805gI5QuJD8CoP82ZKFYn3hFORJFMUHd3gt6wQLpwK71?=
 =?us-ascii?Q?JL/5iljaSibxgpPFZJAV+LZJym/n8iQhoK4LADvv+UCGmAD7V3oO1cM75/Cc?=
 =?us-ascii?Q?CIOKnF8sAP5D5aXuVODU/kZ+pwe2nTXYp2Xsu00oK3giOJAPYHQrbxJxsBk2?=
 =?us-ascii?Q?c/zEI0147Hv1JwYS/BFl9NQ16+nTUEHibrgcFqaHYxL4YkZ4j373QdULpqiJ?=
 =?us-ascii?Q?/LucIne/bL8TQ0T1xfdgBLXLzt7nW773KQX36rLQPQvj3JTq8kwjSpo/tlDq?=
 =?us-ascii?Q?T4+YPw+7vT3765nQq896Cj/pfoj6N0rrhJrpLZjVvYEy2+KsBBJbYl/deDdQ?=
 =?us-ascii?Q?bqwkY49oip/T+ZljM6FwXD0P7plnAhKotkqGz343WAoaIAPB/aceXsGf0WaL?=
 =?us-ascii?Q?W5AC721o/nXryT/d0FCB/n3RDBzJnLw1hGN6eMbgWDKbOlx8jYJFtgZz1P7f?=
 =?us-ascii?Q?EGyV37CoLdlQKEJF/YYmrzgGhvgGja6eCYJHp81voZRpezXzYy0hMJA6xylx?=
 =?us-ascii?Q?QBOXYajKwuO4LpTw3ZaGw/JwmWD3f3h9AF8USbsh+/l/8aUYAOxVkfYfendd?=
 =?us-ascii?Q?fojQx8x2GTe0VN9F2PVM01NQGqC2Q9YN2WSeZR3nBxrKZuqLHegIoe95G1K2?=
 =?us-ascii?Q?JTcNCOOQzam558IXnSNqB8FBIWo5YMFShz0L1rfZwSI97lL1XiMbc8yP2Xga?=
 =?us-ascii?Q?sd9dnmqdIdx3Fs0noZ7/Z6VAc4x65Wh7C+XX/WL5+YPs/bdwQNLmScdoK+Yh?=
 =?us-ascii?Q?36f3YrhnEgfLWk2jNDmuPYJ/FbgjLncsR84R8xZRMIv7pfEw6+iFDcaBihey?=
 =?us-ascii?Q?MBJ20vJXZOURjC25IOEuBZDXnr/u7rizHKVz5b/J30Em+z/LpAj56/LIITXn?=
 =?us-ascii?Q?zkaV7hWzDeRJNK2YIVHVDWo7xej/XFy9pbWMxT1cHjVBWpTK/4ZkSSPAL1mH?=
 =?us-ascii?Q?uEZ6RMxDbL88ViC2213rImR0NewiSCSfsy79UacT+vQv7ZJzl55EUVURlSZe?=
 =?us-ascii?Q?UNeRYvLebWDgaEGbKJmfAyyUd2dNpJbJJxEos+zIKBgQj+ExqRuWVmZ+pcN3?=
 =?us-ascii?Q?3Mc5kv5v6zrz3iwdBHYCLvn8BzZYf1wpg34uboA6Y3qdgXDVnLwdzrJpasok?=
 =?us-ascii?Q?lderqxgijebn6fHQch44+r9wlM+6sHyZ96n+k2UapgceHv3KnVNbt2fDzgmL?=
 =?us-ascii?Q?gKlHRcfpkS/K6BBBfANIR/3wG2YDb7wZpfL/sFAzOLPLbWTSkOGn/oV+m3Mg?=
 =?us-ascii?Q?3YbfDrU7a+aBmbWoMZRlWDpHpPElKYksn+qs4TGMjwn5KXa0rcoUqlyHO5r/?=
 =?us-ascii?Q?wmNVfT1ZBF8LbnhGPWL1k0pcd/InJgGVWsK85nNZjgU6/NWEUNfGlmk5Vufq?=
 =?us-ascii?Q?Zmu6/h+lIwXlzxm4D2K6d+ska30kEYUBBZm0sXooV/N4hhqx6e22JclFDCR6?=
 =?us-ascii?Q?1Xp/tnjcpqWCY5jm28i0xO6klEywAQFMbarYHqm4v4hZbDxChgZTlxbvC68y?=
 =?us-ascii?Q?U+5lVRQFtn0baSepdLFuKghtOsFgY92Hirn7btfC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acab4fa1-9e3e-407e-b29c-08dbbf06eea4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 03:07:49.6976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S2M5oNtfCtM5n5M5CjOk4JC+XMBc4Cj2YI2dNznbwMs6gVpl6rEpxHkYb8G4nmLePnLrFEle0DpYwtj0cn1X4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10033
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > +  fsl,lpa-widgets:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description: |
> > +      A list of DAPM endpoints which mark paths between these
> endpoints should
> > +      not be disabled when system enters in suspend state. LPA means l=
ow
power
> > +      audio case. On asymmetric multiprocessor, there are Cortex-A cor=
e
> and
> > +      Cortex-M core, Linux is running on Cortex-A core, RTOS or other =
OS is
> > +      running on Cortex-M core. The audio hardware devices can be
> controlled by
> > +      Cortex-M. LPA can be explained as a mechanism that Cortex-A
> allocates a
> > +      large buffer and fill audio data, then Cortex-A can enter into s=
uspend
> > +      for the purpose of power saving. Cortex-M continues to play the
> sound
> > +      during suspend phase of Cortex-A. When the data in buffer is
> consumed,
> > +      Cortex-M will trigger the Cortex-A to wakeup to fill data. LPA
> requires
> > +      some audio paths still enabled when Cortex-A enters into suspend=
.
>=20
> This is a fairly standard DSP playback case as far as I can see so it
> should work with DAPM without needing this obviously use case specific
> stuff peering into the Linux implementation.  Generally this is done by
> tagging endpoint widgets and DAIs as ignore_suspend, DAPM will then
> figure out the rest of the widgets in the path.

Yes, indeed I meant to let driver get DAPM endpoints from the "fsl,lpa-widg=
ets"
property and then set these endpoints as ignore_suspend if the sound card i=
s
running in this use case. Do you think the description for the use case can=
 be
simplified since it's a common use case?

Regards,=20
Chancel Liu
