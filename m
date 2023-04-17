Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB56E4668
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 13:28:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0Ptt0tY7z3f4w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 21:28:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=lLb7P13C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1a::616; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=iuliana.prodan@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=lLb7P13C;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0Psx5Vfhz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 21:27:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdSVjlC8tne4FsyVG71P2eWZRlvddfscE5pT494/MpaMOqS1AEoF1M2IdQ1mrKOa0M1trSKzF2j/flxVP2IalS1EyvOIg3U9aklRZOsp8w+rlOb1TeGTpm0j4c9M04Iy0nvUqFMkyWu+Yafhj5GIP85xuBRbXApsCQ9AkXSv9Ks6kb0ICd8agQpSxYk7FWx20OloKZVfHHqzazvUp5BcVYbFMKh6tE8biOxgOswHt1O2jXzJSja60oe/b/BqGzyeVUK5hfbmI+BdRqXG/78DDZe5pYvYSxSXNYyyyGvS4CUkqahsJd1hmKvbCKVS3/v42JJSQ9FmsR7ZhVvCtQzzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc+y43GbovzjVbicJR3poCkcfjapDAnNMoaUGiQ0GKM=;
 b=EhpmtujTfqANholESUtWcjw5OF/QqnBUykEf2Vqu4NNv6bjLpxF21pH9OA+Z1P1J1oiSKRRvegnlE2Ta/6o4JBFogzUyXGS+N2fKcoK+hdjtFdPKKcS7GOJv8V2L0oeq1H1tYOFcr2mmxH9U889UYE0YDTQL/a5Na+3fvfRt2RjuR37AnK/HytLPUcutiNtUaKp9e31QNAHQi8zBrHNl1opL+jGP84spbL8yGcZ+UKTKxrUnILlBVIPVZ0p7vPfV7wIkbbGfW5dbYu3MhwZ6KBXCg0Gw2u0R1wtkqVy1+fzJrcScaFc6w4NZ1tAfQpbSNgdDhNez14PLuiP185zeOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc+y43GbovzjVbicJR3poCkcfjapDAnNMoaUGiQ0GKM=;
 b=lLb7P13CFjkoGWOHJ5iWaf3Fdj14qeLlJU0P/dNzYe91z166fproFGhRJn1gwSL62IPL4B85/9gmuImAVFOuIzQgGgUuXZxnoa/L/O9DBMktNNpgfrrTOVwvS4veICpp1bb9v4Jql35q2jctG9okWv4B6knHvHJPQfbDOx2reyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by GVXPR04MB9928.eurprd04.prod.outlook.com (2603:10a6:150:117::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 11:27:08 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b6a5:b35f:94f8:ff53]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b6a5:b35f:94f8:ff53%8]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 11:27:08 +0000
