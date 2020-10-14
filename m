Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A9B28DDB1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 11:32:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB6dQ3cbPzDqkb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 20:32:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.81; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=oIhZFr+Q; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB6Zm4wchzDqXP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 20:30:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPOFGxCwjuxYNOjU635InoOHVQ0xtZSkbBMPm6hGQSLnTPFhDRAA+v6KzKF6R1zTWTYR6VpzlDz3sHMs9KkNVRlRDxTRbzAZaLczqUQ2OcgInOUiWegpBtPMuGzqa+MHCHxSRKE2+ZRMEXmwkwAAVrxayr6kNfsy0GhA7x7V8HyX2zD27spWS8W3dIPtbsHe9FKjoqxM8B0m9rwMXI0+2PNWy8orNQmlDFZx4KUygPBVpLkzpAaVlqLJfdzhKoKK6KAaJZC2GdRlcBeuH1icA4o9r7D0XFtqpDhdL2qAeWEE/Cx8+LAPM5IdtjOrbc8bWu5RT6bkmpIngtF2NawEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTpSfN6V3AyRZohl+Ttmk+ZVpMmOiFmP2hkSk4+UayI=;
 b=Ybx9SiRmyoya7okwO9OSL5GlgEuNzqDceU6a9uV9QPQW8SERKo3V4LKsbiGS8Es99iz+jOA5SmfFk0ZYjt2vLHTAPyAVqy6gORWYf6QBWNYiDpd2u2+wdcxDCvkUsjM+1Hzwp7GEYVSigKxYM+R7SKToz3txKV0nXdWq5YkazW5InvI6FYa75h2i08AUJXBofPo6sWucjSrVvYLxn0PxIdQw6Q1wwFvCG2OyCpaUAvJ2PWeg4vn7GEzt4OojMETLvMz3mSTl3iHZ4kKwWzkzGMMKangkTPoCDEnxFYpsRuuNnzxRe1nAgatBD6GcBSJraYBLKfILia5K8HaGr+00kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTpSfN6V3AyRZohl+Ttmk+ZVpMmOiFmP2hkSk4+UayI=;
 b=oIhZFr+QE6gy8A5jx7wdadqmXMxUaICKFOThKSG5rCIbaoZY2bbSgqcFondljQZnyhpOzBcekMnH2nirADh3CugG88JVG2qkja7gNFU2G8QcJKOIzC3jC3kVY69NZxmsR6YRgSE9qJKcq+l4N4CNOHfYqzHVgL+Y7Gxi/CtpQXI=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB5039.eurprd04.prod.outlook.com (2603:10a6:803:59::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Wed, 14 Oct
 2020 09:29:58 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f557:4dcb:4d4d:57f3]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f557:4dcb:4d4d:57f3%2]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 09:29:58 +0000
Subject: Re: [PATCH] soc: fsl: dpio: Change 'cpumask_t mask' to global variable
To: Yi Wang <wang.yi59@zte.com.cn>, Roy.Pledge@nxp.com,
 Youri Querry <youri.querry_1@nxp.com>
