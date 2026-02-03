Return-Path: <linuxppc-dev+bounces-16529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM3fCdBngWl5GAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 04:13:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E04D4008
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 04:13:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4pTS41rmz30FF;
	Tue, 03 Feb 2026 14:13:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770088396;
	cv=pass; b=gJILG+c/onQZbCVFEiHufbkqobPfh/Ytl1gZ3oaDwiZYHGK0XTjS4c7+AMMDvcwDsxq+QDzvTo+cl6eor643JH9e9+tb9HcVF42OHYgfYNWZAbyKFLm/6WIhqlUQeXu/qwb6crwegdZdQofsrZAcHvYW1VS/8IrQWKBPMiHXQn5dFBp9LkRbLkQRz6AcjMsQVvjLDlDZhg0GiuZl48MTOeKeuqOuRrnZvoT+fDZRQLeFYr+HVfCn3iNEZXP04LLB3i42bojWrYeUkwy3yt+C9nGLF5AvhXQfMkMmOZXt4yfSKah/e5EhaxmUu4cztCxxbKgQs32nGFBF7gWcYxDbZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770088396; c=relaxed/relaxed;
	bh=1DwZVwaw+JLrTAWNJJs8V0U/w37eKhqZWOrigJOCIo0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VsFcWXV4wBssiao8xd+2ZuLOrdkbd9ePr3cjjX8jqnIirZ1c6GF9PjuhM8IK27/0n8D7c1N7yQgodrC4z/WWycMi8BJTprDCtY+2bFZOriubMQWEk842Ne8z8rfxCFTFCX5LH+Fu+uSZ3tbgJGePiZzJeBIBptQHW3FiGD4faxYGeL5GTK7sz1fux3m6rfvG4nHp/ZQayhJUTbD3dlo/cAd3qJJeiA5HC/kyO/RNs3TDhle+uBTkE1C2gKpeTe8z0Y7f56k5jC+PqhbJ44cW54SlcE8P2/g4bhcTbBxlkbdbOwf+/54vTFuRSCNJvmJUkuAk9tCfmbDTthFnxgFWGw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=n00mpdxs; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=n00mpdxs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4pTQ506lz309y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 14:13:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXvu7Ur5I3xubEzOUvIKQU+i+NWGd8s2uQgCx7ZglUwa7Z4M9aRZEnRykv7gQ6L0hdD9wPlYObQgvDCFT21+M05Lao37rkaD4zmczCqiZ7xX0SR7josfUNjjRMKmLUIIXLIrnXChi5SF1tM2jfJolHZsc3R9Dqc2uwW51Kh4Dh1IXp44E4zCyVUfQ5oSOWTYZl2cmvq5h9PTJBqPVumf5QZjdok4OCKp8TlKY/CWfH/5nzivQ0BoWar8Vs5uMYuI4EfnOn+dkyUubQxtbwOB5WSAqonj3h3CPtFcF8foH6zhodgh2a1ZQ6OakEb50lH6zTvBlQK3AWIySefUbJtlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DwZVwaw+JLrTAWNJJs8V0U/w37eKhqZWOrigJOCIo0=;
 b=SW//ZnIa5svz0TWTvPNn7ghKUrkYyRqL8ppLor97tana4aT+aaltvW02QgPO9CjP19ZIjEAzS6jZMdlS33O80GvYUqBH1/DAJImQ3DbfpA3IjN7uDwwyJ/8CoXDKyyH0TGD88+EsrIQrS09aHs/dGOC71kwVYBJaOZeUnW6AauCOrSgkmn8ysjepTu6+S7uN0xieK9v8WXjsEatTplxoLIRMr+q/3HU+t/XapSXFDSR0xI8qKr0BPoWb/uul4tvVGU41pWEpVbV0j0VJE74tznjJzPGbE+kd50/3leOwJFXfG4CJhriPlEL1qhXAwVt8BHmZlYpYwO6pz73QYkCJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DwZVwaw+JLrTAWNJJs8V0U/w37eKhqZWOrigJOCIo0=;
 b=n00mpdxspH0VbKPmLf8PiIkcSM8tBDcaqFmYX4NFMbOaU2F7cOc7QXp2Fs0SCiIBqMLlFqq8Pe0yxEIClJJEZCgqb4K+UdzS7VNECfYghiFv/heJ3lbCDomPHcklVnmSDzH6S7XgXPBeMqAJ7At+haJT8WyAZx5IkndcthAu0vCUDAY0nVo37IwC8u8tMqOiyOHboTteguRF9UrXwQwFttPvhmqUN0FeB9e7x20SDqmAgKW2vukSa2zttWCkpM9tswpwSCHx/mejlK42W6ttnjzg5dUQh5pqiQaDzb4aGhefUWmFe5FOeKbgG5bvlh6ZkU2euFR8dqhP3n7D5tvhkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 03:12:44 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Tue, 3 Feb 2026
 03:12:44 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/4] ASoC: fsl_asrc: support the i.MX952 platform
