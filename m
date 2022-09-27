Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BB85EC889
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:49:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McPFx3sLNz3cCF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:49:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=oT7FLW5R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.5.44; helo=eur03-ve1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=oT7FLW5R;
	dkim-atps=neutral
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50044.outbound.protection.outlook.com [40.107.5.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McPF80gXBz2yxQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:49:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/cwSIKzkQqbe8mxJNXuHUO7iblFWvFZnPaG5Cg8fBQi3JXBiwFz135fQh9WJy6Mux0xigLTwtRMKt7e/gDRhmATfQ6+Y7qBaqI5oGbU4w0KVqXSEKspIILeMfWSgD4V05/XyLSurixgZZpobOHeq6uJuKRnDd6LH5gotxz915M3MUm0iTZypSee7P42msqYB3LYOSeDEO0tqHRYirVHTkiBGAPWNeLcQwK08aXNy8DArkyYS1hBf09IoqVUYr/pXv0k3X1wBnAJiR5lMvXRqArm9Z9upnm5yqeS76qrrWsItEPmMterCGE7HSmB60qu6/okr88iT37MbqYdj+qcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/GlSvh4wSt7QAhymLpji862f7i4BgdExIVg3FiUUTg=;
 b=cYE5x+tkmiEnV5nwzNKRB5Tlim59zAAmxkLU55H4u7PuIo4l6XOcMgMQHmUCcPQ0+3M/LGZVkCKKAKLuGy3Eb7hRLUG8NUb6cad3shAhL4xpN+KHJIm3gLdqVEHV5lkIBo7gBzgZhm+PGzGhiuWNGa7JUAPjhfSZy3G1U2+o+uRN3WcitK/pUptG8xdu3sET00ORbZuXB+84pn2/4Tr8kPL8lHkuB58ryJ7bEVHEyOBCyMHd163YZBBB+3PVIx10KIFxNiU5wXAOuz2/zMmp75yYH6xVtHircIHl8ioc0Xbsv3KCtM5QMlm3LgF4Yj1YM2+odqypHb4BRG+6f7RNwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/GlSvh4wSt7QAhymLpji862f7i4BgdExIVg3FiUUTg=;
 b=oT7FLW5RK3FX9MxKR8X8odM+pEeWdS0rVttQZT9MWOjfmRUmHMLrH6tmZAnkU5estRpnHMpU/y5yjUL2fuD0ihdpMoxzP0WtfUyrhNymoH+jkvqVkJR8ujauhAdt8lKOw2xdNQEtBF4/SVMUVKqElM+jB3T22nxTzhQBohsVtn2hpEP6mpecittDQrXPV/Uno7L8G5HCTcFMxou7OkFn8YNf3lhSrhDJPzg3I86Ps5inTjYbXyKN/pHLk3ZkSszrnzQJBIF6h4KQUi41Mxkfu7fmlbJ26EfnPFtijQJ1om2T60nDm9X7mWfIB7URSHU8CuRP5NcgdGfhraSTsqJ5Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by GV2PR03MB9380.eurprd03.prod.outlook.com (2603:10a6:150:d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 15:48:52 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 15:48:52 +0000
Subject: Re: [PATCH] soc: fsl: qbman: Remove unused struct cgr_comp
To: Yuan Can <yuancan@huawei.com>, leoyang.li@nxp.com, davem@davemloft.net,
 camelia.groza@nxp.com, linuxppc-dev@lists.ozlabs.org
References: <20220927133628.97774-1-yuancan@huawei.com>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <b3decabe-94d4-2bb3-0926-e4c4a6d66c60@seco.com>
Date: Tue, 27 Sep 2022 11:48:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20220927133628.97774-1-yuancan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0404.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::19) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|GV2PR03MB9380:EE_
X-MS-Office365-Filtering-Correlation-Id: 79decbd3-9ce3-4f08-1f64-08daa09fc6d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	M+dW7ukBZVfqqpJxIpE/tf4YilqLWWYP4MdmiTcEmp6aG5VLOWyRwHWB3jxWG1dvImZH6W5H+oHwd6OfrJW41lvxkGVRDzbRT2EBj54X1Z9weSxEZTjlEtKXAZaOfJ8s/K9FnAvBPL/JNyeuJGKlvT75tAkQh25h3vXfaGpYFc+xXNjZRlrhq7FNbV/f/9GGa3xjo8nHP2FywjefOd/N6gbfPUP6gxCSPQUtJctJoe1GwJJD6jvaTqbUEAiqzROLztYev9NT9LdGa0H7OhcAJYpx8qd0XhQiErHRczhqskV2trYjpIA1UqKLdZc+ZGFw5lGxMwZJpKHPnaNJ9ziWo+eKM8aEI+idgvINDYGbRPpmGxpLLW4I1KkeapSgVWfX437dI/fQ9dJoPwZW700HSndKW4MRBaeK05xaxn4blkbRPuacFq1OnO2MctZFbvRBUkkxuakCk8ngibF+E7GmgLdu8WDLh3oj9K+Nmn+p/Ha8Jq4/dVq8jsHAewh6OSHd7w8/Frk0P8xY1J17K7xY0Tc9WLi7Um1VrVU8wnZXJHow0wcGl38/639kpIaZDuQhyTGWRgiLFK+wOXiYVMpuhErwLlfaHX9t3r9IBlp/+60bKyp8Y9ulOgkui65AmifBQTSmemPEvJSyAYcyN1/wct5NGTGtt0wn6zjLyZXW8aL8WKT29ZmjkfA/6rtue45xf/0rVLe+nNPr+V8UbqHN2g4FSqHaV5NUOfx1dJR1MH7SPqwP3TpH8ct7Ghbx9fivkFHHFtn/+/rnO+VCAtdg7usok1TcKwvNxqm6JeeMXiYpygrUEnjT3C4cRAydX9fJcRNOHEYvv0V+MduQmbu3ug==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(396003)(136003)(39850400004)(346002)(451199015)(38350700002)(38100700002)(66946007)(8676002)(66556008)(66476007)(4744005)(5660300002)(2906002)(44832011)(8936002)(186003)(83380400001)(478600001)(6486002)(6666004)(6506007)(966005)(2616005)(53546011)(316002)(6512007)(52116002)(41300700001)(26005)(31686004)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MGhjV0pPVXh2dG10cHdRRjl5Nkc0U3JtSGdDQk5WRk41eEhubStRZStnakJp?=
 =?utf-8?B?QmVtdkVkMVdIVjRneVdNU2JTNWRBdEs2Mjh3Y3hNT2VZWGJ5T2VwSkpKS2NT?=
 =?utf-8?B?eXpXdUZML2hEUXNkSklaUmVXODUxelVKNGpzMHVTRmg0d1o0bWZZd1c0TkZq?=
 =?utf-8?B?YTFRMEczYUtmNEhaMXgzSGJ1eEc4ck9mbk0yMEFpTER2anZkejFsTDhlYTFv?=
 =?utf-8?B?V2lFWmY3cXZQSzVhZ2p0WmpVQm9CbUQ5MThhY0RLRFlNUnIrRjYwN3NMdEEx?=
 =?utf-8?B?Mkl2QU9hNkFTMHJaZHR4cW9EQngvdCtBTE95MmJFTDNqNlV6SzFydVhENXJB?=
 =?utf-8?B?bjc1RnFHdmF1S21DVlA4MWQrakhuRmhXZmY1N0x2emhZRS9sVTR0UEZSdTJx?=
 =?utf-8?B?enFlR0tSZTN4dHRmMFBuM1pYVWxabFVHNGZDSzNRZU94eUQ2TWd2SlRPNWN6?=
 =?utf-8?B?c2xwc0xOUGpYQTQzVm5BUXNlN1RtTzF5M2pqNXRrNGpQZThsM0g3S1J5emN0?=
 =?utf-8?B?Mkkzd0xGOE0vZnBBMms4bm1pdklHUU8vU3B1Q21PWDRlZHJNQUpONXk0cmh5?=
 =?utf-8?B?WFo3blltY0JKdWVHNE9pRGZ3UkpNc1AzeWR5aWgwN1pEeWx6MkNySzhaRzZ4?=
 =?utf-8?B?SlM1Sno0cXQ4dG5uSVQydDdxS2pzbDZwOVhObjByN0pQNnZ0N1drZG5CODdT?=
 =?utf-8?B?RGthMDFIWGNzWk1zYThhUXdIU1dOZnFvdzRyalovUG9Od2wreVhob1Nwcml0?=
 =?utf-8?B?VGpRbEcxaFBlNTFvbXd4Ny9pYXlwcDdncDhaSWpnQWp2N05EdlVBbXgremFk?=
 =?utf-8?B?Mk1mUDVSa3cxTlVMRS93SytIVkxTNUpUeFF0aXc5Qm4zbGVUTTlCVjFaUGgy?=
 =?utf-8?B?d3B0L3BBaUlFQTJMUEJVZ1lKODUvVTVXb2hDSDV1c256ZFZzbEZaSDRjTk5Y?=
 =?utf-8?B?RlBIWmFXaTAwemxtQUUxbytyS1h1RXloTWVraytEbU00YUU0dS9IalpZK1Na?=
 =?utf-8?B?Y2pJTVo1RU9TOWdBdXlVL3h4UjZCMDAzOTNDTG1MT21zQzgxWmFoU05lMVhF?=
 =?utf-8?B?S3lveXZTUk0za05MNkFUcTgraU1NdU8yWVVVZWJDMGx6SHYxenFFZWd3N3Ry?=
 =?utf-8?B?eU4yeXFYZ1hWSERwM0JtOUUyeFVpeSsvbno5UlhXeVV4ZjhxMDQwakJuTVZN?=
 =?utf-8?B?dUhjVEZseW5DZnNsQ0tORVlwZUE3NWV3N0Rsa0hYM1ZEazVUWFVYMnQ0YTA5?=
 =?utf-8?B?MERXc3ZPRWoreXdPVXcxdWZHRjdRUXBOSng0Yis0aE1Kam0xUFBwbUgxMTRO?=
 =?utf-8?B?am5kWFlaT3ZGcG5pLzhrWmxFYjFpRTRqbDZXMitSdTVuQTdzVDlaNVFFd3cy?=
 =?utf-8?B?TXJrOTl6NGhsVzMwZ3lNdC9CWnVvcU5VY0orM2VBWkI5RU1BUG0wTXhKNkNH?=
 =?utf-8?B?ZEVBWE0wQ1IzR2lmc2xUakEzZStZSWpYQU5pTmU3UDlGaTlhN3I1WGlGYUZE?=
 =?utf-8?B?OW5EZUd4a3JJM013QXVSM3k4YmFNYXBwMlJwYUk0b1ZSdjF3UEJEd1BjWmto?=
 =?utf-8?B?Vk9TQXZMVnk2OVZRQjZ5cWN1eEpzT1JYU1Vac1QzVWhSSUhOd0JsWVdLOU0z?=
 =?utf-8?B?RzhOd1ZyWmlXcnNoY0NLS1BTVFFJWSs1NkV3eENHLzk5aSszV2FoOHhFOXpF?=
 =?utf-8?B?a1ZEcndLTUZmMGM5ZWRRUHZZdWwvZmVTUjlqci9rL3phcFQzZVkrc2VkTnhZ?=
 =?utf-8?B?cmtGc0JYekxBblQyOXhOOTJNZkNPWkpoSlJzVGpHb0NZRFZhMU5QaDJ1b2ly?=
 =?utf-8?B?Vkxza3BKNzY2OXF1TklNNkRUUmQzYnVGN01qVDA1aGFIaWp6bzRrNzBLaGxs?=
 =?utf-8?B?Q2hkY2lQVWlrbVdRbU5vaTdRcmwrckZOY3NRK0duUGlJeHpCYzFHL0dpZ3hO?=
 =?utf-8?B?bUFiamltMHFtT2xpNVZRcVYrK3dFaGhyclZlVU5qR2xSSm5jc1RHS25VYVNn?=
 =?utf-8?B?TUJNOVpzcC9yRmtmOEJaU0VQUzFDRVZnWFBCSTFuOUJnMTVaRzI3TG45aGMz?=
 =?utf-8?B?cEdyc2RlL0dXRTBZMVFJeWlUdkZVUjZvRER2d29mTkZHUW9URGdpaXVFWXE2?=
 =?utf-8?B?MTYyamorVVJuL0d5cXFhWlJ2Yk1RWk44TjRiakV2WHVxNUY3VmpuSllHTVl4?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79decbd3-9ce3-4f08-1f64-08daa09fc6d8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 15:48:52.4518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGsjCgARi5GXqVOD4DLUmmisqTcgTyLP6crIu13aZj1G/hPwMQy/sGzabAWsnKjpaiD9tBn0sELHs42/x3gLHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9380
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/27/22 9:36 AM, Yuan Can wrote:
> [You don't often get email from yuancan@huawei.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> After commit 96f413f47677("soc/fsl/qbman: fix issue in qman_delete_cgr_safe()"),
> no one use struct cgr_comp, so remove it.
> 
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/soc/fsl/qbman/qman.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index 739e4eee6b75..4cebfe7f663b 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -2543,11 +2543,6 @@ int qman_delete_cgr(struct qman_cgr *cgr)
>  }
>  EXPORT_SYMBOL(qman_delete_cgr);
> 
> -struct cgr_comp {
> -       struct qman_cgr *cgr;
> -       struct completion completion;
> -};
> -
>  static void qman_delete_cgr_smp_call(void *p)
>  {
>         qman_delete_cgr((struct qman_cgr *)p);
> --
> 2.17.1
> 

Reviewed-by: Sean Anderson <sean.anderson@seco.com>
