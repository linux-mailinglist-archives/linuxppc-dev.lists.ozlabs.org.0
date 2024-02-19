Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C10485A768
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 16:31:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=IiWNR8If;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TdmjD72N1z3cDr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 02:31:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=IiWNR8If;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::600; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TdmhR6H5qz3bnk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 02:30:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3VHrnrosY+zsBjy7pS086TCVJt+9HvQl/+fjq/zHnR9YGIAMh09h1OSrmkOK3+90zCHCiS9jViIfwHsHp6CfeUvGZjdedk5iJIJ6Pft+LmfvUDYICSUV+Gfvm7lyyl9w9oCVCdZBZlxp2/BUBSZpjpnPEEDoTnzF8N4t+B7OM1j7iNYqT0pUAVoXiKT4UItxVo6b283A2XmCPO+fIHHPqZQwoei4f/0A4nUU4sC8t6z/PpxUPRm3YybSnYavHbnH9wQ70naShoMUEAtOMs2cKaNeomTPqkBNF4HtlI/0XPf8osF4IY6ToL3CA86NFmiC5j9rSX2WaKRa4ODVFJKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjiuW4XmonIuf7RSLbeYal1Po+oHe5ThVg8lx8ZsutU=;
 b=ma8LYINxZcWb5AWlT79QZIgk2dVB8FALpK7F1BnmbAIHpaDKdPAKVQM0Z3UUYux7H+5bXe4xZuS7zMX1CIZdy/qHrzEO+QWHto6m7pk69L5Tc7FoDwMvfF16exSuK0wX9Yvaop6hkc9uEDS7VVB8YqbsDXI9DODwiByVSLltLhI1Aw5VNOT09kIIoUp2ShH5O7nFAFcHV75dx5kCHgnXzaqwrk/1Supj22H9R9+VqtC+rZwKiNMtyePNFI/ok+HAFfDZu1JGGElim4kDP4k6F76WRohukK6ZznKtn/T5yuWJb0yhUdEmPJ/dR3vcvtwhrB644QmyDP+AkYJR/LD7nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjiuW4XmonIuf7RSLbeYal1Po+oHe5ThVg8lx8ZsutU=;
 b=IiWNR8Ifr83H36ltVTKz48wIuIlTiCgTPO5ipz+pRd+G7yswNUCTfd4NKfC4TzOA2R31MM+P5FSYmxdzZxs0b/7R6JsyaSTvP9ZvEawB1Fy0RJh9Hp5FJu7rc6G8qRfP0U8cR+XBQbAXTdLs1BGKCPqAD7SYeYB3NLD3yEaqanI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB7374.eurprd04.prod.outlook.com (2603:10a6:800:1ac::11)
 by AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Mon, 19 Feb
 2024 15:30:20 +0000
Received: from VE1PR04MB7374.eurprd04.prod.outlook.com
 ([fe80::62cb:e6bf:a1ad:ba34]) by VE1PR04MB7374.eurprd04.prod.outlook.com
 ([fe80::62cb:e6bf:a1ad:ba34%7]) with mapi id 15.20.7292.029; Mon, 19 Feb 2024
 15:30:20 +0000
Date: Mon, 19 Feb 2024 17:30:16 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RESEND PATCH net v4 1/2] soc: fsl: qbman: Always disable
 interrupts when taking cgr_lock
