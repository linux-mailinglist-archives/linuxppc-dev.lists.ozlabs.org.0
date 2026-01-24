Return-Path: <linuxppc-dev+bounces-16283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APKyKHTcdGkq+gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:51:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2AE7DE92
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 15:51:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyyQv3Jvnz3btS;
	Sun, 25 Jan 2026 01:50:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c407::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769266247;
	cv=pass; b=WXQJRS/uWH3jngPI7jeggJ/N7fPpoRxgQVLq8U5H5Q3wxElVl5N4soLzt/8Bv555Mx3bJqWBHj+YdfPv7+n07bycSXllNfIKqqEjGSquCZ4R4IZ/R1LAMF4w2V4acHp2uUdrYRB/3DTvrnS5xk4N9b/YAcpicLoHt8pjhZtYhsSSMmA1fC4l7cuKqKf3zl0nTUJMhqVG++TGm2p2iHRLCNrlc5Iw1m8pVpcxen6jPIm9wfUUzWk8mb5TmidbOS0xngtP+nFHAdfd63ljr19272ePvHb7FBGAwjOJjRjH58tDfUJ9nPtGh9OCQ7koedIeZkm87aUTbi4NaVRlgKhunQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769266247; c=relaxed/relaxed;
	bh=sVazY870yWu71QphbkyJ+nXef387QUAjnwNViDU/egk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OhHEZpILRyJTp+wYjiPnFCwRCu27uzW0SyI6ZPDJWCHs4GgXzMmUnCNT6HxhxjZKxwxwuw7Vi1msSk1eyLRoH2gHjlG2VhIZxYYKzlAR9TC64Xey/pQcl5R4ceG/GHJ46Vxu/B49bhPrI3sXBXi7uh+YIxK5ZgryoMk3Jx4GMwBhoe/Zbc3Vb2ynWWv2vW9waFA00T7Jlbsg1ul0aHGj9Hif7v7GATOJZKP57FiyCX26niwxNO8SpcY7G6NJDlWL8VAI6c3XP73HCsNu5OhoiSPF/hRVDdSHCSJ8FoYOjk9NbmILIeOyR1SVIfn5pd1ImAxxEF7cQCoM/qFqLfrvEw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=DkAGHsqo; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=DkAGHsqo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=2a01:111:f403:c407::1; helo=os0p286cu010.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyyQt0PNqz3cBT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jan 2026 01:50:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeNNa2mE3T9KahkiOJaUJLb2cfXgcamib0+qNgKbVCjUBNIT9mcR7l6N19Kh1gdQn+Zv5A4C/yboMA/RBALqkePnTd2wjMIh9oY0ILUo0R/e4WQnZ7mbHN53vGp48Opy/OQi+5dss6t62UmUg1sX6SiyWFIj+jIrSNJJce1Qmay1Bjmyeaim8/nCxfqGCjMqvXOhcq7K0ywTDJF0diDDy9n0KSIBLpmfgVE+rKlRmN+bHyr+MWUsimdFWo325SYllX72tr63qpIdsm5Pjd6ucZJwPHxQ75F2xYZqRKADKnHMH8OEq4o0RPyx7xr72VWt2hNPhmkNAvbZjm+/pL63ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVazY870yWu71QphbkyJ+nXef387QUAjnwNViDU/egk=;
 b=WFjyJT4wWpbIshdrD0P9/7W4imjyOyhAa9UezpjobhbCi688tR0vKrJd/fzl+1MtZt3rJjXw8dpP4tqkYQtIjjHA8DYwOhvsPk8df60xmH+7YPK378fdHtNDwDt47pNkECIQGLGsucVXycycQI0NhxDjIYyBEhd5nz99kheQ2gqcoKKuDdUI8P9YAwo7Slv3IREcPkEAqzqJWYkJmb+KgRKjvX3e9Oq3XLoWT4kjAu7kwvT9LZoAWIq7pjF7xyjSetyCQjhXzn2SZnIhWxqyNbyCgaaHkqC7X8CZQXEfIODeaE63iERunSvN6/P3TShhVYBLvZ8qL4itLhYSVqWoiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVazY870yWu71QphbkyJ+nXef387QUAjnwNViDU/egk=;
 b=DkAGHsqo0t4MPBDx1eBw2el5ItC20xg0hn1hkJCKnuwVK2tUXs3TZy8OB6U1ShHfGCpMbJYiEcuZwOrkM16Z0g2RiazdJYHihA5JUveArWEwJiRNwe64QeNqdqvVk7eH+RHZYjlVgaOA9Vb1pQaIB5O2rds+88Mc+QCIb9caCe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:19 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:19 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org,
	Frank.Li@nxp.com
