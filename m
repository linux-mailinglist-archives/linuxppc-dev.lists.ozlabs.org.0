Return-Path: <linuxppc-dev+bounces-2685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 566299B4FA7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 17:43:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdGKy5Ztmz2yT0;
	Wed, 30 Oct 2024 03:43:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730220230;
	cv=pass; b=BeYVk5lL7kcfw0g5F2A1nouYQpSEasQB9jVmM26bc6dOcgy3wg+c165bT09MNe4vtpqtTCp1b8iSp3IKJajgP5wmrDdwYntzw5SyLARfj42zOxWDdNjMdYbf5y6mSyHCrDe82eu7N10d7G/M/FuWInXRl0hICmTlp2ewKPmjs6aXH+BLA6U/wkF7GwQ+Y3FDYge/O87By0XGbsV5TDwtk/OgOqBVWuwi4j7dlTN9WE8Rrl2V/rMd6zOT8jC/UiOYOc7kPZMqG78oEqKencQMrbenkTTP/zmBU0o78xNxZkw/Oe4ob1EnoV89ubMksWYJsF5JhAa3DCgwoaEQpQLaOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730220230; c=relaxed/relaxed;
	bh=VkApmrDbUSPp71WaQrlawAii4CZ/z02WBYhBpQyQIh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X9zSCsZmusihP+ph+KbhYmg822v2Dx9jybDh5S6W1qVi8ZVjQr8HhOkHWuKsY7jh5K/FWZqN9B2sbB1PqpojPFZRUmvbILCj++5jvRWhayVRi2/hNR5CLb4WYdN2qjjaXeNM82pWxhcDXudTbXYSchXmhtEOAQuzlnHKOfZQC6CJr7xDi4/lH6B1w7w6ICu9I4zSMChevVS3/GRoxOpsoeI8ROaATQNW/V3f+1Okv/k1q9n35hfafb18QU1lX8TTqRdYIKsnDoE8eKHmib7ib6od/2+t87TIkLeItylFBcooFPlG14tmO7FDqOeJm0kyba1oc/s/H8Om0j6mCk3NxA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VwhvtTvA; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::609; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VwhvtTvA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::609; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdGKy0NYYz2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 03:43:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRViAvulY3o+f3ZWFivmVbGq8usjapnlOeAsZWM76cTKIDL5htkoP2fBZBfNLBQbzq7OJe4Y7jyDrcO4NUUMgl6IA/ogZLneD3brmkd57cmHox2S25gEWJpS0xh7oFRZqsh+TTag+6G2GndEM9tOJorRe3pDNkeuQjWJdQ6obbHucwVkLrmnU3SP05jDt0g8joVI4jYZdrYXpTvNIVGm11/s5D6zJqJFIFjyYZvBVDg9J9IXRUlKoyfA3PkrEMSS4vx4NrBMWKw+OiLQlbLVRloX4Bpi6klvrmxK39mZ0djaY6nojYjw8VqLe0Er0MCBmXN3TwoDsQC0FJ0gruH49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkApmrDbUSPp71WaQrlawAii4CZ/z02WBYhBpQyQIh4=;
 b=qCDEaeQBZ741Q9gTFVjBD/VzVBI3EzEKT1HSrUtVhuRmGOB7Jm2sCIwBq4hch/owwWpVwashXHIawDJirbs0vG1KITASF6ycM9bsrUy4JMhBZ49lOsojehN6lds+b1IZ774wJAHizVn4ntGfIeS5oImkWSidlHiSIorYLGNVQukTXuCRA6D7SA4mwpZjNHByITLIeI0E2ZSpA8vHWA6OxPhWDXjRbCT9Y/FzSwu6Yuv22434DDkGFUJXYOsfS7iTzYeu1knZtCrhFkdT1h6aGmpJBx8U7f492lAKQY+2DHMC6w+XwXfRXkS1gbx8J5V0wgVBvh45KAGoe99SapfQVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkApmrDbUSPp71WaQrlawAii4CZ/z02WBYhBpQyQIh4=;
 b=VwhvtTvAP1uBCtpDVG9+IQurw4LDN+oYJv+iDwdrIPGIytfK/uWPcmPuddyiYne7ceonk/eaCpNTGIw64OHiLGiG8tgalrtqBHlABN+YqbIH8yz6YXHMFeoKI8gnNzDne0p0NulN/pubnewc48b+k1mb1MKt7XXU7J+OdHliA/vQL885usuL4WS53TalVpJSpoR7SY7Hul9UyAxf1rBKrwaXPyDO+au5Jj6Pm7AD+McOCqvQtrA3cQexKInUZDukqPqDg2n5J/RBR9UYafyR2LMAjIrXPMILFvn8h16UFA7zdDDnETKj6PLu/5kJHhm4XqeuNrqI/grAekG3Bouzdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 16:43:30 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 16:43:30 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Radu Bulie <radu-andrei.bulie@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 1/3] soc: fsl_qbman: use be16_to_cpu() in qm_sg_entry_get_off()
