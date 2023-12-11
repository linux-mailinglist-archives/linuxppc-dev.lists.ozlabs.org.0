Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CB580DDE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 23:08:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=M4bZhIrE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Spwq82fsLz3c12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 09:08:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=M4bZhIrE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::601; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Spwp937Ptz3bXw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 09:07:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwTuwXBOLzgEOhMVu5kMzpi8buAhexHuylTpgyUZDlfRo03xNFMvUhK/YJjDpOtBKn5P9YY1DxTJe8hjTJUSIzayNhJheXqUAP7vX4U3dwjIPHzbcoF7jVTO9zMmz4v0M+mT3F/FOJlKvumPiYM24POFtAumQNsXUThLEVaxz1PZPx01W43x500b949Cqh4usJTlqW7M93LBYzLtPlryrKHyavnYcrbNpBZXUjtbw8N5LfIc0daceLICpWIxGCW1/jSpG/ZhKjfSjuVx+ULIuDOXupOZF5HFRTTe5fh1VYEHdTnRYp9ERd2DwHW69k4rZSrQs6u0b6iQ+usptGZ3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjs40/uZk9IiiJF2cbAEQhEIX+HPt7jr4ZHqwjyGQe8=;
 b=DaV9NN3UQXbh8G/MB+pMiN3LFaf3m0Eq2kLBpu/gL7P7JE/ysyM10MlLwWiA3kzOiijcPSt+uI9ifFeZOjpWDDZFAm6IyA5/hq1hJvMLTVblJFp9YDZlhW9//FyHk1K4bKzn67SrUpA73swhfhnBkyT6UddKG8Fs7Os0XVCrDZ0FJ7LkcG5kVtrlcDBovIwlezNUSMQhlCf1tmLlwIVLWT7ldRiLwG7sNLRLtK0fbjhPmy3TUO7e+CZlWoK5SQgVtWoYEsDc8lwSbXqykOJfdp0k2G5nMKynw/YWgAZYTxJfX9jDEaZG8HQK7/cP+zHT2E+1dVL1VnpDXwKXiSKI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjs40/uZk9IiiJF2cbAEQhEIX+HPt7jr4ZHqwjyGQe8=;
 b=M4bZhIrEBO6HyiMMZG9gwjDerNOUtd7ZcTi2KTB5jAa05tzBEddgwebDhFJP2luDF04haAlMlkPSjjLdtQIjcvFmE5vgze4Rjc+rO1jcFn96CGq+/VOwN9q8AlFrU+0kYyU+GREGXeQMGRxbqf6yvhZW6SvPHWluslnNWVRf71c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29; Mon, 11 Dec
 2023 22:06:51 +0000
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com
 ([fe80::dfaa:e869:45eb:76e5]) by VI1PR04MB4845.eurprd04.prod.outlook.com
 ([fe80::dfaa:e869:45eb:76e5%6]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 22:06:51 +0000
Date: Mon, 11 Dec 2023 17:06:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v6 4/4] PCI: layerscape: Add suspend/resume for ls1043a
Message-ID: <ZXeH8nF4KoC0gKg2@lizhi-Precision-Tower-5810>
References: <20231204160829.2498703-1-Frank.Li@nxp.com>
 <20231204160829.2498703-5-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204160829.2498703-5-Frank.Li@nxp.com>
