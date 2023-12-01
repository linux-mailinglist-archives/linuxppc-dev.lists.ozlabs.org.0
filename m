Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D46DE800FEB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 17:18:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TOqLeWcq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShdXp2b1yz3d8d
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 03:18:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TOqLeWcq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::615; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShdWv3kNLz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 03:18:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEAMwHiw/G5p1x108Sq7DeG523uIgvyFFYv0vvr7dpPDABW8DiOqSYITR/o5Q7VfSN2Uya/hBEsGoF4dPLlGOQ7wMTCNPoGh7Wdx+Cl9RklVP1A0IM5SvShD/qFuYwhx658YwZ9SM6ddEwXogrJPHNhF6ctl60d8Fqjsxwjz+/nQstrXIsn8tQbwhH427eRPQG+uVIQ3BQo46hEVXaG3bMHlNGbqcsRPponiwUHbCnyUAe1nAGDXX1H5eNE7iKm4UunPiMLEKEYXHgN+JnFjJnTD8Aj7FgscUachPE94WzVgZAy4fjgjIlx4PwIxUOYjVYPMZdz7L2RXYgUphD3YWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RVXyhFtosqOA2JzUqe9x5BXdxAOCgwOpJ/QwjabWDw=;
 b=D9zf+dp4b1MLPogSl0RPSwoxsOdr5QHcVK7y+m9GB2D3Qsbk7Q5VGDyoOWKnAv6OMXUvVmkBY+w26j9BVV36H6bkF5Ll3jPIYfjb6ibCpfBRhLvANwvirrtpZVXIqMBqEaGXvplvH0eT5njlu4zW3NRI0eVcCoq+kUjHCIh7FcdWH5JIu5qykcDBPfeLb3EqYYtv7aCcTVfMN1nC0RXtDixiRHAHx6Qgq/mo4j44J9WwLBVy9urtlPcoq2Q3Na4wu+gdVuYAS3ZcLrTczCVt2XhMu4R4+cxFEqEYc51+1L4I3P2vZCA46Lk0h3e0jRqGH2bkXrw88v4wnn648t7wIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RVXyhFtosqOA2JzUqe9x5BXdxAOCgwOpJ/QwjabWDw=;
 b=TOqLeWcqo4SFcEVPKfUch3nOYCuKRsT8EU0GE2f8Dv10ZzsioUjJUZ1eEbDI29Cc3mPT5hmi6etvuT5ZCZLCJiT0+K3ZR3WeTUOHl2x8h4+jfnBPDjd0vJ6x6dtilVfqWEgeXNxKR0k1b21BdVmxtj7tBONaZiAhzDN+LTmjJeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DU2PR04MB8695.eurprd04.prod.outlook.com (2603:10a6:10:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Fri, 1 Dec
 2023 16:17:31 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7046.015; Fri, 1 Dec 2023
 16:17:31 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v5 0/4] PCI: layerscape: Add suspend/resume support for ls1043 and ls1021
