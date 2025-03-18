Return-Path: <linuxppc-dev+bounces-7165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABF7A668F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 06:06:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH0Dz5wlBz2yrK;
	Tue, 18 Mar 2025 16:06:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260c::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742274403;
	cv=pass; b=WXiBl0n1waYv9H1VzlHvdG+0WzAiMnO+CbZ5a8JwMoDkImTN5GQVTtDEKlwvZKRJLxhtkQS2WLKk/tSn52rNJQmEkZQDstzB0ESecDviRyJhP7WV3g5SPIDa4A8WBiMjEHolkm438Xn8nDjRF8BKWVg9Q8b4l5xN2DRxHKh3tNndy1iTT0WFpzoWs8skpro/6azQGci8RDvlMyM5V8F6M+pfN9aHSxH6Pu7Y/9Vh5W9c+5yEcxzae9qbjmw1no/f//+6i8malQ/+OExPgzCysltgJNKPXg+VeFLvVMfPA4E+Sosy42j51frDhKpifABIXT2cJ44hi8AocsvkFYZsew==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742274403; c=relaxed/relaxed;
	bh=spDY/DFHrWoei3zhFdHZjoAvZxzcJ9c+gtPIkG5h2E4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d7uAZng4kmHFYt3UcSWw8l/iqav0B1IDufSstqpVmvK+RYuC3EQjRVSRFiWwNTDvupQ3oAWgNvwFY3x110040diIxhiZIcdzObPI00xHkQ3NxSijkjVtykKiHyE2mZlA2TRm6k4mgBRYvj6fSbSyCcwmbltW8kzaiL4lIiszZ0vwf1C8dlN2jG+/tPByEQTaCGrXxXDuwOK51lFB4q7iCtM7ZypUrhPN1QT6gkFUPW/Y7F68P8fh0qBpUqM24T5YyRr1uMG9HnII0d5rZexZg4F0F0llCEloLgLH9B9elvW+5sl/KgwQTC77HiMSH1LXjt21oxdbZv66ajnby8heaw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VzMvNr2S; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260c::61f; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VzMvNr2S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260c::61f; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH0Dz03v6z2yfF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 16:06:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynSW0G1fnI9GRdAW9zmc2u3L8jXJH76Dby7/Ma0x9/8sZGMI5qD3US3tZs2L4TBeg+UfmuiO7AWQErOKbSQU5d4YIKgXaZpyBQPoPg9o/UY795wmEMo27J/V+OuBZRNQl5K7HG6bYgJauSlvEUj/vXhv8vL44qeBjl5TXCo4rfurgSnHjdjPZyqNDenxo7vydXXIg1dzvEiT9TxSOFLfhmTtXUDzoA0lwSjCUoWrF0eckhTWYEp4xwXgNvg95pGUro8PqGmPiUGh0oaqxiJM8YCYYAaQMhqzkDV2f2U5HDyuWRTI2U4np9x8uj27WAE1FGxPLLlCtwoRrNfJxYRkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spDY/DFHrWoei3zhFdHZjoAvZxzcJ9c+gtPIkG5h2E4=;
 b=bokdwpp6jwi+rTU7LB4QOKYyuRFdnzWGeVi5UFlpY2SFjMCunRXI4k+SigOjklvWCHseymYpEliF4I04b5T9MdpcZFlt2TTR/GI5M2YrCup6iV0O2QY0+skqCZ7FZ9xaUdGfEC0fKsb+A9Qkcr9Hl5O621SPBrEqSrVcg26kufTJpNqNldNAYaQnccKrHSLbi9wrGAmx4nMzN4D2Wh6UmVVmjbZ1s2bV1pMHagCCce/0ZsoAvkxnMrgMSv5Sz12Urh53k0kZSUJaLXgSGbXUmnleS7UCFnp/F+WHkyfcdaVNNLlCC9ZfTulVqqEozpvh4Okq+4Nat/haDCs9ubAiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spDY/DFHrWoei3zhFdHZjoAvZxzcJ9c+gtPIkG5h2E4=;
 b=VzMvNr2S9LhPZl5JEgKMVcrqN5HAdWhGi1/RdSS3I1JLa+gs7Xnwz0BDSuQE2EyVKHaW+bIJXHLVM8n4pH+bKkSWy6rzcALfGXngFKyzGRFdhz+NP5nwCyTrcmq+TtyGRXCMZHBDJJbrJsBS4fFt+nfoWXloqiEOpHTJzldCJKYIuqQcOtauH+o/DKiaW8G4pQKJNQpmjoxk/u2Fv3xvsSHqBIAGahfpHPqFcO0TAn56zW9Mf5d4q3OVandcUzaQwmrFpWSMq+Okr9QXCmnIyb4/WesjOcygOYtNuOLECi3ru1XWYROavbEeorK0LB1PX0JW34LnwL1g/QVti0n6wQ==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV1PR04MB10536.eurprd04.prod.outlook.com (2603:10a6:150:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 05:06:23 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 05:06:22 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 net-next 06/14] net: enetc: add set/get_rss_table() to
 enetc_si_ops
