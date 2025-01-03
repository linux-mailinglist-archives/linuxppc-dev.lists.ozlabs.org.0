Return-Path: <linuxppc-dev+bounces-4606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0789AA0043D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 07:24:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPYS40Ncwz30T9;
	Fri,  3 Jan 2025 17:23:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260c::602" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885428;
	cv=pass; b=QBSqIhw7gaa2cvc/OxUAFs41ye3JvmboDUtoJClrNUixyRNOW+f+zNpDO1AkD/7+50E5kl1NbJ4Y/TZhZqR2XQlvREyCWvw4ltRyMxudhs63VHufzZphkaXn+nfEVPbTXyoxumh0k+XD0iJTeABGDAqnvGjFhrQ7+NR9yMiz2JYMFnyHFvEudD07vxbVNJawM6IbyhBhvt7LAT7CSFP6ua2HuoBHeLyQVAAPTixQETXjM9MgPBnlQocPRGxDqka/nJVFiqRcwDCq8jlyAbtu5p4idzhg0hwmyfjEHz+hLAC9Jg9iPa1EDJSIiWKP1/JMKS71Rs+VZWpTkKr1BMYXXw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885428; c=relaxed/relaxed;
	bh=upJmHynMc4Cc8QASXsyTnsPh0WTdjKNx++fnhKoegD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A7SltXZtzFvptyawEjupGnvN+a5BoiIw7SUb2kKqW9p6AP0kCCLhsb/qD2sXx3ehPsbawaGHfE85lCzSNSUOfCQ+z2b+rE05DJOMAI+sC4N0xNmplsKxmZ1sx+7YWh9SiUWYoP4ucffc13RiCwAcECQFf6jVZ+SZLerqar01nhUs11HPwrkNcpJndUOS7Kzou+Q3oZTLoX/PLmQJuCgzRgMumGhVvRzrZBIkS/na9AKIIO7boSZtrlxZuRWj/PRj2rtoI9sO8MVFnXqGev9ITozGdPmOBTpgihy9mCX6uf2ic+NDYPNj9TojgxRohSZrUicxYJ99ZD8s5UP5QSnwwA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gi0alg5I; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260c::602; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gi0alg5I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260c::602; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on20602.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYS25sFPz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 17:23:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6RT7heEkrFqbvCCAgPu79Dtb3rY/Og7nYdfWbhdAU4lB0wLKDw/xMM+3lhO7D1E9OmWXwNzvIo7W1Yy6EIwm+4C1kXKmBWT1zXRuaHkiVYAsOkvFd8WL2ofGK1Dk0pRXcObHrYtE2JDSwtnhqgWHQGtcwXNISDpLQ+lf9cDxXBPwuiBHplEPByHgYoErlaXqn43BiImr08Co5ReCC1sjEGJW8+KrM7CAzRKaorf2P260fHeZ6F1mfnj5Ts5+9Uo/0RZgpXIdlVDuoobQUaZtdwFB/5hlBYdYAxjtJA8/LHCQsHn1sZgd8JoIYdLV3qsKvw6utiKGniMpwCc0oSLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upJmHynMc4Cc8QASXsyTnsPh0WTdjKNx++fnhKoegD0=;
 b=io/0xl5wA1hjzOLvhoCWoTQKPsqUwjqVa7INMNUdVgfx4rchJm2FGaEkR1lE2xwpdPTqai0c8gyBnU4vkDtpXIXiHea4woOS7VZySNyLNzcyYdcXdMhJX+gw8IGd9yfQiNWoKYj2Whu2OJIY5vcutCscwdYTTCGk4wlYekesmI6wV/fSHhjyuDnQU13aRB2ylRZHcMEN9VuDXn9j8yZzA5YoqHwn1Nyn2PYlpnuN5SZje/7hdwrvonResOyUQlH/OGB+io0726mtmNHkwNIhM9TlPjv5OlW6AUyBp9sXJuR77XL4M7BpXbeWT834zPZ1JOfULC2zV58+VIvpgFCnJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upJmHynMc4Cc8QASXsyTnsPh0WTdjKNx++fnhKoegD0=;
 b=gi0alg5IpLuZfFbgLvI328B3wI24ihAh0E8F8eZ1Botsvu0FyLNgwLV6vOl36bsARj1o9SxcJ5Kv+Mq5rhHODisIQyvCXGRk4szlILF8d6+7NjMmF/ZNzpIwfhO+5k26ok1PfGKvfGOnXrYhJAGBBKoUofC96/WwNuEI+c2GIMkxOwK7fQEkfOtzqYY+k+/bJjv8zXVwLE2MEOjjiLEMGZBnPUdxoknXjoHIMj2HhsSiMKtrgzYrhBcEmZhCFlTaJfBtIwpORCVTsAlfcJxYKzlLmH3oM6QFGRVegM0wYrlEucUOWgKG05z56G16PZ68dsKk8uMWAe8+J+QZUd7WEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 06:23:02 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 06:23:02 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH net-next 01/13] net: enetc: add initial netc-lib driver to support NTMP
