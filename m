Return-Path: <linuxppc-dev+bounces-7611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 255D5A85956
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:18:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt110h10z3bsR;
	Fri, 11 Apr 2025 20:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::60f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366677;
	cv=pass; b=FIJglIgeUUiBANKn59umiVAaVUlnbNW2aJw1GPAYqe2urQ7f3clnoYXEfgdCsBKmpb+o/SjDc8SsJRPUhM30IeGWFhS22DW63ecnNEYkyis+IdHm0iJZpa5X1VFgce55V2PIDHs+ZiQAqxpzl2YGgnc6Q0+jnkZppKovj+w+8KBfUE/BLKJ0o/pOBQVxHFSNrhXzyNGVYR0WB2bI73bkmWBduVFSCjyWjeU6rUXwKNF6A9uP5Nq3duVhkvo05pFPwwk2iwu4dBP/OMkC+52lo/UIF9dVtySQDjy/ns52EF+miq+TZLABIQforDKaqEg9+kOArK5CjelZ4De6p2k0vw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366677; c=relaxed/relaxed;
	bh=bbGbelVGIDrNnjV2eRO7q/HwO7+XyPyDxKBfklRgjWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IcfcQW4xhs5I6KRe1uKKM1jrzcPQGuOcCFPywVkzX2xjuZXmHWKqM239U0ABOSVzPp1KTfc5SLcDTjmz7oi30WsRCa+AtkmzRE8vHBZo2oZ4JaqbZBKRnjSMczcwAsgKFTjbUw3N3Z/UrO441kYhCmOVk8pSLGOtm7JkbAUZGp0ZY0P74hKxS+5yqptAvjOCL0XtCgO1OR+iDAfD458GorgLY6bmYKELPxUtP8iTq0OD121HdBlx0o1TQ53G5GTnV19LPYcGagt36E016iRiXZIOel/RiOZ2bC1IA+RlaTmRJU/+579eEAXG1EVv1HcLyBpHRM12qy+gGfD6Qqly7Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GiYsG6Pu; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::60f; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GiYsG6Pu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::60f; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::60f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt0z2j4tz3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:17:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6smAabrF1IlpT9v5HFW6euP4a7IHTLAGEuKkjIKZeGS2z/d8McDITf79NcSKQgzrVDnv/d1YJ4KeqYhWBA4gquXzulmQSYyBgXo/baBMn4Qjwoz34YLxTjPiZ4Zv4I3XuaN7Ilmvj5o4JIxPxHTukqWD46K652ro8mkgVyVgDiWHBpWKDBOSiDfwY1SnItLdUHd/BF0X+6+It3cziyvmdvgwT05HspC4Ztvhjjf3QOp8xASiqHN+I4l7J4iQyo4ta3KKt9VrDuiYd95DLDOo3UmmGfN3NxbD5sP2oIchHoDmg6+lilT/ADiK8I9+FF9IBhKXsc7Bp3x6CPfn55HKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbGbelVGIDrNnjV2eRO7q/HwO7+XyPyDxKBfklRgjWM=;
 b=CVLoW+zj2gP2+tW4gFT/s7uftzn7HayUX2Ala6GLZePHIKrxRtxI69Sc//ZNhDlw1n1t6/C+cxNywuekVnvIARooMVVgX3nP95K4xnUlXpc/8aYpxPNaI+x+qcx8F1u5x9GkIDXwbz0ieLzTQBWFskBwNagENgELUJ6WMXnH+2nLRjwy6rHDM7zDPMF3DQqQXgh+CWCINfXMhkcjSLOV8NOJKpn9gUBeNHvj8WcxK7bU5bGPNKbVzmq8P1vwCmweHOYdlYtdBDV5YnpecaZcvc/g3T+6L7yjSrTwNZxka5bi8gfXO5egTtnKS9NQ7d3U/vfm9s9Y4CZq9D5F7Df/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbGbelVGIDrNnjV2eRO7q/HwO7+XyPyDxKBfklRgjWM=;
 b=GiYsG6PuAlw2YAGftNKBqldVl8ydFLwJaWDl3qr3iHzbAAw6hUF6sGWDCsYjazOsSUimrR+Q/TrgSArWuINJI8EJ7PTCE8v35Xg621p1d3YM2ez218/cDCNUknD/EP1zkKBnrAslf4DY4prw59AGcxJtOtgJ7wjcrYNt0WcyOIsqj29FzPRPcyi5HLqDFdt9lxojSTdRZZUO6dcY9+ZfLEoSRsn2jAarWpPbznwdXBQnb1LBUoMfcGf2zppa+bZMElkpZHIDaSI+G/zSv43QICfpNRQI0YfyFz+rSg8SGueH8O3qJaKLcBfHz/nWRW2yJOlYJJ23iu/Jxq37iZ4hMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:17:37 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:17:37 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 net-next 08/14] net: enetc: add RSS support for i.MX95 ENETC PF
