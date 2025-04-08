Return-Path: <linuxppc-dev+bounces-7539-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA754A7FD3D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 12:59:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX33r4z85z2yqP;
	Tue,  8 Apr 2025 20:59:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744109944;
	cv=pass; b=EmsyXCFh3kh1592YWAndbBrnELNDKG7b5tLY4uIpj2Z74njm/WC+WO3CQlpTFJkYWB/P8A/dwGrtlcu2qy9I4dTsOP/BlKB+oct4ZV1uvgBvzSXuhnTJKb8CPnDPEtpeZHAsbv/iTfoKG9yML9q0osa3fInO/uuCwfPqw1izj8wbQmPiqP3u/DX/wZQnQ4HW23hPwpgnDk+vTNfSQN6SPWMX7MjyCOaFlO9Dto0WaEwO1Bo0R6EXl2L6Sz+yDnMr+RpchSfdn6y0ijxn6Hij1GxLgYekpYDpwNY0lC1hyiTP9lu6dHjwpBHr/o2vqoOHgs3QIBs6M0hZBWmI6fA2Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744109944; c=relaxed/relaxed;
	bh=rryBxo0E+V5Hlx+KmrfFwJ05K74cMaFYZ25zVIr4AYs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EeQsmf+m4Y40e1+Mhd1/g1VOCBH2vAWt6n7rGopRmsXLLxE/xu/8rJI/aHSrIL0b7Qoxbl8iXmtR5w4vbXlvgy70VfamoL2qEJGvhdSL4j13ysjz6egyY2+ywjVhrj33DNo+ZrbBWAcivmoKEU/GHNcaY7MBNO064h/wiyBsU9XO9Z/3UkfRgYd6tTELITEachvPIOR5I4Mpb7ryAvVt4MOYiA4+D9Ew2mxK0nS+uozZnkNy0XiqtrwYTnMMRHaWzs1ceIa6Q0cyPAtsW+MZsAEx9Hh8GhQPZINazjzcJf8SO4A1LYkB5//SyOgDrigEFFv3dGhKGj0ZULUcbQyMIg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=INNGK4gn; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::608; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=INNGK4gn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::608; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZX33q5Zm5z309v
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 20:59:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTgdOmHqdCQ0PUR0BHB3ANpOICXs2+e54wfedQWo9slK65p3XliQeEZJQDe9lCYIok48yR6dqLM0wcoA67gg3LeHgm3T2CoGqDbu8sGQbnNtt5jQJyFORhkm7PqJZuHbDsivwz2Xe5R5h0efEno6SqhhULBxn9M8iuUEFtzomucaefxf+F+ItJOazgigOQ3VRR2FW0bdeB+FZArNGgTsGqGqOYiOQhK1LqMG3CVW3813PzIJiYlJOvfsPq9QJC1R+3fWcTfqqze1i/aZbmki3ORrtt8PCdCGgoced7GilfsO1RhJZ7ND5fXm7i0K33i48I3LR221Vg3nf18eAkarPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rryBxo0E+V5Hlx+KmrfFwJ05K74cMaFYZ25zVIr4AYs=;
 b=tzPNMbirLAOGFm6uo1esBPVfS+3aekj5nwIgqSk+kXt8g0WwfH4Sxo6vJCvMf+cRgo+Bmc34VK0vmX4RwKUvyCB32KmNjISJIKQSYaR5XJGaC8xs1EUDt6WX6keAoEMABcgmDCjhzrhYtCoJTNNxgviAm1c+ywDTL+H+zlsSmrhBq49FbByJr1qYG8NSzDrnaQ06TdoJ6NKPUMOO6F/EdgTfqnuYbONyh9bW3gDOxcEGaK3c9ItOoSbcLN1vdwaS7xISJ211rSJVOrnz8ZGpDYjz/O/MvjcaAaC/euHjiaWKqpgwWSRar6ePnELf+4O0HqkHCdR+ITj1hHFhfWmEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rryBxo0E+V5Hlx+KmrfFwJ05K74cMaFYZ25zVIr4AYs=;
 b=INNGK4gncWl0Gs98Qh0/1QVDSrWegn5bkgZGcqbfwK7xTRr5V1nDQP9LGytVldDcBiXXNhvGclay9099XnIu3/h7Qr0fCFbPOpUcmGTXILRZYQBWyNc8yn05B3LRvzs/99+MjD2sjT5dQv9EM6+9SbRdYW4O6U1dP6SwvIZoTPKha0nJVAhCMyDIwVb9/1Xt8QYEnOnUcAvmieu7b1BH+A6TM9paY/44/qou6WGlhuxImJX/cp5izAuyqz9qERiYWS63iWLImyrHf6jNmSYRoPSaw8ahBk12RGeRsMGjUZ2UlkQb22u2kCRJj7iSJBCfDrDQgPTzt1v15x9y+52aPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 10:58:37 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 10:58:37 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	christophe.leroy@csgroup.eu,
	Wan Junjie <junjie.wan@inceptio.ai>,
	stable@vger.kernel.org