Cc: vigneshr@ti.com,
	s-vadapalli@ti.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	jesper.nilsson@axis.com,
	heiko@sntech.de,
	srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	kishon@kernel.org,
	jirislaby@kernel.org,
	rongqianfeng@vivo.com,
	18255117159@163.com,
	shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com,
	vidyas@nvidia.com,
	shuah@kernel.org,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v10 4/8] PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match Mode iATU
Date: Sat, 24 Jan 2026 23:50:08 +0900
Message-ID: <20260124145012.2794108-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f518f8-9f18-4aa1-22c9-08de5b57e508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PZfrxwa+5zGu5bv+4MYCzki3d4cV4SVRImrXM6rwj06sCo2YXfopoNQccMMy?=
 =?us-ascii?Q?NX79JCNrOQjelDDFec8CJ5veYDkNZDgRd2Lcq1mCyaxXG3TPSYxWSu169ly4?=
 =?us-ascii?Q?Iedlzof/zLiSbAgPRmj23MXsSNTtYZ2W9zKC7tGjJ7N4vF4XN7zilQ/YRGdL?=
 =?us-ascii?Q?zyYyw4fdrr3o6dr93Q+tbPSBtXjTw/oS/VJpTs2uxNzTslA16+LEXMvvAqf5?=
 =?us-ascii?Q?Mkow2LYtHseMhlaW37xLO2+aYi+lNuWepQboz9AH0JZDRSpN0rwlirm0y/VK?=
 =?us-ascii?Q?4vI7fE5ydA1og0HCX7Kae9dmi9lrbXgiySvUPynPpt0UiNi+nfvLsVaEuf1P?=
 =?us-ascii?Q?ITZCahVrDvYmQKPc53mieTlemjQWUn91T5py0xvjlaOkNg4LfAcIsT+M6npU?=
 =?us-ascii?Q?CzF6PbF2SPe7jdIK4NoWeXne+63bbkq5hELm/6i/0JnPJ/G0VocqIavHPsu5?=
 =?us-ascii?Q?aX2hV8x3VEByEou39uqpRNMIKqSEq0yQXSbAIabWUxsQZoKh2u7aI4P5Gt2i?=
 =?us-ascii?Q?XsM2vF2NKqv29r1tCqospySwEG+yU+smQBfPMf39VJdRhRoCWulGRqFRLoix?=
 =?us-ascii?Q?JQlEpoZZLDUhrHj+IvZB5pjKPeqIYoitL+u4FJu1XghGdLKeTbgz27kSDGbB?=
 =?us-ascii?Q?vIeHlCYzHREJiqtu0J4OzHZK22cPxmuE4aZ/FH/3X14vkeXpgeVaUE+zHWK2?=
 =?us-ascii?Q?DCZhZvFjVWCwfbyLKxLgeM/DjAotchWN4RkG5VgwqGdFY5ayCCrr9CWrnVdz?=
 =?us-ascii?Q?2DptJtSAbYZew+5ivYkodQl7Xh5yG2VkG5RMCGuhDxKXFdRw7ikMpDDuTNIa?=
 =?us-ascii?Q?Mm0mWrP2qAZSN7wTU/Qy3vlfBfUcJCBiI5ddT/z+nAbhJLuKhbZIPBC533tT?=
 =?us-ascii?Q?9AoJyglMELi+yvPSy15RqnB2A1lU7HHp9dAUGjRcve5Wk7qfUkRl8I+TULwc?=
 =?us-ascii?Q?two/onIJ7sHaH+xYsvxmZTi+aRnDHJBDXYBf4tWYmJayTPKO31Ae8GuoHbMQ?=
 =?us-ascii?Q?RI0WrTIbcFTEjMsJHLF6OVZyrJecyExOuKsi4nqT8vbukWBXlu1TjMpPs7jW?=
 =?us-ascii?Q?f3nfBh9R4EsaXIruQ+gDWDTST1ivhYVmI52rr21eeIr3ZMnQLU/dHrT2R7so?=
 =?us-ascii?Q?uu8NTRnpZp3wr3CQgrZPVnFGcU8YFmvlvZCMnoWq2RgVcgYrHlMAHtI6oZY9?=
 =?us-ascii?Q?YAghrWrZh1Xg7Cq4juBUY8Huc9p5vLIJ7rG3OOqDlMHMw1ZSwyBJkTFOLp4H?=
 =?us-ascii?Q?+K6S7lnACRgjTcJsBJN/GPG9VjLkLzgTcTb4iUUzGx5MMRpyjN/AeDqP35ya?=
 =?us-ascii?Q?GxeSrz6ovBg/TbmXlPxO0WfaD5FU1ritDbUFKVDVidDJoAsIJISItWFOnK3O?=
 =?us-ascii?Q?2uTT9EbUMnMHio/gGHWiYzeFyrJ18CTKz2O8kNrUYYrzcuA784Q9fAKWH5sI?=
 =?us-ascii?Q?SJFDPFPTgt8dHwXdO4rMLrgwvjqf/qr3eBjAr9EqTadag0aSCDRtlzzGeM/P?=
 =?us-ascii?Q?HqhgyO0Pj0kvcRSsyG4CqUmQJ8ujrz19DCi76lGNF9600uOuxmuaGTa8Xx2S?=
 =?us-ascii?Q?8Iya8YF0+xawRtdYybU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OXYRfCNp7nnH/pbScJTj+0K9qtYAO+tiPhuZ1RyFPtNDE1c83Jf6r7Gga3/r?=
 =?us-ascii?Q?JppovCn3NVnr6KMjvRJis/rHN42RKTFK9xlvmrid86MW1rATeziol+QgGAh4?=
 =?us-ascii?Q?8vKkrvB6j02v444mJKB0f+Wsq8KMX7lwak3wZSxnHI0mkU+RxUSkyl/hN6zX?=
 =?us-ascii?Q?piGdJg75BWvVWu4Ld7O/KGkUfZ49ToJnPnzVFeWHct/TBwcePl4MPSfIHVsx?=
 =?us-ascii?Q?MxpsPfBhTmkEqh8MYu/sLg7O/hx1iTO8+314e1VxLf9+lwMx+f0BVmCkFXrn?=
 =?us-ascii?Q?Tzb1LvrrJMcyXBps/Z4hRsIoGO8CPMtl6WYToM18Uqp03H7553tkUSrk0Z2J?=
 =?us-ascii?Q?5mppxqMu5Y3OPGj3II1lagmrytIIaXTK8NDiKR++PoPlVSRKAdLCVqnBMlBy?=
 =?us-ascii?Q?srfrsOzb7Jmouoksea0/Yzf9mfzG0c2/YTNzVBdAKbDcoXESBqcCplm4JccA?=
 =?us-ascii?Q?NucHYqFkrGrkW+ndpfH/oRwvTNyNoyMxZ3/DGIqxJ0r+V40vo22/hcQIX+hy?=
 =?us-ascii?Q?Xlbh97ZCBQO/p8nANlU+AFC12D7tT5yzUjypy3ebd6o5bWrpIRpF7HYdOJrD?=
 =?us-ascii?Q?n0i6XDUQfvMEvyv/6Yzqo+3+tAsn2Fu4HmI6oQJjgYTc9Q07VEvO/fD+6eV7?=
 =?us-ascii?Q?RruPfsM+sEwV0dH2NxXZy4W4VAUBkEEedBNEWvQnM7FAWDfeqDpvVQ3VFfGT?=
 =?us-ascii?Q?TaiUMUVMZvzKVSwNw86rt2bCpgLAI+liogBoRk5ucBxlvF+H2ooEALzGYeNc?=
 =?us-ascii?Q?xg6twV2M/I6joXN5EzXOdvrrk7bj0Q8jBV3NNdeFEIR6oJxJYAPPG7llonAe?=
 =?us-ascii?Q?mA1xDfLSGKqw4XkmY53Xilm2zKyQKh8/0G87eIybhv/5oU2DGuGSPGdntFOh?=
 =?us-ascii?Q?OI6dihV6eH8DnsI9IYjBPcFDYX6C5+gWU6Ch57k6j8EmEeMpzPJlD2sH9Wjr?=
 =?us-ascii?Q?+P33gFxU+RZLvc6lHD17zjQ8cTl3nOEdqTzVKyQxgPXzqTJFUbjw8dI3q4Dr?=
 =?us-ascii?Q?RcXWX0DUOJab0reoOw8Udb1G1Vpu9x+vzHzAEZvNEfDSGR/C+0uK1cAF/ANu?=
 =?us-ascii?Q?nf9j/VTM2bJFO3cyXJuAz6l4ls7C4v3dXQk9DFMh41rvD24+OArzMGgGJUDF?=
 =?us-ascii?Q?T7/6/vP/BuOFbUzOZ6e1QHTbhT43oMdiY6A4JuNESBTJq7cJYmwBOZ7Jq7k+?=
 =?us-ascii?Q?QEZl8p0Ky2+Yd4qkbhpt4S8UAyRanM9nrhgKlfDiXGaDeBZ14pW3dwBSGmyC?=
 =?us-ascii?Q?g+YzIAx6IYWO5P6smqreFNMXOMsQtHBg0plrQ19okoQZyAqnnDIYKSHQ5cSC?=
 =?us-ascii?Q?C+Zvi0JVJgMMhrPHMpNhXA3xpdGj0NsDDjIz0oMyuDJumulFRsQBx/RgYfPU?=
 =?us-ascii?Q?ybyNv1bHryx/Yhb/zJsZveRdzyzNVGQx90D8YlNLHkkFFUEttrpG9KzBD3/j?=
 =?us-ascii?Q?KzOsQbwERvZv1ftk5qq5embF6lxmarfe9wCblluzbP/QQhr+AheMaVXEgcxA?=
 =?us-ascii?Q?HrLVZ8Lzu3z595MQv8BJsbQIMkwAfFStumvviTxVzGskcr2NRr9ytVP3mb5d?=
 =?us-ascii?Q?n8IuGAeUGU6A4G+Koy9qCin1Ul/tq5FoTs+QMT/gpdb8WR+UhtoZi1DqiOEF?=
 =?us-ascii?Q?S/QQLJqeu/DZuqpSUgIOl5oSC3XevyvsQ4y/sM1Gcv5GxJDOXPnoT72NCi0d?=
 =?us-ascii?Q?74q/WS261NVwL73edEQV5cyGC132Ekiu4ayaopDd9gav/OflFs/aOQh2ZVO/?=
 =?us-ascii?Q?A9LDtwxfvMK+q40ryMSrt371PAITmgq+v0FdThsQIFtZEWHTgr6j?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f518f8-9f18-4aa1-22c9-08de5b57e508
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:19.6463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iYyQC9GcoWbEfqbe3jaYDcqC7Ed7+teK7aVo8fmIHbok66/9RjkQBw7Qkd9C79a/8om5YCa45a2w6WllcSVmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4692
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16283-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:Frank.Li@nxp.com,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:heiko@sntech.de,m:srikanth.thokala@intel.com,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:kishon@kernel.org,m:jirislaby@kernel.org,m:rongqianfeng@vivo.com,m:18255117159@163.com,m:shawn.lin@rock-chips.com,m:nicolas.frattaroli@collabora.com,m:linux.amoon@gmail.com,m:
 vidyas@nvidia.com,m:shuah@kernel.org,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@axis.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_GT_50(0.00)[55];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:dkim,valinux.co.jp:mid,nxp.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: EB2AE7DE92