Date: Fri, 11 Apr 2025 17:57:46 +0800
Message-Id: <20250411095752.3072696-9-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411095752.3072696-1-wei.fang@nxp.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM9PR04MB8505.eurprd04.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8505:EE_|AS8PR04MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: c97d4ccf-10e1-4bca-2dea-08dd78e214ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SCp10yWgkwDkiOUl+W6nprNBDnd4EVQCMKxdfqw/8Q6svjgODeMpnuBkEGVJ?=
 =?us-ascii?Q?abqeHWYUrgf785XOHhuNJ0n2VaZ7y1BX7RDtvslB/X/WINLVQSmX0VdHvJdJ?=
 =?us-ascii?Q?OpYQPXSSaLquxHSJCQaXqyUR7YMMdSYWW8xLpYjscW8z/NvR/GAQZJpfTo6n?=
 =?us-ascii?Q?ryw985TgYlK3786iWunBbwKDXd1RF4nPNbf/LOYiaz3saahprs4QIZSPjoFD?=
 =?us-ascii?Q?212AvHzwpieHS/lWpOXRAtrv99nv8Y+HQnT+rmVY/M0H+sKIFMCs9pYOExCv?=
 =?us-ascii?Q?jIvFeFjZRX8t2TAE5OCQNYluD1l+RQF3QB582u9gzTBFUnQ+C9lUj2UZjBXH?=
 =?us-ascii?Q?0e3fxvZAzWv+MRBbDqwQB8ZKjQpTVh6CsnJaqVTBDWNTjjShsc4ZHoHOIETY?=
 =?us-ascii?Q?/1R/DYXHnK7CpSWCaao338QF60nE3EvOmahZ3RIGjoo0ND+8mREmBpXodXBx?=
 =?us-ascii?Q?ASZ2gkbPcTAKPeNTIlrVaTJIJNNnbdnwmctUaJxBbq6n02ZTQBh3ZUqOQu+A?=
 =?us-ascii?Q?auy+RzQBNF+0z31aCWpxlXe4b9BkInEPvjP9+UIwzdxouM1M2jUSCA5VBWI7?=
 =?us-ascii?Q?y2ynxBk45AdTUeVLoqTBYZ7s/dse6Yu9lEMJ8sXS8FDPRh9UOcKUZXobCgdD?=
 =?us-ascii?Q?CYSOEs/ibP9T6wUPe8d+sY3P6E+38n2JTakLKXcx1PPjEx6d6UNYY5fLIAc3?=
 =?us-ascii?Q?V/4RcQ5pK87Nzz6jLn6+9hn9igm3liwtMB0JN478W/Mpiw5XnxeLlcDtEc7c?=
 =?us-ascii?Q?4kRJ5Pn4tvPezPMXHQ9t4xV57qLJymEH58ELaX6H5dlhSVUHmyPO38Gh+t3m?=
 =?us-ascii?Q?TazqXBIPNATta2r5udwn7iQipuXgt41E4qU3fR9QkJvrN6d441jgtLt7o/17?=
 =?us-ascii?Q?3RqWOcAcdxOBGeXM8ZJP42EwLM4dDhGmcOhiC7sYXYEws8vrqnFJNYu14FgQ?=
 =?us-ascii?Q?8C5V1TParu7UPHo/B49TMWd4jLjzFRgBbvD/Ye3SzU/BwCBGTfTMt//1vMiz?=
 =?us-ascii?Q?4Oj7my0cwhup/Whmvzr+2G7nlTzepK6B2tjJ+RSswaYYgbW+EJjp30wRlELI?=
 =?us-ascii?Q?Fg0uU81wq4zu2hmp6Tj62W/vMS3yh6nKnroFUpruYbeqyviZF27aFevoOJ84?=
 =?us-ascii?Q?yRfe6EbGRkjX7wHZ5W/XgeF4Mc3myygQbMIq7GCVuwwi0WMNIgoCC+ujorOY?=
 =?us-ascii?Q?LI9/uqeRfJ2xh822SdorxUzRygyj+BNtpVWs39UJQ3S5QYjhruuDlEs7Ayp2?=
 =?us-ascii?Q?kp1bFVx2uDHzSEeBkgBz81piWe5E2UrLNy+B38Q+k1Bhofceri49+rLeY4yL?=
 =?us-ascii?Q?FzepIPAceMqUImRRYA6odZRIgVFidt2TD+/08m5h/OUNFqoJMH/w/dYGiB/8?=
 =?us-ascii?Q?2Vms55WgTqeyujz5D43+gQwHTF46FJPB5vRdLjzh/Qu0hzz83mpvZ59+1ojb?=
 =?us-ascii?Q?10H0U8V327f0G0JeS6KkYPRCCpA/C03s27aZOJQXRsenP5EDBFVTaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZR+oayJ60txnhAs0oemqv0XqXMBtC7SdG9xBDpH1uNAzx9rWLcTEawCaxUCd?=
 =?us-ascii?Q?N3FvJxSWCAxDP0YpPWhUjcnHjzBPBal3AQ5GwYBnEli5ClkSMHaBfw2tT8XC?=
 =?us-ascii?Q?IBtHj+rdDE3sfY3iQg6XWeLEUHV756BJmeJ+FiWoL2eUupY1LBmJYpXij/PC?=
 =?us-ascii?Q?6qgYtVY7kADUbysCwiLAe4KT5yTg4eFL7IPJGxH4LMDiN/ZcWGUNiha8Bz3V?=
 =?us-ascii?Q?YsE7DR++qzvQcjSG1ulBkPuNoQkjux0QJ2tEN870tiNSsA6kcp+32RR/21Y0?=
 =?us-ascii?Q?onlD2iDMruPqF6KoH+OLMVS1e23JMmkizGPdOiXTG87DfKZpxzrAW+r/dO8E?=
 =?us-ascii?Q?v+NFT/EtBrw4Z5GLVQdyJWsAeNNg2byyAzNbLOf72EJX5RcNK668czWQArnt?=
 =?us-ascii?Q?9cxgPgleWO0K5DEWCqOuApgNes7qnOx3ydcbBoIb81KNLhX5Lq7QoLBhh9KF?=
 =?us-ascii?Q?b4ZD1TTEwRGxD7IXLsnGQNvU75xUTCgkYl+Kd6Q9nQr8BmrQj1S69cn4i0iQ?=
 =?us-ascii?Q?28wG+Knxi6L+G7YFp4H6GeOvFslM1OGs1WFUFKKNBUpUzKOvbD6NfvkVYJX2?=
 =?us-ascii?Q?emTeKqEhECOj8jeCLMwXxCf8RMMRThb4lKVHpF/kCj4HqkvzbPHUZn8mhg29?=
 =?us-ascii?Q?+tuwczxkg1XxpeLkRpCCj9/2mDQHKqZoy5zNywqybNOnRJpbMzZuFBCZwLcB?=
 =?us-ascii?Q?UlmrQMA2ehmbWm/yhbnlmWtvBZkWRD2rkP6GvLG3HXhFms2vtcGTYwTh9RG+?=
 =?us-ascii?Q?YMV/XjjpvX/Hk5g8R6vd15mJT5Yku9nkyLN/hYqQHJe2O2agS754zs9gfY3Q?=
 =?us-ascii?Q?aOkmdIyeed/GjTM1osCoca83gsGVDmoSpmEDH9GKNKTZqyj0DZicTUd6WpbP?=
 =?us-ascii?Q?sscNbvdAzBB62/moVSNBjisPoVqcbsO9qY6pm2fSZMWP7r9L2qQknYlVKy/c?=
 =?us-ascii?Q?o9WTkoQDPxuWlDpo7T4QMr4r2qs/ig65WBYTTX98OHQjF6XFjZTo7LiF3sZX?=
 =?us-ascii?Q?5BEWVAOV6+PMjr5W6Fmyyn84PBrUV83qLygWPmOlso2h8BvUtBB45fO85jAc?=
 =?us-ascii?Q?bsaIRxAJ6FXwMfbc3cfrBRJXjMir5sgVHpUpKq9MJxRY9Aa1JMBoqMn0cLKi?=
 =?us-ascii?Q?mjb4mbaOyOFO3xi2sSAegACmHqzsuPBXVPVEXCvcKaCL2iWF6lfnburgW//0?=
 =?us-ascii?Q?SJK+ybPhTnMR+HxIBZkHnzbUU1oK4jfPJyWXJwJxVlnVrIZJrf0MnSGodiZH?=
 =?us-ascii?Q?L0+N9JCFxx8JA/AexEILVN5w8H0OZtrkbLdRcQxUALfTtwPIFb2iL8ZQdm2B?=
 =?us-ascii?Q?44A6/byO6XqxpIVbDZVo1hWNPSeqUz63TKOPfz3kpiTb9sFATI/wXdwIQjMA?=
 =?us-ascii?Q?+/lEVnGnJYlsChP2c6BLxljmdFTI7Bq2VFB8S/ssRdyTLmuJ4MXiHTJDzp7G?=
 =?us-ascii?Q?eoYal5kkSIZ820houZ7bdVouCsTzDl8VM4FPUrePip9VQZFRhIETB5OXE1sm?=
 =?us-ascii?Q?s5l4ZnGxktuW0qSJoyioDQkvk1dUIr8iVdJ8hZesDKlN4oz14UMG7KueQHDj?=
 =?us-ascii?Q?yBe8eTJqMZc2x4JmUCp3S4tqhSnRUJQw5rETSH1k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97d4ccf-10e1-4bca-2dea-08dd78e214ff
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:17:36.9888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cm0jHVvXZQUDtW4NFb+F/ShsQWnc5KSgSy9+MQQ65ht7XHjvwerWEkQ/hLxkLff5XE6VNqVv5Fk1fMW/ozsnbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Compared with LS1028A, there are two main differences: first, i.MX95
ENETC uses NTMP 2.0 to manage the RSS table, and second, the offset
of the RSS Key registers is different. Some modifications have been
made in the previous patches based on these differences to ensure that
the relevant interfaces are compatible with i.MX95. So it's time to
add RSS support to i.MX95 ENETC PF.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
1. Add comments for enetc4_get_rxnfc()
2. Modify enetc4_set_rss_table() and enetc4_get_rss_table()
---
 drivers/net/ethernet/freescale/enetc/enetc.c  |  5 +-
 drivers/net/ethernet/freescale/enetc/enetc.h  |  2 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 15 ++++++
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 12 +++++
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 47 ++++++++++++++++---
 .../freescale/enetc/enetc_pf_common.c         |  6 +--
 6 files changed, 74 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 2a8fa455e96b..5b5e65ac8fab 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2436,10 +2436,7 @@ int enetc_configure_si(struct enetc_ndev_priv *priv)
 	if (si->hw_features & ENETC_SI_F_LSO)
 		enetc_set_lso_flags_mask(hw);
 
