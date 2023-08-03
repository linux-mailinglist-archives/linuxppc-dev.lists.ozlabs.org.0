Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B12C76F671
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 02:16:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZGspNGsR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RH5ql0T6wz3cNk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 10:16:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZGspNGsR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=giovanni.cabiddu@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGlVG0mTTz30Nr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 20:30:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691058630; x=1722594630;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wUOrzPuQNyPoyunb8QgHpza+TDckszmU8J98EMridjM=;
  b=ZGspNGsRJualBzhj/oTHQv3Ye8zN/QBDLTDmB2wtEg7DwgINTlbAAUwI
   7t6SCF3q8MfYOJnpLzulHgYBi54o7Tt4cnlJokbJO07OxIDnUXSeWT3uZ
   gxqWpZDU+6VLwVSngcKwog4nm5hZPiqVKmYWfdC4eqK4YK74eFveoKWzR
   L14QNvPOn0wUP/kKmx3B08zMPj9LujMfRorvC1uGJOpZviBu9DXTSCZPD
   U82bh1jHZAto3+qIuiK5SvPmQPLmY1EWmW4gbPF4z7nci/Pi+BHA4gPpW
   Mxk/3b364EBdc9Aii1CEOj3y0X3LUmLdfoc2vX5tGRGdx2G0TEz2b6oPa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="350129226"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="350129226"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 03:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="729514972"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="729514972"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga002.jf.intel.com with ESMTP; 03 Aug 2023 03:30:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 03:30:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 03:30:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 03:30:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 03:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtJE/hKNZWjLWQmkwgy4q0DnT74gSMvT09NsY0t0q/ffSl1QhsUxm/ED7Mo66y9x6JiIJ+TghTKEvmyP9WVGT06H78GWZbxCZm6Rw5SMO/7B787yepPyTqE3Hx0kUiVi0Jbb4efJL4coQT2B1oywSzGGoVd1uhQ9FUiiIF3NGPk5iyVBQ/ACUFrusm4j3zXDRxOMLtdtk7rYToH6g3u4Li6kuf8L9NuXr94I8lzIJvj/ND/9wSdDGSQDRNJ7G4Ql94YMpWlwDA+ffPaF9Ca8+SrBiAoe2BZIVu/v3BKPju2NBPexqwWKO24NE232O8ppEt2rNGNmUKPFmtOMmR8tKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVk2R4zQDwrxXvWRgnNwwZsbLsnf3ESIQPTqBvfcr3U=;
 b=i85/P0vEMPavpFkEn0NzYWbacqcSgtQBpXJ04m5EM0lV4TUsJW7X3HP+797FUq9bSlffSQMEU74nP1qGh3A9+k1wmA86LjvQjlkZxe13Etp4O+fS+Go8S/UMJzScsCiUAI1fymw/h4QnNLOi6KvbKuBqX3FrK6UXdk2Ov9h0qzP107kckgxf0JfuZW/y9abvBrUSxSh537McJ7vZHKr2GpqHVBe9HuV/1LDCqFHGcnC9jorzfyy1JrRPu1a7LsbwnwTgj8JnBNPEw67PFbUfgsNWEALw9QvfKsoFAFxxJCm4FVjOOai6vRRRsEM/hb+8S95O6Pa2tm8GwFpXklP62Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DM4PR11MB5470.namprd11.prod.outlook.com (2603:10b6:5:39c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 10:30:15 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 10:30:15 +0000
Date: Thu, 3 Aug 2023 11:29:58 +0100
From: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 01/21] crypto: scomp - Revert "add support for
 deflate rfc1950 (zlib)"
Message-ID: <ZMuBpm2No70LqgZI@gcabiddu-mobl1.ger.corp.intel.com>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-2-ardb@kernel.org>
 <ZMt4nkfpdCXxAkr5@gcabiddu-mobl1.ger.corp.intel.com>
 <CAMj1kXGn70sGAHgOttKkC6n6jfVZ9Y61NZ9ffLmJV8MK2Kh8nQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMj1kXGn70sGAHgOttKkC6n6jfVZ9Y61NZ9ffLmJV8MK2Kh8nQ@mail.gmail.com>
