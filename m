Return-Path: <linuxppc-dev+bounces-7170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B89F3A66D6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 09:08:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH4H02129z2ygY;
	Tue, 18 Mar 2025 19:08:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::624" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742285324;
	cv=pass; b=AwBHtYNhutLKRhFpm+QK85xDGzK9KjwiGkvmoe+zunEtO9EQClOqx8GiZrR+o9iwAIlcyvpU9pwg7tvDJQnK0prKxcSIALXdW7Rvd+xq+QFFLqmJz5iFDMEYplinx0MjnyHiu2RjTfXq4gk7l83Ltrns90Y5cLNIJ1UykQDdJofN4jEMff3wapNp0+qYa6cSDrDO1YoVz9rpfLn2LVqSPJRPsMFPvrbMmzKSpJnFEiqRoJvR/9/hawKzQlEwmhMhCHhV5wHtbk6YiP7Z/YjT3f2xmoSG2Nqn/Wu7L2T7CW4U+0QFdS48dTPznliT+Ji3v3gQhbQu6R7zaraczAz5yw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742285324; c=relaxed/relaxed;
	bh=vf/Sg30DdSzKq6EdE/zjvyymlQILv685rLnwn6NEfww=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UjjUIbHb9hMZ90GGElZtaWWWC1RLr3XxjLJi0YAN1nF9xn34HrpCaNXspu2ztESxmSeq8okKFka0uweR2X7UoAbB0jt/hvjWxjX6cDunkWUXeseF6+V4oeLBeIRgeWbXY2nZvtWrnnAtmnTLMz/LpSNFDeOT+jTXhUzPSFWEQgoIBwzM2WOQcGo92wtMfSoxWQlrydB+JMWP6hAUPoaJLsGOhuWE+rJwOhNy35GKV5+7VOtydnPv6P50J6+dalGInylElGmo3+rodHH6rj0BXu0lTWc61wlQEKGJ6m/7S7v2VkVdh3TGlhLiwcZLea6VWpKwT9T6ChifjOobMTUsJQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eeJo78vq; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::624; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=claudiu.manoil@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eeJo78vq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::624; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=claudiu.manoil@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20624.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH4Gy6Hptz2yfS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 19:08:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9JFDYTybqNTReYsCTOoWlsgJEOzRfVfpyw8ztpmo2du66DiJsU4ixa+o5ohBlEYcszk++Y4e4r24HmaP24GWmHbrnvvSYpQoVQFZbSxNjcJgwAbaBA242ce1kuCrKRqao7H83lcRQxaC4SKEUiXxtDzYkKFHzkJceLXFvYDrf44r7wmJyA9C38azuU+1JFG/8KnQtK8L6InqeI0BGWSm9f0C9RLvD4ysEeLjaVxpb9jJzZDzt9hL1i5xBANEV1A1uYtqv/KSSLqSS02OYMk/DMFrFN30BwbAWUG7yHsQZueghuaqUXELHMNpgIhlchUDSVHaJYlw6tK0EvDL4Y64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vf/Sg30DdSzKq6EdE/zjvyymlQILv685rLnwn6NEfww=;
 b=XRRsMvVkcK4Mt3ihoplG1zmXJ2225Ll03VGHwXG3i9F6awzd6w/jhXqBwaYE4DYIS2Qx7AeEKYyG5jUR3l3kVQQusPIFxYe4iTpxfrrYM6BUeIxYgoPv25Oqz9b2qfC41q/kPkDHkrJF3YjBIhJ4Gm321RqYhjJbgBCtJ9q5XMCIRKNzQzEEtusHk5WkEbUqKTyISwOxk3DWYm54JRJoGT9A8XriH9uVa6X8lEuMV2iRcf4GmsgFSeO80mjrLHx3Y+44jnjd2l/zoXRI/AgcLeauhCJNy2wg1ajHi1j51PosaANCD7mfffEmSMgQJmeGdkf0gqOACZdoPX64XzuyNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vf/Sg30DdSzKq6EdE/zjvyymlQILv685rLnwn6NEfww=;
 b=eeJo78vqvjnNtJLCN9PX86bIhUxyx5tV2bW5mQH5mOBWeJi4hnxknwrx947UGrB3JBEHVF6fkPPju/9h98lOb12ZpQaKJCphNV0CQXUP2NueRVFo4Bu5R+wlvj/hylRzMeFE7L9o8hG3319Gus23dZ27bDrfzYXa909WgHLXuuyZrJOi3OtjKCZzrHroyx9ujESvyA3L4hmdXIh1onNyDXPxfYda2Z6v+SYaGbz8qCf2kyqncBx4JPdE/li2feaN2z6p/6sZ/D74VRHoA9BVIkQmoedAf56y1smysqeE5xnADXRRow5P2cv8bd4xluNlIBvYcEHoZNPZJa1TUtOtIQ==
