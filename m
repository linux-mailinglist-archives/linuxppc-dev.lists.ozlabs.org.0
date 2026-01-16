Return-Path: <linuxppc-dev+bounces-15885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAB4D2F6AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 11:17:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dswlb2BSHz3bW7;
	Fri, 16 Jan 2026 21:17:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768558667;
	cv=pass; b=h6lETsmgiTeMZd2hQ39JzoGJ3CrQdzqSiD2kdZ/EmZx5iyz1sEpO5WzqL+UO3CBdWPoCpKpPO0hEiWn1Xu/OQaDwu1xKoTC6DA3sKt2pcPyZCZPKP8pqhkWKMS5gvzLgIBjDXC9XVCzUEa0ZnnNprOamLrHATW5uDe0/ESn0e1XD+ymMy9e4zyF69rS1HOi/EQ4nfXLuEAeG7H94fzkDnbJ59dobFnneu6LI5wyTuDQZA2kHGf3OTte5D0qTNt7PJHDrtikih4C7hU65t2Z4yNkErOzRe5AZsAlqQc4HX0blS+nc32robfkqeR1ujWVdfztJln0rbG0dIhgQcPp+VA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768558667; c=relaxed/relaxed;
	bh=v8S95r3HjDpVckDFkzQJo+1luahHChWVrvPutJPmoOM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o1fN/OIaAJ5HDVvwvdXTxMJJfSo5sLEhQcszo3GpOyUJHyf2Av6qQ46GCpNYWZmYS6PipBEgVrWyG11HOaLoETxFQrwkK7KPi2Ukm6gDVqqgfUgoI6m4B8bRWqZRTYG4IKjgElX8tAF0keZsswrWCnbANEq+z3n7LE5kSdO7DbhSLNUq9Ycs7YTX5S1gzrPD6P3PRRUrOk0cjXuq8TMu/txXG2oTLzQPRGLYaDvn7nhqFm5NIXIMt1AMwSVj70ktwpwueyowuCiJu5y2dw0i/4yRyDGuxDwSKUIk/fGcGTG8Ggk/zloyEJa7m8TmTYFyzZZNUZtKyCJQCumPjKDVaw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=YPO0eeDZ; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=YPO0eeDZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dswlZ33GPz309N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 21:17:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRWiZnmc5jcWk1ndbR/d7rWjUGNs2ZUn3uZLqs4gIN8hrnUvNjm+9+phVQSDfRyPb+mCwc9x4A9zm/JHdLKxTyd7iqdcekHY0Wrk7UohGLZNMuI+tEvQWYEian5mFsGLz5035fGLjquSnavZXQP4il3Jr6WaCUFfOqt0HpcsYDwifda8mset2f++s7f/fWzdZobqJ6HFnbpUWOmP9AkZXToHm+mu8BcNJUqvWPTzYQcDNI0XGUOh0MzBmt9QqgABh5sm7aBOQGlopNHkVv2CwRYnmUMxYSkRxZaFbWuh7KxgXu2pFpSpg/bZx1OjcJtU29cwdfvpccsmVG7RrGn5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8S95r3HjDpVckDFkzQJo+1luahHChWVrvPutJPmoOM=;
 b=EvmuXhOlkgAp3dmffcRGQz5K9135yyHLP344+e58n1jAE4r+I+tjBG2ugO0YCVF0Sa9GE6RRHwyQKCm4KzmJeSP+zbMVtYrB7cSkho4CKzCuIMM0gTN7jhbh7dF5gOLllaT98yTrKJ6NfeZLembFDG2uC4kkZiIXRYNavpjLw7l4BflxfIDS2zxbFcOMjvlly03QXSpIy/SSH/pNAIKVzVJNV0HS+mDMLwNl49wHoKkSKUggs5oDcecimRHTMYmGKi5FwDvfQ40sn7YbriJVaFxYRxbXWct6NCLMB/6qLD3CqjRf9YIBHaTbiQey2JVFxO45hkuVdhItZGrWoSUqXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8S95r3HjDpVckDFkzQJo+1luahHChWVrvPutJPmoOM=;
 b=YPO0eeDZUzI423Y49Au53AlCVYagvH3u8GMuMLqx0dwjFLLlx3fUW76D5zmfkh2PSDfdF9wL3OJ62B3yy1ZBHo54YBNFdFmJZXiXU++oV5At0m13C9F81bIH1Adm7420M8I7ANWSayUviSN6281TMhazzMorq3LI2V5socp+rSHDW0yKPap9yMdvUXQTAxZCUWBifPuKLtQDK2W63l7f1rL6oyYtWGvdaxWEXsyNzUEBk1pLBl7WUxCRislo4UNWkx9vVTS24XXaLqrihPYeucb/wea6h0GlQpT1MyqjFq49wPZNnWwIraiZwFiTAOmPzTQmJP3DGzbPvGRsrNT6Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB11598.eurprd04.prod.outlook.com (2603:10a6:10:60f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 10:17:25 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 10:17:25 +0000
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
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for i.MX952 platform
Date: Fri, 16 Jan 2026 18:16:47 +0800
Message-Id: <20260116101648.377952-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260116101648.377952-1-shengjiu.wang@nxp.com>
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB11598:EE_
X-MS-Office365-Filtering-Correlation-Id: ec886246-baa7-425b-8c64-08de54e8718e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u2d3btXDPdFNIsG68YMqb/B6Ave8Sd19HnOtwhVhvzCqQ+qpRVJ00HS4qCJq?=
 =?us-ascii?Q?AE+V0Jm0ESNDVv8ZHTrLzz/K5YgFOIHSKCDX4p/2Id8+6M5t8nnLal81Qh4P?=
 =?us-ascii?Q?PisDdkGMOJGEmGKKWcw3ri7VzNPZvmL8gEtHFrPr77sFS5yb9LUMuHTHEYzi?=
 =?us-ascii?Q?9+UK8Liql6xb/LE1/x5+lSgo9bAlLMI7ep1T/0f0nMIsYnAkyrhZyN6zCUkl?=
 =?us-ascii?Q?NPgvViFSkrM0riPSA0E7j0V+Wu3WJo96onpfRvo1CIp/qWqLyYYd5oemdzDQ?=
 =?us-ascii?Q?E9iCaw3EDnoAeynsC5AasQD20Cx7KY2VCHQkFPdBDvf4Vun2aPmpuAN3DVtA?=
 =?us-ascii?Q?+H5Y18AH/8pA8yQI8iNx1uPolRxza0tcSzlD6WG/TTs7lDtd3cONwXmC2ceb?=
 =?us-ascii?Q?1qudwUXbsQMM5IV9LvFFyuFILHFd1B+wCKY9O+GI3Uu2GWRcBCD3Voo0sFKQ?=
 =?us-ascii?Q?S/dYvu438NCTM8rDt6WwJg6c7VuziHBOxErKA2gRJW+NKs5DOFx6Dozi/2sZ?=
 =?us-ascii?Q?W2oyvzFTchVhf+GhteP509zPh5ZUqmzuNO5sP52binyXNFVQTa1lAhlCG2js?=
 =?us-ascii?Q?qCECDdDB248rsJ9nmHx7y6roqm5bv2OS6MhGx/ssdPnv8U+paCHbL6Ks00QA?=
 =?us-ascii?Q?SdqE5UMMyOQB/6UyY/sdmdYEGsYt+gbnKdlE+OLvfGM2I0aP79N9GRKmOEIc?=
 =?us-ascii?Q?Rt4PoGBU0DSavfFuGfhMJv1yBAupDeFTBGnmNng4Gqc3yO6Gm90c8PIAN9nk?=
 =?us-ascii?Q?4pKdkk0Gr9VVS81QqiGdX/Jo9JREnxYTeFxauYl5B4aNpqrBQvQnodjCvZT5?=
 =?us-ascii?Q?5vqlxlBxblmRRfoWvgN0f7533HQAp+Es4EJg5pQNkBhbxMSL/Js4LDNDyY02?=
 =?us-ascii?Q?8Qt4JDHy3iF2qpQTvHLCyKCPOCAttHEqAYyH2PU/xE8rvldE704trvWdG7MG?=
 =?us-ascii?Q?D1EgCBod8y7O974MuPaGAXptQiflRMwwHVw/s+QMt47olPq9GY7OrIXyGzMw?=
 =?us-ascii?Q?sds82omiKOwygXf1TKecIqL9Sn8ZiHs4hkwH4svgeQn/uu6wabQF5kdbFraS?=
 =?us-ascii?Q?/MQR+gYC1KUvbGJgKPLHt/TG5HKakhA0Pw4+pRMMdTT5DDGzy/Ivj29DiaAL?=
 =?us-ascii?Q?2gMfVyssEcXDquey4HfBbmMczqL0NBrXiMeP7qrGGZknZteFix3sejcY/jSS?=
 =?us-ascii?Q?vYxh0qY9zd8u8SrGX7D6G2qjrc+2YAXOtvDbLbG1dz1lvyrQMkVqUruqsuo+?=
 =?us-ascii?Q?WoVeTwJSvVRitGNA54hdYyhuwVermbXu2t1+fs1d+qwggrAyS20Cc0sTc+CD?=
 =?us-ascii?Q?igEcUeGSJfm82YJydLh/eDvkWZZQytuoav+NZnDUoI0v8Q+O2uYBFYnwx/TM?=
 =?us-ascii?Q?bSWsPJ3V1CO44Jk+UaKBeeUJnmzN7/mHRGwlmjy4+cR9Zf4RMlP7RkEnioJL?=
 =?us-ascii?Q?V1MqJM6wz821PFquwWi4cYopjoj2fAGQwfVJmet3SpibezuMErjszLbx5g6M?=
 =?us-ascii?Q?Iou3pWvxMs7TQyeBmwHEZ23Qtfajkn3sHzHpTrdWuj+xn3Dbd57w++eqaAag?=
 =?us-ascii?Q?HUbZF3TZVp5FWeu4ShpxjRByi6jQfinr7btx+npnelvxoSt0lgClWWkhHyhh?=
 =?us-ascii?Q?54HrJIC+AaSQ6Cp2e5uPTVt03ROH3jIFshxSOgorUluu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?htJw5QTkJAmit55oFmTHngX0p7kR7TpV+UFxyYTglb/d+U1DXRudn0qsyx6G?=
 =?us-ascii?Q?+RqNlNuCTBXvBAP2MHOxrnFqqi//USNNkGk4g83Dldc6XINxJSlQT3OwGfRV?=
 =?us-ascii?Q?AoT8D/RZHErS2GqztyPMlaeuhOHUEf5XoB7HJ+cUB5rW1xxvXfdrv7az91Qw?=
 =?us-ascii?Q?vHicfA4rjklE7n9uKu/lcHT6bHWJhTtTiXm5ASQL/D9U7jip2n+rlGox0UWy?=
 =?us-ascii?Q?+rjGUKD8/sndfvkQfEg/KOVKJBiaWbJhSPTO/l/Vp8A37Hl+2SzeZrMSR+4/?=
 =?us-ascii?Q?XiD2DqlIvUR4hDHBOVvkZhUTVNYD/sp0L0ReRhbUUmwRarn9GftuQafJpvm4?=
 =?us-ascii?Q?h1KzqyfUGmPtu9lxudItb/cX0s48XZhhanCVGO0/jkTmMacj5A1XXV1+LPXm?=
 =?us-ascii?Q?R+NRumv60dmxG+5El68rWmBycWZlB5vULInqDYYzg0XU+Pn7hbqsIHcbU8+8?=
 =?us-ascii?Q?LJiPxJm1Jh3IVCG6t89l0C+sHiyZKd8EOHWkH2N+KNrYwskrIWGMNuR1CBct?=
 =?us-ascii?Q?j9yPOJqhMBrE7oqt0XkoRc0R3XMATm0p2L+rWlOQIwHgsNiBnxJW8jEpab16?=
 =?us-ascii?Q?Va7wb/Ghkj9VM8Gz6/exysLFdzMTmQn08g1OytKwsVcSm8GacSH9KiwgEPbR?=
 =?us-ascii?Q?kwWEESzjmjKc93lK3S1wxVdQz9vawEKy4xxImUJ8kcdSu1mSMjQZu0ej7kSm?=
 =?us-ascii?Q?F3bxOAti6k/iEGV4Vy+7mejMMcj+bQOuTAI0q3dtLs510f6sXv9h2f5/ag+h?=
 =?us-ascii?Q?3z9IWV/wpL/YNJKp2jJZS4tfrUnNPKGFd1qjNRYBvVm4dV1Prj0ebBP+1Im7?=
 =?us-ascii?Q?EZJs6Ak9UAmFT9UpN6xj6ZHkGPoueK472G9GzwVWkwlOwqGPrRZtNL6oQ/+z?=
 =?us-ascii?Q?+bq0541moRQzDtbh2WAKJuWoOmm2BTGOe4gl2R1qB8p1DgCNa3or5bV+zJbl?=
 =?us-ascii?Q?swVg7kV1YJvATV3fZG/k3UCp1jKMRCgsfA38hL40/AfflzXFvRgokWjprxd1?=
 =?us-ascii?Q?VHoDOvcCIdkFTjxSEhJNPOr7n6AeTDuDN9/KsvV8CMWsiicIXg+zDKdK7euI?=
 =?us-ascii?Q?mIfHZgQr22tJgGiVTrDdW3TiTDhc7BHZmujdZaNZWxdwYdHCu01tdFkSMHpb?=
 =?us-ascii?Q?RTet37f7Dogh51EJlNtXvD0mqj9oFDGvNpB5yYaw8WuntmUJChS5iRpEKSCv?=
 =?us-ascii?Q?9bdAQkRBuvMKWkWB4QQVpaNUwh6LKMwHepbz7h+yM5OYOHeBDUMidpGKMQ7D?=
 =?us-ascii?Q?U5ErWvLwmkRIWha8hPViPckixQD2KEg7AeYuOiLvn9vl04MDgubtPUChdBzh?=
 =?us-ascii?Q?lcEmtXsaHQT3xJh03NfdzRwsuhzksXZdt2JpQ8nsZ47G511Ah4y2GdGmWIDM?=
 =?us-ascii?Q?me9DXHJ4H6LOc+0FlGjuscfDKYROoQu2Wk8ZwsGCyxI4mtp8DU4S9dXa5TSP?=
 =?us-ascii?Q?73bkHPh2JyHf9L/xSHxeXHzyVvOjiNTCSFwsju8W8sjR/K62ULdTUa0RU8nD?=
 =?us-ascii?Q?RUQTiRiEV9i0pR6HFgu2HuebMXofZEYVvo/Bg96Dw3XZPmOwC4I3OjjBIlBb?=
 =?us-ascii?Q?K5kME+xr0vnI3R5v+lq8NeYzNUIii/dmedF5kGH+kkNjFvbMV4a9MOgMGR0X?=
 =?us-ascii?Q?jdG5CI9lBqJ2StlNhgH4QORiuiil6n4uzGeBtUa6dMIhoXYR3D39k/o+RFg/?=
 =?us-ascii?Q?USJKtZtzW9jRGAogyrfidMyUTnNgCz/2DAk4jUqIqRc7T1YhvyrO5AG1tdY4?=
 =?us-ascii?Q?otAREAtXNw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec886246-baa7-425b-8c64-08de54e8718e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:17:25.0853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJpng7i0YoGc4bLKl1nn9yzAq4R4drXR5GWcevOLDdEF0U8TprYmQYAh/nTQzpk9TXGp10Voud4V9ybQz8iBHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11598
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The specific feature for AUDMIX on i.MX952 is that it can be bypassed,
so add fsl,amix-bypass property for this feature, besides this there is
no power domain defined on i.MX952, so make power-domains to be
dedicated to i.MX8QM.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
index 3ad197b3c82c..50fb08460b4f 100644
--- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
@@ -34,7 +34,9 @@ description: |
 
 properties:
   compatible:
-    const: fsl,imx8qm-audmix
+    enum:
+      - fsl,imx8qm-audmix
+      - fsl,imx952-audmix
 
   reg:
     maxItems: 1
@@ -75,12 +77,41 @@ properties:
         unevaluatedProperties: false
         description: Output port to SAI RX
 
+  fsl,amix-bypass:
+    type: boolean
+    description:
+      The audmix module is bypassed from hardware.
+
 required:
   - compatible
   - reg
   - clocks
   - clock-names
-  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qm-audmix
+    then:
+      required:
+        - power-domains
+      not:
+        required:
+          - fsl,amix-bypass
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx952-audmix
+    then:
+      not:
+        required:
+          - power-domains
 
 unevaluatedProperties: false
 
-- 
2.34.1