Date: Fri,  3 Jan 2025 14:05:57 +0800
Message-Id: <20250103060610.2233908-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103060610.2233908-1-wei.fang@nxp.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DB9PR04MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 670aa11e-800e-4e31-57a9-08dd2bbf1343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z7/Mz+D+1unCDzdbsFH5xmQOPA7k0FTaejiQZ0VzysHWSvXj+Ebi9eJqNnns?=
 =?us-ascii?Q?0FuXwivFw4eBNLMDTa5f/Ved4msxGtI9zxtaj6YfiOWTzG+dvRGXiPpu26Kv?=
 =?us-ascii?Q?qJrWfUBUOHcT2OUMdkCbVe32mGjMDfRjvdHUtiV+aUUdQomIhpEkNZw9l54B?=
 =?us-ascii?Q?DEkf+8kMK3ccELYRpKBVg1Hr1Q5TZIGkdbX54RL1Ac7gwwzmpRLcUwiBANyu?=
 =?us-ascii?Q?IUY3uIUVU2YQuxAOimN7h7q1pWtxz9soBQF0ihaTXTpdenBUmUpwbEkag+zz?=
 =?us-ascii?Q?OxGrSW0sszgVNKCrKepIIpXdhcTeXlfWsGL1Dt+1KUKvqG6uLydXL9IJB5Hk?=
 =?us-ascii?Q?2hXMmOQiYftExMd9OQTpp1EULFbPY+gRpQEeGIzDZ7WtfqI2oBchIe3qCkUq?=
 =?us-ascii?Q?ZPHETKBRLL6hm+VVk02gD4BcKlxTNeHtHhEGw0CjKJksoni8XhoEq1mI5251?=
 =?us-ascii?Q?oYwTaOfGfgc3QZcYyF/YNWRUXuNMfBdoWc+yD3/O1ShtNb3WhgDOTOwtB2s1?=
 =?us-ascii?Q?9wVqRMySpQ63UBbcslKyEnuYLHRUDI/sxQtUq4E4ef7Fluvh5hAipZS1oc80?=
 =?us-ascii?Q?Xjcz0s3QwSYK25E36sqQ+fuTwTzOh9a7LwZLI0KXoD/7RvF6iL3oEKq7cL8h?=
 =?us-ascii?Q?sq7oTEvN85Tp3OMoXthckF0/cqoxplILMvw9O6gE4VJNEGybNNjSiOA01JKL?=
 =?us-ascii?Q?nbyoeT+sqGqpgefSHLGLLIgtm+LJ+FkGXLuF3ftPIhbPXTXBlGzDi6OZ90Ow?=
 =?us-ascii?Q?Zc1tRCiSaSScwsYQUkYMMeiDDhuOQ6G3Zvmp7yLhjh3ua3KECI4G9ekmP9fo?=
 =?us-ascii?Q?ZkQKcFuPMvYy+PFBb54InLFWdUwAohHlWvRY58ZXnmJsuLvHD6Uy/2xveSWu?=
 =?us-ascii?Q?Im2ozgy03yBo6F0LNrwKw9m9t8hgw8oFf5rEdE1jTInqWUwxCplGyhFyUV0d?=
 =?us-ascii?Q?F/TPxCdk7G0HtG2JxSrv/LdXHeH4ul9EpZzUhEAHLw9Jc/cj+1Z3yofyiK7z?=
 =?us-ascii?Q?WrQxe75cr+7MbCCwfZFuRJSzvgoKLZgxeWGycI98OiOJqjxzOCu99Te6QRpL?=
 =?us-ascii?Q?+K9hrtPiEJxPLpjMAhqgnmUQ2fCZdlrExqqOkmN24RxzRUcjJZlxmgHQNHZE?=
 =?us-ascii?Q?Prc8nSy2DR/CwAbNCP8sm0iDOj0DDcUnBo4n8eh8AP4m/o/YbHEvJEBYnTtQ?=
 =?us-ascii?Q?6I3cvZD06d5WptVml++Vh9Nd545VEPh4PRbIm4c/Fm8vKc0U2/n7BwqdpkOK?=
 =?us-ascii?Q?k4JNi5iI8BA3Zm6Ei1b2yuaiX+XgPV47eY902bKXMDkonTPC0kK+e1NfXKEt?=
 =?us-ascii?Q?fgMk3alOKKihyD26m7f4V2GW5XRrgloTiYdpEYgyA0cO4PUxkdc+8UuTWOHY?=
 =?us-ascii?Q?S5zFdUCeI/q5jvYLViDxH2jDtspiGJ+pVRhjxBBbqvktwHReZ6GOnYCZMPGn?=
 =?us-ascii?Q?Bxb216n178NIniLKt4s73RHI9gzXlNGW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8iX8pESJsLIZ/c+QsfkbnxUyUA57WQNpdZZ2N7Pf2LzFeh2sGDk57cc/TeN3?=
 =?us-ascii?Q?cM1rWORZm6IJo8bxQDdkMrW7nLzRcCLkWX27X57ivk+BsIAtQ7BO0uc5r4fT?=
 =?us-ascii?Q?VT0x8nmG1rQfwIBsDSMHAt4ExPopFfl5WVGThZrQ8+j7ecHOZB8zSrRJl8yu?=
 =?us-ascii?Q?sr7vHtqcHHSvknvkOlDIgBZCa7gDSWy84bhpq9iQ+nH4saJchsx84tDr61Rx?=
 =?us-ascii?Q?uv60RA/cMS0kwYmfbZGqCOOVcZZqVW3FTZPshVO5GCMbDpODU61mpm/hUHoJ?=
 =?us-ascii?Q?4i4HhA9F6G7IJQaiD2VwQGHf2AA0v1RI+TVAF56trThpxwfbk+a6GTgs2lEa?=
 =?us-ascii?Q?6qi2wW7AxDeK7NCjlrsj7XshKUtJBzMgoMYRqKWQL9Xpc3ZNc4FkDxGC6oGW?=
 =?us-ascii?Q?5dfsA7gKZGS60QJq+XCKlw2Yp/jJJWKCi2eWb301xp76AVJaH50OVkVK2XC6?=
 =?us-ascii?Q?cdShCvOHmXtceTitQZCGHPUDftcGT2WMsqWuyI0EAtn9r3syVAmTqNdhZ4Ke?=
 =?us-ascii?Q?hVxxIiWPPoC9bW8/AjcqE0TgFK93s2di8htsyjJ75ilzvSrrxbRvfDnmiqQR?=
 =?us-ascii?Q?szCXkw7glHk/uWfxIRXApP7YFrCsNpTiaaOlBn/N625yqVE4C+JZFNXaTKs/?=
 =?us-ascii?Q?BNaVDbnDKXTLiDHZ9ZgcH/Aow52HB7VCBnzajF6VTbHG32XTwhj2SflOqy3x?=
 =?us-ascii?Q?e9R3z5NG7L7InV1ShqpcJMdY+XiXuRQgFHNMprH+u5plDsJ9Ao4n4La0a3pE?=
 =?us-ascii?Q?sCvaIwC8hee6OvtNSxFTWFibxO4OTKZ3+4m4KOZA2ZF+5UQWx+AK7AWHbSLK?=
 =?us-ascii?Q?nvWA4/45pSRUHtnMKHtTSMGX10x9Ya5pVGvcmws9nCGNJw+t1Zvr0dyJCXVK?=
 =?us-ascii?Q?pA3l4wGZaLlZIlXPmThlLijKF0CLScfbQW23NsDMKZ3CJZ8uP4LbNqCNjKrt?=
 =?us-ascii?Q?j9uWgRXDaqtGWf9ZpHZLnRSrshhXfKYVRxmQNXw46hW3+y20mJQu/d/ZJGbN?=
 =?us-ascii?Q?1fB7DOSwV77hUOndWr9+ZdDQMG09eIOKrc3eP1DGYWXgGzgrfIa3fD8NHiDf?=
 =?us-ascii?Q?zBThqYiMCLdXrHBwFSzZQW2paumYW4XoqG6rUUwRIDJbgddp4iEZ24jYGN85?=
 =?us-ascii?Q?n+poXbIU2aDscvBJ2J5DT2t0TCvXPzJa4ApGFS6Op4KCLjytnH2st7iCnKIG?=
 =?us-ascii?Q?rQaQ1ijmq6usW9bJRdLeREd0ara3+kvh83Ja31NNA+IWeKWkkgr/ws52D0F4?=
 =?us-ascii?Q?IS8Y8s4UWQz0w2Wu9IsDH03Z6jT2oPQ4RVtCyWVzgMjEK9ssHr3dTbssA9rE?=
 =?us-ascii?Q?ZPDXICuEBG0OAXGKUX/04OlfHuxm0Eux3fG4FO3BR2Doqj3xVTV7lz3hN2JA?=
 =?us-ascii?Q?Ztq8C0/qswEH6CKEDsKIqE/1hIQN4WldB9ecSq06NPEjvRlNBpxpKuQdpohb?=
 =?us-ascii?Q?H05rdTkRF15sOVvDSRFIhpNG58K7TA03XDVOBbNSVrIdvfzwLY2P69L/Wqdf?=
 =?us-ascii?Q?AF4FKulguLE4E+9tLB4PaXfk+L8TMXpsTalFVdil/mnZlAsuXhAtXwe7lL1Q?=
 =?us-ascii?Q?Ry9Dq3JwVwB2OWRpIOTbR7hPsa3Hhlj8f6YwwqbG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670aa11e-800e-4e31-57a9-08dd2bbf1343
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 06:23:02.3808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpFDvZJWN4LaoIGs475q/U93xm8VQFUhVsXEiwD7jQCK2aZCAwEit/Ig8TPpo5jrCg1NapPAts2cF9D2hAzCcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Some NETC functionality is controlled using control messages sent to the
hardware using BD ring interface with 32B descriptor similar to transmit
BD ring used on ENETC. This BD ring interface is referred to as command
BD ring. It is used to configure functionality where the underlying
resources may be shared between different entities or being too large to
configure using direct registers. Therefore, a messaging protocol called
NETC Table Management Protocol (NTMP) is provided for exchanging
configuration and management information between the software and the
hardware using the command BD ring interface.

