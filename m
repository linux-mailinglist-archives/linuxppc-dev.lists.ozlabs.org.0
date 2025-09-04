Return-Path: <linuxppc-dev+bounces-11696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD1B42F48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 03:56:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHMyf4N02z2yrK;
	Thu,  4 Sep 2025 11:56:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756950970;
	cv=pass; b=EYSzRDK0U1Cx7oex8PW+gdqe5ctEldbS3Zoeqvs4Dhm7Iy5va+SdXJJ/DE69wQMPFu/kn9k+H0mfMoQV0ovtOxArORM5LcoG00RsosFnXuAuXZ4xA7W+9Qpn37fYXiGu7hapojRlwSrEPzT26BSNVP9SL1tJmqGpBgC/+mSWWMvHk7PJOACrQfvQNgpr12EMGpP7QkUtvLNQczl0oWgfcV8RhzPNNtMncJhO2XewDjv/mW8p7SAbtu9UGjkfGkX9BrBgycUvnFU/YfqohVNLEAMhUDqKecHSz25vB/hZkwSkS11jkhbwPkwTOdprZnYnW9+x+aXRMdl8OJhRX1b5Vg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756950970; c=relaxed/relaxed;
	bh=3HAYQnTZyZrZJInGpiBgEQEo8jyELP9DFQO9P044HOU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OSAQT9iadwRyqjno7AbzXG4nTw6MtUXCIoycmNE2f5cQaEwKLkklHwhuQEX25rUcegfA5ZtoAwU4vz88PcuJIw7NGGdGbGyx0+HaLtcXWatZ2YAel4gb55XuXJwZbSS0VgbsZ9gpwmVR8SNLY+z9FqDF3U5L+hrGuUTQ2an11cCA2SHLPH20L7JzRjopvxieJYrcuLne+ybrIWnB/gMO8Hzqm6AE8dJQ9TC0I7kCLcKMomr8EJY8j3plRq7ipxPB7jGeVUXkWV0bSF696t86/XsB2hM0XhJJA9+fedMrFVREvotSrX1sYqV87piWSCPEaLq2XMAYKKGyxhfi76pZkA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lNdPSrdg; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lNdPSrdg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHMyd00Cvz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 11:56:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arAT9KpvVleg0KCathKqD5/htFENemCrmWpQlYcN3yOfCRvNqrd6nDBPaGhjbmBhi9JrCYHI27fTgdYy/mMEzgw2n9u7XAbB17NvCzwNk4CglXgi5X1Pf7pk4pjgX0RgDcFnlklEDJeyK56WbGzwokfw8ieh4sm+IQRTEjao7p0K4gp10GHI7RhJYzlRJaAVfkclI0m1In0OL2VFWuXDLzDu8bipcRd7jK42mQ1I+IufMTYmwZunTglLw5xQAwq4BNnso4DAjHgEX0LaswL+pOisoIv0Vs3pGv7Z1NJNWt08EDi3akosTFoUBMo8FL6o0VWitm6kBBGa1PcoD2JH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HAYQnTZyZrZJInGpiBgEQEo8jyELP9DFQO9P044HOU=;
 b=wQzGWq6DPe/eJAwODZYQrgIrfNIvCrRfrJvN7lMiS1INwOZZtSyaPXWENM5c+P/jN3u88daNfhaHkKSGvu+MPWiZlZQRHnpPa2FlUk/HJGw+al9tnjffq767SB7Pfcv5PtHIklQkBAd8v0/cVBd0/Xc+PUtz78AIO5j/2tV7eWCBI2vu1NkgV+mcNaCJJ363E2O+VBef65+JVyPSClU0VKCBajmt93zT7t8b5xnPzPPXWK9KsaWOEq3mRl0odEEnkC+GiolPf0dH9/5eeMw7gp/WSFdoGjoJHEHkUcJA5hRXA2AM6PaLY4wqQJ2zo0tuBgpUd9LYwJnyB8kzypHhNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HAYQnTZyZrZJInGpiBgEQEo8jyELP9DFQO9P044HOU=;
 b=lNdPSrdgelg9S33wWPkdtVY/GLuc5VcCIM4VzMFZwaRFYukunloe8IygmIH2UCC4KshbN+95XHpOlrx1sInkrOBgw9RB2Bi0uTurpSLseyJShcQidbeOnomk7kZC6b80o9aZhS3dTHbCB0/3t0RdgWVzoShHPqckc1cHmv/6TioJ+STEuHJid7xKpv4QkI5k9ACNs6pMmg4VMv0B6C0cmJXJXCa+9PExZUraoe2DBqtc2Q8945IZ3Ehf3TwwQV26/X8SP77Vd7Icz6Z3JUEzYKgC6BfxKZO2T8dHkvk6i0U/bHuGXEl+7NoMfZFXjoctI/qqb1Z0zOa/4SNm74HvLg==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA1PR04MB11529.eurprd04.prod.outlook.com (2603:10a6:102:4e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 01:55:44 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 01:55:43 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Richard Cochran <richardcochran@gmail.com>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, Frank Li <frank.li@nxp.com>, "Y.B. Lu"
	<yangbo.lu@nxp.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH net-next 0/3] ptp: add pulse signal loopback support for
 debugging
