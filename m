Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15926E863A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:13:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1ymM5zcPz3fHV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 10:13:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=OWIV6Odo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=2a01:111:f403:7010::705; helo=jpn01-tyc-obe.outbound.protection.outlook.com; envelope-from=kuninori.morimoto.gx@renesas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=OWIV6Odo;
	dkim-atps=neutral
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20705.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1ylV1ZS1z3cGH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 10:12:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfJJopDRQOaLoSdP1crjDgoFEnw6hqjXPnhgw7+9lZh850ma4Ek8IL1FRZrBzL+LxXW7UsON03W4QTikX7+nrbeNsahZFwrFInhoI6qmmC6gAcSAJs8tl5WAeMmzfMaaKPHyU311dusLLFeBKBRgxbmBl0PnghwdE1jg3oR3bcv2jZEhxEBbFtdtdBlmx+Y7jis81NWYMdYfnLN4k1dRhIkPlbKSNGYGQVGtZP7FMOCqV2gMifeqPwvovCkthSUfO4EYy9yOGppYWNcbNr2MrQniu1OSUNe8CJwj9g4nLsxBtbk9LCXPXa30CePNyB9/O6aZE1SdhUXdABnvAtwzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMl5Ut/Xc0Z7kuZ/drt9sXcQaelCyUk9MEpDfmGVEPY=;
 b=CRDV5bPBOWIy6PQIkFSZw2n2ZpedV/CEX/Hge9qJ8Vv9JoMPlA9nMPFTwnai5ZkTwh1eeFKnAF+Zvl3zooDmUhVin/LL59aHIu5s3lTdcLatKPG74RV5BaIzeUwajTSmFowLZo/Q6OUXsk3dQ7Xthb8TFOm6l6Mdn9RoRpm34QuWeBnglMnk8gWYeij1wGiCQsWpvL4UCKhw2dF00w+p5wDbRbOQUsQFF/rlctvFbbmQf5xVQo9ukf5S9B8SUcD2XY7bOzgpZYrusuMeMrSBdNJOlmJeuu0Y9A86JsAiCVt7Mm/FjFR5kKE7dQIdq5C/7Ao057KM6ZmYrj9b34mrgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMl5Ut/Xc0Z7kuZ/drt9sXcQaelCyUk9MEpDfmGVEPY=;
 b=OWIV6Odoykz2WcsBYkqRCBjz+fGot6Lw2muSTew+Fp08IY4n9drXPE6Gdp92Psat5GppAQG9+0TQsdhudTbpeM6b9al1w027pNG8NWza3WloiBa91bqwSEPYM+u9xtolGqeVdFoyZuPkQL+24b3j0CaQMAdUc0vwondqHnzCW2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9276.jpnprd01.prod.outlook.com (2603:1096:400:1a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 00:11:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 00:11:54 +0000
Message-ID: <87y1mnv2d2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] Revert "ASoC: fsl: remove unnecessary dai_link->platform"
In-Reply-To: <1681900158-17428-1-git-send-email-shengjiu.wang@nxp.com>
References: <1681900158-17428-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 20 Apr 2023 00:11:54 +0000
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0558b2-8f5e-4759-4e3e-08db4133d939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YHkeu3Jl2tg5HERTAdF/RiqXQJaoUeKgygPvb9X3/cQ91vWfHpQHaDgr7JszlBIX0JPl8NqCldSHhpmhqO1AIsv2+/AiEJLczIJBCvzDcKhD6GUjNeH3Pa6bBMmNWHX6Y/MPAgaenlIDt6YHZ5MFM903L5vbNUWGOBAyhV9TzOBjXlu+QGLEZ5rkigcpVdE7Z2HG3/Qk7hG+N0jBuXRCPLr0cM8M51XYhL0ujC1zPpLhQTpsvIDDDDABLkAOwGsgM1hV3mXMfYaplIwfQ+rUx9j+RrMY09q/QWXXhLLVypsgRHFqhCT2hRsxtXHeGt9GMVtmZB5O2cNh+5OAk7eGTNydDl1hbYfo/t6voOHndCP6UhaNerjXecom2OhhJDdBRVu+D2Qfcy700hZK648EtbZ3mNvmqoXco5Xqkt01oV9Jrr9OxfhdewfkemiwA5/HnN0Wp73LP50tuwZ5yhhE+QODYUrbKlz8cVEVALh28ys+ICvgzVqbuk3RijqFtVcqAR2Pi2in0MtdN+//vqeiEyRZaiv/nblAwYE+w65fV5IB3aQ61FJ+mMj2R8cw3w2xzSLDZUZC+3HFvdW603T27q2uvWeH4ZJsXdJgpTQjB5oOAn7qvmCfT8r+Y30GMDM4
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(6512007)(6916009)(6506007)(316002)(4326008)(186003)(26005)(478600001)(2616005)(41300700001)(66476007)(52116002)(66556008)(66946007)(6486002)(38350700002)(38100700002)(8936002)(36756003)(86362001)(2906002)(8676002)(4744005)(5660300002)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?379Hv9wKjc2jRyj1paY/hUL0yh4NCqAUW32nd4UC3EHcl7+VRnf+tTC/AI9l?=
 =?us-ascii?Q?lx1qZ1q8WgwbBicvHHGtwuu0ry1aHeFlxAQPsAG62rg9oaATJrFtURCWwIlG?=
 =?us-ascii?Q?gxkK2NR18qb9dIPtgxJWUVKxjmvglvT9teXZfjA+XncDoElE77t6qHKKVcAH?=
 =?us-ascii?Q?X23YxwfpcHpx1XqNc3otP6gvkR1GnktHCCTAnrC7OG+O4kenTY2PqkJnPpdv?=
 =?us-ascii?Q?QkRpoGbec83OuIa5dtv0GB0fPK5XDYwXX06HZ4WyGTzbjkO8vHKuJo0wSwWb?=
 =?us-ascii?Q?0XKKBCZBCl5uoPiXhFfGyo+81MC24169ADpRICl9zPgsmIc4c4MLMR9ILwLM?=
 =?us-ascii?Q?zH4uqJ0I6FiKmPZM/c6MUCq2uv+RKzRP5CqCEHBH064tk18mJPwzvKrBpaOu?=
 =?us-ascii?Q?zbklpxXKwUn6rKZVtJLirse2TSrXx6DsuVsv0w9VN+YqqESK7TdNmgtEwWun?=
 =?us-ascii?Q?QbFbih9KcrmvlurygDwk6Avr2+bJhgtbp6SScfsfLA/DnG4YwylUoKAJbynd?=
 =?us-ascii?Q?ysCRPFgOuRLqqrnVOvmsr+UQWTKY1qWf9tsXLg6an6n98g1iLm8MDwM0Fg87?=
 =?us-ascii?Q?3yx42c3Cqh50QOfa53n5cSbPNp1LpgRJEudeY3J7AoNXw1dp+i2M0nQ16WWk?=
 =?us-ascii?Q?0D0dSSmj2Rg/ka6Nn0cKS5WTAj1OArmERRni2nSzq3DBq123GIKCM7mqC0HC?=
 =?us-ascii?Q?FQCK/jSoe4qfnCs3ohzQSkf9D6tvfMWWLegWSLsM8QbNtvhztgEwiJu4oo8a?=
 =?us-ascii?Q?LqsgMsW286Qxnrk231rfFcz1ya4fVvhCtlR8f1YfZ5Sdh60CHKek8H2cBtPd?=
 =?us-ascii?Q?UDTTix3tJhUYnyVAQ4KD32yoUvfR99OYiWz6vjPnxFL1AeIZT1aUv8dLH57q?=
 =?us-ascii?Q?mlcReRLzRNZVhv2+ba88Rm3mH413EBaiwVo/Rh1DSYKwF00PnVReRfdcQWuB?=
 =?us-ascii?Q?H6Zkj+z28vvlqtB9XwQ0acvRKi7M2YK08jZVtTrfu3wSHqSu40q1DzIeoHbZ?=
 =?us-ascii?Q?u1yu6q0qYE158AAwVvthQ6HZCrgGtnLWFymGZUHDequxHkNY4bnqaLLC/UxO?=
 =?us-ascii?Q?v4psORyQytKC03FRJq0kdEA9YS84kxr+hX7ums5ENMbwut9g4QfaVKubbk6l?=
 =?us-ascii?Q?svXp4kyi4BxOcjp+GYXdxmS+5tKDS0yq03EolzIgRhLIoYYaZzodLLV0iXsl?=
 =?us-ascii?Q?F/qbVqbvy17KhtlESLqo03spNNi/4mket11ioIinl4WUDLc/v8koy0AbXF5C?=
 =?us-ascii?Q?ydZcnKU5KpzaX03PO9AvNShjonnrTKVoH9wnpP6e9Y+eLY7UN1ov/rCO9gP5?=
 =?us-ascii?Q?XCgxefyF0HQlSf2k97/q9a7GBXuYkvsmJNWce4Ok8x4qllj6hLyKgnna8N8P?=
 =?us-ascii?Q?JFvDrfjCRudQZUp+vXa2fRl0RhazJkd2mD55Q0Kyvsf9Fry4T0If1EKEvXPU?=
 =?us-ascii?Q?4sa4v4cD/Qxbp0BIHyBM9NkZzm/SOIzBMb+awl8SoM1BG52n4Zju2+Xud1go?=
 =?us-ascii?Q?feH2+DLmC7oK6avxJiP95vUqebOioxOAVibTrSO+CONU+5Gmre1CVaIIecSG?=
 =?us-ascii?Q?TobQbIWN32UgHkcTJcuZp7QYIoT39KVtLH4takoAfenedToY2g8jPVhclUM4?=
 =?us-ascii?Q?bIIlXp51g8RY83eETZoLS54=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0558b2-8f5e-4759-4e3e-08db4133d939
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 00:11:54.8039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62/iaIvDVFkx5dS3VKJkQu6YWj/0jUxEVG+Apvp6+egajsJLeh7jW6HyrA43EpOwNbUGgPz/HuAVwgMBIV+o4SWCoUeDzTeJwj3s7zWEeQqJVYZp5EY58d6UXdwKWSNv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9276
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Shengjiu
Cc Mark

Thank you for the patch

> This reverts commit 33683cbf49b5412061cb1e4c876063fdef86def4.
> 
> dai_link->platform is needed. The platform component is
> "snd_dmaengine_pcm", which is registered from cpu driver,
> 
> If dai_link->platform is not assigned, then platform
> component will not be probed, then there will be issue:
> 
> aplay: main:831: audio open error: Invalid argument
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

And sorry to my noise patch. I understood the issue.

Can I ask 2 things ?

My original patch removed 3 platforms.
Then, I understood that 2 of them are used as
soc-generic-dmaengine-pcm (= 1st, 3rd platform).

I think we want to have comment here that
why dummy component is needed. Can you agree ?

I wonder how about 2nd platform ? Is it same ?
I'm asking because it doesn't have of_node which other 2 platforms have.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
