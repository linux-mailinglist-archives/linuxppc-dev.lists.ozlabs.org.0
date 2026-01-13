Return-Path: <linuxppc-dev+bounces-15604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BEDD164E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 03:38:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqthT64kZz2xWJ;
	Tue, 13 Jan 2026 13:38:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.125.133 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768271881;
	cv=pass; b=F+ebrfjLzf91P7B0fbamIUSb7qM9mWBpI00yDl0HLGGb5Oktq0FFpmbhUicp7W+6GgEADezHROPdErIlVPOs7+tzuwKL5awFfcCd1+gMPu4SkoAcNVWrSFsOQnFfE2DpE0tQjIDpY1sXFvQel60KuiVB+8WOcWjSrhKhF6q3qLBDDwqUOO/M7vLuXV819ef/FLuXP3plto9oXXZ6ui0XWRwa80T4sVGtKyBDfYionWJYbibOPNubKAGZDwkhlVg3M9nDFboF7xyPTaWDFSCw00unlUCFI9tMjr1Jm0WFbM2hdXEq3Ylnz+YWue2WxTBKS89Z9MvGW33ADSFZdc4tDg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768271881; c=relaxed/relaxed;
	bh=cRXIqIwsuJBMeivlP/0+QY+PYXeZgOGtLBAtu2rTABE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mixZT9XHK1+EzZVP4SCw86OkTiCbQsHtyeXjfXDSvc/+7RReYOVqWOCS7AEvowauHeRA+ft8qHyfxbrTAn2AiT5oP5R0wqy9bv4AtOQ+BVyhDSCQFwNIGYpd0CoEX593JUrcATnMwNOOCp8YJy+IogAliqsvl5KjO9cY0gzA5jIJOdBkE8NGLLceCG22fWJAAwsXgE47fTqCjfUPQo8gZdN5QjzaYbkjzvlhmObsD3LW5hHVbBiJ22x7ZuFStVR4ycVkFJo3ezK+LB8hWAY4yMTUU0ZcEG2gseNCJqT15k73mjfAU7Qpx2gVbSmDM5nEKZ43v0u7ig2MKQ+8Qv5mhg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=TvTkjzrm; dkim-atps=neutral; spf=pass (client-ip=52.101.125.133; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=TvTkjzrm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.125.133; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021133.outbound.protection.outlook.com [52.101.125.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqthS2qPNz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 13:37:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntWOVu6bh9hRSh2UPOq3v+9L5XW1N5mwnT8mnZq4Kwhr0QAKXhVmaTRqBaD8GOlBI57YY5Sw48Fv+foET0bZRDd6RloRDkSB0yqGXCrbW1znXQ/9X45FkPD6fsMyqdvhJvNrL1JutqTc6e+/gIMNM8aC/bg0LP/NUikXI5oALj4OU5JNddbQF+rIDIHfmmV6NYgMyr3zRzbKNlytqcwCSn8XJdOSS6NCnjCbbbSy5nKHo+57WsK+3RTAcUtC5OmpArIGYqABjp8JF6O4TU3wISCpog/jtAze0hkEFwm0O0hKtL0hxVu7li0lXfcDa57qTRJySRjbTKxv5CasQP+lMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRXIqIwsuJBMeivlP/0+QY+PYXeZgOGtLBAtu2rTABE=;
 b=hybXjbdUKspEgN4KXCFA3kivvfPwBuGaur2XnI+iNQ/Kl4f2MAQfjkEGCXKes79R5mM54w9qah4+1dhL0lMPHI6Hnpqyh4LOjU7Xd+bsk8VuqEXx1fRGmr52jziSC4nWYT565R1EjvgiLpChuF/kk+pfCfbOll0PTGvKPdMiVZEWe+2En0DsoUj1qTBXG7CaSODbwRz5j+zsj29ARy04joDr10L6GACPmC0OgTGdg/J8AfBHWA51Zh/Xh0TlMx3s+w8d8AIn0uBeuk3mo+YwGTNYrOr1m1XwUViaF6QYSoXVg02DVUsZTL4hpfgdRKB0UNDZEFCh+PkrARzTmK+P5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRXIqIwsuJBMeivlP/0+QY+PYXeZgOGtLBAtu2rTABE=;
 b=TvTkjzrmIJSiWcbUMKQ6NKl5xlyknq272q5mq1QcT4RrYSNM0kF7nbRPW+OoLE223gdeRoGYi9fbTGSYvnBQJ1zG8z9xa70/v27N+ANANMSw5HYQ16Km0dFjjZPcSKWVgxffNHmrD4gfLOW2F27vRkBCmPGLqjPt/wJ/ilJNVM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6708.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 02:37:19 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:37:19 +0000
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
Subject: [PATCH v6 1/5] PCI: endpoint: Add BAR subrange mapping support
Date: Tue, 13 Jan 2026 11:37:11 +0900
Message-ID: <20260113023715.3463724-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113023715.3463724-1-den@valinux.co.jp>
References: <20260113023715.3463724-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0177.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d9263a-2886-4ce2-1102-08de524cac19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mAU3ttSD8LgX/5qQSNJJvwT5BFcF77KW1ER5ejRnZDg3WH7FS+kRCRQ/wUnf?=
 =?us-ascii?Q?4KdbfDe6GnNddHuUPjKUss2TxUGAa23x6fs8XPh0TQ6Hlc11LKDDHEuRskIF?=
 =?us-ascii?Q?IrtoyeiAjTodWfVNFrAU+Uk5nJObpTuEkDrw7tDFUbfyf08weLy3Qi5jC3Gq?=
 =?us-ascii?Q?sm9djuWrgbMYuWXmCAHQ74EVXM0DvH/FgrL8OYfdeuwbinm0fsIBjvvTVYjO?=
 =?us-ascii?Q?sWWw7aSNFcrACl98h82/lvjbS4w9zn1Loc++78r2sE61akWnXCe7aYaa3x2d?=
 =?us-ascii?Q?Q31LqFwGg2fljoKQ4OkXjl52Q3IVDKys0FOHlEuCGve6K0f1LPcnx4P8mZQ7?=
 =?us-ascii?Q?/lH0wHoXm69uRl0CQD8rf3tXVD2vlNH63cCq+NT1hFFv9N5gdnn8lxdFKI45?=
 =?us-ascii?Q?bILXJeKfBWGmU4Rf/QQ5doYmNa+2GhwcQqYQo0fpVlTPBvKNUY/45bzTOqqn?=
 =?us-ascii?Q?uP0XLZSzLwNPlH2k6nYuxHJvvEl48JUw/7oWM9+ohzt5lRaOkyVtj9evxFHR?=
 =?us-ascii?Q?HXqhpXnuxjPOCJpWsXXcwtm2CQZMfyDIVuQYW6SFcnyyoM4yV808TWbB+gqg?=
 =?us-ascii?Q?26eOFd3vg6UPGyD3QmGL03tqrt67uWvoJ381LGc3C1w3kTo61zmnjpLiIaau?=
 =?us-ascii?Q?H8Wqxupk413hWDFlJyg0eso0bJxdl8DIDNRr4FEXJrDAzgCqU6j29c53M/qr?=
 =?us-ascii?Q?WRbbn2y4lS4Y2PehzJTPYj9G27cMckVL7x5GjG+zBK9O0lSsRX3c3RWamsxk?=
 =?us-ascii?Q?EZDiPoEwk7/jKNwlMBjUirV3Zm6xy/PM0NCEzQ0+FUic06la/5UMf/j7CAaH?=
 =?us-ascii?Q?R2mVozCBBWcagqKfVJuGbwPuWy2yLfe43JDj30a5K5DXk04RUGUp3P9NuZoF?=
 =?us-ascii?Q?7uFYk0ixCBAGTMiFOYtg4jTmUv34Pvr8zAu3nqchlB7JWOImLsYUz0uRbfpP?=
 =?us-ascii?Q?LMdxPF6xqQURUR40/vQNVl7MszG6+IVxdisb/uN7kXGJrPYL93adlJzjAkY7?=
 =?us-ascii?Q?2ZmSaEY/33THlQNeubQ6C6CgKEHqmDtMydhmqJGTxtBMpPC+zGeF4UcwkSze?=
 =?us-ascii?Q?I1iU5uOhsqhpjSQytO181l17PNUmgslMnGexTwrFe5xQtaU2S3RwSiQLmJha?=
 =?us-ascii?Q?UZci4YCrFfb+LdrCFTbqiW62Vh8hY6iu8+xlDxGRKBlxKHxWTksqAiTjuQUn?=
 =?us-ascii?Q?OVRq3mSXRdtZlw6tj1eySxnY+fVwiyI65/y5WamfNdgHqhip8NjboGjcnkrr?=
 =?us-ascii?Q?fxiYVxxThR/AKG4tjtJouda0qvXW2N/vJJBmY6HxtQGCeNrLVdf5C8W20+oT?=
 =?us-ascii?Q?DoOnnKnRhZFL3qb2/r1G0LTj7inBaHVVewCd3SbMBBwHSC+1u3ndhDrM+LAo?=
 =?us-ascii?Q?ikmo3DcAVc2Yu1hO/EOTOZshZLl6p1vc67/Fg1ui9lFKA62nyi7dqd0C+r8T?=
 =?us-ascii?Q?iOzqXot8LCx3NUzIqHJWLuQSUyHlvs4G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hm+/UusB2SK3geFpaiDWldH8jCUjCZlMgopsl2U6ejqTaVJ0Bs5iwzT081oJ?=
 =?us-ascii?Q?iBhU7hOUsSKzJG1JjE/yDmA+U8aUScilNuYS5oZX/zXeYREGUbHccL8/L3Z7?=
 =?us-ascii?Q?JR8G1b8eN5s24v8hA9UxSeYLrYnWpO2v9FPzC0dYWJG+JjTRMv/Uag4zgVO4?=
 =?us-ascii?Q?Wy4dKtaJKGVq2OHYKcP7dHqeL5UgB44Gl8zK7eSGMlskp4kP8y8dJr+Gv/bL?=
 =?us-ascii?Q?sDmuy0gJXx1WgWguG2WOwmEwbiGd8/0xV8ZTURxysLsWsJReaV4zUVfGofXy?=
 =?us-ascii?Q?jWRzAjdkhnjwS6WYs/R7BRv0z3LmuxFkOzzGEN+4yHvkOZ46jXw9zuDbMfcr?=
 =?us-ascii?Q?jguqj7Ya+EYBpvvyxodrWyAMRSCPqvw2vGa6ThsKz/1thbJBRRNhsKoxj5vU?=
 =?us-ascii?Q?5dDBSpkwiCFshf3YjO0p4hpyoBpQj1haFksuweww+Vt2kG226vWvVDMkN/Ah?=
 =?us-ascii?Q?qZqUcKHAvcNvq+2FHP05aE7WTK9itDWMuZgrI36ACP/1JlWiGyH3qRYeJ7f4?=
 =?us-ascii?Q?25TBRfMO2LOctvn8g/s9V2oE5hu+oXaR9xV7ATZJarVVbiIvXOPlx5MTE0sG?=
 =?us-ascii?Q?QlPInpng7l7p1r1P2PR/Nij8hp8R8f4CFi/K+NYfm0IlOBT4flyRlqSVKJL0?=
 =?us-ascii?Q?VI+zROorZntpt0+u/tuNQpnY+dAXijlGlgv+RzjaJ7YCiAaZKU1hUoHmnn2N?=
 =?us-ascii?Q?CQWrkfKscyFQLihg9j19FiPVlxJq3CeXoWUFgjR16x/Op8xDdfWXq/4b/YQ1?=
 =?us-ascii?Q?xHmkvY8VR8gPdWX90og5/XsSEgUEmmwm9Xf8F0Bi7NmckPQBsFoYRAa7iWWR?=
 =?us-ascii?Q?GoGA0v4HGzT71Gv7o8nOUVgB1Qg7I1p+csym/teSZMxBa1hNOhcqhiH6IBl6?=
 =?us-ascii?Q?4KyMlgen2kNfS4Cnvr0HOqvi8QLjStElESDDl03c3Z01cLRpu//J7CKfbctV?=
 =?us-ascii?Q?lFsl3crCTj4734tJCD8JH7TCAkPoxqc/7qpQZGeEHoJw9WiXihblc/yXveyZ?=
 =?us-ascii?Q?zzeE4t1x9I0POp7Y4ZAibfHm+8Tr+EGpVA3o3HKswwvgAf/KnfRmaEtdLcn5?=
 =?us-ascii?Q?ETDn//DO++bXIuiYvy7LlIxnZ2OqOsd1FXdpGB+MXDUiz7atYOSmc0ZTnp9m?=
 =?us-ascii?Q?tub6KCC7BByUFjgdcWf71qS6GY+eM0XSnEbk5N2fugdNhi/ig/Lm7KbIrqG+?=
 =?us-ascii?Q?k6m44UNRQhR/4sRpMjwS5KwdY8XyRNmL0XYKenEtdqQXlNzpn+3xXN8Mr75e?=
 =?us-ascii?Q?gtVPr99O3hRZHJxiFxN7fqcxXPZtZGU83936jL/QaoiMWYV7N2u1nLngIm6C?=
 =?us-ascii?Q?s1Rylx4bkpCkNLRHwj+StxI0CztTRuyMEW8ZF4qAtLrL0n+QaPCwy5u16K8C?=
 =?us-ascii?Q?R0R5nIB6u8w7pLHks7k/QmfsDcXn/Kb4bQxbReLRXvDlktKvQ5evY6qChZy/?=
 =?us-ascii?Q?AwohNlToVRGOjpI3xY/9sOufQI4r3XVtZchFEZcYZtPBRKL5UdnB36QY/0OB?=
 =?us-ascii?Q?uUv8w0BZ7qhmbmwvhIWaudgjOGKyf/dkwV91Oq+jphwR3wV8LMbQA2H+asHw?=
 =?us-ascii?Q?Q8D6jmyQj2appCGgUXchTqOWPT+J3ZIL9pQXdu79O27C2Xb1/2w2MERWk7bo?=
 =?us-ascii?Q?nI0Ip0Zv6fiKCV9fAfu+NQBfwNKy/hNosVFAEBgRRQzvaLlyzq/Ahk44xbwD?=
 =?us-ascii?Q?tGmiyfed52fAqrS/CxGE9i3gMZHgucZHTnsqpLjZE7kWSo1d9Xor0ZmKZ+9D?=
 =?us-ascii?Q?QNqSp4xCjTwg4Mo6KzhaUzQ/dwP2ILPtTru3QmNA1FEvHkvuSMPH?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d9263a-2886-4ce2-1102-08de524cac19
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:37:19.2169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BsPXhAcigLAx6TzNLHb1OTJEwSWwG3HZennNPO3HE2/KnEDnVDTeelBx41h61GOc+kP29mSOnwvThvQGifSTKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6708
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extend the PCI endpoint core to support mapping subranges within a BAR.
Introduce a new 'submap' field and a 'use_submap' flag in struct
pci_epf_bar so an endpoint function driver can request inbound mappings
that fully cover the BAR.

Add a subrange_mapping feature bit to struct pci_epc_features so EPC
drivers can explicitly advertise support. Make pci_epc_set_bar() reject
use_submap requests (-EINVAL) when the EPC does not advertise
subrange_mapping, to avoid silently accepting a configuration that the
controller cannot implement.

The submap array describes the complete BAR layout (no overlaps and no
gaps are allowed to avoid exposing untranslated address ranges). This
provides the generic infrastructure needed to map multiple logical
regions into a single BAR at different offsets, without assuming a
controller-specific inbound address translation mechanism. Also, the
array must be sorted in ascending order by offset.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/endpoint/pci-epc-core.c |  3 +++
 include/linux/pci-epc.h             |  3 +++
 include/linux/pci-epf.h             | 31 +++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index ca7f19cc973a..8d809a2c3ce9 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -596,6 +596,9 @@ int pci_epc_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	if (!epc_features)
 		return -EINVAL;
 
+	if (epf_bar->use_submap && !epc_features->subrange_mapping)
+		return -EINVAL;
+
 	if (epc_features->bar[bar].type == BAR_RESIZABLE &&
 	    (epf_bar->size < SZ_1M || (u64)epf_bar->size > (SZ_128G * 1024)))
 		return -EINVAL;
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 4286bfdbfdfa..898a29e7d6f7 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -223,6 +223,8 @@ struct pci_epc_bar_desc {
 /**
  * struct pci_epc_features - features supported by a EPC device per function
  * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
+ * @subrange_mapping: indicate if the EPC device can map inbound subranges for a
+ *                    BAR
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
@@ -231,6 +233,7 @@ struct pci_epc_bar_desc {
  */
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
+	unsigned int	subrange_mapping : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	unsigned int	intx_capable : 1;
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index 48f68c4dcfa5..91f2e3489cda 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -110,6 +110,28 @@ struct pci_epf_driver {
 
 #define to_pci_epf_driver(drv) container_of_const((drv), struct pci_epf_driver, driver)
 
+/**
+ * struct pci_epf_bar_submap - BAR subrange for inbound mapping
+ * @phys_addr: target physical/DMA address for this subrange
+ * @size: the size of the subrange to be mapped
+ * @offset: byte offset within the BAR base
+ *
+ * When pci_epf_bar.use_submap is set, pci_epf_bar.submap describes the
+ * complete BAR layout. This allows an EPC driver to program multiple
+ * inbound translation windows for a single BAR when supported by the
+ * controller.
+ *
+ * Note that the subranges:
+ * - must be non-overlapping
+ * - must exactly cover the BAR (i.e. no holes)
+ * - must be sorted (in ascending order by offset)
+ */
+struct pci_epf_bar_submap {
+	dma_addr_t	phys_addr;
+	size_t		size;
+	size_t		offset;
+};
+
 /**
  * struct pci_epf_bar - represents the BAR of EPF device
  * @phys_addr: physical address that should be mapped to the BAR
@@ -119,6 +141,10 @@ struct pci_epf_driver {
  *            requirement
  * @barno: BAR number
  * @flags: flags that are set for the BAR
+ * @use_submap: set true to request subrange mappings within this BAR
+ * @num_submap: number of entries in @submap
+ * @submap: array of subrange descriptors allocated by the caller. See
+ *          struct pci_epf_bar_submap for the restrictions in detail.
  */
 struct pci_epf_bar {
 	dma_addr_t	phys_addr;
@@ -127,6 +153,11 @@ struct pci_epf_bar {
 	size_t		mem_size;
 	enum pci_barno	barno;
 	int		flags;
+
+	/* Optional sub-range mapping */
+	bool		use_submap;
+	unsigned int	num_submap;
+	struct pci_epf_bar_submap	*submap;
 };
 
 /**
-- 
2.51.0


