Return-Path: <linuxppc-dev+bounces-15654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97965D1A3F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 17:28:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drF6L39cwz2yZ5;
	Wed, 14 Jan 2026 03:28:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.125.101 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768321690;
	cv=pass; b=oOnw15tDw4bVkV1YafpEBvg55ppkH2vmz2ekMnppngS0Tee1rR4XA3GayFSSd6A8bqhIJbMK5/jGfRqT6+iV+Pjvdh3xV68DVeRnDVwrdIwh6qdVfS7f6Nr1Mq3+wQeReui9ymrEqDBnzOQIWwCzO3W/5+SMHqG8adlTJX67aqwUuqJIKfr+WH78BoHP0cPz62e2SQKO0QjpNCvhBTu/b5T6FgVKUWK0MXTdYXU9Rlt52eul8A91pIyxpdvb8MNQ8JwJaGsGpvxGaWw5/vke6Vw1wMSmOKhIT7PoiE5xBj27GEGKVHnl4nvwjBg7PliN2Sy1y7UQ6ciQ6PqfhK/8Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768321690; c=relaxed/relaxed;
	bh=4Sp+AC0JcUSb3yhrypuBDJMjO8i0vbannE5uonMYB8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D14zFbFmbxKHKEoP8/+E+JKKmH9OChtEDFqfmpJ+AX6x02X7COJmr/pjb73cmFRLh90rVqx+J4MnYvjMRYgtwhB1B/RPTcGE6zO6pQXLlM9+xBgtCjrhnHw1ehE3aOW7aAIiTxZWE/kRtPwrlFVyzddnkvWPeZKBaqfinCytR9dQGPLn6RsWQSaIwLo8KpLXinTbxlTUCx4rAGPRZ7XQGcHF+xchFLKijU/5C+gMyK8wboAVVerdWJI6Mw4HN2BIYh8x6TCzodlk21Hkk95kbMwMKL/KOtHk+0Os0CQ6Bw32J/Anxt8TUmgTWwCdomMe8U9ZxI3CTRY9+Wg0I0YQjQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=NjTx6fqi; dkim-atps=neutral; spf=pass (client-ip=52.101.125.101; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=NjTx6fqi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.125.101; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021101.outbound.protection.outlook.com [52.101.125.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drF6K4r0Nz2ySq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:28:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLfhDxqk/k/J5uMyyLifDACpB7bxflQTI470HsYHELjm8nZ/J+W6sd/d5QIMnXz/E4SOft/t9wUHFvXFX+LeMi5OyWoRXEjQ1MM6Mpj62s8GmrOPXgkkhUHfJr8t6yJq7nGaQ8ZYMCCulLirmFnQTRyrLyM87U7DhaIpYKELDqZEL0uxRRMDNOhSxne0uCU5nWhbny0BLpmEJYQSH93Zs+xE4rcXFZS3VP5TBhsuJenx5Vs8E93/xGyKdwYDr+j1J9KE4PDqJNEFZ+ydE+m3ihloRhaEfAMOD1316HVp8v33QaZWBYpi+P0fW7+YVfiz4JHYSfi7/pi3b3LZtz5MWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Sp+AC0JcUSb3yhrypuBDJMjO8i0vbannE5uonMYB8A=;
 b=vocMMXnWQPzaJbwF3SZzEvBnvIFckEeaGm3TcKrd2jj894+lJeCNwt7ZUtCCqku7uGRVEZgKnCQc6RSCRauBvMinB8P4xEbOBgYkAIQZVDLc8kubKDebh5EAVY9neJ7eXuVV9p059Oc3dw+cKkFgnxBlVcqcvuq2X4zIDYtbrXcZ5nOMndXdVCHdkIrLAhvzhOsZkaId0W+ZLyvc4KC4JXS0oYiEeWP1MrhjGnDuVmXakv76UXcPuYzaIkBBz1jS+12diCLWPpYgMQ9UVel1uM0DRlJdCWs0aBAuz0fg8EUtkpt8x4FNx1iIFAqRn7w5jad+rNQ847xaWwKC7nExcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Sp+AC0JcUSb3yhrypuBDJMjO8i0vbannE5uonMYB8A=;
 b=NjTx6fqib9+ViCVBV1Jpe0z3T7qhhWh/2UZ2CBXl7byUSZBJlAwV3DWC/Oshtq5QPG830ZIO1Jkm8rTVUwnGcaokrtcy/yG9zPlktFhVtfKVpyBSOgMdkgg+dSUvkONJ1dQc0mfuDvGN6fhe5xAliVo5JaHGoPT1tvnIy5+bZhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB2282.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:13d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:27:29 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:27:29 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org
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
	Frank.Li@nxp.com,
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
	linux-tegra@vger.kernel.org
Subject: [PATCH v7 6/6] Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage
Date: Wed, 14 Jan 2026 01:27:19 +0900
Message-ID: <20260113162719.3710268-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113162719.3710268-1-den@valinux.co.jp>
References: <20260113162719.3710268-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:1::26) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: 161d4cf4-b79d-4b65-ff8b-08de52c0a572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fCWf+S3sLvWqvaYHIW87OZV7ijNlYmXhkBS6H4WrSF3Gv1+n46e8aRlNkUaN?=
 =?us-ascii?Q?odVczY3jAWaoFj5Ym09snTCHrVS+04IcvlmqObxBYeeF2eww8JNIPGX3y3bp?=
 =?us-ascii?Q?BGnMefyjrr4v+FQZhDUIrUOG5yh7xI+7vnM2Nuu+2H8jM4igHevpZ3SNu/ww?=
 =?us-ascii?Q?55k/73RyrSQTB6oROBQdbUzdWlpZhkxQQys8ByDfF3R7dF5mDQ3Ywo1MD1vn?=
 =?us-ascii?Q?ytDX0AMSoHJj3zTojcTuT7Gi3KG1uSWmPpiTZiI4KF8kCgzctR/EnH7H/sUR?=
 =?us-ascii?Q?v4MwNbvjFSZBFawRJl3WcCR8BEh0KkmrLhAYjYKkWM1FME4aAzs8sBqw4us3?=
 =?us-ascii?Q?f6HKiMEql+zQ1MR/ip6KSX72j5RRcXH21erw8/idD/ICZMoQZJXUOS0vVy6A?=
 =?us-ascii?Q?+agFPWjJipn8CNPM3+sBAeJ1titqUogM+5aAXoQR4IkUIa+78y+UwEdDIvu2?=
 =?us-ascii?Q?u3tTQ4C7AH7ocNzoNgJLv4RNwtoAutUeVzV3oaUQrcNyB4VbzxVtQh3GNHxp?=
 =?us-ascii?Q?IDKA8bYYj9qSceCbC9hbUu9mGVo0PPsiiLLbRfl10V5k6kyL6g8Js2bthArz?=
 =?us-ascii?Q?8NOFCTdtrIpeEFHRJg+w38mbAJjN2jXs5ghIfoyciEtyIVbCp5l3u6+ISG9y?=
 =?us-ascii?Q?DJv1pbaUPmN7+y3mqCVNxc1SEVX0GG6SgUBw5/dDVuYlfVLs0bmfI1AQ+uet?=
 =?us-ascii?Q?uW0yDHyY6NdJ43v8soXHB+1uwfves+WGCtfnA2dmdjjRqP6q8GDE16F6/RiT?=
 =?us-ascii?Q?D8o/EWqJ3Hg6qm6oc667ViJF2rVbNxc3ndDIS9oTCRKdZINVIjWzCPt2i2SV?=
 =?us-ascii?Q?0Z3plQ6x6UAElu4VjusSFXs62Y5EpQ/MENUxO9pG31YwUffmh4LImjXkRStX?=
 =?us-ascii?Q?Im8pfywdxERE71uPTbxQxxY4RU3YbbKqkJMuRWjIedsW6kkjxn0z2tFpKcy/?=
 =?us-ascii?Q?Ppq01nAzXdJtSxCosITPW4X32VwsVZmm8Ns2M7uPAyx/Lm4d9jmwLTGt+Qxl?=
 =?us-ascii?Q?EezW3aImBicsIIfvnxHjQcsXk/dIJJxJwHT8Y5Ci/oj/jZsC9Mkye5NzQp1/?=
 =?us-ascii?Q?i1BHi/OMKigRcanwFf5mrVFgEwGKp51IypWiEN21cIPOCiTkhjmOzdwIqcSb?=
 =?us-ascii?Q?Y4fLLqniMf+IcbE2RRjFvjtsdG+E2CL7idIzV22uPMKAqSJQvxLuB+F5CSYy?=
 =?us-ascii?Q?nVy1l4d8sBUME1zM+ADqcGavfIq7qq9Lnoy43XD5Q/lVrNYUQlEsMnGNyLcC?=
 =?us-ascii?Q?4fzoCyz9J1nw8AQqvI0wJ2C1WIRqZ0+y/qJF2X1HRXnb43hH3M/a34N9B58q?=
 =?us-ascii?Q?MoEtvFEWNScYvXkz5o7WcwaqQWirLSHJvnRXMDLQADYZA99dRZ+WZA/JggD5?=
 =?us-ascii?Q?Z0T94z9CnhanW9OfJJ9l0PdtixkYdkCw2ETE1BEsjlQ5ayYHwXzaAVadBNbV?=
 =?us-ascii?Q?dySFVF4xqqjkc/nSQf81hKlH5XbEN0Vb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g0674DZ1gDrUeW5GfXBM8Zn4b/VR2EuZ+g5sPZmTbqLZ2/AOEfZTrM3J/N/f?=
 =?us-ascii?Q?6CFgbw9TwQKGDZedlDycAOOWZXrPchFwrCGfCZiqEbHdVZXC9/OToFUHRUVW?=
 =?us-ascii?Q?ZFGMbIkibUbFSSEmoIK32npUqGL2Vt0FDqPjaloNMpAHORxuMkerw5nq3QzW?=
 =?us-ascii?Q?dHdx1DFlN0reB7OkFHv8SLpOJ00U6p/O4XZYLs03JPPp1i7/FSrbei1co7vg?=
 =?us-ascii?Q?b8iTwgl7f9KkdBAAVj1KeNXKf366cl95QLySAl+ZA2TgNM09KABe5Rz2zVLm?=
 =?us-ascii?Q?FKUXry+dEC0+gpGYdo7MqWG1LS/p2X/6Oed13VTwB0+AHg1aBxKdV5ZN/Dw0?=
 =?us-ascii?Q?CWVrxx8q6myyXo3H/lTog68PZyFJHL94kMlVAfLxAbBvGbPodT8SGdkx5o+S?=
 =?us-ascii?Q?5KLMy2WOjlKG3NYUTyD8f6Ajl5F+xmt9JKtgVyoicfPO20Xu9Xx9QgoDARqN?=
 =?us-ascii?Q?WBFM8K1czmh4ZjwmuiFppi95RC7qB0cdAxVQhKjivrhUEcoCgfLC9Z1owSa5?=
 =?us-ascii?Q?vxon8CtmDTpsW0K6oi957xgw5dDROytKNmzyexcE3ErXEgxCpU1LBzUN8gJm?=
 =?us-ascii?Q?58EjAroBFm2ONWcEXX7hD2G3vHJUkvfHxvwAy3v9EK2WtA5nU909j6MnP+8K?=
 =?us-ascii?Q?6LCKS0A0MsR/GfD2VvA3FQx15AJYQ+O8FCBDZ6D6brsDZ1rxzT2GZ1tkvOF8?=
 =?us-ascii?Q?RHc+vBzo+Wz1CFL0tEPN5viU0lsS4PFjw23swhn4Ccy5bOxYsGtOuBtuOiQ4?=
 =?us-ascii?Q?McCPGOKUezazzocHx1GQYlKzW/N2km1xV/k/Qr4w1qfWmvDY/+p41ribWRv+?=
 =?us-ascii?Q?I9tMoNrI85zK8sztR3fwLGQ+Lueoxb6zz/ve/dsuTdqJLb9x/ZrumUWPp9lc?=
 =?us-ascii?Q?2BcXjMP/7QhKL/jFXANa8kt1ypYkC5jmDfneGVNKfaFE2/Ddj3+JRHzSp/Tz?=
 =?us-ascii?Q?sLKihCMBLVoVpKQ1Ad9wadg8NPNePCaCxNE+mvGwVTU9dMGRmicabEG2E3xo?=
 =?us-ascii?Q?CReema4mS99N1Ok/VM24Z8rGmBuVnI9wccEMMhB+vLpUlzi2LMXamPGYcDgs?=
 =?us-ascii?Q?Dph3A5ls66v/QHOVYXd/KBmZQG0OJnDmQqOrf51ieFngLGDwTxzfhRVbWUCP?=
 =?us-ascii?Q?gcCXWW3/LJ7Gk7NP5YW9GlhIwskvVxTkYm6fdqTKG7i9619u707yyWIQ7/iW?=
 =?us-ascii?Q?BaZME5fYRiLIh/BU5QKR+Qp4REz0tThlLIJb9lT4MT1MvNdbB4Y7vwZqUcy9?=
 =?us-ascii?Q?Es+S6wtoVslPWKZMYdTA1lVs4zgl2nDTbpn/vY3ziFDKeTr9sBpnwzAgJUFc?=
 =?us-ascii?Q?bn80Oi9aykr6OP6d7B5GyzZSRNk6mWYukX9snpB773+ui5sp5UuL8PlLL2nI?=
 =?us-ascii?Q?c7GS/fDEU+seyO2CJRcsrH7ZLkfA750DTkNA3ljkQTKJfdCGv7xPy1FSiMTa?=
 =?us-ascii?Q?/XisuY9XhZfqjSeemikGMajau7TpW73pvR9z7BvBObju8UczPUYCJkXNHYpa?=
 =?us-ascii?Q?5BFpHFY8/5nyou77xZMV6xcEsyGMkKTspl4Zrty8jMdSNg59QS8MQY5Z3fxR?=
 =?us-ascii?Q?PHdLseIfI4oJfonRRNV52VINAc++wBfTHGHRkZY26JhzbP9CbmfAR+4wu5Xu?=
 =?us-ascii?Q?yR6YUparWdyjE8FNGKWuxSBFDVy6RHKfddjBNJHB5eL6q1If9rs9UXatqUis?=
 =?us-ascii?Q?WorC/jDwdnC+Hqi3XIjHD84O1nu1A3c3sEs/EZO2LO0KDNMTuoApcZpPFBxJ?=
 =?us-ascii?Q?Jf0psdomMHX/EICBvQvB++ezz2ESsJR5sBve8WxrUk7ZBFh9iFGO?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 161d4cf4-b79d-4b65-ff8b-08de52c0a572
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:27:29.6638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZOLrORzW8i1B2SJvCZN9GeKYjqvmcYHYPO+Ic8NB2mB+w6skPWD1nJr7WpsTlhtLfheXgCOwZtKnVeK0IR3BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2282
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The current documentation implies that pci_epc_set_bar() is only used
before the host enumerates the endpoint.

In practice, some Endpoint Controllers support calling pci_epc_set_bar()
multiple times for the same BAR (without clearing it) in order to update
inbound address translations after the host has programmed the BAR base
address, which some Endpoint Functions such as vNTB already relies on.
Add document text for that.

Also document the expected call flow for BAR subrange mapping
(pci_epf_bar.use_submap / pci_epf_bar.submap), which may require
a second pci_epc_set_bar() call after the host has programmed the BAR base
address.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 Documentation/PCI/endpoint/pci-endpoint.rst | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
index 0741c8cbd74e..09b892de9280 100644
--- a/Documentation/PCI/endpoint/pci-endpoint.rst
+++ b/Documentation/PCI/endpoint/pci-endpoint.rst
@@ -95,6 +95,30 @@ by the PCI endpoint function driver.
    Register space of the function driver is usually configured
    using this API.
 
+   Some endpoint controllers also support calling pci_epc_set_bar() again
+   for the same BAR (without calling pci_epc_clear_bar()) to update inbound
+   address translations after the host has programmed the BAR base address.
+   Endpoint function drivers can check this capability via the
+   dynamic_inbound_mapping EPC feature bit.
+
+   When pci_epf_bar.use_submap is set, the endpoint function driver is
+   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
+   the EPC to advertise support via the subrange_mapping EPC feature bit.
+
+   When an EPF driver wants to make use of the inbound subrange mapping
+   feature, it requires that the BAR base address has been programmed by
+   the host during enumeration. Thus, it needs to call pci_epc_set_bar()
+   twice for the same BAR (requires dynamic_inbound_mapping): first with
+   use_submap cleared to configure the BAR size, then after the PCIe link
+   is up and the host enumerates the endpoint and programs the BAR base
+   address, again with use_submap set.
+
+   Note that when making use of the inbound subrange mapping feature, the
+   EPF driver must not call pci_epc_clear_bar() between the two
+   pci_epc_set_bar() calls, because clearing the BAR can clear/disable the
+   BAR register or BAR decode on the endpoint while the host still expects
+   the assigned BAR address to remain valid.
+
 * pci_epc_clear_bar()
 
    The PCI endpoint function driver should use pci_epc_clear_bar() to reset
-- 
2.51.0