For i.MX95, NTMP has been upgraded to version 2.0, which is incompatible
with LS1028A, because the message formats have been changed. Therefore,
add the netc-lib driver to support NTMP 2.0 to operate various tables.
Note that, only MAC address filter table and RSS table are supported at
the moment. More tables will be supported in subsequent patches.

It is worth mentioning that the purpose of the netc-lib driver is to
provide some NTMP-based generic interfaces for ENETC and NETC Switch
drivers. Currently, it only supports the configurations of some tables.
Interfaces such as tc flower and debugfs will be added in the future.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/Kconfig  |  11 +
 drivers/net/ethernet/freescale/enetc/Makefile |   3 +
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 468 ++++++++++++++++++
 .../ethernet/freescale/enetc/ntmp_formats.h   |  61 +++
 include/linux/fsl/ntmp.h                      | 178 +++++++
 5 files changed, 721 insertions(+)
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp_formats.h
 create mode 100644 include/linux/fsl/ntmp.h

diff --git a/drivers/net/ethernet/freescale/enetc/Kconfig b/drivers/net/ethernet/freescale/enetc/Kconfig
index 6c2779047dcd..94db8e8d0eb3 100644
--- a/drivers/net/ethernet/freescale/enetc/Kconfig
+++ b/drivers/net/ethernet/freescale/enetc/Kconfig
@@ -15,6 +15,16 @@ config NXP_ENETC_PF_COMMON
 
 	  If compiled as module (M), the module name is nxp-enetc-pf-common.
 