Date: Tue, 29 Oct 2024 18:43:15 +0200
Message-Id: <20241029164317.50182-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029164317.50182-1-vladimir.oltean@nxp.com>
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7fc9cd-f088-42af-1959-08dcf838d1a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9qug7P3Pwze1ZPTn9k+xlKv2NDiiEMgWOZTP0LsplsVOrbfSzrBw7fOOEx/L?=
 =?us-ascii?Q?z01QA5+nDuL41XnAvYJrVCHUbTf5eKzERu9OXkGKgPACgtJK2hOLQWQRzo76?=
 =?us-ascii?Q?l/hXKFPPTyJXm8yDcUrEs6wDrR/1Q8VJCFel1KH82O43FdGPbBlBQu7smal6?=
 =?us-ascii?Q?+dl9pkBej5RU3iWG5T3meO3aaucBwYOQUb0Z/VeuOB7g9GExvYD+6bAebj3Z?=
 =?us-ascii?Q?UIOLZau3mZ8DNnyMlXoJlvd6r8KElPuE1wLZKg7uADGfzSkggK8hTW9KqbRZ?=
 =?us-ascii?Q?XqdcRF5H0N6LpwM9+FdhGITWuBQsgVT8zxoB9MwJ4gMRaeOVitrEaYiiZ1gD?=
 =?us-ascii?Q?JZu1fa5K4CVmfDsQQfUGvkkBYUqnMY90JXjBaUMOoWl9rRkbdERraG8CoQwe?=
 =?us-ascii?Q?4wVh9fH7ivg0vWtZgg6dMYO6yeoeaWNHt1aW/KlM6RwjQOMjdAnwShxkHYW5?=
 =?us-ascii?Q?b0RU2Jif3RJWYa4Qg8ADx44VhOuXwbNUJ4Ckj/f/M6HB64ch1TDDwuVCe6Qi?=
 =?us-ascii?Q?EuVzLErDX2futbEcEfrU9i+HAIvLSEvB0QUjCPWLcwbjjOrGopUXvLQz/UPt?=
 =?us-ascii?Q?Kcf8EWBLhULHn8957qadrmZUaN//AsgzoIg9BlQc+E/dRgs3EofaWH8obhlq?=
 =?us-ascii?Q?GbM3jaQn5clWaBaeI/bURt5353pyyjwwiSINSttV0juKqm/SbPbLz75ZE3XT?=
 =?us-ascii?Q?nq1a1uo5fAmuNBoyrNDhqnaxmzRPHb2ycfHrj0wycvSSadKbh+RvuKPFOtZB?=
 =?us-ascii?Q?VDUxIXRKAay2haFgXvGeUFjqMGhrbhb9MjkmqY3lZXRDx73FvoegM6zNWyfN?=
 =?us-ascii?Q?Y4d+1bDmPBEqgv7jMLOua3WyL9juvHUJ6MnSXsa1UkggON+QE62c13ywA3Qs?=
 =?us-ascii?Q?Ish1yIHA8g5kbEH2VH+QnpF8Oq5WJVKl5z6VNOucReZilMJ/6FYcyvdL+S9f?=
 =?us-ascii?Q?BzdIoWDnYOrcBKdXrzvsOpHGcUtAO8UnZrvuSLSBchnMeqelWl1p4xfkYxCn?=
 =?us-ascii?Q?/3zbJlLbtjB2W0Wf9EVbKdZ7DmtFa5qYaMvoNRoAYoY9idVFXVZYZYRSbAoR?=
 =?us-ascii?Q?59jtE3+fy7tD9UQfdIK12lh0P9YKTCw+tL/myKDaokh6KNPMapREZ4XrjQKU?=
 =?us-ascii?Q?w1I6DMLiLqLyXFVOjWiCKjKWEu7JbECcJpjcUizS0qgh6yYIQKqIZ5pMFD8z?=
 =?us-ascii?Q?m++QY/bdjwQfW0ldW4FPZtn8mp2J3Bw7RT18AIE95zRNNv+UJT1Lq6n0Pem1?=
 =?us-ascii?Q?a2bN6jZsZtoQr5+CGiGiUv9CRFIRmqA9TI2VnMcTiS+hjScMPdCO6+VBSvP0?=
 =?us-ascii?Q?y/ftux3np/iWlq1126tIQasLDSy8BySXFtC9vfhIbMtXqUXm+0oB69nB43Sk?=
 =?us-ascii?Q?c8AMus4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mdK2O1TMY7Y1UWu3WhQF7o9KmpJIqdVqTtRrZA1jrKLiDHioIGgLJcmgia7P?=
 =?us-ascii?Q?k/Ex7BIyLNBzGufu3lBbalGbd5BO/ZCVB2x0jV/0IzCAVUjv8kBtZ1d7hXjQ?=
 =?us-ascii?Q?NfQUKVVrbNaQR549ja+Lju2hrSOW55riHS/hzXaR4goYrrSeM4BKZRc2Yvpc?=
 =?us-ascii?Q?5Dr5ZdHICR6N0UPF2rwmzHT8E5x2EVqnV5l2Cn6d+l8FY8kKyGuWcnM0O+ZU?=
 =?us-ascii?Q?a5t+O0tiqU/K2nWtuxkcRoQQt74/XFdpASYIb7grnuLX4tPn8PiQy9/VsNxd?=
 =?us-ascii?Q?1+2v7lYtcFPm4HtVz8HX7CsigSDpuj8W3CeL/yyoi1Xzbp/bXUwEfe8GfmYB?=
 =?us-ascii?Q?X+m8KRakmI0LTOxnu+VH3TaGxKjLjXq0Q3paTZ/jtEMqqTbVvZzZWPJv8AC4?=
 =?us-ascii?Q?S0mirB/w0TEoLxXQg/EF0nQMSoRtw+vMsV0qoDhFYS589zm98CxiakJ+hlZH?=
 =?us-ascii?Q?3N0Idb43/SX+5p17zJohjZNsya/bRxPIfaZ0WpgmFBo/QPiHPZk93tOL1HxF?=
 =?us-ascii?Q?KjIViAZWE2okgRpmcetrGB9OmF6BHUyNsN+9Iz9nPYPZoRw5qFENdSM7jFzW?=
 =?us-ascii?Q?77JA4mkpPAsO02vkoO4m2qYhFioDdJkwTy0ANRDLRfhht096WrB3FA/bQIBC?=
 =?us-ascii?Q?/zZv6MBijKwwhTagtaptS9/54iUm3X0wCBrDFoiVcvJwtqEuSKgfIp7UnkpZ?=
 =?us-ascii?Q?MC2MINapR+sYWTb837+nw7BBhkpg/SRmL3tu/2faFZTpc64wvuo2+t6hWFv8?=
 =?us-ascii?Q?5FNfd8BbaZxOxv9Vx+Od8sR6gBzULQ8Z7AoWiGK14p+9IVQ1blvj+4HVz4GL?=
 =?us-ascii?Q?iMsY0tMJGkzuv0oxYpqhxauexOLGQmlDhqGME4wR9yunVj2PWZ0QREMYkMSj?=
 =?us-ascii?Q?Kzyn8o3OPLJql9qn95RQ4pdASPum+CsYC/ZGy1vqT36fc59Hmv1GSUSSUKre?=
 =?us-ascii?Q?+6/aaqAE0N7+i2ejU3WoM1/hltvYVtWL8+QZWm+aWDhSnBTZqqHleLOUksc6?=
 =?us-ascii?Q?UlK5Kj0MQ0ULoP2bOBQZhPK6XA0xgTMYL5dVWeNxawp2fdh1L/XyoN1RRxM4?=
 =?us-ascii?Q?OjYo8Sq4UJmlUWkG9dSUqLjlPDl5rH8hEgYwcAQCeoKgKlsUPoeQjEvg7+32?=
 =?us-ascii?Q?JB6bGbKboz4/1uuyGOiCyXNtOqmv8KgSfkTTMdi3e4c52ltiZCbxZc9rysl+?=
 =?us-ascii?Q?t83+zw0mH/tENXruUSJDWl71DNO3Jp5pusXVFG5LguB2d7nd34WRXQoH58LW?=
 =?us-ascii?Q?aCS+VIurlrv4QEULIiycxG0BA7kqVbkiINbk+sZXitF5yf+u6gEDNy9FL84x?=
 =?us-ascii?Q?Q8g3hxMs9Vw8A6hDpFKhfSWbLnz9PdnAMqTwrw7L/lJ1Zb82xNwNC/0wSQPT?=
 =?us-ascii?Q?DTaAyK2MQDDe1sHKKNwXqucPVyd9AuqsiuonkiRZOam09DR6kN0uXtGLa5Dc?=
 =?us-ascii?Q?x0V7067tXt+/gybdbDqyYiO3xiaszUkZF9H3TlABwdE4XjOOf+ua+a7RRTa9?=
 =?us-ascii?Q?X8CxUwCAAPy7TeMJrCz67MAq5cpCDdZdZDYXfZ98Xu7f6OyG5WhzCFAsrg/o?=
 =?us-ascii?Q?0/fPeeDChNET8P4uOBpV4sO++c2PK4bEAzyFa4DGZkTc/13dmY+F8chFXqCj?=
 =?us-ascii?Q?4A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7fc9cd-f088-42af-1959-08dcf838d1a8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:43:30.3440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lk/KlnCkv7eyyTI8yLsFvYiET+jwIPi9KDjsf8QtcGekzwdoBfGBFu62Xttqv8YRgGxBBE/PhiV5uSK6k5/P6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