Subject: [PATCH 3/6] bus: fsl-mc: fix GET/SET_TAILDROP command ids
Date: Tue,  8 Apr 2025 13:58:11 +0300
Message-Id: <20250408105814.2837951-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408105814.2837951-1-ioana.ciornei@nxp.com>
References: <20250408105814.2837951-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::8) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d323d9-0b10-4a52-c748-08dd768c507b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ul5OzuHRcSQoS/p6MUI/U/vcYvwCYewp1SihlHMmt1ZfOgpqTNHdcFNqz5H5?=
 =?us-ascii?Q?q22Xd7yxpCMxOIbNd/n9gxmLGmDq/IeQ1Qwlt99Jl+lGD/V/c6TmGhyp+sw1?=
 =?us-ascii?Q?SrMjeK4M1eNFUQCTPVBe6p4pfK9Yrwa7+5yEt0FBXNCIg3TLDNYVBSYgXENd?=
 =?us-ascii?Q?+E+ybEmJARhvI50Z8TTlmaJ+Q3gkxK5ZHkcsoOKNxywstdGYWqR+uz6fhCtj?=
 =?us-ascii?Q?Fg5xetXpeha2Zk6MYTjz6hIj11bTrfphU4EhHCjp5ZhqfXnFTFaS9GXuRXWG?=
 =?us-ascii?Q?uyd7e9Bjf4twi1JGBxVIPK8xDi4LQNfSW6i2J5SlVW/T92UpBq1FG4qEPm2M?=
 =?us-ascii?Q?MSa/h54t9lrQdrG+my4jgdOhfn03dSj2APJSj7Egclb2iUP2ruz2bfUpJcF4?=
 =?us-ascii?Q?UeY+CFmGlc9qHgFrTOm2n422qiZUMaeI6TwHOKN48Sdp+8dJt7j+JOlQTbr+?=
 =?us-ascii?Q?2USPw7eC8KoueRI1wsCHOn7+59d4wvQqk10jchKfpf4Qf8Nfe4KWcPujhPIG?=
 =?us-ascii?Q?OX3pFI2iSE5BvgS1f1SZ1DNaZy9tiGD1UgelIWsrUlTUMfGRgavMxGTx9IJ+?=
 =?us-ascii?Q?bdjoTvdXgMIkQfLCXwaCSYqdEUWbkeehjP1Hio6Lr5yeSf5KpgxeVcF1McUa?=
 =?us-ascii?Q?jIK2YLpzElcEvrTdEZPb5ejZUKwR2jVNP0AWCYACYObOpXkXzVJtNY4ULV0p?=
 =?us-ascii?Q?+GN2f4QZYRye+bSVOcHZ5NGbmpgWsvEc0Qkt10WcMgrK2BPK5wfEbSrJEczK?=
 =?us-ascii?Q?M1/eM5BIgzmSXTWT/+DdflwFVyyqQauCa3lvmyMwGHWmNmLDoFS5621FvzZI?=
 =?us-ascii?Q?ZbsBtnaz3SJAj5xDN/TJIKO24krAN+MmJ8HuSPUdq3dl6PbqoWQRofuLgiOK?=
 =?us-ascii?Q?azYTzzbYweKEeogyQccRqw6sIfigKaeClMxPozScgjILxJ8S+Bfrn9WjIVEe?=
 =?us-ascii?Q?fHwsqpTuXYu/y3AzmJSa8J9vbvOlX8oR+XsqPNMukFrGyUR9Oi0i5soQm2+m?=
 =?us-ascii?Q?lTlzqiYIxaubKEitPCCld8fEpZjz7x8Oozxym1xCwS5x/7LzoeHnq0kWDKZ0?=
 =?us-ascii?Q?kQ5tf2+QZ2fQIwE/mziO8122dA9yk+eBwexLIAwsNXzbrGUPkGHzR4qLknwF?=
 =?us-ascii?Q?I+ngtr7EaLSohr7cwwy7s8Hf/fbzVx9e2LOXfIiGlpg38P8KTIJCF382Yh2H?=
 =?us-ascii?Q?d0fnVdhiWTuKyqWecXXq7PDySIM3K+4fyroVe7XnyxuLbkREMdnc2l3cBAoT?=
 =?us-ascii?Q?9FFr82lv0oKMZl4ro+iu2cxPYrsewmxtQm75isNebTiwGelNL6SIkVbYfBV0?=
 =?us-ascii?Q?VZrYm/lOU7gnldwvN9S37hVYCHOlxqsnJBB9wFZYzmOiRm+g7uQRpJzEsV2L?=
 =?us-ascii?Q?wvuNrSIOm07FFkAC2fxE2spXR7Gj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I5AoQPdz6uV2lAXAirCxC8NynDg453NetuMSWJikeYBABwamLi5O5KHYrozD?=
 =?us-ascii?Q?JEw0uWddoPOqNp24uj6cjtarnYlDeGifYONIXDojdXTqlWVPkiG2bTZcZK6Q?=
 =?us-ascii?Q?FpBaBvzNIY6BVczjI7wPS63RCxNVG2jqTELG790II6M/82Uqj7dEqaxO9bQk?=
 =?us-ascii?Q?Wvhsd4GSTc3sgozkeol9Kc+TZ9ijz3kU4ip+KQCxDond4biqo3fqQCZR9Og0?=
 =?us-ascii?Q?jroE+nHPrJGfxjuzE5fJ5S9RlZKsgzgllzG1sQKth9NK1qc9lbZq7UqQMy/c?=
 =?us-ascii?Q?Yq2ECwpMEbNyAmzQuAmuxkn1pI/9kOkGbPq3u4uOd3mZyaPDR+6T5jum160/?=
 =?us-ascii?Q?feE2IKZNlWeNwqtIvMx3RtLyeQYTC8wXaAq7c1S4P0yng9wUklWAitnfLg6/?=
 =?us-ascii?Q?H6ShFsqC8qIOUx5oOw0UnEXoeleSscnTrC6drNLHgb5+xnPxPKplUIi/o9Bc?=
 =?us-ascii?Q?9RDb7w61h/0lPIp1bByTXPSNPi8YnkkZAPd5E1jBXhPTL2cT5jRgYmB0HBvC?=
 =?us-ascii?Q?Z5E7dmPoT5UXDAjW+2SP5SvKiLEYURMkfCXQDYDY+TjyWSDmoqmT2nd7hnjl?=
 =?us-ascii?Q?wk6Yq3EAiBFawarOj5ULgA/HRIfIf+bHCB0JZf+jb6HNRGbLan3pcrkiUW0+?=
 =?us-ascii?Q?W1jEZCgo9rXkAj9wL3Y9XJEMyOqaH8niZUu4GsAOx7Wi2xQaI4IJB59q2fqf?=
 =?us-ascii?Q?Uv9OJgFUTQ2o8BZNkNGVvB3kDO4JfacBhH6EsVZssA+CWucMepBAbJmjKLAs?=
 =?us-ascii?Q?Iskepks+omvt3CNGuyi2CecST9zX/f2obaMHllm5zMQr0ba7gTipCkMRb8s3?=
 =?us-ascii?Q?JDaaLA22Z5fAfSgiXqF2zE7D6lWjk9rg5abMHfNdHU2LtRDjilN0cLDnVv6z?=
 =?us-ascii?Q?OaS6hhoAtW3h1PmVXz0DAHtgLA5ZZPtrzoR9HNVfA87p6qGtrd2t9/AtOpXl?=
 =?us-ascii?Q?s9+RWT/bWpptvCteELRv3Vf8ui9eeNuiDvGv4EGQ4zr9jzY2cS6gYghPUjQ0?=
 =?us-ascii?Q?NTnT0q40EKr1kjGrUBiKar07UX3Xbw5bXxfXtAIRsFxSN6vjq6MfcAG/G+Ul?=
 =?us-ascii?Q?iRqe3WrVU0PGHtfeD0jcsGxYmYc90CE0+OWMtJJn+zEXwWOK/wfatmHjiSlj?=
 =?us-ascii?Q?lGSnyJOKsIFX3JNzWuYGan9XSppPavboTmDl3EU9jVCrKwo/3S0vrzAUytPR?=
 =?us-ascii?Q?EDCJbZZOk8XJz8bRQ5ZQEHOaZBG0FDQSVx4xmT7s8KYPz843vp1J8o7R6hr6?=
 =?us-ascii?Q?fcuDbz/GCz5NNB6YTaFGsvVdV8tbkIpjFC5AbT2HfuWYSen1ZwGZey3RtpJb?=
 =?us-ascii?Q?7pWIG50HE5N9u3gI06Wa6ao+zwHL5jLdof+rnkgz11+aRTrxP9/lIbemluLi?=
 =?us-ascii?Q?bGuP6g40vKjImsUJ2vnEs5kVlo3LW+FrpjqFUg+IVyShcgEF+xuwDuFD8yhy?=
 =?us-ascii?Q?ZyFunitnhQHmtnY7bPWfS5GilaxkICtk0QRTMXf5AgOmFj320gCoBk/Wbj5+?=
 =?us-ascii?Q?rB3Baok1LrTH7evWt9/fSZqYQ1NkmtknvQCtjGkv6qaQ41sPmxdbfmti27Bl?=
 =?us-ascii?Q?pMP+fOG3+OA6xTKUGG9Oa8k/oHBMZ7oDr/X2OVo/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d323d9-0b10-4a52-c748-08dd768c507b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 10:58:37.5835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AePM76whPIwdfA6Q7GK5IdAJRY1gr8Gmi8NS4BnGnwWkpakpX/rdde03ulHMWJiGS0x+JfTtT5WjJ25nmC3PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Wan Junjie <junjie.wan@inceptio.ai>