Organization: Intel Research and Development Ireland Ltd - Co. Reg. #308263 -
 Collinstown Industrial Park, Leixlip, County Kildare - Ireland
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To CY5PR11MB6366.namprd11.prod.outlook.com
 (2603:10b6:930:3a::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6366:EE_|DM4PR11MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: f5644f60-862d-4ab8-cf5d-08db940ca069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LVAapvwTty3Y5x9A5HPOXg+hBOQjNW5QbdPCLuq7MhWzmq/GuZCsFWL2iUwxSzBHiltHoml5W1fH22Q7dxDqZup6fuYYv2ImOG2Y9e/n8pCNTbVUJwiKYDW/j1A3/suR1TY6vgJU4gKX4ET/N+bRehTPIlt9LZEUV5EO90z78dLIUfdxWJq1Sn6DRRVME3mE8JkCLaP1wTGlnfb1ylS3vO5YzXXed8zN9SQvxkbZ8gAXZE04At1LCIj+kXNI76IGdcyMOLCrEBBTtJiwHyyBgze0UaqaV5J3RlcKqceVoImtIRUX8DndkxdmED3s587bK1iKJ768UwRXPuyWwaofmOPSvEeJO0v7pAPhMi1BnhKj07Np1/N9JqQGiZ1AFrzMK8Ezp0MlgWUzXQ0kkbGFX0sjOQx5H2KbpXJLj9aMif+rTyR2YCqvMgW/dT8nf2plgrSXIna1pMQjTwP2VrJZDMEeBEBg99BoYTmi3WtKYTh1tOpZ82LtLIVJYZ0HrisUQYVW7fUyaEwmTrNbp9ssQmAhNx+hcIFSsXZ/mvRkKzT9vq+p0Q1t/P1s0HI/Fg7o
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(36916002)(6666004)(6486002)(6512007)(41300700001)(38100700002)(82960400001)(6916009)(66476007)(66556008)(4326008)(66946007)(316002)(54906003)(478600001)(5660300002)(26005)(186003)(6506007)(8936002)(8676002)(7416002)(86362001)(4744005)(2906002)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/SaLdTM+a8wA9jvBsM/zFvBk9UPJzIDXLR5Woi8hMriMpXSnjAy+6qe5ooq2?=
 =?us-ascii?Q?i01lptc3BnbCSruWaqAYBo2tThD+WrX5xtb7EIbPgs3YUDfBAZ3ZHO+Se1KX?=
 =?us-ascii?Q?5ugnSzvAsKlZZK8paP3bu1MzAF+f2lXupiZVss8nbh3HNTEl4ISuCFV2pDhC?=
 =?us-ascii?Q?c9D5qGFfhJ8vVFT1dBT9uXuP0sLAUDWfBEUy+CFxfdw9XYRKVgsi08EigBwt?=
 =?us-ascii?Q?+oi2tKtUmzTtXtN6ara9JyqT6mSV5wQ07lFneJ6Y2Xjq3DQvZNRjHOVKH6al?=
 =?us-ascii?Q?Yv0dgA8UeJJ/Ii5iHLBXhgfnvPHZNlDwBWv19Ep6h8ZRGkh3wsCfBynk9bCd?=
 =?us-ascii?Q?QAahWpb2j99ljZcAvgyK1Q8WMK9JhIblx2LHXKU2YF/luQjJz9KIySFXrXGI?=
 =?us-ascii?Q?9hBLFGwLX3mCbm8hTw9q/d4/Ak1wDU8KPiV/qKhhiVLKYO9TUceT4i5plcJS?=
 =?us-ascii?Q?Y2lbpvg8UVRuq286gwIcKAX7fTPK0xx82spLtu7umqWh70ljzHJK5ukowt2n?=
 =?us-ascii?Q?RoamfIG/rZY+b9PNItgxcdScAwhcT3uK/VbRG8OkIXmLepyCcUWA8En5wO8e?=
 =?us-ascii?Q?ov2vNnE3gkWm/RbMeUrmMCfpaY70AWwPJjc9S5hjlIyVKpaYyk7MyjMeHj8N?=
 =?us-ascii?Q?zBcs7zxmuwYgwn2Ny/ZePB6+2oyDYcWVaYZNBQvOXvMSe1KPUL+VsrZFtKrT?=
 =?us-ascii?Q?o2ECzDKVyr/0SYF/vCSqzfR1eq/eZEYkPllVSp5JF46dJT+ncJW7GrZ9hyFS?=
 =?us-ascii?Q?7mxJsQPdiCRKGl1lFhzCsHW4K69W6JIr1Zyy/7kZc0ZSZ5cpz04j2y3o+ROA?=
 =?us-ascii?Q?Hh7yKLH33MIbSCtxNF8n80x2tG1KOiHmNyrqux97YYfLJD141pICajOCJohD?=
 =?us-ascii?Q?wbkWLTn2NiLL4qRom0oKvlNI9cuBTapqlyxD4NdtuCobw0YXuQlp61KAsPsI?=
 =?us-ascii?Q?9MK6nSgHD96EzkCN1JcftpfwPCTvMx6sq+tZ6Qbqb1Exq5AD0Z4X07H6+SgX?=
 =?us-ascii?Q?juE2p1m2AuwuXH7xA/4asZuJXnXRpc2K5o41wK/iJT27ZLqi59g60Uhw+h2W?=
 =?us-ascii?Q?IcB7KwZjhAHbKYmZbzRYRbuVEXiO1m5VWPa5X8sZgrzPBKcANfrbhJ1mz4BN?=
 =?us-ascii?Q?0nm2mZBPz9TzgQ+rZcvfHuSfUAOqLh908rI1wF8EsWVGRx3nvMGrfndMTEbQ?=
 =?us-ascii?Q?qNvVcuDECcsYwtzD/t6+GSvzIj9ZzU5UuVsX+Ypuj8WwDMPxDOjsi3zA+IMv?=
 =?us-ascii?Q?BPxUjnq6JdwovOSQiMdlpk+Qy9yjw5pJ/0zDdH+TWgRUKUieiYhsmsaLGhZs?=
 =?us-ascii?Q?7DU/QmC60AQoDFbTBgzFsKNwYjWvTASoAqoxiERczKe7OnMwQCXfmJBqZj7L?=
 =?us-ascii?Q?Y0bOzc7HWBHg92qnjzqX2DFLwWhN/zm1z4yZvmMhYJAWcOACdQmDvLk7TYIk?=
 =?us-ascii?Q?5RkAH6D0UazcOhxlUbwdM2somSy7HTLb8Q0tTKklllSVM0m/ADiUAOfxoDJi?=
 =?us-ascii?Q?fMG3oZ5ZZeUZmciz4wxGWQzpC0Lvpws2bom/5d31vC8QM1PPjHqaK9zZebT6?=
 =?us-ascii?Q?Cw88qeEtePr/idGjSji7c2qhsDbv86EPB1ZwQaxY2EWYRCc6uHrEm6CNkDde?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5644f60-862d-4ab8-cf5d-08db940ca069
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 10:30:15.6576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wC7Wmp/4s4q/YDb+xMBiQnhtPz4UklCuliYVrVuaTIpwGSuJHj1AvSl6OTVgWKAS9+FUytYOijSL0x0Uli5A++G1qevIrT+vgMqA43IDnNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5470
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Fri, 04 Aug 2023 10:13:42 +1000
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
Cc: Jens Axboe <axboe@kernel.dk>, Steffen Klassert <steffen.klassert@secunet.com>, Kees Cook <keescook@chromium.org>, qat-linux <qat-linux@intel.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, Minchan Kim <minchan@kernel.org>, Nick Terrell <terrelln@fb.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Jakub Kicinski <kuba@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 03, 2023 at 11:59:00AM +0200, Ard Biesheuvel wrote:
> Any clue why zlib_deflate was chosen in this case?
I believe it was done for integrity.
The output of zlib_deflate is raw deflate with an header and a footer
defined in rfc1950. The footer contains a checksum which gets
calculated over the uncompressed data during compression and checked
after decompression.

-- 
Giovanni
