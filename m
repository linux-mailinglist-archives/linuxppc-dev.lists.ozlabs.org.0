Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5612F66E6E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 20:24:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxJjB0zhJz2ym7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 06:23:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B7dFToup;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lucas.demarchi@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B7dFToup;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxJh86nC7z2yWN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 06:22:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673983385; x=1705519385;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0HvEB9orqKGoR3KtSrMxXTUWy0NCbDQ8IoSVOg+jJGE=;
  b=B7dFToup/ZySx9Ng7DZ14PHmFybNiLi6yNh/XxuxZPfb12ArECVJQQMg
   QLpte4BINuKv9X2hEvzCNsCgwZN/QbFNyKMZavIHwdDQdQc8HUdMWxo4R
   LzgM8EuFle+New2XAJcckiimv56vYZbEztZAg2Rzv1cVj5N4ARfYEAyYW
   D1WBXzakBPvVQgOdpsrtBXu4+O/+CM+ohTqLAExBNf5tTNiBuiVeuj3KM
   grONglA4a4Nsnw0HQtF7b4Wr0cOOGEnAS/+kClNJVgwegxJtnA12Pr7V7
   /nJKZyFUWh/dRrn3HE/RSNllG30JrnkXsKHK0QsmlJ8ENnH4X2OcahjWy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="389293705"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="389293705"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 11:22:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="636970127"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="636970127"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP; 17 Jan 2023 11:22:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 11:22:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 11:22:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 11:22:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAeBip+vmwde/cimaITDSVGbrBE3R9MQgGWHzPrhbYszRQ1BI62A9mAqsLUcQ/MFCtwLmdYrgxM+UPGkpv5rs8xCtQKQHmO/0zbUTlTU2esdYLZ1gbKwnWiaMlTrMUNIjrzUpcOgsJG0CcCoV20KMCQyNWTQKFNRCDp36DkdT87W0bhJmTz1MFotK1VMg9T2bc+gtYhaGkBt6sBp7B4lIlkMXP4ArBaqFjDUDwCy9zMv4/QhqznE+0sFLAbl+UuKftzsC3JO53UkUVZEx4An1mMloKRqttNOq6hSDjF4X3CUnITyhGK6Oldks5N6sVZBWcj7JAaU2r572ZgGv6B88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOEJVWcjUjdsx6H2gngs8nAs0+5r1sknW6SFkkK9EfA=;
 b=Vs3xsnp5cLs49O/pWkC7sVfVTiB1s6BrLqqTBADre0lGI6+f+4OzmXSRLRugCjikCaUKnL5KPGjTMBYlM+hNOmUor9Cg2ZBRaWQ+jJOk0vUfnxUZWYiFAvyiCtxcKdw9mGtEhpR3cABmReUKtamkR/AC2JDOaoWrkCbtwfx7SVa5da6F42wyK4/3JoRl/Yox43lyaBn5Lo+yNsm8cdQRVBlXCLDsA9Cv06li0sOUK3UPAye8GuMZmCSgSfwk73UvWBoiu3k8p3jDeb8091wv596h/57HSmUrR/u+gobID53pxL9evUKF/z95Lbh7u5iWmdxlLWtKT5JjsCFCKnrtiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7175.namprd11.prod.outlook.com (2603:10b6:208:419::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 19:22:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%5]) with mapi id 15.20.5986.022; Tue, 17 Jan 2023
 19:22:49 +0000
Date: Tue, 17 Jan 2023 11:22:45 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <20230117192059.z5v5lfc2bzxk4ad2@ldmartin-desk2.lan>
References: <20230111161155.1349375-1-gary@garyguo.net>
 <20230112214059.o4vq474c47edjup6@ldmartin-desk2>
 <20230113181841.4d378a24.gary@garyguo.net>
 <20230117175144.GI16547@kitsune.suse.cz>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230117175144.GI16547@kitsune.suse.cz>
