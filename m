Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6156975C2D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 11:20:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=BzY/xEMF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6kYs287Fz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 19:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=BzY/xEMF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=corigine.com (client-ip=2a01:111:f400:fe5a::723; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=simon.horman@corigine.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20723.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6kXy0JGKz2yGb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 19:20:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8nz8m4RzIn141E1jaS3oVscW+uUeXNUPw+0lcGBCmC/OQr2IsDm5Vf5ZP8oHnWVCsVx+7QdHUB278BajwQnd4hKTEOcGZfk/hRQnV0hBoASa+hrch4/RXkjL6toJioM18sEsE2hguZ+jTYw1GxVuT8sP//35H+D8dZcRRgVNfq18B6rUpnmzEPTjLXMa19VgoevyHyaCtz5ob3pYqzSHEV4qUiEOihOTSfEI0Z6bKlRJWdVx8KlDO0ze6bK0JDuTN27ltjkcxh3CAxNrsbTgYtuV1zvtXOwTPjKTQZFKr/9V8AymOeZV4iKXCkzgmRfRpkGAki0YLlmyOjiMkxtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnHdnJA4XQaA9IMf1HPhfnDRaO72TfI59C7nqv1tKJQ=;
 b=EZ/fgm/fvLPiXp6mT4+o8TAYgsyoG2jXc5wDqObDzqI8ENIFxpDaWafCsC5zq+Mq/tByMfbWWVlLYkaSKSdahjWZ9+brkX8S0mPOW+1QcCC1J37fsN9q+2NytgpJaBEipMxKynwETtScOltcxmuYhjbt7Pzca2IyWDBiftJG+v/Hx8mklKHxjmcImfWsngJKIiwP7gyRMhJUbSNvKrHt2R9R9Ji7g3oQMFK0XbLLk/pKcMVDerHqoU1kG4Orw07IoZKqnpaf92iVGIYDRCqPrbSi8bH6M8k53O8ytvtXAvP+JUTMqrpPDenUGp1jVpmSm1bFidit8jgh9FTpy0S8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnHdnJA4XQaA9IMf1HPhfnDRaO72TfI59C7nqv1tKJQ=;
 b=BzY/xEMFCuDAKdAEQbDgWecpLkLo30leD41IdYlKPwgmgOsAWEZtHqD6QOMUAUqfIqJq2DvCq5l/XzSIlyv9uyCZAeOzdNAJN4vrMNtlKBHHoDrvpVBrz0a/Je1/Pb/dSdqJvV0OJPZhwKxDaDqAQ+uvs3VHrEaeJkd26/jkA0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CH3PR13MB6337.namprd13.prod.outlook.com (2603:10b6:610:196::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 09:19:41 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.025; Fri, 21 Jul 2023
 09:19:41 +0000
Date: Fri, 21 Jul 2023 10:19:32 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 07/21] ubifs: Migrate to acomp compression API
Message-ID: <ZLpNpLIx5BUW97sr@corigine.com>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-8-ardb@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718125847.3869700-8-ardb@kernel.org>
X-ClientProxiedBy: LO4P123CA0184.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::9) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CH3PR13MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 95dbfdd0-e082-4970-b490-08db89cb9d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hjS921l3Dg331FPXuA5pYBbdj3LpORrd525wbo/IrVUqrBbK1ABYkGZYC1CoEwWW4l8ZgsGmvP3vEhdLgt+bJ2ARzN+RfWBduEfTe7tf2RUFCwncNqugPstIe3yURdB0kVkPISvJoHVvxb4VFyyYf1D9xKNhBns8r84b+I04Tmz4+ICKpfXtRX2fMCtoj7wvCVRh8A0thMGHTODFo2te4gu0LMWSMan9kC6mLKOz7lrX2hb0Y/WMdvezfjCpIRcbfis1AKeK0XXogHR9XewExrTWz3GBco3OGVtLhUu2t74UULhAqgpP/035XaurYm/HBQNRilLlUr+AosmwpYi51yZ9kQ8JTTbd0/I8gIA+9/O6HI8rNjTnyb2bUp3i/vnn6cRzeZvL65wNInluArsvWB77ZuWKpXEMHzcYHY1GVIT+0xmWvxcg80h+b4dBb1b66B4vcVX/zeMmu+WQkXELC0wagOhLRvJ6Fk5FgntxPYX4Q4754eygHCv+8oBqZCzzcHZ3P/PPCZcvx/Nv/NeqOVP+/UNGtzfc7kSepQJCR9+S2h3oJI2yN8GdmhXHbWkaTCsmYvKf/rAlh9CEy/lj6pYskZJqmgcmesJj07sobGY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(451199021)(36756003)(54906003)(478600001)(66946007)(66476007)(86362001)(66556008)(26005)(4326008)(6916009)(6506007)(55236004)(6486002)(6666004)(6512007)(8676002)(8936002)(44832011)(5660300002)(2906002)(41300700001)(7416002)(316002)(38100700002)(186003)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?JkHHdRGilrrfvnSV4ip+Xe0QbwgIDIA+BvsesGFcix9jczbiQMVuYNdL1Ar5?=
 =?us-ascii?Q?1Io+BTvwVSi2u/JIcCR95J1OFs3X7knzJtn1qrEEhERojl7ne2ED7ELJ6daF?=
 =?us-ascii?Q?nNv6CgF/ipeCcqytIfoQ3H36g0fi1/l5G472mGkE6WIAA57IpFkK3S19RokT?=
 =?us-ascii?Q?8NUXVlG8LhZvStZrW8i84zj0XDD2dNYxbrX7eAmj0nJqabtLlEPBe2coqriN?=
 =?us-ascii?Q?Oa5ThNgHjcBvDeml5ebqKgmkfmpBFU1lK6vXGIH0d15FDnKxIi8cQXR05bkY?=
 =?us-ascii?Q?FlNyc06D0ZG+b1YedelMWCG4lA0XWKmUPqyxoefLmjXeAFVo3U0PzPVE7PJs?=
 =?us-ascii?Q?Fko/N4b2Qz+K487i0Becl99RXEYOFkLeZ3C7Q632RZYMFNcT0P64+EHeTrAh?=
 =?us-ascii?Q?auAFq7nl6U29n95csMGjbaUnkHz5ZNUmcAR0/4rIIQYJSfDpm+3JuzLL5Mpn?=
 =?us-ascii?Q?Ol/GXJIl5HbVFd1Htmf/5oW1QbjYn9yznaL2jcf8+bEds+w8FciayRnf1Wza?=
 =?us-ascii?Q?2Szo0qDYNUdQMY2wy/FCdHtD8H6PLq5nOL3DIE/YZH43ozxdi+8PqDNK+Q7f?=
 =?us-ascii?Q?YAB7Vdl2FMB0BK/deg0w0jN0T5izEef/w9p7e8fEIuu3Ly9+KkCXYW9bl1fF?=
 =?us-ascii?Q?hUXhjrpIKm3D4jkCVfX4iZoIIbMrdVn+au8DzKhYi0Qz/eVKeluhB/6WnmPQ?=
 =?us-ascii?Q?W9NCk0gVwCM70babUjZJQhE3WU05Gbij78L1sYiurtwKMjo+F/CVMK6gY9Ac?=
 =?us-ascii?Q?1d1x4BTa+UyDJq7rd584KYWPyjrCMgrUGXgOoCGh8oQYHOH5WS1YYmres7/A?=
 =?us-ascii?Q?GlJEyJWFCXq3IZ72krkloj/lD8DhTwggrTf5DfGLsqVcpwPnUTidmOaGDO9K?=
 =?us-ascii?Q?RgYOiGnQIn/ovCCHp+kz4qEOSOQQxIuDhwlcVOsHGbPEzS8DCQid4gZUREen?=
 =?us-ascii?Q?bQp5CYmWuUdEpo8bi3CDoTJj26CV52LzwccGkuCfrmW0xlelvRf1dZyQvs2N?=
 =?us-ascii?Q?QYal3IT5Z8fILmPpI6XLve6QujR5IExClKYZ1Z1rMkLyvO7QJv7Fpy6t7zno?=
 =?us-ascii?Q?VrY+eudOeckRCtUezdPF3Zz1gPZ274udurhaCx7sx7Ph6ERHEzVDLpC3oNGE?=
 =?us-ascii?Q?5FSV7Vzzn69WbtytCjCeqhu0DduIsZFfw5Ym7W+oVZuarjV7EncI1/iAYjh1?=
 =?us-ascii?Q?W4K6NwdP0CYrItIOL8So4S5eSQxR3ZXmhAXDeEVGAWKMDG0CPmpS/M+X6PKN?=
 =?us-ascii?Q?Ur9zVMlO1z9t+SZxAUmZ7reKutN5jkJ/Mn4d47oo2RFRlDGeg7koAEm5tOCO?=
 =?us-ascii?Q?MipYAs8jxvoif+UPWAfb5jG5wfa9UQTyzoBC+hmAxJqkxsHMjsAPrKaVQH5p?=
 =?us-ascii?Q?xhMQ/JD90873apxeh+Urb4JpgW1PmZy9wslWQYLPpHWJbzB6kgZrbpTFLne5?=
 =?us-ascii?Q?tlOc75BZnz/fwmrschUN1d8HPTs3+zhyIZEOjvQW7aVYbhZHwU9KiEZG8FQf?=
 =?us-ascii?Q?qb85MKER+nuyLQMsoXryqLqGFs+jUp+dGR0dJD11VzA5NCFB+SZxFJeVKOON?=
 =?us-ascii?Q?8mWXSgJz3Ca7F1oNWfyHWoQT0SoP3lh18TQkJSS+E1ZWqCDqW5CM44F2ywxC?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dbfdd0-e082-4970-b490-08db89cb9d0e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 09:19:41.2973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTFAcLu2R1HiYxA8wGM8vAAv3d8qKyECBLxxWCMwbrbcSehwkWF5gIa+HtQmm0/X4yUgy/9D5zuRmAPu9kFR3FsXCRYNYPjWVr0EUJ0AaP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR13MB6337
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

