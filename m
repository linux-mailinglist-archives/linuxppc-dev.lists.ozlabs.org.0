Return-Path: <linuxppc-dev+bounces-7232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A221A6A5B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 13:04:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJPPk1vmPz3054;
	Thu, 20 Mar 2025 23:04:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742472250;
	cv=pass; b=m2JYj77GKSFnYYMEXH5JnxAZJ9k4k986VvBfGF2N7XySJl8+yw/PWDXvbCUkO6oJTUtQ0dGtxtkhrzi0IWLDTu1AB+uSLTYQUkUDJMzk++Q5IYyDtZRyNS4sC4qlvEqbHu4JmHWkKXjZyZ7YLidSN2r7+O0jwLKAUJxAl9GwiTpgJ4vZ2NmgjSohYNYjS4PjaRqZofK29BVhzxHektAVLZFAGDAmp/hNt3RfGYjCRXB4cmHlb9oMOO5Rkq9GGGLWLhUG6V0LZDxFcth8BognmlGfNNgzXyOlge93OhMk0sTje8rQMddO0U7OVGt7I8bSD4xPry7ND2xMo0sY4OSUKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742472250; c=relaxed/relaxed;
	bh=5GgQfeog4lKp71bi/6hNWaAOdYWTEji2MyeDO6XlExE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ha44JowqNA2UG959wbak3sVv29GrbIc1K+ugGbVGUAtPPyk/iajN8bBTajQZU0u3Cwvr+N/QdHqklb7WZNhiXvj4sT47twuIzYE062Lf6cpIqiUfX1PlKF22Vl7bbWFFgJd2F637KuUQA7f/ULaM1eBakAc6vaAcDNP/Xgl3DVuikn657NiCT9rP4duh3VRR59PEIP6eIxO6FA4SEm9ChIZV0D1weRijkLxurb1F+cxcqDUjvNHYnMvIwkgvQmXrtF9utC1SyXOvgi26dRX0gQiO25udn+Urw9ejG70oLiezynhKSrT5EkODjLxuRlUp+4A2liVymAIDucxqii9lRA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZWW6Uv0o; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZWW6Uv0o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJPPj57mBz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 23:04:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDAKq7uR0Fs8vUbsVGfBxddZIlyIR+lSPJZq+B/J/hodLDcpmqMrXnuandYDWEvx4rRfb+i7ygFPT6tDA4pOw7aSoLJmO0ZJ0TaKxFldi0zRPtnEky3Xkfi0vZ2X3g0diqnMTZJt4ejukdFKVdE3M9nTcjLVahsE8LCNq0OPHhjxP+LwAWcF1VDA9SDPsqoxRAqYEgnQut7I64W36QKerUvYR3McyzxdzAn5mE2GYR3q2VcA7ohsDYIFkCPhACc0Z1Usp0BJV/MOXp+KoDUYz+QfQoly8jwoQshkY3/UKdZIrKtPjSfCiTxzN32MNCQqf7CkcVCgv9isSk/BXzebgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GgQfeog4lKp71bi/6hNWaAOdYWTEji2MyeDO6XlExE=;
 b=Vxxu6z9xk3WvEhVNaUdrd7MYgRfpX/MF/5qhjaVLb/FOFn9DwymZalFYQ7WhPC/suWBO8hzwcShyh9KytFwq4s6vC35iWhj9OdgF92asn/2ogpgxmpBrqa5gxIew/dkrcQEkhGj1sc5j/z1/yw8q6LZ2qqW9kyndkUbt9J2zcr7KnPr2Wu4/Gee900G1MiqKWmUopPf0npbhcZsoPksRr5lFGvzTgnD9xCFKxM607YTHk8PkcG9dINe2H7DI2otwP1O+dU3lKa6aCuhcQx2IkamUa5fRdMZ8jYT1zV+tVJelDovYAgm0ckdZ/F5ylUOmQV9ZVeeAaLk1wrQTYA54zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GgQfeog4lKp71bi/6hNWaAOdYWTEji2MyeDO6XlExE=;
 b=ZWW6Uv0orx+jaUEUTVXS3xJH2PmvDyS9sPwkkqAs/opuPmifGJSJFSSUFGzxKvmQV9boC+Op6disipVr9jCPHCmXA5knsfZ0YANQjOy8vRZy+Cc15apWdNlQxYkUnfdfpn7wpqj9OFjm5KChqREwAD01fM6YKZXIdHoVK3FonpsLPt4rp+8npUWqx/cvPF4fqRw4zrfNQgIwtldpQ+x435WKQUIGOeZg6yo4Rq4KgFZcCbuHe0KqFpN7fe4qPCc1e45RHSD9963HLTukRiGfiTGu4qpNytwI0Ox8ZuPz4tY0MJbP+nAQ7S6cnDqJkpKkP0M5osf4ZPHtva3oRJoEuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 12:03:47 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:03:47 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Stuart Yoder <stuyoder@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 2/3] MAINTAINERS: fix nonexistent dtbinding file name
