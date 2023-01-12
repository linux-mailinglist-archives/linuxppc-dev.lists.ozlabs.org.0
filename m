Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6866A5CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 23:18:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ntwlx3bRyz3fDT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 09:18:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VnzgSv3J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=lucas.demarchi@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VnzgSv3J;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtHzr3wVJz3fnC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 08:41:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673559672; x=1705095672;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=j5t8yu+GQdrROqft3QkOtSKlI9+ocI4SIqQXnTOCo9E=;
  b=VnzgSv3J6BzFcgMrkQYB+03XAXjdnn5fo/kYFuvjurB/NAWguX+YbpG8
   5xgMe9qCDAZdAcrLViYipaw6t3p/17X2kI2JckkqzAC46pPozAGmFbALP
   qDbSDOIMitaZ/noUzsxP8ZbxYrpc81GYqTfpciO8fTtYwyadY1InrHmTY
   UEYo9sxHG1CZRh/YkZ7rKwjZVDCIQwZ8OvAh/UJ4Lhn/tfJ2IV2ESzxky
   2FMDVjdv29KWHm4KkqdjNmO2Tgw2gJn1aTV9UpgkbaTz4ut/TW70kg14y
   NKzBmZoQ/rLyI/7UzNIv9HVxVg3jUFVgQhqyrKUnR2Vhi5WMmp2psc/Ki
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="386181572"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
   d="scan'208";a="386181572"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 13:41:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="607951671"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
   d="scan'208";a="607951671"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP; 12 Jan 2023 13:41:09 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 13:41:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 13:41:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 13:41:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQhjJPxfmYOB2kMRWE9r8LUmpGRuCv4EUieQYNCveDd9zp3JqxYXs6SkQ442FpzhkRWfoeaZKO1rwymqEMsQ/gkMGGRRcV3I9gytxxeHFaBOvqhJiG6o6eVre1kQeYfv18OVfJoVMmt6dnsMl4kzYPAtvl9hG5yo0JvK7L8uaZMoBE4NdRfYpCVkaxTz5/Q2AsGGqttj4GA0jPhTfjjQNrUeoGAwGUINXnrqdO7FhqREaWhhFK1yPWGBE6SgGU+Ibej5vqVAB4uUIGLMKkYnS5HKIpWNVKAbACZXGrvgGxYMWCyGBi5r+hFPpsQWR6WHhKVg3h6i+kJMTdm9W1uEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtAJ8ESXzr+LymDXZJSN4w/4i8jj0Un0Uod5J36/R6c=;
 b=gId0tT3/O39oiN1ZgyymJLv3cl93tJSZl/OvlqmXXmCyhlxVX3Hg5i+P7KGcaY2vBDUpUAdTJHa8BSP4YbGeQEmDA6J8HY5aDbQd/JEX6LOYvYzjdkUuxzhHz8kS0JCa9U2jpD1ge5DdY/O1cNcLFi+vZ1XgRwbyXYQnvVtykU9tAJi/EJhMf5WGwhd2VLpwvP3n3TGok6hCgGY8FxnBNGTcVUeFWQr5GOPu+4FUL3pXvgyJQU9aLACdAweP7zbQx5sakVh2XqibVk5ZfQo4bYDHic0O6onxW2ulLlQrAfVnUon5yJFhlWYr05Ob5oxiStjXvwTSZwCV+MPXYTcdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 21:41:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%5]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 21:41:05 +0000
