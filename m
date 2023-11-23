Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 939207F5AC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 10:07:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RtYI1Dzf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbXM442Fmz3vZ3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 20:07:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RtYI1Dzf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::625; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=iuliana.prodan@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbXLC4pRzz3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 20:06:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXGzoF9pr9Ue92h3jeQlOOnWpyFXPZWXR0V7s04sFZ2/ILBxToXxhTBSnpj8XH7PDi4HlIhmRZgDNnt2AFEwyow6B9Iwixnf7N7XmLYndXSoo4tCnROaEgsqWju6w2atXnDVkH+L9J15x43pdtmRKJcqqK+6Z3t17QNsa98OsWQcUskvWJTeIPTUUdM/UIpxRin9pSdC09R3W5+t3CTekJASrWc/BmNiSDcc1H3dmdC06QzRsPSY5/gaAYaammdcDfZwA0y+M6IBUypoiwlFk/zbhx8X6lNRmCMU4TGEy9kTIf+zRjNmZD67zjh+2D5mNzP7uZdHcr0ePQbGwC33Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LcfLLWOwvmLUuv3C8ICY+wJp7LYDauljJUxsB7j8mQ=;
 b=Y1AYvE/9thV2JF6WTd3Bw27herUB+6RkLVn6qjgyTH0RxHNDiC6ZFTSQKIWZy40bnlBNue3NQrYyFIQnIRWfaw0GuY1OcMW7TwltEVRSfqH2fLIPIcE7PyMNRJmnMlzGoFYiPqQbJgZ7Pmft40pubTluyTXDUCCDIVfZxp3e5cS7lcUyfu7YW3pb6WgDj6i13c8H13n/gCWZ5dDylsh5sBYFNeud8bFTUClkbdOvDlumofybbsBRKw4z7xGnRktT1ObDtuYzdzvvWbdb2xMAFDf2ByEq/I3mjJMoE3+gXQAd/rjxE0XXU+nbXq/IcgFlZMRC3pon0MNbhmgojer0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LcfLLWOwvmLUuv3C8ICY+wJp7LYDauljJUxsB7j8mQ=;
 b=RtYI1DzfTzK0wy9B5UEHO2SA2q3A8S5whzbsIv3+jDP+9pYjz3iFsTz8tceHg39a2/DXpAGL3cIrzGn01RFaqE7LY3Ry4uvvg3IVJQ+ODaR21EVm6H0+mj+RsIAQXmLyWWq68cTuf/+DUJvfBLMk1vPNAvfghcbJYSaezPcjJIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AS8PR04MB8899.eurprd04.prod.outlook.com (2603:10a6:20b:42e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Thu, 23 Nov
 2023 09:06:30 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::faf7:684b:c6ba:e191]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::faf7:684b:c6ba:e191%5]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 09:06:30 +0000
