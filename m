Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF6E75C2B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 11:14:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=UntYgRju;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6kQG4NB0z3dhs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 19:14:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=UntYgRju;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=corigine.com (client-ip=2a01:111:f400:7eaa::722; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=simon.horman@corigine.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20722.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::722])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6kN74gD0z3dWj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 19:12:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPUUOEiKaaph7Jt7OLlaDrcQUprHGrxRDBoAAVE2wmicVv1jcYI+7iDEeIu7WEWQdANwMYsXs83LGdb9CcDPabozMCELeAtP75z1zjZpgcfrSnADq3Vph8v+cNxk+xHOn582r4IxGO6PT11f7aluoE7ZAE9dHDu5FDf6K4KKe0qILArKdebx+oRbTjSwgFDuG+QblRpvd7AK0A1iEYCwBHKawLPq4yjTZDtyM9QBBdjAhKcc92lgDqJJlgamQulnvtGfAvXSkcmhl960ipU0ADeRSwxnMId9lud55nbgsmQ4UMEJ5qQT0cIW9ko8sBXKvEogPXcya2g8pji1932b9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6LzVGEsIlcjt+yfIUrMi5kIGhLPNYa2FpocDn1wTVE=;
 b=Mko4QklsIEKpUr8NfbUpkq02R8c2JBGXwrNVEYneRwLCnWXfDjhldww34ds4bbrjzQkXWHQN1yobM9P1CE0h8T2OwJskKS+nZNjB3YYS6KVaowa+bmW78fzgpQXhMA7VGOHiRexe5KWTNV6/kv+04nEPOS2sCmmo73o+c4YIrm4kq3pw2nf/r+3h0ZA5igWVNwkjzpfGCb+SBubihRFgq39hAUA3irc2u/MJduL426MEPwra3jWw9rLKQ1Sq26PVrdbmLWSWYco5nuxMBTtbjMrr7O+v8pm2bHxvVAdXtU/o23AB1LWSBH9FVaMZQ89LjUjZXYej4WigEnKYzNGP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6LzVGEsIlcjt+yfIUrMi5kIGhLPNYa2FpocDn1wTVE=;
 b=UntYgRjugMHHb4oH5VDykIbQDZjfsZTvae40kNfe4bQFI/yKip0JiR6PQbH/HETZgIEsS9YsHqYzubL2JK3UuSv6BWi/cREHzrotCwVenN/6Y7ZTS7Q/yQjkN920RojiMkqwjEwTr+B8wrbg0Aa8NaTo/wQLLX8OgK5dFE6/X+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by BY5PR13MB4437.namprd13.prod.outlook.com (2603:10b6:a03:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 09:12:05 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.025; Fri, 21 Jul 2023
 09:12:05 +0000
Date: Fri, 21 Jul 2023 10:11:56 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 04/21] net: ipcomp: Migrate to acomp API from
 deprecated comp API
