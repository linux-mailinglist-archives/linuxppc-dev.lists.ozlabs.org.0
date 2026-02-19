Return-Path: <linuxppc-dev+bounces-16955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HWtKqZ/l2kOzQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:24:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D8F162C01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:24:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH5xZ5z5nz2xN5;
	Fri, 20 Feb 2026 08:24:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771524885;
	cv=pass; b=WkB4zewBE2tQd49J0sraLiIx3jIWT0a23oHTsxkD+9sf4MdgOZ6ut0NNh1oUxPdbw1oP19E4ilDxUeIXpd1vJOk/SyqwrdMcAJWQBFUp4anCtd2s+gsiH6PvlXn9DP22z70A2noYdta2QsOEADandyDHN9OnctB44U7+7WQ2hknBOou+N4btFBkVezY1tPXWCmtjpRO4QGyD7xdKmmm61CNXJpcVXIxZwC9WnLg4eu0hxM6IP38TdHzkjWFsudTofjQYrvVTKRwLKMg8Z9FqvorY26mQCM8JTBydc/CeoWSfyc100TqCvTcx7IoRleEzYPS9LK3FdSYQRFJ0WPFUvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771524885; c=relaxed/relaxed;
	bh=4xbAOul5b8jY2HHKd0/CR/Nj4YU7dqrPThGNTl0SCqM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CreRR9dzLkPmqECDlDCu+giwRnYu/IzQMqEDdPSJVOo3ESlfmo59hXLjkMQgvc3AHJuCHfNK/Dzu0I5qMYxgN62sBxOooxjdwKryqnqF+ikK8LQ+iwCNcfHUXUYrUdEcSM7izrEBu7v5DtHvk7CjHeQXIjzQm6FeDUI6xaCpZ9oKjxmbJm+vPsk0jSphO6ndHYzelEiFagQXDQZWRuSxUN+LEx8bqfOM0sAoikIaVICBwtHSZwTmn2AhBq305LTO4CNz7G2Up6RqMq3utrLXDhfpzzq4/wN1u06GhYv97mQognSZ7k1dtjJBq/ON3y7KBC+VQpr+jei1+Xlb7axGww==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QVAkWKD2; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QVAkWKD2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH1kD1HXzz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 05:14:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLhW2xKOdSv0R2FsliYyKRWdqMqnKjAKfdYHdXi4nNkJXxug2peploDyMiSDRkSCiubBOLS0wda2yDs3WbwTpmAuEOEBi26/wwPLlxHCw6Y4yqmZO++omjIUwqLC7dCK3HOYUbCgDhuCsIyUsitylVIvv1fkNGgpruBemqv9JR+3z0xjXmNvGecTNwTDa7pjkMLxZqGv/2/1zWfXU12CN79Ha4REoEx8IPOjv+vu1IsTbx2CFCpenFB0Ik/50S6hC52dSIpOg9T6nN3lIErxjsQ996ubmK7jK8KcD5AL6WMEVZgDPeH3rsvUVd92rcXpBhaVH5P0+sN7/RZ66K89Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xbAOul5b8jY2HHKd0/CR/Nj4YU7dqrPThGNTl0SCqM=;
 b=yHnI/hYC+Wld7tSEULkC9AbUPV2d7L5ik3G1euRedORbk0OIavYqkqROpgeylK/y79cODkh8aILiYsFJ7aroL7Hei9oZclMu7iQ+pdXoY7a6dMuvPcamO79VBPui4tQiHYAuh9SKYJVmfzZuhSouXJwpGWkxiCv/ipiZotr0MRLtGwHp5JIPGU37TaUgK6EW+DNKMuHXDHSdDY0/MpqgwrzgZFUVV/mKu6iZxjKhcyTK+2jEl5IdgV1oMU2wUeHOpkzFIl0XgUo1G0CQ9J8ZdZwUyOA8cTTE7OqXOU9ijKA7KA8CCuqDRqvAiPF2KDUDBYuxYmsbYul4cKYR3Ji7tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xbAOul5b8jY2HHKd0/CR/Nj4YU7dqrPThGNTl0SCqM=;
 b=QVAkWKD2wW5d99kDS8SJUiOIf8sR9me6kIqMMvIeCQ1UM1bNvqmBKn3K4/S3xGxoOJ5b/yzxwG0LqSElNBby+lR5mGSuDoIGZ3oz8WSd2nIPfQzPSIkOmWm7roHsH20+iLPxjBs2JtpDoNP2njA9fpeokYHzlerpC4fivwrj/vujuSysfGSRKYRHJhgZ8NhT2WCDm/Y6WAQ9nDAZddc1HgDJJVkdnEkukg64rUltrjRbyEeI3VQbe3WKhpN/g5QyMwnWeCJ0wJF7noj8FSuaEHRDqDDDlgwsp05y92eLkAyRXeqt9GPOGco1DnG4fQ395mqRNm4iX+2OCOzhMTLMVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 18:14:11 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:14:10 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Antoine Tenart <atenart@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Ingo Molnar <mingo@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Jerin Jacob <jerinj@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Yajun Deng <yajun.deng@linux.dev>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	hariprasad <hkelam@marvell.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 00/12] cleanup bitmaps printing in sysfs