+config NXP_NETC_LIB
+	tristate "NETC Library"
+	help
+	  This module provides common functionalities for both ENETC and NETC
+	  Switch, such as NETC Table Management Protocol (NTMP) 2.0, common tc
+	  flower and debugfs interfaces and so on.
+
+	  If compiled as module (M), the module name is nxp-netc-lib.
+
+
 config FSL_ENETC
 	tristate "ENETC PF driver"
 	depends on PCI_MSI
@@ -40,6 +50,7 @@ config NXP_ENETC4
 	select FSL_ENETC_CORE
 	select FSL_ENETC_MDIO
 	select NXP_ENETC_PF_COMMON
+	select NXP_NETC_LIB
 	select PHYLINK
 	select DIMLIB
 	help
diff --git a/drivers/net/ethernet/freescale/enetc/Makefile b/drivers/net/ethernet/freescale/enetc/Makefile
index 6fd27ee4fcd1..707a68e26971 100644
--- a/drivers/net/ethernet/freescale/enetc/Makefile
+++ b/drivers/net/ethernet/freescale/enetc/Makefile
@@ -6,6 +6,9 @@ fsl-enetc-core-y := enetc.o enetc_cbdr.o enetc_ethtool.o
 obj-$(CONFIG_NXP_ENETC_PF_COMMON) += nxp-enetc-pf-common.o
 nxp-enetc-pf-common-y := enetc_pf_common.o
 