-	/* TODO: RSS support for i.MX95 will be supported later, and the
-	 * is_enetc_rev1() condition will be removed
-	 */
-	if (si->num_rss && is_enetc_rev1(si)) {
+	if (si->num_rss) {
 		err = enetc_setup_default_rss_table(si, priv->num_rx_rings);
 		if (err)
 			return err;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index e49c1626e7e5..7b24f1a5969a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -541,6 +541,8 @@ void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes);
 int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
 int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count);
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 
 static inline void *enetc_cbd_alloc_data_mem(struct enetc_si *si,
 					     struct enetc_cbd *cbd,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index b72a365625d2..e164e1a3f44b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -514,6 +514,14 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 	queue_work(si->workqueue, &si->rx_mode_task);
 }
 
+static int enetc4_pf_set_features(struct net_device *ndev,
+				  netdev_features_t features)
+{
+	enetc_set_features(ndev, features);
+
+	return 0;
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -521,6 +529,7 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
+	.ndo_set_features	= enetc4_pf_set_features,
 };
 
 static struct phylink_pcs *
@@ -926,6 +935,11 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 	free_netdev(ndev);
 }
 
+static const struct enetc_si_ops enetc4_psi_ops = {
+	.get_rss_table = enetc4_get_rss_table,
+	.set_rss_table = enetc4_set_rss_table,
+};
+
 static int enetc4_psi_wq_task_init(struct enetc_si *si)
 {
 	char wq_name[24];
@@ -963,6 +977,7 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 				     "Couldn't map PF only space\n");
 
 	si->revision = enetc_get_ip_revision(&si->hw);