X-Rspamd-Action: no action

Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
subranges using Address Match Mode IB iATU when pci_epf_bar.num_submap
is non-zero.

Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
num_submap is non-zero, read the assigned BAR base address and program
one inbound iATU window per subrange. Validate the submap array before
programming:
- each subrange is aligned to pci->region_align
- subranges cover the whole BAR (no gaps and no overlaps)

Track Address Match Mode mappings and tear them down on clear_bar() and
on set_bar() error paths to avoid leaving half-programmed state or
untranslated BAR holes.

Advertise this capability by extending the common feature bit
initializer macro (DWC_EPC_COMMON_FEATURES).

This enables multiple inbound windows within a single BAR, which is
useful on platforms where usable BARs are scarce but EPFs need multiple
inbound regions.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 .../pci/controller/dwc/pcie-designware-ep.c   | 212 +++++++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h  |   7 +-
 2 files changed, 208 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index cfd59899c7b8..de09cd786edc 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -100,9 +100,10 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	return 0;
 }
 
-static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
-				  dma_addr_t parent_bus_addr, enum pci_barno bar,
-				  size_t size)
+/* BAR Match Mode inbound iATU mapping */
+static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
+				 dma_addr_t parent_bus_addr, enum pci_barno bar,
+				 size_t size)
 {
 	int ret;
 	u32 free_win;
@@ -135,6 +136,179 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
 	return 0;
 }
 
