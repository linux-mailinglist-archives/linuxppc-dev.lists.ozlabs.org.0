Return-Path: <linuxppc-dev+bounces-5136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37002A0B24F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 10:05:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWmYZ4q5Gz3cXG;
	Mon, 13 Jan 2025 20:05:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2606::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736759106;
	cv=pass; b=Y1Sw3vy2p5o7NSxJi9saD5jgE3Jsz444l/cMLjYi+kEogagOt1415vmaCHnLscVs/TjxQFQdydWNgYnAPzTaJuf7wPnHL8+eMpOK9+gWC0gE7DAhMuHpW9Fgwmc1XRFnf7ofkrTuUfuXUEHaXJPXZb0BOQrnUhEKME5+TxzIv9LVFgJZm3KrQHJgtp709VSxzhzIwJAXoqRtssEsKSSG1HvFbh8sD/rMewn+GV+Aqvg4n0Jcg2AHKbrT+yBZZfFEMKkhTTTVv/2U9/ezkjAAj/72YwSKYBwgm/U4khcSRtzv6bE7SuvJGrRjGZSFasyxrRUg+IM45b6WSMXXUa/OIA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736759106; c=relaxed/relaxed;
	bh=y0kvod1J2VYaVbkZP9QmwOXR/9EPmYoAEl1LJu3QURE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mZOaa0bxbynzis7L7EQ1OmGAzBe2hFsGUULnKdJ4RiQkPLwVKuQEUFHCksRPOwsl05E3siw0aRRG/Gn/GbPj2cBHY3c3hMvdkD/nsdbVEefzMsQwLnFeirc9FE/XQjdo18IlvYEoq5RQhgmWhc3ym2ewF0tkUMh0cfanVqU+oQpc6BLq0brlPSKWBAMjQZXozEKHRcAuoPjXlN4SI1AIHIKs9KGYwj76XlxkzRrDKGIUMBxq4ErWOrSKsCBrCEwA2g8ulUd1PhDSwmGQ3vWCoR4mPieKPVvgVxCq8/f0iDVDP6MvEuzebQ361NSMJtLPWnHSMnC8Bbl0+CiGyqW1Mw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=g7AVXfcM; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2606::62b; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=g7AVXfcM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::62b; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWmYY1Rzqz3cSK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 20:05:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAuXp3E4BIcpg0wGiJ7/axe74yUICQHamocbv/YxVnSx+ot0J+TLzM8mdp8foJ29Ny4k/qIsEQ+uUmZROznUwF/5aKvKV3vNH/8N0eV4uYB4qyJTZLN2MSCUF5mo4MyYpQDgUgOSx8ZihYRX/yRs1HH/jmsAK3KpBCtOsOKAGEoBWtcHV3zd2piJJQrWutRwdALU2nfCaetmzYBvTEqQXPk5hgUKjtKh+c55BWZeuntI5/dGqd/jtZD49AOZPvrxNI4Nk0kzBDwEM3Y3SuO6g9VuzGP48ONP6jlERoO1zfMhhzmFqjgGATWMXtCx3RRxczQHF0AtSm6s9EidRS4PAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0kvod1J2VYaVbkZP9QmwOXR/9EPmYoAEl1LJu3QURE=;
 b=apZQ6jBgx3yg8emvBgYIkJALQ3zMbbhUTfifqblOkcM6zYPlrP8Heqw4qFCNza6FdAwMMqi3lMk9JOodnl2nOXvrWUccuIYtEj1WC3FCe1A15c27s/OOGPU9xBoZHEvbNN/4jfL1CXZMt1SRVQdbjp9CW4Mtay0X5NATojSpkON1nKvIuiMZgw/dR1yxgnnGpivTDtCMnV3scvsN82cCE0MVs8Uf+6hKGn/AzriNvcRlTk214KwfcFMDbzakDxz3mHNHIbaDDKtMvmz1lCqXoiWbrOBYKtUXk5mHwruXzyoG6dk6k7HXvmrQgChzGgRb109BuyiYACgpN903ORzVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0kvod1J2VYaVbkZP9QmwOXR/9EPmYoAEl1LJu3QURE=;
 b=g7AVXfcMFXBKaNMZXEagzihnf3sLiPzelsPjUDOiJ4dPRt6B2iUZlT0FBKC7covY8f1uHiV/Z7d4bLTZNEVoMe8MKGpuUoeMIg4ZnklJv93iXekdzeyh2dpnAlOhN+bi6h4fCVv9uNsaHy5TrO+55JTSaWgHqL06/6GqL8Z+9Vbl+nXnjSNorXIp+d7TvcuAioNNYLPxVAwFO8BfvbOlRW4Tkrje7GztU0UCms1ZfLvWq0+KLkeoubq18heGujNhi2nmQtDpcqvRdd6qkrOftzinkSPwjGdIV93/9vYAUAxt2eVj3UYl+Yht4/sBbBZ3RdK+QBjnvLfUTSP0S9oRfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10377.eurprd04.prod.outlook.com (2603:10a6:150:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 09:04:45 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 09:04:45 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl: Support MQS on i.MX943
Date: Mon, 13 Jan 2025 17:03:19 +0800
Message-Id: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10377:EE_
X-MS-Office365-Filtering-Correlation-Id: aca6cc82-069c-4cbc-e15a-08dd33b1532f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GZEDPsXXfUnwxDtEb6o6BdiifL5ZxP/GBzzQ1qr3Sc2JkM2kb57LP1eoi/Qd?=
 =?us-ascii?Q?l5z5RPMxwatgZDSvtI/e6Htmbh8qMe0LQLwMjUVy98tuBl8ZqbCzk+Q0W61h?=
 =?us-ascii?Q?Ge6+bAQ77acnrJ90bTLH5T3EWYRBRls1yzPFngr4x/MqtQLCjuBYEiZDIZ0C?=
 =?us-ascii?Q?vYwtxByYopwV7FJR+jyYcGDMUnsGYfTxEb+4pGHOR6StRzMFm8QlEZXMP+Sr?=
 =?us-ascii?Q?kfWSjGxhzNepY4C23ToFfixJqEzOoAGdlyDkmFm1OmaDBu23HuzFhf03IU4m?=
 =?us-ascii?Q?VFrgEzXclKbtw/bb02/kIRaiU7tlycHqyEQTFlvFSkHYHpqgh50fmgehjHP3?=
 =?us-ascii?Q?4y6k6eiC6sX4W3r6Izes49sq0/cokS4LHfwXXZmfp12PJViBAu6tvJCMl3cY?=
 =?us-ascii?Q?Q+BhpGf/d9u7PFlxyZiFroGTrZlBEubiwYkEIk7mmQDR64G1mRvXc2dzbuO9?=
 =?us-ascii?Q?LVVto1sU2bWSFEScOGzLh21OnbVk60b4KOrYzBLqnJfXkHZxwvECVMEjE0or?=
 =?us-ascii?Q?qAxocrDHoBEGfGrlQA3L49Sio7/yFEOZld79oWjyP/ebKEzUPqCnF1SgrQYE?=
 =?us-ascii?Q?CYk7Il82yPnx1rLtHBTsv93Quhs/nedlAo4VHaK29AtYNAmLYFEHneQPa+lR?=
 =?us-ascii?Q?iMc8Acq4Kh8QeiKkhZixlv8PccLVtjyXVnFo9PsXHVhHrLo0OAhjbWAguwVx?=
 =?us-ascii?Q?kY8VCqH8w8r6iwufbtR80oWz/ERKz0pJwH6Lmpe8IYqJTE00lKCcd/pi9M/u?=
 =?us-ascii?Q?A+oFIU55EpHi/HXKBU+oc/cuVfddlaGvV8qLzEHCtsnPsJFxk8Cex8cwT3E/?=
 =?us-ascii?Q?e8RjG5CCLeLSzGlLQML77Q6Re1mCdy31u6XhPO5Gxt4W6N6SJrvCdEG0NSsX?=
 =?us-ascii?Q?OAZiewdC6+5Xh6153UQlm+t0gqVuQ0YPQfNzkVdRr42POwpwfOOSAfF1LI5z?=
 =?us-ascii?Q?jaw85OdBQAHanj9UsPWUMKx7GlTzS+i3s4Dtse1uAs6PEKMWyW7TcypE87ns?=
 =?us-ascii?Q?oRJLDEgQW7EVQtNxMJRG7e4I0h+hS+F4/sBVhUYfleAiLbRWZxOrta9MB8H/?=
 =?us-ascii?Q?/AI2VkClXxCupW6I7/phij4Wv8KaW4QpJ3VjufLdRfwkKjhwN2W6+GdXAt6o?=
 =?us-ascii?Q?OqDSBS0Jk3m0liNJOjJ9rx1uKxwqUnYzSrsioeBUaOI1vrpJ5AFFGqS9E9gI?=
 =?us-ascii?Q?MZcsj528kAXzZV7DFMMCjvPBWLImE/LiPFtdcm6KT3YOIk8UfA6a52fSg622?=
 =?us-ascii?Q?Gb5lqYx6ooYsGgGjEW8jtfZ0pSrLrt3VOEGpAODC7LNmLfdArz2D3R52vbXL?=
 =?us-ascii?Q?9hwV97RavsQ9dixVPXCQ+bjFJX7veqpjmiczh3vlQ57rs0DUpKIv88HA56mi?=
 =?us-ascii?Q?5Wic3n2OnGwOLt94FN2WfpRCuFl57YYJZqZ2yIwg7QwyG3Bhyr5t1NV8UZwO?=
 =?us-ascii?Q?0brbV+BS1HQdLtMruIhXJrGyH5hQ7HA2I0mYNlRJhkjn/6/goVBczw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xCotWBU4gMDO1vTmyXmrOREMnsDJSXAPhxY8vYB/w52mv70y8wT/UclhsOyi?=
 =?us-ascii?Q?KXlMH1WwP+GtonC+/q6KmTO5ZHmeFzXV9gVcEQRd9L7E/FNYmZ9iQQMaRB4a?=
 =?us-ascii?Q?vL4xU7Ir2Opa9lePq6jAV6LX3rJZ89i2whWFvkBvkoUhP0A0tGw/xKGW3UyQ?=
 =?us-ascii?Q?YhL0PrWZtMNzN7JHb+u70xYIhm78Aq0Be59mdt4Nq6oK6svZIcM/jrTDJ/lP?=
 =?us-ascii?Q?uKt4uqXWRyOYkl2xrhpvytlIt7JHVLEczWrXKAN67tnUxCwSiDFDOGsVE/O8?=
 =?us-ascii?Q?jL9Gu33yHkMC6Zc6PF5RKqA0UXe5iVQzUfAH2b+7rt2sQWxEMci1mjER9bUY?=
 =?us-ascii?Q?w7+vUqD6LxbD1u52JTFBnBmmBbA75sz2cz8DWD9LGknTyRZN/Yfe7K7C/GUb?=
 =?us-ascii?Q?OZaVYcbqgu0KqIFAkdyfdYVyr873KLDpIcD5mKmjKFNt+nKAXTiz0YuR8W4q?=
 =?us-ascii?Q?PHMFtqzMh850HiWWbaT9QkgtCje8t6QVfKWvHzdXbOznPjCJK9RxNrr8QvU6?=
 =?us-ascii?Q?VT4lJtgfNTjWOu3h2yWc7aiBKpVUx1NVNJgAhKgDt+CXosRWEtoDelzLnKGE?=
 =?us-ascii?Q?5Ml5xbiNLq36oRd2JBZSGm0dvLZTgBSFOTcbdQv+WwWZpnkMA+vkTQTz1wdw?=
 =?us-ascii?Q?baGv6Na3JQYotZUtBQeXShrfXiASOdHUM5NLHjZ1Qf5ctgqtTpGxnZiz7paC?=
 =?us-ascii?Q?WahSD/zZi1N13NM4zzSdALTLyjmeLFiR2Jc2sBRiCJ/YQr+H7Zd4Blfcauj5?=
 =?us-ascii?Q?IYXez9BQKASIjM0cGhXP56rOiBTFFtQqN2td6DYYj26KawokySdy2GO9b7lq?=
 =?us-ascii?Q?So6VhZNl/KgCYt0XAfnUrydGKmgIVWc0v72iC3Nm54CvoYlNt5h3W0ZvU31d?=
 =?us-ascii?Q?PqBid8AkuTde69derVHZ6nS7D8JcPpqSYn2+kR5D2Iw1jspFzVlsldRau3UR?=
 =?us-ascii?Q?3SWbyFcowR4ddPt3reg6dCy0gncT+4F+PFmFkjjZbdvkT8TNW28wCpvinzz0?=
 =?us-ascii?Q?TWVp1/0hWS828EiJ0HgdrbhWg3S3wZ+7ZjzZwgqDyQaQSvecfnO9PUr2WlHD?=
 =?us-ascii?Q?BbL8OI80ZHnC30RDB26aSlpp02cJ6Tf8LkRhDDAJICZ5I6Ds4KhmwULj7gAK?=
 =?us-ascii?Q?drvmW/W8SJBy1cfjFTliTvdl74elQzetCz0XFMhS1G9pXsTOMpkhbbQ/BCZY?=
 =?us-ascii?Q?gTobyR/MLYn8H/+cm3UKkSPmGlEnU8bEigGARPyHgv/qudqLJmVuO21C/Awm?=
 =?us-ascii?Q?uo7Z26FCB6CEwWOsD1BoHKqwFTUc5VU+eAkcSmYi6U5xYW65l3bU8YW+ca3g?=
 =?us-ascii?Q?BINqP6velMwS6TdwGxzjLkPCwaJFRXeGhXUPBOAAZ0sSEhzzKlRfEkmt/RyY?=
 =?us-ascii?Q?qTxf/eve1mEO44h4rqsr7KD7wFOj5b7HN6qHWb4+fFkzCJBQCYq1N90L2l49?=
 =?us-ascii?Q?AyyvQmMTkJVeY5Na4kg7X50ZC4uaGs5qcRp5FjBAPREzKFo1sg877hVDJcGV?=
 =?us-ascii?Q?HVRdt5R7VTNPiyudCzshfqw4m6NENFiLFohAeiXdYwFGC14b18bK5w5KE9KU?=
 =?us-ascii?Q?423iHYov7vpuydIHvVe5jglMmiKGI7uFCJ+z1wOF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca6cc82-069c-4cbc-e15a-08dd33b1532f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:04:45.7831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvmNNUUr7QP4kXwiHMgJ0zTnoaXHOWi3YXE8ocPMo4knrYOFVQc/ov5lmFuR18I7v65xu4GTIVcRMWdNMezKKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10377
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

There are two MQS instances on the i.MX943 platform.
The definition of bit positions in the control register are
different. In order to support these MQS modules, define
two compatible strings to distinguish them.

Shengjiu Wang (2):
  ASoC: fsl_mqs: Add i.MX943 platform support
  ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX943 platform

 .../devicetree/bindings/sound/fsl,mqs.yaml    |  2 ++
 sound/soc/fsl/fsl_mqs.c                       | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.34.1


