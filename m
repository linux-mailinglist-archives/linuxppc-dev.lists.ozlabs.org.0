Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3232575C2B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 11:13:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=gNsayK3s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6kPB12L6z3cZT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 19:13:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=gNsayK3s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=corigine.com (client-ip=2a01:111:f400:7eaa::71c; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=simon.horman@corigine.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6kM65t60z3dMN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 19:11:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLgPhihFb46UTnX6umWxqdBwKK2wZ10U72XwVCl8kZfOEulzo/GMtfA0JVvm9XqAyp944opOsaqpa+P2vDHOBNMPZ0HMM8CY+1I1yn1CJ+d9JlvPG6vOMskymIfmyUDylSlpCbwW1FiRWSYYDiJUx5TjmQ4NZEZhVIGAuRIYJSyxSCUaijyQDpfN3uzrXTWyGcBkAQjOzY5nuIcbI8l0kxlMdLQrTfx169cIrK2/q7xUR26gPngU16UZie+rk2XqMulWz1cuJRiMYECDrg5uUmgizqootrjGT9z4Kb/gizyWmH86SC9S9GmGSJ0Zg2xyeNtkkaOkFWsPAzrh7LKV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPeo7niqCvYYeGv0178HaOPaMz1/1PEUYlcsPVgF++c=;
 b=UvjVvyM5sm9YV+Iy3BOu3gAAf/rJmw4UAvSQXe/3ww8unlKGOtxG/lNQgNgmeaf+MGWmd1opD0CcFOSZLN6ZlueHWJvfOBLI5gkl41GPTko92bP02Poz55/dbwKU/o0tumTzctokhugitLx4juMsC1rBn4hWa3xoW9YJ9qL0ZdL1N6w8Tcd3NkeYX9hCcNEByAJVtp6ezAtkRledyr2NHZi9cp3hgKJkRc7AfiwykqlgsrlCxQ0RUPqTbPDnu5/kQTKGRjehIWLbVn0dizSEREzODJtpQxXPYMdT0kSs3uuZYikZz1xtB6ROA1g8w10MZB3id3ah4+87eUASbYkVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPeo7niqCvYYeGv0178HaOPaMz1/1PEUYlcsPVgF++c=;
 b=gNsayK3sE4KdvyXAsPVAFwnK6oRMZkPCKCEIgSMdtgNx3wc39Bf2cE6M/NFPOp6tgPvPyU8foNH7+WiazjeintsePpXOCNSLYPSNQhqmHhuPa3OiKGWeyJ9I/bcxM+lmsu3323pZ4IsG8J+aFmeHiKQKb9WzWup6MhHofQFQ50I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by BY5PR13MB4437.namprd13.prod.outlook.com (2603:10b6:a03:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 09:11:05 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.025; Fri, 21 Jul 2023
 09:11:04 +0000
Date: Fri, 21 Jul 2023 10:10:55 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 01/21] crypto: scomp - Revert "add support for
 deflate rfc1950 (zlib)"
Message-ID: <ZLpLnx4vtdYPuxrH@corigine.com>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-2-ardb@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718125847.3869700-2-ardb@kernel.org>
X-ClientProxiedBy: LO4P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::19) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|BY5PR13MB4437:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ced8cd5-32b5-449a-331e-08db89ca6935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YAp4qMA+UIP2w/m7e+mdHyuO/BVVQlw1C+f5fXu48cOhszkfLSbfis5mmoYXlqr6Wc36oRdrnVD7/nhvssRahPt2Iueuwu7aoA/NjJQ5eCz+K8N5NH8n4kGWyobKnhwwCtje3j1vXS4YdkHF79/PG8XZ2+Lk/31IkGajkaufd10vYtS9k3vYxvRuokS+ZGWR1YItPSpcyCAemnL3GiIKqzjbSIzMnsf8wlLsuECsaR+uAZkorgCnUjg8X0M1k6vUCT1EE2OBvjR8ebbWVZTdGXW7RZ8GgS8fJJ4M3fZpG+PqbrfEoCnaRKj+ZScpasuqaAUtoqJ56gPPScjdNo/ybr5At6iHv+0fQr26+pQNKh3kYdoG5yD2djm2aRPlXy7fim8f5zbdRfKTTtEp1tbaNh/ZWD9IzadAN837/Dm/Amb8Y/ht/64LUV4h8qY5c3G1m7QcjeQiabbmuOd0ZMJiUwAaMwJIbpW5mpgO+UblZICnJPqMv9eeMPrx2BiQtoZlLg21DmgEk/CBGlOvwx0i8/SYv9dCjaWx7gEtSolA6EftDUjrdlI3CaLGXaZusbSWc0XQzQH914qDQHB31Ti6O5rwCZKGrj1BfNtyNP0kP8o=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(346002)(39830400003)(376002)(451199021)(86362001)(36756003)(6666004)(478600001)(66556008)(66476007)(54906003)(6916009)(26005)(55236004)(4326008)(6506007)(6486002)(66946007)(6512007)(2906002)(44832011)(41300700001)(316002)(5660300002)(8676002)(7416002)(38100700002)(2616005)(186003)(83380400001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?zQblw/bQw51fmROv7tDJNln+3IUqWID30UIPh+Ztoec+383ff4xzezVDRE5u?=
 =?us-ascii?Q?iVwS1jLyw08fM+x7Xjm2LnwawLDjOAUm2WLr8FBubO0ynQc0pE7fJAv1PSUI?=
 =?us-ascii?Q?nxsmMljyuxP2fQ0b0fagnX7r/VMipPcrY1Q0nnLao5fjLX/E4TJ3n6b+DMUv?=
 =?us-ascii?Q?PsYpRaNzUTFA6Amtu0WGdbYWKLONkJQTD/zPI+1rEYHLnHgyrwNebAJHsFbC?=
 =?us-ascii?Q?qqQwoBreWvFvBLSYCMb7m5kRLkmRgNafL47u1vsmSbUfMufNieezegvZhCOv?=
 =?us-ascii?Q?jL9LKklJzblgSoKZHkw9e4jrLxslPb+dQqdOABTnZTFsU40LRifmFB5X9HH0?=
 =?us-ascii?Q?QoICcVhrP++mWAnAHkhsqVuAwL9uh8fcCrN3p5df3rJZ+wqzW1XDb5znFlWM?=
 =?us-ascii?Q?F6BZknWRwueOFN6Y/C0Hf320FMwUSwlKwqe/PmxRS9v66MGArXZJwEq3NFRF?=
 =?us-ascii?Q?KxrhY/T9DXQDu1J83GwNZ8c6MSw5VmJTjx4BCTqv3/LWEn6v3XUDXTP4tm6D?=
 =?us-ascii?Q?3ZzyqzQadVpWxe17Yy7yHWoXfZ036ZjJAYhk9l4qbr+/LIF2rg6vx9LrRW1W?=
 =?us-ascii?Q?c5A0GecH7jZWDKMC6/hhKX+bolatMXn2ckzCOSs/zkCVBKjLu6tW/Jh6gnM1?=
 =?us-ascii?Q?HFq2GT/CLGnJLwClbk2Wd6GELMah4O8Y4Wzjw5i+ZqceyjXxYg2Wii5iKzPX?=
 =?us-ascii?Q?y16ZUyqvHxP1oGMTV+R56tkRsCLS5ESbuXka/DsIqQLzC+6/evuk1Sq2bXCl?=
 =?us-ascii?Q?URfJ+4Oz92m7xoHZCOt9vp5WicEacSrebqA/U/aaHxoDAUArkO4RsGPZb/XQ?=
 =?us-ascii?Q?THURTOKEaK46VHV7ziEctZVhnTTcgMRsvgq+7htJZHZWBP4Agx1CuiIzRK1t?=
 =?us-ascii?Q?FCC9xSvNIDVEXa77HAkHDbQKExQhk9fdrgHwilWUof2u5WEfLVTyuRYdiYQs?=
 =?us-ascii?Q?mitz71Joqj6n2hXHIeMNsiX/j/BgtHjl5fzgptleeOeAQxUbg6MnMJwuRkmf?=
 =?us-ascii?Q?hl2U3plAFymsLBW8Ml2xh+gUJI+atNmO1wFVfiFUldWE+GXbUJOeLvtuHp/o?=
 =?us-ascii?Q?B4nzvsIfjlTXkpMIpxTX73R9Zte+f3AnfMlGTH/bjMhkMGOAmBB6/2NIuKjj?=
 =?us-ascii?Q?pmq/2G7YL3JN+bIcS43jPb51aRfKztdai9w4/OTW5pyR0HJ8oBrGJkj96TUv?=
 =?us-ascii?Q?WsFihB05NR378+PPAs+ryRnc37YwaiylogKoyvtddO6yJ7YOh0R5paBF8VC7?=
 =?us-ascii?Q?RS8emYrVqcVLyuZRIk5/YWocuo75tWY81u4RxQoOUFF/8MWZsUUWU/QQqNvq?=
 =?us-ascii?Q?ByPm6cg8VVDcQbQ6MniXINS1fXo5BqwnI7qbJ+oQeBT0SglqE6mE900COBho?=
 =?us-ascii?Q?mYoo/FjK6ds4QZzhUR41ToNN0gyojf09EQV+GSCXa1CfgUL46YD5xcshDBtM?=
 =?us-ascii?Q?yXyYp4v46PVZECckt/VW4IGIAFhgBvAkCiz+oFEIehbqkJOuGMn765MINOKg?=
 =?us-ascii?Q?Wo2t49o/GOeM08tQ6Vuk63mhHsud1VUJ5wgBuxv/Y7p8yxDtnBvE5BSCOa0V?=
 =?us-ascii?Q?R9PuxhQq4czZGi43tgVgf4nzzAyBMFBPT2ayaFWdeRbr4QIm1I6++oSAOueI?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ced8cd5-32b5-449a-331e-08db89ca6935
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 09:11:04.7827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlK+HylJSvJreeg1sn4yeWime7V1tP1Vr4k3SRLWJ2r8ni9H2VglORLH9LlBfrfJ5m6xC5D2b9T+oeh4KaoVvTTb1Cjvpi5mJNJVd2p0Law=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB4437
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

On Tue, Jul 18, 2023 at 02:58:27PM +0200, Ard Biesheuvel wrote:
> This reverts commit a368f43d6e3a001e684e9191a27df384fbff12f5.
> 
> "zlib-deflate" was introduced 6 years ago, but it does not have any
> users. So let's remove the generic implementation and the test vectors,
> but retain the "zlib-deflate" entry in the testmgr code to avoid
> introducing warning messages on systems that implement zlib-deflate in
> hardware.
> 
> Note that RFC 1950 which forms the basis of this algorithm dates back to
> 1996, and predates RFC 1951, on which the existing IPcomp is based and
> which we have supported in the kernel since 2003. So it seems rather
> unlikely that we will ever grow the need to support zlib-deflate.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  crypto/deflate.c | 61 +++++-----------
>  crypto/testmgr.c |  8 +--
>  crypto/testmgr.h | 75 --------------------
>  3 files changed, 18 insertions(+), 126 deletions(-)
> 
> diff --git a/crypto/deflate.c b/crypto/deflate.c
> index b2a46f6dc961e71d..f4f127078fe2a5aa 100644
> --- a/crypto/deflate.c
> +++ b/crypto/deflate.c
> @@ -39,24 +39,20 @@ struct deflate_ctx {
>  	struct z_stream_s decomp_stream;
>  };
>  
> -static int deflate_comp_init(struct deflate_ctx *ctx, int format)
> +static int deflate_comp_init(struct deflate_ctx *ctx)
>  {
>  	int ret = 0;
>  	struct z_stream_s *stream = &ctx->comp_stream;
>  
>  	stream->workspace = vzalloc(zlib_deflate_workspacesize(
> -				    MAX_WBITS, MAX_MEM_LEVEL));
> +				-DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL));
>  	if (!stream->workspace) {
>  		ret = -ENOMEM;
>  		goto out;
>  	}
> -	if (format)
> -		ret = zlib_deflateInit(stream, 3);
> -	else
> -		ret = zlib_deflateInit2(stream, DEFLATE_DEF_LEVEL, Z_DEFLATED,
> -					-DEFLATE_DEF_WINBITS,
> -					DEFLATE_DEF_MEMLEVEL,
> -					Z_DEFAULT_STRATEGY);
> +	ret = zlib_deflateInit2(stream, DEFLATE_DEF_LEVEL, Z_DEFLATED,
> +	                        -DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL,
> +	                        Z_DEFAULT_STRATEGY);

nit: The two lines above partially use spaces instead of tabs for
      indentation.

...
