Return-Path: <linuxppc-dev+bounces-10305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 344AAB093EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 20:28:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjhJj6GLLz3bqh;
	Fri, 18 Jul 2025 04:28:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752776933;
	cv=pass; b=ejm3DbI4OAf4Z3cKPR4UuOr4faG+a7XP1zu50+haIU58ZfZRNY+c94Cf5Yw92z9sV+UcMQ0QX/dAEVEsess1esW4aZs+qjnWN8tN00+l0VQhzE2v4kSrR+Dgg9Ks8oKMZJ9qDRxadSyuV5NJe2BvsYDewaoBgTpT50/hONvwK6qaXBs4r1XLEZVo1wxqoU4ZNKgDlFANS0AGrAkBe0uenmHU7R4pXXTdHf+TBUIuA2lYzeizd5nDMnp4cedI1J5zt+n9tLyr5uWruuCj75BU+jBPI5qm+wA+/Qal6IVYjViw1RaP3+l588vLzcb26J29x29ixoLL3hXjT0zrXDC0Lw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752776933; c=relaxed/relaxed;
	bh=8IsYZFG0WlidrTox110DB7Wm9/V79h6qoEvx1tUmWg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J+9j82ryB1x0pIm25gQag7236jHOTlxm0TZoCW4zYOK06cXqFEx0b1Tpe/XWhQoRYclnBlk4irLhw2kcvHwt7XKE2VTTNipL6R73tLd2Aa+jBZ/7/cO/b6LANSHQzMZ0jSfxdC06IRxYea6qMqKixlfxQmqAPtmx0IUUzndatg9/xcKfjoamcd8co2Y2QeB7/Amr6uZ37E9mi3r5dBPJV4wpqKvraSHD0i/8E385VnK5IxzxpXALdtj8m4aUkPjRKUW3zAM6/BNzvjyMKrcSUZqTZu88zqPMzc9veUlzjGHVADOWl0ZIwwd5QUKVVwDufaTxxMNu4Ic2QfmotxrGMQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ARyhEm/m; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ARyhEm/m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjhJg6gllz3bpx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 04:28:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEm6J9ZOmxy6PBCEhi2UBF7S1tSsR6jdOEprGJoxZseodQyzC2MoPzHdnecA1Vb2PjNfa9sP4X1e+d6KVKF8pyrPwZSNjF8OEOIY8Rs56fZuE+AuwPGGP//A5LT16vj6kx36T5A8vSUuVKF2uLZj/04Wq7MM1wMO9sCrnKQaFNagDarVDrnUbVLWJIOKWGFHBrk4/oOpzIAPE1zwW0MpzqxP+i9Br7qA+zaHOhnkK4SZsHAD7lGV+FacNfXRgtT9nuGSXEMwnQQaO44BZ/agz0GkPljvcdEzDEE0b3GEoXGgkdj2bgzoqz6jWDaNoy2hO70e+hHpIxuNlkstXwQytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IsYZFG0WlidrTox110DB7Wm9/V79h6qoEvx1tUmWg0=;
 b=KoAeeKizPFG/7YNQLFpT1/rWHpk8qidP2/4opOBXprHh2m/PbuOSb4QThX9MOSqvwA+p9H4uFNAJPWTubVCVW1obJPzyvxkDAR0UQBrFGn9aLobSt2sLqu4CnOktodxh/EhgIeIMRBCCXG4hHWiWjPxArp7wGaJcflzAfHOwd6jnaiVn1eJ3vy4fC5/R3jfmi3ER6BFzx0jyFyEmlyCxSqB3A5BPjV58c3PwEhpatZi7wfq7RMEF3AWlgBqcLpVvfqhK9M4xEsRHO3qrzP2t+3cMbrqP78mhAh4juxKueCIdg5grPhGKv6531jdXn71aGc28FKFGn7jE6IbnEjaaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IsYZFG0WlidrTox110DB7Wm9/V79h6qoEvx1tUmWg0=;
 b=ARyhEm/mjBMI4w7p+FimvSBX28JGee4bbKmcfyg0yS4CCEUW4GP0it0POTc5bn2Te4ohdieCBzJzwtStujtrrYYmoBPZDm6PBc5vKZb0Zk8pjXVqS5JBHPSMkElwVTd4BEn6SEw9Uv851vbMMliYoPMlRMDtHHijA69gPnkC3YbrHJzm08c3sohxtj5cZk6yFnXkpq+F/qKEiVKvKJQQ3b3d323+S/rp3OjWGbdDOndakJbeTKbHdtcRujkAE2mKxzYy/eZ0jj3OmX/vXmSBbZSUEvjrpNREC3HZkPuGWd3qQiD9fwkPZiaJVuRkpYKhUDDzgUG0obwxyXorCYhb9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Thu, 17 Jul
 2025 18:28:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 18:28:25 +0000