Date: Thu, 19 Feb 2026 13:13:52 -0500
Message-ID: <20260219181407.290201-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0146.namprd04.prod.outlook.com
 (2603:10b6:408:ed::31) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 95594654-ab1f-4b64-1d7c-08de6fe2adc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ylwAa26eKvDTRWjoxYTQl53W2tWXlgE3Oc83pTdGzFEZ6j3wf3xx8CUtn17Q?=
 =?us-ascii?Q?EgKgmb8//5+U4qoXpbtl9nmf3/kYAr94lXBNmWXRVzNMgDa38xSPObUC7Ff7?=
 =?us-ascii?Q?uzLtmcsRn7m1CqMUJxiScRYp1VJbGHFQw/v4zuHd4hOHkhutjctqtg9vd/xN?=
 =?us-ascii?Q?P29izKVtK1dAa2VgphWzmq6W6Syqmiwj6rh9ebRTVVU/7rzrakTceFAYw2GC?=
 =?us-ascii?Q?wzJHvVj2wZtyzKExq5R+8hDREUXlJJhcE9RDygwpcUmMjXgo+gXD6OToIbCq?=
 =?us-ascii?Q?SmozqtyN/SaCUhM5F13doxyX/pw3k3YJ9yY/hkyyQybqLk8ZNkKMcoA9m1Mk?=
 =?us-ascii?Q?vtTGzuuLot+nzBMry19nTuZDMeQO0cKiwlnOB8mamBlESOj3uKIXHdBS3h+N?=
 =?us-ascii?Q?6+Eh3C51N/Fc+xPSlV1gYuwB222LMl+wH6/5NUCfnaxqGhZ12dgylOUaPstm?=
 =?us-ascii?Q?lewQiLuvbtcKn+TdtIJwv3OqP6qjiX1tix1jYNlboE1ej5220BRd+8YDo1me?=
 =?us-ascii?Q?78GMnJZE08KuKUuWb2wrO470lvJ1R2KaeXHjeE9gyCi0QsSuazMC/lmrBRSx?=
 =?us-ascii?Q?tRbIgxkU03pO8J8C9gEOlR8dXcOVTOX/URIkBQ9JWh0Pqlh8KRCAqTC/Rq0t?=
 =?us-ascii?Q?xj2jO13Kl2Ds2y5hqrgZpv4TabdN8c+jq3Ncg6QuWJoGGhinGQVmmJIslhSX?=
 =?us-ascii?Q?Ma+7P/A2OWeGmo5Hj76uP87rMhgEurh7VrDp3LJZCm/w0tbwjzTxXuw6X+B6?=
 =?us-ascii?Q?y9LvX8d1N4OO+Z9/KT2clfnzIX4SQslQpzdjeKyzNzGecrWHYCazPx90T+K/?=
 =?us-ascii?Q?5DBdOd7TtI0cbBVwdJjvw2Trwu6eWFQVl4SwqTZ5j2DbJlPfSrt46YYTz9rQ?=
 =?us-ascii?Q?sqn4NlkZfxYAZCnAgXOWD4ginfNLHYxl4N8rkLsbfuYY2Gh43YAmg3WY5zJ0?=
 =?us-ascii?Q?kZy5BdAXMiBlUGbvgomF8SN99Imb9OqqUcBIuP4tIa23d24v3zoa4nehy0sL?=
 =?us-ascii?Q?Cpp7Vdn4hJIwRhupKOUqi197RJk5aCxeuNcCgAnPdT4qVfFL8PXGqC+ruBnb?=
 =?us-ascii?Q?ge7PvX3u7fY1gpJsGeOPUfdH0jeefRbydtjfLuPjB2xvVR2Zgw6Vr059q78m?=
 =?us-ascii?Q?f118O7AL/5QQn0kk4gxvY6uZWEc3aDoE/b6n1XX0wd8b4RqjQ+GTak3zqrFz?=
 =?us-ascii?Q?kZgKRz769zGNZN9Kljoti0Cmyw7bweoYY2kcwiBBrM8VJ6cfnqo2eHa2hTDB?=
 =?us-ascii?Q?lH5WIeVaMyBgaYk3On1+ZvU9Wtjr6JDKpGpaKqJHP+JwF3bur5HVsgoJOVnr?=
 =?us-ascii?Q?TMlADmZk73V7odMQmOCjccUoStOxArmi6NfvnrdlOvnLxTDEdrmI13GpOvq8?=
 =?us-ascii?Q?oP5NPs9yc11nZVkFFrRUYwZACvv7xfAfrzVnJIpoJFtqkHoidvmvURDo/ZHV?=
 =?us-ascii?Q?okyu790rVoExEjxsGES+9goT/L3TqNGciHfNbYBDeF36SHW9jPG3fq101Uqe?=
 =?us-ascii?Q?1OhZGVyogk8Plj0WDRmoy6d5OwIuA06rQF5IKCuZj8OSRs5U+HJXVgi57bzN?=
 =?us-ascii?Q?b7vmA6yCNHHIcb3GrL30fxFbLH9ktnLqkEv/VU3J3qf5x6EYpsZAF4V+VSwJ?=
 =?us-ascii?Q?wA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GY+dhMEsv6f9haOebPfabM/pikAhTM3FIYck+ggOILMzp9mGAlKnbNt4nUbc?=
 =?us-ascii?Q?Npfwl4whsC1IzWpQwJt7271H9ECFzKtS56xXtN650/r1+K2BYIRColJTtVER?=
 =?us-ascii?Q?q0VSp8wFXw+cHqsPxrsuujrGovWU0pWL/qzaW3HRjQJilyNyc26dfnTTUJ+Z?=
 =?us-ascii?Q?kHcBPRVSZIx6BN2Z/mkbDHX9Je+SN7yWski8ajL6YFmM/RSKEE9Bw8ZLTAp9?=
 =?us-ascii?Q?R78flduFJ+7PCyKOnMPY8N1yIAdf7F3YliVNKu9gslupN1lH6vL5nAQGjVE4?=
 =?us-ascii?Q?m45FC0ImEQ7E7zZpnisisILh9ajTVAhPCGwx1gy4ca/bVAqVQD2z9Yi8/HNS?=
 =?us-ascii?Q?ZkqOhxxwOktsGQlHNNLA8R7iDVUY2CXJ+yyWWDFxZFweo3XjWm0bZ/BrVqM+?=
 =?us-ascii?Q?ORtoG69EVjekRaKQn/Yhrw/p4rxgJRLthlyH+RpAZL1HrSH3VYqsGZxMO+yq?=
 =?us-ascii?Q?941JhqQsBEaIM3wVUCYHIbhPcfeLjn8N4bIfHii8c6VpaPOlbA4w4LC3N+21?=
 =?us-ascii?Q?8njGeI3t8m++MN3/0YKWJFOn8zsbT00sTCk25EagnS0Ma3DyNN8wKNeLOuXV?=
 =?us-ascii?Q?yyA0NndOMny6YuxVZPFcfrj1rpsZy2DN3/oE1uFWFunypB//VOgzLVWnpGtM?=
 =?us-ascii?Q?tmD47joCUHT1O+UQKJRX3iwv9sZFHJKvNyKwesc6SteNAA+/Qx3qLZeRBV2I?=
 =?us-ascii?Q?Cmp7LGMq5md3mU6r+bG7a7vgu3STlCf2gmhTjUPRuX8LdB8Ajq8qkx4u29HZ?=
 =?us-ascii?Q?1Dt/YEmWMGDtftVktOuRjBNBugtjy4YsBU0+gFv1btMVIAuzCcI2dR6MlMVF?=
 =?us-ascii?Q?qNqac7kHr21688PsmcRXMOHBtpGSz7Tc24p//H3Rt7pDjEOarbFh1aQ2CZIH?=
 =?us-ascii?Q?UhxwH7q0prPMc42Q+grHwZF6lB1Iy7jMFA8bBe6XUObj2ckMUKbXhbCTmSBS?=
 =?us-ascii?Q?FRJub2Rhmm3oIOks+/IpSCCQ/2ueYH/X9KMqUOdCnJHGXzXZ3m+n0yfqqX49?=
 =?us-ascii?Q?Ft6GToe8dVZ7PIEw51AIB9T2dyPQqQXQMDLpu4MX6AYd8bPO5QbUSXv4lriD?=
 =?us-ascii?Q?DQ63T4D4LN/gx1v6V0hfGNECjFpsF9DyV1tu0no8O/z9ZkyxLKfxeE20PeI+?=
 =?us-ascii?Q?XMm4LiW29a6kj2X5eB8aeilLtpf7jEFQvt3ruBYFv0V7PICSsDN0eUMjcCf3?=
 =?us-ascii?Q?8TOtcAQxX8jJapuq9MdUn5N2iM+d5scdHviSQMuTJLA3H6VlPszZZIwidfer?=
 =?us-ascii?Q?u8EQG0v3K7LPDV3ciKvRnJBlBJsfbksMFJa7I2GNdd6wrPrMKwPZLCsxYfR9?=
 =?us-ascii?Q?8GE9Sn9gHTkeFMWkgf5nJh6G9CkXcZZl3AGJMtvLbQKw+3fnn9AWgAzxYSkG?=
 =?us-ascii?Q?LSp50JtR3Mz+vJcv8D5b+cQIHSIoIps8bY0OGZpoU1MvXEwBjoyyRyJ/dbEW?=
 =?us-ascii?Q?UMNvgA6vS7z6ummyFOK0SGutO6aBn4aVkbwksenAut8FtcsYKFPrub/hWZ+u?=
 =?us-ascii?Q?UknDSi/EAfW3rFj6G25iwUSOZ4YAOEwGuhG6bB8F2aHvFCoLimvv/Ijg45Vc?=
 =?us-ascii?Q?I/s5LvXNU/i/Sjkz9AUQA6TSdlCtzbCrAyiDrayNCSBrwUjvRL4XJ/CN0Ljy?=
 =?us-ascii?Q?aZGg6v4dfn79im5BHoqCbR4t9hUz8d0goOG3viHGrkmjceo//oFAm2HjwdTV?=
 =?us-ascii?Q?eM4rVlRBojw7IoyTbupPKOzW8iyhlKIvlrOsyI6eSmDr1UVLGrddfbm7dDER?=
 =?us-ascii?Q?ryJEWGGom4wlZb11rpiJfxuN6s9ITB0x5a24nicyKtQ/nHl+Psvq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95594654-ab1f-4b64-1d7c-08de6fe2adc2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:14:10.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKc3KNBJ6MrnqtD3WphYpe2e8lr7vxluyOmHHH+4fP1y/doKOxDRm/DKRQ6IMRHAO0GPGz4muo+WsCHrYCFGPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,davemloft.net,infradead.org,linux.intel.com,lunn.ch,linux-foundation.org,linaro.org,google.com,marvell.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,rasmusvillemoes.dk,fomichev.me,intel.com,linux.dev,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:davem@davemloft.net,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:andrew+netdev@lunn.ch,m:akpm@linux-foundation.org,m:atenart@kernel.org,m:brauner@kernel.org,m:daniel.lezcano@linaro.org,m:edumazet@google.com,m:gakula@marvell.com,m:mingo@kernel.org,m:kuba@kernel.org,m:james.clark@linaro.org,m:jerinj@marvell.com,m:lcherian@marvell.com,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:pabeni@redhat.com,m:linux@rasmusvillemoes.dk,m:horms@kernel.org,m:sdf@fomichev.me,m:sbhatta@marvell.com,m:sgoutham@marvell.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:yilun.xu@intel.com,m:yajun.deng@linux.dev,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:hkelam@marvell.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@l
 ists.ozlabs.org,m:netdev@vger.kernel.org,m:ynorov@nvidia.com,m:andrew@lunn.ch,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16955-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: B8D8F162C01