Message-ID: <da13e561-0b3b-401b-966f-9a54e2e9c36b@nxp.com>
Date: Thu, 23 Nov 2023 11:06:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fsl_xcvr: refine the requested phy clock frequency
To: Shengjiu Wang <shengjiu.wang@nxp.com>, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, shengjiu.wang@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
References: <1700702093-8008-1-git-send-email-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <1700702093-8008-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0154.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::23) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|AS8PR04MB8899:EE_
X-MS-Office365-Filtering-Correlation-Id: 1565f127-24f8-445c-066f-08dbec037b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	BtPz6WzaoczrDJePdpMRI7rzcoBB5Xc+ei+pfcdyFhL0mdG/cSqfknGiqUHTcL7gihIBbLWqVr8kKkHtUesmOpmRQJN9u5KYu7UQWXfmccxxiTFMT5rFgPegRjh96l5HX665gPXMuZhn5scNgE5X67QWzhj63NkY0UKdaaVYOJwSoD4RR0XiRNkJqhCmY/I/RQ+Ln9l75PbNM2L1KvzA2OedNbNKEsLgTIx7mzQgR1lbXGFcoo/nIRaBa3RMKaZpMs/2o//34mMwuDlN9ZlwnzIFtlsknW+JFZGXMm/coQcCJGKRC5oVup+eetbYiI228jXVlaYcRVDkxo/qkEG+n+yo/n6QWFDuJ7obkgPygPGG0ZjtQPxLePookxueJiCobw5qNfvEoZIeL7xRnsN2pH7Mda/O3xbOIHeR9vYHJexH4MSXR+InXUe+7jz/Svclb8RzHsf4aE2lq8qXVHwUSul8WnEeLhtbW8nh4nACCX8pQ0KqTXkIJL4tTb8BmaKcgoN0CAavWcxzMK2DaYafgrm0g+k+xUfmR1EGdTBcYpG5LSHfXZ+QBxyWVr318OEY6WCZ1i1D5SSkFaCSeMmFEMWgVpRMVssZHfBc/xYmMGb86zywZhF7TZ7/1CcZZXOF+6UYhvaXwi91jSKJSWh1Mbl3IGUAotOVN0eBZ/GKMmA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6512007)(2616005)(83380400001)(26005)(316002)(66946007)(66556008)(66476007)(478600001)(6486002)(53546011)(6506007)(921008)(6666004)(7416002)(44832011)(5660300002)(41300700001)(2906002)(86362001)(31696002)(38100700002)(36756003)(4326008)(31686004)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZjQ3QWFEQjlVWGhtczB6ZGFteG5tejJ1bis2UWtCK3FXV05MOW5ON3ZCVEJJ?=
 =?utf-8?B?TlBWQ2ZENGNieTF6ZTJVNVhSRFA1akFzTk9TMzV2RFVpRE1yK0t2clBpcFBo?=
 =?utf-8?B?cWY1YjE3eEZWRWRVa1BsUHFKSzk1cmtiNW9nL3RLZ2RjUlVucXNDVUZnZFJi?=
 =?utf-8?B?VGtGM3ZoanpaM1dSK0QvQW11dlowNlU3R2hkZkxvS3M5bkowYnJqVlpOY2V0?=
 =?utf-8?B?MDVYV2FqQUx5ZzlDS0R5OFh5M3pVcjZ2TkdISS9acTBvdTcwTGR6UTlBSXNR?=
 =?utf-8?B?dU9XQ1VONUE2d2pPSGVRSXBBa0JoMW10bTEyVCtFcVRkQ01WMmU4WGQ2ZlNI?=
 =?utf-8?B?cTMwUUZWQmdpbDBMNW1sRzZ3KzZUZi9TL2tOaDVTeUo3Szl2NlM2WU9OSVdq?=
 =?utf-8?B?RkpBYWZXMFh1c1BCL3lBNkJ4RytweTBYRmtoTW5yN0MxbzNsT1hPN1IzdFFP?=
 =?utf-8?B?a05EbEpUTUhObTlVd0FETGJtTEphbzUrekRPNXJnZGdKV3lsTVlNWHd5YzRQ?=
 =?utf-8?B?SEU2NUJRcVZDRjF5MU5qOFBhUUtqZ1FScHA4WEFVT3BpSnZHQ3JqcWE2T0FF?=
 =?utf-8?B?RG05dHpNVWdOb1N3MUhlS2FYbjd3T1g0d1c4OWF1TExXeUZzeFExeG9pWEY0?=
 =?utf-8?B?SUtqcFpER3JVS0M4Mlk3SnVYTEtieCtIOU1WZTB0cUVUOEIra0ZZaWhXZndI?=
 =?utf-8?B?OGFqd0RXekRlaUNBNXVEZ2NNYU96Q2JtdEJmdS9VUnNhSXpqeUlObjZsUm5T?=
 =?utf-8?B?OTNndXc2Nlh1Q0lvK0VORC95VmVjOHhGWW5nek00SUs4Y0VSUUFSZVFSVEJY?=
 =?utf-8?B?UmtmaWU4VjRrb1ZZcEJnRmhudUQrQjhjWXZBRGVTaWl2VnB3Qzh1MVVwYVly?=
 =?utf-8?B?TTJoSjZ0a1Z3VkFhQ0tRQUZHVVZMSnRub01kVU02d29zQnVMbUNvblB2U0Vv?=
 =?utf-8?B?dFZqOWtwbno0b1J1aWwyRjZVT1ZtMndiK1gyeVlSZkRaaG8weEFqTU9SWklT?=
 =?utf-8?B?VXR4bmFrRk5OT0diV1NkaDJVelBaRDhJWFNneURBMGRFc1BLVml0UmZqSllw?=
 =?utf-8?B?TlExQk1KRE9YenNaRkUrZFpUV2lPM0hCcTVjYTdmUUN4dTBKM3pwTE1JN0dG?=
 =?utf-8?B?Zm9tUDYvaTR5cExZZVRkN2VkYnNhT3hMc3IxVXRGRk9SMUZ3MjE1UXYvK2tY?=
 =?utf-8?B?WVZxNzVvV0NSM09JVHRBTGJJRnpTM1Rma1AwZnhvbjJ0dnFqOWxYcThqTWFX?=
 =?utf-8?B?eTNmTWVNeGJNUkpPUnErY3ZqcWhweW44cmo0ejhYckYxRW5FUWNZMVczdTEy?=
 =?utf-8?B?ZzJHbjN6QWVnaENEbUdCK0FyalBrZksrNTVTeXF0NEs0bFB1eVEyRitnTE1l?=
 =?utf-8?B?YXMzOENYekw0clhzNjZIYmVZMmdPVnJvYzRGZ3RLZlNJVjh6bUV3UjlIMTFa?=
 =?utf-8?B?MWY5eVMyNVdIYmpVblMvMDJrR0VnZW9YZ3NYWHIzS1dxcjdVcFZIdmd5eUJW?=
 =?utf-8?B?ZHg4TTRjZGhDY0JaKy80TERmMmtrRUxZa2VVU3B6STNmK2hFcnFicnNXTVZB?=
 =?utf-8?B?cEdZcnUwYkpYSUdsVmVVQTE1S3h6cGMxQWljZ0VubG45a0ZoVUgvWkgzRm1k?=
 =?utf-8?B?ZjhyMGxROGFSQXRibDhYcS9RYVVCbkdRMHAwRGlocVNkQlBwMm03NDZ4bU0v?=
 =?utf-8?B?YmE4a2J1SVBzRkZzMW5LMHZSUEt4Uyt2VzdSR1RZcjJhaklTUkJSQ0YwV2VQ?=
 =?utf-8?B?R0wwSXZ3K3hmNU4rTm1hM3ZPazd0VHpVOVdzRGxNS29mN09TaXhKcjFmTkgx?=
 =?utf-8?B?NUludjNKeHlhL2FlR2RLK0hSUEFoVitIYk01N0JhdnpVbk9odHVxTmRERnlh?=
 =?utf-8?B?NjJ4VUR4dWFvN01jVXY1Y0p6cFVDNGVVYnI1d1JnLzhqTUxyREZHNm9KbzIy?=
 =?utf-8?B?andYaks4cEhRR3czYmtsVGVlM3JNZDJhemoyWXptZlZDbjVDV3B0eEVIUnhh?=
 =?utf-8?B?bkdpNHpIYklQYkhxMW1hYzVIOTNoUGxHcVp2QzJaNFA4bDFRNWxNR0VmbDN5?=
 =?utf-8?B?U3lOVUtQeGdCSGZMZnplRVlLTFI1blJsWk1LdWgrOFAyc3dTcnRLUk5INWl4?=
 =?utf-8?B?VUxDY3pqM28xUG5USGpuYlphRjl4Z2wvNVZKZWFpSzQ0TURoc2VhQTZXMVFu?=
 =?utf-8?B?RWc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1565f127-24f8-445c-066f-08dbec037b09
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 09:06:30.1792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDIgj+gbFqKgBrNbnaCHsDTaYOGDweyKs/5ud0voKYXAUz0ackMSzav4gP9gTcnvsuFiTpbQz59a6ZTL5ss9YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8899
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

