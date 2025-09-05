Return-Path: <linuxppc-dev+bounces-11755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4221B44C50
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 05:28:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ1zB6qSfz2yql;
	Fri,  5 Sep 2025 13:28:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757042934;
	cv=pass; b=bvWa1QCcfGpKgU8FH9rVSsexJn8Mwqq02w+o4AYBsDNeSGBCwCDCfrHZn7kFkWZVjtYDBIDpXWxciqriKNq8aGxSR1yj0zpQK1Q6bIck2D+58pbfegJyRLy1bCXT55Fi+rHgWEXX4ToLpvqizlTvE51+bM76+iku0Myqzvr6nW53NwoMl1MMANvPDT5s9s2hyhz8BBmBal3Rm9VfxS9wucq743frCH+lfjmKSG5L65JfR+sYD1ipt1lmRa6BHtc4MYSwhM4F3A8ENFdurwzn0Q32v27Ye61WVhS304LCGNKsrKSo9zH5gOcZERrWO4AG5nlR7sLvx/k6LFVvPQRw2A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757042934; c=relaxed/relaxed;
	bh=T7u9aGrmrTwUlrvZDh+gHMyvUQGn1VMW1dsK2fndlcU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=H9ZGrpc7exrh4+mLYj7a/yzJYvkPZrzr8k9Lor7qANimG8V+X9N6bl5X3kp221PxnFkzAcXsHM0SFmLUWABTdn24vZWJnOVYGwj8U1ESQq5DJ07kv+Gpz6/rFErzxDawpa2TR1fUc6sYl3jNpoTTLhMbP4h8ICS/cj2hzADGPSfmhS6MGSC186MD51xY32SfWwYv8ItXIqwto/3DufXpcfaGnsMaC7lBSeAiHu/zpzy+tU3RolWiBHxXHG4P+zoKnZBwVLad5HThJP1Lut8B2Ajlf9UeApjDrtve0fpl1lSWmHKeiTl5xqxWqarWlf6fcx4/NhbxWt/sRwsE1WNggw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=P8zUMD8U; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=P8zUMD8U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ1z93DH0z2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 13:28:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzzyqLD75h7Iba6GbwX9M/5f0BBD+MmhtdRe1EMKiE8FGSYNIH0wWDGK4YkUywmfWV3eBxRECn211OCdbSApjjvE27aH4CC1TPFBn9us31CoBGt7JsHKUcFsLmLSI8nH4aZfsfRKacyeZV0shRc57H0QKiET2TGVAdPMzZsFkGUq3oK1JF+OJdh3ZeChj84rq2dvsSg15QBalDG25ZTY9hVJ7D+75PGk+9B8HbrpPFDAK+HxkRiyyeWxs1YM4viXJLqjvap+8qKGGQaXTIj1ThBw64CDDRFS7LR9toST/b5mMEjKez2cqFL5DWcRmRjoH5DKFSsQcsmTRolCJW/eEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7u9aGrmrTwUlrvZDh+gHMyvUQGn1VMW1dsK2fndlcU=;
 b=ly7mT0+eXAB5WF5M4K7Jte6+w8CAbUemjKM87vl5GcQvM8+cbFwo9BciX8OLG+4oubFj+/yXLfwsledgoOdsTP13glnjzUQNzE04d9N/gCaio0i1RrIfhgLVBeX/kf5j+qReVsvVWXUYuceeOGdZf4s2BIlg0BouVfR4QEGdsEt5H/y0ay0ViF7YG2uF53Di4pwVfP5cvTTxZI4qVYSuu4ltxxWrmquEPvPAoHI8HJWAeg48eaTD8X3oDj5jE8N8dA+Nr0LFi8WOuHp8G0NdxauALaoP6tbxZgPPDKYmNNjL8grVIu/3fU5uIi2KQErKieo6Sa9/TsbRV1+wFhzzyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7u9aGrmrTwUlrvZDh+gHMyvUQGn1VMW1dsK2fndlcU=;
 b=P8zUMD8Uab8QPIBvH+MRDJpmyw0640tUxmXL0hGh2JmWQqlso4J2Qungy1kQTioR4hkszEty2VEappiuXVVANE//O1jd/S8JAWZ8RgH3cusDCntPEbs+pSA4eZdukIo4PX/yKrTXQRp2+DUxzcjkssPEmvM6i0PNF5V8XIIu2rbd1oGJ9Oeb12rYCUUGjRh5JAK0qMGGb6u3zGMuvONzma07G+wEeAnrfN/rUYiIgSGyl1y11mdFdofmOE8UfNgkTFSVs7wyUBG1kxu9lVSSOBlGTCjkglmYyqE3lEDAS0zk9L/SkihR68o2yToYWRmK3JE0L8HDgN/E9i+WEB6Hww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DUZPR04MB10013.eurprd04.prod.outlook.com (2603:10a6:10:4d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 03:28:29 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 03:28:29 +0000