Date: Thu, 12 Jan 2023 14:40:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <20230112214059.o4vq474c47edjup6@ldmartin-desk2>
References: <20230111161155.1349375-1-gary@garyguo.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230111161155.1349375-1-gary@garyguo.net>
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: 65577017-c9a4-4f4b-5212-08daf4e5b557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rBiNWgv8dWs8m8e1HMTKcIwtK/XeWDAnOSNDm+ZqTav+ZFKUeBytL2/NkXgwpmHT8KXndIE7UnEMG6e7vEeB5HoZF+7ZfS77BYyynG/s+JKXyV7IUAphBklVopmofpmPiVQpEh127hIQ+eEFACS84io476CyoblsIgJVlZEx3delJ+9VnrHVNduM8VIWXchiBswelIvzeHG0c5STeQ1Iyllja6MPLirPbAxHFg/3YAkOADOkpXLqbFrNC3mm9pu6BYUGJyB4IVGzyyyMOYj0hzTD4Dk/NFYjVX8hR+QT4zwbjLiPvGomEcL4wuzy3TYKSmdJC6p52GWNBviPmkFyA13ifM0mArswTZ1jD2eNVerPApjn+8C/+3NR1V6511l2UOzx+0hvUKxtJTrBBwkbwlcBwc8l9Ue4GqAR7OxqP/5mXeYBTQETHtGTWFBzx3+0YRJ0Fz2jtgxJvXwWsUI0xH+Id5zq95O3PTqfI4tOrbDsxY/7h/mf7wPrNAKJCyr/e2a/imOvHCAC9juWX6pnmMF1AjhY2pXwS8E26zF0mDwit0niAxzjpOmFihaqmSgBYAU5CbW0YEtTZLb987z0BzWPFmuwupR1igYRPUCG/RS14KfrkzysATohWatDY12afVXz0XNDZPVojW2weXTaEPBybVlcRiqFvx3XrqskIj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199015)(33716001)(82960400001)(83380400001)(38100700002)(86362001)(66556008)(6916009)(66946007)(41300700001)(4326008)(8676002)(316002)(66476007)(54906003)(8936002)(2906002)(7416002)(186003)(6512007)(1076003)(9686003)(66899015)(6486002)(26005)(966005)(5660300002)(478600001)(6506007)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+suf549FQDMWRiszp3fBlyHS3OxOqR/Hcxt4j2Uhz6wYbSUYKlvWTtvF0fr2?=
 =?us-ascii?Q?sTVhLKfehnIxXYfZRgsub4Km9Fv+pt7fqxPHlKfIw9TQAHNlV/4ixUxB8Rnr?=
 =?us-ascii?Q?Y0fjU1ZohXPzBRz/65r/l2V8z2WR+icUV+shI+y7/zBNo3N/I8n4lIVlZG+q?=
 =?us-ascii?Q?sJ4Zj4K7IV1MqnSW+t6DGJTZ3QL6cLLZn/e1uACwF7iTQjhAPorU1jH89WMD?=
 =?us-ascii?Q?3dBQrh9HRj/H2fKNK9ZryMHgEwGSHIJaL1bxGvckGh+Fss8zK4NgFmwMvNe5?=
 =?us-ascii?Q?8MwCqgjcyHUd1Qae8IQZ6114c6Q7FfyyVo1QZzpV6LY6BpbqbVJ3pAjowpxq?=
 =?us-ascii?Q?apAZ3LXBcoWWmb9r/cFMT8FDLJCOTZBGOc+eNSHzon7Wnv3wTmcyO8D18UtJ?=
 =?us-ascii?Q?M9JkiUdIpu1TIY2MXpyWLkyQb0NtDZjODFuOC92Ptz3LQAPu8QSx+n40DzPf?=
 =?us-ascii?Q?FymOFlA85ZrHKnK6PziPzoepQNoFnHZnZt7z956ar+mhK5BPOI2ltpR0L5L9?=
 =?us-ascii?Q?ASDBWdz//vbByCxBhGun2K77U7HMFj1y1pSSosKflHGhQDl8LRgNQwZnSNlI?=
 =?us-ascii?Q?lBvHcX+wN32ki/ZgjwRwCKVRZggTdsYMnFFGU8R2eIw+DcbHfAAD288pN6h4?=
 =?us-ascii?Q?Ws7um7d42SH3N+wq3N5JDwKOzFn3lPiXSuGDW6nUlyrkoR3cXS1Z4vLSoZJd?=
 =?us-ascii?Q?5738LOrPZNWX38OpL9MJ9qkVxiec/Nvzvn8KSeyzRk6DNvl/fX7IQ51D8eI4?=
 =?us-ascii?Q?0I2P7HPIBqUFuKS6N09hk89YORzDXUtLei3vnJDHqYlb+JRncA+dG85stfbk?=
 =?us-ascii?Q?xpaHBXWLvvr8Raxq2oD/L3br9af/4c7PXtwUaIBuJBPj3DWDP7zeCalZOpk9?=
 =?us-ascii?Q?IdNA8M49oWkfX2oyS5MVf9cMk/oUDhI9RR+5h3EhjIRYllYbBocCXLyO87ko?=
 =?us-ascii?Q?R19UmE98zbDo00yz9d+nhkQ03YStwmOwLTQkm1kZ9LDEpOCQ9HbeKj6ismrQ?=
 =?us-ascii?Q?p7Vy+ZLaQBvMu6pJ6Ji4y8+n+K0o1lK+TlvL5/RhCxv7fjPllbQad+dA+ujA?=
 =?us-ascii?Q?9DKdw3v6vc0pc2VHGO5fie3eF2vps3myqTwaJtmIx1aT3hg5W6p4JOO+rIwP?=
 =?us-ascii?Q?TZUHjs+KVZiGMEafEbeXaWD2s7gaT+zTM8vrMVsP9AvTGCGF5D4cf3+7JdMd?=
 =?us-ascii?Q?r1+GwD8zc4MDkKEECXImEpMBVUS/nYTnJCOi44E0nuD0KsZ4TYZ5PVew0FND?=
 =?us-ascii?Q?F/pTiOnANLaC9DnUVqCl/AettOMYArnSpaGOf3EHKK8R0r6zgh5ymc8ACU6i?=
 =?us-ascii?Q?Z2MeJ8BkZBHaVai1Xcer+mgSLFo7r1Xt7rYSAHN3R+gv+E5JsaXsQiCOq5T+?=
 =?us-ascii?Q?9oa536+3mZbZuSLEuliK9STpQYFa+Cy4oOFEfBS50t1pt+cPvQMJsA71qcUJ?=
 =?us-ascii?Q?cLgZYpwuqNf8LA4jA3Bqi+n1m8wvQNdON4msTmPWyo1piUtP1q9SGPvvQ0+4?=
 =?us-ascii?Q?d5Ow5Y2cav/7cYzkVpt0Dyzcmowk1PSCgPbrvLGcyi5arbDpVfFxYe4659/L?=
 =?us-ascii?Q?2Jx4I/D5usgzz358bmC4pwo6vEci+4T6dD++0qe9e40UASTD5uTEjT1PrNne?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65577017-c9a4-4f4b-5212-08daf4e5b557
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 21:41:05.7495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvAXQhT9cqhRVCfIb9tJV9SRUS5FjPEfpFF9y9dBNcBATd+GTtLHw02EY25DRUYr8XGIU5+Bv4jcxLQ+yC+9uDCWcp7Kk63stRD3RBizLsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Sat, 14 Jan 2023 09:17:16 +1100
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
Cc: Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Wedson Almeida Filho <wedsonaf@google.com>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, Guo Zhengkui <guozhengkui@vivo.com>, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Luis
 Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:
