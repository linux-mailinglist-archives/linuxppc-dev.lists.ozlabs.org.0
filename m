Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 821344331E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 11:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYSdd72Psz2xtN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 20:10:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=cHOCmyDn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.82; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=ioana.ciornei@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=cHOCmyDn; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130082.outbound.protection.outlook.com [40.107.13.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYScC6fYGz2xYK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 20:09:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpO2t4ezZANCWYCrscvCv57rmbYZ2ngY4xWOQQxoI32NDa/ai3RueL5GhLsCNeT1VlALf4QPsJ1fyMY/MS44Me7KYCPqi4BfqQavdpvABcN5GchFNYzTW7uN212TFW4nS519PYDCqmuJPWehvp0jK040pavLDU9BKyZuISaTd67/MWNjF9mAHmfPdEsrRrUuEdo23nkswGaEvQHa+ZagwjXoKq8IniPuiMgTx6USavLFVM35acLFPxoqrLT2tweNUfV/rv3gWiItMXuAw+OvzEPMeR7lBicbDLiLeGi89GNtIG+G328wE/DmJXEXk6kdJjhaFpOVdjVkfU8OdQOrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhxbw6Pt3z+5vWZPxHSP5RhDz+PF10LIbYwsyvR4YKI=;
 b=ABdN2zKBOSsSlhpfccKwS9s8snQNUgqkSOBQ46ahj+pUT+vEBnvWMvb1WkhbYuIqN1eTI+3aTR6YsY81kZwFrKrPQrTVdXFqI+WpQDmq4xvjlxEjTNz2HfaYgTHELXZlo6eymoW6dkuL18DZqAmHkForsCN1h4uL+XWonetL/f3M4w6G2Yqbf2QyOU7Vc0S8FTKtfLGJKk63QRn2t4FM+9edzNkS7by/D6juX1NNMaAu3fyiNvC4CX1TZgLeFNSjf+xiENfaVRLJkNSxDnbkbXaH4GJxFlIe80z7iNGVJy+XWW5WpiYJNnSh4IxLff9ji+q8XICnne04/LXBUQZstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhxbw6Pt3z+5vWZPxHSP5RhDz+PF10LIbYwsyvR4YKI=;
 b=cHOCmyDn73eaAYs2LSHqFgUyeYraOK3U44BCGPk+Jt2HWMCL4uYM3W3Qp8cvkjhnDBgdmzEAPpj8F4hVSxA/e9D7dwMq97dKtIyErT1jdWumciKUnLMZmfg2Fle+lOkOqNyN/I1A6KO5fnjfKV5kbpgzqVMNjPTy/wp34A/GDN0=
Authentication-Results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=nxp.com;
Received: from AM4PR0401MB2308.eurprd04.prod.outlook.com
 (2603:10a6:200:4f::13) by AM8PR04MB7266.eurprd04.prod.outlook.com
 (2603:10a6:20b:1d6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 09:09:12 +0000
Received: from AM4PR0401MB2308.eurprd04.prod.outlook.com
 ([fe80::6476:5ddb:7bf2:e726]) by AM4PR0401MB2308.eurprd04.prod.outlook.com
 ([fe80::6476:5ddb:7bf2:e726%8]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 09:09:12 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: tim.gardner@canonical.com
Subject: Re: [PATCH][linux-next] soc: fsl: dpio: Unsigned compared against 0 in
Date: Tue, 19 Oct 2021 12:08:55 +0300
Message-Id: <20211019090855.246625-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211018160541.13512-1-tim.gardner@canonical.com>
References: <20211018160541.13512-1-tim.gardner@canonical.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0902CA0023.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::33) To AM4PR0401MB2308.eurprd04.prod.outlook.com
 (2603:10a6:200:4f::13)
MIME-Version: 1.0
Received: from yoga-910.localhost (188.25.174.251) by
 AM4PR0902CA0023.eurprd09.prod.outlook.com (2603:10a6:200:9b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 09:09:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1341da8a-4728-4144-3ca0-08d992e01db5
X-MS-TrafficTypeDiagnostic: AM8PR04MB7266:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR04MB7266D6D8B7196FF352E61178E0BD9@AM8PR04MB7266.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GcY4nMPqJleA99mnqQ9GAKCaZn8aFWkfYC33KgNNcrS/8owE98otv4H5YAZarNQTGICz0mxts/0e1ZxSJJkLoiGLjEYvgtcxBRQfyCwN2Ipm15Pk29PQd7TJMeN96I+QlPPS9qeiYYL8qbxYb/al6UQ/sYJ02wwqUU0NqqVL1Jf0Bz0yW7tabJC0KQ9dnvUQtqochYNPrpd1Lb/XtrGe3XUw2Z4OqQ8a+zoyKRS0veu5UNgkXO9D31O45TlhwbhEgYzGRqeHZNk9fJOMrujYzu48Wf4aexw8wEaUoDt/g9MUjWaWgh373QRE3jDORgfy3KW6PaxDGsUmtoBmzkMJUOTjTtxFwtkkFIdRoQ7M6SQBUkXEzLWuhfZ7wHzZGihSQScQChC/HemPi/i5wvarVUuVl4j8ZPz8C1nXMN/e3RB6KtyshsXfQUhMKdK5MOQtiuqhoEufJZBQtxBtITnz2Ob9F3EyJLzzCBo9LYo+z87jUFNGJrkRhcu9SHdPmo5BFfcFTTEdL2H5ujA9ugv7TvZQHAr2VFB+uNjmph2Tcb/gFmd+zFQP82hDI6Cj0jYXcRXt5ovcQPWpnxVfGhz8/lyGRbMl2+9fXHD3LcyZn+sSOREQkMfH7Qm59x20WUc+J43DasHo+bB8MbY3lTph+zNGiaxELmbguSuI6JWHwz64bxDWfu/KARsYAjiVKw6YnN3IpMYfBz4QfeZcccY5gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR0401MB2308.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(44832011)(6666004)(38100700002)(508600001)(8676002)(2616005)(66946007)(83380400001)(52116002)(956004)(38350700002)(26005)(4326008)(36756003)(6486002)(6506007)(316002)(66556008)(8936002)(5660300002)(66476007)(6916009)(186003)(6512007)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JCg3tNHaRltfhgtiI3Aq9u8xbzJjunQX3bb9a8jzRsGprbmVOJBJx8C9A+vp?=
 =?us-ascii?Q?5twjeClsW9j4Cdeu4F0FugTeEioHewDdIcERpOOkf6Ja/4vZyeYauO89YYBY?=
 =?us-ascii?Q?FgD7Xj/a4OmhvtcCY23eCrml1I/kz5UzdAjUvMkWeEpFVqdn38CWLYaSALGL?=
 =?us-ascii?Q?1jVlopbShUvkQHHE9Jn6t7457BlViRxsgcggX3g+invXpUb4wAjI0TXmkqS9?=
 =?us-ascii?Q?fcyUMaEMzgDpOMmtVqpiwpnG8ghNDg+4WfW5AOgUiAVIUmpNSQduvZi2U2AV?=
 =?us-ascii?Q?xFHqrSxa3wh6P86UWeuSBlCQYOLUi4iu7u+owElgPDgk2qq4Z8iSp7B8i4q/?=
 =?us-ascii?Q?CP2Lk0AeAlLjYvh4vtgbnM6rgN+a1XBRtBmSQ5lLP8rk4DpXWHT7n4738ABs?=
 =?us-ascii?Q?sB2Vg3Gx9fY7IfnrhdIDByjtplAKw0v0oj3NmspGeq77z3zCLSH330/ll6VP?=
 =?us-ascii?Q?pACfT7xEpPW56noWbrljxtodCSv6g0p6zpXCq9n+iWMNfvSwj+cvHq6oLWU+?=
 =?us-ascii?Q?Fy6xVyi/5yfwxUhzDb1R4k4EZQbqrC4F3/CJYCy1//ha1cEtpQ2eOSAPB942?=
 =?us-ascii?Q?SZrwWYEzzGbe9Ex5lxVmnm/e4oCIZEW4Lz6KVr61e6iX593hg5XCZ2JPxE/S?=
 =?us-ascii?Q?ii5VhiKMpvaZd9mVRmP7cg9smi6/zdJmVADfziuwyNaOWEeNw3fdD1T6Yqvj?=
 =?us-ascii?Q?14gn1SMHz7pDNx9h7osQd/59eTsZ1tDXuDzoHyvODlHIJ+XgPr9FKB+ubh3j?=
 =?us-ascii?Q?odfOAuIbuPSrfzvKl1Zio+atgcpJvgH/qVk05J9q/DxTcuI6M7YpxPo38Cz1?=
 =?us-ascii?Q?WOgKkq2yRsO7qTUXdr747PTmEnrmwrp8RYLvj5dw7gDLJsryAe4iidHh4BbR?=
 =?us-ascii?Q?X44Mfp2SMaY7AZrBNQcoB9UGNLjbcr33TAzVTts6qK8bGHkUCTWrMj7tNYR0?=
 =?us-ascii?Q?78DJyihlYt2axwgJGhgo5Yn4BQRqtfBl8r+wQXWAJe/3VKq46flCL4dKSVQb?=
 =?us-ascii?Q?OZGPuGGj0T4WGy0hzbPO9mSOirOdU2B55E9Akeh1GK2kSubTuk4W0kmpVGzA?=
 =?us-ascii?Q?aENS6Yy+o/Xzq22LcG2WyBhkK20kVPEfLkXsP/niWfQcaBFTuW9hmrCciMws?=
 =?us-ascii?Q?b1SOf4nAYvrKXx2YUfv9wZ4DqfDKUmNdl0QT38IEe+nh3gm7ri7al+r/m92X?=
 =?us-ascii?Q?Qk5J6aAtljnnyBq3STZnux6vFBTi79GvhqNSR/B/HGaQShM7CI9ShFhj1W6o?=
 =?us-ascii?Q?aJqlOoHvlUlav9o5W+C3riHYdpqvzOk/5NIxElQFWFEeJ1c1/2tqWvJ74bFe?=
 =?us-ascii?Q?f3QHKCeQPJgkLdOaQydbfDsp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1341da8a-4728-4144-3ca0-08d992e01db5
X-MS-Exchange-CrossTenant-AuthSource: AM4PR0401MB2308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 09:09:12.1580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZ0YMOGvKSgVxduENi6mgbij0kAHrx4m/7lF6Dqs61RMW9cD2Y+3gnbE7/1945zsAKW4Tbu3aH7URSGzacv9ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7266
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, leoyang.li@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> 
> Subject: [PATCH][linux-next] soc: fsl: dpio: Unsigned compared against 0 in
> 
> Coverity complains of unsigned compare against 0. There are 2 cases in
> this function:
> 
> 1821        itp = (irq_holdoff * 1000) / p->desc->qman_256_cycles_per_ns;
> 
> CID 121131 (#1 of 1): Unsigned compared against 0 (NO_EFFECT)
> unsigned_compare: This less-than-zero comparison of an unsigned value is never true. itp < 0U.
> 1822        if (itp < 0 || itp > 4096) {
> 1823                max_holdoff = (p->desc->qman_256_cycles_per_ns * 4096) / 1000;
> 1824                pr_err("irq_holdoff must be between 0..%dus\n", max_holdoff);
> 1825                return -EINVAL;
> 1826        }
> 1827
>     	unsigned_compare: This less-than-zero comparison of an unsigned value is never true. irq_threshold < 0U.
> 1828        if (irq_threshold >= p->dqrr.dqrr_size || irq_threshold < 0) {
> 1829                pr_err("irq_threshold must be between 0..%d\n",
> 1830                       p->dqrr.dqrr_size - 1);
> 1831                return -EINVAL;
> 1832        }
> 
> Fix this by checking for 0. Also fix a minor comment typo.
> 
> Fixes ed1d2143fee53755ec601eb4d48a337a93933f71 ("soc: fsl: dpio: add support for
> irq coalescing per software portal")

I think this should be formatted as following:

Fixes: ed1d2143fee5 ("soc: fsl: dpio: add support for irq coalescing per software portal")

> 
> Cc: Roy Pledge <Roy.Pledge@nxp.com>
> Cc: Li Yang <leoyang.li@nxp.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
> ---
> 
> I'm not 100% sure this is the right way to fix the warning, but according to the
> pr_err() comments these values should never be 0.

These threshold values can be 0, the pr_err comment tries to say that those are
the ranges, 0 and the maximum included.

> 
> ---
>  drivers/soc/fsl/dpio/qbman-portal.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
> index d3c58df6240d..b768a14bb271 100644
> --- a/drivers/soc/fsl/dpio/qbman-portal.c
> +++ b/drivers/soc/fsl/dpio/qbman-portal.c
> @@ -1816,16 +1816,16 @@ int qbman_swp_set_irq_coalescing(struct qbman_swp *p, u32 irq_threshold,
>  	u32 itp, max_holdoff;
>  
>  	/* Convert irq_holdoff value from usecs to 256 QBMAN clock cycles
> -	 * increments. This depends to the QBMAN internal frequency.
> +	 * increments. This depends on the QBMAN internal frequency.
>  	 */
>  	itp = (irq_holdoff * 1000) / p->desc->qman_256_cycles_per_ns;
> -	if (itp < 0 || itp > 4096) {
> +	if (!itp || itp > 4096) {
>  		max_holdoff = (p->desc->qman_256_cycles_per_ns * 4096) / 1000;
>  		pr_err("irq_holdoff must be between 0..%dus\n", max_holdoff);
>  		return -EINVAL;
>  	}
>  
> -	if (irq_threshold >= p->dqrr.dqrr_size || irq_threshold < 0) {
> +	if (irq_threshold >= p->dqrr.dqrr_size || !irq_threshold) {
>  		pr_err("irq_threshold must be between 0..%d\n",
>  		       p->dqrr.dqrr_size - 1);
>  		return -EINVAL;
> 

These 'value < 0' checks should be removed all together. Somehow I missed that
those are unsigned values.

Anyhow, thanks a lot that you spotted this.

Could you please sent the v2 towards the net-next tree since that's the tree
that adds the fixed patch?

Thanks.

-Ioana