X-ClientProxiedBy: SJ0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 891202b9-6d8c-497f-eb14-08daf8c038a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YloEVtkv8bY3nB4GKMgGeL+aVmswFAQuHup+VdxdwOgPJNl+ZG3vCiNAgbENLKiSqPCFAl1/SExGLOrxt0rdHWbCnlu/jACA32JVSoqAj6IUxX//Vp8ch3ZZ0pVSdqU+/IX7UV9i81HQhTST3w7A0edey/5EOo+LRzszbid5wPhwJfcKl7iHATQx1VF22qWcbvMZEOwjxz6dkj0BciqFegvSaXdx3xIwKm12HZ2RGAwn3WZSjL5BS8gVltF/jsaa/4ljrHnhR1qic0VrM7UPzmvHGYlsCTOjPzzIUg8dTFBYYZ8z3zpDtDeJVXGu8ewyMxTj4LDsMvMSEFwLlLC/uCluqcdU25oxMtNhWWdNgndqtSuVauzrm8iGbQjE1JN3dm8smM0K4fcEAfkDTA7Op+9HCKn1YbhI9eh5CRo+edSKlc9vTxikN6nxO1PqL9rWD+rKVvnrcTE1Q5ttPQXjr7Aec4X880PAZx/p8Bm0ANelO+GOgfV2OqG08UblDlDEdamBSPNbwdwHHNzDXKmEmd2okVNj0Dnsb8hTGZhBTSCxJTbxX71cd8u6fa7ME4FBO7f0nzh+hl/6XOL+t5p48/z/CHQIBQjs4tvD7rFtckh03zqSyk1ZUqJG1wM4ab2y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199015)(82960400001)(83380400001)(38100700002)(8676002)(86362001)(6916009)(5660300002)(8936002)(7416002)(66556008)(66476007)(2906002)(66946007)(4326008)(41300700001)(26005)(9686003)(6506007)(186003)(1076003)(66574015)(6512007)(54906003)(6486002)(316002)(478600001)(6666004)(66899015)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?C4mc/3n+/EWZA1a5vnBOkiWlw/QufIjZux3p8RNUExWGVRr0wKQPCCCZBC?=
 =?iso-8859-1?Q?771sLeA7yUY/D6XMf6x4j6/aRFMV2+LWYe92fJwXJHzTYusLsw4PwayC+j?=
 =?iso-8859-1?Q?UzAu4mUmfv7T1n3metTx+YVRgrPyCBnGwioiwr1r4XO2DlBtmC31DMobOp?=
 =?iso-8859-1?Q?XXuVAKNlLZDwsKlHFjjgWc+/tQWbBy9nKC+++GHDAinM2FNSKKCrEmFUiE?=
 =?iso-8859-1?Q?monjGi6mfJmrglAIASP7Pcd/TErt7Ph4/uDh0rXiwGRNk1OPfMXyHCpGJ3?=
 =?iso-8859-1?Q?SZCBaeuJuIFm1w4si3mjMIzRxpkriJLm4lnNBAEfbfeeu0cZ/+IRqTf0np?=
 =?iso-8859-1?Q?JNByKA9UYxHZ9g4VOzlyfPwJ7ptB4wvxj7cYBjyfbzyL7bNW/3JvKAE2uc?=
 =?iso-8859-1?Q?mLJgUvvQS8AGvTtXX0MNIuBLAZxovIQQRKqxH1cSQNr1yDm/TRhiNeM9i5?=
 =?iso-8859-1?Q?uHgiaKayLHvzBfukuB8zSBg2srDAGjtDhBhkDl7cpYKgyVaWnbYDj738cV?=
 =?iso-8859-1?Q?Uejx5TqIylD4Z2im9QuPaTLx1svEJhHVXPYv2GwVkxwm/SjUNCLyUPYBUz?=
 =?iso-8859-1?Q?P+sIlJCmPMTDJfda72hO/VMMLctQC5qYRVnik9s4Sslu+Hse/QQEP754Fm?=
 =?iso-8859-1?Q?QcYZK0pVNZyWgwExFWlkul6+8tMWDp1RGw11QnvzqrsMqW3O0cKMsW8hBN?=
 =?iso-8859-1?Q?8iT5gvlSY9MCveCB3ws3prvUHvo6S+pM5WZ3h38cUbBr18XEzGyaWvLTB7?=
 =?iso-8859-1?Q?7IJWWTWmNc+QZYVqVv7ulrGDN1JU7ctULaFebBYw53/xA0dLlLYX6nMSb7?=
 =?iso-8859-1?Q?gbcFque0VbVVviNDGiLYqhhxzufoRmoqJnII0SS7hvtaiCjHcrvCg8e1zI?=
 =?iso-8859-1?Q?BgxHdKthBKD7aKSyPG/CgGreSqAOHVJ55K3IGFIbZpEHDjZp/hVlx4R4DL?=
 =?iso-8859-1?Q?9ibV/9PlNlG0hMPl561FVXbFYHe3fvMHndd8RuHK5WbY7SA1wdAlgeTpBK?=
 =?iso-8859-1?Q?2KOujaypjnJzbAnMmptSaf4eClk5XSwAMKkedQKsv1/XUKnFoaHj975S3t?=
 =?iso-8859-1?Q?eEn57qKKszum2jneg/7Sl8WgYLjxuAZrPvB6TQwof9p8hOuvdSj/8Ok3aP?=
 =?iso-8859-1?Q?Pjagq+L4Fb23vFHGiVOuEWBFt+o8+lrsaI0u28OE6lioU5EWZr8kYTaH96?=
 =?iso-8859-1?Q?GhoxZ+L0/7cxBYURp7UOEA8tx1MgHiDGGmF0zJEzey0ESIla30VVyw2vSU?=
 =?iso-8859-1?Q?Nq02DTl7sMLqBVbIlBNKwztbqkqt2KTtaJzkhu+kHdIONLpuOaTFERK0QV?=
 =?iso-8859-1?Q?77HcR+OqpEv31ZIjtnWgZy+s+UuSaHEnb8/pLzoNe2VR0+a1RPzr4ZRVFV?=
 =?iso-8859-1?Q?QT4k3wpvy/ZHbzauES91VxyKZ8c3rvNSF1ATKDcHjftk1Zgs6G2AtVwxir?=
 =?iso-8859-1?Q?O2+/pQ6t4e1u8chbhXxWr3H8VFFzQvhopRFYNaoqxNeywf3Rl//wmt00tc?=
 =?iso-8859-1?Q?tsk/Cv88j2blA6MfZV4HGK/Xp+5h6ha8OzlNUulWpR7o6fFv1WynVNafhP?=
 =?iso-8859-1?Q?s2ja6T/nE6KOuqjx0BrRYqzjzt5/LjQUsjJmj4BK0eLe8iTI619Qd5Utlo?=
 =?iso-8859-1?Q?v+qK+3tMIud6bhXLdQPLPgKdbA2oHBqc738qxAHS6+XMM+K/03+GHuJQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 891202b9-6d8c-497f-eb14-08daf8c038a0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 19:22:49.6793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAleAX57DEdLE4d2AE62yvQkO1AsIabRjAXHh01PLcVEmLsuIFQeYVuugho5LU/J8FacapRNCzHMoJZA74arejmGrc0lnor7cisUVbtvCxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7175