Date: Thu, 17 Jul 2025 14:28:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 1/4] PCI/ERR: Add support for resetting the Root Ports
 in a platform specific wayy
Message-ID: <aHlAw2rS8RcrqrE1@lizhi-Precision-Tower-5810>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <20250715-pci-port-reset-v6-1-6f9cce94e7bb@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-pci-port-reset-v6-1-6f9cce94e7bb@oss.qualcomm.com>
X-ClientProxiedBy: AM9P192CA0015.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: de5400ce-3197-4aab-1fba-08ddc55fb7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|19092799006|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hECVfva2uXphLUzvMS7i6CeWDe/VM3/kCubyxeVk0b/zkIvGGxZNvxqVJZ0C?=
 =?us-ascii?Q?HyHtk8w7XCk2kTiY4hND/SAxZX8WS7NRQnWvQghzxKw1CBcOOu7BA/zoP/gX?=
 =?us-ascii?Q?xI/Hvm+wE3Cxc1em1O8KTMRLQPTf00+Kf1DPa9TWdPrn9PZHqXZqubxkhm6Y?=
 =?us-ascii?Q?8z4bB6KnjI448Fmhb220CSROPDv38aX7ppLYnl35lSfuT3q9n5KN/tWQ/mnl?=
 =?us-ascii?Q?RPMFRM6JaRmrcTq5bQkfpZpuj4dX+eAlTB1rKq1EMcdIAISbulQBhcGQjsdB?=
 =?us-ascii?Q?MGDy7g+UqudaUNQGIh8xsIKCIu2Wm6diuVdEo++7F4xX3k1kwXwq/ThAXKoq?=
 =?us-ascii?Q?5cMtS+SMCOa3e+qwy+oWCjeRWc+zs4mJfgf5ARXsP854BlkOMK4ZJX5U70tL?=
 =?us-ascii?Q?O9DFar5PCLP5Q1FSSgybAfT9LYZL7M73XNUxWzAa2LFW4IkYQdYqg4L/+PqI?=
 =?us-ascii?Q?EQNB/UTbtjzvZXefD3QpVWZdBC2UAwNkSQzo5G0PCztKPvOfLHrWevrwe8BY?=
 =?us-ascii?Q?asL2vnCp/61xiaMnzfIDTKdva+Zb2NY6YghhK5XvuW9pNkOf5uVpyrBWNxBL?=
 =?us-ascii?Q?HhTz8FhXyw2uBJcjscNcYijlc6RZjdiio2X19tSQIPE2sUPc/8JWfBwg7P7r?=
 =?us-ascii?Q?QHrlnMK+1ayvPmG5nzz2lp9GGUr6fDgmrF+Z7R/wzTEpyrjDkjKV96WW3s49?=
 =?us-ascii?Q?vl/HZGMRQImvP2lZLgGlmHDoipGDIjsMk8lF94VilIcJraJ36zMZqxi04+Cd?=
 =?us-ascii?Q?QU5vEdXFtK/L14JEEEw74of3JhuOyCo3I4r04v+F5KJkCQYRsQ11NjbHXS/E?=
 =?us-ascii?Q?lbwFAvrfDClvu/Va85IUzD2ba8ET7LuocrMIr7sWoK4PeDzhJP5LB3lQgBPM?=
 =?us-ascii?Q?PJJ5P+8k6QiCfcnbtrwrrr5r6EN1Of5br+WPL4JBSX05HHMOruSHZpOfDtQ9?=
 =?us-ascii?Q?LK5bSaGQHrF+LmocXDaKuYZL3wpnG/KEhGvQMnjr9UJk7Lsyud6Hi9sBpz5E?=
 =?us-ascii?Q?A1m9emqHkFQBjZ98jnrfa8n3Jg4PzIFluwlf6tM/wt4EMPm/kZ8aaV+wvZDK?=
 =?us-ascii?Q?WN+wQ9rMe68n7TwBKBeS2e5SW3hRHc42tdMOswd+r4NnvXPVJbqOjFjPVNMs?=
 =?us-ascii?Q?V18klZZv4FToi7KnCFaBjfF5sI83jipyDZwR1w6TZt5806r2TBloqpafdWZR?=
 =?us-ascii?Q?xF9EZ+Ihrrl7D7zaYKDSaj6gqK57M0TzztTwd043K4qWLB5uuncSBgHvsB2F?=
 =?us-ascii?Q?hJf32c2So20Y4VhG2omCnj9PNqSXm67+qrxeVk+bAq9nW8z8x/EfH1a85nTE?=
 =?us-ascii?Q?g1ekJ1fSPSr9/pb1FNJgNei1ipwHHA+5o5drse4Y+tvtUmRmf4CBu3MdscgF?=
 =?us-ascii?Q?w2imZP0N0YnDQ9g99qWM/sCBGaNFgjPzG2JJPEwStTZ20hxFC54FMAXm7pFL?=
 =?us-ascii?Q?hDc+SOyipD4iz448KUH7PjjuVSu6fjY30aPjr+XeEs2FBFJWuk3jUg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(19092799006)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G1jH1OBOG1J3AChFmQHOPH2OPJUin/yqdQGGBqGuJHKt0sXf/q1lCd2UcvGc?=
 =?us-ascii?Q?LjiQskBC3k4Wqxt4xhgsaG86dKL08r7/Ll6PwR38akTRhklb4UXLbzs80BmH?=
 =?us-ascii?Q?+55ejXAuP6klUsquI+IVwn/GR6vWGcH3+CSiiGFCDzGt2PbZEwu3AXwXswBy?=
 =?us-ascii?Q?dj4EtVl6UoNzSxWZWrqVBsUDo6A3gt7Db7L35+5b7hh+lR9Fxey6TS8LGdGD?=
 =?us-ascii?Q?4QHsIDz0tMSLLITygF3CJLMeIcSFG0cB5CUeNUN3WNwQCLXUXYBXEPdCpBrg?=
 =?us-ascii?Q?cHnFqkbsQmBMRxmAjXPw5L0sXCnY1d1x32/LrqJ5mTnf4OT2utrIPWUHKdRr?=
 =?us-ascii?Q?/+iFRJu9Lkd+OctOdGMr/asSP63bxHIzqo8M6yu2bv+95u0phVqwFCbPrhf5?=
 =?us-ascii?Q?Hs9563RE+KOnElnH0u2igFsjL62m/ekWsODqBkQ8S/cCXiLdGz00DqPYqAWm?=
 =?us-ascii?Q?Taty3qPAPg2xthqn3SJKRH2KOuOItfC2MJ8kPXJAHrkdtY1n/4QW7lzDXrZp?=
 =?us-ascii?Q?xWDv+mEJUBNI6JHSZhKwvrCtgA1tRdyIIb5Ajj2Ubzcm7G5Za7dP3m43kB6P?=
 =?us-ascii?Q?5Z2FS42X1R3+8+q8hr1XIGBKvlhRi6/644qUXRsu7tddY7IItmR/0v3TRGMh?=
 =?us-ascii?Q?9cyFfULp9Lp4c8J0c7nA8JM0R6uFDgpFy07FxZj5PoZmLrcQ4BnAw4zT1iSa?=
 =?us-ascii?Q?cLNRmrJnRaKx2jn+hZb8AcK2v0NmJ82D23l8xNKT3NbPKGhIg9UlVsK/Ax5o?=
 =?us-ascii?Q?2/qjntXZ8+k9hLByYhlWknWo2EQRRtBPsI7qAnJKRnMZrUg7vWv9yQn7pqg1?=
 =?us-ascii?Q?1i89PfLpYLHnvB2/UWuXWvsCNuB+hx5mqA4jUQl+LzaHTWV7pcT/aaeAbQUu?=
 =?us-ascii?Q?UkGiOL47wPwJgEP45amvHjYs4l68hhpRYuv5t27XDFK5ITlUR2L7j9y/S3T2?=
 =?us-ascii?Q?JZo9YqXc9dyDC0atZ+VEYgYk/EjGlexmmcqUXJ57eF3SCuTwPd91WFOtlX41?=
 =?us-ascii?Q?5qoPeKNxsJJ62bJq0biGptTHtX/sXy6BPqUOHLeHNx3ehO8zXK5fkyFcaDqM?=
 =?us-ascii?Q?sJxMzlhJY00TyyAJ61y5xNqi7KCKgwKK36He251AQK7aDHwGY8Tv8TmcogIC?=
 =?us-ascii?Q?7gWr7O5ZHe2d3ryiUT6QMXzJkGABVIabrSuN41YuNcS6T8Ia/dbW+LymsyM6?=
 =?us-ascii?Q?arwSKGjZGwZ7ZND12J32VnCvGVgKBUbF96yn9ql54TfqHOvDT0s3iep1L9Gf?=
 =?us-ascii?Q?v0TaUOH0S4qsTUHnPkvuNBbc2a0BKxwGv4L6vGA7p02pWhuzvm6vJUy5jqac?=
 =?us-ascii?Q?1wb5hho5Oa8+eGugdfktxDf/YYc/4TzNk1F0lGhywlnKRpwO0ZTLM1AyGuve?=
 =?us-ascii?Q?pkar05BsiTDN0s15ycLTcnoGZKO0Gfc7UEtdOVbaouzovsh2AH+vuNOJBPPP?=
 =?us-ascii?Q?83cqTv5Yy5+c0+lY37J8PNsB++T9FTKeU0h+MAs8XyV/ybibEGRNiYUcJMF0?=
 =?us-ascii?Q?/5lSZ1AY5qhHUPG4CDNlfmaocjUoveVB+dr03fFbRHPbYnMWEDvAg0fl9kh8?=
 =?us-ascii?Q?iMw8aQnRTuimR878lT/3ekCpiCNPHudGClrcgkqZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5400ce-3197-4aab-1fba-08ddc55fb7bc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 18:28:25.3245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: si4l8H6ZorhcyTrNHWKMU9Pz2QrZwzZQle/oXZgqd6onDzh+VmUDOYQxsfKmJxcZyaeVs+6uFF83TaeqYYW3Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 07:51:04PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
