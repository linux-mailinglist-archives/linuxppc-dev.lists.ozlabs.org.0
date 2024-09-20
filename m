Return-Path: <linuxppc-dev+bounces-1492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A8C97D4E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 13:42:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X99Tp69Tqz2yRD;
	Fri, 20 Sep 2024 21:42:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726823408;
	cv=pass; b=UuzEzU6AKHzkjWQOk9hHoqdmuEJBH6x/ok1jnut+//xMFdU5dvepqwuvdgc0fUYlc8Nxsc4iJUyBbJbroMKgNmeLflgZf26g9IjjmE57a5yCxfxc7mHL7LO5qUgkZloorYH9azOzdiXU5B6BIs4xTQsC3lOgfYVsFJil3svWSt76vimjmoaNkrROluIbKy5zZBsgBgsB8XC7b95+luBtaOfFs3YGNjIGAxGEIKMohCdCKPRUwVyreFgNJvvTbnV6uQERl9fidWty8RPG04PQWwtIWT9x0Z/cETEXsXduPzSkKP27f7FZOUnlM/u2NOX44uql7JuY+0NZDrIamkbHNw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726823408; c=relaxed/relaxed;
	bh=aR7fLCKp50OCzEfxs1F6w6Gum50h2rPyPgNfhzgNzA0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eencGTUX1vtYzYhEJDl6vMr983D2tJjLfP+oy1MnJh1iNI/cDS82/itmlycwuK1oV9nRWO5NgZ8eLjD3LcVNN6RX8h9unNSNdVr2sUHYIJlVjBKM/46Otgr9PoGi4B+bhXdNYeadJwpWKeo0ai6WkNx7FtF1vN6OCxeQ971R/mFhojIZ+IgfZyNIpDQ/5ywOGMcelDANsR5iXxj4tmrp5ozRrUgWhLuk7qYCG4kC66ba5jD398Ha64J/Vyyra0g7bu0YxfPUvARp4ChgDIqklBLySJrI+G1VW5UATI2TV7nnvt+wr18yLoSEd2GbIxwjf+i59WbIhIr6uDdUDfc2ug==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=XKcVLxRH; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=yanzhen@vivo.com; receiver=lists.ozlabs.org) smtp.mailfrom=vivo.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=XKcVLxRH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=yanzhen@vivo.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X966Q3b2Rz2xjK;
	Fri, 20 Sep 2024 19:10:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jkv9uMH9kT1yjroYkULb243IKvjcHu26skXWkeD3POIpdoUH/JqBzef6tsFNCUuOCl9T+yOschszTkfriihZ6rBX4QFm+GBdc9nZxLwljAe6QzzmlzDz0/YAIBybfyArHbQmVpgxcBiCHTTNKEHbhEIusF/JQ+PbUFYiEofbEmnc8V+vrVncY9YHVLVLJibV1cBAKLYhkLsC86D2RhLLxUzqL7qUcQq8A1dWHDZNgX61CBpj5xik2BqM0HnbzPGQd+rYMg02M+6hcAydUJCHj1cYjJMEOffp0WxYFtpjEZSmJlaqYx+ZFGnpUgA75la1LZQhEyV/xAzzt+aB+K5JjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aR7fLCKp50OCzEfxs1F6w6Gum50h2rPyPgNfhzgNzA0=;
 b=Fm4olOe82McyYB6ysWaU/Mbj7NoSTpw6aholD+8OnLj1LR/JEV+WJ/BNQaM3iOJIfWkLtlSSGOz2lt4gMcsAEr3yVFZ1oQOozwtpjvps0c2GPBp+3Qq4lv1Paahjd384MXU2CsNdIdelr6o+ppPBbs46H+MpJM103aftfCopC567sMyZgo9G2B4pZglojonBFOjXl3nE5ATCIdVLhYMb1oPoHJti44pthSR5ufNL38/IfPWGHBLYLbCuIXwPC+LzrwBWvJzlxm0A/YEeKZjg5gOEPU3a/kipBmjE05+5qOrg44zDWX+K21u7+oR3IbpMsqLz3nOhUrcbfp7fjBO2hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aR7fLCKp50OCzEfxs1F6w6Gum50h2rPyPgNfhzgNzA0=;
 b=XKcVLxRHIWg3BLARvg/v95Hn49m6VtYvGI41k/Yum/N2n4/w4v0iGIF6P7ELidFAROeTHNbbPfUxk+1tV83g69q0fEf2Sskf/8MyEXRXZgKlToU0I4pSnzzVC48nLVOxv/8J+B/oHHXE/r/ECAZOBYoT+QDdy8hoWqBzblmPzw36yPl54X+TL+yCO7ngs1Ab03YzfvMDSD2lvY5tzk++bAfO810osYeYPJhPtyPRStDCg1X20z/J409ymjtgVMEUfvsoA8/ewOrkUgWgmaoWiMDNlEOJLLq9wEaS2BlqaFgwhO/223QWBLt+1jofJjdxspyWdJB1grdcEuym3Uba8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by SI2PR06MB5171.apcprd06.prod.outlook.com (2603:1096:4:1ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 09:09:35 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7962.022; Fri, 20 Sep 2024
 09:09:34 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: neal_liu@aspeedtech.com,
	gregkh@linuxfoundation.org,
	joel@jms.id.au,
	herve.codina@bootlin.com
Cc: andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] usb: gadget: udc: fix typo in the comment
Date: Fri, 20 Sep 2024 16:47:05 +0800
Message-Id: <20240920084708.1967059-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|SI2PR06MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 233261e2-767d-40f8-be25-08dcd953f1af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w2/NVtna5DxCGLnaqKwdYWNC1eAAHvjw8QZ8eBx7GI76jB4S94xwKTh0tAnL?=
 =?us-ascii?Q?8MXXx1JKKXD2Css6YPZrx+Dmu4M9gnq4TNk+UPhdsc6BEDILcksxvPSA8oEy?=
 =?us-ascii?Q?RqYwh6BUrVLTtM1xh0/f42QEJkTXClJab+q14COSJ5LDH3aDfYO3Z3eltsxH?=
 =?us-ascii?Q?mLpoJJO74UTEBVIDXxCuJxwvA32ofll4ibUNdEM4PZbBMRo4+aLMgG/4/mqq?=
 =?us-ascii?Q?8PA++LZ3ugX1+SbBGbS+NBcls/ttx4ktnPVIc81AgIXILlwFYKiXWkQMTgTF?=
 =?us-ascii?Q?qLpmGQ62Snb2/oHpID/A7QCDEcVajilUNZWuWv47zZ+WtkH1o6++dNrzb1Oo?=
 =?us-ascii?Q?OiAyZCvqXzlhHHr9Uo2iXh2m8cx61bspgpl7lfcDRnSdMjAEq+f0sXYHqQlf?=
 =?us-ascii?Q?LZ2Qa7cCTG94BVbngcpk0pQuF5ro1cu9JXDyswogfjxiSWkOLAHhnUvHPifO?=
 =?us-ascii?Q?mpjg9aYW5QFmU3O9zp63OEAGi9eTXCk3WKyBERso6lHWUs0IDcxGO2RbSgc+?=
 =?us-ascii?Q?Dkbt5JuYiioPXFmx+HT/4tmdBwjW/signNSjzbXowIejz5PSzUq/yyiEn2BJ?=
 =?us-ascii?Q?69QB3sdfXxltsvTtEh8sUhqcXSaxmwf2GzwaUdq987l8InTBo5BdeWc9WTmo?=
 =?us-ascii?Q?3JEQyLNgRuD6bCOLIR40i2pK43PSVQ/cNYmybjVgHgrHbnj4f3ZiKgfu22ow?=
 =?us-ascii?Q?BUL//DK/PiSW5v1HeZ9WWVqNd/Snfme7/PHfONfy8KsmW91ek7458WhnAGsE?=
 =?us-ascii?Q?KRkq5wo+iBI84zzhBC50X6FFUj854N+dn827V3eaTnjXxCntLNvGmdTpGCHd?=
 =?us-ascii?Q?kvIXZgtOosyLs/XJodlIlVZ8NSoQIxyZEewHjLUBs68pxwOECn40l5VLZUzU?=
 =?us-ascii?Q?thCfHvxqV2l59gozRvqmoKimXmFgZHEJ2V/m4wer/0s/mdv8313RHNG8r65y?=
 =?us-ascii?Q?8Z879BzhwAV4Bdw6NwqGNZSG/ZzMMIHbPv8g+Hmp0249BuMPkcr9tSiG6f8J?=
 =?us-ascii?Q?yTa/jsEJvsL9r224Xp8I0mKRpJIbcbckmIw/WFVbJ7VNq0SUJWaVDrVXTSdZ?=
 =?us-ascii?Q?A/wpXsLBn5gKq8n1UdBrS0AvfM8MdJAQIhrptUJxGK4xtC0nyRO2gE/JujHl?=
 =?us-ascii?Q?uh7I4wEvE7f1W1/Uyag2tDTV5hfKZIXr2LdmaL6cnrlgrZ8l/1wr9qzf4QQY?=
 =?us-ascii?Q?EZ8xDeUbbOWWshJLhaix4rLPc4CtGh0Ffzamq2vvHr0mPVqbteti18grbA+V?=
 =?us-ascii?Q?SRxIPLM2UKtQC/CstOaVH+MOlpDLR/VGDgMTJtqpVIYbAf7HTjycl5u+6Of+?=
 =?us-ascii?Q?JmSChy7NPbqyoZo3wwY68+0ceCKqpgOgZgEIxUzuIoVnGuSPhQ9AqylEO+if?=
 =?us-ascii?Q?3SMJVuU5Q1m9ypkuEfkiR0PPjHg8UkaTBsIbtJlVpmQ1viXJNg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rflHA0KJW6HYIrrAQ1RLtC78Jp4W73iejmMt3q7R67MoLGV6GMZ3iiZN2z2u?=
 =?us-ascii?Q?UpTcHCdp0anl27DTjXRj33Yb7C8xcrDCs8XFAYO6sgHYwueVQeFGWmtNu0cL?=
 =?us-ascii?Q?AaTT2HvqVJG1Rln8E6eCrpNaDb2zQhqqnZHt8LOToxwxjn30yxyOoEgHyOq1?=
 =?us-ascii?Q?DC71ZLKeYl4vvde7mFrNCkRB2//oS+ys7ptR2g/0z7bMlxRK+zm4Fg9SAyrY?=
 =?us-ascii?Q?LoFQSWurGfX1StsopQqW9BKbNRW6wTbrN85qkLLBI6eSGOC4mzKCDwIH3PMM?=
 =?us-ascii?Q?/TkZXelJrs4xxIqSaH1PCELecMIfR1f591QW7mJg3MtF6itAEkVHwgfqj4cB?=
 =?us-ascii?Q?0bsJB1+9tj5Iu+qLVePj1VoXe2f0wpd5WbWT5PDTH1YRdC5d9y74/azGuhr0?=
 =?us-ascii?Q?KA7zY0Ummv0QRG3OP/uWbjfsHlHL0V9HrLeFr3j5Sc8icF+vOD7Kk0uWt8Y8?=
 =?us-ascii?Q?dlnt6fWzSgxnY3CYgCEYzi41Yp5nLPcGJgHx37oSjTv3HQ49c5bN4kHo4Osm?=
 =?us-ascii?Q?P7QvM5jKHCGKB8dTUvr5Vph8msldZwSufJjQhckeE1mROufWnQzvP1TNPeOe?=
 =?us-ascii?Q?DfWwXkx5jIAZW7l0Cp8vv9w+f4ZNRUuSZjSgxilUzKM+blZdvhUshLczH/zl?=
 =?us-ascii?Q?yOUSw1yFftB52o9ADXysX0wpFTofBz4tHxDP6dPktGVGP8pvEhO1n4E87+GM?=
 =?us-ascii?Q?KYWVgyrFNPjlOobqxtp3r5PfgtIOu/s39MWC9OJug+74xNjPDh7RXsnzZ7qf?=
 =?us-ascii?Q?g0/8vpeUuYeJzjC6lLeEuooRHj2yd4jHoYVpYPOLHjTIjUMgQ6kZaRgg9e8h?=
 =?us-ascii?Q?HyBa01oBozL1U3vMeuwOtCckwdZyqIhs/sIIRgijMtJ1H8yVAZWWMFZfvsSe?=
 =?us-ascii?Q?XVm5BdFHQoKxlyTjYp4HsgzaXhFcpz2KMN9IgOasxQrN/LpMHcRW8PTrpcGq?=
 =?us-ascii?Q?upbK8IFVwOGhcgaLHtvd7DMUgsfRYNga25juAMj7XtSDlCc0A8g3M0sSAuhg?=
 =?us-ascii?Q?eOjAw/O1gAh33+XagQyRYSHdDTvHvl+dHKD+7HAi0qBzBX1NMCaQ1ajsAbWS?=
 =?us-ascii?Q?ez7r+2LeN5+IfFHpjUMmQEAulmRi8nJHW+M0/P7VxFFgROvVTOzj9nk2UF2J?=
 =?us-ascii?Q?S8ET8q1JgldtdsRyM7di49J9FQBIH9tS1hu5kQb0SLegrGeo93xYV++1DCn3?=
 =?us-ascii?Q?7l0NN5MrQbiL26v+jzEg6JcTI/JgHlH+3LVKTP1flhWijBAIqhoqY4uc/RGa?=
 =?us-ascii?Q?L5hL/jH5iZ+cKqtJyORedxItt//fR6IZOuHiQjS842esiJVJMORh6L0Tq21O?=
 =?us-ascii?Q?indZ0d9JkRypVb5rE0qxKlNaJaZE5Ci2+sAxiLBGMXvctd12lShv0ozNISkO?=
 =?us-ascii?Q?ka/wwO4ntwdpMIOrQCO97Ok7tB+WMjKTCWOwIN1fjmysqBpF3SfvvKpjTQgR?=
 =?us-ascii?Q?XgxWPy51KEUTHsWezIq5WsnvSN4ocDH2brM2M4ZI2o47sGJITP/JHCUSrhBG?=
 =?us-ascii?Q?1CQV09U6LRm9hfdMIt8/xf/bs3n3nn2FJ1d9gcxRWi+N/hLlR8Mv4pDL8szQ?=
 =?us-ascii?Q?HPvxO7cBYBgKcsUdUqb4vgqGxNVUcTNgaABNV9ck?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233261e2-767d-40f8-be25-08dcd953f1af
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:09:34.2531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4YF3JNQbFeK/EsFjveDRHU3P8MpWAH6Sy0YPpu9EjcnN8kYIQIMmDKvHfrhrBtq/Sc9noTvXpUPaZOy1zYWcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5171

