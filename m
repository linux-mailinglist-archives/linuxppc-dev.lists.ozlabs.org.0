Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC85975C5AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 13:13:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=HyCkI/N0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6n3x5BVBz3cH4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 21:13:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=HyCkI/N0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=corigine.com (client-ip=2a01:111:f400:7e89::703; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=simon.horman@corigine.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20703.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6n310MWpz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 21:12:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vw3NxsF5HGKV2GzX/AocCa/XSqphyWo5TcanE00r5HPPaogKX1qyTN2IBIlvLmOpp+2BSJkKR74QlHqhcX+4ZQW96b9IMY+5G/qs8FYXnV7B70q7jicpoGz/ItxSi4Lnw34EACQpT9ZAP2vlAE8EwzSLqEvJQ+ZspzIoxb81fX6K8+Sp37VIeRamHKoy2jgwv7MsfaWBNFNHK0UMZLt+ndeWjeOUAXBvaesGuFhLUrTHIY2vZEvxoywJz8xuRJaepj6JKeA+g1Lm890lZvzY4QlA4K8t6W580n/iJH1xP3hgEwNCpgHpU93GqudRY0sd/vYWG7Z9x+6kqmChjx9W2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cU+2/tQw7Lgh6LFY9WNYtssKwkh3+tiSMLjYY6jtsp0=;
 b=mGikOmMCPNFoXaDof8b3g8hAG0lLiqidvk2BJ+UpfTZV+vzSx+3vfcRe5pWSBzXrN7MH4buLx9lGPyg7H1d5Sl/K2nYC5Vo3/MJLCN4e0560OTj4UfjpF7vxGnqRnj5PKUFIzR1INch6lW5deGaJlSUpqZ/1RQ666VqRAFIRviBxeSi+sXLIOqegE0otqn/EOnDCIpKfMY6POqLovgRaggIHwO7VX+25Y9l6+zTzkg7J/DSSg2EicRI29z6Zp+mGMmTI15U0vtfyv0br5dOY4IjyQIK33qYepUZ/JsbYO12ETHNRuxbeL/xsfKfn/Lu7OZJUm3GEbkrVBzE97cfnrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU+2/tQw7Lgh6LFY9WNYtssKwkh3+tiSMLjYY6jtsp0=;
 b=HyCkI/N05IVjf9AB04h3KQUvqk2swjnAbrQbsXIkOz8/sdCrt8qf00Lii++ryEKHjM+bh3HssrapuRbkuIyq+zBspAwH1jc3e6cWcKDJomtp4zgwavetScvLdhjsHzVm6iBSij5Rvb1+2b2a/UeqxCy96JhgVbItUyRor1Z+dvc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by PH0PR13MB6088.namprd13.prod.outlook.com (2603:10b6:510:29f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Fri, 21 Jul
 2023 11:12:25 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.025; Fri, 21 Jul 2023
 11:12:25 +0000
Date: Fri, 21 Jul 2023 12:12:14 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 20/21] crypto: deflate - implement acomp API directly
Message-ID: <ZLpoDumeF/+xax/V@corigine.com>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-21-ardb@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718125847.3869700-21-ardb@kernel.org>
X-ClientProxiedBy: LO4P302CA0028.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::19) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|PH0PR13MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6e738d-88d9-4240-6bd8-08db89db5c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6aGlMDWHu1SSuy0gL9m6T5zdfAhwOKjzCgWHjjrIh2dL7Ez0LdpeK2tDQ8JZerRBxcFZoFCu29KUOgarPabaiiAQKB1PlHDBUi9+XosnZD9u/3k3xK2nRIhXjMMOlZBngLCxBJ8myxfSYlfwSwHC+8G14293oTBqsDvHc/5xwz2Myr8ef7Oe7joLLdEP8+JSudeqX8oXt0fmJArOLc+bISGwDKMPL8bdlkhqyxfe+RvyWisEUD6sZVZTl0yjzBv4dEbs9W+gPHW3VUbJElf8enQM2whrc85rXrFtSpqLF8xNEXL9F5e1fYfhmdeuKdaMKeE1M4Kh/PzJdPxajZKDloOEPDScnMYRNGXXEQu/WAaHqr2G5awVlK9SBBoX0NqpupOZg14IKogetFk6yc488MNWVW3T+XM6pJGChJnRTiCIVuc4Y1SmKjtCmLEmdwyQkfte01vOuxdAIyDzNRxzDsffufZNT2bz2ZdOPT9WXw/uh9sPG6Ig259sp6tLjTbuhjoHR/8+jCQGisI4w5RQPIqytx4l/5FJ+mvAnLZKuFolHgB52l7wlFx+VMWuBn16mMBG4lUkSGdnehXDdbLW7LMfYzSah8kpSl0W4KKo3uM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(396003)(376002)(346002)(136003)(366004)(451199021)(54906003)(186003)(478600001)(6486002)(6666004)(6506007)(36756003)(55236004)(6512007)(2906002)(316002)(26005)(66556008)(4326008)(6916009)(44832011)(66946007)(5660300002)(7416002)(8936002)(8676002)(66476007)(38100700002)(41300700001)(86362001)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?wDkeWT1ukwHyxMwHgDU2PP/nJs61udZBcUW2sQAjuZ9fZLekq03Y+QKM5Qrd?=
 =?us-ascii?Q?hSBe5TwxllaGwyWfFA3XJ7gZml4/+ffXZmXGseCgK+tShcWhPaEa9pYtY0Nx?=
 =?us-ascii?Q?dpWPHfKoBARkf+AZ0+qALjPVjLy4KCYS1GxrZkVCgXNM+Izlg5D4x8AGuAfh?=
 =?us-ascii?Q?ppoJN8KakPT2bnd0oe8xxXD8O1kuvpCZw8CapYFCcJqoz5DKM3e5U6kLYa3w?=
 =?us-ascii?Q?jzgI3tgEggsAfWuoIWkV89Swd/aCaKwdWHzFFnwwztOiBT7rQRb70xz3b9OJ?=
 =?us-ascii?Q?XrXwwuoz1AA6yaYxioiv/XB0g5WDqSJ2HuJjdajq1r2zA/ZcswbnBfdkWDo9?=
 =?us-ascii?Q?u3B6pitU7efiuK1/+MbinQRBZBKpAHYEkaFIgoChpqDQgG/lBkONvUspTSCc?=
 =?us-ascii?Q?ytLXfmi1Z5Qs64QgxbzRdHHRpVTc/sNcYupKxaxg6nKs6xYrSliuPwjvyWv7?=
 =?us-ascii?Q?a5QcNTxGcQhZz2A9HKFm4Cuz4aRASVmVZr23VJq/a/Tvxx63KUcz2MU1Mygs?=
 =?us-ascii?Q?gE++gGO8QgqWDINd24wvEwSF6ZwmLWyih8TxyLtje0TCgeeDWy4GAR+ILajw?=
 =?us-ascii?Q?6W30SuLEFKIGhUnKENt37XZugz/65CPBHrp400LGK5ERuuqgZ/VF/ao7RFJg?=
 =?us-ascii?Q?UmO9p0NqXnufK1HgSoH+aQIOobmUXYrvFTPmZHBdiSKQDR+Z+MFLFBFVOqbU?=
 =?us-ascii?Q?QOx8N2B/z2ffHI53ptH6s9JK8xeJaTvoV0g4KYzp7O8F2xiqZOclbFOsWKC9?=
 =?us-ascii?Q?0Z1zmDSHdYW0zDSjaH2JzTHsZwy+laPFcK+NQ0j4n+XRtsoCz75720B8XkMa?=
 =?us-ascii?Q?KRxEOXzlvDeNN8JSnjRDSjC8xPd6G+lIQ4tEgYrUj0spMWIzOjG8yavT3ODP?=
 =?us-ascii?Q?Ecz69a8g0Sjuyr0G4pauDl+ZAiz8ckte+6VLzlKDuNfuHAX1ry5vlq0ije2r?=
 =?us-ascii?Q?Kb5dzJwC9xWrHVh0DR3NZy702Bk57XlQx5Deh0HQNxaI3xv6QH8ubUp6K/tW?=
 =?us-ascii?Q?clxv/t57wIyKO0oqVOQaj4sEtBfOvOlA+92J9kcT93/aA57ITJvHunAuBLfX?=
 =?us-ascii?Q?w6QDUzmynAFOMK8bE+2R+pD86YOmrDYIWSXyk5lW6KR4JQAzmzDlNrPDFHRJ?=
 =?us-ascii?Q?wdrS+NsbrmmLdH4WtS0La911VUzcENWaWOHZj+XlernDUZ/GUUJH3828rTGy?=
 =?us-ascii?Q?ojDcbXk5S9NVuj64zYcDbQrbGwQXAZpYxVV+o5M/DPIRrLEiARkZzGVryWpx?=
 =?us-ascii?Q?QMO2KfR2LTiHUhrPeOiRpgb+Iai+tAr3DiLdn5L+J9JDGQs3FYp6K41OV7OQ?=
 =?us-ascii?Q?d4c8t6w4Z+BfUO8c4hSaJTpo/tQjiBh/G6bCPVSyG/11ynoNbM85pyLOItiK?=
 =?us-ascii?Q?bFDEGLPcTJI36p8GtNQy9hqn75ekFA7KsHvMEiQxZIAf5XoK6I0xFaT4Ul4w?=
 =?us-ascii?Q?xWcAcUvv7iMY+6W9WvFNQt70/QQKxxztIexqZAaRq8D7HMs6+Q1lVHCIHRym?=
 =?us-ascii?Q?vSaCH1a7Lz7IG3FG2G0YzOU5b7xbKUqONL+xvE3aLc3nQEQixsVnddbBxDy7?=
 =?us-ascii?Q?Nl6nScUqRgR31k25aOP+EL3McEekuN7Edcvz1s6/CdqFc8lEY7C1BoaVR+38?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6e738d-88d9-4240-6bd8-08db89db5c7f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 11:12:24.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOFpdaL3NGUHyu26AFk/VqYr8arQ8H1RURAxHv6E5n/wrfFHrcvmpMpHzMWMwF38LIaEmSR32My8w6hvQ5AD+eQV68hDM/oPkyZSFBJ//7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR13MB6088
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