Command ids for taildrop get/set can not pass the check when they are
using from the restool user space utility. Correct them according to the
user manual.

Fixes: d67cc29e6d1f ("bus: fsl-mc: list more commands as accepted through the ioctl")
Signed-off-by: Wan Junjie <junjie.wan@inceptio.ai>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: stable@vger.kernel.org
---
 drivers/bus/fsl-mc/fsl-mc-uapi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-uapi.c b/drivers/bus/fsl-mc/fsl-mc-uapi.c
index 9c4c1395fcdb..a376ec661653 100644
--- a/drivers/bus/fsl-mc/fsl-mc-uapi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-uapi.c
@@ -275,13 +275,13 @@ static struct fsl_mc_cmd_desc fsl_mc_accepted_cmds[] = {
 		.size = 8,
 	},
 	[DPSW_GET_TAILDROP] = {
-		.cmdid_value = 0x0A80,
+		.cmdid_value = 0x0A90,
 		.cmdid_mask = 0xFFF0,
 		.token = true,
 		.size = 14,
 	},
 	[DPSW_SET_TAILDROP] = {
-		.cmdid_value = 0x0A90,
+		.cmdid_value = 0x0A80,
 		.cmdid_mask = 0xFFF0,
 		.token = true,
 		.size = 24,
-- 
2.34.1


