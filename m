Return-Path: <linuxppc-dev+bounces-16226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENAWCQRQc2ncugAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 11:40:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A08267465D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 11:40:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyDvy4t6Fz2xKh;
	Fri, 23 Jan 2026 21:39:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:c20f::7"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769164798;
	cv=fail; b=fVQe4mHj/1+yXmf/M+VWSRd2C7/ByK3CS0qAZPoQT4rQ0cebe9EN2oBfWbrBWbDMxKaTXNAObz+rZExekPYKtsyMTQ1b4R/eSdNj4oZ9jWTzbsvPzhvZmidUiV0ElqA0g8LjpbMT7tT9RSCiyQiPgUX/Rkk4yzbf2fh7yadfT4Y6raaoM6WzSdSG2oX4YObudaopEbeKsCPGcCdjAE/098RTg3Ovin/2k5cJZ/AosajO1urBkTZ3jK36CE0b3FRx9/Bbb2xcQ5Vy6rOkTdhY6GMxxV4pgOmaAMTKvwe3iCUgk3aHURgUDWxP6gjYPMLPsdZYbH7KK2stlIb1+Fl1Bw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769164798; c=relaxed/relaxed;
	bh=NPrH3x0e9X+ieMAcrjCOe9Q+M4FPte7GFur2KQ6ky7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eJy4Sgv1dZNYiYXWbwiprkdG4LYX44BbDBSFbbuts2WC6xOGTqCw4Crl2BphKHWJovgkytrt+RmBNZGsU4d8MI0cq45Rbz9oh2loePOSZvs2yYoYwtcM8FLYa3M9RLkeE9sjBZORmII/vn/pjn7RAGQRV34HGt2D3QabDDjTS8RUe6uJCh/D7x0c1DoZuZ69mGW65mn0Is3tXLeWlzyNOIQSWw2QxpTDIPoP+JgqBySXVDuOdK/BzXRMMOs6wh5pJ2adMrR1rGhGxGAjJ6h+iLU+ygaqpRHXBM7nwKf/DX1gFSjuyqoqweY9hbNXBNxOGY/3lLk7R52Zaq0CCtKoAA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com; dkim=fail (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=T8U3glJ4 reason="signature verification failed"; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=T8U3glJ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyDvw5G8sz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 21:39:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uboogATCCxF+yFUjeLq39hGJawdnPQ2EbkBVRRcJohHp9cIorG9/alFNAKFw0YWYwcn87SyIYrxUlRPSQ7hV4vvLfcMsgdIIN4RqBuK+0FPpCFZMBPPmQbco3AF5bZB1r3FcRADIFREhoLZCPm5/Aq+msOeNooMeRHp5e8QizGng7DbvaOK1yd+8KbHQ0cWBdeGKlXFFSTiIePJqE3RB2Zz4Y2sN4enMbkT/qqMqxr8tk+WEyapilqFVZZ0Xn2lBU7xI0al5MqeZqSyUaR8oPGTryvThY56OYosmeZe6IoY/y5E5ntd1r5v4KzpJHVjBaWUirGdUvCjbpV170xt4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaSNAg0HGT0Kn+3/o54MdQ1c3F9j8gd3/Tho9np5rHU=;
 b=BOOww0ZtaKtbcsxbfdKly0puKrofhZIKndD1cma7HVm1QgfMP+eW9A5uxut9IOgeMmEci7gx71EiZwIAJoToauRXM+gErOgpUrM4NOB8uv1BiEEfo/GidzWuV/7NeaTD/QELvyZNyKFELXHoCrg6Mp32tiGFQ9ntTeVCect5uo3KlFa60B95Ynp0P78zxFgNmQoTVIRVPWvlHT5Q1PyolijWGGb36kIfLQ5TL4AWeLgc4aypvXayEdquESRQrMr3oilaOca6CSTeonct/oJn7nocIFNARPw+7Zi9+GvVzwsN/FlkTUs20TDU8pYoCyzqV0j6XUNPjXV+PHeiEeSC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaSNAg0HGT0Kn+3/o54MdQ1c3F9j8gd3/Tho9np5rHU=;
 b=T8U3glJ4MnbI6xOZZJWebSzgEx9GdkOWsGV66TRnAohZuVntNuIZpAxiT3225ZHSgzUmIKoAoS3RT0UUT3TF0MFTw19YFIhXJr6IK9MMYk2v/omC1Kc3l96u5le9SPgg7KaW+OMYJdHw1Kvihy5A+GaBmK4KupbzE0j91v3tPBy1pqJQfduFCt6mYwm6pQD0vrnHVDC2Vgci7q660FIr6/csD+vMwSdJHrhE45Dqz63VIgtou09NmfPkjATd2Wl2FnkFfZ7GQORNnRKNkaA/thfM/SGrZLbgcFLNCqjC3dIHlRr4nEa1iEp7pfKzmt8+jy+0Of/YnZjYRGZgJxAZXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by PA2PR04MB10088.eurprd04.prod.outlook.com (2603:10a6:102:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:39:27 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9520.011; Fri, 23 Jan 2026
 10:39:26 +0000
Date: Fri, 23 Jan 2026 12:39:22 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, broonie@kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jakub Kicinski <kuba@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Subject: Re: [next-20260122] Build failure on IBM Power Server
Message-ID: <20260123103922.sr7m7py7d4afvc2f@skbuf>
References: <43ea0202-891d-4582-980b-5cb557b41114@linux.ibm.com>
 <f07d721f-ac80-4421-86a3-1f7f76ea8e6c@infradead.org>
 <136ae3bf-b1a3-4ee8-a7ea-dfc90e7b4baf@linux.ibm.com>
 <fa330d98-653c-4643-aee9-9697068e734a@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa330d98-653c-4643-aee9-9697068e734a@kernel.org>
X-ClientProxiedBy: VI1PR07CA0300.eurprd07.prod.outlook.com
 (2603:10a6:800:130::28) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|PA2PR04MB10088:EE_
X-MS-Office365-Filtering-Correlation-Id: 048e84cf-5996-4fd8-7df5-08de5a6bae18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?PkXBY4fHuETMNBaqTCmrO8jTBpB5K/LYYmUgttTzJj0zVkBjO5RsnBbR3h?=
 =?iso-8859-1?Q?4aHruwMOP4ikW1ADtSRHljVq7LKO6wsJTYTd74r+cKJOjtROnspKl6oQaW?=
 =?iso-8859-1?Q?BFEpiwQVqzg3OD23RAQh9iSw3HrNrLKKUbfgijzaD2M4qV27D1mDvsiziq?=
 =?iso-8859-1?Q?acGY7sQmIzQlf0iI6Is28IQweZfC+h/7EpeZ9vr8pOZD75wEXZgIqPQ5u5?=
 =?iso-8859-1?Q?HWuiCvfvYOIIFbb2MPay7BrSSFhiCnx3VgJMo0GFzjcwix/XE3ddI8CF/1?=
 =?iso-8859-1?Q?BaC6GPGZd6DXXjkDkJbYAgPtii1o0f4S/QT5BJ1rlJhiFethL+QJslK5O9?=
 =?iso-8859-1?Q?+jGP12LcVBLJBmebOr3rX3Q0qRTLlU/pQyLuD2eoX0PwEG1fwt3KjEmrrP?=
 =?iso-8859-1?Q?OJnA6Htfh77jo2ZKBm7pYgOT3xwdpwU4AEH4tB0J7J5kA1J6UuNHQxX3/6?=
 =?iso-8859-1?Q?FpuFVHf487KUZ7US/V6EJqxH6ucNpV1/wr24yG4LnhBjwSE0RHfin0oCTu?=
 =?iso-8859-1?Q?Rw+MAGzXlIxqBBkwAiNdMlrq7HoKinOzj2lJa8umjeya1x8c7q3NOTDIuX?=
 =?iso-8859-1?Q?U2lrGBAp6msZFoIBcQczBqwfolZNpT6QTzFE4+wBONT5BIDpRnKmpdFtmF?=
 =?iso-8859-1?Q?SQoya91XzDJN4UnSmfPx3kDFXj+YrL0Ujr0euHZwLS7lC3C1U/7y3BpMu7?=
 =?iso-8859-1?Q?+RaWE7i04QhmEXLMbY4gIuFo7nxfyqXfew8LRQWJ9t3xuo3JXpny60yk3e?=
 =?iso-8859-1?Q?SDGpwERvV7woiTrfqm7Tn1vWddlh1l75GhE0GsQHb6GMeirqU4cV25SNB1?=
 =?iso-8859-1?Q?+0DMp26vXkSXDQJB//sDlQI5RGAugBBgkDi/P6L747pvncOmFIH7hfcajv?=
 =?iso-8859-1?Q?aanjXlOeeO1oequFASzlo43d8DHRc+2YJN2J89pk2xbmko/Nwzkx2UmM6F?=
 =?iso-8859-1?Q?U43yV7/r38oeybmFtUsziaxaQjpHChwMT0SvA6MCi2Qe9U9GV+ueADHZzp?=
 =?iso-8859-1?Q?EEyccGWftc/HV8pNPLG/L6MqX1In8eg990p2dQMBHA1ZCBJIpzuM4rn37l?=
 =?iso-8859-1?Q?8WgmHL0Q53bR8YRCo4LR1cN89/m6AtTN00HscgWgC0cqSbcJT5fr3CBYl0?=
 =?iso-8859-1?Q?AeGcZ8dxpDj0boUL7otQio5NPUCyjvt/YekXMyfGsRPKIlSN1DSuXtBbIr?=
 =?iso-8859-1?Q?UViVLqq0nFx0/9Ne+O8cPAYPvdnQVTbYoTM1NYMV+Rj/aiukzEdP7jSigx?=
 =?iso-8859-1?Q?G8RGgvmhCdRP7bHlaVuiDeAWO2rW+IKw3TYI14O72R8nYHa7771/xd8iu6?=
 =?iso-8859-1?Q?NNhXQAClGziWdQ/eGD2bQo0JmNXXYTsQXnwGxnighDz+SPSm/YRs8yJBpF?=
 =?iso-8859-1?Q?6Q2O5F7XeqLCVdDafjnxLnvkp1UXyJOx95vfnI3ao+6AGHj84Pq8VM6Fg6?=
 =?iso-8859-1?Q?9iR+tth+sL6m6ZlGT6c6HLgKUchLh4B2JYZKFFDReXk5vEwklie95FfsPF?=
 =?iso-8859-1?Q?I28Ej+IW+XYX04fFfEFTkeAuRXWvVjydh45TsOrffW2EvwOaxT254w3b5p?=
 =?iso-8859-1?Q?N6iFINBfKh8VEYrLUY2OMTLMK5gpAMDeKKBW4/6bk0tY2MKY8TWnvOEJh4?=
 =?iso-8859-1?Q?UrMCti/Ce8wuQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?qB+/Gd087/lt75LXCOVPZE8+68SEBTAhQfCW1e2fWIEty3TFwZ7wy/iTLJ?=
 =?iso-8859-1?Q?ZfYyOZr/yIUy1PWKfqXvSaJaJEj5uerW1OlJjbDIbzpVNCRvWRSejNrbZm?=
 =?iso-8859-1?Q?rE3keMg8cMxfOColsgq2kA5DovRWSjHstHjAQzQocWiG3CZSYAucpixQmY?=
 =?iso-8859-1?Q?LCqTKGntfi93f5JpxFwk1UByrPy2gbb89i5cA6OJMVeEC2aERGFVF9vMhE?=
 =?iso-8859-1?Q?rLX2lK7BlhUSd8hJRfn8WNCyutvBKJF9VyrlLalBnXv8ksNHH6vQmY7kJL?=
 =?iso-8859-1?Q?2bAG9PCSTI7tWWqk0u/9PEmiKI3eF0FQ8eFIYgW4JMn6T/+Yc5OaE1gvR6?=
 =?iso-8859-1?Q?xJsv5yszLEJmMr15RQUIUeL61RtTuuWor3gqIofzNZnr5OM4HI0Uk7EelN?=
 =?iso-8859-1?Q?Yzflf5bqAgUSP52/da+Gdu5fFEiMZSZmz05VP5ORc6dAXWYG0y4hvW31TM?=
 =?iso-8859-1?Q?MCshRL3yA201NsK9f6+1edZnmE6heSwOpenr9DgdaS7DBWYw6Ra8tn1zRd?=
 =?iso-8859-1?Q?yu/XaCbDzImHLkS+Jdmh2qyDWEM0hyOJt9LF5CckAgYNX6SAC0NLJSifnn?=
 =?iso-8859-1?Q?0BNq7zcEuDNxv3dnGxC9zRo1n8LbGpeN1LjbjAGowGRKd1w6KsTQu5Pwzg?=
 =?iso-8859-1?Q?QtUAewGcDKdO6gj7lGoRM6B6nKJTDi2OLUq22wJUmOQL0RqdLh1GMWtEI3?=
 =?iso-8859-1?Q?KKEffpq2BK5afuNN1AWZ6szMiHq/TqVDoK6SHDFlVtZ8tuBKpp54R/D48W?=
 =?iso-8859-1?Q?2xcpnPiQL2cQ3+nShVU2Hk4mIE7ySG6a6cLxk9KKaw2Wm6Ejil9VzGo0XI?=
 =?iso-8859-1?Q?kkpdZ3szL+sDgQEE18wkMzl7197g+dYBHFsPJ9UQVcdYv8EYDS+T5eSQwu?=
 =?iso-8859-1?Q?bUrXCi13QfDUg8j+NZEx7HmEtQHXQMDnOunjZcFQZPLnG18sa6/6Log5xG?=
 =?iso-8859-1?Q?Po37Q8G7ZXhy6gOu0v4UfyhBYV3Uu2GZcDpcpP31YPK/jddRNNSlHoMfOQ?=
 =?iso-8859-1?Q?HaknnuJqynj86v8Qy3APnAf+Na4Uuo8MRy+oTyYMyRkd8SQLMEoD33i2Xc?=
 =?iso-8859-1?Q?IO+ANyOV+0kBd7tUud00MXW3x8QuIZPWAbLu+QwsFcLpoEs1ujArraFcpD?=
 =?iso-8859-1?Q?v0A38lxPs1u5VJC4VboFJfGDmV1PSJxiSF251lL4eXz60tKKQbVTmByCXu?=
 =?iso-8859-1?Q?YfX9MlauXHtzMA+YOZDI0WY8r9aFPD1PlumpVgYMaT9y5U0tTmmk6zWosh?=
 =?iso-8859-1?Q?QE035AXywgN2XLomtk/CFcq9+E4mwpWRGgXnk0CL67gd3YAPAAFjeJvfox?=
 =?iso-8859-1?Q?52dRSGiUr2vYTzGcnTYARXjmcsrOdWDGepMkPZxlHAXzqv9rJgGXd9fkmU?=
 =?iso-8859-1?Q?jR5wOCZowwl/MWtdocUkJ0nFKNrehkUGhKvd+0vPQejjv1UD8MQialxUAt?=
 =?iso-8859-1?Q?+nF1ZH7yMdolMEgDUEhJ4nLzlS+mYdzNxIbQ8s/aV1FN4k15huF32UcLob?=
 =?iso-8859-1?Q?a3zt0tYC3Ym2kOykjvdj5o/Zt7UG7gIUasrol4Ux9nOC81kdcR6jOWkKX2?=
 =?iso-8859-1?Q?s/+qd4MXW65AJoWC2k1BjWXC8pGgkhA6yYzzyb5N1k6ovREoK73a4bQPNx?=
 =?iso-8859-1?Q?82oq3yf8a9L0GoY4P2CGvHj0Nsqm9p1esL5BxvIaxY/rBq6gEgIfpASi5y?=
 =?iso-8859-1?Q?ET6/vScYtzNQWOgxIMRWifkVh/+Xcjt9jzRpOrPbMTX19X1faXdCq5HFv1?=
 =?iso-8859-1?Q?uwOsJ0HX809IVAvdpFYPIFh4FHOOMJ83IPpF3X1d+OTV4ES0Ldh7ug06ja?=
 =?iso-8859-1?Q?B3jbQEz7LJbN4MX20Ar4XYX/StaAI/hqtKkFY766EBRQEWEda8g7ltK+CE?=
 =?iso-8859-1?Q?VE?=
X-MS-Exchange-AntiSpam-MessageData-1: 2fvLJL04twuUqz/3wTzoI4LWAMR/A+C8s8o=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048e84cf-5996-4fd8-7df5-08de5a6bae18
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:39:26.7815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChfkP9A6x3HyC9inN8+KGggiq91fCXOcdwRy6yZR9On8AmqdlIIARf2MNUv/Vn102+I7n50s+yNIAWABPfOvQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10088
X-Spam-Status: No, score=1.6 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FORGED_SPF_HELO,KHOP_HELO_FCRDNS,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_REJECT(1.00)[nxp.com:s=selector1];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16226-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[vladimir.oltean@nxp.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:venkat88@linux.ibm.com,m:rdunlap@infradead.org,m:maddy@linux.ibm.com,m:broonie@kernel.org,m:linux-next@vger.kernel.org,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:vkoul@kernel.org,m:linux-phy@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_SPAM(0.00)[0.226];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A08267465D
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:52:49AM +0100, Christophe Leroy (CS GROUP) wrote:
> +Vladimir, Maxime, Jakub and netdev
> 
> Le 23/01/2026 à 10:11, Venkat Rao Bagalkote a écrit :
> > 
> > On 23/01/26 1:17 pm, Randy Dunlap wrote:
> > > 
> > > On 1/22/26 8:15 PM, Venkat Rao Bagalkote wrote:
> > > > Greetings!!
> > > > 
> > > > IBM CI has reported build failure of 20260122 on IBM Power server.
> > > > 
> > > > 
> > > > Error:
> > > > 
> > > > 
> > > > ERROR: modpost: "phy_get_rx_polarity" [drivers/net/phy/
> > > > air_en8811h.ko] undefined!
> > > > ERROR: modpost: "phy_get_tx_polarity" [drivers/net/phy/
> > > > air_en8811h.ko] undefined!
> > > > make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> > > > make[1]: *** [/home/upstreamci/linux/Makefile:2040: modpost] Error 2
> > > > make: *** [Makefile:248: __sub-make] Error 2
> 
> Thanks for the config file.
> 
> The probleme is because allthough CONFIG_PHY_COMMON_PROPS is selected,
> drivers/phy/phy-common-props.o is not built because CONFIG_GENERIC_PHY
> is not selected.
> 
> Likely comes from commit 66d8a334b57e ("net: phy: air_en8811h: deprecate
> "airoha,pnswap-rx" and "airoha,pnswap-tx"")
> 
> Christophe

The intention was for drivers/phy/phy-common-props.o to be
buildable/usable without CONFIG_GENERIC_PHY.

Does this help?

diff --git a/drivers/Makefile b/drivers/Makefile
index ccc05f1eae3e..53fbd2e0acdd 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -10,7 +10,7 @@ obj-y				+= cache/
 obj-y				+= irqchip/
 obj-y				+= bus/
 
-obj-$(CONFIG_GENERIC_PHY)	+= phy/
+obj-y				+= phy/
 
 # GPIO must come after pinctrl as gpios may need to mux pins etc
 obj-$(CONFIG_PINCTRL)		+= pinctrl/

> 
> 
> > > > 
> > > > 
> > > > IBM CI has bisected this issue and below is the bisection log.
> > > > 
> > > > 
> > > > git bisect log
> > > > git bisect log
> > > > git bisect start
> > > > # status: waiting for both good and bad commits
> > > > # good: [24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7] Linux 6.19-rc6
> > > > git bisect good 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> > > > # status: waiting for bad commit, 1 good commit known
> > > > # bad: [a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d] Add linux-next
> > > > specific files for 20260122
> > > > git bisect bad a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> > > > # good: [2574bcf1765ec13bf3ef469aa5b15cce293aebb6] Merge branch
> > > > 'master' of  Warning: Removed corrupted safelink. 
> > > > url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbluetooth%2Fbluetooth-next.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441808471%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=FlVDfg3VVHplFxnQpG4oQNlr5Mm3ZzaCve19hnomYNo%3D&reserved=0
> > > > git bisect good 2574bcf1765ec13bf3ef469aa5b15cce293aebb6
> > > > # good: [2ad38467d20c16f38d0cffad711ef4f4acdb8b29] Merge branch 'for-
> > > > next' of  Warning: Removed corrupted safelink. 
> > > > url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Faxboe%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441834557%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ez4lgXXDn95PjgZNSAjwp%2BWbvJvQYLeHApGrODqs%2Fmc%3D&reserved=0
> > > > git bisect good 2ad38467d20c16f38d0cffad711ef4f4acdb8b29
> > > > # good: [a954370fea56ee1bf995524255a34da7a1ddb524] Merge branch 'for-
> > > > next' of  Warning: Removed corrupted safelink. 
> > > > url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441853661%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=c4Fim5nuBV9O%2BfFTUltpoLTV19%2Fdy394PvzzGBxh8I4%3D&reserved=0
> > > > git bisect good a954370fea56ee1bf995524255a34da7a1ddb524
> > > > # good: [c7ec480f05dd0185a26f190471905ddf1215bc52] Merge branch
> > > > 'staging-next' of  Warning: Removed corrupted safelink. 
> > > > url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fgregkh%2Fstaging.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441870081%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=xgtRCeDKj7BL1EXx%2BSEtCzR5gaN6wKfihyiwh0AFsRM%3D&reserved=0
> > > > git bisect good c7ec480f05dd0185a26f190471905ddf1215bc52
> > > > # good: [4427398fed2b8e07a62fd4f3f6fcf9ffcf56829a] Merge branch 'for-
> > > > next' of  Warning: Removed corrupted safelink. 
> > > > url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Flinusw%2Flinux-pinctrl.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441887814%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=AzoGH2fuDhFyYqK9JxlVZEsx3V7P5x8Yc8%2BuVE%2BBHJ4%3D&reserved=0
> > > > git bisect good 4427398fed2b8e07a62fd4f3f6fcf9ffcf56829a
> > > > # good: [852ccea1ca3144beb7003976d4fa04dbf81b307b] Merge branch
> > > > 'next' of  Warning: Removed corrupted safelink. 
> > > > url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fmic%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441903764%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BTtdFgkDy9QevJOIHlzjk7Jjd1390L6g0Nr5RpSTYp8%3D&reserved=0
> > > > git bisect good 852ccea1ca3144beb7003976d4fa04dbf81b307b
> > > > # good: [f174dabd307dfd92edacb34e8bee0384daa1bd2e] Merge branch
> > > > 'next' of  Warning: Removed corrupted safelink. 
> > > > url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Flenb%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441919983%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BaVHILI%2FJcj%2BedPEPrJ1zFeSRGwuXUKb0VHFpZ%2Bp95s%3D&reserved=0
> > > > git bisect good f174dabd307dfd92edacb34e8bee0384daa1bd2e
> > > > # good: [e31f3c967c66cf03eecdf50fe138d05f635e3698] doc: Add
> > > > housekeeping documentation
> > > > git bisect good e31f3c967c66cf03eecdf50fe138d05f635e3698
> > > > # good: [0cc83fc23debf3e2df19c4510a77fe2d60ab2693] gpu: nova-core:
> > > > don't print raw PMU table entries
> > > > git bisect good 0cc83fc23debf3e2df19c4510a77fe2d60ab2693
> > > > # good: [75df6953fed6b7274f9c5080925ae4c8d3e424e6] Merge branch 'for-
> > > > next' of  Warning: Removed corrupted safelink. 
> > > > url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ffrederic%2Flinux-dynticks.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C441b227c282845cf2a3308de5a5f8110%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639047563441936107%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=beNKxNQCA6SYkfbETF9eJYQ7mBFWwCKUFce6cwNbHUA%3D&reserved=0
> > > > git bisect good 75df6953fed6b7274f9c5080925ae4c8d3e424e6
> > > > # good: [086714bbb96f63785da251e1f8d1ce3e716a6e42] Merge tag 'v6.19-
> > > > rc5' into drm-rust-next
> > > > git bisect good 086714bbb96f63785da251e1f8d1ce3e716a6e42
> > > > # good: [6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331] drm/tyr: use
> > > > read_poll_timeout
> > > > git bisect good 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
> > > > # good: [b956937ce78fae5fa785f6a95f291e2137502c5e] drm: tyr: Mark BROKEN
> > > > git bisect good b956937ce78fae5fa785f6a95f291e2137502c5e
> > > > # first bad commit: [a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d] Add
> > > > linux-next specific files for 20260122
> > > > 
> > > > 
> > > > If you happen to fix, this please add below tag.
> > > > 
> > > > 
> > > > Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > > I don't think that bisection helps very much.
> > > 
> > > Can you post the kernel config file?
> > > 
> > 
> > Attached is the .config file.
> > 
> > 
> > GCC: gcc version 11.5.0 20240719 (Red Hat 11.5.0-2) (GCC)
> > 
> > ld: GNU ld version 2.35.2-54.el9
> > 
> > 
> > Regards,
> > 
> > Venkat.
>