+	si->ops = &enetc4_psi_ops;
 	err = enetc_get_driver_data(si);
 	if (err)
 		return dev_err_probe(dev, err,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index ecb571e5ea50..fcfff908f7c1 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -295,3 +295,15 @@ int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count)
 	return enetc_cmd_rss_table(si, (u32 *)table, count, false);
 }
 EXPORT_SYMBOL_GPL(enetc_set_rss_table);
+
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count)
+{
+	return ntmp_rsst_query_entry(&si->ntmp_user, table, count);
+}
+EXPORT_SYMBOL_GPL(enetc4_get_rss_table);
+
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count)
+{
+	return ntmp_rsst_update_entry(&si->ntmp_user, table, count);
+}
+EXPORT_SYMBOL_GPL(enetc4_set_rss_table);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index 1a8fae3c406b..e22124363184 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -625,6 +625,29 @@ static int enetc_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
 	return 0;
 }
 
+/* i.MX95 ENETC does not support RFS table, but we can use ingress port
+ * filter table to implement Wake-on-LAN filter or drop the matched flow,
+ * so the implementation will be different from enetc_get_rxnfc() and
+ * enetc_set_rxnfc(). Therefore, add enetc4_get_rxnfc() for ENETC v4 PF.
+ */
+static int enetc4_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
+			    u32 *rule_locs)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+
+	switch (rxnfc->cmd) {
+	case ETHTOOL_GRXRINGS:
+		rxnfc->data = priv->num_rx_rings;
+		break;
+	case ETHTOOL_GRXFH:
+		return enetc_get_rsshash(rxnfc);
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int enetc_set_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
@@ -685,22 +708,29 @@ static int enetc_get_rss_key_base(struct enetc_si *si)
 	return ENETC4_PRSSKR(0);
 }
 