Correctly spelled comments make it easier for the reader to understand
the code.

Fix typos:
'trasmit' -> 'transmit',
'structres' -> 'structures',
'divisble' -> 'divisible',
'trainsmited' -> 'transmitted',
'packect's' -> 'packet's',
'timmer' -> 'timer',
'devcice' -> 'device',
'delelate' -> 'delegate',
'lengh' -> 'length'.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c    | 2 +-
 drivers/usb/gadget/udc/dummy_hcd.c     | 2 +-
 drivers/usb/gadget/udc/fsl_qe_udc.c    | 6 +++---
 drivers/usb/gadget/udc/fusb300_udc.c   | 2 +-
 drivers/usb/gadget/udc/net2272.c       | 2 +-
 drivers/usb/gadget/udc/renesas_usbf.c  | 2 +-
 drivers/usb/gadget/udc/snps_udc_core.c | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index f4781e611aaa..5b62f43b36f7 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -156,7 +156,7 @@
 #define AST_EP_DMA_DESC_PID_DATA1	(2 << 14)
 #define AST_EP_DMA_DESC_PID_MDATA	(3 << 14)
 #define EP_DESC1_IN_LEN(x)		((x) & 0x1fff)
-#define AST_EP_DMA_DESC_MAX_LEN		(7680) /* Max packet length for trasmit in 1 desc */
+#define AST_EP_DMA_DESC_MAX_LEN		(7680) /* Max packet length for transmit in 1 desc */
 
 struct ast_udc_request {
 	struct usb_request	req;
diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index ff7bee78bcc4..f759bfc2f243 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -80,7 +80,7 @@ module_param_named(num, mod_data.num, uint, S_IRUGO);
 MODULE_PARM_DESC(num, "number of emulated controllers");
 /*-------------------------------------------------------------------------*/
 
-/* gadget side driver data structres */
+/* gadget side driver data structures */
 struct dummy_ep {
 	struct list_head		queue;
 	unsigned long			last_io;	/* jiffies timestamp */
diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 4e88681a79b6..55f49d01f9c5 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -511,7 +511,7 @@ static int qe_ep_register_init(struct qe_udc *udc, unsigned char pipe_num)
 	out_8(&epparam->tbmr, rtfcr);
 
 	tmp = (u16)(ep->ep.maxpacket + USB_CRC_SIZE);
-	/* MRBLR must be divisble by 4 */
+	/* MRBLR must be divisible by 4 */
 	tmp = (u16)(((tmp >> 2) << 2) + 4);
 	out_be16(&epparam->mrblr, tmp);
 
@@ -1413,7 +1413,7 @@ static int ep_txframe_handle(struct qe_ep *ep)
 	return 0;
 }
 
-/* confirm the already trainsmited bd */
+/* confirm the already transmitted bd */
 static int qe_ep_txconf(struct qe_ep *ep)
 {
 	struct qe_bd __iomem *bd;
@@ -2196,7 +2196,7 @@ static int tx_irq(struct qe_udc *udc)
 }
 
 
-/* setup packect's rx is handle in the function too */
+/* setup packet's rx is handle in the function too */
 static void rx_irq(struct qe_udc *udc)
 {
 	struct qe_ep *ep;
diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
index 873265634ccc..8558ba4b8a8b 100644
--- a/drivers/usb/gadget/udc/fusb300_udc.c
+++ b/drivers/usb/gadget/udc/fusb300_udc.c
@@ -1297,7 +1297,7 @@ static void init_controller(struct fusb300 *fusb300)
 	reg |= val;
 	iowrite32(reg, fusb300->reg + FUSB300_OFFSET_HSCR);
 
-	/*set u1 u2 timmer*/
+	/*set u1 u2 timer*/
 	fusb300_set_u2_timeout(fusb300, 0xff);
 	fusb300_set_u1_timeout(fusb300, 0xff);
 
diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 19bbc38f3d35..5e398180cded 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -2097,7 +2097,7 @@ static irqreturn_t net2272_irq(int irq, void *_dev)
 	}
 	/* check dma interrupts */
 #endif
-	/* Platform/devcice interrupt handler */
+	/* Platform/device interrupt handler */
 #if !defined(PLX_PCI_RDK)
 	net2272_handle_stat1_irqs(dev, net2272_read(dev, IRQSTAT1));
 	net2272_handle_stat0_irqs(dev, net2272_read(dev, IRQSTAT0));
diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
index 657f265ac7cc..6de09ece8545 100644
--- a/drivers/usb/gadget/udc/renesas_usbf.c
+++ b/drivers/usb/gadget/udc/renesas_usbf.c
@@ -2482,7 +2482,7 @@ static int usbf_handle_ep0_setup(struct usbf_ep *ep0)
 	ep0->delayed_status = 0;
 
 	if ((crq.ctrlreq.bRequestType & USB_TYPE_MASK) != USB_TYPE_STANDARD) {
-		/* This is not a USB standard request -> delelate */
+		/* This is not a USB standard request -> delegate */
 		goto delegate;
 	}
 
diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index 2fc5d4d277bc..25f418d2c232 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -2707,7 +2707,7 @@ static irqreturn_t udc_control_in_isr(struct udc *dev)
 					/* write fifo */
 					udc_txfifo_write(ep, &req->req);
 
-					/* lengh bytes transferred */
+					/* length bytes transferred */
 					len = req->req.length - req->req.actual;
 					if (len > ep->ep.maxpacket)
 						len = ep->ep.maxpacket;
-- 
2.34.1


