Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADCB68D555
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 12:23:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PB12q0NG8z3cGv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 22:23:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ivvcm7X/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::62d; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=iuliana.prodan@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ivvcm7X/;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB11p61wkz3cBk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 22:22:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoIQ2AS1wfbsjjqZcu4QZRDwxe9zctTxRljcD0hvWl/Dff6Fb7sGTUn+ilvaInAFapxfaSoL2GrTjT2tKQKUgjDepxKmvEgu2sZp4SufbPjqZ/mqf3bQBMiruOZck5VHQNHys2VLA3xV8pGeHYlSHiCMKWUcH9w5fhN043VDIEgJi/gWvVMcSJXU5yfAsUAPJf3aDmGOaPVYjnuvu8p/Z0tbSMg0XMg6iYV+P4Bb5NMMYPFl/zjCIL1hFqKqh83HwG+N4B8mRGQy6IEa3V8bM1Ify5i4w22z3cst91I/JFMCq+FPQyC2CoxsujXkho3mwvMo5CkxWdF2yz/01Fadpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dG23wThND3QslhZ248ndwcF/k9cizxEHZc8qGu0Xw/Y=;
 b=hdpqplNGLP65hTgTjH+1yn1mKyAY2YEgK2nt343qxmxFqN23xzJ32Pbf3L1WMYOEu09677pXVjyRZfhL/+T5v4L8uyaBCOpIh2LRb1U+clj8RtUgbDpdYFzU6VWVB1FVl++F3HqIFX/j7vNpChk+p0UAgR9AKA+7lyy//gND/fHXaY7nimo3CYo6KUDSDht90Ot5MNcVGS2v6s7f/hyVRKB+WueZi48o7mwi1mxzeS419h21dlQFsqkqo2RJG9qrt/kJoOYBNuvl2PDrbGxJoyCBK8SYYN/e1H7Nz3ZtdEr9N3Vc8/7Hy//vQuE9BdePlRGpR8ki1x7U+9H6Jkj+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG23wThND3QslhZ248ndwcF/k9cizxEHZc8qGu0Xw/Y=;
 b=ivvcm7X/GBbr1HlE5KSolD3Ge8HS4mJmx0FwzAaxVHqOkFvz6fUd8GusQiZIA7dutxeuCXwwpISzwg6XAz63Dg7536rlHKDJkSjbSc7MfG/x2eM9g2Nuwu7qIsAgQrA0b0QB42oPLVxG/nk9JKL1pC/I24BAH6ruWEu8baXZfGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9628.eurprd04.prod.outlook.com (2603:10a6:10:30b::14)
 by AS4PR04MB9434.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Tue, 7 Feb
 2023 11:21:57 +0000
Received: from DB9PR04MB9628.eurprd04.prod.outlook.com
 ([fe80::aec2:20b6:cf99:2886]) by DB9PR04MB9628.eurprd04.prod.outlook.com
 ([fe80::aec2:20b6:cf99:2886%5]) with mapi id 15.20.6043.038; Tue, 7 Feb 2023
 11:21:57 +0000