+obj-$(CONFIG_NXP_NETC_LIB) += nxp-netc-lib.o
+nxp-netc-lib-y := ntmp.o
+
 obj-$(CONFIG_FSL_ENETC) += fsl-enetc.o
 fsl-enetc-y := enetc_pf.o
 fsl-enetc-$(CONFIG_PCI_IOV) += enetc_msg.o
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
new file mode 100644
index 000000000000..bcbccede9644
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
@@ -0,0 +1,468 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * NETC NTMP (NETC Table Management Protocol) 2.0 Library
+ * Copyright 2025 NXP
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/fsl/netc_global.h>
+#include <linux/iopoll.h>
+
+#include "ntmp_formats.h"
+
+#define NETC_CBDR_TIMEOUT		1000 /* us */
+#define NETC_CBDR_MR_EN			BIT(31)
+
+#define NTMP_BASE_ADDR_ALIGN		128
+#define NTMP_DATA_ADDR_ALIGN		32
+
+/* Define NTMP Table ID */
+#define NTMP_MAFT_ID			1
+#define NTMP_RSST_ID			3
+
+/* Generic Update Actions for most tables */
+#define NTMP_GEN_UA_CFGEU		BIT(0)
+#define NTMP_GEN_UA_STSEU		BIT(1)
+
+#define NTMP_ENTRY_ID_SIZE		4
+#define RSST_ENTRY_NUM			64
+#define RSST_STSE_DATA_SIZE(n)		((n) * 8)
+#define RSST_CFGE_DATA_SIZE(n)		(n)
+
+#define NTMP_FILL_CRD(crd, tblv, qa, ua) \
+({ \
+	typeof(crd) _crd = (crd); \
+	(_crd)->update_act = cpu_to_le16(ua); \
+	(_crd)->tblv_qact = NTMP_TBLV_QACT(tblv, qa); \
+})
+
+#define NTMP_FILL_CRD_EID(req, tblv, qa, ua, eid) \
+({ \
+	typeof(req) _req = (req); \
+	NTMP_FILL_CRD(&(_req)->crd, tblv, qa, ua); \
+	(_req)->entry_id = cpu_to_le32(eid); \
+})
+
+int netc_setup_cbdr(struct device *dev, int cbd_num,
+		    struct netc_cbdr_regs *regs,
+		    struct netc_cbdr *cbdr)
+{
+	int size;
+
+	size = cbd_num * sizeof(union netc_cbd) + NTMP_BASE_ADDR_ALIGN;
+
+	cbdr->addr_base = dma_alloc_coherent(dev, size, &cbdr->dma_base,
+					     GFP_KERNEL);
+	if (!cbdr->addr_base)
+		return -ENOMEM;
+
+	cbdr->dma_size = size;
+	cbdr->bd_num = cbd_num;
+	cbdr->regs = *regs;
+
+	/* The base address of the Control BD Ring must be 128 bytes aligned */
+	cbdr->dma_base_align =  ALIGN(cbdr->dma_base,  NTMP_BASE_ADDR_ALIGN);
+	cbdr->addr_base_align = PTR_ALIGN(cbdr->addr_base,
+					  NTMP_BASE_ADDR_ALIGN);
+
+	cbdr->next_to_clean = 0;
+	cbdr->next_to_use = 0;
+	spin_lock_init(&cbdr->ring_lock);
+
+	/* Step 1: Configure the base address of the Control BD Ring */
+	netc_write(cbdr->regs.bar0, lower_32_bits(cbdr->dma_base_align));
+	netc_write(cbdr->regs.bar1, upper_32_bits(cbdr->dma_base_align));
+
+	/* Step 2: Configure the producer index register */
+	netc_write(cbdr->regs.pir, cbdr->next_to_clean);
+
+	/* Step 3: Configure the consumer index register */
+	netc_write(cbdr->regs.cir, cbdr->next_to_use);
+
+	/* Step4: Configure the number of BDs of the Control BD Ring */
+	netc_write(cbdr->regs.lenr, cbdr->bd_num);
+
+	/* Step 5: Enable the Control BD Ring */
+	netc_write(cbdr->regs.mr, NETC_CBDR_MR_EN);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(netc_setup_cbdr);
+
+void netc_teardown_cbdr(struct device *dev, struct netc_cbdr *cbdr)
+{
+	/* Disable the Control BD Ring */
+	netc_write(cbdr->regs.mr, 0);
+	dma_free_coherent(dev, cbdr->dma_size, cbdr->addr_base,
+			  cbdr->dma_base);
+	memset(cbdr, 0, sizeof(*cbdr));
+}
+EXPORT_SYMBOL_GPL(netc_teardown_cbdr);
+
+static int netc_get_free_cbd_num(struct netc_cbdr *cbdr)
+{
+	return (cbdr->next_to_clean - cbdr->next_to_use - 1 +
+		cbdr->bd_num) % cbdr->bd_num;
+}
+
+static union netc_cbd *netc_get_cbd(struct netc_cbdr *cbdr, int index)
+{
+	return &((union netc_cbd *)(cbdr->addr_base_align))[index];
+}
+
+static void netc_clean_cbdr(struct netc_cbdr *cbdr)
+{
+	union netc_cbd *cbd;
+	int i;
+
+	i = cbdr->next_to_clean;
+	while (netc_read(cbdr->regs.cir) != i) {
+		cbd = netc_get_cbd(cbdr, i);
+		memset(cbd, 0, sizeof(*cbd));
+		i = (i + 1) % cbdr->bd_num;
+	}
+
+	cbdr->next_to_clean = i;
+}
+
+static struct netc_cbdr *netc_select_cbdr(struct netc_cbdrs *cbdrs)
+{
+	int i;
+
+	for (i = 0; i < cbdrs->cbdr_num; i++) {
+		if (spin_is_locked(&cbdrs->ring[i].ring_lock))
+			continue;
+
+		return &cbdrs->ring[i];
+	}
+
+	return &cbdrs->ring[smp_processor_id() % cbdrs->cbdr_num];
+}
+
+static int netc_xmit_ntmp_cmd(struct netc_cbdrs *cbdrs, union netc_cbd *cbd)
+{
+	union netc_cbd *cur_cbd;
+	struct netc_cbdr *cbdr;
+	int i, err;
+	u16 status;
+	u32 val;
+
+	if (cbdrs->cbdr_num == 1)
+		cbdr = &cbdrs->ring[0];
+	else
+		cbdr = netc_select_cbdr(cbdrs);
+
+	spin_lock_bh(&cbdr->ring_lock);
+
+	if (unlikely(!netc_get_free_cbd_num(cbdr)))
+		netc_clean_cbdr(cbdr);
+
+	i = cbdr->next_to_use;
+	cur_cbd = netc_get_cbd(cbdr, i);
+	*cur_cbd = *cbd;
+
+	/* Update producer index of both software and hardware */
+	i = (i + 1) % cbdr->bd_num;
+	cbdr->next_to_use = i;
+	dma_wmb();
+	netc_write(cbdr->regs.pir, i);
+
+	err = read_poll_timeout_atomic(netc_read, val, val == i,
+				       10, NETC_CBDR_TIMEOUT, true,
+				       cbdr->regs.cir);
+	if (unlikely(err))
+		goto cbdr_unlock;
+
+	dma_rmb();
+	/* Get the writeback command BD, because the caller may need
+	 * to check some other fields of the response header.
+	 */
+	*cbd = *cur_cbd;
+
+	/* Check the writeback error status */
+	status = le16_to_cpu(cbd->resp_hdr.error_rr) & NTMP_RESP_ERROR;
+	if (unlikely(status)) {
+		err = -EIO;
+		dev_err(cbdrs->dma_dev, "Command BD error: 0x%04x\n", status);
+	}
+
+	netc_clean_cbdr(cbdr);
+	dma_wmb();
+
+cbdr_unlock:
+	spin_unlock_bh(&cbdr->ring_lock);
+
+	return err;
+}
+
+static void *ntmp_alloc_data_mem(struct device *dev, int size,
+				 dma_addr_t *dma, void **data_align)
+{
+	void *data;
+
+	data = dma_alloc_coherent(dev, size + NTMP_DATA_ADDR_ALIGN,
+				  dma, GFP_ATOMIC);
+	if (!data)
+		return NULL;
+
+	*data_align = PTR_ALIGN(data, NTMP_DATA_ADDR_ALIGN);
+
+	return data;
+}
+
+static void ntmp_free_data_mem(struct device *dev, int size,
+			       void *data, dma_addr_t dma)
+{
+	dma_free_coherent(dev, size + NTMP_DATA_ADDR_ALIGN, data, dma);
+}
+
+static void ntmp_fill_request_headr(union netc_cbd *cbd, dma_addr_t dma,
+				    int len, int table_id, int cmd,
+				    int access_method)
+{
+	dma_addr_t dma_align;
+
+	memset(cbd, 0, sizeof(*cbd));
+	dma_align = ALIGN(dma, NTMP_DATA_ADDR_ALIGN);
+	cbd->req_hdr.addr = cpu_to_le64(dma_align);
+	cbd->req_hdr.len = cpu_to_le32(len);
+	cbd->req_hdr.cmd = cmd;
+	cbd->req_hdr.access_method = FIELD_PREP(NTMP_ACCESS_METHOD,
+						access_method);
+	cbd->req_hdr.table_id = table_id;
+	cbd->req_hdr.ver_cci_rr = FIELD_PREP(NTMP_HDR_VERSION,
+					     NTMP_HDR_VER2);
+	/* For NTMP version 2.0 or later version */
+	cbd->req_hdr.npf = cpu_to_le32(NTMP_NPF);
+}
+
+static int ntmp_delete_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
+				   u8 tbl_ver, u32 entry_id, u32 req_len,
+				   u32 resp_len)
+{
+	struct device *dev = cbdrs->dma_dev;
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	u32 len, dma_len;
+	dma_addr_t dma;
+	void *tmp;
+	int err;
+
+	if (entry_id == NTMP_NULL_ENTRY_ID)
+		return 0;
+
+	/* If the req_len is 0, indicates the requested length is the
+	 * standard length.
+	 */
+	if (!req_len)
+		req_len = sizeof(*req);
+
+	dma_len = req_len >= resp_len ? req_len : resp_len;
+	tmp = ntmp_alloc_data_mem(dev, dma_len, &dma, (void **)&req);
+	if (!tmp)
+		return -ENOMEM;
+
+	NTMP_FILL_CRD_EID(req, tbl_ver, 0, 0, entry_id);
+	len = NTMP_LEN(req_len, resp_len);
+	ntmp_fill_request_headr(&cbd, dma, len, tbl_id,
+				NTMP_CMD_DELETE, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err)
+		dev_err(dev, "Delete table (id: %d) entry failed: %d!",
+			tbl_id, err);
+
+	ntmp_free_data_mem(dev, dma_len, tmp, dma);
+
+	return err;
+}
+
+static int ntmp_query_entry_by_id(struct netc_cbdrs *cbdrs, int tbl_id,
+				  u32 len, struct ntmp_req_by_eid *req,
+				  dma_addr_t *dma, bool compare_eid)
+{
+	struct device *dev = cbdrs->dma_dev;
+	struct common_resp_query *resp;
+	int cmd = NTMP_CMD_QUERY;
+	union netc_cbd cbd;
+	u32 entry_id;
+	int err;
+
+	entry_id = le32_to_cpu(req->entry_id);
+	if (le16_to_cpu(req->crd.update_act))
+		cmd = NTMP_CMD_QU;
+
+	/* Request header */
+	ntmp_fill_request_headr(&cbd, *dma, len, tbl_id,
+				cmd, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err) {
+		dev_err(dev, "Query table (id: %d) entry failed: %d\n",
+			tbl_id, err);
+		return err;
+	}
+
+	/* For a few tables, the first field of its response data is not
+	 * entry_id, so directly return success.
+	 */
+	if (!compare_eid)
+		return 0;
+
+	resp = (struct common_resp_query *)req;
+	if (unlikely(le32_to_cpu(resp->entry_id) != entry_id)) {
+		dev_err(dev, "Table (id: %d) query EID:0x%0x, response EID:0x%x\n",
+			tbl_id, entry_id, le32_to_cpu(resp->entry_id));
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int ntmp_maft_add_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			struct maft_entry_data *data)
+{
+	struct device *dev = cbdrs->dma_dev;
+	struct maft_req_add *req;
+	union netc_cbd cbd;
+	dma_addr_t dma;
+	u32 req_len;
+	void *tmp;
+	int err;
+
+	req_len = sizeof(*req);
+	tmp = ntmp_alloc_data_mem(dev, req_len, &dma, (void **)&req);
+	if (!tmp)
+		return -ENOMEM;
+
+	/* Set mac address filter table request data buffer */
+	NTMP_FILL_CRD_EID(req, cbdrs->tbl.maft_ver, 0, 0, entry_id);
+	req->keye = data->keye;
+	req->cfge = data->cfge;
+
+	ntmp_fill_request_headr(&cbd, dma, NTMP_LEN(req_len, 0),
+				NTMP_MAFT_ID, NTMP_CMD_ADD,
+				NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err)
+		dev_err(dev, "Add MAFT entry failed (%d)!", err);
+
+	ntmp_free_data_mem(dev, req_len, tmp, dma);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_add_entry);
+
+int ntmp_maft_query_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			  struct maft_entry_data *data)
+{
+	struct device *dev = cbdrs->dma_dev;
+	struct maft_resp_query *resp;
+	u32 resp_len = sizeof(*resp);
+	struct ntmp_req_by_eid *req;
+	u32 req_len = sizeof(*req);
+	void *tmp = NULL;
+	dma_addr_t dma;
+	int err;
+
+	if (entry_id == NTMP_NULL_ENTRY_ID)
+		return -EINVAL;
+
+	tmp = ntmp_alloc_data_mem(dev, resp_len, &dma, (void **)&req);
+	if (!tmp)
+		return -ENOMEM;
+
+	NTMP_FILL_CRD_EID(req, cbdrs->tbl.maft_ver, 0, 0, entry_id);
+	err = ntmp_query_entry_by_id(cbdrs, NTMP_MAFT_ID,
+				     NTMP_LEN(req_len, resp_len),
+				     req, &dma, true);
+	if (err)
+		goto end;
+
+	resp = (struct maft_resp_query *)req;
+	data->keye = resp->keye;
+	data->cfge = resp->cfge;
+
+end:
+	ntmp_free_data_mem(dev, resp_len, tmp, dma);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_query_entry);
+
+int ntmp_maft_delete_entry(struct netc_cbdrs *cbdrs, u32 entry_id)
+{
+	return ntmp_delete_entry_by_id(cbdrs, NTMP_MAFT_ID,
+				       cbdrs->tbl.maft_ver,
+				       entry_id, 0, 0);
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_delete_entry);
+
+int ntmp_rsst_query_or_update_entry(struct netc_cbdrs *cbdrs, u32 *table,
+				    int count, bool query)
+{
+	struct device *dev = cbdrs->dma_dev;
+	struct rsst_req_update *requ;
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	u32 len, data_size;
+	dma_addr_t dma;
+	int err, i;
+	void *tmp;
+
+	if (count != RSST_ENTRY_NUM)
+		/* HW only takes in a full 64 entry table */
+		return -EINVAL;
+
+	if (query)
+		data_size = NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count) +
+			    RSST_CFGE_DATA_SIZE(count);
+	else
+		data_size = struct_size(requ, groups, count);
+
+	tmp = ntmp_alloc_data_mem(dev, data_size, &dma, (void **)&req);
+	if (!tmp)
+		return -ENOMEM;
+
+	/* Set the request data buffer */
+	if (query) {
+		NTMP_FILL_CRD_EID(req, cbdrs->tbl.rsst_ver, 0, 0, 0);
+		len = NTMP_LEN(sizeof(*req), data_size);
+		ntmp_fill_request_headr(&cbd, dma, len, NTMP_RSST_ID,
+					NTMP_CMD_QUERY, NTMP_AM_ENTRY_ID);
+	} else {
+		requ = (struct rsst_req_update *)req;
+		NTMP_FILL_CRD_EID(requ, cbdrs->tbl.rsst_ver, 0,
+				  NTMP_GEN_UA_CFGEU | NTMP_GEN_UA_STSEU, 0);
+		for (i = 0; i < count; i++)
+			requ->groups[i] = (u8)(table[i]);
+
+		len = NTMP_LEN(data_size, 0);
+		ntmp_fill_request_headr(&cbd, dma, len, NTMP_RSST_ID,
+					NTMP_CMD_UPDATE, NTMP_AM_ENTRY_ID);
+	}
+
+	err = netc_xmit_ntmp_cmd(cbdrs, &cbd);
+	if (err) {
+		dev_err(dev, "%s RSS table entry failed (%d)!",
+			query ? "Query" : "Update", err);
+		goto end;
+	}
+
+	if (query) {
+		u8 *group = (u8 *)req;
+
+		group += NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count);
+		for (i = 0; i < count; i++)
+			table[i] = group[i];
+	}
+
+end:
+	ntmp_free_data_mem(dev, data_size, tmp, dma);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_rsst_query_or_update_entry);
+
+MODULE_DESCRIPTION("NXP NETC Library");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_formats.h b/drivers/net/ethernet/freescale/enetc/ntmp_formats.h
new file mode 100644
index 000000000000..3fab5a0f2cc5
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp_formats.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * NTMP table request and response data buffer formats
+ * Copyright 2025 NXP
+ */
+
+#ifndef __NTMP_FORMATS_H
+#define __NTMP_FORMATS_H
+#include <linux/fsl/ntmp.h>
+
+#pragma pack(1)
+
+struct common_req_data {
+	__le16 update_act;
+	u8 dbg_opt;
+	u8 tblv_qact;
+#define NTMP_QUERY_ACT		GENMASK(3, 0)
+#define NTMP_TBL_VER		GENMASK(7, 0)
+#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
+				 ((a) & NTMP_QUERY_ACT))
+};
+
+struct common_resp_query {
+	__le32 entry_id;
+};
+
+struct common_resp_nq {
+	__le32 status;
+};
+
+/* Generic structure for request data by entry ID  */
+struct ntmp_req_by_eid {
+	struct common_req_data crd;
+	__le32 entry_id;
+};
+
+/* MAC Address Filter Table Request Data Buffer Format of Add action */
+struct maft_req_add {
+	struct common_req_data crd;
+	__le32 entry_id;
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+/* MAC Address Filter Table Response Data Buffer Format of Query action */
+struct maft_resp_query {
+	__le32 entry_id;
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+/* RSS Table Request Data Buffer Format of Update action */
+struct rsst_req_update {
+	struct common_req_data crd;
+	__le32 entry_id;
+	u8 groups[];
+};
+
+#pragma pack()
+
+#endif
diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
new file mode 100644
index 000000000000..7cf322a1c8e3
--- /dev/null
+++ b/include/linux/fsl/ntmp.h
@@ -0,0 +1,178 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright 2025 NXP */
+#ifndef __NETC_NTMP_H
+#define __NETC_NTMP_H
+
+#include <linux/bitops.h>
+#include <linux/if_ether.h>
+
+#define NTMP_NULL_ENTRY_ID		0xffffffffU
+#define NETC_CBDR_BD_NUM		256
+
+#pragma pack(1)
+
+union netc_cbd {
+	struct {
+		__le64 addr;
+		__le32 len;
+#define NTMP_RESP_LEN		GENMASK(19, 0)
+#define NTMP_REQ_LEN		GENMASK(31, 20)
+#define NTMP_LEN(req, resp)	(FIELD_PREP(NTMP_REQ_LEN, (req)) | \
+				((resp) & NTMP_RESP_LEN))
+		u8 cmd;
+#define NTMP_CMD_DELETE		BIT(0)
+#define NTMP_CMD_UPDATE		BIT(1)
+#define NTMP_CMD_QUERY		BIT(2)
+#define NTMP_CMD_ADD		BIT(3)
+#define NTMP_CMD_QD		(NTMP_CMD_QUERY | NTMP_CMD_DELETE)
+#define NTMP_CMD_QU		(NTMP_CMD_QUERY | NTMP_CMD_UPDATE)
+#define NTMP_CMD_AU		(NTMP_CMD_ADD | NTMP_CMD_UPDATE)
+#define NTMP_CMD_AQ		(NTMP_CMD_ADD | NTMP_CMD_QUERY)
+#define NTMP_CMD_AQU		(NTMP_CMD_AQ | NTMP_CMD_UPDATE)
+		u8 access_method;
+#define NTMP_ACCESS_METHOD	GENMASK(7, 4)
+#define NTMP_AM_ENTRY_ID	0
+#define NTMP_AM_EXACT_KEY	1
+#define NTMP_AM_SEARCH		2
+#define NTMP_AM_TERNARY_KEY	3
+		u8 table_id;
+		u8 ver_cci_rr;
+#define NTMP_HDR_VERSION	GENMASK(5, 0)
+#define NTMP_HDR_VER2		2
+#define NTMP_CCI		BIT(6)
+#define NTMP_RR			BIT(7)
+		__le32 resv[3];
+		__le32 npf;
+#define NTMP_NPF		BIT(15)
+	} req_hdr;	/* NTMP Request Message Header Format */
+
+	struct {
+		__le32 resv0[3];
+		__le16 num_matched;
+		__le16 error_rr;
+#define NTMP_RESP_ERROR		GENMASK(11, 0)
+#define NTMP_RESP_RR		BIT(15)
+		__le32 resv1[4];
+	} resp_hdr; /* NTMP Response Message Header Format */
+};
+
+struct maft_keye_data {
+	u8 mac_addr[ETH_ALEN];
+	__le16 resv;
+};
+
+struct maft_cfge_data {
+	__le16 si_bitmap;
+	__le16 resv;
+};
+
+#pragma pack()
+
+struct netc_cbdr_regs {
+	void __iomem *pir;
+	void __iomem *cir;
+	void __iomem *mr;
+
+	void __iomem *bar0;
+	void __iomem *bar1;
+	void __iomem *lenr;
+};
+
+struct netc_tbl_vers {
+	u8 maft_ver;
+	u8 rsst_ver;
+};
+
+struct netc_cbdr {
+	struct netc_cbdr_regs regs;
+
+	int bd_num;
+	int next_to_use;
+	int next_to_clean;
+
+	int dma_size;
+	void *addr_base;
+	void *addr_base_align;
+	dma_addr_t dma_base;
+	dma_addr_t dma_base_align;
+
+	spinlock_t ring_lock; /* Avoid race condition */
+};
+
+struct netc_cbdrs {
+	int cbdr_num;	/* number of control BD ring */
+	int cbdr_size;	/* number of BDs per control BD ring */
+	struct device *dma_dev;
+	struct netc_cbdr *ring;
+	struct netc_tbl_vers tbl;
+};
+
+enum netc_dev_type {
+	NETC_DEV_ENETC,
+	NETC_DEV_SWITCH
+};
+
+struct ntmp_priv {
+	enum netc_dev_type dev_type;
+	struct netc_cbdrs cbdrs;
+};
+
+struct maft_entry_data {
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+#if IS_ENABLED(CONFIG_NXP_NETC_LIB)
+int netc_setup_cbdr(struct device *dev, int cbd_num,
+		    struct netc_cbdr_regs *regs,
+		    struct netc_cbdr *cbdr);
+void netc_teardown_cbdr(struct device *dev, struct netc_cbdr *cbdr);
+
+/* NTMP APIs */
+int ntmp_maft_add_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			struct maft_entry_data *data);
+int ntmp_maft_query_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+			  struct maft_entry_data *data);
+int ntmp_maft_delete_entry(struct netc_cbdrs *cbdrs, u32 entry_id);
+int ntmp_rsst_query_or_update_entry(struct netc_cbdrs *cbdrs,
+				    u32 *table, int count, bool query);
+#else
+static inline int netc_setup_cbdr(struct device *dev, int cbd_num,
+				  struct netc_cbdr_regs *regs,
+				  struct netc_cbdr *cbdr)
+{
+	return 0;
+}
+
+static inline void netc_teardown_cbdr(struct device *dev,
+				      struct netc_cbdr *cbdr)
+{
+}
+
+static inline int ntmp_maft_add_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+				      struct maft_entry_data *data)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_query_entry(struct netc_cbdrs *cbdrs, u32 entry_id,
+					struct maft_entry_data *data)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_delete_entry(struct netc_cbdrs *cbdrs, u32 entry_id)
+{
+	return 0;
+}
+
+static inline int ntmp_rsst_query_or_update_entry(struct netc_cbdrs *cbdrs,
+						  u32 *table, int count,
+						  bool query)
+{
+	return 0;
+}
+
+#endif
+
+#endif
-- 
2.34.1