X-OriginatorOrg: intel.com
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
Cc: Gary Guo <gary@garyguo.net>, Nicolas Schier <nicolas@fjasle.eu>, Masahiro
 Yamada <masahiroy@kernel.org>, Guo Zhengkui <guozhengkui@vivo.com>, Wedson
 Almeida Filho <wedsonaf@google.com>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Wedson
 Almeida Filho <wedsonaf@gmail.com>, Kees Cook <keescook@chromium.org>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun
 Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Luis
 Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 06:51:44PM +0100, Michal Suchánek wrote:
>Hello,
>
>On Fri, Jan 13, 2023 at 06:18:41PM +0000, Gary Guo wrote:
>> On Thu, 12 Jan 2023 14:40:59 -0700
>> Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> > On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:
>> > >
>> > > struct modversion_info {
>> > >-	unsigned long crc;
>> > >-	char name[MODULE_NAME_LEN];
>> > >+	/* Offset of the next modversion entry in relation to this one. */
>> > >+	u32 next;
>> > >+	u32 crc;
>> > >+	char name[0];
>> >
>> > although not really exported as uapi, this will break userspace as this is
>> > used in the  elf file generated for the modules. I think
>> > this change must be made in a backward compatible way and kmod updated
>> > to deal with the variable name length:
>> >
>> > kmod $ git grep "\[64"
>> > libkmod/libkmod-elf.c:  char name[64 - sizeof(uint32_t)];
>> > libkmod/libkmod-elf.c:  char name[64 - sizeof(uint64_t)];
>> >
>> > in kmod we have both 32 and 64 because a 64-bit kmod can read both 32
>> > and 64 bit module, and vice versa.
>> >
>>
>> Hi Lucas,
>>
>> Thanks for the information.
>>
>> The change can't be "truly" backward compatible, in a sense that
>> regardless of the new format we choose, kmod would not be able to decode
>> symbols longer than "64 - sizeof(long)" bytes. So the list it retrieves
>> is going to be incomplete, isn't it?
>>
>> What kind of backward compatibility should be expected? It could be:
>> * short symbols can still be found by old versions of kmod, but not
>>   long symbols;
>
>That sounds good. Not everyone is using rust, and with this option
>people who do will need to upgrade tooling, and people who don't care
>don't need to do anything.

that could be it indeed. My main worry here is:

"After the support is added in kmod, kmod needs to be able to output the
correct information regardless if the module is from before/after the
change in the kernel and also without relying on kernel version."
Just changing the struct modversion_info doesn't make that possible.

Maybe adding the long symbols in another section? Or ble
just increase to 512 and add the size to a
"__versions_hdr" section. If we then output a max size per module,
this would offset a little bit the additional size gained for the
modules using rust. And the additional 0's should compress well
so I'm not sure the additional size is that much relevant here.

Lucas De Marchi

>
>Thanks
>
>Michal
