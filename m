Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CEB85697E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 17:25:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=A/lSDHFZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=OyrJlZgs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbL5Y5XHpz3vbm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 03:25:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=A/lSDHFZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=OyrJlZgs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0c::701; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0701.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbL3x0dnSz3brc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 03:24:11 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZEsR0AQ2/m4rodyOo/qMais56d7q469Dghg8SNbyNj9yUbsDkPIVW5D688pXC4yd9ZIfTIbQeATnZXg1Jd6jd9mj3H7vzAHYJPXKS1eCKh9CzCaHud+qM8MsXbSGtkx5G9ge8xT5cBnhf/iF/2li4/IljhKVEc2OR2p0SH21aPPD8nWCvxXapgOVrTOUerKv+rPYHaqK7nG/CdaXlKLyqZd1kMQhkrYXQdWbXBkv3OPGmm06TKcW8BzOc7lWhr6yvAZ4kobyk5aiRDYZmiIObhYs4uv/QNn90Z5h0fOxW5uZRRdslIbnnJXg6a4zfpZdyQOE/wyDYfvU/n2N6hUj7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=496/upkUn2GgvHeFGCm5RARjOGu0oZ8t9EtrzqYBlH4=;
 b=n/7YkcgGkwFFQD6p6EiqLY4x0riGfVbOz0GYzI+dOgF6oqGyQnhilH8ERdg8Z7ZGgcjetT4hiq4IMCQIgm+dQQlYlvGh2GpoQxF51svQPFfWm8mXYyJFD/IrkzwLAUJLIgjjUP1PnPks9wbKIojMwyD+XF7lSBrNWWgfcaO+LBal8e4++U9nqYPH7F45fKVQ39/fC7wA2vic7COKabqfD2XTggCBeIhUvvzP1geB24dESUUBOmnmxEoSYl8PZYdQ86clzBUc8mnI2+LSxofPHU3rQL5+U9jrmVcwKcb7kpn3Ke0JaV11hHIvAv1hkoPDIxai0H1zg+DdhepPu0++KQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.83) smtp.rcpttodomain=buserror.net smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=496/upkUn2GgvHeFGCm5RARjOGu0oZ8t9EtrzqYBlH4=;
 b=A/lSDHFZo1hYpz62RvnM2XCqILKsow5b5XNP843hOQdt/CMh3Wr4CZF5nRn/fOMnfRIRpS2Sjy/VjfgzgmfI0ve+p5j/y4CJNlhmPypPRKh/rxoyJ9Z0vqcLnYIBI7B16vEia8lqPZfftdmnmvhZA9CdJS8pAHShiNpmI86S22iIJ9icaGuly6tCL1TiZ3ol4k1o1m+8nvBOtuqcHF+/ceoKn7YF/mPmM1s8soHAUo4PWjNBfjFTk1IGASrs4FtcYTgXCMrzcfurqZjbh1qFUFn6spAr1S3AW2OEKAs38RdFR4tJrzemiwocoJqtSV3I4sjx2rjMjjo5HvFosbuUBg==
Received: from AM6PR04CA0063.eurprd04.prod.outlook.com (2603:10a6:20b:f0::40)
 by DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Thu, 15 Feb
 2024 16:23:47 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:f0:cafe::9f) by AM6PR04CA0063.outlook.office365.com
 (2603:10a6:20b:f0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Thu, 15 Feb 2024 16:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.83) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Thu, 15 Feb 2024 16:23:46 +0000