Thread-Topic: [PATCH v4 net-next 06/14] net: enetc: add set/get_rss_table() to
 enetc_si_ops
Thread-Index: AQHbkkpWeHttUm+uaU2h6/4/LTXyELN3knOAgADOYLA=
Date: Tue, 18 Mar 2025 05:06:22 +0000
Message-ID:
 <PAXPR04MB851032D673522F8548855B7188DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-7-wei.fang@nxp.com>
 <20250317164205.bp4vcqarggp3fnf4@skbuf>
In-Reply-To: <20250317164205.bp4vcqarggp3fnf4@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|GV1PR04MB10536:EE_
x-ms-office365-filtering-correlation-id: d73dc0e0-e97a-41bd-519d-08dd65daa091
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?90vkFw9ehCrTSQSuN3WlzzkSaQqCsoHHS8FkWb22dDWJqmwEFOfArmMtc5lP?=
 =?us-ascii?Q?yGtT4xeHPTz8ZUUAcKMIsVOdvCuJ8jdGUkmJk8TrPiPE+PxNZgJzgMb4Hrpi?=
 =?us-ascii?Q?+MM437d85fkj3B/BYecPnyYfM/H+zejB6I6kfDlskFUlnUMBHc3RunuGkZ1J?=
 =?us-ascii?Q?fQkPlrQppSt/0DYKP2c37V2eQXVWZdwwVUfuIg3y1N5mMr9OB7yM6GSGNymV?=
 =?us-ascii?Q?6l94yaqf9sTBmEJhb+tSkAqkEwBR0smTJIwNEbJoI+/u0reTLU2wgbkBmAWi?=
 =?us-ascii?Q?0c8jFuJNRlINTCV9ATjCScPhA96iSh8ghdz/B+1AFE6O55RNdTj0+DlZhmsh?=
 =?us-ascii?Q?4PKghsIuhdp8UCIjoU6bqvvfx+4MqiDRkjwJyVoU55C3RRq+qMOU1GQqARqf?=
 =?us-ascii?Q?IWvKIeEoGtwkAnT1OY3jTPWeWiQ1L5xiWQOWTKMKHebMH56Y66cBOlpg8k8A?=
 =?us-ascii?Q?oVeZi52rcVCJM337EByiLhtenGMgLAq/GXF1lAWOJ+1orjW3534UT6wcp6+L?=
 =?us-ascii?Q?gpoioDH/TIHvOyuQiUuFYkbpIQsAx2okcUn9lyQfIdlJDBZHaifznYgN9SX0?=
 =?us-ascii?Q?CGF214obSIU01699V0HqK8huzBVs7QrZs3ONV5fjruWkXRGyTLi+/nRilKVg?=
 =?us-ascii?Q?l2eLlvffYF4WBlvmdYcDWjLqin3QMD08x9BJc+l0cGtE+nw2aZxAM7ISRGgx?=
 =?us-ascii?Q?GigYSqUTHYtkehBtWG8NENnLvZm0VhhkvyUztY60erHzDBan9SHT+CS6vXHO?=
 =?us-ascii?Q?zvz9O1O40yPYJICCPp+H+ki2JWi17t1ZgHVQM2YviUiqDpUv1Ynqlr8URsD0?=
 =?us-ascii?Q?FOvNdQsoDVVUATBSCUlULefYaAFbwwfsTfMb8PNnHwZk52WU6dc02Eo+Fld0?=
 =?us-ascii?Q?8P+SpCPBBqufyk3t5zptSAN+0uDNf0ZBow06GLeyX729SyoslysIWzNasfI/?=
 =?us-ascii?Q?O0C6UcQFFBd8cDJoq9hpV5iqrvbPzHM7tLcv11y9n7NB1sN9zQZDLaWEqMtg?=
 =?us-ascii?Q?sJ4lcY0bEoDCViiyyyzut11SopIKfe+fPwvbQmcNfNW3aIYFcoa0/zSml6cf?=
 =?us-ascii?Q?wvF3KdI6L/LMlYy1Lm8LHaHwoAtvb9GC+AcdvqXJRoS829KGbALxLrSbEIdC?=
 =?us-ascii?Q?/IYoQEViWTlRyI1XI7tl3NJzGj+IKWRbdjbaK0FN9t1q+L+y/+yvGAJRN0uo?=
 =?us-ascii?Q?3gHThsDkZtC5PFSJLXtThEkU7hfvyWJOM7S8XCck1lSIUgOlIJxsMBc4bV+4?=
 =?us-ascii?Q?miJNNPjRA2Mcak3B6dDhd7hOn6U0aVLE1SmjDMF8ku/LcjZ/6lzHYfU+JD1t?=
 =?us-ascii?Q?ycIGcU/+M6qcMo9VIK25ZccLHOaxJtWhB9aDAubO2VLNIiixPP1PSytNZh4a?=
 =?us-ascii?Q?kdv4iOjdGuhizph3TtXYFPyewvvKpHm3MY6aSYAUY4vkc7Qho29GQVL8REbM?=
 =?us-ascii?Q?mkEw33otZ+LsXsGrFL4H32MCA+WB5bME?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LD8ajySVRoIpOmCxJi6cy/IukgvCSwgaenSOKTwNaDsSjUHcKCD927P6i+m7?=
 =?us-ascii?Q?H1Ps4NPfuZ8HV1CCGTC3QyYdiuMtGSUmWDRsuPVtRRhynji4d3knix67MhUN?=
 =?us-ascii?Q?kaeK8eMFMrj97unfG8bJlhDUmVLqBxEayi8tHOqCVK0JSQBFfECoKkNPZDZ2?=
 =?us-ascii?Q?CNnEL18tyo1gY76nBdkavxpf4YTjenW+kBh4rzbRPLEW9zA/7b+SyStIh+QO?=
 =?us-ascii?Q?4MTsbVVdREk0nveHJzdt5xHuITP4M2PEQ8LjGQ6jWHRUmoJxyTsyzb2jz2Ep?=
 =?us-ascii?Q?dRjF3zVmBpLdeBKsfYOijgOL93XSfP6gGW5VrdEXNd2KIKjl389ckA2+fh84?=
 =?us-ascii?Q?iyxMzt5pGeR6Pb98bdvNBlcUqRSmsnjkVJzSuIRHZu1HNjA0irOb/kFrdnFH?=
 =?us-ascii?Q?MetYQq74R+VIQTn9m2a1V0yVMTVTBKYv/+Cj0+mvv/tMuJU6uW1EY/VLWWJJ?=
 =?us-ascii?Q?cGRCsxXkjtAe5t6YOu50tQEWYB0xAv4m7i46MJn/3l40V6bT2p2Hgxqc+zt7?=
 =?us-ascii?Q?2V9vP0dD2uSywMV+ZR2URoE339Tx0SrAHnMkwGGKC6AqnRkIFMIvNcYsfcCn?=
 =?us-ascii?Q?lDSUtL+n/kPFHiWKPfm+b6QCNre3ybPhVZfSv2ER2ipdd1Cn+85RpA0Lzu8F?=
 =?us-ascii?Q?Y18vMo7XzPzbKkywaoOkOrQVfIZnQ3zk30I9zbBc2HiiLdXE1lf3yESViXCJ?=
 =?us-ascii?Q?F4bgVTgGIy0F6L3KPiqTeHTrtefNf6NuHRfY+nc+2tdkCmGSx5Rk1duxBuDQ?=
 =?us-ascii?Q?YPWt0aOOfzYyr8uZPK3xMJVtxXyvmwdYehPLNUZJpvezMwiU5bVO5XynDqYA?=
 =?us-ascii?Q?yTJT+Vv7E0Z6Dfll7giFFMTpB4SQtDBaD6mxaNph9eDkbwJeITw/NDXCeRlx?=
 =?us-ascii?Q?NOPGtS6JErPbl8UxbDgU08u8HXEb4Y3yEwTlDjKRm7wLiKVEyBvGY93ucb8f?=
 =?us-ascii?Q?tL86oVI0FUhMlQxIwaSBk/6+Is/UOEhMV5wqQVoNpPYA1WEb682VXtO01uNH?=
 =?us-ascii?Q?WFuetSiY9cRDtoNBKeW9DM1Hio45nh5RlpBhTlBzB+c7toZVWbQ2I2CuX0iq?=
 =?us-ascii?Q?wATkVUHvUxYEqXaZS44uWlgPuimT2YZG9+tf2yp1gX0wyluwQr1RLoWwZLhP?=
 =?us-ascii?Q?fHAwrBK6ecdW7pOOp+pJnEzsRNhLsunOECoJaVoF0EMi3hqQqrikxBjlMx8D?=
 =?us-ascii?Q?oRJpKgMhEUWwQHKBRDLDLS5rGk58nABNz8Dly77TzJZWJdukoXDRG9gr9t6v?=
 =?us-ascii?Q?7O8Y1ZhfhRVt878A2AQaOa1sRV25bGX+0iamIZC2/ZhVLxamLzeCpJb3xqyy?=
 =?us-ascii?Q?Q/qSSOre96Wue38d9m5W0qxAIImObf3H2+CLMEVcsMGyS2pP8bL+/waQP92c?=
 =?us-ascii?Q?UMP/L8oX4jTfJtWOZIEwvLEO+0FNFnCyrhlFeUybPyj1DOEmpoujMHqt6upn?=
 =?us-ascii?Q?WNYEbYSGRb0ttIEpWdnIsPlNi9WhEcRlNcLaGQ0ktR5ei+bI4fS5p0k73uqM?=
 =?us-ascii?Q?vtA5l7FlGTLp4YtBmczjeVKnWCbgqn14+u2pLEPJdyUbeAeUo6nUG0EBAmjO?=
 =?us-ascii?Q?sGfrshlNSXmFjUwIBCs=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73dc0e0-e97a-41bd-519d-08dd65daa091
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 05:06:22.7401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LV3JSjBH+NkyXliEhKvL0do0fcWECai7HKnISoLP6hf/X5EdpODRyg43ZDYj5ENOo6gbcPuRoyfMuH0n4ClY/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10536
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> On Tue, Mar 11, 2025 at 01:38:22PM +0800, Wei Fang wrote:
> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> > index d7d9a720069b..072e5b40a199 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> > @@ -165,6 +165,8 @@ static void enetc_vf_netdev_setup(struct enetc_si *=
si,
> struct net_device *ndev,
> >  static const struct enetc_si_ops enetc_vsi_ops =3D {
> >  	.setup_cbdr =3D enetc_setup_cbdr,
> >  	.teardown_cbdr =3D enetc_teardown_cbdr,
> > +	.get_rss_table =3D enetc_get_rss_table,
> > +	.set_rss_table =3D enetc_set_rss_table,
> >  };
>=20
> Are the CBDR-based enetc_get_rss_table() and enetc_set_rss_table()
> the correct implementations for NETC v4 VSIs? (I guess not). Does
> the driver/hardware fail in a civilized way, or does it crash?

We have not added ENETC v4 VSI support yet, the current VSI driver
is only applicable to v1. I will add enetc4_vsi_ops when supporting
v4 VSI.