Thread-Topic: [PATCH net-next 0/3] ptp: add pulse signal loopback support for
 debugging
Thread-Index: AQHcHLD5iK57qqmEXUuEFtuGvb40JbSBd4YAgADLQNA=
Date: Thu, 4 Sep 2025 01:55:43 +0000
Message-ID:
 <PAXPR04MB8510785442793740E5237AFA8800A@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
 <aLhFiqHoUnsBAVR7@hoboy.vegasvil.org>
In-Reply-To: <aLhFiqHoUnsBAVR7@hoboy.vegasvil.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|PA1PR04MB11529:EE_
x-ms-office365-filtering-correlation-id: 4a9bfd32-2a03-4c22-cf36-08ddeb5628a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?L9K6MPgbF9q7kBYT95X1ZPDB8xrvvtp1Wqsp71YClB3GLks0tjLxnjNYRy7y?=
 =?us-ascii?Q?a/F8NskFwegcrx2hRrmPIXEZ+3yAgY6klK4HCR9rDk3WcaQIJazl+kDxhYdj?=
 =?us-ascii?Q?SaepwnWUKgQj7F4S/uCKk4+Pxjd4LwuXf2UOhhSyTMTUcA6bDnC+vcOwRhwc?=
 =?us-ascii?Q?uE37Huzd8EindlnLpA9bHJT1RuL+jxrV7yFkX6JHB0UpQQ+ZegZIwA19bzla?=
 =?us-ascii?Q?T9se2jXeJ3U3F3Uacz2FRT6itWOHM0nWF99/g1nB5h90f0//zTHZPRQWAXFD?=
 =?us-ascii?Q?64slkYfydKnUmxSl9QBO6NPbkr7qxugLjeqEbwfgIXske6tlw7dK/qZnAeSO?=
 =?us-ascii?Q?wShS9oMgrqwciYLTUeEZSdUYwm2fRE7vlxx7Y2YY+WR/v5oHU65V1MqmdDN3?=
 =?us-ascii?Q?R4iH65KIsZAMt2bYWVp5fEV8KCJFpppmhrAOgBz4lqIu7b2hcpJhRBZZbX0D?=
 =?us-ascii?Q?le1Hs/IiG1ptuRGp8mwp0trhozfCzIwn9nbRNhorFmygdzeuotxbXCG4KglO?=
 =?us-ascii?Q?Jos5AKfzCb6a7MEdUxKfhBM3i4/2GKtqt6X1THGSaDlNbP2oZLVAR9dSawFN?=
 =?us-ascii?Q?y83b+IpdZ9MllHFEPi2H8VpP89Q8RRMy/iwdiQrTrlXJwiYtvbvEGWFPeQbl?=
 =?us-ascii?Q?gAYGD+exQYLzaqjgUVGx2HHALUT+ulv4lSiO6Z4wLmVEe4oJORH4XRDBSdGk?=
 =?us-ascii?Q?uQyC7gi3ahOFoXwbRpkASgyFSPTp5357q9QOiTl12g1GJyg5m9PR4mjQ/WBf?=
 =?us-ascii?Q?3S1BAJBda5mALUyWrFp5ox1751Pwzfse25W4osDX3GKxB3QR0jPO8j3/4IL4?=
 =?us-ascii?Q?6us43i1HwMZlSMg+NnpQCGnavtFvE5WUwy7Jf3D5pVCR54ukMpRf/Nr5px+H?=
 =?us-ascii?Q?VQSJnZ4kv6Vk9do50bEcbsN8YfxnBZGQ5nPsc2XfvycmckzE1GW6wLpNL6zW?=
 =?us-ascii?Q?/bGrdYo84WijyTlO+rjhR91EQOdlmUeWyRSXAU78oyS9SwruJwdjPBjMQEWV?=
 =?us-ascii?Q?wzqVgzIYIZwLRE99D17y0TFzap4LHYs3ZyO8WQoomtGjue9GEtZxkjFoZorr?=
 =?us-ascii?Q?o4Dd8d3CJCsvHRZBtqUzbzh+MKAObFBYlORefbiHxAs9JjzI7L2r9DZikTJS?=
 =?us-ascii?Q?J4pg1gKroar3vndbVBuu9wfOCHOtNqQbpOWxv6iLQWtl5DX8tvun1QumTkg9?=
 =?us-ascii?Q?EUcnwOnjPT6xdznAHPz/GTSEKML+333z8w0+H9jSMspqOkYGTihWfz3n4a61?=
 =?us-ascii?Q?xCKnwzJCNjr+Wf8DGQRHUJILnYIdAlUI5EX34PF+3NpEZTd24Zu1U1XeG88E?=
 =?us-ascii?Q?iI6KY20zxJZ19xRUqe7P1z0rBzLLPp0fkQIMR53pBvVcpfNteCifmBlapzN7?=
 =?us-ascii?Q?YwvzV7CpDtjPRS+w55vcrytqzAJR12Q5Hr9ReXFNsXPuariwyQwrsSv11DMH?=
 =?us-ascii?Q?iuQ7wwuYk1gm0MQdj2S6vN35RkJKzSrHA4JFGYym/VqLKmtNz24kqQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JxrgnMMi11RsiDXp24Ln5IcwIO3eHXY77CCOeVAwY9qfuDF9+qTGze4ikP8R?=
 =?us-ascii?Q?wxWDDAnZDr3EuVhqG0OvOfJO0Q/UDRw5Nt4bR98GT0uc7G+aNrNfHcp653SG?=
 =?us-ascii?Q?3rrULId6H12UI69KojQcE70pYqzB9C60Xa/LfiDbYh81bo1Q6akLe7iuUDAG?=
 =?us-ascii?Q?aI73A+PPAkq/1ASPtpSRinKDnKjSYGoK0054f0cVxbzS610agZywriPdBF/A?=
 =?us-ascii?Q?bInE+gNgkAHLP3oO71CIy8vEF3PGnkc38RsoOgAO8hrxZxYupjTG5TqH84uK?=
 =?us-ascii?Q?IQd4n2pgF2AJr9jdX/8MsFMFqwaQbuf6Nso90wik8bB+X5XIE6TtQF5LayJv?=
 =?us-ascii?Q?s/E6DCwkfs0yaO+JhZWDg8fk8dl/2Oncm6KE9gW0T4bvc+hg298zf/cKaBGk?=
 =?us-ascii?Q?yX9Y25P4B8DQHfiLNUZ5cuM/XY2Ze+WDeHqlWePtg3iLtbCMwBC2lgn4np1n?=
 =?us-ascii?Q?41Ie0ezAWMeKFqZ86coH9FUJ/7hghN6QqrlmOCw6++mO2CEHri1xRy+t2C6Q?=
 =?us-ascii?Q?4P6Gww7glBawfNcT6TME267TiQLkoe0FikzKEJthT3REqNOFscBc24JvTMDU?=
 =?us-ascii?Q?4Sfe9RBt6psBAHmZZinEiSVhPbkbbEA1l1MdQ8DWoMkijNZ5DB0PWkzRN87Q?=
 =?us-ascii?Q?coAZyaG8J71bwQ7iPIHqjb+Fcj+onSucnEex3LrGBJrvNIeNhPZeL3eJs7GB?=
 =?us-ascii?Q?/qaMOI9/dvkaLOt0veOA3u+8WUgcxRBuMswS3nBOXOaA0ORBTsLf3CGkfTLx?=
 =?us-ascii?Q?mrwwb1VP8SZVaAaEFf/PTC2sM5fkt4dP++MKsnup8MX47WPlXkZGrU/NDcEf?=
 =?us-ascii?Q?VupWmPtNZmHnhMsN3l5YDt4NPLSIgtSsmNPv9bE6z7obIY6YFfYuz0jk/AcM?=
 =?us-ascii?Q?pwyAY6BXQa+3c0jmlxpxx9vJg3JtuiQ+G5Rae4VJD5yXaTl/ssYSfFUzD7/r?=
 =?us-ascii?Q?Dtt1pMCwIXdqfqvvdqHplVt3Erk5lDwGpp8i9e2O0n86JHhp0cIqesJ+HfX9?=
 =?us-ascii?Q?cNrHu/oHUI4ByP9h6TWdwwFGY+XXF4jwbp2Xmju8jHNtqs3j9e3lUzH/bJ8H?=
 =?us-ascii?Q?JNV1OFRiL7+N5ObpMww/Fdaq2dqvhFVkx/lIGGf9CABybtAwpJ9d52zKLrCC?=
 =?us-ascii?Q?Xhl9Yjyx6+MRDaXNx9hzRDG8mz40K6X7BpbH7rb8kqPKj00Pct8ZnsTt6ZQK?=
 =?us-ascii?Q?Xw1IvOwoM8SSOcWCtiOv03T24aqBi0xWg9R5Dfvg6Sk7kXKCKEBdzezPFrYM?=
 =?us-ascii?Q?+1elEOLy7jOFwYppkfpJ4S/PXEe+f7MFX4Gy5IoNfQ16puGKCgl+KHrmEzxR?=
 =?us-ascii?Q?8QzPBAMxBi80ufbHrui0k2tuqCuEIAeS0dchBVHDKZaXtcp3RQPpR+B0iqK5?=
 =?us-ascii?Q?q/PpePm4VsRzLz88fKKBrs9A/c5y6+YlJn0/i7T3RQHcOhrB/BAYHbNvSKIf?=
 =?us-ascii?Q?b3/TnnMBnzrmivv03e5BVTNG9q8vqT8xvov2H8OtWAdj/i8d5V/xOU3Q0BJh?=
 =?us-ascii?Q?2hNEHxtZLeHfmbZ1co1g1MkSilYZ3XdQedr00hBwsfi/XaLQ2QyMwrH5yRXf?=
 =?us-ascii?Q?XSC94x5wdQ22x2OuPNs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9bfd32-2a03-4c22-cf36-08ddeb5628a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 01:55:43.8162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NWWytu1O/8sSzan0/X2Eui70qckoT1yntCenx7oKbM6e7Gn5ynYk5BuBD9bnfl3XVeC4dzWkpfStP6PjemFpvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11529
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> On Wed, Sep 03, 2025 at 04:37:46PM +0800, Wei Fang wrote:
> > Some PTP devices support looping back the periodic pulse signal for
> > debugging,
>=20
> What kinds of debugs can be resolved by this loopback feature?
>=20
> It seems pointless to me...


Vladimir helped explain its purpose in the thread, do you still think
it is pointless? If so, then I can only add a custom debugfs interface
to the ptp_netc driver, at least this will be a better debugging feature
for the NETC Timer. :)