struct qm_sg_entry :: offset is a 13-bit field, declared as __be16.

When using be32_to_cpu(), a wrong value will be calculated on little
endian systems (Arm), because type promotion from 16-bit to 32-bit,
which is done before the byte swap and always in the CPU native
endianness, changes the value of the scatter/gather list entry offset in
big-endian interpretation (adds two zero bytes in the LSB interpretation).
The result of the byte swap is ANDed with GENMASK(12, 0), so the result
is always zero, because only those bytes added by type promotion remain
after the application of the bit mask.

The impact of the bug is that scatter/gather frames with a non-zero
offset into the buffer are treated by the driver as if they had a zero
offset. This is all in theory, because in practice, qm_sg_entry_get_off()
has a single caller, where the bug is inconsequential, because at that
call site the buffer offset will always be zero, as will be explained in
the subsequent change.

Flagged by sparse:

warning: cast to restricted __be32
warning: cast from restricted __be16

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 include/soc/fsl/qman.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/fsl/qman.h b/include/soc/fsl/qman.h
index 0d3d6beb7fdb..7f7a4932d7f1 100644
--- a/include/soc/fsl/qman.h
+++ b/include/soc/fsl/qman.h
@@ -242,7 +242,7 @@ static inline void qm_sg_entry_set_f(struct qm_sg_entry *sg, int len)
 
 static inline int qm_sg_entry_get_off(const struct qm_sg_entry *sg)
 {
-	return be32_to_cpu(sg->offset) & QM_SG_OFF_MASK;
+	return be16_to_cpu(sg->offset) & QM_SG_OFF_MASK;
 }
 
 /* "Frame Dequeue Response" */
-- 
2.34.1


