Return-Path: <linuxppc-dev+bounces-15651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E62D1A3E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 17:28:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drF6J1Qf2z2xrk;
	Wed, 14 Jan 2026 03:28:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.229.90 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768321688;
	cv=pass; b=YpipEOCc/1SSmApZGlpZXJ5yU9AWBy8HVr8BJBKPrUHafINYd7TCL5auaFmMeBFZsBo7kySFQUDADfCTCzguFLTovLF0kaJCyDxfjd93/fSBsDlh4wEbOks6k9H+4/3c61SOefySE9ZXirwxfad4I5aIOm2YzXmMR4/9dGXuYadNi7mDZy53BPlW3Qhl+e1gfwYoJm2aimorrJMGCaDUdojguuYtNuJCOBlximf4nwtRF9vlhB94d4LJ8jOh6oyoe3yaeqyjElA3lL55Ac00ra0u70nr+NRd5HUo8fecPvaponKi6tvL0Cls5FcWFPwXTrRvXksNZfVZ+B54ioHWhw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768321688; c=relaxed/relaxed;
	bh=SKydzTgvTCa1zYB0yieRBorpZeMVX60WKsYpzkEsXxI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Mi0vv1ZK8rtfsRhIlQq0VwP5atwaVCAnXoZJ4eJOBDMNDrRBBnJQC94ihk3JsgI9hj04kX9Ulo/hr8kuGJZKLBS7rVRocgfaQcBz3jPoJY4aWhtDp1JeQiqVlradBsSf7IiTzUaahKVbXld1nEKgD0u692PDMnm2xe5ubQyVbBCdLYL03qZKY3KaSzz54th0nlhfHpp9ku44xdIVPzZfV1PCQDUA7ZHLVqNcVI2d/ketsB9H1fdzzaoXuk7toR4n/c+853kXTolxB1Cytw/bL8nC9VMIZdBu3wblyyEJRUsmI1sMLBcG8C9YIEi91BrQ4nH4kKPic7YgepbECOWORg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=Jc61lukE; dkim-atps=neutral; spf=pass (client-ip=52.101.229.90; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org) smtp.mailfrom=valinux.co.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=Jc61lukE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=valinux.co.jp (client-ip=52.101.229.90; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=den@valinux.co.jp; receiver=lists.ozlabs.org)
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020090.outbound.protection.outlook.com [52.101.229.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drF6G3J0hz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:28:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+qKJ413iop8ATM1MF4AtJSxsuSMcvkeRnRbHgY74l1s4YVuKne+R8q2xWa79sW3sDr/cY5Oa1RMAWoeYgZdnYE0HpSdb5zjqwaSJ/8fwXGEISPZd6dq0t7sfYuMcyTJlCR51tBV92eH82uz8s4f4hAH6mBZSeV87Ro7kTwuhCIilWPzKmkZLMXndR6CnSFfOleU4riUOiPzfedOB4WEO7e1Serpb0ziDCkIChB0KdpvPhg13B5daWLZue996mJWqmkHA0iuThBuIoNJq6gx/ctEMCxICDiqEjfDB7v/QzQVsmPWeQuBTV5jydhpu3ToHae2lzBCf/sk/T5X3yu8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKydzTgvTCa1zYB0yieRBorpZeMVX60WKsYpzkEsXxI=;
 b=O9JWWG/3Z7LkihAGnFLc/kqzzJmX95ShSAYlnYlyjPJ9TRDSc741yUinbiDbJQt8toBki5rXno5yciCLmT4ovZXBpJyLoYEAv2zIXOMrSWYHGMgta6SrTRWS0EbGNkq91/7T4sFaOlqPLHn6gXoBZHyTnMUa0esoj+TtZH0QccQrQ4X6z3pi3Qsm38GNJ+FJvNTLZPqVS5rgB70Ij4qbi1MInU23UjWaBYXXzhr6aTTcDJvc4kSEMpwoIgKCSYgprn/gBsO0NPA1ZaFWt6vYRE2xqBW/F4nU77Fkr8+GRlAV3OzLzsp8FsjAScaWgapl29tKx5KNSZAW9Cbzfw0UiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKydzTgvTCa1zYB0yieRBorpZeMVX60WKsYpzkEsXxI=;
 b=Jc61lukEwVWbuLSAIHC9LLhxEVbVwRcGLQWrkNM0QNwJrzv3dVdWxrj95XjwaLlXfme4YsD0zPluhNDy4c1S+ruKHZqsd4yfQAZzF8xYUgaG22zSlfPaX/J3Bb1AL7tSjbR+0PV4G5bEtHN3e91XJ5qp0pcrsJmsUCAZBQ+w4gs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB3400.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 16:27:25 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:27:25 +0000
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
Subject: [PATCH v7 0/6] PCI: endpoint: BAR subrange mapping support
Date: Wed, 14 Jan 2026 01:27:13 +0900
Message-ID: <20260113162719.3710268-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0102.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB3400:EE_
X-MS-Office365-Filtering-Correlation-Id: dafcb2cf-69d3-46cb-e927-08de52c0a2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zHaVy+tbiR075tGEzCLse254zFq2nAcdkJDL02nFfaIAmKEx+XmUhHFvUBih?=
 =?us-ascii?Q?2oErmW2bltubg6yXl9IJmrklZV44i/rC9HGenGOMrZJ2d8mK9Ew0/ZDzlugU?=
 =?us-ascii?Q?c7hmsyBej/+Co2ZXAsblsUuEuhIl90Ipv78W/OHdGMwtet33912o+Jv9t009?=
 =?us-ascii?Q?xzDiVQXLMTgu3JvvtKiAB4ZiuDB8Kr2be9LJ9R6H8cp3/vvAk0j4Sef/QycI?=
 =?us-ascii?Q?UvhceDrjX23YAuJom3ig+kJSwx6D8gOaOEl6GhgGXjLA7+rwYwhzzgENVUts?=
 =?us-ascii?Q?m/rdj4kXReKtVMoHCy7rQEK6HYrrVmXNkzbLip1oJvVjKtxZFwh6Vt0DLu+S?=
 =?us-ascii?Q?UaXURPCLqQ/l0RhTHdeZFhxipaFE1zFjBiYYBwcESFETiRvdPIzMLu+EmWp4?=
 =?us-ascii?Q?JBuog/1kKzwuxDmrY+Eo9udVJ4fRc+gfW0IIUev5Ipb+uxbA+OWDg3sGrcDw?=
 =?us-ascii?Q?5X1pp+OvWbK8ZFolIkKgASE7g07XBEwLhwO11rAJto069i7WcoX5ahW95Tqq?=
 =?us-ascii?Q?H327P8+RJXOe2mqVKqBhPgkwaTuLjYMTNzB78OsnoR+7GJtAHL6hb/DYSVcP?=
 =?us-ascii?Q?b4G9BXaYqfNUsGF3gGap9H6SOrxmuyI2aXqJa0DIhUc481QhDH62Yp1xjVmQ?=
 =?us-ascii?Q?cMf1RwPtdNtHuklCTgYIWNl3tATe0H6SaoC/joRebPwQUnqVRtNei/RQ9hSU?=
 =?us-ascii?Q?4KfMQwbmseHbHLsg/aVdnk2tswV7vdrsR9bUUGlQ5emazykBtkQptK4aN0FK?=
 =?us-ascii?Q?Zl+rB9M5opHXoda6CJaDBEnEGxrt8miPVXraOguhW7Zt9k+DdGM+8fxr8+pX?=
 =?us-ascii?Q?E018cR5EE8qJKa4WQ3LbHk+GNsjTyCJNwOFRE7m6ZyIwNHRd9kienjQqg8CK?=
 =?us-ascii?Q?bF3XLBrj8IiF4TODqG1VB1NzUgIDevnI+A2V81ojr//LvV1+GINheAjKlQtB?=
 =?us-ascii?Q?UbWsH8TIiwLmfYPXRy26omjlpvTYvahVIvvVtv9/ACXW8RuTMrxpNoCEpYC0?=
 =?us-ascii?Q?fP6tUugwUfFwsdqCF3ROf51qxzfHJMgqUQTJisQCRBKmx4/cbcNBdKHznM21?=
 =?us-ascii?Q?uyORJzLcJtKxyPJS48K8+/AQ6nNDqnXwTjv3N+FvalBKcVSkfDlmkkejZzOM?=
 =?us-ascii?Q?gtOBg16Q/xFhr7b6T7NieRVSARYaEHMDNLRlV7VBqbzdoeSEJq9sU4b/gExK?=
 =?us-ascii?Q?kWGBliEGBDptUbeZgiY2srbfT/hE/Bzcq2CfY4fNv3gCVE35g/r3nmNIDD3P?=
 =?us-ascii?Q?GD/rUzXg2Hp2Q0na+2ua0DZ5oqAN54cPW+6wKI6EOQqlzQbXFxEzZ/0AGPXJ?=
 =?us-ascii?Q?n7req7qSXlsZ7S/6NUYpNxE0gSTkKMs+y95nMp3SzDSX85PzMQZ3hA2fQvbj?=
 =?us-ascii?Q?CWIx09qwWeMHHaKfbK4FRjtueYEiuwBX/X4Kz0sNOBu+2QPQ6IAlTfFNUqcG?=
 =?us-ascii?Q?PVhgG4zSzbYqxeH4pptD3K0m9NLeTj33?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nni88LhrRAqOWj+fjFngZOCTrnRWmCUXq9cRa1RbxsRjsdvVcqfOnLFRUqq7?=
 =?us-ascii?Q?JFpEm1/iBUd6bmp7SSB7L/qLD/E3rqvEzznFGYgfGkBUQMcD/9b6rM6QDysi?=
 =?us-ascii?Q?/Fb51w8Q0ceieutOhWzIkW0ZqhH5w9bAnMidmJkRPJCrQDtcwWG8Q2LJXcNL?=
 =?us-ascii?Q?ExBs9GRq+04Dbq4CaDxhlr50g4VnfjkW97Q3tSQCl/kcmcDgTf+zxqS/FSlJ?=
 =?us-ascii?Q?2k7mHGqb/3aLUncfYreR2FTKN74ZZQekQVGU4FoaM67qFCiAqrz7NJ9nAJ0b?=
 =?us-ascii?Q?E6D0wl0U72Ct4UwpcgqOjwR2iqnJtYl0f9xihDZZf8em/G4dA7cdxdLcRkx4?=
 =?us-ascii?Q?PeoNeZD20PdjUBeQA3+cHYs2aoq7WN39mP2CPNYVF17Gu5XHBQ1UgBjX4qUW?=
 =?us-ascii?Q?Yny50tHSCYoPj9n0EUP+25vRk9y160IynHQxvaKCt+jInp5BirHxf50tYc7q?=
 =?us-ascii?Q?s97s5py1Nf/o95TPivLGGofSKATSgLgv5kCDutRhv1RNZnc74PiUcNeP2tEz?=
 =?us-ascii?Q?hjR2UK30nQTyh/h2Mfg1uYuZh9WaXLGcStaxY/eymIMhNXdDqPylFnn+fOml?=
 =?us-ascii?Q?pAwERIR/3OvWqdahS76SI0VVFFsvwmU70V+1+JG7NWef7UL/KT8wcjPpKoiG?=
 =?us-ascii?Q?7+AQYjn30X69sNiDJqrJtbaAvEYcL4zMDhF0MZEv4LK7J2tPjVwAo2hknoo1?=
 =?us-ascii?Q?oaa/vGrPJXPcriPXeP64rGxK1FEnD2CBRGVgtfbdI2SNFZ659iTRnGmxSC0e?=
 =?us-ascii?Q?N2P7CVLTbeJXdWGCz32nJKCqK7uUYNwCJEuHFNPxyliKxD6f6Fn1WOl0NCEZ?=
 =?us-ascii?Q?0wuFM/ftgVBD1NISK1PdDAp78siUL57CiECJPphcLKX9axtzw5iMiBMj8rAY?=
 =?us-ascii?Q?vPlg+5OhJljRkvmBV/z0Ylh0QuDf2qgR9MVOUo58kH3FgQqAxOVM2YxoNnpF?=
 =?us-ascii?Q?fzZyEEPvXSLyBDJlHYCeBYS5nP+K97xgRZfSWsxkNuqVFcRtcLOxxM7isiCt?=
 =?us-ascii?Q?fdjGCPNwqGSUUBN36hXFWwR21mTJNakPcsVJ+AYt+0BTL3QjEXmk5ppNGWm+?=
 =?us-ascii?Q?UWyVgr5ufEIM3ma3zFdCZE0UqBPlKx+7Ifpf/uy4S4NWRXYzArwyENCwQ/w4?=
 =?us-ascii?Q?dc5fWQvYNw5CwRTj4fbvY7KMCpnsoQvpWuCp9j19eOr4l8xSOEX6q0GWTf78?=
 =?us-ascii?Q?qhQYbzaOW6qAYZ8ebRdw8K4+qCWxT2l+23KnXo1U8smTNSwAQ9pxeCkJ+q3m?=
 =?us-ascii?Q?X9SdFrgsxVaRDBzw3ltFoc3MI3MmXnP5QzuyU/fBc3uSOhrKS2UNF0W1X02k?=
 =?us-ascii?Q?qugjTBfaOre51IKsmfriEHRqWMV+18o6lh8qGjwbAwqJvBZ9t7UOTKi7v/wh?=
 =?us-ascii?Q?WROohTeSMdMA9T6LkS46zfyfpdAjuznHkMJm2BcxdGerWyP3DG+D7ydIpXei?=
 =?us-ascii?Q?JPmgTAUfisyEqgpRGVwp/urdQbJxEgJDh2yVEG5FweUk6/U4NnBbiI2ZBf2v?=
 =?us-ascii?Q?OkE1kCuOLzNpYXqa4W3J1i0Ywf7V7Xo3VqCtQqf7jWHq7sq1egjDRb08FhxZ?=
 =?us-ascii?Q?+yhUBhgOZktG1hSQ7+QG9r0EbHd5UPrrg4rJju2q5gjisvUzlAwqakQX59c0?=
 =?us-ascii?Q?i4+laJZa9s6VUiA4yzVE/JqDdKzMP59kZmSSHtfGqlPn8MAeO7jYgNcTkWoh?=
 =?us-ascii?Q?96N7fYWzJ5KbIfHxIy0YfeCIvxPeGCLbG6vKO7Wao87ZV5bJUZDkoEvBzDpQ?=
 =?us-ascii?Q?ERFurGjdotvt1VfYGAyB67MgZGkkBE278q3lT3E4XsYhgvb/V7ep?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: dafcb2cf-69d3-46cb-e927-08de52c0a2c2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:27:25.1802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fU6+3nan56ZB71NeXcUDxyUn8pnRYzwnL68t1Z/PJvjLmXCgtIECLQxrdUcuIjc/XxU9nDcKq5MJg3IMZNcCJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3400
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series proposes support for mapping subranges within a PCIe endpoint
BAR and enables controllers to program inbound address translation for
those subranges.

- Patch 1/6 introduces dynamic_inbound_mapping feature bit. This can be
  used as a safeguard to check whether a BAR can really be reconfigured
  without clearing/resetting it.

- Patch 2/6 introduces generic BAR subrange mapping support in the PCI
  endpoint core.

- Patch 3/6 changes dw_pcie_ep_ops.get_features() to return a mutable
  struct pci_epc_features * and updates all DWC-based glue drivers
  accordingly. This is preparatory work for subsequent patches.

- Patch 4/6 advertises dynamic inbound mapping support centrally for all
  DWC-based glue drivers.

- Patch 5/6 adds an implementation for the DesignWare PCIe endpoint
  controller using Address Match Mode IB iATU. It also advertises
  subrange_mapping support from the DWC EP midlayer.

- Patch 6/6 updates a documentation for pci_epc_set_bar().

This series is originally a spin-off from a larger RFC series posted
earlier:
https://lore.kernel.org/all/20251217151609.3162665-4-den@valinux.co.jp/
The first user will likely be Remote eDMA-backed NTB transport,
demonstrated in that RFC series.

Kernel base:
  - repo: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
  - branch: controller/dwc
  - commit: 68ac85fb42cf ("PCI: dwc: Use cfg0_base as iMSI-RX target address
                           to support 32-bit MSI devices")

Changelog:
* v6->v7 changes:
  - Added missing check of dynamic_inbound_mapping feature bit in
    pci_epc_set_bar() when use_submap is set true.
  - Addressed the remaining review comments from Niklas (patch reordering,
    splitting, and source code comment/documentation refinements).

* v5->v6 changes:
  - Added a new feature bit dynamic_inbound_mapping and set it centrally
    in dw_pcie_ep_get_features() for all DWC-based glue drivers.
  - Updated documentation for pci_epc_set_bar().
  - Dropped a needless and harmful dw_pcie_ep_clear_bar() call on the error
    path.
  - Fixed "Bar Match Mode" to "BAR Match Mode" in a source code comment.

* v4->v5 changes:
  - Added subrange_mapping to struct pci_epc_features and enforced a
    strict capability check in pci_epc_set_bar() (reject use_submap when
    unsupported).
  - Changed DWC-based glue drivers to return a mutable features pointer
    and set subrange_mapping centrally at the DWC midlayer.
  - Split the series into 3 patches accordingly.

* v3->v4 changes:
  - Drop unused includes that should have been removed in v3

* v2->v3 changes:
  - Remove submap copying and sorting from dw_pcie_ep_ib_atu_addr(), and
    require callers to pass a sorted submap. The related source code
    comments are updated accordingly.
  - Refine source code comments and commit messages, including normalizing
    "Address Match Mode" wording.
  - Add const qualifiers where applicable.

* v1->v2 changes:
  - Introduced stricter submap validation: no holes/overlaps and the
    subranges must exactly cover the whole BAR. Added
    dw_pcie_ep_validate_submap() to enforce alignment and full-coverage
    constraints.
  - Enforced one-shot (all-or-nothing) submap programming to avoid leaving
    half-programmed BAR state:
    * Dropped incremental/overwrite logic that is no longer needed with the
      one-shot design.
    * Added dw_pcie_ep_clear_ib_maps() and used it from multiple places to
      tear down BAR match / address match inbound mappings without code
      duplication.
  - Updated kernel source code comments and commit messages, including a
    small refinement made along the way.
  - Changed num_submap type to unsigned int.

v6: https://lore.kernel.org/all/20260113023715.3463724-1-den@valinux.co.jp/
v5: https://lore.kernel.org/all/20260108172403.2629671-1-den@valinux.co.jp/
v4: https://lore.kernel.org/all/20260108044148.2352800-1-den@valinux.co.jp/
v3: https://lore.kernel.org/all/20260108024829.2255501-1-den@valinux.co.jp/
v2: https://lore.kernel.org/all/20260107041358.1986701-1-den@valinux.co.jp/
v1: https://lore.kernel.org/all/20260105080214.1254325-1-den@valinux.co.jp/


Thank you for reviewing,


Koichiro Den (6):
  PCI: endpoint: Add dynamic_inbound_mapping EPC feature
  PCI: endpoint: Add BAR subrange mapping support
  PCI: dwc: Allow glue drivers to return mutable EPC features
  PCI: dwc: Advertise dynamic inbound mapping support
  PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match
    Mode iATU
  Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage

 Documentation/PCI/endpoint/pci-endpoint.rst   |  24 ++
 drivers/pci/controller/dwc/pci-dra7xx.c       |   4 +-
 drivers/pci/controller/dwc/pci-imx6.c         |  10 +-
 drivers/pci/controller/dwc/pci-keystone.c     |   4 +-
 .../pci/controller/dwc/pci-layerscape-ep.c    |   2 +-
 drivers/pci/controller/dwc/pcie-artpec6.c     |   4 +-
 .../pci/controller/dwc/pcie-designware-ep.c   | 240 +++++++++++++++++-
 .../pci/controller/dwc/pcie-designware-plat.c |   4 +-
 drivers/pci/controller/dwc/pcie-designware.h  |   4 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |   8 +-
 drivers/pci/controller/dwc/pcie-keembay.c     |   4 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |   4 +-
 drivers/pci/controller/dwc/pcie-stm32-ep.c    |   4 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |   4 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |  58 +++--
 drivers/pci/endpoint/pci-epc-core.c           |   5 +
 include/linux/pci-epc.h                       |   9 +
 include/linux/pci-epf.h                       |  31 +++
 19 files changed, 360 insertions(+), 67 deletions(-)

-- 
2.51.0