+static void dw_pcie_ep_clear_ib_maps(struct dw_pcie_ep *ep, enum pci_barno bar)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct device *dev = pci->dev;
+	unsigned int i, num;
+	u32 atu_index;
+	u32 *indexes;
+
+	/* Tear down the BAR Match Mode mapping, if any. */
+	if (ep->bar_to_atu[bar]) {
+		atu_index = ep->bar_to_atu[bar] - 1;
+		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
+		clear_bit(atu_index, ep->ib_window_map);
+		ep->bar_to_atu[bar] = 0;
+	}
+
+	/* Tear down all Address Match Mode mappings, if any. */
+	indexes = ep->ib_atu_indexes[bar];
+	num = ep->num_ib_atu_indexes[bar];
+	ep->ib_atu_indexes[bar] = NULL;
+	ep->num_ib_atu_indexes[bar] = 0;
+	if (!indexes)
+		return;
+	for (i = 0; i < num; i++) {
+		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, indexes[i]);
+		clear_bit(indexes[i], ep->ib_window_map);
+	}
+	devm_kfree(dev, indexes);
+}
+
+static u64 dw_pcie_ep_read_bar_assigned(struct dw_pcie_ep *ep, u8 func_no,
+					enum pci_barno bar, int flags)
+{
+	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
+	u32 lo, hi;
+	u64 addr;
+
+	lo = dw_pcie_ep_readl_dbi(ep, func_no, reg);
+
+	if (flags & PCI_BASE_ADDRESS_SPACE)
+		return lo & PCI_BASE_ADDRESS_IO_MASK;
+
+	addr = lo & PCI_BASE_ADDRESS_MEM_MASK;
+	if (!(flags & PCI_BASE_ADDRESS_MEM_TYPE_64))
+		return addr;
+
+	hi = dw_pcie_ep_readl_dbi(ep, func_no, reg + 4);
+	return addr | ((u64)hi << 32);
+}
+
+static int dw_pcie_ep_validate_submap(struct dw_pcie_ep *ep,
+				      const struct pci_epf_bar_submap *submap,
+				      unsigned int num_submap, size_t bar_size)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	u32 align = pci->region_align;
+	size_t off = 0;
+	unsigned int i;
+	size_t size;
+
+	if (!align || !IS_ALIGNED(bar_size, align))
+		return -EINVAL;
+
+	/*
+	 * The submap array order defines the BAR layout (submap[0] starts
+	 * at offset 0 and each entry immediately follows the previous
+	 * one). Here, validate that it forms a strict, gapless
+	 * decomposition of the BAR:
+	 *  - each entry has a non-zero size
+	 *  - sizes, implicit offsets and phys_addr are aligned to
+	 *    pci->region_align
+	 *  - each entry lies within the BAR range
+	 *  - the entries exactly cover the whole BAR
+	 *
+	 * Note: dw_pcie_prog_inbound_atu() also checks alignment for the
+	 * PCI address and the target phys_addr, but validating up-front
+	 * avoids partially programming iATU windows in vain.
+	 */
+	for (i = 0; i < num_submap; i++) {
+		size = submap[i].size;
+
+		if (!size)
+			return -EINVAL;
+
+		if (!IS_ALIGNED(size, align) || !IS_ALIGNED(off, align))
+			return -EINVAL;
+
+		if (!IS_ALIGNED(submap[i].phys_addr, align))
+			return -EINVAL;
+
+		if (off > bar_size || size > bar_size - off)
+			return -EINVAL;
+
+		off += size;
+	}
+	if (off != bar_size)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Address Match Mode inbound iATU mapping */
+static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
+				  const struct pci_epf_bar *epf_bar)
+{
+	const struct pci_epf_bar_submap *submap = epf_bar->submap;
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	enum pci_barno bar = epf_bar->barno;
+	struct device *dev = pci->dev;
+	u64 pci_addr, parent_bus_addr;
+	u64 size, base, off = 0;
+	int free_win, ret;
+	unsigned int i;
+	u32 *indexes;
+
+	if (!epf_bar->num_submap || !submap || !epf_bar->size)
+		return -EINVAL;
+
+	ret = dw_pcie_ep_validate_submap(ep, submap, epf_bar->num_submap,
+					 epf_bar->size);
+	if (ret)
+		return ret;
+
+	base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
+	if (!base) {
+		dev_err(dev,
+			"BAR%u not assigned, cannot set up sub-range mappings\n",
+			bar);
+		return -EINVAL;
+	}
+
+	indexes = devm_kcalloc(dev, epf_bar->num_submap, sizeof(*indexes),
+			       GFP_KERNEL);
+	if (!indexes)
+		return -ENOMEM;
+
+	ep->ib_atu_indexes[bar] = indexes;
+	ep->num_ib_atu_indexes[bar] = 0;
+
+	for (i = 0; i < epf_bar->num_submap; i++) {
+		size = submap[i].size;
+		parent_bus_addr = submap[i].phys_addr;
+
+		if (off > (~0ULL) - base) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		pci_addr = base + off;
+		off += size;
+
+		free_win = find_first_zero_bit(ep->ib_window_map,
+					       pci->num_ib_windows);
+		if (free_win >= pci->num_ib_windows) {
+			ret = -ENOSPC;
+			goto err;
+		}
+
+		ret = dw_pcie_prog_inbound_atu(pci, free_win, type,
+					       parent_bus_addr, pci_addr, size);
+		if (ret)
+			goto err;
+
+		set_bit(free_win, ep->ib_window_map);
+		indexes[i] = free_win;
+		ep->num_ib_atu_indexes[bar] = i + 1;
+	}
+	return 0;
+err:
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+	return ret;
+}
+
 static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep,
 				   struct dw_pcie_ob_atu_cfg *atu)
 {
@@ -165,17 +339,15 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	enum pci_barno bar = epf_bar->barno;
-	u32 atu_index = ep->bar_to_atu[bar] - 1;
 
-	if (!ep->bar_to_atu[bar])
+	if (!ep->epf_bar[bar])
 		return;
 
 	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
 
-	dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
-	clear_bit(atu_index, ep->ib_window_map);
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+
 	ep->epf_bar[bar] = NULL;
-	ep->bar_to_atu[bar] = 0;
 }
 
 static unsigned int dw_pcie_ep_get_rebar_offset(struct dw_pcie *pci,
@@ -331,11 +503,27 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 		    ep->epf_bar[bar]->flags != flags)
 			return -EINVAL;
 