On Tue, Jul 18, 2023 at 02:58:33PM +0200, Ard Biesheuvel wrote:
> UBIFS is one of the remaining users of the obsolete 'comp' compression
> API exposed by the crypto subsystem. Given that it operates strictly on
> contiguous buffers that are either entirely in lowmem or covered by a
> single page, the conversion to the acomp API is quite straight-forward.
> 
> Only synchronous acomp implementations are considered at the moment, and
> whether or not a future conversion to permit asynchronous ones too will
> be worth the effort remains to be seen.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

...

> @@ -197,11 +205,24 @@ int ubifs_decompress(const struct ubifs_info *c, const void *in_buf,
>  static int __init compr_init(struct ubifs_compressor *compr)
>  {
>  	if (compr->capi_name) {
> -		compr->cc = crypto_alloc_comp(compr->capi_name, 0, 0);
> +		long ret;
> +
> +		compr->cc = crypto_alloc_acomp(compr->capi_name, 0,
> +					       CRYPTO_ALG_ASYNC);
>  		if (IS_ERR(compr->cc)) {
> +			ret = PTR_ERR(compr->cc);
> +		} else {
> +			compr->req = acomp_request_alloc(compr->cc);
> +			if (!compr->req) {
> +				crypto_free_acomp(compr->cc);
> +				ret = -ENOMEM;
> +			}
> +		}

Hi Ard,

clang-16 W=1 and Smatch flag that ret may not always be initialised here.

> +
> +		if (ret) {
>  			pr_err("UBIFS error (pid %d): cannot initialize compressor %s, error %ld",
> -			       current->pid, compr->name, PTR_ERR(compr->cc));
> -			return PTR_ERR(compr->cc);
> +			       current->pid, compr->name, ret);
> +			return ret;
>  		}
>  	}
>  

...

> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 4c36044140e7eba9..2225de5b8ef50f71 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -32,6 +32,7 @@
>  #include <crypto/hash_info.h>
>  #include <crypto/hash.h>
>  #include <crypto/algapi.h>
> +#include <crypto/acompress.h>
>  
>  #include <linux/fscrypt.h>
>  
> @@ -849,7 +850,8 @@ struct ubifs_node_range {
>   */
>  struct ubifs_compressor {
>  	int compr_type;
> -	struct crypto_comp *cc;
> +	struct crypto_acomp *cc;
> +	struct acomp_req *req;

Please consider adding @req to the kernel doc for this structure.

>  	struct mutex *comp_mutex;
>  	struct mutex *decomp_mutex;
>  	const char *name;

...