On 11/23/2023 3:14 AM, Shengjiu Wang wrote:
> As the input phy clock frequency will divided by 2 by default
> on i.MX8MP with the implementation of clk-imx8mp-audiomix driver,
> So the requested frequency need to be updated.
>
> The relation of phy clock is:
>      sai_pll_ref_sel
>         sai_pll
>            sai_pll_bypass
>               sai_pll_out
>                  sai_pll_out_div2
>                     earc_phy_cg
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Thanks,
Iulia

> ---
>   sound/soc/fsl/fsl_xcvr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 77f8e2394bf9..f0fb33d719c2 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -358,7 +358,7 @@ static int fsl_xcvr_en_aud_pll(struct fsl_xcvr *xcvr, u32 freq)
>   	struct device *dev = &xcvr->pdev->dev;
>   	int ret;
>   
> -	freq = xcvr->soc_data->spdif_only ? freq / 10 : freq;
> +	freq = xcvr->soc_data->spdif_only ? freq / 5 : freq;
>   	clk_disable_unprepare(xcvr->phy_clk);
>   	ret = clk_set_rate(xcvr->phy_clk, freq);
>   	if (ret < 0) {
> @@ -409,7 +409,7 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
>   	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>   	u32 m_ctl = 0, v_ctl = 0;
>   	u32 r = substream->runtime->rate, ch = substream->runtime->channels;
> -	u32 fout = 32 * r * ch * 10 * 2;
> +	u32 fout = 32 * r * ch * 10;
>   	int ret = 0;
>   
>   	switch (xcvr->mode) {
