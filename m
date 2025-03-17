Return-Path: <linuxppc-dev+bounces-7116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D62EA64894
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 11:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGVq13x7Nz2ygl;
	Mon, 17 Mar 2025 21:01:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742205660;
	cv=pass; b=eltYDijbKl8AMcaeNWYTnfSQygQ6AMiAfEeVUcfa8czdLqG1YHx8jPNKPyaKxknfMkO4kpma39SlfyKV+YBAgiobsVxNRr4Tf9T9rWKgBMhXwl5Zd/nih3KoUxeQqmlK4PezeobFWY15BdDR5a8H1dLd8/GU5TaBxsAq0DJLGcmS2kg/veAXmHUgm9KCWWE7ApNY1Uv1ea7uyJ2dkWY/CzkwLZGPn6yXP8Y6L0GOqsqFoQY9p9lzPcvtV9SkBaDgbLgHiHYOEerfhtPKRFjukGCiUlZR3Fg7hiZ2VzamzLjVBvyVg027oIGEPwzZAfvzTeifOcJJ7flpnqzSvTg4iA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742205660; c=relaxed/relaxed;
	bh=9CLaaNIFVMdx2mWYpN5COpnkx/9WEM+JFnDT824eRe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M0lzYHr4C2Sh0v2ERjQCaTfXTP4YpK0g8qcM5uZPqtdtlIjLd1/NxwlvMon6nF1/R2wNkszdc7Du+O/3PNo61UDJgVyQkbVJk98v+ZvMdYTjgR8I/GvyFlVCSn96s4/JQOI5QADHbNdfAr7/MuirGOZBF6aSGnWdFS5rfJ8Ww6a+Auz2/nQJ13n8kRqLxkDjOJmoP/EVhJLUi/k/gTqvjZg+2EjfLiXryj25uVM3m19eWW4c9I4qQ0JLHUAs1Gdv6nu47oTQfL3Ei253e5OOXlMHYk0YV2mVVYGPvfBQbtlW7tHwNHymD6oG0/ShPYATDrWmKHPzZnRt0gW3ntWJvw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ONukwLx1; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::60a; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ONukwLx1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::60a; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGVpz6MkRz2ygg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 21:00:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RucYqQUWogWonhfPTBQsqouHwUleQboJG2FIu8p6TkyxhJLg+k40HUj6VWfgtKY22da3yZcJmQPEmq/SK5U61VKx5CaQAmGHDt3Cv2Fg9T1LU3NygKjDPQCLtP4ShnsYEMQs2024MeHznMzm0Hj7wcx/8EMPGYpHlV6b8eHz/BoFF31ZW0NdL4XOp4rX0FYQnPs0lXyidqzY+TUPT3nl9h1BMItd1unWcJlbPBiWf2Xbn5io9ASR+SwaEVnbRFvILZEtEOiaensgrODrfQ8uz5yTYaZE8/CcUlLEJcHMmUz8rEC9tJRdrI9Z9eeUu+O9t4Yp4K4iofSOHSyQBnplyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CLaaNIFVMdx2mWYpN5COpnkx/9WEM+JFnDT824eRe4=;
 b=hEAn25QuhI8iwuNFGKR87PqgQZlnkqDKMoBSwdZT85CgaRGWmCx37/9sEGCI+JzbeGhVUIfF0tDEICRylRtXuC+Qd9carXplfc40s7hcqvKnYsdQJdK1VrrzqVz97TbSyXVpIYWnj9U72L/6EULijBfpg/eVN8LOXfTb5DlsXb4xEiTxZYaflwpAlokGipsKIlEU4/Zbjuc+nDTcR42yneIjOizI2TqoSPQsaKNsgti+/nJPnUmstKIRvCQUXc/9nAbGeZl0kaK5UDLF/Y06saDSI8aI3Q0jdwdMJuQMptPiV0w+P4bWLAFqOsZjBmN+nsQsr08rSvXqk/Nraiupgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CLaaNIFVMdx2mWYpN5COpnkx/9WEM+JFnDT824eRe4=;
 b=ONukwLx1hm9Ha9p0BXX599ZgpKUHS126izaf8ADON1RoNsdZUfRGOgO+b0+rTMgkAuiw9Ke+OIT7YqpnzSYLvSxfasxBCDx57mvTW9wD3retFRx9Cgn/0JlQ4drkrrdbs3XUQrlI3y6UxiioKiGFKuciKF5WR76OQF7yBZsDRLmzk0pJfn4WScLO6h0HvqHmIos35b/jVDWT88lZ/dDBqUnTp8OUXF42HN4BTmZKW/ZF7QeiAWEVJ8OMfLsKT8Ant4lftHz8PcxQfxBcZ/vj51K7vJQy+pgMg+6HKjrShTtOtG8Twb/rcMUodBJfptD8fmbDGX08xuR6hwrYYeAcEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PAXPR04MB8176.eurprd04.prod.outlook.com (2603:10a6:102:1c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 10:00:40 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 10:00:40 +0000
Date: Mon, 17 Mar 2025 12:00:37 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250317100037.7o7r7gch433s5lq4@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-2-wei.fang@nxp.com>
 <20250313163526.pqwp2wsfvio7avs6@skbuf>
 <PAXPR04MB8510327277CFEAC750FE49F888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20250314123715.fivq2cbczd4khxkk@skbuf>
 <PAXPR04MB851027E5F830F08F3395083888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20250317092808.jel2au3cgfwblaxk@skbuf>
 <PAXPR04MB85102185D0A4C30F0688AA5488DF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB85102185D0A4C30F0688AA5488DF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-ClientProxiedBy: VI1P195CA0075.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::28) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PAXPR04MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e5677f-5aea-4049-c5ac-08dd653a92f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OjT80u0mPGzfNMxP1HucSk3g/Yj7EXian+LpA5/HpvFy5s8gJzFw+6kSh0jV?=
 =?us-ascii?Q?lZKSnCp46YUE2Vt1lo+UmKFeHNk4Oad7rieeY+hdikafqUm98KJVS5XLgvYe?=
 =?us-ascii?Q?6N3g6Wl4DpHbjU0D58lHoCly00aIcD34XI+Sb0eFSHeq3nYbRS3G8AgSD/cJ?=
 =?us-ascii?Q?LINaPCLRm7TgNEzZ/25kgXvNf6DBPVEv4eW6koZjkmJtKEFgfYq4iIeejjQH?=
 =?us-ascii?Q?NlWLbHkHz9inf+nX8BMYQ3uTZ/cWlrmv7qpDmLydxP5oegLIXeTnCvDzGn22?=
 =?us-ascii?Q?c+Hm0kuxPONjpPqKSEwC/MeV5cF1WlpNyxMMHq5H/sheLpEIlPbsSmODU9aH?=
 =?us-ascii?Q?eG+Tq0lzvf8NsUioFNuT1KmnK8a1MfEZPO98qZiXIEy4mLtNGNI/lpB006Ed?=
 =?us-ascii?Q?Hi8OHhH3ZtEZAPKGXpY/6xXx2Xdk5GAvYJ7QbSQZqg9yI62sNF25OTyw88C8?=
 =?us-ascii?Q?NS9cvu22/cg9xAMXeUJDx1IivW3FOZ7fZnqGHk+cGlhwOrQl4rA7WXMUDoUb?=
 =?us-ascii?Q?YR0b6jZbe0gcO/bh977RDAUOrw5kw5oRoKaX44roIzm+NcYmB9e06DXyGUpa?=
 =?us-ascii?Q?yamUvLF4bIYJpKsO92GZ75xBr1rNSJVNggRxDh8vo2vfNK4+wpOU6/e5P2yt?=
 =?us-ascii?Q?MAnQssRTsBusU8Y2YhrTNaopbE6U/qmNohD9qgB0XeCEIVkuXXLFIiKvJ4Mb?=
 =?us-ascii?Q?ogvyJWohkgEvwrjxN0TzAWUtmDW6qdsM8N2r0e4Yd4FBLhHJPPIHOuc211lV?=
 =?us-ascii?Q?O5oORwNB+OxnFbpgaGNrkx1bb+bYJ8Q3magzrXKQC1W5MdscZl9ZAOGTvjSc?=
 =?us-ascii?Q?0W0Nf9BVcD51SSNntP9d4seU+i2Shb6MwNU5z6JCSwxCQ+zqxU7DhGkbZEBk?=
 =?us-ascii?Q?UufnsM2lpmtm2/p2cnX/WzFaWaqY254RgxQiunxn7Ep85ToDmGT8n9raa/VA?=
 =?us-ascii?Q?xPqEEQHUHx2YWqg7eBXODiz5aY+0FpBcKKfDRkZVfhnnf/+EzL2b+5HirMGV?=
 =?us-ascii?Q?KoA3WwKlU5nVtM5MV8xmAK57T9QjERzAe7G5omzb0uYtWN8GFJ/lWjEnFRx9?=
 =?us-ascii?Q?ijJ3TWqJTlBHhmjgY61p4sXCuXwyMTe/DF3MV5ezEKrzNsTnqelGtq7eso43?=
 =?us-ascii?Q?fgEx7bdfHrFPkTou3uAZeVO9q2ABNbAMZOK7AUZUmEhZzfSyYwiNoKQjt6IL?=
 =?us-ascii?Q?MTfUlAS8Ppygww2ioeCJmGWJUQVJINvUOGCjzXgCu0OVo+sZpn0++lS6S0Cs?=
 =?us-ascii?Q?ywQYv4SNyedze5PvPmIycyEXGKDXokj7rG9zKwMJEwveykSjhGI4mvCiOu20?=
 =?us-ascii?Q?S3cBsPXX05w9uPkkWKqMPVKyiObqKHbE2jpUGNCpxjQpoO3M0k81LNU1yDWT?=
 =?us-ascii?Q?lxkKIyqaPvF1RPUKi+q3EG+sr4St?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?atJnQHkTxlPcRKSG2ZGgTd18bdg0t3FR9TF9YDNBI9N3tPguTqSK4rA7/TXA?=
 =?us-ascii?Q?RK+E7g9XJd2ukmBYfsuxGxuPN1+YETRmExeeO4dsc6AkWmFRmvWxsdVNNgNm?=
 =?us-ascii?Q?8MT/qwYc0gXvElXs9obDO/52RJaZUR7NjwofwEVy27Cg287pypQqACghxLdv?=
 =?us-ascii?Q?DqUCc2BSbQB5ZJBxG5VXQxD0XFeDSOThAkeHOU7u1FWqyDtA3+7JkZnHRga9?=
 =?us-ascii?Q?DXgUTT43sE1EoJgWoiKI8a8dG1mvHq2uElV0VN90vgiOlkKMH8ojFGSlipM1?=
 =?us-ascii?Q?048drxPkbs8Fefo85p3HkjPuIOlFgYb+L8nLpu62Q3KUCLrMj31DLj1OLCiI?=
 =?us-ascii?Q?6UwR6PHbVeeCHgjzdgSACv4hyU6mNERJ2e5F5j0Qk8detATLcD2rMU13++Sa?=
 =?us-ascii?Q?zV5gy3e79F6bR7RCQ0g+qSNMMAwTh5IZCSaXHbtl9qCVy1cN7Lthmp10mmR0?=
 =?us-ascii?Q?Ux6VaJGYT6p9LQsKpCNqrfzOHpjDQxWoCf8QCuj6vmqSOpDJPLFMKuGNm1bA?=
 =?us-ascii?Q?ta/j5BuAf4zCUW4fZgcRkFxlQr/lNpRuqBTpi5Jsj6QIfeP4Y9puWvFQ+P0E?=
 =?us-ascii?Q?iaJ2Tb6g5L4uVpAQUY3F1r/e0DpasJGsJzmYeeo3Mb7GqwuV8cpPmo2gKHPY?=
 =?us-ascii?Q?RTi+TVwqvJdpnbFFF/e3XoqifM//YtLHoYFyupGxv7PheAHf12v4BZsDN6GA?=
 =?us-ascii?Q?e7YWVTZiHFuixvCG73jH6gQUs3IRPW4Q5zkrWlvNLehyMrInDsXccSclAAKl?=
 =?us-ascii?Q?K8D8geDz2xND7tNqiT9kvlowAQ4OB3q8iA4hUudWyiW79+C+0zEdTEbQgWIH?=
 =?us-ascii?Q?f4ZvcBWHHb+PEeeVd54bpNlm1k+wV5ozFEYySEVEX6PYvA3sXuT65esr5BTZ?=
 =?us-ascii?Q?7uT4qBwU916OeQjUBtg0p/oe8qCyObFLf5jfWjw0h6+ad16G1hE7QEg+j8c7?=
 =?us-ascii?Q?+hrhs+QUSSWXitPr//pnK9Z/+0todBgpwX50aSoANTnStXvb2GfpjnPMzFnt?=
 =?us-ascii?Q?nPKdBeZxAo2+Mj4IUTrMhbT4ndNGap7HMLgEEYR91bNkOu0bxaYcDoZT4i6S?=
 =?us-ascii?Q?qG4KBlBUpDKjzmT8suIOqI/X5adjXrK2niahL0eYoi1iuCpZE0MgAM9HejKE?=
 =?us-ascii?Q?M1VMYXkqQE+Zg2Fsv5Net9X7bLLKYCbTMYC2uB6q63pxlmafIGbk1ebXlq0/?=
 =?us-ascii?Q?ktJmXQj8J3tEIbODAHU1oysS42s+Z3gur4f7zUSNlz+fmf1nuna1PjHkMA83?=
 =?us-ascii?Q?GkQJ5Senajqto1EuWlacNPJfTRvzY4t4kcXftAojd2zLrX/p1I7B05CQe+Y7?=
 =?us-ascii?Q?PJLBW1VVArEhlzaBiDCYgg1GDbJCoTiF7Ae77TstQeMYdiESMvklcQU8r/On?=
 =?us-ascii?Q?cJ2qtUzsEtec55+c/LEERYHIsX9N+1N2asarpd4S5AjwTrGL9YIaHlIt2zG/?=
 =?us-ascii?Q?UkRyknINpHRXWklgV9rRgKXbWh8lKolQUlP+jspFay0HNPMe7wV8ZakzbpRg?=
 =?us-ascii?Q?uhmTNVltN07ZAfOcbnhEyf1V8M1jtTUbeC9PG2s+ztgdutfMVPBpZ4LUPhX7?=
 =?us-ascii?Q?leUt3AafAbjpy4pcP5sUVZSMz6ft3jb0hmIxEjs9d4g1HvMUP2tXPQF2k3hW?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e5677f-5aea-4049-c5ac-08dd653a92f6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 10:00:40.8241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCVlAs9Lki/yqR71/jsYctM1OixoV2FPDcRWUiuh7aMFHITKr5EnqmdpfU1LkCBTKz90FSqrEsVTT7/45ph3Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8176
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Mar 17, 2025 at 11:55:26AM +0200, Wei Fang wrote:
> Actually I did this is the original version, I mean in downstream kernel 6.6
> tree. I add a "ntmp_mfe" in ntmp.h like below
> 
> struct ntmp_mfe {
> 	u8 mac[ETH_ALEN];
> 	u16 si_bitmap;
> };
> 
> And the conversion was done by the NTMP driver. But then I found that this was
> very troublesome. We get data from kernel "struct A,B,C", then the enetc driver
> converts them to "struct D", and finally the ntmp driver converts it to "struct E".
> So I thought why don't we convert "struct A,B,C" to "struct E" from the beginning?
> After all, these data structures are only used by enetc and netc switch drivers, so
> in kernel 6.12, I changed it to the current way.

I understand. With pack_fields(), "struct E" (the packed representation
of "struct D") doesn't explicitly exist, just an abstract type
representing the u8 *buffer, and the struct packed_field_u8 array[]
which is hidden inside the NTMP layer.