Message-ID: <115aca23-a47c-3a92-ae19-b4fa71412ca2@nxp.com>
Date: Tue, 7 Feb 2023 13:21:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] ASoC: fsl_sai: fix getting version from VERID
To: Shengjiu Wang <shengjiu.wang@nxp.com>, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, shengjiu.wang@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
References: <1675760664-25193-1-git-send-email-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <1675760664-25193-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0043.eurprd05.prod.outlook.com
 (2603:10a6:200:68::11) To DB9PR04MB9628.eurprd04.prod.outlook.com
 (2603:10a6:10:30b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9628:EE_|AS4PR04MB9434:EE_
X-MS-Office365-Filtering-Correlation-Id: da656522-c7e8-4bc1-bdad-08db08fd85e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pb0VyUArfqOvcCMFm4KS5o5mXSStrMivnoqYByf4zlc4r/fxN/THSmNwYvuw53PL1OpFp9KswFse4eOrhUAoeyWUKX0lgRf5g9y/bNODjWnpPz/DicNgfxX9YpJCxNCET/28Hu4G2TrW0sUVI30L/l2tWW69nwKyx2y+pp3y+Rz/vwku2PEBu66aSqRzXHu9IinSAJNxOneNMbGLVJLZfxzjgbemOMcBOQYlMitae+6rKzovpNadxxUp++tydCZ//rGRD9r02yjP+zxRmDUJULAH9rjFRjdoDqG1tnWOmTM8kpwwxizFnqVHzP0tzfAJNOktkI2AYfYczjsSiGO6uOaBVADsnXRJVKa4XoQQ2FR54Amn0GUUmjh3lCwSyk9+IN/5M1qvTNhscuepQdP41v6iCmRK7vSsy1HrOayPT5IUe7nETV9z806iw5PCdQfeJXK7O4IoeE/ReAotxgGlPAEe6A/fGzrCJq05qkw+jlZPCA010b9EJlzXGcaA6wbvNpdBmyYSQsXCLUBTtbpnuyN4wfufq78TNh34Gf+GIMt49ZIicYzv1X0bo4eqeCJovVj8oUdehOrgPghDGCDEPYccUoqMnqsZQ24G9oa3fsy2AH5Z8S2HNie73IvH8DrX6/j21SlbDhy2HfV2mvaYNULOPcZnlIbqKsG5qtuhr7FYObp53GdUuT+loNX+Zq/lpPV99/6vlV/raUzY++TdC22wU9fmS2gbFSnC5L207iHn7pf3l5F4I65fPtVcBHae
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9628.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199018)(4326008)(2616005)(8676002)(6512007)(26005)(36756003)(55236004)(66946007)(66556008)(8936002)(41300700001)(186003)(66476007)(6486002)(83380400001)(31696002)(38100700002)(478600001)(316002)(44832011)(921005)(2906002)(31686004)(6666004)(7416002)(5660300002)(6506007)(86362001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?QzB2VFQrVk9xYVRZMEZObWcyOThkQjdXR1VEa0xEclFNNUhzTGxUTG8zejlj?=
 =?utf-8?B?T0VkRkh3NVRZZURsNFBIaGNvN2UrTmQzdllxNDdUUEZTekF2UnB3SlJCMnl2?=
 =?utf-8?B?bHNDbE83QVVlZjFtaTQrMWh4YzhPSHBxVm1rME5sa084TXk5bzhOTXNJYTRt?=
 =?utf-8?B?MnBDNXBXNW55MFJGRWtpUERFcUl2YXUyckVEZnV0QXR2WGhhUS9abHRiMVFw?=
 =?utf-8?B?MUx6YmJpcjJRWWh0WXEwVFl5M0o3U1JmMUhUelBkY1pPSU5kQUpGZ2ZiNkF2?=
 =?utf-8?B?WldDOWhmOVorNGtGZHQwVFMzbkJHSE9sa1kzV2NkUzNJYmxNNGMyeTVvQVhJ?=
 =?utf-8?B?bmNLeDhrelZTSHZqUzhmQTVMUjZmRDhuaHliTkNHNVk4bTA1b1hEQ1d4Y0tF?=
 =?utf-8?B?aVYwZHI5c1JyZXhOekVNU1J0anlsTWtmakhrNWlkdnpwa3VIV1V4THVRY0xs?=
 =?utf-8?B?STc0WUJTaHRLQmZ2M3h0aHo0dStBZHo1enl4ZURjUWZUR0h3bDY4QU85ZS84?=
 =?utf-8?B?cUNPaUtVZEtaWm5keUprcjNGSUhuY2hWcE9jaWRGeDAzMWpaZE53TmtnVTNS?=
 =?utf-8?B?dmZ1VzhvUFRsNnQzUDdtdzNoZDNaVUlmSzlmS2tHVE8xZEIyalN3UHpSQ2N1?=
 =?utf-8?B?YlJ2RHpJMktPZkh3NWxUNTVUb3gvQXBFSjZQM3hMcE5CbDBFRVF3eDZ6SVFy?=
 =?utf-8?B?VU50NTdWdkEyT04rbUhPQXVOM255UTlhUjUyMlJRcmdENzV0UHNsSWVMcjRy?=
 =?utf-8?B?RHRoeVZaV2ZFc1d3OXQ1bGJaMkRScldXNkk2RTBtMVR0NHBkTVEwWUt0aFh4?=
 =?utf-8?B?dkpkNjh0WlQ2d3pjalExcER5RXcyNS9udXRDMk1rd3YyM3RoQW81a29sY1pP?=
 =?utf-8?B?V3FEaEk4ZWo0SElocVVjSUxQb1J4OGorOW51NDZBUjNNTFcrcTNNNndpbXRw?=
 =?utf-8?B?ZDFnRnRGWFBlWkMrZlFUam5HWHQ3eE5BYXBBNUVBT0NENmNtN1I1b0wzc2Rk?=
 =?utf-8?B?RG5Ua1B4bHVuTzJqaXlMRXRnaU9yWGZkeGhwL2U1d3ZPUjd3U3V6RGt0RFdZ?=
 =?utf-8?B?ejBMTHZCMHVrRG5RSld3Mk4rMFFpN1I2anpOeVg1elBzaWxqOHozcElObitZ?=
 =?utf-8?B?YnczWHFqZWRRMU1FS3luaEtkR2RQcjIyY29iL3JnL3RxRXhMQjlNamNMZ1Fl?=
 =?utf-8?B?Q0xmdExkMlEzS3pXRjV5UjJnaGsrZEhEdTZER0RKZWsyMTFqNUZjWEkvYm14?=
 =?utf-8?B?cWJwK25ES2R3R3FOMDVBd2w5VFFKU09XbkQ1VFBMWUhyUTM0Nk9iSWtndEVw?=
 =?utf-8?B?c2w2OEtEN0dhSDFGeS9ndzVVeXUwSStPWWVDaHlBRDYvUnR2SnpSOHduclRt?=
 =?utf-8?B?dHBPbERIVDNvaXJjTWg4djJCN2pYRFBNdzErQmdSNTBlNStjOTZ5Zi9hSTU1?=
 =?utf-8?B?YmhCOTh1Y2VHRlFKUlJObWdKTkJHKzJaZUsrUUowMnBFcDFINWwrWmtSZVBY?=
 =?utf-8?B?dkdpVjVxcy82bi91b21GeHRHdnpMVE1KZ1laYnlUZTJaaER2V0wwZVB4MEpr?=
 =?utf-8?B?ZWJJdGU1aGdyVFhTODVNWFZ4Sm5LYU1TM1dDeEIycm9GZ285TndKb3loS0tE?=
 =?utf-8?B?cituWjYzTGREQVFSS093WEVLeGFUeUVzalRqNldEdXlRVSsyNFlEZFMyS1Z0?=
 =?utf-8?B?RVc3RHdTaUl0REpheGZyNVpHUmkxVURtR3B5d3IxRGNHTmxWSzdpellJaEpv?=
 =?utf-8?B?SnovdmtUVXUrUlh1d2pkNDVyczNaTldDRWNiWXRTM1lIRE5rUndIWnF6OW9v?=
 =?utf-8?B?ZXNHZmdQYmE2bFJqLzk2eXl2OFpBY1RycVdSVTNaejE5MEl2TkRJczk2OUpJ?=
 =?utf-8?B?ZjRORlpzRkNmNlNiaEJmWHM3a1R0Ujh2MlpKZ2gwRmhZWGFxLzFBYWZIZVBH?=
 =?utf-8?B?ZDdtOGdnbm9QOU9oS2o3UXZINGJwNWdtQjh4aGNUZDJiajdOQ0ZySW1tQ2da?=
 =?utf-8?B?Nk9nd2UxU1V6VVdjMVNvcmZ3cEs2USt5UnhIUUFJQ3ZsakZDcjJaSkVGL1dR?=
 =?utf-8?B?UysyMjUveUNLMEk2OUdiRDIrK1ZLZFlSK2s2ZklBVHBmTlBXZUlYTGxINUlt?=
 =?utf-8?B?dFVUSmhxSTBScFpQQTJaQktCMUJQMnc5SWNqM1crY0s0OStRV1dOOUg1cEhy?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da656522-c7e8-4bc1-bdad-08db08fd85e8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9628.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 11:21:57.1302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfyqgjThoKfZbVB6zkedd7qzorjdGZGuRHXAl9UTvM5o+gs7kwdfC9XpbcWHq9dsi2A9CLi70sSAwV+BA8DYIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9434
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/7/2023 11:04 AM, Shengjiu Wang wrote:
> The version information is at the bit31 ~ bit16 in the VERID
> register, so need to right shift 16bit to get it, otherwise
> the result of comparison "sai->verid.version >= 0x0301" is
> wrong.
>
> Fixes: 99c1e74f25d4 ("ASoC: fsl_sai: store full version instead of major/minor")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>   sound/soc/fsl/fsl_sai.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index c365afd6c4ea..1b197478b3d9 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1142,6 +1142,7 @@ static int fsl_sai_check_version(struct device *dev)
>   
>   	sai->verid.version = val &
>   		(FSL_SAI_VERID_MAJOR_MASK | FSL_SAI_VERID_MINOR_MASK);
> +	sai->verid.version >>= FSL_SAI_VERID_MINOR_SHIFT;
>   	sai->verid.feature = val & FSL_SAI_VERID_FEATURE_MASK;
>   
>   	ret = regmap_read(sai->regmap, FSL_SAI_PARAM, &val);


I would put the version in one line, but probably is easier to read this 
way.
Also, please explain, in commit message, what and from where is 0x0301 - 
might worth adding a macro for this, in another commit, of course.
Otherwise,

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