Message-ID: <55bd4292-7abf-dee1-9ce3-94dfb5b4b19a@nxp.com>
Date: Mon, 17 Apr 2023 14:27:05 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: fsl: Simplify an error message
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <c167c16a535049d56f817bbede9c9f6f0a0f4c68.1681626553.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <c167c16a535049d56f817bbede9c9f6f0a0f4c68.1681626553.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR07CA0014.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::27) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|GVXPR04MB9928:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9479c0-0d5b-4ef3-4aa4-08db3f36ae3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NipD/ATflIMs9/bZgxMmfDesn6w0DoQVnbpXEN8qveM6gd+rqdroBQUpmZOEM7T8ACD6stfdYk7UkXMx8ETRfjSju7kowLMbFMnqMn6IsKHKneIQzLJAvGmsqJGknt2cWLV55XayV+6T2VT191njcOEa45DjItPGcRcMacN6MXSK1GUpaTrQPd77HsbvjlVY+gMpvZ+d7esR4kYZBVCiRqdYeJrZD6y8bOq9ALCiYo3DYFi/V7MudMlZmsIXuDFt3NrYBAwTKpmwMj+kw8semNxayF+xZf2NSTFNXhWcxfkixMco8HOoBXAp95+Ya1kGldt9NtxLdKE7GoxhDAf86yeiHvWSlkJnL5MB/+p5zGfMQq4AMQncPslW3s1kiEUccTBTWPRBM2oxAUQis1VGo4crQO6FdRaYq7Bl0wKVyzgyiMGGj9cTkdGmdFafjyXv7ZBenDjmPTITe3x6JgHgxX0EDC2d7K0osqW/6Oyu+vQbnWSrdxIETNNkhx2EOoYt5MpN+Vy5YHFRyjGqZUrqOpuSlidBKrowFUmC+TqpMMs0HNno9s0GAFnFwIyQk4IbqaJwOlEA0c4N1DXQx4gMfbIU4zNMG9HlR7JXyC2lvZ6+WwAvr0kHjhrnK5VhD2IA1229mrsaX6GXuzUaq+HAAg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(4326008)(66556008)(66946007)(66476007)(110136005)(316002)(8676002)(8936002)(7416002)(44832011)(5660300002)(41300700001)(4744005)(2906002)(38100700002)(15650500001)(6512007)(6506007)(53546011)(55236004)(26005)(186003)(36756003)(83380400001)(86362001)(31686004)(2616005)(478600001)(31696002)(6666004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NVplQXN1Ui9RVWxVcVp6TERIQjdHczl1L1czdlJGUmoxZURsbEg0ckx4RFFO?=
 =?utf-8?B?QzRFM3czYlRjRGhnSmphbUhiMTl3OVZmWE9mSmpKQURoeXNhYWtkUkwyYlNZ?=
 =?utf-8?B?KzE3bmZjUXpmQURLQjhzNnhtMW00RjdybWplY0ovNmp1Y3dVZlMrL290bGtr?=
 =?utf-8?B?eUx4c0cyUGs3aFMwN04vK1VFamtqZCtBenJERTQ4eklreFBHUGpFbTU2MnJG?=
 =?utf-8?B?SnRWZjFCYnFiVFNNSkw5eXRtK1l3bXZ0WEUzWmk0SjJ0U092M3pON3JqR1o4?=
 =?utf-8?B?ZGlBS3RTeVlwTzRheDYzRThKN3V2bzBoZ09sUUxFM2JzQTNiekxLa3pLaksx?=
 =?utf-8?B?ZTNDOGp6eEpWT1k5cXgyelRHTWdDeWlEcUFTaGt3VFZBVFlQQmNTNHoyQTIv?=
 =?utf-8?B?NjFiSXJOU1dhbkUvWVJNM09KN0FTZlhoOHN4bHhON1RscnRDSWhQSFJCWjJo?=
 =?utf-8?B?andUSzgzKzVydDhFTHMwbFdFb1NpV0dvdk44cXhNT1cyajhxTnA4YUJhMHNh?=
 =?utf-8?B?L0I2QzRoTjF2MkE2U0J6TXpzc0dmOE9sVUlqaFFTRE8yMGZOT2xVcFQvMDVy?=
 =?utf-8?B?N3d5NFF1THE4RE5SY0V6dTMrQ3NRV21pdWdCU2dHenBkTzRRcldweCtueWF0?=
 =?utf-8?B?OEhOV0J1ektRNGgyK1RZaGgxUGxXQkJadHdxc09lb042bUpXdVN5WW1Pb3dL?=
 =?utf-8?B?SjBkdU1QS2xiUlEyU2xhY1dlTnB5MGMyWXVNTEIyais1bVdqNXZHTGtDbllR?=
 =?utf-8?B?REZPR0gxbjJWNVlUeHJ2TXlPaEd3Y01EemdsVUxzaGNweitMMllPVnE3UjA1?=
 =?utf-8?B?dng3SitGY0JkekFta3NTdGQ4N3B0cGlORDU0MWw3a0NhTzhXc0wxd25LV3Nw?=
 =?utf-8?B?Q01pQzNSZDBqbEZxUXY3bUZreUl1SmRPUkw3WUJYRVdUMmNxQys4dnRPMlhi?=
 =?utf-8?B?ajYvV29RSW5QS3dWKzFaNEJOQzNuTStCZ2x5QU1Ga0E0bG9Cemo3eVdYazY0?=
 =?utf-8?B?empxVTJhSVRJZks0ak9SVjBHUmlCTVhWNW9kNk83dHpqMElYUGdyb2FkZlFQ?=
 =?utf-8?B?YU1mUnJ1SHJVMTdXS25oelU3UFdxei94WkhUcU5aK2VURUxGRy9Oamd6eFdH?=
 =?utf-8?B?VGNUOXlpVUdtS0VpaVBMZ1RsYUxpS01PQVJaVjF2SFphNHRSVjkyQVM4Q3lU?=
 =?utf-8?B?Y29QU1YvRmVFVmhLVlpHYllmbzdiWGttMThXVXlkU0lEaWc4YS9tNHo4VDYr?=
 =?utf-8?B?N1VnVnI2NFlzZzZNVzljSVBBS0FRb056TkVhZzJZTk1NSHlpcUJyY2ZEeVFk?=
 =?utf-8?B?K2lxUG5OYnQ3dW5WMTdxcEV5UENjRFpVQzhEcmUrcXZZcGluU09jb1lpd3hE?=
 =?utf-8?B?MDI3bjFpeUFnZkdtS3dZbWlQVkcra3pxN0tSMVNIVkcwd1I1NHZQcEd0ajQr?=
 =?utf-8?B?ektXWHVuK21MWldKd0o4TXc5MEJyVGRnOG1wMHM1WVVhTk1Rd1dMVm4wODNt?=
 =?utf-8?B?V3pOVDZnVEhxZ3lhQlVHVGE1bkxqTWRuVDlQYktlQlN6bVE0TDMxcWFHT0Nm?=
 =?utf-8?B?YlFDdlFwMHREZHE3OHZIS1c1TFl0bXoxMjlPbjROQWlzaCtBRWFFSDFmMEdG?=
 =?utf-8?B?RmwwdGRkVkpIVll1WW82QmNWMXhOdktWZWRLc2E2Nmw3YXlJUWZOdVdhU1JY?=
 =?utf-8?B?dXllaHNodVNLUGsraFB2VzVVN0VTNThvaFk3N1BRNG1zZ1hrNFpIemVQMDdU?=
 =?utf-8?B?c2ZrMEUzTkxmRERacExRN2NkUUxoUUtGQlhsM1orOVRRZTM2U2tDaVpSU3JM?=
 =?utf-8?B?Z3c2cHVya0kzR1RETmhqbEdxNU54eU82ZjZzc1ViVmgrTEZYdzJIMHE3c2Nh?=
 =?utf-8?B?TExQM3dMR3N3MjlBNGNVYndEYXE3UklnRFNTbjZwbGdPR3JiMyswbFppZnhz?=
 =?utf-8?B?b3h3KzYxbnZSQkYwWXBJRkNscFg4OVl0dDNlc2FXeklhbkNaL3dBR05lVTFE?=
 =?utf-8?B?Um9obHVqc1RNOVJrMzQrYkNxQWQxbXM4OFIvOGxkUFNhNjdKRS91YkJTUjY4?=
 =?utf-8?B?T3dWYVhUak1uMEZtWWloZFR0UmlBbC9GUVVZMXl0Tmd6VmpEdHlPWENCZ1Bl?=
 =?utf-8?B?SmdBS2J0M25QVkZ6THlabjlXU2dqSU9yb0x6aWJ6eDdTSGIremVQVVZ4YVNx?=
 =?utf-8?B?eUE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9479c0-0d5b-4ef3-4aa4-08db3f36ae3a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 11:27:08.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvXXJISxkiYTLmPuPpMarK7D1plYLPzYH+fckpyHjkTypNVpcMa21jlwJmEBCpiPUuXk00ao5ARgUC+/FXDgJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9928
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
Cc: linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/16/2023 9:29 AM, Christophe JAILLET wrote:
> dev_err_probe() already display the error code. There is no need to
> duplicate it explicitly in the error message.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Thanks,
Iulia

> ---
>   sound/soc/fsl/fsl-asoc-card.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index bffa1048d31e..40870668ee24 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -858,7 +858,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>   
>   	ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
>   	if (ret) {
> -		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed: %d\n", ret);
> +		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
>   		goto asrc_fail;
>   	}
>   