Received: from AS8PR04MB8849.eurprd04.prod.outlook.com (2603:10a6:20b:42c::17)
 by AS8PR04MB8724.eurprd04.prod.outlook.com (2603:10a6:20b:42b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 08:08:24 +0000
Received: from AS8PR04MB8849.eurprd04.prod.outlook.com
 ([fe80::d8e2:1fd7:2395:b684]) by AS8PR04MB8849.eurprd04.prod.outlook.com
 ([fe80::d8e2:1fd7:2395:b684%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 08:08:24 +0000
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>
CC: Clark Wang <xiaoning.wang@nxp.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 net-next 04/14] net: enetc: add MAC filter for i.MX95
 ENETC PF
Thread-Topic: [PATCH v4 net-next 04/14] net: enetc: add MAC filter for i.MX95
 ENETC PF
Thread-Index: AQHbkkpRqqFwb4ec7kKZ1OPwN45O47N3ajqAgAEnwbA=
Date: Tue, 18 Mar 2025 08:08:24 +0000
Message-ID:
 <AS8PR04MB8849FBA73A50F0D553F1AF1B96DE2@AS8PR04MB8849.eurprd04.prod.outlook.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-5-wei.fang@nxp.com>
 <20250317141807.2zobsefxl5vnqdet@skbuf>
In-Reply-To: <20250317141807.2zobsefxl5vnqdet@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8849:EE_|AS8PR04MB8724:EE_
x-ms-office365-filtering-correlation-id: 315b0c63-985d-4be0-5b8f-08dd65f40e43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IcUFAAQ+moWadLc6pG3NGSKoIW+VganW4gJgNJ9CEsezqftbJ2XxPxOgvfbf?=
 =?us-ascii?Q?XrEgMsf7hip4cUqlwLj3200s8nbgU+7ejTUbULHc219YYihcn0O2Cwx/B1kN?=
 =?us-ascii?Q?t0BglVAKtdsiy5Tk6i+i5b1Drz+t/MCSejRR3/2noFl8bju3qbtACfeoUXXc?=
 =?us-ascii?Q?Pxn67fT1Yg1kEn+bdr8YcQhXATzXm7ot9WYQN3K1ctrQcKUUQKkW1lbMBiau?=
 =?us-ascii?Q?s8+NY4XVlo3EPkE6orzJE5c+8CObuQx7S7K6pL20mj6DigoRQ/LugZfqy+5y?=
 =?us-ascii?Q?wXMBai469Jcv9/5yl7rVJm+HFP8rJTwcYM6H1qjtoqLdX3bGDtB4FaXAKx3u?=
 =?us-ascii?Q?N+stlpd7CvlCCIBj1HJ3Ypz6mD1VbuRlyDNdqhf0WUOUwZAUkVAgnW9BWY/P?=
 =?us-ascii?Q?nwQszZt09csayyg/IyoP963IVdQo89atnrX084+ybdp15lxP1J542/CsCCru?=
 =?us-ascii?Q?uE/jJLPt+LlEWHAYv5J+DZMo3Q2TJSuq9C5ajuE8oQABxlf/UmcmY+8LOSxV?=
 =?us-ascii?Q?VvEaIUEGfPD5AhiWiUA/F5uwd8CBaMyXv6kmUn8TO7rys3hR0cWnNsh7ZBVX?=
 =?us-ascii?Q?Vp5S4FFvQHza/nKOb1Hj62PDCfXj0EWPdIEEZBQFhmhm6ludIRY7e+3PO9aO?=
 =?us-ascii?Q?RZCHVKDn0eYgdICpQCouDICvi5OvZjkHuguz/ZLSuO/3Od7edOdEDDBNAugc?=
 =?us-ascii?Q?r/KMgbcRB4Y2VkJbNLhd4GDdLcq9IwX+VapKViCkfeep9BkXfcTKr8Jbty8Y?=
 =?us-ascii?Q?VxVfOZqUGSo7k7JnjDHvvEZq2Rm7OKAUvKo9hJyMskyPBVkUonMBjlrsO0OS?=
 =?us-ascii?Q?ewjXLKsfe+dg5XzEF92WpTTstpg6BxFQ6ck0a01nU25MI7vyO/Z/kyC0Rnsz?=
 =?us-ascii?Q?1uDSUxfvfiFRoBLgPSDGCpORnRu7miHmv9AO96YS0VqHddDsXPyPXvRaH12n?=
 =?us-ascii?Q?P1wyH9W7T1j+pgvi5FZ82T1woqusVprTQu45z9mm6U2SzHdi/CQSLYFLD9rp?=
 =?us-ascii?Q?MRAF54QbQFAVdSDEfjcL/J3HPcAd51I28aZmhzmc8GAHU8vNqXm8gUTK55Vz?=
 =?us-ascii?Q?t2iuJqyFl33aOXwYGUxxkKFuQXWkLtnEiyyhOXYb0fAXROhN0D0tFsHCOv9j?=
 =?us-ascii?Q?pA1nzUgmeV73/fMZ0JLY/3o09PTELz9orfjplrgWLd7qzP7U4T90bAHSTs/N?=
 =?us-ascii?Q?ppmSd2Tz4ZqjORHUTWTSypMrEP6lF9Wg1ldprlHmfdEq6GFVBBlJi2YgLw4Y?=
 =?us-ascii?Q?AUwYcmVYGnHwqR/LvdUl2J90U08NMhhnK+sZ4gE7t7WyKhuGRAR+4ytxluQQ?=
 =?us-ascii?Q?/gxM2RgyaGZIaKx5JdlcGoEnpLKu1ma/N2KD8ttMRWHr6PgMox3ZTr45yEun?=
 =?us-ascii?Q?uT4VUJWhb1cBDEjuotPWSm1yNzo9/nzLOM75K9BptmMDgFGdaLBVFIidcP6D?=
 =?us-ascii?Q?tjWSbb1/3ixh0x7h+imNll67Mqlmwlxd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0/kD3wpjXq6EDdjeJxoRB6xZeRCrGa+7qPihoUIcXzDfFWkLykO8lRJOpiDG?=
 =?us-ascii?Q?4XnB9eI54LJu6kjYYSSGSyRr6xeNF2vDncOqgDay3DX58UW1ukYXHm8V1sF6?=
 =?us-ascii?Q?ag5CR1rBv1leQi7RP28xVG4EWU7mxNzcNNqtfQmDWnV7GxFkCo4wX2R/F+Ul?=
 =?us-ascii?Q?/q+YJv7s7EdlIwM6goBLAJG+VC5SJxG+h0Bx43SNeEGMqhamb4A3/pFVvcbU?=
 =?us-ascii?Q?81+Xwabf1VzZU9qp0YTDdgRU16N1On8yiQWv/DlkISMs+27ZoBt5fDKTrq+j?=
 =?us-ascii?Q?Uiy5q0t6fZz0OeFgnPHTT6owZmc6fM8bEOj5RVbsUsB+CkSaMtiRf9RjLrPX?=
 =?us-ascii?Q?kUrLA8wHXXzvVqAWewblI0MW5HIxanL6IUFstluEgKsjLid8DUuof8WckaIF?=
 =?us-ascii?Q?NLcpvSGMj8FOV83GHJy5/x1pDjao5fcvjOirFECR9CtmzkvvI2Q7d42ejkcF?=
 =?us-ascii?Q?y1/R6y1KGAEWW0AwNGjpH529dpFMztgwp1lyHV+nuOixD5zSQIFVvLZ9pgkB?=
 =?us-ascii?Q?rMIrzsn1UpG9KDcQZgu/WZHxP7kZRAQN8/zYICAcyqUjArIetWHYNcGv6JD4?=
 =?us-ascii?Q?4ypE/ROiCV5rPeTg+PALa1mU/NIzSVyWnqfcn4VfbVFbChOrU/21Q/dEJT4N?=
 =?us-ascii?Q?fcQa+V95I40poYmkFjxtvHQm/YkDF5/gqVKQBAwMLQc/3JCRK3eqoExGD3ON?=
 =?us-ascii?Q?Q5LEH7SOS18RIg2u8pq3iCp+SwZ2S2IsTMr8yD2EC8nNvqJ7aVjs2HF6OpgD?=
 =?us-ascii?Q?cP93qdgTX8opRdhQG7tJj6ts2KbVq5aTGOUMmkdAZJA9i2cCDwceU/LzDwwO?=
 =?us-ascii?Q?LFSFTwRxIPipJI/5umxqmTesCNpnqsm0RMA5+qrJFBO/hFrIdRX1cAi/Unah?=
 =?us-ascii?Q?tAEF6VRSpxSj9i9RGwofT5L8IzHcnN+hJSGgCDDDehkjkST3iB5hChLf39lj?=
 =?us-ascii?Q?1QCUbURMrtZOE15uI/QU8kxUNqEyDRRvjk/oVPeUqFieRM4/ujL9L9A/cvKt?=
 =?us-ascii?Q?CGYasFZeC90/h4SqcInihaCSCJlKkVmfdZIvjsdeXgzLnj3k3HOp/8RftmwE?=
 =?us-ascii?Q?ej2eo++u4dzmS+ivMlmGEdBFfeu7SyJ4G+i0DGxsk4pmHymGDHrabxOYr9FH?=
 =?us-ascii?Q?cu20US4VjwphJbzmJZjV+kz0aw11Y8byCGXGQJKiXzQhuLTRBIZl1+jxGv9f?=
 =?us-ascii?Q?xAe2jt6wITS+DUQVG1lcHCr4u1IoMfXbBkWvRBaE9peRE0rK+gmC7jWF3C8S?=
 =?us-ascii?Q?R0DCHoRmjgu8vUNNPJJqiVG5n83eXN6pXFVV/o2NExwlIjFs88gQ2waD1iLz?=
 =?us-ascii?Q?hJgpV2q1medXYAO2xo9t6i2Q36aXuQcqqBgUjalwR9bKYJ93erQEL9nhE5+7?=
 =?us-ascii?Q?/kijO5a3zsZfC43//hgeUUDZwolj9/jYqvIgmHA5spG78lmKAeZ1N/JUrTn8?=
 =?us-ascii?Q?jNu8SuxxqRLva7WyDQPJ30piTqXTkajEIlxT8dd/PV0z7HUEjLoSoVk//rQQ?=
 =?us-ascii?Q?jzonP9iRXJ4P8fjdkYSx4zvIJKX4VAN9jH2StfUXU5xv117DQnk1k4ndExRU?=
 =?us-ascii?Q?xwdeZQypko1DgaUDNN16uVBDFL8U+eX3NNB4wRiq?=
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
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315b0c63-985d-4be0-5b8f-08dd65f40e43
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 08:08:24.1875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v4FzrLMzkJNVaWzGfeu9r2zaprPJ45gwbm6cAEvSk9x6AxIm8/EpSROL5u7Yf5jcH1FUj41YcM+VeHAK1ap3tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8724
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> -----Original Message-----
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> Sent: Monday, March 17, 2025 4:18 PM
[...]
> Subject: Re: [PATCH v4 net-next 04/14] net: enetc: add MAC filter for i.M=
X95
> ENETC PF
>=20
> On Tue, Mar 11, 2025 at 01:38:20PM +0800, Wei Fang wrote:
[...]
> > +static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
> > +{
> > +	struct enetc_mac_list_entry *entry;
> > +	struct hlist_node *tmp;
> > +
> > +	mutex_lock(&pf->mac_list_lock);
>=20
> The mutex_lock() usage here should raise serious questions. This is
> running right before mutex_destroy(). So if there were any concurrent
> attempt to acquire this lock, that concurrent code would have been broken
> any time it would have lost arbitration, by the fact that it would
> attempt to acquire a destroyed mutex.
>=20
> But there's no such concurrent thread, because we run after destroy_workq=
ueue()
> which flushes those concurrent calls and prevents new ones. So the mutex
> usage here is not necessary.
>=20
> [ same thing with mutex_init() immediately followed by mutex_lock().
>   It is an incorrect pattern most of the time. ]
>=20

This is not as bad as it seems. In the final version of the code, mutex 'ma=
c_list_lock'
serializes the access btw the thread programming the filter for the PF inst=
ance,
and the threads programming the filter on behalf of underlying VFs (trigger=
ed by async
request from VF). But since VF support is not included in this patch set (a=
s Wei
already mentioned) the lock can/should be added later, with the VF patches.