Message-ID: <20240219153016.ntltc76bphwrv6hn@skbuf>
References: <20240215162327.3663092-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215162327.3663092-1-sean.anderson@seco.com>
X-ClientProxiedBy: AS4PR09CA0030.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::20) To VE1PR04MB7374.eurprd04.prod.outlook.com
 (2603:10a6:800:1ac::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7374:EE_|AM8PR04MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e440ee9-e411-4150-7864-08dc315faed3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  WZCEVoLVgcnwbsNvBL0i3DSmXwEVAzYfufxZ4plys1QwblD1BoyntYxS7EbcTk1sxMb7vGNtZJyMKWgPXnMQNSRSm/5u/0FR1nTKNj7FtQtVE0k0kWENYSiw0p9RcNN8dfMBueYLLyBB9pN6O5IUjxF9ptSMbGGTv2uFF6mfRfVrhi5bQNqCmmS9KNANcO6qg4YcTkrAltvL/lAasdleAAoSKzrdjVq87p2aeEJcjI9jG0NohPvPEkwyUI9wq3jTJwpF5RSnSlQTiHJVOtnca9cJCrh7rcWC4jlU7EZOr2fDraW2lXYVQJrL1IrYuO3hvHv9mf5bsS7v2FUEpMi2UtceiAETzKoOxY/x+sn/HhRBsihmcWrf4Ps2a7o44cDkuZOIjjr5cjhCyx/kqCtOHlvHCkAlfeB/0OjBMqSg4KMAlT/NH1ZMoxyCYmPWuf0v50hWSyqSI7PQ8CKNTSiYFQuSXD8ygfq9U7i8mLRlffpXqXb5FUnLS2vUbxsZhiO+A8bfCPokXQiTEk5Z0X3J0Q==
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7374.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?duyNXTje1KBLOFK50JHbm8zCI7oisEVm3qTFv6BVVzyrzX2StyO3pKlzI4UH?=
 =?us-ascii?Q?mD5KpXi3dE5DXZvXUZ9ayiFM7hIjWxtzLV7k/OcoogmthhDQIKlOW06H0lYW?=
 =?us-ascii?Q?VOn2H9H+HufGN3cy9j/xiOmIPO1gbsXb6PEYYgeP67BC07zG4YjIN/haUNr7?=
 =?us-ascii?Q?YpUMAN34k9mzCrS+oBVFVAbd/Mjb+VxLhDl0eUXyTF1RpscCaJe0zc+d263U?=
 =?us-ascii?Q?QDfFEBxVcvy8OWaw9SBqEbbI4B/sYxqJekKBXmf3HVFVktAj27es//rwu94T?=
 =?us-ascii?Q?FBmFjosYeswo/xVq3KqpmJYTbkX7fces2hhfzvjbdmP30T5WxV46YMBFUEsP?=
 =?us-ascii?Q?BEPO0oIF4mgMqG2sPWW2iNgZQnWxurAY2x32ABx/N2+7rSUyd0LyUE1hzg3m?=
 =?us-ascii?Q?BAxMOyzudZzK5XjUNRju+pAxPDujn2hhKo0+YoUkpLrCgBy1EuNYa1w9XorF?=
 =?us-ascii?Q?QQYFufe94Vl4CoZW9miaju508pZiuYekY2D7fPix49JGP7HYx+bXPk+DMkAd?=
 =?us-ascii?Q?sWVe8gei1B8zKMt7OHDFbIiUfL9i7A2OEox9G2TjPbE9sQJSnoD7DxBwPMjE?=
 =?us-ascii?Q?p7RmbOuRRA5NMGE6AokV8KDDKGqJH0lLuemcq0sFu2vRJc3m1LE7elaWp15t?=
 =?us-ascii?Q?JXEkQwoSPjTFlyzro8gCU3HZa8a7eGjpf9Gtbvf1kAMzPI0vnhUEGbvqujqk?=
 =?us-ascii?Q?pgtOxH6L0O7YSNwB8Moypa3bqoChUfu3yeFYx0/hw8kE/1TfWrdKouXbQ1nU?=
 =?us-ascii?Q?U/viDHUn3SCbhEce0VLH5wAYgz0HQdh2e/v/0ui3BTRabaLWW9b1jzfKkthc?=
 =?us-ascii?Q?Zh7L8LQxcDWmPHBhU5TXgTh85PiFkoul1H+8hpdL/2aMWihOH/GhAEjSczkU?=
 =?us-ascii?Q?BNA4FqQOyV1GkwZWqPh4J6jJWJhu5jgleH0yuG0nCM0B314h63rbpoc6PQum?=
 =?us-ascii?Q?mToucdRe+efAlxyoR0cxPU8GDI5BjpL9Pc54T8AB/Y+yicV2M4Ggp0JEIHMk?=
 =?us-ascii?Q?nYUe4jmofehd+jikxvgv7s4FVMneDFPZs1P+etCy0ep+aVTkwPolZ1a9jFGc?=
 =?us-ascii?Q?B+7DP7MJiUVqxG93CnD/rnnATiIbn3r+Qxfh0rnUX84IdvsT1aZ+9PAz3Goe?=
 =?us-ascii?Q?Ps42myc29IfVfKY6+K2mIKfAgc5/bEEg5v2uFIjot2fQ0Bd5/V43oUaZfAX8?=
 =?us-ascii?Q?tWmnBVbHMSSakwPqfOyMdcsRppOAn9CIgS+TtCQw/wf3CbbMfAxv9mUvuYrJ?=
 =?us-ascii?Q?LF1mbfY9yITLDADZPHtjYUghs+JKPNs9iKRGNPJOUR1vgl4I2gb9/qxz9D+s?=
 =?us-ascii?Q?ZxoZKMCnfAq0JArAF8n3k67P0R+PU+sNGRJv5QacYwTAQT/1G2eEZxUuu1ns?=
 =?us-ascii?Q?LGIDHFUutsnL9oWfzfF7n57UCgycaR6uDfiIHMUV32nmgKBAOdkl9U+gmLou?=
 =?us-ascii?Q?S36h/CWZu1FoePSJWE5S0AgwlY/Q0a0dnNIFGMRkym10blgJOygjE7vnQbAa?=
 =?us-ascii?Q?4Cw48nwSlSPVXO8aVwGyMj3I+UG1VpgO9ayXetiYFh7u3PQg+8CbqcyGFd6n?=
 =?us-ascii?Q?gDFpCouDhdyJnu1bOoNQaviL/ekW7Ej6QrVbsTBDcFcAnxWQ+CDxE4lTbh4J?=
 =?us-ascii?Q?Z+90m0UWccDo9D8gcZcj6Yc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e440ee9-e411-4150-7864-08dc315faed3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7374.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 15:30:20.6660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2E9sK+4hGoKnVJNT8RdjJUcFyaKAnjjxczrnnosBpcb58J8ghtIjDdNzIXJHdCknDhk3enOkn4l28O32iL8xQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7874
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
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, netdev@vger.kernel.org, Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Scott Wood <oss@buserror.net>, Eric Dumazet <edumazet@google.com>, Camelia Groza <camelia.groza@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

On Thu, Feb 15, 2024 at 11:23:26AM -0500, Sean Anderson wrote:
> smp_call_function_single disables IRQs when executing the callback. To
> prevent deadlocks, we must disable IRQs when taking cgr_lock elsewhere.
> This is already done by qman_update_cgr and qman_delete_cgr; fix the
> other lockers.
> 
> Fixes: 96f413f47677 ("soc/fsl/qbman: fix issue in qman_delete_cgr_safe()")
> CC: stable@vger.kernel.org
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> I got no response the first time I sent this, so I am resending to net.
> This issue was introduced in a series which went through net, so I hope
> it makes sense to take it via net.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20240108161904.2865093-1-sean.anderson@seco.com/
> 
> (no changes since v3)
> 
> Changes in v3:
> - Change blamed commit to something more appropriate
> 
> Changes in v2:
> - Fix one additional call to spin_unlock

Leo Li (Li Yang) is no longer with NXP. Until we figure out within NXP
how to continue with the maintainership of drivers/soc/fsl/, yes, please
continue to submit this series to 'net'. I would also like to point
out to Arnd that this is the case.

Arnd, a large portion of drivers/soc/fsl/ is networking-related
(dpio, qbman). Would it make sense to transfer the maintainership
of these under the respective networking drivers, to simplify the
procedures?

Also, your patches are whitespace-damaged. They do not apply to the
kernel, and patchwork shows this as well.
https://patchwork.kernel.org/project/netdevbpf/patch/20240215162327.3663092-1-sean.anderson@seco.com/

Please repost with this fixed.