Date: Thu, 20 Mar 2025 14:03:18 +0200
Message-Id: <20250320120319.3520315-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320120319.3520315-1-ioana.ciornei@nxp.com>
References: <20250320120319.3520315-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: da5b0727-8d6e-461a-b25c-08dd67a74544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Eci5rMwFPkI47TTHDxI2rzxdZZcUhIjiAJ57I+h2DRZK3if3B1so6PPncA9?=
 =?us-ascii?Q?VGPwzbFlLg/lHeuoq8LH0FhLd+I1gSByXveZCMsrMz1AbSDVaznN4Hw8+k8N?=
 =?us-ascii?Q?7pQD/5WiIWELQbERno+sbJjGOhngIGkuiF2nb+WvU4L4a2J0ioisy+VgbjAe?=
 =?us-ascii?Q?fDCtEE/ZG8NijdpFKL8Y4o0JlqWfyKZITQp6iVT43BXTifDYe6J65qinEhgA?=
 =?us-ascii?Q?WWOlCdQSH8lJPPTKIQpzASh0VAyGHi0TNYPBw5H2VEzgBhByW01sRh0UosqK?=
 =?us-ascii?Q?wBjeOhmNNaBZY5hXg4NocFbIHEycEDNPru99qcmTpxbBOhBEjETJfKE2zskG?=
 =?us-ascii?Q?+TT8xRAdtCzY7HGr6wjQhlmP7xYHUu2O/EBgpnShm6prUDEOrpKf2KD8yL+C?=
 =?us-ascii?Q?lzWmv1kKzGKHeAwutFJy5PPNueFVuEhqmETbwF5O7a8n6ogIyi3Qd600khAL?=
 =?us-ascii?Q?xWFZoaZ2fGiggH71xkTH6HTcfepv/huS18HD/EQXU6VidcT7fkhKI3ugzcUU?=
 =?us-ascii?Q?6Asdh+2KCuVsto6DCOTJRcGEtwvgzlyxZ+XJ6fBkQNpO0YQ5GixPA+Cv2tqM?=
 =?us-ascii?Q?f+quvg3yxwE3835GUFNOLa97k7yhsRo8L6CgpzB6ElJWSG8In53INVcyTYTd?=
 =?us-ascii?Q?K/ZMz21fxis9AznmpyzoM65RCgshezLg/auI/UCQGIy9xapiGq4dlQNOgFEV?=
 =?us-ascii?Q?QwU9P17QX+pKT1GypJHvB0wgDf2x2hY6caKdUCEKtj8CwOKC65DE84VHKbzt?=
 =?us-ascii?Q?VuvKVEXzxcVt6VQ+W9m8bFJ99xYrpSgAYmhAJelD8oOFHA6/BRAqiuhXExZ1?=
 =?us-ascii?Q?rvrag7hg90ogeLwiS9P/MYR2wyIO+tRiS/xQj//BnOTiRJZSKtQW3KEHFn7J?=
 =?us-ascii?Q?tHbLl0HkVFilt9P8UNCEkzKX0oZb2z2wk8egd1G9U7HmLmAOnZqrKL7x8wZe?=
 =?us-ascii?Q?7VUV7oanhd/DvCbAR3B9yAik+BrsMdsoVC/dTxKZgvGVf0suF2o4La6osANt?=
 =?us-ascii?Q?7jWim47+m6H5Blr/VXtcl+4rmbM7XYp8CZ3tp6EdehDM0jeToAnJMfZ+F2E1?=
 =?us-ascii?Q?QMu37z+uEv0RisBh9OVbMi53CoHse9Puo8G4Gs/Tkwy9humpc2UKqc9zQCvb?=
 =?us-ascii?Q?UdWgMd2nPACfyx+hbflFFU/os/74YAieOo232OZWVPNmLxQav9dj3GXi371W?=
 =?us-ascii?Q?TRXmSAklU1HPTHJJ1bgq7jzKrx770NYI+WsCQvA8fqMV1mEgVKmtdqai8Rin?=
 =?us-ascii?Q?hJdPem6zk0jGPVTN3ipXI8H/wedsq19GXXRNp3JNpT8g9D3Qx/13ZrrK+1M4?=
 =?us-ascii?Q?OXB7sBv6PXM5KK9O+qSWsCRKyt7gmuJm8Mwss+VfhI7MCBCqx3gBxcRtCqDT?=
 =?us-ascii?Q?EcjonwUa6Dw70Po4armSIR5mLhic?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r+EYtmR9dxE0kFnQMPvOvDFJvounHKurG4iOzsOZKEyTK2tTsaW9s24itVTU?=
 =?us-ascii?Q?NG9McaB++DG750xVsSaGeLCUjPtNLIS6TIaqIyQ6/d8Rz/3+mUThBi9qq+gH?=
 =?us-ascii?Q?/0ey1wmzgPryrQ10l8mBxQjoCCSZokmPKDkeqXQB02xDebj3sESRboTrl+8G?=
 =?us-ascii?Q?fRi3mT9BD7JQWiOYXPaGdqB8jYcK2GzwacFFXT2wAGF32AcWfYf2CfXmdsFC?=
 =?us-ascii?Q?VBr00ZsGe8zWcB3t9Q5bye1CtTzi2AFo98X2a60bViUrmjhBlThA2cDZfYOz?=
 =?us-ascii?Q?hQ5HElCYmsKiatlP3APKLY+OZkJ8hHezDmDhErfwoKqcsqVxigrrXeHGorJf?=
 =?us-ascii?Q?R2AwOrOIkGx1CK58MlUj8ednS3rZQtYxtcMkwZUtbkky2RkJzIhwaDghrfHN?=
 =?us-ascii?Q?wfnkM7j4dt/S8P4FETMSIa3W+s6bIlTHD1ltaNOjSLUBvqtr43tbgHJuMegY?=
 =?us-ascii?Q?psFMzN8QhZhWJ/m6947H5GUhftLZQJnOMjq+0wYaeqNNh7Xtb7Qb5msS/Q63?=
 =?us-ascii?Q?NFpH50PThE/MruNqD15tfv9wGWWcD+P4SAnWbeLAkSjeubbXMXNq+DoRN3y/?=
 =?us-ascii?Q?Jjw3am9GONkg4jToH4npOhdSowhDYzQnXWAT+lQF6yoxTt0p99WDm5gnuiIr?=
 =?us-ascii?Q?ILbt5de57qO+1xjkZVjfVVJXDglKAubg9qikIiVOwPPVTNtU2zwvNdNR4hp1?=
 =?us-ascii?Q?DAYOsV9pkir7i4N3jdF9eWvfGQFkj+fTBQgGnlzEUkvGL6SZbcR+6HCgF8xb?=
 =?us-ascii?Q?jGD9dfs9M4vA3DWKj7Awh476sKg98O/Bh7mRXAF9nY5senVOB6DEqFSa7mDO?=
 =?us-ascii?Q?LqLDrs4OHLKED4FUyQ63wzUM1jTZ2GIpAkC3RKdpMJsgLYfzSpI/4llZzRkt?=
 =?us-ascii?Q?zfk8Edt/ZzRv8VgRI2zDbruYTrwizFro7zeWPxst5LUcdp3VFwIrBoXcpmHD?=
 =?us-ascii?Q?zk8lvggWoydh6VlGIVoVEK1El2pa0eHVWy6yHKVSe0tPDPbQ1e0Td0IdWQCX?=
 =?us-ascii?Q?KHizG9CZZ5EAAXoyL8fSfSHox2DFNgcTFIpI6XDLrXwuJlvxz/QvnbNiiyb/?=
 =?us-ascii?Q?PdJMKC3+EOmQeHgbWUruxs8SMeEiHCTFdYVzU59pb9FetxJ9jZGOyTgcQZWK?=
 =?us-ascii?Q?ezcdB5tOOmNqidoOak35Xus5GamwjFRcJX+ACJZ1mP72GrplK4ce+spTIswW?=
 =?us-ascii?Q?imcmumi+0LDbJo186Ts91BwdJEkQVmWGK2KPduBtqBCP7p9FgycC+pdiR342?=
 =?us-ascii?Q?NQwucExy16wHtRbAwiYhagyg+AIOMU/yZoT8Nqp2s0Flv9agXMdYlTSTBEwn?=
 =?us-ascii?Q?JUU3fhsQBoflhnKQumVDUBhzfgxSPcH9KHc6OGIIQrnAwrqHHAq6blFrkRB2?=
 =?us-ascii?Q?8zyqIjnKmowSIkRgHXyPYJcs0WWxw7Wm+qKaRr860B3h6ZpP+j+mPJyTRGYY?=
 =?us-ascii?Q?/zP82j8QLr2vXPuKj4lm1BfK0ywwB0+7LDaWnJ8fhM2i7s94spdcoD72D1Nr?=
 =?us-ascii?Q?nm8Pcvh//0rS59II+yi3kRa7MCTkKTzxDwedvFcFfLXjRO/1kf6GsGq0i+MB?=
 =?us-ascii?Q?0XX4wT6z+n4OIuAh9ExDwLoo6v7l4GeJsz1Uj29X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5b0727-8d6e-461a-b25c-08dd67a74544
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 12:03:47.6995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A//xL3CoILuCdHB6N8CWznYlQTYPx8TOYXOgGZbYH1lx4ooQO/XR8nxzdziHi1qKeWev8qB0gTnKRKNyLs3V0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The blamed commit converted the fsl,qoriq-mc.txt into fsl,qoriq-mc.yaml
but forgot to also update the MAINTAINERS file to reference the new
filename.

Fix this by using the corrent filename - fsl,qoriq-mc.yaml.

Fixes: bfb921b2a9d5 ("dt-bindings: misc: fsl,qoriq-mc: convert to yaml format")
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Changes in v2:
- none

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 95cf8b1a40d5..012a3fbf884c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19642,7 +19642,7 @@ M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/stable/sysfs-bus-fsl-mc
-F:	Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
+F:	Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
 F:	Documentation/networking/device_drivers/ethernet/freescale/dpaa2/overview.rst
 F:	drivers/bus/fsl-mc/
 F:	include/uapi/linux/fsl_mc.h
-- 
2.34.1


