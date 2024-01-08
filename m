Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A58274F4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jan 2024 17:21:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=PhFn8G0f;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=PhFn8G0f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T7zpN664Cz3bqh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 03:21:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=PhFn8G0f;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=PhFn8G0f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f403:2612::601; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T7zmY5Ygmz3020
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 03:19:57 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=InP1XfeXX/PqWVxh4vC364aDQhAtWSUyVUg1h7bW75uG+yKkVlI6MbgcRH4zI+Mbwu0ghCPv9eMIDoaZ5a6dzQ7pH6YZcWlLNP5tK6Gcs16YLU8lvdsXP+FqIuUTbt8weD9lsyQQR4ZZBquOreOZkSt1YJbUnlJ+WG2BGtjLV5/qoZAAHCZtPuJMedpJiv43ROMnh6wtcwV61lhBwJWBf6EwnzbygdYDnFqyBuVTg5yZFlCDuk5AIlHA1k5Og6b6gOASjAnFqbq8tYOjUMGDa9oI8WO7OiEEiRr5BvIdWOCAtiljKG5VyPMJI26VcEFqdsF+Xbsfenj0qVKZXDnHkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnrvgF5J9pAlxkMmdOmVrj7HVJWTM1JEmjzZiXVfaCs=;
 b=cgBoQwO+eWV5Jc4Ycp2V4scLzX2K0ge6CYjd4JsRhXCLkFYGI7in0kRcgl9yBAOdYe9XYMcxW2rlmRRucel+TDNhouHC0oZ54TEBJHJc6/O3z0bfdhWggYAKRj4OaCHngSPuEavWPfo6xbwlqYt+0ICxup+E+aDEypMbDnF0F8KxxCBzV9eD+qUaVgztSxso6lyufXg+NF77HNYclosM2cN722RozRY02Zbqz3opqvAiBI+P+PCoEhAQtCZ+n+Bf2GXNTpySqo6Kp/lXvelyNHnC3mP9g+WxHmwNnfzHO0mlmIGjjXB6beHcvhWkEOavZM5Qm1A46K6Q3Nqb8s72vw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.82) smtp.rcpttodomain=buserror.net smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnrvgF5J9pAlxkMmdOmVrj7HVJWTM1JEmjzZiXVfaCs=;
 b=PhFn8G0fIhZsRK93i69Fy4cVSslHMpN076tYlrud9WF8LE1aYa8rlnSm6HCm0iDr+QJLUiC3dDuOBrLg3nXbnYVyFlRkMYCpc6k+IpWr0AZeuvK9B1JWlUYsjJO3jtsRC6H6r44yN2V4Y51xirIL85kRRPAxtFWdKNIk2YRBb2an9qNmaRZKDp8ovLqVEibHoZQfVJtiuKWZhhoLfwNIM5CgAkdD7PM+H60/LcdVdI3nDmoBdGw7wna/Ps1PUjZNuzIajaaO/aKpGU0FI4f0E6pHpuLYfrtdDJqCYUHB2q9qMWy5NkUoBGF7NX1Tg44I14hFO+OXZ4plVXNlFfRynA==
Received: from DU7PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::29) by DU0PR03MB9708.eurprd03.prod.outlook.com
 (2603:10a6:10:44c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 16:19:38 +0000
Received: from DB8EUR05FT028.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:50f:cafe::c5) by DU7PR01CA0008.outlook.office365.com
 (2603:10a6:10:50f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21 via Frontend
 Transport; Mon, 8 Jan 2024 16:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.82)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.82 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.82; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.82) by
 DB8EUR05FT028.mail.protection.outlook.com (10.233.238.130) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.29 via Frontend Transport; Mon, 8 Jan 2024 16:19:37 +0000