Received: from outmta (unknown [192.168.82.133])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 5E95B2009538A;
	Thu, 15 Feb 2024 16:23:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [104.47.13.51])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 9BEEE2008006E;
	Thu, 15 Feb 2024 16:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeIUsF15v8OIVXrqvL50IxapdvrSzK1o99f3GPzPVjikKKETEKjAJ0in0q9DM1xKL/jHSEX3X0fJfp3HMVxRgPVKojwdpqgyRjJcjDMqmFxkOuEIGLbDz6CPDMEMcUt5BckmxeDHj0WTqhhIVoeTlSb0UjcyGNXBY+HfuITtcHEQJN7OgZYdE7ljrNChWmM9Rb1AdDZSSg3p+S/OpKiPVpXz+TgREkXvaQcDzB0kooZnWjQ/j4WEssWx61yUn4quMsBafo7fIv1P1BhRK5XwqBzHh7DYB7C49HFnHiSXcHoB5zd2Z4sHMwHqr4Ek4jbl8MKN95N6JkbmA7jf5A/HLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Pl0muCwfJCJNxbXBOEYL0CLXTDvyuWunEPeFHQtMOE=;
 b=UIDe5UlrFuL8M6CnLHlW2O+clJYBl/x0WBJJX+yZPynkpEuHfrT8fCQddUM32EGGDLG3JWd4dueKI9sOZSZmVRUxDtyHgGQcEktiEjHT9YKMZk0Eno0fH1B9/RNOG0xzVUwVqWS9bEzrOsG0b/EnPxPm5cFRiQxENWYFazOvvcEzpR8VAyfimcsNvqd81qcCBWVqXr0xSYlDKdfFPo9EuqsEa68aUi4KymgIm7A4nee2pMtkeAjU4ssEJo2QiglUN9sQwiyD+VHXyL70TvAF0aOq5b2uL5lHZY/F7YYlsriIyAPpAnHSN7iLfgynnBfe2328mwrp00CIrXTEEGdAzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Pl0muCwfJCJNxbXBOEYL0CLXTDvyuWunEPeFHQtMOE=;
 b=OyrJlZgsnXzmzbht/3AdUezUgod8wNecUZVyXHwkpAYMT97hv24UnX/CPB29/cj5pniT+GiuA+RnKonwNdMn+q9Hk8eRIqYw/EfCOCyS5obiEWaK7YLeb/QgHUeEKmdn061LPiXNqU71HImyFXu3RcBk2sPGgdC7AczmM3y1WLi5GJaOFcGB4zqizxQV/WlFToCe9ZXwvVk8TcX0HidJCJf380M0s+ZifnTk4LVFfow70z6V4G8WcDF+St8H9CpFRF6LsAiz3MkBosg0nI2OcR9ny7x2GAzStupMe3ol53WfwT9U/fvCAgmb5HCNlbYW68t+gDB0yJO/9Z8eNq81Hg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DBBPR03MB7449.eurprd03.prod.outlook.com (2603:10a6:10:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 16:23:42 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::18b0:3c00:30cb:711c]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::18b0:3c00:30cb:711c%6]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 16:23:42 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: [RESEND PATCH net v4 1/2] soc: fsl: qbman: Always disable interrupts when taking cgr_lock
Date: Thu, 15 Feb 2024 11:23:26 -0500
Message-Id: <20240215162327.3663092-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:a03:338::24) To AS8PR03MB8832.eurprd03.prod.outlook.com
 (2603:10a6:20b:56e::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DBBPR03MB7449:EE_|AMS0EPF000001B5:EE_|DBBPR03MB10396:EE_
X-MS-Office365-Filtering-Correlation-Id: fbbf3797-9fc6-4eed-75bb-08dc2e427c2e
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  tnG668E4SNB6rQHMmgtoJPCVCeSyBHh2CxicGa3M0cClWbC/JjGno8Hs1mICWvjgfSNRXsyJ9CKDhAmIlCJCPagvcxIcEhzLYVXcIY9vNEgSi3Vy4Uw5+B7nJ7P++SSa/hHK81gFbhpqqewf6KvoRewL5A68ELWrsQELbVbPmnNNX72ynk1GvOhk3P0H66sipXXCII4HfzodKoiyTNE6iu6pz/nU/9ukh+w6aPKBRttwqoj7MZaZRHYpN31/fPLN4Yq5TmHXP8aTbaT7hl8Fz8p3ygmel6xLg0U5sDar71YfTZw0C7zGZG/bZoHU4wVokY05MbJTi/5C9N/6wWK4YA1hBpamILcTQqOTeX4OxrUTyl1S3vvoQ4xVzuID5ttlxfq3LZDSy1VSqJYLM8NAmNGn68KL3YVl9NBCN2T37Fw8uGKLpntO+L4VFxilFFA6J3ELq3vwNEA3/0VmI0+H4JdHwmtX7+k6khKMIp8ZPmatwD0agiDD3GKPKOr7I0UuauY6nrd7DRVLEhUNsCSplLcyaxBGhyWXHOZBFQYn6eEp221OihYwpipkUFDptXStLbA4ErG6w9vUMgqNllxisInlEQEpWyz//ZggQMrD0/E=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(39850400004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2616005)(41300700001)(1076003)(26005)(2906002)(8676002)(4326008)(7416002)(44832011)(66556008)(66946007)(5660300002)(66476007)(110136005)(478600001)(966005)(6486002)(38350700005)(316002)(6506007)(6512007)(6666004)(52116002)(54906003)(8936002)(86362001)(36756003)(83380400001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7449
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	95f58879-c10c-452b-2a23-08dc2e427952
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+aISMcb8xGMjYRankcQoFNJ2NU4i2U30dk3+UlbqJ5bd+fySVWNeBzgdp1RoL5C8SK+cUoqK4BabQdcCVf1ZOH4pcI2mdfL8Ub+T5wcTCNjyhK9CTpGiokWM25oxvFeHx9GNYzzr5rWARv/HYesRT1klegPc8ndJTNfAv0vyl0w+FOUtF/FIboZT/oVZ1yReyV+QK7+6zU0JC7wRyUo6RgCuM8NOHgVoyfObTCt3/yo2vNwhUcQFQh2EBkLEgZRoiyQby5Ty2rkDgKjcf4zbD1p8k+d4qrU8C0iAoCiTlzOMYj0MeKyi4M4hfFlxYUh8nSsLOCXtD/uiduwgO2odLGPglCrG15GoBAIShISgyLFXkVXSmv4q08ebnLakSucU+BIkohyM1G3WBRGlxLnSh83Vt9WNdfvE7jWR+3+6ybhpwbV91a0hKCXOau8Faf0nDVZuc+SNBFjB7CT1MoaxDlUnbtGMoMG4LqrzamCojreYvAYhIiiP9iANS4pWZjCMRkkZgTyqDPK1ve/DV7xH0ULD+etD10lWF4YpO1k/WhI9/4vDDN2XexzXEHazvRFLDwOofraUTZFp3FIuoAolGiChVQZJB83KERbU7ArPgPJfrziyTHzERW1jfojDJFg6CJ6oUprg/AeThKl1FNbJmQ==
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39850400004)(230922051799003)(82310400011)(186009)(451199024)(36860700004)(64100799003)(1800799012)(40470700004)(46966006)(1076003)(26005)(356005)(7636003)(7596003)(336012)(83380400001)(82740400003)(2616005)(41300700001)(4326008)(7416002)(8676002)(5660300002)(8936002)(70586007)(70206006)(2906002)(478600001)(44832011)(966005)(6512007)(6486002)(6506007)(316002)(110136005)(6666004)(54906003)(36756003)(86362001);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 16:23:46.5437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbf3797-9fc6-4eed-75bb-08dc2e427c2e
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10396
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
Cc: Sean Anderson <sean.anderson@seco.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