+		/*
+		 * When dynamically changing a BAR, tear down any existing
+		 * mappings before re-programming.
+		 */
+		if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
+			dw_pcie_ep_clear_ib_maps(ep, bar);
+
 		/*
 		 * When dynamically changing a BAR, skip writing the BAR reg, as
 		 * that would clear the BAR's PCI address assigned by the host.
 		 */
 		goto config_atu;
+	} else {
+		/*
+		 * Subrange mapping is an update-only operation.
+		 * The BAR must have been configured once without submaps so that
+		 * subsequent set_bar() calls can update inbound mappings without
+		 * touching the BAR register (and clobbering the host-assigned address).
+		 */
+		if (epf_bar->num_submap)
+			return -EINVAL;
 	}
 
 	bar_type = dw_pcie_ep_get_bar_type(ep, bar);
@@ -369,8 +557,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	else
 		type = PCIE_ATU_TYPE_IO;
 
-	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
-				     size);
+	if (epf_bar->num_submap)
+		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
+	else
+		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
+					    epf_bar->phys_addr, bar, size);
+
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 7ca9d0f6b7f2..8f170122ad78 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -306,7 +306,8 @@
 #define DMA_LLP_MEM_SIZE		PAGE_SIZE
 
 /* Common struct pci_epc_feature bits among DWC EP glue drivers */
-#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true
+#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true, \
+					.subrange_mapping = true
 
 struct dw_pcie;
 struct dw_pcie_rp;
@@ -487,6 +488,10 @@ struct dw_pcie_ep {
 	phys_addr_t		msi_mem_phys;
 	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
 
+	/* Only for Address Match Mode inbound iATU */
+	u32			*ib_atu_indexes[PCI_STD_NUM_BARS];
+	unsigned int		num_ib_atu_indexes[PCI_STD_NUM_BARS];
+
 	/* MSI outbound iATU state */
 	bool			msi_iatu_mapped;
 	u64			msi_msg_addr;
-- 
2.51.0


