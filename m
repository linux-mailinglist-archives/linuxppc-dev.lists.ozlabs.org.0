Return-Path: <linuxppc-dev+bounces-16298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OsWMpAleGl7oQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 03:40:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAA88F15F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 03:40:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0V4X3JDfz2xjP;
	Tue, 27 Jan 2026 13:40:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769481612;
	cv=pass; b=ecdoO6whCNzEgWwCOvVZJ5HG+cZg+26qmwn15NjEaO6GnKL9SGSH0uOz0DuDgcTyuXXnCzGZep1YX9EFSMF2XKxifRIguiAMETwnTrfJVi9bnBDIeV0AkHsndd+A5LTCmLZsInNZDtX/bG+0dOj71y69En2OlgBHNJgs/LRfbpjQwOgtVELuwxgwZqP27+Txa75JjJMz7cmdEaRw7RVqmWWNmXFFZfoQ8gMD+xozwZD1O324AP1Fog9SzKbToYuEAByAFD3JKrMwocrcIBLHBXQkZQDGBU4UuRMsim0h+VMXqxIGCEqyI5CZmVGWcScwDI+tKN7dcMYk1UsEJwyRKA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769481612; c=relaxed/relaxed;
	bh=u6sakHglWsUwTA36TFXRwwp55m8Wf7P0qYzJwe3p04c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LYSWBPOC1XzRCATlaSytIO1eJoe53ohBbUXDMSmuZJkKI0n7ZrLKua1Z+xs9+e9Ge5iXCOmDJ7gc1lKJGtUCxh0N5obWHnERUKr5z3Cq8KDsAXa6frrw8kETKl6YNIcbEv/y7T4pOIfwJCBciJz1fBauAbcdF6btdUv+yrR6Anp09/XXwt5+SXMVrmqXtt/LdudM4GWf3RqE+G84ZetP8rg4611AdnYXF75zFgV6IEUFZ0ZSVgagSlu47PF5Dat897pPDUsImNB6UdqGwra1d9ufrPMtMmcFwlMHjKf3p4PoC7QG9F6SvvzeK4wEJj6HjbTAsv1EoNHGnZgAg8jMWQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com; dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=m18qjtGp; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=peng.fan@oss.nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=m18qjtGp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=oss.nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=peng.fan@oss.nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0V4W0jmMz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 13:40:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8Fz7fpvv+j715lz4sX1jtVQ/o2lAxR9awXWTaF9k+063wFNySfFAAolMbf5tkzq6TLNG/SynoOjb3uaZvyX9xyS2uTR+nL/xq4upJoxhz6E5WIsDQ23DOTx8FdRt/CirDztKNhOzm77SctDABXE7+Mk7c2KUrNez2GAjO0aPX56wdV3WGjpm5j9XVsL5q5r1kqhkC8IhffkJdoKrVeeR63i+t1dF7WsuDZjr+zJHPRbzZKXPlfmXVqjH28g+KKBPuFNu1vcPT8OKgIQWZSJSKTHmJlA8X/rUy/n3WWTcoaVqTbXu0xJW7LLGX5s/GNUb9EWUjfywRVh4Bnu5iSplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6sakHglWsUwTA36TFXRwwp55m8Wf7P0qYzJwe3p04c=;
 b=QwJPAGVZLmEBIzk+oL9sUNIJ3gPtLZOWYQblqQQ2oy7dOz/ZLokZkMOwY/CawYY0s5i1pZaJXo2Oc46MBkTr+nf07MV+hCIAXGyRvFcOlqKHHurNjYZR8C8hNJLHUEVOG70QRW8/0StKlV0K/FEmRYGa/lVUA0Im9ir5QqWaDn2TKMfi4sVqnZIqq49TRPVmT4nJ4WpQzIBTJWoumcRo1SsNUZGvU0yY9jZoUjoGdWHw4T+vKqy7P3rzNYzkl7/NBSrabl6OV5Jm75ifkJdn8sqWiRuaOX9Ky1A1BFnUO8YKg/+yvGAlMwSWhwvRQ7JfcZx4bt9JEfpIoW45rHL2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6sakHglWsUwTA36TFXRwwp55m8Wf7P0qYzJwe3p04c=;
 b=m18qjtGpdciCTJPqJC1XjKuHAHUnB8LEljvqu6r3pgM75peGLmx3uTrdbd5BpmVcbnNyST1JlbOMjA2qEHeQwnESF9v3yid/EaAt6phdVAi5XkvAimzPPEck1oQIPMHQEVYlZE6ufJW7ckbh+APLYhrjy8evTAGHHX/G0EojvMkQl4JyRi5twWZyQZgnqu/T515q/NrNQvwit5isNFsqYltiESVfyfM6Ovx1zSP5gBoza4UFAuQbRDa2cXr4WAQWmwV1Gp0t3rXHdk4YVXALCGZv1vCz5cZ4Q1kf24f5Y91VujxwkNzx+l+IkjUoOtFWTBR93PSQitcnbRkbWgU2Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB12155.eurprd04.prod.outlook.com (2603:10a6:800:312::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 02:39:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 02:39:46 +0000
Date: Tue, 27 Jan 2026 10:39:36 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 6/8] soc: imx9: don't access of_root directly
Message-ID: <aXglUsO+u7gmoas0@shlinux89>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-6-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-soc-of-root-v1-6-32a0fa9a78b4@oss.qualcomm.com>
X-ClientProxiedBy: SGAP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::31)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
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
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB12155:EE_
X-MS-Office365-Filtering-Correlation-Id: 9933c55d-9ee1-4a38-32b8-08de5d4d5561
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?42NGHjGNnIYXHAme+xD/YGe8ax1pgMJq3W0uEK1fLsC3MXvJTPjPU+TQmOGu?=
 =?us-ascii?Q?5JRmfHgAzhzKGFY830kMW3FA0sj/M4sR3rF8KzJDpEVndliBXl/2VE/OMsMe?=
 =?us-ascii?Q?fd8vA60oTtBWaPqsjYiAhMQJ6E2WIfDszYfJiezXk7FzF9L4+/T1MrhUpfou?=
 =?us-ascii?Q?LXYfNdXX5rUXDY0dXccadS15kIXnNVhZJpv/U4adQnvm+HbK1pll1GVlQJkx?=
 =?us-ascii?Q?tPvJoG5/8/MvuMIqUklkB0M7MDENQ+seSV4Ocn+xz0wqDcY3Bs5zbvCidO/q?=
 =?us-ascii?Q?udCe756NHZictUbpDTS7VXVcOL7A9AfJBe6ooNLY5MgkQ7eHpG7t+wKL3XMo?=
 =?us-ascii?Q?pynBn2FabLtcQ+eEoHovXpQbEtWuF5i+H4fqNQzxiNaDmAHwSclnPrBBSAcS?=
 =?us-ascii?Q?st5/pW1bux6aVPbYCEw/a122HFEiKmy99X5TCIMUoGqk4SDq/pn3pl8DwiXN?=
 =?us-ascii?Q?+KtMhTnQyJMPJSKSKzsr1DZ49s5wcaXtEIGsmG7m8dQZJ9Vb6Xvxv92JTZW9?=
 =?us-ascii?Q?PgZL2gWzHhCOP8LZfiBZZzA8p8gdxg5trabyEkTIYK0L86XN1XHkx+aUZVMm?=
 =?us-ascii?Q?/Mbvbhd06IbLLUoOlFUktVkoRertKQzsILQr1jBUVYloX3wd/bTvSNtY4OvF?=
 =?us-ascii?Q?NqBAGGqlMVKdmmQ+DmBN4AeekyQwm0N65v6LQaMw8Hzz1I4qX8MrbA0ju1sC?=
 =?us-ascii?Q?nB9jThEZUPTIb70LvbwqOmKG0ENDQvIqCTBf/YjlNQp1GWJCtDfN07vUgGHi?=
 =?us-ascii?Q?ecBQ1DrWFPZqsEtaTiweiyL3Ofpf2ujXfu0xnLodYRymC9r33UMPOTNcwHKG?=
 =?us-ascii?Q?K+cOK2BGkF1MmqhNESWakz8qgpGgxbLrLlkjIun1+cfK5uikldCB3Fl4mXAb?=
 =?us-ascii?Q?zUl9OVdtAaMbba8fHJvSYmVYchK9isGxt5y4tdXBu/lEnAGCcqTftfpJBQ3Y?=
 =?us-ascii?Q?v/nayprt9RNZJtuDfBW00mOnP4XHGiA6mLMBq8T0TqpSw2dIWZ6ZtebNGeyV?=
 =?us-ascii?Q?Y2YLEFlVt0jU/HN1fQOB6fwBzPafMdeUQiWGNEfwQoNShWzzygSTQtBx15A3?=
 =?us-ascii?Q?DWeGgLSXh5Qcr3hgjqzARAnCeBGCqiIaluYKSJfn7pesTmLPrVsyajKMz6Ql?=
 =?us-ascii?Q?gwazz2QMA9V2QQyomiyan5Ey5kJ9lWBhhEbq2hreWZVb4TZtefk6jsalwOWV?=
 =?us-ascii?Q?cpykJPPSejcUs2GzqZFmSqWQvjf5Br6vvZSAOSVGmxGrnp3E4KekFomt1cMW?=
 =?us-ascii?Q?7ji/nx/Q9nZopO5WbwMzFUJ2253ZewQPh08Lg3Pi5cCr+zK8G0aQKdcnBRGy?=
 =?us-ascii?Q?Diye7f+I2B2286avWPaj1S+1z+yMcBu0StvY2+SbJXGzE0ZsShq9Eg2mCY9f?=
 =?us-ascii?Q?JOe+eKbKNY8Wuk6cyCBonJWRuWkhipFea8bFteNWr7Yywo8X8+wkuKqF3jkU?=
 =?us-ascii?Q?O+TA6BNOdVg3/hc/alKvZg7A9z1TTNIrplAaRcLcXN1DYH/G+sE9tVZazcvh?=
 =?us-ascii?Q?+VcJksaz+C+s5Gi2gBWHbYk9v+tYP2NIyfN7XxsEdv6kkqi393NZh7Gvq0xc?=
 =?us-ascii?Q?0f9Gm2kXCe73yMt3aKAaw57RNiSRTWmJT+rpgfwK8r981dM9X9WMDzC033cK?=
 =?us-ascii?Q?yO8kUQCxRqXJqXETqZW8GHk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MZ4bdgYm1ZISCNxaWKncXOAdTlcaSSM/df7/FUbqiztKBYBpTS0wA7JkAfMm?=
 =?us-ascii?Q?YyPNZ78K3fQ2lYeHElj6u9GH7XH/oLgBKqlWOVkYlmFVC/e+fVELVq76B064?=
 =?us-ascii?Q?zZW2hYyW6mlZCYIGpw+Tv59eh5e7okgWb1ZktByEwxpZ9ZDKTcRUFTECIk8f?=
 =?us-ascii?Q?lhBeAUwNCMK5auRLbTCIT6k5lzAKanR+HRLdFIP7sr3M+pVyEoG28zcNdzyx?=
 =?us-ascii?Q?Y/i4u318Ct4m74lniA5BuWDnUlSQAlJKqMmf09RPJB97yB6d04P7zFDiJz8c?=
 =?us-ascii?Q?yTRWxKUQSuCKFUnAYXrYb5jFDPqwIHF7lpaIeGvT8qgx26cSTwzJIamMJ+Q6?=
 =?us-ascii?Q?CmR3cCOAbLzj+DnCMgn7psJBTHNmMt9esVXjCFB63Ld7dvEVLAbZvZBVlBQK?=
 =?us-ascii?Q?MvqYQmlRsSSbTeeU+FLTjsZSY4VYkB3As9Dxix+Afz0nLSAiDm1nJzITUSSV?=
 =?us-ascii?Q?UzxhUuqJaxT1ejIz4UA+9CDGiZyqeajhFe4d7hpmGIxSzidbHnX3AlfbyVQo?=
 =?us-ascii?Q?M10u032aaI/ZXyIgXwZVYDaFPGD+o9NhN2bSO/07ME8umgGKO6aZyqR85AL0?=
 =?us-ascii?Q?4fHLRfOZuqBnH77suhhP9dDYOd71SCDCYHoZ2t6Iz/CECrjUtYnOf7FA2aJn?=
 =?us-ascii?Q?DP4WE9NVEQTnT4Kv2zgCZnmJhuyjS81mt9T9hdIAMfcVeBydvjNtlYecz/+0?=
 =?us-ascii?Q?A7CkoPGZBHdQt0A4kIb0zCtuUPFOlusQVwfzSkgKJm81WqCPTDz0xdOW8elC?=
 =?us-ascii?Q?MSnI5DCERlMSAfBF3FUe6jEIlGGicq0/Ky2n7HtI1o1aK+eMNfzrt5IsjQfG?=
 =?us-ascii?Q?tb0eb5wHJRiR/PwahfwmnHH0tr6thAPnTVN9Tm2k++N11RtAv504Ql/gslGS?=
 =?us-ascii?Q?e37ifP9XIRGr14Z1+8benA0Yr0yDtSCVaxUPHb/bpKqA8BVddi4ze3ljpLzj?=
 =?us-ascii?Q?omQmKicxpDjERq8NTow8iZbZeefW8HhAcknf0aIpe2Wl1o5wEQQhIcpHIWdK?=
 =?us-ascii?Q?U3kh5SaYqUNuf0Tu4GVjp0zmISvOaW1SFFotXp9ehLt/ERIq+wyNaByHIbfA?=
 =?us-ascii?Q?65KGOJcIfl6ErZsxlg0z4lKvWcDrZJfIL8YZOlVS1PZU9Uiq5k8KzbO2RVIS?=
 =?us-ascii?Q?IGOg+3tVsULhJAz6hL7vcnMKi7xcG5MsxofLKcRJW5iDPVxTjMgvTgUJS6bP?=
 =?us-ascii?Q?/VVyCV+y3vgoiqsaCD52aAABWtOmi4G9FbYoORwPjFUK9crBd2ncwWGGShrg?=
 =?us-ascii?Q?UU0HQ4sz+lZlwGElSl4PaAMEKE2CYNJFPewdISCHM1KQYOW9QNxpxAA4RSEP?=
 =?us-ascii?Q?EgIb5dV2j4KUJao8eEdaYR9zX5GsHbYp4B7f+O8i9EQrb3G99TejnF4sVapZ?=
 =?us-ascii?Q?fR5Gk7CFUsJss6imy3wKwNr0q0JZcS0gI4L7LJtV6FayEC3ItoLMeUBGRh8d?=
 =?us-ascii?Q?T9VW2vGSf9u35E0r+zlWa8qNNfrQgJBUGJqqZmZjh38XbGzFrkHr9NLfcvk2?=
 =?us-ascii?Q?FHW9tkbQ3Sv5CinqKEzX7ub3Q7ZHDnGedmjiuLlMtww1u0ZVt/xBE8RAIQWL?=
 =?us-ascii?Q?jA+psiztJKeyMbaermpO14QuAUj+F6MDGFg4vvwZjhV6wj0vA4Px8ipy2cXB?=
 =?us-ascii?Q?rg9SiJz3VUByrtuiGM7Ag/FBlBvoNbsqHa+XnLwBxkBgaZrDTzt/bGjuxYEu?=
 =?us-ascii?Q?tvH2fiaVKbScpOyccowAxzbMSHOprl9MAIQZEqBjmPVirUZw2KqBexrCieRI?=
 =?us-ascii?Q?c/rUzg0dRA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9933c55d-9ee1-4a38-32b8-08de5d4d5561
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 02:39:46.1915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Bn5aKvINXY9cnN9MYM6mV13ynXQGQovSW3lZHqUKs7gPKvbwSbOY6u5kh+0viwq52/kyrcOh0/MkCWHnfAItg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12155
X-Spam-Status: No, score=1.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,T_SPF_PERMERROR
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16298-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6BAA88F15F
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 11:40:17AM +0100, Bartosz Golaszewski wrote:
>Don't access of_root directly as it reduces the build test coverage for
>this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
>to retrieve the relevant information.
>
>Suggested-by: Rob Herring <robh@kernel.org>
>Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