Received: from outmta (unknown [192.168.82.135])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 497112008009D;
	Mon,  8 Jan 2024 16:19:37 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown [104.47.0.50])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 864522008006E;
	Mon,  8 Jan 2024 16:19:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dInTO86FAcXzNyAe4uynZ+ER+9sZS+H/5a3TcHV6/uyTex6vy8HXhZETnZ+PPD/jGIV2hKI0bzkqYOlQgD6A4HodhwCRRqdFznFnqeHC79bFOFuW+NYXTjYANZZeejIe/zd/eTca/678iBlaCmpMmXeetGFOUIbIuGwCiJBeOxfKtMZhpxpwpi4CdzhbYw6Q16IwC/n+xJi97/RrssPjMZOtH63INVPus/bom3dL7i2exEXG2fhXxg5BJwt8UoW95u6+B645c4xI/Qmru4ZOQ7UQAs46Nwumyr1QqekICrGBiNPdRlpYDtFUzvvRYnxfYmod30lxi/40VCCZmC8UPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnrvgF5J9pAlxkMmdOmVrj7HVJWTM1JEmjzZiXVfaCs=;
 b=YgwChIDukoVbuhtCDbvgW0h7CuI9hY9NF0j7STUFTuz0qVntUplq3Lv88isR3RsVc+3748UIcUfDg/SGco4F5WNnhW9yc26I1Yn5H7LRAZ/rXs/nLkbukAlwYUIIHIkDqOQwq0UZrDNr89RUUyDax8RUho7hZypfcFuSkQ0129PsWONuhlCo0IKCsWEw9FIMKHKBPmVrtXCUJM0y8QbpdnY+DlGqS087Lny2WDIVlVPKFXWgwS6qDntSZIGOSN096+YprAqwWnL0v2NKSx4b2qQimb1G/JxQte/d/iS07zn2kbKemA0jiZFSBa0Egk9IoBNTh9rL/nUeVDBCy0mnvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnrvgF5J9pAlxkMmdOmVrj7HVJWTM1JEmjzZiXVfaCs=;
 b=PhFn8G0fIhZsRK93i69Fy4cVSslHMpN076tYlrud9WF8LE1aYa8rlnSm6HCm0iDr+QJLUiC3dDuOBrLg3nXbnYVyFlRkMYCpc6k+IpWr0AZeuvK9B1JWlUYsjJO3jtsRC6H6r44yN2V4Y51xirIL85kRRPAxtFWdKNIk2YRBb2an9qNmaRZKDp8ovLqVEibHoZQfVJtiuKWZhhoLfwNIM5CgAkdD7PM+H60/LcdVdI3nDmoBdGw7wna/Ps1PUjZNuzIajaaO/aKpGU0FI4f0E6pHpuLYfrtdDJqCYUHB2q9qMWy5NkUoBGF7NX1Tg44I14hFO+OXZ4plVXNlFfRynA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9858.eurprd03.prod.outlook.com (2603:10a6:102:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 16:19:27 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::5cfa:9e05:d8dc:ba0f]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::5cfa:9e05:d8dc:ba0f%7]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 16:19:27 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