From: Wei Fang <wei.fang@nxp.com>
To: richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	Frank.Li@nxp.com,
	yangbo.lu@nxp.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v2 net-next 0/3] ptp: add pulse signal loopback support for debugging
Date: Fri,  5 Sep 2025 11:07:08 +0800
Message-Id: <20250905030711.1509648-1-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DUZPR04MB10013:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f5da766-b432-4c07-c6d4-08ddec2c461b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7D+Tzj0f+9Rm1ZTHxcPAvyBKUjeQphxzEdJjzld76ncM161VEJ6xMmVVTnsF?=
 =?us-ascii?Q?hgiGg6+dxn8IWxbov0IEny9hcThUc/ST5uBd12o8N8j+y1qwhoaPe975b0j1?=
 =?us-ascii?Q?qHNtgK1FwL4REN1VTzdVeGQKckzyUnidI5zZfjqLQvFHPZXHPBTSQOsbABF+?=
 =?us-ascii?Q?/gn57nBlBM5Y0ucmRFhis8i+lluWGWjLLmU+WZCCbCeJ3fUQ7MUtsaYCK8sH?=
 =?us-ascii?Q?CS5ZUhTxzp3IbgUX5MzBviC5o4mCBQoZ/VGPaZmk34kKFNJjeVsv0bHtIYav?=
 =?us-ascii?Q?03qTwuUDji4jh0+rgy0xvWT/snp58aR5Wh0J7Y40h4JmrH4dJxo4hUOSC3D2?=
 =?us-ascii?Q?VaRE7tcp5nOVkH22nZLuDzsgoQOTCKq7Qi1Z7jZIeS5F076+VOqb1tnf8TCZ?=
 =?us-ascii?Q?agpYTXzurEusjpbl7md34B9SfSva8uPy70PCMeh08At+MNzb9QfiOdDIzw4s?=
 =?us-ascii?Q?y3+jABVi7JKz8elk7ykDXE6fR34NTSU9Xre1SYu1dpj64Kfho+1wON5JABLx?=
 =?us-ascii?Q?Yc1uf9thjrnI7/jN5QQLLDlj2nP8WYt4HLGfuvVNJ8QLIjFjwNV7+lFG01yQ?=
 =?us-ascii?Q?uLp6CIz2sx137jx86I70RRvZXRxP2wlQ72VuwH8M4m3AnVuqiEHEjuyxZ69G?=
 =?us-ascii?Q?vCJtuH4OYA4FqgdWDf2ZmlE/ktBw+dRv24oIbJHaziQYHuNSYmuYcDhDL4wa?=
 =?us-ascii?Q?beON+qMjITv6m+TTdkXZfWo+LzgdTbH1W7d4NcjC626ZwQHzScQmpTsuADCl?=
 =?us-ascii?Q?3S+AlNBD/rmKjp5Iojyg/AmrcJIfSY3qZ4mLpKPhuXG6rQwBH7NsITHWo8tt?=
 =?us-ascii?Q?YWxMYwPH1R8UBtaaRZtK+jwWkhF6u2hSl2tdZouLiKhZJp7C1/LYG0V0kzRH?=
 =?us-ascii?Q?dZ/q07joOUlY01597Yskkef84PvCezuhyPlgGicHkVvHuSgVDacQsTPjWRS+?=
 =?us-ascii?Q?DJUG+HItBjGYuJJlSAkSW9e0PIRgDZhnD1n0sBDNObWPnwRWAr2kXJl9opWf?=
 =?us-ascii?Q?5VhDaYMr+RDBbz4LfUpEYWZcZOxksFCFeOs6b+wCQBlChCmABIb2qfUnwiFz?=
 =?us-ascii?Q?9Lo8oGd77CD7REKhEkV27V7Jv95oNTB0PppCykaflWAT3cRu9C3e1XjNueNf?=
 =?us-ascii?Q?2SpjsAz4o8PQmc6cgrV8gj/MKL1JF8xWHqBwU4DqWMFRIijTqbhrqA7GmAkA?=
 =?us-ascii?Q?VR0C+KOUANNyyCKWhSWZJtm5SY6yS6iu6wWNzQGh++QUo9dYa41z/c569DFZ?=
 =?us-ascii?Q?QlOwE7+EFMtrmCtUOh5aJuyGFdKMxuRv6B6cKmL9Tl7ohAA978a8g5auxwko?=
 =?us-ascii?Q?1fWJJMPImSGJpjiXZ7/iEQsdirtieTVw85cUhNXJULh/pUIPBbjOeYDk5LNI?=
 =?us-ascii?Q?Juyz1l/ei6XKsgnpapt1I35XlUzazHQbJgw6nR7YG+EDRKqZ2krCPKSNHvMm?=
 =?us-ascii?Q?IgSBwdxHbFX71Cj6no4ZLGvXn/6mJNtPtY1Z6J3+Xi+brXdSUvkNmJiJ/3L4?=
 =?us-ascii?Q?XLedfPFlLG56/IV0sXla/TwtPeBZWPYUxSO4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3xbEu6DgRlGYVB7UhI+IrZOxdNUbGK2Whz8LbpRvMHTOS/0M4XBlIUd9m5jO?=
 =?us-ascii?Q?5G8kONGXr5sXuOdfcXYyasmmCkMv/l26Necs2EjRr41PbndFrcX6+Iv9jthm?=
 =?us-ascii?Q?Xpy1wXG2vXCeaTdgP8G5Kvum11Pbxwfm8wB9csgxoWxG4g66KqM7c3J59prk?=
 =?us-ascii?Q?L6vdL8D31OJVd1+k5kkPyHg/cV5C1+NXRwkesUDpf/a1OvJ4LGRNUN9zokgg?=
 =?us-ascii?Q?KTpteFqZCGNI3yAT0dDq4Q7o9mRw3oQUbZn3x2m1ywpulQB7sOc1pgI0G8sd?=
 =?us-ascii?Q?3xJfv4dhp/qDbes72b7gIJe+2M8OGyomvprC2elB9hJ2poSAhFZC5NP+WhBT?=
 =?us-ascii?Q?aYC0OqtaAOBu16fMm72HExAKz4Vv//Q46nmTnjonpq4sEAyFcul0PyZtaFIv?=
 =?us-ascii?Q?hQfJPXyx6SnV7DHqb2PJEaDeaxNn4VVl+evhSm1dPWSPy3HWCEz5290eHgde?=
 =?us-ascii?Q?zDWXO9Splf+MQ7RYGepMuY1HN0d2FLZOahb6RV/UNlktPaZ6qR6zevzwaOOa?=
 =?us-ascii?Q?SDB47HsE/s/ReMyNRfBtw7A20bEYmhHb2TupZiC/7Z23OI1zgDyXrW0OkhAN?=
 =?us-ascii?Q?r8VH/reGdzO5/tBTxrPVALXHUuRRkikWfIHH5beSSMfNZqr3uqR3/ee3SxVi?=
 =?us-ascii?Q?qYKz6ruAgmxczv1yao+7LmTLWT4o3AVrQuGdkR4zgjNAZz1s2lLWS4oKV9g3?=
 =?us-ascii?Q?O//HfEefmz2HWUDAKJSKdEicBFh4992vyD1mgWHkTsWNMVn3DhtWx7F+o2tw?=
 =?us-ascii?Q?rza1fbRQ3zf6/WutNHEw7EZB7schnZ+pA2R+cGwQdKHpIH4Hh2HaTrWORCg+?=
 =?us-ascii?Q?LvX3hmQMCLbtFAQ+R2XQeUeHNR56D3VmDi1aUKFSjxAb5rhbkqzBwLF689lj?=
 =?us-ascii?Q?H4TpWwnmsTMsGrD9Sc8aB7Eveu/aJ+fkl4eHuRX9UhzQ1SwBvIIo1s7egoH1?=
 =?us-ascii?Q?XZcFBkQAzm/jLJYL6VjwqCReaHOT8YaOalWIqje+XCFO7SmaTiX2871YX6xh?=
 =?us-ascii?Q?KbNK/unlhGor5wnP6aGZMAwLqp7CKTen3rT+23iKA2anp4cOgXz+p4ohnbnn?=
 =?us-ascii?Q?P+Dc+hS1Lua22OUKYRkfUE5g6XVulExeXJoVHn1H6jaPH3ygZU3fZ+r6yDlE?=
 =?us-ascii?Q?kNrLbMiXHvMuFPJUEtDpayW62BTUwm5eHHcwpAbFnJlFRnfW4JvKg4ghKE/c?=
 =?us-ascii?Q?hdlzw2Fis258REiouSFErKFec+5yIsSm874GwZ7JO9jnnMdqUUUueaDEEUc2?=
 =?us-ascii?Q?v2jbHmNyCMb7AtyHjmLOEsLx4Z9vvtW2gx5HLDnT4cAeHqVbbFwl27GviOzO?=
 =?us-ascii?Q?e7z4du701q2ZNJnVnVU5k+LQ40s/sKQe1en9ZZ/FOwBjmJneJyNwwmMm7kUZ?=
 =?us-ascii?Q?JYpfcNbuLNhZ3IDSqQOnN/ygM5s2VYbWkj9zG1lVg8ffNIm3DeaH017CcmkR?=
 =?us-ascii?Q?eBwf7yoJYSpndkxgkyYsR6jsP/QK/fQ3Gee8aujuI5Te8dFLge8iKyfKPZk4?=
 =?us-ascii?Q?OY2CN0OO8l+zSxpj/rLYulhA62yZe3mxEY5E2M3mj7q2UHv22Re5ggMML0rI?=
 =?us-ascii?Q?jiqYDo3mx6J9ONLRSssOENouLsAOG1s0fXrY4e/K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5da766-b432-4c07-c6d4-08ddec2c461b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 03:28:29.2704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tqBZZwZOjdeAzj7Udqiygbc8MSJpfGULHLnCtWrmtuUtKYP7M2aS4NRe/rZUqhOCpx0U0ppUGg6qzBWYILplA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10013
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some PTP devices support looping back the periodic pulse signal for
debugging. For example, the PTP device of QorIQ platform and the NETC v4
Timer has the ability to loop back the pulse signal and record the extts
events for the loopback signal. So we can make sure that the pulse
intervals and their phase alignment are correct from the perspective of
the emitting PHC's time base. In addition, we can use this loopback
feature as a built-in extts event generator when we have no external
equipment which does that. Therefore, add the generic debugfs interfaces
to the ptp_clock driver. The first two patch are separated from the
previous patch set [1]. The third patch is new added.

[1]: https://lore.kernel.org/imx/20250827063332.1217664-1-wei.fang@nxp.com/ #patch 3 and 9

---
v2 changes:
1. The value of "enable" is restricted to 0 or 1.
2. Fix the typo: covert --> convert
3. Improve the cover-letter
---

Wei Fang (3):
  ptp: add debugfs interfaces to loop back the periodic output signal
  ptp: netc: add the periodic output signal loopback support
  ptp: qoriq: convert to use generic interfaces to set loopback mode

 MAINTAINERS                      |   1 -
 drivers/ptp/Kconfig              |   2 +-
 drivers/ptp/Makefile             |   4 +-
 drivers/ptp/ptp_clock.c          |  69 +++++++++++++++++++++
 drivers/ptp/ptp_netc.c           |  25 ++++++++
 drivers/ptp/ptp_qoriq.c          |  24 +++++++-
 drivers/ptp/ptp_qoriq_debugfs.c  | 101 -------------------------------
 include/linux/fsl/ptp_qoriq.h    |  10 ---
 include/linux/ptp_clock_kernel.h |  10 +++
 9 files changed, 128 insertions(+), 118 deletions(-)
 delete mode 100644 drivers/ptp/ptp_qoriq_debugfs.c

-- 
2.34.1