smp_call_function_single disables IRQs when executing the callback. To
prevent deadlocks, we must disable IRQs when taking cgr_lock elsewhere.
This is already done by qman_update_cgr and qman_delete_cgr; fix the
other lockers.

Fixes: 96f413f47677 ("soc/fsl/qbman: fix issue in qman_delete_cgr_safe()")
CC: stable@vger.kernel.org
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
I got no response the first time I sent this, so I am resending to net.
This issue was introduced in a series which went through net, so I hope
it makes sense to take it via net.

[1] https://lore.kernel.org/linux-arm-kernel/20240108161904.2865093-1-sean.=
anderson@seco.com/

(no changes since v3)

Changes in v3:
- Change blamed commit to something more appropriate

Changes in v2:
- Fix one additional call to spin_unlock

 drivers/soc/fsl/qbman/qman.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 739e4eee6b75..1bf1f1ea67f0 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1456,11 +1456,11 @@ static void qm_congestion_task(struct work_struct *=
work)
        union qm_mc_result *mcr;
        struct qman_cgr *cgr;

-       spin_lock(&p->cgr_lock);
+       spin_lock_irq(&p->cgr_lock);
        qm_mc_start(&p->p);
        qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
        if (!qm_mc_result_timeout(&p->p, &mcr)) {
-               spin_unlock(&p->cgr_lock);
+               spin_unlock_irq(&p->cgr_lock);
                dev_crit(p->config->dev, "QUERYCONGESTION timeout\n");
                qman_p_irqsource_add(p, QM_PIRQ_CSCI);
                return;
@@ -1476,7 +1476,7 @@ static void qm_congestion_task(struct work_struct *wo=
rk)
        list_for_each_entry(cgr, &p->cgr_cbs, node)
                if (cgr->cb && qman_cgrs_get(&c, cgr->cgrid))
                        cgr->cb(p, cgr, qman_cgrs_get(&rr, cgr->cgrid));
-       spin_unlock(&p->cgr_lock);
+       spin_unlock_irq(&p->cgr_lock);
        qman_p_irqsource_add(p, QM_PIRQ_CSCI);
 }

@@ -2440,7 +2440,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
        preempt_enable();

        cgr->chan =3D p->config->channel;
-       spin_lock(&p->cgr_lock);
+       spin_lock_irq(&p->cgr_lock);

        if (opts) {
                struct qm_mcc_initcgr local_opts =3D *opts;
@@ -2477,7 +2477,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
            qman_cgrs_get(&p->cgrs[1], cgr->cgrid))
                cgr->cb(p, cgr, 1);
 out:
-       spin_unlock(&p->cgr_lock);
+       spin_unlock_irq(&p->cgr_lock);
        put_affine_portal();
        return ret;
 }
--
2.35.1.1320.gc452695387.dirty


[Embedded World 2024, SECO SpA]<https://www.messe-ticket.de/Nuernberg/embed=
dedworld2024/Register/ew24517689>