Date: Fri,  1 Dec 2023 11:17:08 -0500
Message-Id: <20231201161712.1645987-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:a03:167::47) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DU2PR04MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c3919d-c080-493a-19d7-08dbf28904f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rnkL5zYYEYWFALcrMASqmklnqWXeC8+Jtla8JHuDvFDHSn/ERIYNxHc8Nc6Z1z3YThKiHTBVpkevGFTwK18792OTr1ihZPl9Oy9JdsviJ7DdiEhUAKsaap2j536hfY3YaxNLQFoPStEIHuAC9zQvVF3iQLyEi1hM+CiloY7Qn4JcjqvMub9B99y7dprrIi6RN5dvrt74K1bbfeGXftWJZT3ZrjpMUZieNDrQlkZCYn51nGIE+HfbDxYNKHKn2ac4sLwajSVsJeVYNmy9kXyiZwxKpc8GUMPfYLR9+/IZWKq/b4RXkjaGF58V/Hh+sAM/d/cXKtCZGvMTVaRXhDDEIqrLRoc0tlRgzFDbH59zbn7SQsEstYE/P9uo9dIrLKc4y5cjY3OtA7WiEYX3EdpxRqE7jQI5HP1XXkb5MZ4QUpt5kzJEWLtG7muN5ND6m/qcdCya3yEM5Zb7A2XewssLMC6WQ+UPO5P9PLE/x+auqwXHei8DuwgQw4yuqTrEuPqw+4EExYXygMat6JeMiMpDWtU28kOWogtR6CiX3kGgfkOEH2BdRx0XdrsDs3dr+OCPS5+FStBTXMV6ORcbD5+vrtGgKw9J7dE+eoz0NwlGmnUSo/tI2ibSdLgF4HqwF/tM
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(38350700005)(6512007)(41300700001)(83380400001)(2616005)(316002)(6486002)(6916009)(52116002)(66556008)(66946007)(6666004)(6506007)(66476007)(478600001)(36756003)(5660300002)(2906002)(4744005)(7416002)(15650500001)(26005)(4326008)(8676002)(8936002)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/mg4Uj6QGrjh+a34vRwCGCBc54pQepGyxsOOEhcJMuK1YCs2Dl1DlorUtl2E?=
 =?us-ascii?Q?ykqXjfhBmAhoraYkpQ+zXVr7Yvl2Xp2hwzApwCY8LQEW4LzajypYsTuCi/7k?=
 =?us-ascii?Q?mSd9/2yM5rEMy89IgBsC8ydq/uXY8EHXj4F+lSaDZoES0FsuupI+olCEu/va?=
 =?us-ascii?Q?s5CzuVgGV+inhCWVXVrVL/AVUX+DeeTJTW4vqkIXw3oV6t7Aa0P/FNCdKf8E?=
 =?us-ascii?Q?bX8m6mK5KCitENN3eLFnb8ZT67okZE1Izn9QpRJOYZ0pJENRolSagt2KN15P?=
 =?us-ascii?Q?eGAkGgAs+hx0BLeBsAlv8X54GxVSf00WnRO4/uTJWIP+sIO6goz20b2XD+k2?=
 =?us-ascii?Q?FzTe4vitSsMOn0qvEm+OJ8vA99kcmylnlmIZEDOvXgdSf96S9KV8oOPpFFIB?=
 =?us-ascii?Q?FzgOnzZLOm7Vyjl/zslOXql3dHjdyWYieV7DkHTkRXqbhv4rUyNOBMiUR9Kg?=
 =?us-ascii?Q?wAGAFQe+MybVfa3et2B6vVAyCmGHswKBGXjLQxBy0V3NdcbctCZVFpK6JHYS?=
 =?us-ascii?Q?icWQ9WAD/zSFnXl+HkisZ88xnIzazNhR+hTLcuo+fo/Wu01VEOFSc5iMZ+w0?=
 =?us-ascii?Q?Cpo5ebDPIaO0k0TfHLRlC6OdOW1/LGtOBt6ukDOr3qqUJVzr2YPdaaBc0KAX?=
 =?us-ascii?Q?j0VVoFNJKl0GdDmdBRA7Tm3NWIJijo2yrZEdnL2EB9PszPEWti0fU3sB+wJ8?=
 =?us-ascii?Q?S/JuSqjzuiN6TnG0iG7q+8yXfUwodnjb3cZHyC1ZvpNsbugPs86F7RqeFV5e?=
 =?us-ascii?Q?N7zfNHSA8wvU05e1PKb/BwUxClm+Z8Nvz9ucC50+iOdT7B7iAe8M/fet3RVr?=
 =?us-ascii?Q?C8P1c6h4fOlIOFm7o6Sg+prGIPkqktUfqPRKB4vC4UgCoapGMTVvWgSj7aX8?=
 =?us-ascii?Q?byYhA6ver219pdDEo3HfCpx3TJ+ZTWM6ZeXhsCPbZdeVjxUfWicYBRolIG9X?=
 =?us-ascii?Q?UR7XPL+PUWxLuuwlJBx1tnh6wmYOJpqGEH5lX2wkUj54hj1fOb1mEbdMUH8A?=
 =?us-ascii?Q?Rk0BvW1gjYmZLwChFUJ3OLCxML3oE7GiiZKa+92ejZfxFGdatAPMJnHfmFp4?=
 =?us-ascii?Q?y76UHRkxgrlZ4xafh40Y6DEy6e/dhKoUMac589+995/ZHM0AqUbuBmegOlqb?=
 =?us-ascii?Q?gXwhnIegPPQa2r00bFCi9L1j7exfnM4o/XaonLLQFGm1jrHmOFSlbDWC4RaV?=
 =?us-ascii?Q?H5/z5OffQ9LaVTNOAtEqVGM3rjjdPrahKZSZAvAIpmThr1rMqWlyP11dmY/g?=
 =?us-ascii?Q?hxUnVyl5uBuXjjxppMqCyKwzvXbi2uZiITxbq1+jT/mTDs//4EcH9VzFyZ09?=
 =?us-ascii?Q?32MVvcJKkhmRGwGhYAfnveH7lvF8WeZNJ9XAow9tEb7XC/ssgODAG2GIiSH0?=
 =?us-ascii?Q?nCgbCL2dgNBRlqDgIeIDjq4fw/RQP4AXD8Fbx9xVzYafgKf8M/ls8JIUBX/c?=
 =?us-ascii?Q?U4J2lV/Ipg8gPYY6IKPz/ChNmstZ9AmwhEpbMS+9tUKQymQFP+uAPVde5LEW?=
 =?us-ascii?Q?DSmwu1VFIMQVT2C+JwO8F8EZkUP9khvndqck9G4w6VNYFhATNPGUskLNQlBK?=
 =?us-ascii?Q?oJrbxYJX9CM82K/IQbDRC4HrOpBVBEAYXk92V8Ga?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c3919d-c080-493a-19d7-08dbf28904f8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 16:17:31.4485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kVvUM5vOeyQ5Um2a6in7pOYJWCXz7C7OLvJdFaRdx2yQpudgDKwozTI0PAzg9kTSnyerHWynibBBEUHW5wbwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8695
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add suspend/resume support for ls1043 and ls1021.

Change log see each patch

Frank Li (4):
  PCI: layerscape: Add function pointer for exit_from_l2()
  PCI: layerscape: Add suspend/resume for ls1021a
  PCI: layerscape(ep): Rename pf_* as pf_lut_*
  PCI: layerscape: Add suspend/resume for ls1043a

 .../pci/controller/dwc/pci-layerscape-ep.c    |  16 +-
 drivers/pci/controller/dwc/pci-layerscape.c   | 189 ++++++++++++++++--
 2 files changed, 176 insertions(+), 29 deletions(-)

-- 
2.34.1