X-Rspamd-Action: no action

Bitmap API has a bitmap_print_to_pagebuf() function that is intended to
print bitmap into a human readable format, making sure that the output
string will not get big enough to cross the current page limit.

Some drivers use this function immediately before passing the result to
seq_printf() with no modification. This is useless because seq_pritf()
takes care of not overflowing the buffer by itself, and perfectly prints
bitmaps with "%*pb[l]".

The first 6 patches of the series convert such bitmap_print_to_pagebuf()
users to just print the bitmap with seq_printf().

Patch #7 adds (actually moves from net/p9 driver) a handy macro
rest_of_page() and applies it globally.

The rest of the series switches all other users to scnprintf("%*pb[l]"),
so that users wont abuse kmalloc() + bitmap_print_to_pagebuf().

Patches 1-6 may be applied individually, or together with the rest of
the series, at maintainers' discretion.

Yury Norov (12):
  powerpc/xive: simplify xive_spapr_debug_show()
  octeontx2-af: siplify rvu_debugfs
  thermal: intel: switch cpumask_get() to using
    cpumask_print_to_pagebuf()
  lib/prime_numbers: drop temporary buffer in dump_primes()
  bitmap: switch test to scnprintf("%*pbl")
  bitmap: align test_bitmap output
  mm: add rest_of_page() macro
  coresight: don't use bitmap_print_to_pagebuf()
  fpga: m10bmc-sec: switch show_canceled_csk() to using scnprintf()
  net-sysfs: switch xps_queue_show() to using scnprintf()
  cpumask: switch cpumap_print_to_pagebuf() to using scnprintf()
  bitmap: drop bitmap_print_to_pagebuf()

 arch/arm64/kernel/patching.c                  |  4 +-
 arch/powerpc/lib/code-patching.c              |  6 +--
 arch/powerpc/sysdev/xive/spapr.c              | 12 +-----
 arch/riscv/kernel/sbi.c                       |  4 +-
 arch/s390/kvm/gaccess.c                       |  6 +--
 arch/x86/kvm/emulate.c                        |  4 +-
 drivers/block/null_blk/main.c                 |  6 +--
 drivers/fpga/intel-m10-bmc-sec-update.c       |  3 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c         |  5 +--
 .../hwtracing/coresight/coresight-cti-sysfs.c | 33 +++++++--------
 drivers/md/dm-pcache/backing_dev.h            |  2 +-
 .../marvell/octeontx2/af/rvu_debugfs.c        | 28 +++----------
 drivers/net/ethernet/meta/fbnic/fbnic_tlv.c   |  6 +--
 drivers/s390/net/qeth_core_main.c             |  6 +--
 drivers/spi/spi-pl022.c                       |  3 +-
 drivers/spi/spi.c                             |  4 +-
 drivers/thermal/intel/intel_powerclamp.c      |  3 +-
 fs/ext4/verity.c                              |  3 +-
 fs/f2fs/verity.c                              |  6 +--
 fs/fuse/dev.c                                 |  4 +-
 fs/iomap/buffered-io.c                        |  2 +-
 fs/nfs/pagelist.c                             |  2 +-
 fs/remap_range.c                              |  3 +-
 fs/xfs/scrub/xfile.c                          |  3 +-
 include/crypto/scatterwalk.h                  |  2 +-
 include/linux/bitmap-str.h                    |  1 -
 include/linux/cpumask.h                       | 17 +-------
 include/linux/highmem.h                       | 24 +++++------
 include/linux/iomap.h                         |  2 +-
 include/linux/iov_iter.h                      |  3 +-
 include/linux/mm.h                            |  2 +
 kernel/events/ring_buffer.c                   |  2 +-
 lib/bitmap-str.c                              | 42 +++----------------
 lib/cpumask.c                                 | 17 ++++++++
 lib/iov_iter.c                                |  5 +--
 lib/math/tests/prime_numbers_kunit.c          |  6 +--
 lib/test_bitmap.c                             | 17 ++++----
 net/9p/trans_virtio.c                         |  6 ---
 net/core/net-sysfs.c                          |  2 +-
 sound/virtio/virtio_pcm_msg.c                 |  4 +-
 40 files changed, 111 insertions(+), 199 deletions(-)

-- 
2.43.0