References: <20201014072733.15175-1-wang.yi59@zte.com.cn>
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <b16efc3a-120d-aab4-668d-4ef43bbb8b47@nxp.com>
Date: Wed, 14 Oct 2020 12:29:54 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <20201014072733.15175-1-wang.yi59@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [188.25.98.186]
X-ClientProxiedBy: AM4PR0302CA0001.eurprd03.prod.outlook.com
 (2603:10a6:205:2::14) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.106] (188.25.98.186) by
 AM4PR0302CA0001.eurprd03.prod.outlook.com (2603:10a6:205:2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Wed, 14 Oct 2020 09:29:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 89995292-b079-4d92-18cd-08d87023b76f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5039:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5039897347E7C76F62A1D5DFEC050@VI1PR04MB5039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d2AsguwvohW2CN4OqVzzqPfcPOFh+qZPEbOHhfHtdkM49NV5v7cGtEu6hbkUfezmrQbZUGgjeoC2wsAg3XCcKE8WwptbBcFovHKiTosGfBPjjrlKl4PBdM84g8Y6/jxM+/fkiSG5vyF5qnFoeYiVZa0dt1YPJHkyG6yWr/ar1xfd/odo6Lplv+r+Lkgh3sKonSjGg8zq24CAnRGXC+wY/f097vJAe3Qp6S4EbTjK7VALfTsD4izYZwKS2VccTIlXmu/Nt/YA+vqJIH4PbgVgkvOMA5lFhbsTteFqDiz2H5yE7xn7LRaGSTptmBq1E+m1j2914o1aR5KxjswNiHWrMvdB4Ghtv4v8bmaZbAj4UCTPsU2HTNqD/v/IDjLWGqx+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3405.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(54906003)(6636002)(86362001)(45080400002)(31696002)(478600001)(6486002)(4326008)(2906002)(44832011)(53546011)(8676002)(83380400001)(36756003)(956004)(2616005)(52116002)(31686004)(26005)(316002)(186003)(110136005)(16526019)(66946007)(16576012)(66476007)(8936002)(5660300002)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: J1+YZ44tlDY0xx+kc22SpqPg8MZTJACC4SC7wdf3Mbl5ETiBLJQQpHKRGCaOsPa2pEPxyhyvouIeQ/LvQp+MDGVoBKSe/vCSbfIbfbBmqE/XL2ECW41G2r7Pi2h4vLbXH+A4yCJ5L80oSGlQWiLafW7RpQ5m1k3YVfI/8UvBlzuw/9hwZ/Bdii5+jasinud7jHXx+bP8x6c7KrkhFsLLMPRTyrUlTPda1g84EA+WSVRjtmCAd9RPFrgJQrYYJ+JzSt6ow9QmmN/j7a60s1ujdvw80hrcAz9VQBYWZlX+J/jYkcgWTgVhMoC+2r0HH+bWua3Cb3EVWSjnDThzht6lLWF/Gitjl9YqEg6BBJ9hqSpdnsFa/sDj9913DnDHEphG8H8Atdog5Lwnuchb3rsVs3i0dxINDtFr1GMRVEy7v1pBRxl6PLM6TxsYd49WiEuTP5ZOAUddSznapYQYQtHhxwt4ar7bPgyxCO8za2gRR0df25yy9HNBzjVIfDcp8eQJFVvq337RwYQZUul9S0NE2l8/x+6FiRSFUExRnFuqa4TD61/gOwXixCLJYTcOupJKT3w3IfHOGXIwSNUA9NVxMhYi8fbIlfSoB1nzz8WzCYgj9/m7JP8FX4RhUBzjUITWBSowXOHxnoXdQzJGeU1QBQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89995292-b079-4d92-18cd-08d87023b76f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 09:29:58.0340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utcKuAq0LszQpRZAq7DSvZ5nG2FbfwcaBargJG8vkak0GHJb4IJ6OH5a7Y322DvoaAFW1NDzCdnKgXY99ZQfJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5039
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
Cc: jiang.xuexin@zte.com.cn, Hao Si <si.hao@zte.com.cn>,
 linux-kernel@vger.kernel.org, Lin Chen <chen.lin5@zte.com.cn>,
 xue.zhihong@zte.com.cn, Ioana Ciornei <ioana.ciornei@nxp.com>,
 leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Thanks for finding this. Comment inline.

On 10/14/2020 10:27 AM, Yi Wang wrote:
> From: Hao Si <si.hao@zte.com.cn>
> 
> The local variable 'cpumask_t mask' is in the stack memory, and its address
> is assigned to 'desc->affinity' in 'irq_set_affinity_hint()'.
> But the memory area where this variable is located is at risk of being
> modified.
> 
> During LTP testing, the following error was generated:
> 
> Unable to handle kernel paging request at virtual address ffff000012e9b790
> Mem abort info:
>   ESR = 0x96000007
>   Exception class = DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
> Data abort info:
>   ISV = 0, ISS = 0x00000007
>   CM = 0, WnR = 0
> swapper pgtable: 4k pages, 48-bit VAs, pgdp = 0000000075ac5e07
> [ffff000012e9b790] pgd=00000027dbffe003, pud=00000027dbffd003,
> pmd=00000027b6d61003, pte=0000000000000000
> Internal error: Oops: 96000007 [#1] PREEMPT SMP
> Modules linked in: xt_conntrack
> Process read_all (pid: 20171, stack limit = 0x0000000044ea4095)
> CPU: 14 PID: 20171 Comm: read_all Tainted: G    B   W
> Hardware name: NXP Layerscape LX2160ARDB (DT)
> pstate: 80000085 (Nzcv daIf -PAN -UAO)
> pc : irq_affinity_hint_proc_show+0x54/0xb0
> lr : irq_affinity_hint_proc_show+0x4c/0xb0
> sp : ffff00001138bc10
> x29: ffff00001138bc10 x28: 0000ffffd131d1e0
> x27: 00000000007000c0 x26: ffff8025b9480dc0
> x25: ffff8025b9480da8 x24: 00000000000003ff
> x23: ffff8027334f8300 x22: ffff80272e97d000
> x21: ffff80272e97d0b0 x20: ffff8025b9480d80
> x19: ffff000009a49000 x18: 0000000000000000
> x17: 0000000000000000 x16: 0000000000000000
> x15: 0000000000000000 x14: 0000000000000000
> x13: 0000000000000000 x12: 0000000000000040
> x11: 0000000000000000 x10: ffff802735b79b88
> x9 : 0000000000000000 x8 : 0000000000000000
> x7 : ffff000009a49848 x6 : 0000000000000003
> x5 : 0000000000000000 x4 : ffff000008157d6c
> x3 : ffff00001138bc10 x2 : ffff000012e9b790
> x1 : 0000000000000000 x0 : 0000000000000000
> Call trace:
>  irq_affinity_hint_proc_show+0x54/0xb0
>  seq_read+0x1b0/0x440
>  proc_reg_read+0x80/0xd8
>  __vfs_read+0x60/0x178
>  vfs_read+0x94/0x150
>  ksys_read+0x74/0xf0
>  __arm64_sys_read+0x24/0x30
>  el0_svc_common.constprop.0+0xd8/0x1a0
>  el0_svc_handler+0x34/0x88
>  el0_svc+0x10/0x14
> Code: f9001bbf 943e0732 f94066c2 b4000062 (f9400041)
> ---[ end trace b495bdcb0b3b732b ]---
> Kernel panic - not syncing: Fatal exception
> SMP: stopping secondary CPUs
> SMP: failed to stop secondary CPUs 0,2-4,6,8,11,13-15
> Kernel Offset: disabled
> CPU features: 0x0,21006008
> Memory Limit: none
> ---[ end Kernel panic - not syncing: Fatal exception ]---
> 
> Fix it by changing 'cpumask_t mask' to global variable.
> 
> Signed-off-by: Hao Si <si.hao@zte.com.cn>
> Signed-off-by: Lin Chen <chen.lin5@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> ---
>  drivers/soc/fsl/dpio/dpio-driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
> index 7b642c3..b31ec53 100644
> --- a/drivers/soc/fsl/dpio/dpio-driver.c
> +++ b/drivers/soc/fsl/dpio/dpio-driver.c
> @@ -31,6 +31,7 @@ struct dpio_priv {
>  	struct dpaa2_io *io;
>  };
>  
> +static cpumask_t mask;

There can be multiple dpio devices with their associated driver
instances so it's not ok to make the variable global. Please place it in
the driver's private data and while at it, please rename it to cpu_mask.

---
Thanks & Best Regards, Laurentiu