>
> Some host bridge devices require resetting the Root Ports in a platform
> specific way to recover them from error conditions such as Fatal AER
> errors, Link Down etc... So introduce pci_host_bridge::reset_root_port()
> callback and call it from pcibios_reset_secondary_bus() if available. Also,
> save the Root Port config space before reset and restore it afterwards.
>
> The 'reset_root_port' callback is responsible for resetting the given Root
> Port referenced by the 'pci_dev' pointer in a platform specific way and
> bring it back to the working state if possible. If any error occurs during
> the reset operation, relevant errno should be returned.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/pci/pci.c      | 20 ++++++++++++++++++++
>  drivers/pci/pcie/err.c |  5 -----
>  include/linux/pci.h    |  1 +
>  3 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index e9448d55113bdfd2263d8e2f6b3ec802f56b712e..b29264aa2be33b18a58b3b3db1d1fb0f6483e5e8 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4964,6 +4964,26 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
>
>  void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
>  {
> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +	int ret;
> +
> +	if (pci_is_root_bus(dev->bus) && host->reset_root_port) {
> +		/*
> +		 * Save the config space of the Root Port before doing the
> +		 * reset, since the state could be lost. The Endpoint state
> +		 * should've been saved by the caller.
> +		 */
> +		pci_save_state(dev);
> +		ret = host->reset_root_port(host, dev);
> +		if (ret)
> +			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
> +		else
> +			/* Now restore it on success */
> +			pci_restore_state(dev);
> +
> +		return;
> +	}
> +
>  	pci_reset_secondary_bus(dev);
>  }
>
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  	}
>
>  	if (status == PCI_ERS_RESULT_NEED_RESET) {
> -		/*
> -		 * TODO: Should call platform-specific
> -		 * functions to reset slot before calling
> -		 * drivers' slot_reset callbacks?
> -		 */
>  		status = PCI_ERS_RESULT_RECOVERED;
>  		pci_dbg(bridge, "broadcast slot_reset message\n");
>  		pci_walk_bridge(bridge, report_slot_reset, &status);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 05e68f35f39238f8b9ce08df97b384d1c1e89bbe..e7c118a961910a307ec365f17b8fe4f2585267e8 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -599,6 +599,7 @@ struct pci_host_bridge {
>  	void (*release_fn)(struct pci_host_bridge *);
>  	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>  	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	int (*reset_root_port)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>  	void		*release_data;
>  	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>  	unsigned int	no_ext_tags:1;		/* No Extended Tags */
>
> --
> 2.45.2
>
>