X-ClientProxiedBy: SN7PR04CA0188.namprd04.prod.outlook.com
 (2603:10b6:806:126::13) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:EE_|PAWPR04MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ff6995-e5a7-4c00-123e-08dbfa9579ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	apliFr3Bho9l7AJeF2eoMWR8enCCLhvdBwZDl2uHmHGXJ7Jw3V21CSrTIPWI8q2A6pQ7nar8RG3Gpn+Pkh0tKWT+wD5N3jr4byGkaq1lOLwK4zRiziNJ4GJTCgS4ZhYmEJyHqr4oZNSsOG8vBCXRXDSUXZIMgdcn5au52A8DaHUTj7y0MDrDjJf4zxV+wUHnvCAHiPKNhYmIuND89Ylyjhuh+A+OpRncYQEHWy1hCvgTlZcTDEH8SKep8WIP/Jc6oYTFx3OSGoFv6YswkYbcUAiExoytIybjx+4aBHT4DEep7nxZVGu8d1BYbmbCsxYJq1mh3i0nxnD0Jg19yEnszu4KozYul7gHi7W/67tJW5Yrnci4tOR5WxulPYAEINuZIg1Fau5V9xhugbjvIf+rGpa5PpXB48wkXBmnqzJgeghOrK/0C9jTJV6RafAaRbna0s/0e01PwVCmrT+wQFpFSANwXQFOlwn+QuMQy07a9BLDywXaPv0tAwiaoOhqQ+M8bvodaN+PTIPyrhudkghcl7KOgHVWLuJdZhsJv/GjQiu+uQoFF9Q6gfCaoG4Nv+pp0IybBTBpKaJfyXyyVYD+CXNizZOVig0/i8eXN7QxkHqg8GicmOHn9rqccaQsi1XP
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4845.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(136003)(396003)(346002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(478600001)(6512007)(9686003)(6506007)(52116002)(6666004)(26005)(38350700005)(38100700002)(86362001)(5660300002)(66556008)(66946007)(7416002)(41300700001)(33716001)(2906002)(15650500001)(6486002)(83380400001)(66476007)(8936002)(8676002)(316002)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?UDdRK7biXrSL+95jl/Vidi167MCo0Y3bsVlwvsaovoXcFekPLL7dSWGUKqyd?=
 =?us-ascii?Q?3+ktaG3fezEL8DmLMABwzrj6H7I8CUHJHcvc2HSw0HGro+P9pn11uwcu8BGr?=
 =?us-ascii?Q?eLNr0pvzuHWg6SNafJxJWyjarbLnfIyexFoETLM15Aafw71o0MB3UBhO4nrk?=
 =?us-ascii?Q?VlVRDn1hvI0ezfaLc0P3e3EcqAXI+fKV4+0pCuvEhLmorokWG/Uakw+poIKV?=
 =?us-ascii?Q?XvjxYxzG9uznvxrRI3ednDEcYiFYD99Dtr6k7MDy/AOxBUIgM57rmmv+CdEq?=
 =?us-ascii?Q?+uCU1Gz8fIJjmGemYuXLuqL4hP5mFFlC9is7+wXmO7UJs1Ab36sP3dXHuf1X?=
 =?us-ascii?Q?tctelaOxSRpm0ZnbQN2DUVvwmwef0IvWwlxhwED/QHx/TtGGlwslPe/qGDl8?=
 =?us-ascii?Q?Pkg+oCfy3lLurfCRcLidkH4LXWmn22gr18leY5V6kt3M93cUsj7OfN+rIPtk?=
 =?us-ascii?Q?wA0EMHjXDCfg0UYwk+amLTxuAXZjz83QlC/diRaITmSO5KH8kXvF3faJeXZj?=
 =?us-ascii?Q?3GIGWUVjOOny1gPmxbI0TiOrlG8ln7VEBZxRa8a0XgQhB8R1Mrd65KjhOWtV?=
 =?us-ascii?Q?xbyDSlyGILNpSWEZ2qNNGrWeepD3zL22ZJlvvog99MyXhXlmlLoOvam8gbuQ?=
 =?us-ascii?Q?+5dJOvEToR+6mvMpVfFF/4RSxW3eFsV3ZDMiCSoiRZ2MleHvaNzm7YhNppmH?=
 =?us-ascii?Q?BfBrdkt24f3teScj3/v423MXAJxnIWNXXm5k8gjjCcQ305iJS4l2DErlWTF6?=
 =?us-ascii?Q?9UtMiCTDRHkHle70QG+wUs97h96LgMJkmk83DtRFxvDUlb0JtTDai/YaiXgV?=
 =?us-ascii?Q?379D2kBhp4q89vTCTrs4aOERdDOVDI+q4DIWEKjP+hwK0esoWwimvhpS0AvH?=
 =?us-ascii?Q?zH1l2XcxZLX67CSwlSgsrVC6AkAwlNHamypMMY4SR9lyV42N927CCxjsg2cy?=
 =?us-ascii?Q?KclDGt3l9QF8h+7CXczI0nRUMR786pnVkBBnhaNL/+Z2n0E01d36WRuQ9hDq?=
 =?us-ascii?Q?RRi/faZkPKbmD7PyUvB4YjE01OD+lM2vvG1Wv42UiLygf8GuIMXNlqOvIpQ9?=
 =?us-ascii?Q?30OZ0PMaTRLTL1EeMdlgCKLZGsupigi7n5Rzt/cFSVozQkgbWgcf2Pd2d6y2?=
 =?us-ascii?Q?PqZ7n3hASiPDAMRHeuKbvh+bA9q0gU9H3v/SCB3j0iiBOaCD9KR5hWBdofoj?=
 =?us-ascii?Q?VV5CYW/2R9pWupZg3utFuJfnsW7R+3llc9kEMNo1Ga1pPu8pTkjdZOMQS7x3?=
 =?us-ascii?Q?68JbrIBN5OUiYsvYrpxeQ+ikktJjwHi2LB1/E7flI1azkGSFwDAQUbbTukAE?=
 =?us-ascii?Q?u8PZRr3JzJC7w1MJizM3kvAdMTtX+OufGyH3XUBdt3lh+iTRqE3ixEFZqVwY?=
 =?us-ascii?Q?/z/NyaskWu9wp4pYpDor118twvQCxa0HI9k1vb7LDW5SZGIWgX/RzalzYXnc?=
 =?us-ascii?Q?lzDho2/IPy0kydLvSMV19bIPNSdBDvUhDiV6EHpzXhj+5fSugKohXeGnydtJ?=
 =?us-ascii?Q?RRmF2jFGwlnmvIgEF6+5ajq7ykO3JB9GtpOXniB8ItOCkNDf2vK9cP80mCV4?=
 =?us-ascii?Q?+fdylVd4jBmD1GDTZM8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ff6995-e5a7-4c00-123e-08dbfa9579ac
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 22:06:51.1176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tppendVPIzLSVhUnZ4SXyJSK835MNuzMwiUKI2br810+rgufN1N+7X0ZotpfzUUAbF02RT4QnXCy3mnEKeP40A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 04, 2023 at 11:08:29AM -0500, Frank Li wrote:
> Add suspend/resume support for Layerscape LS1043a.
> 
> In the suspend path, PME_Turn_Off message is sent to the endpoint to
> transition the link to L2/L3_Ready state. In this SoC, there is no way to
> check if the controller has received the PME_To_Ack from the endpoint or
> not. So to be on the safer side, the driver just waits for
> PCIE_PME_TO_L2_TIMEOUT_US before asserting the SoC specific PMXMTTURNOFF
> bit to complete the PME_Turn_Off handshake. Then the link would enter L2/L3
> state depending on the VAUX supply.
> 
> In the resume path, the link is brought back from L2 to L0 by doing a
> software reset.
> 
> Acked-by: Roy Zang <Roy.Zang@nxp.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

@Lorenzo:

   Could you please pick up these patches? Mani already reviewed and only
impact layerscape platform.

Frank

> ---
> 
> Notes:
>     Chagne from v5 to v6
>     - none
>     Change from v4 to v5
>     - update commit message
>     - use comments
>     /* Reset the PEX wrapper to bring the link out of L2 */
>     
>     Change from v3 to v4
>     - Call scfg_pcie_send_turnoff_msg() shared with ls1021a
>     - update commit message
>     
>     Change from v2 to v3
>     - Remove ls_pcie_lut_readl(writel) function
>     
>     Change from v1 to v2
>     - Update subject 'a' to 'A'
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 63 ++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index f3dfb70066fb7..7cdada200de7e 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -41,6 +41,15 @@
>  #define SCFG_PEXSFTRSTCR	0x190
>  #define PEXSR(idx)		BIT(idx)
>  
> +/* LS1043A PEX PME control register */
> +#define SCFG_PEXPMECR		0x144
> +#define PEXPME(idx)		BIT(31 - (idx) * 4)
> +
> +/* LS1043A PEX LUT debug register */
> +#define LS_PCIE_LDBG	0x7fc
> +#define LDBG_SR		BIT(30)
> +#define LDBG_WE		BIT(31)
> +
>  #define PCIE_IATU_NUM		6
>  
>  struct ls_pcie_drvdata {
> @@ -224,6 +233,45 @@ static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
>  	return scfg_pcie_exit_from_l2(pcie->scfg, SCFG_PEXSFTRSTCR, PEXSR(pcie->index));
>  }
>  
> +static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +
> +	scfg_pcie_send_turnoff_msg(pcie->scfg, SCFG_PEXPMECR, PEXPME(pcie->index));
> +}
> +
> +static int ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	/*
> +	 * Reset the PEX wrapper to bring the link out of L2.
> +	 * LDBG_WE: allows the user to have write access to the PEXDBG[SR] for both setting and
> +	 *	    clearing the soft reset on the PEX module.
> +	 * LDBG_SR: When SR is set to 1, the PEX module enters soft reset.
> +	 */
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> +	val |= LDBG_WE;
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> +
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> +	val |= LDBG_SR;
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> +
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> +	val &= ~LDBG_SR;
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> +
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> +	val &= ~LDBG_WE;
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> +
> +	return 0;
> +}
> +
>  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
>  	.host_init = ls_pcie_host_init,
>  	.pme_turn_off = ls_pcie_send_turnoff_msg,
> @@ -241,6 +289,19 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
>  	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
>  };
>  
> +static const struct dw_pcie_host_ops ls1043a_pcie_host_ops = {
> +	.host_init = ls_pcie_host_init,
> +	.pme_turn_off = ls1043a_pcie_send_turnoff_msg,
> +};
> +
> +static const struct ls_pcie_drvdata ls1043a_drvdata = {
> +	.pf_lut_off = 0x10000,
> +	.pm_support = true,
> +	.scfg_support = true,
> +	.ops = &ls1043a_pcie_host_ops,
> +	.exit_from_l2 = ls1043a_pcie_exit_from_l2,
> +};
> +
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
>  	.pf_lut_off = 0xc0000,
>  	.pm_support = true,
> @@ -252,7 +313,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
>  	{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
>  	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
>  	{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
> -	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1021a_drvdata },
> +	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
>  	{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
>  	{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
>  	{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
> -- 
> 2.34.1
> 