On Tue, Jul 18, 2023 at 02:58:46PM +0200, Ard Biesheuvel wrote:

...

> -static int deflate_comp_init(struct deflate_ctx *ctx)
> +static int deflate_process(struct acomp_req *req, struct z_stream_s *stream,
> +			   int (*process)(struct z_stream_s *, int))
>  {
> -	int ret = 0;
> -	struct z_stream_s *stream = &ctx->comp_stream;
> +	unsigned int slen = req->slen;
> +	unsigned int dlen = req->dlen;
> +	struct scatter_walk src, dst;
> +	unsigned int scur, dcur;
> +	int ret;
>  
> -	stream->workspace = vzalloc(zlib_deflate_workspacesize(
> -				-DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL));
> -	if (!stream->workspace) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> +	stream->avail_in = stream->avail_out = 0;
> +
> +	scatterwalk_start(&src, req->src);
> +	scatterwalk_start(&dst, req->dst);
> +
> +	scur = dcur = 0;
> +
> +	do {
> +		if (stream->avail_in == 0) {
> +			if (scur) {
> +				slen -= scur;
> +
> +				scatterwalk_unmap(stream->next_in - scur);
> +				scatterwalk_advance(&src, scur);
> +				scatterwalk_done(&src, 0, slen);
> +			}
> +
> +			scur = scatterwalk_clamp(&src, slen);
> +			if (scur) {
> +				stream->next_in = scatterwalk_map(&src);
> +				stream->avail_in = scur;
> +			}
> +		}
> +
> +		if (stream->avail_out == 0) {
> +			if (dcur) {
> +				dlen -= dcur;
> +
> +				scatterwalk_unmap(stream->next_out - dcur);
> +				scatterwalk_advance(&dst, dcur);
> +				scatterwalk_done(&dst, 1, dlen);
> +			}
> +
> +			dcur = scatterwalk_clamp(&dst, dlen);
> +			if (!dcur)
> +				break;

Hi Ard,

I'm unsure if this can happen. But if this break occurs in the first
iteration of this do loop, then ret will be used uninitialised below.

Smatch noticed this.

> +
> +			stream->next_out = scatterwalk_map(&dst);
> +			stream->avail_out = dcur;
> +		}
> +
> +		ret = process(stream, (slen == scur) ? Z_FINISH : Z_SYNC_FLUSH);
> +	} while (ret == Z_OK);
> +
> +	if (scur)
> +		scatterwalk_unmap(stream->next_in - scur);
> +	if (dcur)
> +		scatterwalk_unmap(stream->next_out - dcur);
> +
> +	if (ret != Z_STREAM_END)
> +		return -EINVAL;
> +
> +	req->dlen = stream->total_out;
> +	return 0;
> +}

...