Date: Mon,  8 Jan 2024 11:19:04 -0500
Message-Id: <20240108161904.2865093-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20240108161904.2865093-1-sean.anderson@seco.com>
References: <20240108161904.2865093-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::27) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|PAWPR03MB9858:EE_|DB8EUR05FT028:EE_|DU0PR03MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7e8839-e641-454d-160f-08dc10659c0f
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  7RevYU7OWBDopUQDUYLsl9s/Ac2VZcfTVTIbufS1NYcx9rjBuvwo8Q3fTePwsfH82MbldfVhcj0KHjwINyE0U0nQwrHeexOPIGMZIqxvh/h3IU1GD4tuZek+C/AWZSRKxJNtQpCyban6LkevO/Cg+yl4z7U9r/g2TRQLMEhhEsDbODbuB1QKOfA10bhoo4lCZ2zhdiX4QBSrwFGtd0Jg2G7/23eaUTbiwVM2r4dmXF8QLFZAYxf1xgBTxXxW2ol/VSkR0LrNPISt7ddfiTPC80vqDE5ohAtK2CNqyac8gs72ity0byEzgzkieALW4Xfx1Y2P4Lj7tSiSKsDKskHFDq5tH1JNLXH5rBcGMihNbIXxRHXuNjzuVr6zxKuAlOyaX9jb/4EnwtXvJtVoq1N+ONh6t59Q+br9ZfSBpNgLdGJfXCOuFyO+ACgZpwxam0+/bR/lh8ySC6C41FN8ALy5GP4jLgEVI9AskEUkRTm2Jpq0ItduuG1qkcf1wlm93RNR37Vb9Y0mLSmyA6M0sSiBwZIkmeBR5YFoQ2kKXzjs5ykq2y/dVAXMd4XxeEHmPFrWc+iwiNEZ6fCr/5ax88N1y799UEnUQNoN1BojkGtu4cc=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(366004)(346002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6666004)(2616005)(26005)(1076003)(966005)(52116002)(478600001)(6486002)(6506007)(6512007)(83380400001)(66476007)(107886003)(5660300002)(2906002)(41300700001)(7416002)(316002)(66556008)(54906003)(8676002)(4326008)(44832011)(8936002)(66946007)(38350700005)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9858
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT028.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	46a89d09-a91e-4918-3b5e-08dc10659618
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3g9yNprucK2DBC4h77ZBbAkUnspz6VBeXUxHSVTFcMQbWCnDctigcl96qZyOsBIAx5l3iRpZ03fJ3UqJcbvVc0LZcKjEJlRbY72qGP76ozGCNQFXltw1RfoNwsT9rU/vKjXhkdWPJMnd/5i3HpJXk4LJhC1Yo9goNyhDeM3dlccW1tKGQTbmHpPhttMCwa3RUbU7T0X7w9xhIYcIXYHQdJ+6DwACIH5JCPo2Rhe89yaARHpQ49b/DY5ZWviIayN4BZqo4wH0yVQqvVdtORkTRmIb4+joad+AYNI1cIFUn/e7eLrFRHktR8hysvg0JXbMq+0eOZRzSifmacSdDgTKg2dYhPnocZ8TbmGbOSXAziWgyz/3Nfvu1sKKO8tRyvAsOabE3yM/hctQ6baUMRHTlEQ4JE6J1701DMNwslBd0/WmrQRmuD3rY5pYzscTA3AE+7fJ9J2/xuh1a4nuEXZ2xJ1XZ7S0tcGVLpacoXGs7yERNUjn/N7DDY4g6crBNMV+smXFqoIb3bzwgZjNb9YY7A1031cwuZcd5lHwB/+V6nweeezxVt1+SC4+aakuVKkTbEjb7X4H6vr804Z/ZKOUV3cQfW7HiKKDnUVweGFKhdfVdmdGoQjr9rfQQhXq0WcR6zT/ZAh5VVZhvuDVmcg5jJEyipNNi5nW8jsdGo/7VG+WFD2sXu0zdEsoacyrqwr2TFSaAWClL3rcPMXj/Fdcjm0Z7kM7DImnA/XZsf6pnXDhIa2OKvXYHejBYsYUgT1KdOJ/fnMU7Tg4ELkskaPSRw==
X-Forefront-Antispam-Report: 	CIP:20.160.56.82;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39850400004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(82310400011)(40470700004)(36840700001)(46966006)(7636003)(356005)(82740400003)(7596003)(36756003)(8676002)(8936002)(83380400001)(54906003)(336012)(316002)(5660300002)(4326008)(6506007)(478600001)(44832011)(966005)(6512007)(6666004)(26005)(1076003)(70586007)(70206006)(107886003)(6486002)(2616005)(34070700002)(41300700001)(7416002)(47076005)(2906002)(36860700001)(40460700003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 16:19:37.4962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7e8839-e641-454d-160f-08dc10659c0f
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.82];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT028.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9708
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Sean Anderson <sean.anderson@seco.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cgr_lock may be locked with interrupts already disabled by
smp_call_function_single. As such, we must use a raw spinlock to avoid
problems on PREEMPT_RT kernels. Although this bug has existed for a
while, it was not apparent until commit ef2a8d5478b9 ("net: dpaa: Adjust
queue depth on rate change") which invokes smp_call_function_single via
qman_update_cgr_safe every time a link goes up or down.

Fixes: 96f413f47677 ("soc/fsl/qbman: fix issue in qman_delete_cgr_safe()")
Reported-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Closes: https://lore.kernel.org/all/20230323153935.nofnjucqjqnz34ej@skbuf/
Reported-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Closes: https://lore.kernel.org/linux-arm-kernel/87wmsyvclu.fsf@pengutronix.de/
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Please backport these fixes when applied. This bug has been reported
multiple times (see links above).

Changes in v4:
- Add a note about how raw spinlocks aren't quite right

Changes in v3:
- Change blamed commit to something more appropriate

 drivers/soc/fsl/qbman/qman.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 1bf1f1ea67f0..7e9074519ad2 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -991,7 +991,7 @@ struct qman_portal {
 	/* linked-list of CSCN handlers. */
 	struct list_head cgr_cbs;
 	/* list lock */
-	spinlock_t cgr_lock;
+	raw_spinlock_t cgr_lock;
 	struct work_struct congestion_work;
 	struct work_struct mr_work;
 	char irqname[MAX_IRQNAME];
@@ -1281,7 +1281,7 @@ static int qman_create_portal(struct qman_portal *portal,
 		/* if the given mask is NULL, assume all CGRs can be seen */
 		qman_cgrs_fill(&portal->cgrs[0]);
 	INIT_LIST_HEAD(&portal->cgr_cbs);
-	spin_lock_init(&portal->cgr_lock);
+	raw_spin_lock_init(&portal->cgr_lock);
 	INIT_WORK(&portal->congestion_work, qm_congestion_task);
 	INIT_WORK(&portal->mr_work, qm_mr_process_task);
 	portal->bits = 0;
@@ -1456,11 +1456,14 @@ static void qm_congestion_task(struct work_struct *work)
 	union qm_mc_result *mcr;
 	struct qman_cgr *cgr;
 
-	spin_lock_irq(&p->cgr_lock);
+	/*
+	 * FIXME: QM_MCR_TIMEOUT is 10ms, which is too long for a raw spinlock!
+	 */
+	raw_spin_lock_irq(&p->cgr_lock);
 	qm_mc_start(&p->p);
 	qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
 	if (!qm_mc_result_timeout(&p->p, &mcr)) {
-		spin_unlock_irq(&p->cgr_lock);
+		raw_spin_unlock_irq(&p->cgr_lock);
 		dev_crit(p->config->dev, "QUERYCONGESTION timeout\n");
 		qman_p_irqsource_add(p, QM_PIRQ_CSCI);
 		return;
@@ -1476,7 +1479,7 @@ static void qm_congestion_task(struct work_struct *work)
 	list_for_each_entry(cgr, &p->cgr_cbs, node)
 		if (cgr->cb && qman_cgrs_get(&c, cgr->cgrid))
 			cgr->cb(p, cgr, qman_cgrs_get(&rr, cgr->cgrid));
-	spin_unlock_irq(&p->cgr_lock);
+	raw_spin_unlock_irq(&p->cgr_lock);
 	qman_p_irqsource_add(p, QM_PIRQ_CSCI);
 }
 
@@ -2440,7 +2443,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
 	preempt_enable();
 
 	cgr->chan = p->config->channel;
-	spin_lock_irq(&p->cgr_lock);
+	raw_spin_lock_irq(&p->cgr_lock);
 
 	if (opts) {
 		struct qm_mcc_initcgr local_opts = *opts;
@@ -2477,7 +2480,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
 	    qman_cgrs_get(&p->cgrs[1], cgr->cgrid))
 		cgr->cb(p, cgr, 1);
 out:
-	spin_unlock_irq(&p->cgr_lock);
+	raw_spin_unlock_irq(&p->cgr_lock);
 	put_affine_portal();
 	return ret;
 }
@@ -2512,7 +2515,7 @@ int qman_delete_cgr(struct qman_cgr *cgr)
 		return -EINVAL;
 
 	memset(&local_opts, 0, sizeof(struct qm_mcc_initcgr));
-	spin_lock_irqsave(&p->cgr_lock, irqflags);
+	raw_spin_lock_irqsave(&p->cgr_lock, irqflags);
 	list_del(&cgr->node);
 	/*
 	 * If there are no other CGR objects for this CGRID in the list,
@@ -2537,7 +2540,7 @@ int qman_delete_cgr(struct qman_cgr *cgr)
 		/* add back to the list */
 		list_add(&cgr->node, &p->cgr_cbs);
 release_lock:
-	spin_unlock_irqrestore(&p->cgr_lock, irqflags);
+	raw_spin_unlock_irqrestore(&p->cgr_lock, irqflags);
 	put_affine_portal();
 	return ret;
 }
@@ -2577,9 +2580,9 @@ static int qman_update_cgr(struct qman_cgr *cgr, struct qm_mcc_initcgr *opts)
 	if (!p)
 		return -EINVAL;
 
-	spin_lock_irqsave(&p->cgr_lock, irqflags);
+	raw_spin_lock_irqsave(&p->cgr_lock, irqflags);
 	ret = qm_modify_cgr(cgr, 0, opts);
-	spin_unlock_irqrestore(&p->cgr_lock, irqflags);
+	raw_spin_unlock_irqrestore(&p->cgr_lock, irqflags);
 	put_affine_portal();
 	return ret;
 }
-- 
2.35.1.1320.gc452695387.dirty

