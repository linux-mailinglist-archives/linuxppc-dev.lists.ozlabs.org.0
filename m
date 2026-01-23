Return-Path: <linuxppc-dev+bounces-16220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDhIAK0wc2mTswAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 09:26:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E25872723
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 09:26:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy9xM6g3fz3c9M;
	Fri, 23 Jan 2026 19:25:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769156759;
	cv=pass; b=k6+yCJQzs7+q+q68hdR1a7uyX3HIeHOd2j6VL1UARf4Dj9FTS291zHwhGh0APGno9VKfveMscENlmh2gCpoTCmOYfYTkP6Yn0/adqJx+ZnmoVmwaB6C4SNrwfxApy+ISEnjLvH2PxP7hghhXeI07e3xDoKGyVaJQoHNdce0Ww8mfh5N4Zj6Qvu/rL3KfRiFpSxerCU8LhHyIyw/eLvZ9FCdoTzLhkn3E+4jRKVvCJRn8bP+Ps0R+E4CSzeqRmP0TPw6Wb0AJVy8TTbUV5I+0rxZ70Uq1OTDMMVH/OM33RrNo1PQ+S/a7tzKTX2zDUOcwaZOagKdz1ycP5Wcs5PSOiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769156759; c=relaxed/relaxed;
	bh=g8rA3GvkMt2AYYmc32fEUHW9T98nex0O94GBEQQd/ok=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FJ/nvKMUnWfl84P1GShaVjwmVMA9E1s705FMG406E6PJPg71L9z4tKC8QIWyzKPMYavL7PAkEzYtVc5WgGmdZ2DwSkq6dqjp44VQ8Jqlc4s4nhAV4REP5skOtt77YHBsxnGQedJsSqMLVdtV+BxZipE4chZQANpzIdDgyRFYPHdeQ1tBAYosuvkbAR7KwEGZy04V7DeISi1cou/5AfdIC0bInrQ/OlvhCDfbfo88jlnJhXNMZ01Uev+Li2K2+/dJ/4BopOmJmszmmSwiaq7oAziYD42rpEeX9qcyyUBachtLnI8mtuP3ZyKJ850yTxEw4CNVJh2AA+Zx5KqX7vQdWA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GvLemWYW; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GvLemWYW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy9xM1lfvz3c5f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 19:25:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnRA16dvBuZzKiDLw7tOz0Q6ejewVXe6l5WCsb1Qvf3aepm9q6rX6DfG1CrEdlk2RO3pEEe9J0azjbB/FKhEmLUkXTT+7AKSCNQWx2gJSC0B+ZltsHK1OYbzg7ykQfkQx4iz0/iifgPk3RBG5J4LHYG8qB8jTpIdQES5a6vMk7uOWuX6j1leLAhHmHSBadXNV1VNGNWV3xFRf16oTDmsqEyaprlxeKTNJr+1CW5tHAkgvi4IsnT1K5cjB6BvQWGytzyryML4zBHC1brIIbQcitvT+4sPXMLqeMQqpzyTRefX3pJqEoF4poq7wHBRPa4uvmGS0BHZovqfKcyEjGayQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8rA3GvkMt2AYYmc32fEUHW9T98nex0O94GBEQQd/ok=;
 b=EG+TQrlGjtvnoxGFEwj8kExpzDSHoPz+8Ua4I7ffgCpFYqQtClKQJMwBKmn1Vim+AwsglQuuvVDWt/yuxbpjZYr0QO0Ny9LZbwwM1J50RauyUpS6qxz3IzTYL5jMm+P1q6YLQBuhyvYLOecPZ8ftvnZKJ4q2nk09OkfYoSAJhl7hLI5iURFMjtmNtF7rKxh9Uxeamax9Zjme8XoRybvjYRlbOSNHconUA/aZgkVxphwabaVc/eaAnh63n8GUutPpWjVPy8nDNoEStejy9e6sKxo6rp16Crc6qsTFSZNHRW9mQPp/g/bZ7ncYyyK2zht8InTipuSR2HshyO59qw+MNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8rA3GvkMt2AYYmc32fEUHW9T98nex0O94GBEQQd/ok=;
 b=GvLemWYW31gSWlo7HkXYyF7knnDVG80IHQFXu/jg2Qp6MBNtPXgm4JUm93N/GLirPDZjDnKfaXYsCI8cA/Cfshn6zym8LmwwNe6Zrl6EYy72AMQM7nFeZhN+kA3h7WwdNbyMIQxSEVQIySogBNbxXctO3/cn5pFbIuvm8zUN/fO7d/R23vwRNabpEZq8crmQCqjyyyf7n+gJ2GYfDBBgAsfQcVpIQtdFODfME7KdzRWx4Mt9vX/nOAW9OU40goulDeyq4CSRdJFU7gKydUBMXnpfQSTzzu+EYFGxnv4CAPBJGHycTc3GC7uGreJWR1IZXXcqH3gYvCl0o+HSQ2WWDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS5PR04MB9730.eurprd04.prod.outlook.com (2603:10a6:20b:677::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 08:25:44 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 08:25:44 +0000
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
Subject: [PATCH v3 3/4] ASoC: fsl_audmix: Add support for i.MX952 platform
Date: Fri, 23 Jan 2026 16:25:00 +0800
Message-Id: <20260123082501.4050296-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
References: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS5PR04MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: ab292677-a90e-4a58-4a32-08de5a59009d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kdqnMJrDVBqOpBf8dMWVsL8YRyQb6r8rRY2W85ZqfNZnasi5nhdfjxaW5ZWh?=
 =?us-ascii?Q?AW3yIoS8i5E0H/orChAAesX6wwq7Nz1e62eZP3MmkwdXJCQgmZ3tvEHArMIg?=
 =?us-ascii?Q?9wT1HcyyUWmSRqlNtSH0xmvVyb4eZi/2T4UI00/AtS3gpGZu/0tlLHqYPUWu?=
 =?us-ascii?Q?l9e0N8k8/oEx7cOopm6gMu6Deq//gwxBTHzgyBO9L4BZf44QAXrstBwSISev?=
 =?us-ascii?Q?heeZahgNY8olHu7Bn8lo3BKbcTjrApw4V58YtOU+c35ShOJG3w83S2fd4pb9?=
 =?us-ascii?Q?cw+Zrkg3biedtjz4SMb+ji442gq9yFN87spSghil18aRhaLu+gyzrRUtUa2L?=
 =?us-ascii?Q?1QwbS0icGn5p9Olx+jx8gQdcv7T+PaRmVfjauuvB5s7USQAApmuqEgbTa9RT?=
 =?us-ascii?Q?tKs4FAYBPPStvvolrL1Jk7vLiQOlJbWSe5YkPkxadP33MAlLrN+R+z3eG0jo?=
 =?us-ascii?Q?cF3+YjW/cLdTceRc52vJaiHyIVuVQAHxJ5PjWCrAVoCmuIpWnyM8oLS31ESu?=
 =?us-ascii?Q?eFVfkBB7RRD9RX6Ti8kRq3pLJ5Do6pw/JCxrAgBYwSpxkM1zYQ/YExAMTyNz?=
 =?us-ascii?Q?QIlcCb2oM2Wlz+hY7HUW1y0mkUZb9gtttgWukunvzLfDrqv0JB3micQlJMjw?=
 =?us-ascii?Q?UOIXbZDaZnjaijTaYvmmATcANqsWR6uTU5iHCx6NazkDW9tDHsC25jhldndE?=
 =?us-ascii?Q?BcPOJmOumRPhzEJWkgf3FvwvkOenQlze6rfTdVjysWAP5gozVL4eJBsR23Bn?=
 =?us-ascii?Q?IV9A33+DH+xieDnlmOaCg0/brloQLSvzq3Rxm/tnuwgnZd7IYxj0aVBh0PF9?=
 =?us-ascii?Q?ni3RlwV+G7cfVVPUBqri8Gf+RMUZToAYjK3hl7vpIXiRQMTl8XeWxz+QA9hh?=
 =?us-ascii?Q?fJ2cI9m0u/SfzWCIW5CqH5P5/UDk7rHPDCBhEe9YBVsrOAN1xZMb3+iphSO6?=
 =?us-ascii?Q?40wIRwvIuotxOJQE/rgfVTYq+p+cOoTf2Pqed6tm+NBDG/LyN5Yyv+MglGVc?=
 =?us-ascii?Q?3JhPyvRDA6EE0wFfYdG4oLyfIsgyWqEWKTuhkDtTeU//PLR7e1X+0ZyoNmnj?=
 =?us-ascii?Q?2sdZML7NaOYjnslZA86+FjGPROxiEnUTDzBsWk9EVa13o4VkRuE1fwcMcr5F?=
 =?us-ascii?Q?aIohlEv2QglD32+NjPi6l86M2+JaP1uuJL3SQKNG0v946gXvVk/Q46G1lDd0?=
 =?us-ascii?Q?C8S6gwd0bj022T8aXZI+ZxE2CKUajIksglAU8H+/60qpj9Z2BKgntXI/lWhN?=
 =?us-ascii?Q?C7zRo4GprKdk3OqRbgy+wJ4zi27Ju6slRF5RAF3tIgt+WJCbCV3n5DyXykfn?=
 =?us-ascii?Q?OUPEPtMWzgiN7tskwhcDBwhsJxPvqQpTxQ6aXdqxdWNOiL6DmjIyu5/WkK6O?=
 =?us-ascii?Q?Wel9Jh5JSibCGQz7Y7tZi7DjgZ4xvkdEs0SZPnr9Vj/N+jReJVSJ2VOLTbiH?=
 =?us-ascii?Q?DMcNr/9Lvzk70Oo1zA0/DXMKh/B7JfxkU5fHyrJuDmjtPgxQm2bqv3rNexTl?=
 =?us-ascii?Q?nSig/U+vv0oX1/3RGi4LIjgcxBayi8vEpGd9zWnfzprBdA/OlXOFqEilQ5L+?=
 =?us-ascii?Q?pd+gXpNDF1U8WXeZp00lhdg9F32RFN7PnI5PMJMSmINrCuJQ977ft2+jRRfi?=
 =?us-ascii?Q?kW3cEv3Vr682F0yUR7fSmN3yT8xZTtgGblJxJ8q1hwGu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0yZTk4lIdWvpWylaBfNrjmAekniUJuVG0hyjLh4LCOw/4uhEA2cY55Te5cs6?=
 =?us-ascii?Q?5FRDguzSetFO+vJEvgu3WIFimKl/LV6E4EaXtNyQohOBC/BBaXXRBjYB0N6f?=
 =?us-ascii?Q?t9A0o1KV+XfSuXOPaz+y/+ZBq8p2YaEr+PO9wmU7euYWx4pb6S3SDhHNGgig?=
 =?us-ascii?Q?PQjiWH/l9C6pX4ukpe7shUT8SUW0ZyAL/WiYKSCJd5S/sRwTAXT3t+3P47BB?=
 =?us-ascii?Q?cnHoksNmqT0Cb5ZlmccGxi1tW4lpkTFVyer8ItlwDyFEOeFn4I6LqOw8l+Fa?=
 =?us-ascii?Q?pRw8/obwcJMgQxe6uKwO+29puO1rZaqvnt8qUI5YPLA+54kSnLcqZDx+EJx/?=
 =?us-ascii?Q?zMixI78KZ0frJJ8Y20ueWyCHhGnEbMsoHQHiq8DM8dpP1JrKlAxayCEFVMx0?=
 =?us-ascii?Q?oBrYJOr3f+MZZrlFbXBPzvVTChvuCFxMDk1oxpQSwjPGlVC7JP5CDnUPdQ1l?=
 =?us-ascii?Q?4mPvTo+ZCgiefHzKyNO3HqeoJPlYPE58B0NEOVUEeBn+A3mV/OpzW9X3UDBe?=
 =?us-ascii?Q?xmo89SiLe3ndwKUqPcL/6Om41YoGaGImazv18HRV0TmV3Q2XZ4Cb2du7h+l3?=
 =?us-ascii?Q?I1cvwdGjpQWnnQAl8W9aDd3PchpoeoDeorFXz4RwoEa1msCMd2eMou0G0ywY?=
 =?us-ascii?Q?wWtKllLanBScSQH62YzE2/B9GbTXxeOwjkHNFZd4FNg5wR8TO05wyg5WWrJQ?=
 =?us-ascii?Q?8zCkcNVQqdCUmjAHuOGu3/jVvk4Ya2xGcol4P7kPtrZWon1QL0o157DiyMcu?=
 =?us-ascii?Q?4WRq74Yu5xF0l2jJPMCpJCu4YIuYoAoTEa9UxSLjtixkXg7fDiPKbeMFGsPP?=
 =?us-ascii?Q?dLcwXcASAoDJAYjrxkPITbp169VQHvRngUAsiWtOeLlhLx9m1MQ7vL0Lz5Uf?=
 =?us-ascii?Q?izsJ8tY770F9Axw9Y6WCyv51CfCV51Ac/SlfLSV40+5OJWDBADol0RIVxd0p?=
 =?us-ascii?Q?HbriT3jPPywOaLnINKcuAnqt+KDWV1PxWeAovB0gCQCNzuP3v/ItyiaqQqZs?=
 =?us-ascii?Q?lu1dY/fT8wyy/a0Nn9pXVPRBX4uDB/l4mJVlRT4MpziKueyba5QeMEoUbpBg?=
 =?us-ascii?Q?6Rd4MrIg8QtbaQJG/XFVBhvx3HLyNgOFpk64x8WkWPu3s8J2KNsS96b5MOma?=
 =?us-ascii?Q?CdkTbXmi/g7DClx8AEvH5t60AoZbrlJR+Ipf+JiXSRFc5hOq8XR1kLBVOK/S?=
 =?us-ascii?Q?tHloRTvnUoc+54Pc2zhxKCuxoAFcGsKnLqDtSn6MFkWxxOb2XrKuNr6jnhQg?=
 =?us-ascii?Q?ngXwfGeHMxXUajQaNWivHdJnxM7rjJdSBWJV7PJqjsTlESrXJUtQEYT1o8Gt?=
 =?us-ascii?Q?ou543+dR471lIzZmfO+9Wc7J+1UWColLqkgG5X57tm0QM2fxldq5OYlH53o7?=
 =?us-ascii?Q?AtxZRlEFFHz25Nwy+rpmdmiTQBDr1ltxJDyoypNDCAQcd9HtB0dVGoCFprB3?=
 =?us-ascii?Q?m1trMDFexzjVBgS5ZaB8TG5FfRFJE844htiQ4LHXb8KDfxZAinGiA6UQe7dY?=
 =?us-ascii?Q?AWyRxlDTQC4pnjqVahUPY46FglnsqIJltXcZ/An6mtYPmugV+49Oo4Jj9O4X?=
 =?us-ascii?Q?EyjnWwl9lCpY2Wbto8Iuh2uFWVd6ElMbQjEX9Ox/AvplwWtWtCIuYcuuDB2X?=
 =?us-ascii?Q?zOPBCYSU9NcMGb4Q3VUE03DyLR802MJUpJyzOQIBOlTdYN5WJUSPxhBVk4FP?=
 =?us-ascii?Q?H8m64hK6JhIgMCMqVwc5ZFFS/s51dMi13A3K+cMUCG0obO8zWzeCLaXLbyP6?=
 =?us-ascii?Q?/Lw6y6GS+g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab292677-a90e-4a58-4a32-08de5a59009d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:25:44.5233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JicPxGKXoOms8uDQ2sCC/8hPyxtyYTDpuhR9Utb9MN3TFEy03raxxJXni8R8iECg3a3fxLuwus3cPgfSLjzuVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9730
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16220-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,pengutronix.de,lists.linux.dev,lists.infradead.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.788];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 4E25872723
X-Rspamd-Action: no action

Add compatible string to support AUDMIX on i.MX952

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_audmix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 7981d598ba13..40a3b7432174 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -444,6 +444,9 @@ static const struct of_device_id fsl_audmix_ids[] = {
 	{
 		.compatible = "fsl,imx8qm-audmix",
 	},
+	{
+		.compatible = "fsl,imx952-audmix",
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_audmix_ids);
-- 
2.34.1