Date: Tue,  3 Feb 2026 11:13:41 +0800
Message-Id: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|GV2PR04MB12271:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b597c2-7836-4e13-2ec2-08de62d218ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?76ZqpicaolAgCGw3i5knBAtaSQ1KMEE1RPqxOisJoEZuFMvvepa0KmP8Kydu?=
 =?us-ascii?Q?EOvemsi/u/lUsclW9vg8N1ZtDXssGipyccSGNuY0xuMEosOAln2Nsgztz21d?=
 =?us-ascii?Q?tjuPDcdkFw5CdQ3AcYDx9x6Epaep9YDt6ltrRIiNxPviAbbUz7ABie8oz9XV?=
 =?us-ascii?Q?zWfoT5Yms3Gm32LZSFHUiKdWlhGkwvSx1Z/5bpKP+MZcG87fYO4j8mOo1msA?=
 =?us-ascii?Q?MN+0/qQgGbjmGTPAPghhWE8abv/TKt99539HI6GKjg58wAUUD2JNXO++U3Vu?=
 =?us-ascii?Q?1zbsmwVwilIQ8jOBOr34FkPKHf02pmY8FTgLg3mof7o1uCqx3xLmJBh+dtvO?=
 =?us-ascii?Q?gGTKY165huHyNeA8miGWk2fyWEExxKB/2Dc/OdMWSx0+vwKlRNnsMqUakZT1?=
 =?us-ascii?Q?6Jv5AokbwUhuzUPYq1NqjjUWyaRF7xcGSl2tz7YTnSaLJSKq14xCK78SX2oJ?=
 =?us-ascii?Q?dGYMHxfWpDbYjMseW/q5XMPwkAbsU+//GLRm1l7xgyWPm/HtDX4wdbgQyGhC?=
 =?us-ascii?Q?UdaLph3C+jptYmwx7Bm50ZKRQm8zg/Ckt/0T6Ot6J6DnCETBNj/k0Ek9Of07?=
 =?us-ascii?Q?Wq+G2oZWWinZeG4NMacOwI1Jn5gxOBxQwj8523FZMqDhcWcMA74rs3j6DflR?=
 =?us-ascii?Q?A0B0L6pmVTMqS4VEFVQ6LDTI5IDiuSsCd31pN4teuw//83M7r6lcFSMKiBAh?=
 =?us-ascii?Q?WStpA22HopVqAAJUIYCFo2V6fkaU3Tk+SFgNv3y7mJaz2yDN+/rRZV9Ev9nb?=
 =?us-ascii?Q?vYFOA34OspQ2WOA3s8dwi0eE9F6CxqKrqGZujVbS1+6waqYqVd3Kf6KTVU9W?=
 =?us-ascii?Q?tthhU2U+zlwuOoPxB2SRc8CHLnDcv0nH2zpmqlFEuDW/8fWl814GtzypxHma?=
 =?us-ascii?Q?4lzDBaVEYyvAHJQ77/zZuuaFIRQWXQLKyRc2oEE+4gSyVB+2VMwu807Worx6?=
 =?us-ascii?Q?kYMGy/L04uC2ZXeTz9ZAa8EZ0NrapO8MACxa+jIaV37pRIk548PHH8QRl4sI?=
 =?us-ascii?Q?JxFTqTJJYcbkpnPpSsNbrgPGE2XCCa32f1Rj4NNVLylOvM2PF3csiN6hs6tr?=
 =?us-ascii?Q?iug4tEguWLMmqOuOXGLQAea2uY9neSV+MuG13Hico0N4KObxCThQcawYdH0H?=
 =?us-ascii?Q?xLake3osQALEKv+hJemLz93Zx5uC/J2CkbULnVIizjfdEWGpDPp4s3xjX4yQ?=
 =?us-ascii?Q?H9fEwaTCehexKLZfTRdW4n22qKAyaxsfgbr9a45MEdROYgRbo1XSlOpMKJYq?=
 =?us-ascii?Q?nwNhrhOhjwuV+rM5m7JivquZDWOgvkvpC21kUz6txuiY441ZLO1rV3xigumV?=
 =?us-ascii?Q?NYkL7mJu6kZgaPd0h2PQZoNKxL7SZ8F05CR9sK0g8fx8ZvrBbUNmzg/cX/OF?=
 =?us-ascii?Q?dM1UrzSCqQSbiZnR+wHKniFWmCyqKzdcrdorBJGxYhMCx2i5123/d6ar2apj?=
 =?us-ascii?Q?Tv43IdDfUdLsN/Z1VslplDx/6ouvFtnfawwlHDS4FJFqS6QaytExMnStWPHL?=
 =?us-ascii?Q?P4+4exxJNDQcbJb1pc6TFhkuUx6rHPOdmu92D7sfnD6DdpYfFj9TZ84vrrQA?=
 =?us-ascii?Q?tH0UkD/dTypbo7XNy0QXQEAZHARwndJJMFlN7wWFMHzBZ1vd7aTbi/NUmbHF?=
 =?us-ascii?Q?gHl0AflIwkrlYXczCy5ohnQhMWBSgeTJb73LWxg3Z2GK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bt0CHWQmUUqTjED21+8GKZFsSkn73NoiGo7YhniLzdr5/V/rfWf7J/GrvIhH?=
 =?us-ascii?Q?b7JKpcTCeP5BAxKoQ6qGrMCdjsDrh5pypKuisKXmIPVar1GJTQrl7WQC3quo?=
 =?us-ascii?Q?E8L7OST3A+kYzMu9yl0LwufOOarEfk5BIFwXhIJJDyVNDfujMgjW5fTDhXX5?=
 =?us-ascii?Q?Ka/pgfPaZrdRNap05cpT0u1tQL8ymJFvcOGQz4veF1LKq+zWRdxsEvaanZCx?=
 =?us-ascii?Q?6zIiWoJ3iMaBcPlBCUZ6aNFtR9NU1YQS57ITr0Lr4EQXe7AFVX+qjaMCDLFy?=
 =?us-ascii?Q?3kT+twu04J3ZXF/epjKO0SUcPIfwsL4p9fCdyxHMUGrU4JQU1p0c/XaXGtV5?=
 =?us-ascii?Q?BlH2onhn76nnK356w/GrIbNXgLsd2oeC5kOLmqLuHy2cW0EQxJm0LID02I6t?=
 =?us-ascii?Q?6mEdyGbITR+qKPzS6PsYyMsqvPEZrewc2Kec10/nz9I6sUT/mS/fPcm1kHu+?=
 =?us-ascii?Q?YLqfTqLhw8v3RNffD9MlMkuxdpk4QvQQVQbxyJF1ghzTJEH2tYCHwANGel4a?=
 =?us-ascii?Q?wJZtjcCFO7cqQfva9K8UM6QBuc8ToqWf5ERE16trpugDLAKKF/GD9dmnUwee?=
 =?us-ascii?Q?bQQLlnwzSIybfWsKnGsWcDymP+6++gTPuHLP+02rMhTCHQaqCS7OIJQmQINB?=
 =?us-ascii?Q?ICPISC3mx3FXu1jnKj/IM5X7EGCIHS9PBJuz5F2blIt5i4zdm7wc4svr4Ue3?=
 =?us-ascii?Q?MafJ9eNBl00GRg2of70YKm/3E0MFE5aiTMbnPumfgUdIcSBl79J069BC7Z01?=
 =?us-ascii?Q?4lLVBeLDXBdhNRD5iO66s61WkM11v+9qFn7A6abKuf61StRB5UtpEA+KHruH?=
 =?us-ascii?Q?86AHSpBH3K5yyt2E+u8swEXiuCkszrRansphyahcidEHzbpjsdz3SVvqCCdn?=
 =?us-ascii?Q?RCX3vGcUXGszbUZw9KnOzGML63xWNPHyi+EKuqogWBR6BIQhdcxTlvt9CSVK?=
 =?us-ascii?Q?eRwEKA420t/IU+g64TdDBEGxfEX+idCtEh1sO5EedTVC7NbPVui4R3vfNJY9?=
 =?us-ascii?Q?79bBjHkqSL++q81W6K7rBnHb6Vi4pLa9OB3WGBO/4FALEl9lQzB/rvbTY81O?=
 =?us-ascii?Q?hH4jwT7zDZECOJQWI9FgEE35p1IS/bHPeErXFOFFJl2v9J8YNDjtyMXW0vgO?=
 =?us-ascii?Q?uRYu287nAKRiiKNkPsFKMA1wEvJfH5SDeaVYt76b/6FkSqti+7zA8A3Sn2Lq?=
 =?us-ascii?Q?QVICanTsV8WqQ94e1P+rEIYn8AQgA5zRiknmlpHizGt63OT7LZEqHsR3Ed0y?=
 =?us-ascii?Q?/g4QuM3N4m54AkrzMxvg2fcXVIbh19HHvXK/2CJgSbvPEcBgVQK+EN9oPCgX?=
 =?us-ascii?Q?eID4Zy3CVt4QV5HgjH0Zk/wjfMOTWMD7w0IQscgMUvBUgc4tBKeSIPsaR1Qo?=
 =?us-ascii?Q?55KCFtn11gZvEUwJXzhRQxVi6OTOv0t6wzj4A+Fg8kBpd9iyO0EeJLTrbEJk?=
 =?us-ascii?Q?YdRSouQZ+m9bQHxsRUHY07ZfEU4Xcq0zeUWBveL4qANT5CHPxcL++9DynZWO?=
 =?us-ascii?Q?iTwLTzz+IowAErB7D74Lvh/18EexRjI9wO2xYoyZ22+CA1VocMqGiznhc3ED?=
 =?us-ascii?Q?nfoJHoySfrEsoefnUXmPjTQ7EO4Rg1OjcgI2SrJRRh4CIVgwbubBPDAxbxwm?=
 =?us-ascii?Q?gNjSgKjEj+t9C63zKuhpLM8Q7WFg7gEnYw67peymoiC1mW7jHPAcJhu5Nf7H?=
 =?us-ascii?Q?yRYcFSqt5jcg6d15vSSIMVwBo1U8X/E+noWVhGy7SnQjGw/Fg44baRWOGF+f?=
 =?us-ascii?Q?Of986uGRKQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b597c2-7836-4e13-2ec2-08de62d218ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 03:12:43.9356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IzlQMyRd7cc3xV8sLIEnCMJ7QmY91CRL5pfZEyHpSR/Y9HqBC7PeFiY8RmtNMWuJNKcL0dF7xN06Px2IGoxWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12271
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16529-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Queue-Id: 39E04D4008
X-Rspamd-Action: no action