Message-ID: <ZLpL3LhBdCzucsZl@corigine.com>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-5-ardb@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718125847.3869700-5-ardb@kernel.org>
X-ClientProxiedBy: LO4P123CA0439.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::12) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|BY5PR13MB4437:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a302898-c9b3-4944-7cba-08db89ca8d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VqNgV3mKFDO+vo3ZflQ5nuqDuSb7QysNLilzOIwhjrM8u86L7BsU0YGoP1V7UeE3ZMjFG1IZHcwB50Qaaj+QGBGThPIAjL22OC3CPXFVl0bnIxVaIVsAcYCyVTXJLUaGIy4PJ5G+WWMTZNCPwraMUao20fe2kslkZ+pCQX4ICQFX51D20FbN9/SFUvh9Jx7NCY6gG/Tb6sl72opy+Fw6tocDPds71EkVM5eor+9TDb64Pduqdq7sVesnP8SHyA427bGLsrWMPGY+pL1rZwL0jlRI+upYlH7I5NiRN68QNgPPokBNqrwKtcFfR0KCL8VCnpWUSPvs6M8bBZ/+wohGfYO+5K21uLdZxxFCbes+Ds3VT8l5zL3V4vnD7/2GzKU04+w3J/ZOyw6XVFmXHZpyrcHtVUwJ4Y6oP43ZhEUraOr9/V5dhfjv7UgIst3co77I2rzdCegwMwg2iBiS74E7U6ppExyA1QD/7Cx2FT+rR1X33SQGkjtJE4hvpQpeRy29Qp2BKJocNfJKAmtgCec4vas7HWirWWU9lCFt3pCmaLhRlvmP8nPuwXUD/ujWGQS37087dRZyxIgiF8wfFMzCqQ+Fils0F28o1n3HL0vTazI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(346002)(39830400003)(376002)(451199021)(86362001)(36756003)(6666004)(478600001)(66556008)(66476007)(54906003)(6916009)(26005)(55236004)(4326008)(6506007)(6486002)(66946007)(6512007)(2906002)(4744005)(44832011)(41300700001)(316002)(5660300002)(8676002)(7416002)(38100700002)(2616005)(186003)(83380400001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?eJUF/e7ghqHD+k/Ia/OymR6yt2M+KEq1z8NNGDFPpkkpRbMf9/67dTifyVRr?=
 =?us-ascii?Q?GfAAHXpWTvF45SCGfrqQiR+ev/n2GBilTR23c8qiXRE6BY4DVUjaMp5YH7Jm?=
 =?us-ascii?Q?Ss11D9nB31gbE0NwDZjIqacowg8SFMMlXIMu1z8Fl5y9RY/JReP2DTfw1C7I?=
 =?us-ascii?Q?QB1Ot+tS93W4xyAxe8EcC2U3nZ/9jf7ryuhrU7h1VVz+rVUnIAySJBtavtOf?=
 =?us-ascii?Q?oQ128qUAPjwwHcB9l0WqapxqcW4nBY+Lq2svfoxRrm5BYsQSi4xW6MP9DdjB?=
 =?us-ascii?Q?KeIeGlEA0YuJajZCdC/DCV136d2wt+Vq2tanpcl0XRmcHn+c0kTVqbi84LbQ?=
 =?us-ascii?Q?iI5HCkDV13HYKD7167/xyk/ohxbb2Y4AtaW6lBfdbO6h7bnZ0sOqzs2jxDs7?=
 =?us-ascii?Q?vSL8rSLfR7I6xO61rHoVS2ceAqscamRw2IIce8awoOs+e7MieoloPzP3eEPe?=
 =?us-ascii?Q?gOIeOpKQRoZpv6eoqlJVPoQaxzh9VNi60elwM7Fn1QspU5R1TJf9LACV8Hgn?=
 =?us-ascii?Q?AjJ5EoEOL63w3L9rJ8HQYBzF5SN5JuPI5PjBX7N1r/ZqH1xWB79GLEVPXWLg?=
 =?us-ascii?Q?moLnkBmnMPN5E1YOFC3GLpCf3w5IRJVaRnBQahzC7WwnXmqdY1t03oj4NEsD?=
 =?us-ascii?Q?JokF32D5oTLoGtl9pZ2Ua/VikYvkBB7oEn+Ny55Ygu63Ydo8wagrusCFpii/?=
 =?us-ascii?Q?Hi+0rbox33rW15mccdMbpAXQgTiMdWnIdF2PxNgTBnTUkStfkXjx1x4S87oo?=
 =?us-ascii?Q?tZQSp8VZZG7GCLC8iK7c9Wgj8nu/A0YYo4fYsACtiTOIgHKMdDywSWNWvw1o?=
 =?us-ascii?Q?smzZmQn1vuR1lVVgVcjzn2ZZeY41CAYxnjhhDRlzDPyVbCsIQk8Qriu94Lec?=
 =?us-ascii?Q?ZbOFxJMvz+2x5Pz81bP1FTOmQ58GcIW2i+Mkg4onFWRO7hXpVROicWlHfPY+?=
 =?us-ascii?Q?KbVGx3hoHmOsGGOxkJG14/QSfNTPiGwLFovMcmfG7Km1mRgtJ5BR2yqHeddx?=
 =?us-ascii?Q?UF1P70UjmWVH2YxXSOi3IdMDfqL3QOB895Y5Wzmo3gBbz4yGASm2Mvl5BpIx?=
 =?us-ascii?Q?H2tVkKL/xG7yYp3hlN9J33359wdk3HsmwjPysqi0CbdvsPfkc23fUwwgY60p?=
 =?us-ascii?Q?pqW6KLVEvvtw9G1U39HacznRg+dkDsqvPrmevQsuKOVPtd/9XWgQ6J3wUgbI?=
 =?us-ascii?Q?JXYsArwMnlYdKro+O0dHvmikStmv+k5qQ0ZQvPUZP2ObJMiKinwoCEa76P8j?=
 =?us-ascii?Q?lt94LLWEwcvJtBuayieEPYwaKpm4V4sOJxB3QBdimwfhFhALXPi+Iidt41MX?=
 =?us-ascii?Q?oE+a5r3JTvsGjci4Uyp3htf97cjwvufznvqep3f+nmhRAtehqqYDER+JHLF6?=
 =?us-ascii?Q?ur2VioBtHCV9Qx2PCc+cr0fQN7IT3WdDLLa+w8Sa8dEwZljFQnC6XmjzOq7c?=
 =?us-ascii?Q?mObKonU+Ucq85QvywKQ5V7068r+5o9uoEqyU69nN8bzqfHvDTKKS7SAbkjIs?=
 =?us-ascii?Q?MTporCH4m1chEHjuyFEVIUo0123wdADCJs5EMzaY3UAWvmS6ykcPjJXCZ0zU?=
 =?us-ascii?Q?vcOiSkbuXgdvAu1FjbBn6a7om1fLrfqzxbis19ZI9kHEBoVrrV/p9XInmI48?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a302898-c9b3-4944-7cba-08db89ca8d83
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 09:12:05.5719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1zZO6CnkPY7MvBm9foAoS3oy/ecJ7q+5fqT2BBUDgns6oxW+lh82hmI6J2euxTX22nNn9kMzzqweHnHVk4qIH5fCigtraNAZFZJyVVRzdU=
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

On Tue, Jul 18, 2023 at 02:58:30PM +0200, Ard Biesheuvel wrote:
> Migrate the IPcomp network compression code to the acomp API, in order
> to drop the dependency on the obsolete 'comp' API which is going away.
> 
> For the time being, this is a rather mechanical conversion replacing
> each comp TFM object with an acomp TFM/request object pair - this is
> necessary because, at this point, there is still a 1:1 relation between
> acomp tranforms and requests in the acomp-to-scomp adaptation layer, and

nit: tranforms -> transforms

...