>Currently modversion uses a fixed size array of size (64 - sizeof(long))
>to store symbol names, thus placing a hard limit on length of symbols.
>Rust symbols (which encodes crate and module names) can be quite a bit
>longer. The length limit in kallsyms is increased to 512 for this reason.
>
>It's a waste of space to simply expand the fixed array size to 512 in
>modversion info entries. I therefore make it variably sized, with offset
>to the next entry indicated by the initial "next" field.
>
>In addition to supporting longer-than-56/60 byte symbols, this patch also
>reduce the size for short symbols by getting rid of excessive 0 paddings.
>There are still some zero paddings to ensure "next" and "crc" fields are
>properly aligned.
>
>This patch does have a tiny drawback that it makes ".mod.c" files generated
>a bit less easy to read, as code like
>
>	"\x08\x00\x00\x00\x78\x56\x34\x12"
>	"symbol\0\0"
>
>is generated as opposed to
>
>	{ 0x12345678, "symbol" },
>
>because the structure is now variable-length. But hopefully nobody reads
>the generated file :)
>
>Link: b8a94bfb3395 ("kallsyms: increase maximum kernel symbol length to 512")
>Link: https://github.com/Rust-for-Linux/linux/pull/379
>
>Signed-off-by: Gary Guo <gary@garyguo.net>
>---
> arch/powerpc/kernel/module_64.c |  3 ++-
> include/linux/module.h          |  6 ++++--
> kernel/module/version.c         | 21 +++++++++------------
> scripts/export_report.pl        |  9 +++++----
> scripts/mod/modpost.c           | 33 +++++++++++++++++++++++----------
> 5 files changed, 43 insertions(+), 29 deletions(-)
>
>diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
>index ff045644f13f..eac23c11d579 100644
>--- a/arch/powerpc/kernel/module_64.c
>+++ b/arch/powerpc/kernel/module_64.c
>@@ -236,10 +236,11 @@ static void dedotify_versions(struct modversion_info *vers,
> {
> 	struct modversion_info *end;
>
>-	for (end = (void *)vers + size; vers < end; vers++)
>+	for (end = (void *)vers + size; vers < end; vers = (void *)vers + vers->next) {
> 		if (vers->name[0] == '.') {
> 			memmove(vers->name, vers->name+1, strlen(vers->name));
> 		}
>+	}
> }
>
> /*
>diff --git a/include/linux/module.h b/include/linux/module.h
>index 8c5909c0076c..37cb25af9099 100644
>--- a/include/linux/module.h
>+++ b/include/linux/module.h
>@@ -34,8 +34,10 @@
> #define MODULE_NAME_LEN MAX_PARAM_PREFIX_LEN
>
> struct modversion_info {
>-	unsigned long crc;
>-	char name[MODULE_NAME_LEN];
>+	/* Offset of the next modversion entry in relation to this one. */
>+	u32 next;
>+	u32 crc;
>+	char name[0];

although not really exported as uapi, this will break userspace as this is
used in the  elf file generated for the modules. I think
this change must be made in a backward compatible way and kmod updated
to deal with the variable name length:

kmod $ git grep "\[64"
libkmod/libkmod-elf.c:  char name[64 - sizeof(uint32_t)];
libkmod/libkmod-elf.c:  char name[64 - sizeof(uint64_t)];

in kmod we have both 32 and 64 because a 64-bit kmod can read both 32
and 64 bit module, and vice versa.

Lucas De Marchi

> };
>
> struct module;
>diff --git a/kernel/module/version.c b/kernel/module/version.c
>index 53f43ac5a73e..af7478dcc158 100644
>--- a/kernel/module/version.c
>+++ b/kernel/module/version.c
>@@ -17,32 +17,29 @@ int check_version(const struct load_info *info,
> {
> 	Elf_Shdr *sechdrs = info->sechdrs;
> 	unsigned int versindex = info->index.vers;
>-	unsigned int i, num_versions;
>-	struct modversion_info *versions;
>+	struct modversion_info *versions, *end;
>+	u32 crcval;
>
> 	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
> 	if (!crc)
> 		return 1;
>+	crcval = *crc;
>
> 	/* No versions at all?  modprobe --force does this. */
> 	if (versindex == 0)
> 		return try_to_force_load(mod, symname) == 0;
>
> 	versions = (void *)sechdrs[versindex].sh_addr;
>-	num_versions = sechdrs[versindex].sh_size
>-		/ sizeof(struct modversion_info);
>+	end = (void *)versions + sechdrs[versindex].sh_size;
>
>-	for (i = 0; i < num_versions; i++) {
>-		u32 crcval;
>-
>-		if (strcmp(versions[i].name, symname) != 0)
>+	for (; versions < end; versions = (void *)versions + versions->next) {
>+		if (strcmp(versions->name, symname) != 0)
> 			continue;
>
>-		crcval = *crc;
>-		if (versions[i].crc == crcval)
>+		if (versions->crc == crcval)
> 			return 1;
>-		pr_debug("Found checksum %X vs module %lX\n",
>-			 crcval, versions[i].crc);
>+		pr_debug("Found checksum %X vs module %X\n",
>+			 crcval, versions->crc);
> 		goto bad_version;
> 	}
>
>diff --git a/scripts/export_report.pl b/scripts/export_report.pl
>index feb3d5542a62..1117646f3141 100755
>--- a/scripts/export_report.pl
>+++ b/scripts/export_report.pl
>@@ -116,18 +116,19 @@ foreach my $thismod (@allcfiles) {
> 	while ( <$module> ) {
> 		chomp;
> 		if ($state == 0) {
>-			$state = 1 if ($_ =~ /static const struct modversion_info/);
>+			$state = 1 if ($_ =~ /static const char ____versions/);
> 			next;
> 		}
> 		if ($state == 1) {
>-			$state = 2 if ($_ =~ /__attribute__\(\(section\("__versions"\)\)\)/);
>+			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
> 			next;
> 		}
> 		if ($state == 2) {
>-			if ( $_ !~ /0x[0-9a-f]+,/ ) {
>+			if ( $_ !~ /\\0"/ ) {
>+				last if ($_ =~ /;/);
> 				next;
> 			}
>-			my $sym = (split /([,"])/,)[4];
>+			my $sym = (split /(["\\])/,)[2];
> 			my ($module, $value, $symbol, $gpl) = @{$SYMBOL{$sym}};
> 			$SYMBOL{ $sym } =  [ $module, $value+1, $symbol, $gpl];
> 			push(@{$MODULE{$thismod}} , $sym);
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index efff8078e395..334d170de31f 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -2046,13 +2046,17 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
> static void add_versions(struct buffer *b, struct module *mod)
> {
> 	struct symbol *s;
>+	unsigned int name_len;
>+	unsigned int name_len_padded;
>+	unsigned int tmp;
>+	unsigned char *tmp_view = (unsigned char *)&tmp;
>
> 	if (!modversions)
> 		return;
>
> 	buf_printf(b, "\n");
>-	buf_printf(b, "static const struct modversion_info ____versions[]\n");
>-	buf_printf(b, "__used __section(\"__versions\") = {\n");
>+	buf_printf(b, "static const char ____versions[]\n");
>+	buf_printf(b, "__used __section(\"__versions\") =\n");
>
> 	list_for_each_entry(s, &mod->unresolved_symbols, list) {
> 		if (!s->module)
>@@ -2062,16 +2066,25 @@ static void add_versions(struct buffer *b, struct module *mod)
> 				s->name, mod->name);
> 			continue;
> 		}
>-		if (strlen(s->name) >= MODULE_NAME_LEN) {
>-			error("too long symbol \"%s\" [%s.ko]\n",
>-			      s->name, mod->name);
>-			break;
>-		}
>-		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
>-			   s->crc, s->name);
>+		name_len = strlen(s->name);
>+		name_len_padded = (name_len + 1 + 3) & ~3;
>+
>+		/* Offset to next entry */
>+		tmp = TO_NATIVE(8 + name_len_padded);
>+		buf_printf(b, "\t\"\\x%02x\\x%02x\\x%02x\\x%02x",
>+			   tmp_view[0], tmp_view[1], tmp_view[2], tmp_view[3]);
>+
>+		tmp = TO_NATIVE(s->crc);
>+		buf_printf(b, "\\x%02x\\x%02x\\x%02x\\x%02x\"\n",
>+			   tmp_view[0], tmp_view[1], tmp_view[2], tmp_view[3]);
>+
>+		buf_printf(b, "\t\"%s", s->name);
>+		for (; name_len < name_len_padded; name_len++)
>+			buf_printf(b, "\\0");
>+		buf_printf(b, "\"\n");
> 	}
>
>-	buf_printf(b, "};\n");
>+	buf_printf(b, ";\n");
> }
>
> static void add_depends(struct buffer *b, struct module *mod)
>-- 
>2.34.1
>