Update dt binding document and update driver to suppot ASRC on i.MX952.

Changes in v3:
- add Reviewed-by from Daniel in patch 1/4
- swap the patch 2/4 and patch 3/4
- use regmap_read_poll_timeout in the fsl_asrc_m2m_output_ready()
- refine the code in asrc_m2m_device_run()

Changes in v2:
- update commit message for add more infos
- split original patch 2/3 to two patches: patch 2/4 3/4
- use size_add() in patch 4/4

Shengjiu Wang (4):
  ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
  ASoC: fsl_asrc_m2m: Add option to start ASRC before DMA device for M2M
  ASoC: fsl_asrc: Add support for i.MX952 platform
  ASoC: fsl_asrc_dma: allocate memory from dma device

 .../bindings/sound/fsl,imx-asrc.yaml          |  1 +
 sound/soc/fsl/fsl_asrc.c                      | 39 +++++++++++++++
 sound/soc/fsl/fsl_asrc.h                      | 18 +++++++
 sound/soc/fsl/fsl_asrc_common.h               |  4 ++
 sound/soc/fsl/fsl_asrc_dma.c                  | 48 ++++++++++++++++---
 sound/soc/fsl/fsl_asrc_m2m.c                  |  8 +++-
 6 files changed, 110 insertions(+), 8 deletions(-)

-- 
2.34.1


