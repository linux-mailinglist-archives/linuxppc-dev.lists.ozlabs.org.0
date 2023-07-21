Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AA675C57C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 13:09:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=sLhWtTNn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6myv38jsz3cKK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 21:09:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=sLhWtTNn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=corigine.com (client-ip=2a01:111:f400:7eab::70f; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=simon.horman@corigine.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2070f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6mxz3CgNz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 21:08:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhbV+DNu0Jr4p3Umg+Ta7AEwjSZjm6lXbzPmiVfKOy6i6wK8z0QV0FeeKK/1mA6IyqbePXWlLRg3+BqL+Nwvr0tRYIONm1WvywbB/lKbFgJxi8dswVUX3zBoDlbBmN1RAn+hjIxZ9q2LvscT2td4JDi3tTOpZiyARd/LNYvvcbA4FflXemLE0ZpnbzRMSlZp8oiFEw8Lz7v4XCsOUVEULRnEmAW1QVPa+rVZeY4z1xGG3M5dwVlXxTqb8WXhR6Ew/MlI1SOoBPOVzxFI5EeFBc8XJsbKqUSWN817j9Cl9v8IIXiGS3jUXLAQ3SE7U81Yu/XB1D94HY4xunXfzACt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6betak6CqJ7siQQ0bzq4F+rFMVsodn40Hxgd8rzwu0=;
 b=TObkFa/ZkJUfbe5wAc+YAMHktIcq0WsIIsu92VeIxVGAqW6VMWmcq4030sigo3JUQBfFQjeUqu5Bv3W33QSIlv9R9SPY8qNy5c2p2bmottVyiU06u1ZtUPjDusA1IPyjBYFvYDMGlnc4ocygPgJrt6p9Gz4ESR4AxWXjj1aiZXWt6pk7MwON/CDk14LwLoUJXzWLDCJQRrZDIRZsxsoTJLjgYwlWsHFZZ4sEgPW1iClG0tVjyuZRJbKtrvUH71PU7nYhN6BbexshI24ydBNG4HluAPzfiYn5pOpqbF8L5+JUAigJyGVek42UsJ9kYHe74TyoUcT5MklHT091oLMCSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6betak6CqJ7siQQ0bzq4F+rFMVsodn40Hxgd8rzwu0=;
 b=sLhWtTNnmDT8kJVp3mqWlHGYxQnqthyQOcEnw8ADdCvgQuQpVXw8mwLZtBSG3GGDZoQPY42kjAtR5xrrr/Je3BqQQ9OpPROejWzpQEJ1thOO7NplAB9Wc2jBreXJg+jzRJQRH5sM2nlHf/ycJMvKyo4yAiZAejVHd3nYjqjQxZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by DM6PR13MB4496.namprd13.prod.outlook.com (2603:10b6:5:1be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 11:07:59 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.025; Fri, 21 Jul 2023
 11:07:58 +0000
Date: Fri, 21 Jul 2023 12:07:48 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 19/21] crypto: remove obsolete 'comp' compression API
Message-ID: <ZLpnBN5zMuWlGFoh@corigine.com>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-20-ardb@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718125847.3869700-20-ardb@kernel.org>
X-ClientProxiedBy: LNXP123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::31) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|DM6PR13MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 772f0c19-7c49-479c-13c7-08db89dabde0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RQbvOMkRd51CPUzl588h4gbjaiaR3RU7YQGabIkXwNEr7MMnoe5iwgFbfZBa+JgazAI8YM/ghzwOJS5L4BKZgVbioS0+Z2UolHRVx7jJhY2j/dDNk3+1UNfYG7GrzZG0rG1s+yD/IEXhEuKzqxSwrFt1YFU4VERqbOiQjc8nFR4jHNklb2EotznO4dzL4DOh6xa9HWShJX8RE78C1qR0SLKP3LUQ49DsKTCCynEwbLWbmnzl+7QU67bOowjWeeDbBwT2Md4zpsj4ojwTyJD74LQlk1rNlWbA+mib3ib6WzdWoa/0nGTcslJQKL0aIlnmS2bPMb6ktp/nxg/lZa6E6RZ1T39lR61txOWrmRuf7jo01nBmPeqeMsd3ndFSRlfzXpYsm651fn31QFYT2pLPgzm6C+bkFMJJ5MzHhhfOeDn7iTbx5+lz/Z3GM1fW/wa0BM6277eUHImEKR5MhhNOEqYsHX1H8Xjypzh++fg5eQbO51QefTMG7oKrvm2ouGJNCemkxUkXK1bzjeQpOAO4F+Iw1Y+oiNNyewOTjuDYF/7+zeudJSYz7a0Lk388szDiXpmqlD0lmrLgwY6QziTMGfHcvFMwGVA8mE1Ve84RtgE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(39840400004)(396003)(451199021)(6512007)(6666004)(6916009)(66946007)(66476007)(66556008)(36756003)(6486002)(2906002)(4326008)(316002)(478600001)(54906003)(86362001)(6506007)(55236004)(83380400001)(2616005)(186003)(38100700002)(5660300002)(4744005)(8676002)(8936002)(41300700001)(26005)(7416002)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?KID24e69QFUyrZSpFz2oLXssfr9pGxI1fxYj5o4aNs4Dm7q+oSCXEY+eXWly?=
 =?us-ascii?Q?v5MPrf09l8EUZimCXKv3Cda3Xo3WoM1atSaaGeCfXMr5KacoElo/yvDHdj3Z?=
 =?us-ascii?Q?9e3Qxb0qR/b5oRkppaDUlRYL7TuWvjUviEUgrzmmR0Yyek7zmQTGl85ZthYd?=
 =?us-ascii?Q?qNebq518o56+LQ4KMJu1ek9YZ1rUI4j9+CKWKlMZSB9LNFX/KGaDae6Fr/pr?=
 =?us-ascii?Q?qBZcZX6q85+SKWg6UfoFdPgIRB1uVZElfxylPsDmTyyYKulLamR1lSx6pSoi?=
 =?us-ascii?Q?xBxRVPuAmrBSlPhO2rxNKVIfqlO90jMc2kilLR3/GCDArJaXojRL/r5wPt2J?=
 =?us-ascii?Q?rI9AF/hfgIRQrBAnVeAZktgBxgTrTMR+EtH/3KG0/GNNEfxraE5hFeM3FulT?=
 =?us-ascii?Q?u+wzc0UU3+aZYrYL4xQH3A2gbCAnOayQc6hw7VszQJxcbvyGZnfLZwzXdB/Y?=
 =?us-ascii?Q?NIa3JtoZcbwWraAZpe8Vkt6HJwFsYwKHX7teM51cV1CiVwOI47+c0Gqm6tv4?=
 =?us-ascii?Q?JFldYmQm0c52/x/M/Jm9X4B8TUePToZL48+et1fcSRr70/HqIJJaHikDHFrP?=
 =?us-ascii?Q?098k8pwyKXQkKVE8XBaALzJlVFtTo8k2bOdq0dhT1S/yoCY68qJlIeDyG1/H?=
 =?us-ascii?Q?rXo+MxhyQEoR9iNxHmaVwfRe/mBzss/Cs4PQEPl+PChlQtwFeRgOzVajagNS?=
 =?us-ascii?Q?g7d1AUEGEIf/L4oajkGmgfMUcQSFLE6kMaMwR0ixseQc8LPC2Rj+psdQn42T?=
 =?us-ascii?Q?IVq7P3hnqo8rCIcu6lC36/480D237O5hoserYt8MRwmRxO/vJgDtJ4/Rd5Ss?=
 =?us-ascii?Q?nYGysd5aT6ozr/1fKK24RzIj7Gp9Ae0lZBOsVCqsOYDrZx+AtdtAQl+J3eqI?=
 =?us-ascii?Q?BLxITQHILs3W/MjJsUC1J75p4Dm9TVAXk6Wd8J6ghbqHFJoXrqzY21TYATgv?=
 =?us-ascii?Q?YToqQpRU1qvZg9IHflrtqOuSl0lx+esCwgA6Tvmz8CgzMgGD0bQhIPeSxCth?=
 =?us-ascii?Q?jQutke6X+DcVgx6dRzPHsDzRioE7to28knCmptSspnEsu0vNQF2WXpuPwpfj?=
 =?us-ascii?Q?ssAVe9PtLyM9hGF4w9lNU8DklRt2KWzBhBAUBiNYMJZuAJ6OHYubbIwMl+rS?=
 =?us-ascii?Q?zzEYlbumu+x4xA7Ur8qoUDO1uMoZxSD7NzWXkXM7OeriHu928Kj13y9Dpbj0?=
 =?us-ascii?Q?6U2on4umWSLpPeAdcK3vcSQz9V436V1rqBEAapJakJWIPDVX2yIAfhfxA7SI?=
 =?us-ascii?Q?LXdObFadaqUjEfFnHb4NC0FlSP+dcU8GgOmwkt4C82x0ZtYRdRZBJjHFAqYz?=
 =?us-ascii?Q?MMnDxbbGbTgvZlajgAUoriyhASwn0J2xIs0A83ZpsqrzvcSnp5Vv7RatNpuk?=
 =?us-ascii?Q?tGjyfKM7YFdeG/+lzGllHslZ5Xo01txsehxDTdVlNcm1G7C7DIKPPNvrhhmL?=
 =?us-ascii?Q?sogiHQiECTDbbtS6PXc152HHBWnjx+fDgd1Xa7I3aaZ0V6eKIDMJrszCP/uF?=
 =?us-ascii?Q?G0c0t95Id5WVeD9YgizNenV05meCqkXCZUwC3ce2MwX9GbDExO1QVDbzUOr0?=
 =?us-ascii?Q?tu+CxewWpZhgI8kLPxO/uqUXvExA791/psw8icYvPqC4NP6FsdRmJuhKlSGW?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772f0c19-7c49-479c-13c7-08db89dabde0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 11:07:58.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXn6gPzFCOz/xCquHmtPgzwJYSKdSzz643PC0KMZVR5fKjUPFKvbxhkduRG4+BnnQUvKCowlhjHiwXusHDMrgvSmYOAf8o478bXv7FcIITc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4496
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>, qat-linux@intel.com, Eric Biggers <ebiggers@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <keescook@chromium.org>, linux-block@vger.kernel.org, Nick Terrell <terrelln@fb.com>, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 02:58:45PM +0200, Ard Biesheuvel wrote:

...

> diff --git a/crypto/crypto_user_stat.c b/crypto/crypto_user_stat.c
> index d4f3d39b51376973..d3133eda2f528d17 100644
> --- a/crypto/crypto_user_stat.c
> +++ b/crypto/crypto_user_stat.c
> @@ -86,10 +86,6 @@ static int crypto_reportstat_one(struct crypto_alg *alg,
>  		if (crypto_report_cipher(skb, alg))
>  			goto nla_put_failure;
>  		break;
> -	case CRYPTO_ALG_TYPE_COMPRESS:
> -		if (crypto_report_comp(skb, alg))
> -			goto nla_put_failure;
> -		break;

Hi Ard,

It seems that there is an implementation of crypto_report_comp() in this file
which is now unused and can be removed.

>  	default:
>  		pr_err("ERROR: Unhandled alg %d in %s\n",
>  		       alg->cra_flags & (CRYPTO_ALG_TYPE_MASK | CRYPTO_ALG_LARVAL),

...