+static void enetc_get_rss_key(struct enetc_si *si, const u8 *key)
+{
+	int base = enetc_get_rss_key_base(si);
+	struct enetc_hw *hw = &si->hw;
+	int i;
+
+	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
+		((u32 *)key)[i] = enetc_port_rd(hw, base + i * 4);
+}
+
 static int enetc_get_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
 	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
-	int err = 0, i;
+	int err = 0;
 
 	/* return hash function */
 	rxfh->hfunc = ETH_RSS_HASH_TOP;
 
 	/* return hash key */
-	if (rxfh->key && hw->port)
-		for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-			((u32 *)rxfh->key)[i] = enetc_port_rd(hw,
-							      ENETC_PRSSK(i));
+	if (rxfh->key && enetc_si_is_pf(si))
+		enetc_get_rss_key(si, rxfh->key);
 
 	/* return RSS table */
 	if (rxfh->indir)
@@ -1249,6 +1279,11 @@ const struct ethtool_ops enetc4_pf_ethtool_ops = {
 	.set_wol = enetc_set_wol,
 	.get_pauseparam = enetc_get_pauseparam,
 	.set_pauseparam = enetc_set_pauseparam,
+	.get_rxnfc = enetc4_get_rxnfc,
+	.get_rxfh_key_size = enetc_get_rxfh_key_size,
+	.get_rxfh_indir_size = enetc_get_rxfh_indir_size,
+	.get_rxfh = enetc_get_rxfh,
+	.set_rxfh = enetc_set_rxfh,
 };
 
 void enetc_set_ethtool_ops(struct net_device *ndev)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 0a95f2ac781a..a302477c4de4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -128,15 +128,15 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	if (si->hw_features & ENETC_SI_F_LSO)
 		priv->active_offloads |= ENETC_F_LSO;
 
+	if (si->num_rss)
+		ndev->hw_features |= NETIF_F_RXHASH;
+
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
 		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
 		goto end;
 	}
 
-	if (si->num_rss)
-		ndev->hw_features |= NETIF_F_RXHASH;
-
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
 			     NETDEV_XDP_ACT_NDO_XMIT_SG;
-- 
2.34.1


