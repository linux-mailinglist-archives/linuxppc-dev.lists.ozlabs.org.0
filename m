Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D83166A1DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 19:20:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtqTq2BLCz3fDV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 05:20:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=0HXLH4mT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=garyguo.net (client-ip=40.107.11.112; helo=gbr01-cwl-obe.outbound.protection.outlook.com; envelope-from=gary@garyguo.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=0HXLH4mT;
	dkim-atps=neutral
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (mail-cwlgbr01on2112.outbound.protection.outlook.com [40.107.11.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtqSp50fPz3bWF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 05:19:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4tiwesCtz+Njfm7VO4MqGaZ0Fm8GoTqF1Rte4VXUJiP4qE5gufW8csVPZjFyF6Cwo8KsA9wzTpUgduZtYftFBBtEf8+/YW/RyxDAvSAgvMLsqb9xpL0N8jcr0Yeldy3BxVBpGxftmETDlfeQALiuhVwkfxGswovD4AFEnCFGy+YsX4R/KH9OzPeDkr6LnhhkuMeEMopCGUKDofdEqrfOhkVWDvbffMfQJuV9zCZuGaApA0WZHS33X7oWflxu25ga9bI3WYVxyCOzWkiX5sZT0pSqx/nTDxy3sK40AkaNPMD2qlnvGlQCRwYi+Imjgh6tyccUSyMHPrayRyRWV9nTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4M03HqJ6DWROxB/SwZaIPlgw9/1z21JDfb5VsRm59yc=;
 b=badOGi5HiXzE/Auiz7vibp0BRT+2/Ez3NlH19ZsHE6el9IgNYWU/AY86lYhIaDaGB88sSlyDhUmV0pToYZWK6Hn1AVy2qCxAYP8BPfdmgn9GBU3WATSIF2c03/ljOLTY2xKymvgBlc+yqb27w0B1kErsPUzERQLT08ScPRh4ohF5vkJhAoFROxfOKk1LbgKhuIJyS9Ls3U9ZTrgZJBRJ+b7UbysTXII+Gy5pj93ecuhVF0tJTTmA/T6KKNl3O0/b6Fgcz9Bg3eQUTFPfdzv2Cs3asNmhwwSHgcMokWfK+lHHrRemCUY/wKOKzz3fLDrUZV8xIJhCg9jajkIuJupK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4M03HqJ6DWROxB/SwZaIPlgw9/1z21JDfb5VsRm59yc=;
 b=0HXLH4mT5o8yi8ijVzJBNCOqdglEGo3hjMjG2Uzff9cLznGIaOiLdZ7L//A2nwaKqEwuOEj6JnrxXHsYQqDffybBvX8r84K7GPfvrntZh527h04kmnwVnj+P+7qLLEKfBi1AWBp9ed8C7o7HQ6bhRKMC5AfDFuZmr2A7rCBbRCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15f::14)
 by LO4P265MB6462.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 18:19:15 +0000
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d617:a3c0:4110:bfe]) by CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d617:a3c0:4110:bfe%4]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 18:19:15 +0000
Date: Fri, 13 Jan 2023 18:18:41 +0000
From: Gary Guo <gary@garyguo.net>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <20230113181841.4d378a24.gary@garyguo.net>
In-Reply-To: <20230112214059.o4vq474c47edjup6@ldmartin-desk2>
References: <20230111161155.1349375-1-gary@garyguo.net>
	<20230112214059.o4vq474c47edjup6@ldmartin-desk2>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::11) To CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:15f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5186:EE_|LO4P265MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 21713808-c816-4500-e97c-08daf592ad56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wd+BW2sDytCSAmVs8dJ/vYtHn13Fhfzl1/26G0OJKtfhQ2tDFGnBg6EfsmTXhLg/zm8I6O0CtwGCVovFXNgKTVg3tEFuXvT+hQ83osct6lfA3wsdP5cp/wM8rSz5RJ2yGQGxJY4NFi7Pc0DaNHrOmE3LbzTOvjwwEZBHu6ZPN9zdPPAKoQhqAs8/V/P2M8cMqZnRSjxVxeQZXIWmUzrMGDvLTPhvP37TK5YO4FdIfwFX+KkV9EnwJ7CO04kTyD2abWtvcxV9mzCk6LBiDDgnvEvJ1Png1aQqCo98cxlvU89lhf7Ue7PLBM1ddzhekAetvMEgH/W39sCjJqnlHJQZ7HG7tGVlt31RfJXkx3LhLcYQLFDIcfAx/9eBe9s/jprzQMDEG9pS+YrItP23pi9GZCyUfsooNk1bSDDrXf4erbA8nTnTIWGYfDoylDcA0y93s7U9SRas1iGiYGkkfDXh7Sgncc4UVpqnNvTIgol5LqZe1HOx/PLfyLjFf9vybHHQVi+dvaQdiY1h+aI5wEJpjRD/Sapkk3K5/FPB2oZ1BNkxMSPVVBhtvmIrLb+SUuUFlwt/JByiw6D26UQs6KglqlmwPOdJcox/MlP8tQFKCiemN7gHUlSJQr7D9Cf6rANr
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(396003)(39830400003)(346002)(366004)(136003)(376002)(451199015)(6666004)(6486002)(2616005)(1076003)(36756003)(478600001)(7416002)(86362001)(8936002)(5660300002)(38100700002)(2906002)(83380400001)(54906003)(316002)(66946007)(41300700001)(8676002)(6916009)(4326008)(66556008)(66476007)(6506007)(6512007)(66899015)(186003)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?URfMC053dfIAX/Sni3sMvF966UvWtHLbbdvoCH0d5F5uq/3ZvmH4HZ0ryaAH?=
 =?us-ascii?Q?H8B2LBqIHr4CitEppEmPcVMJk8858iQN6YjH5nZSHZVFnKGthowl5/C30GdN?=
 =?us-ascii?Q?iAQ5wAEN1T+jCUvjgaE8wfL3YP3SgpQZSAx5HjQBL5iBoXr8oyeqerYMuZk7?=
 =?us-ascii?Q?uHfIxta6zv2zf+UoqMJKtwz8P0M/rFD1Yg4nalUar/Un0wcafssHrpMCU5We?=
 =?us-ascii?Q?eM5qBZKCR292WAhkrESn8rYdgQZySTsH62h2qVEwcY6GglqNIC/78RdsgOvV?=
 =?us-ascii?Q?VNQaG+9NIK6XF5wv9a4NX4emFfdD09BPxspVipUfDBBeA8hcmh7rzyyoHrVU?=
 =?us-ascii?Q?mgHL+JbdLjlAWoD3/Ts+cAVwRTn4Q/8uZKIJCczfcMjCfn9aOvUAXS/tu/Se?=
 =?us-ascii?Q?VNUgDv0frXEpGx27ebSq7xDcQY85Xnr6of1nVxXOKSXH2sHGHO3Qufd/nn61?=
 =?us-ascii?Q?PX2b9v/Uxn6Q8bNZqyszquyQysVEC+/GUFBI2BG1Rz/pAH5ENSE9tmTLCfGm?=
 =?us-ascii?Q?H7OwyqV466jsj7Wc/N3fbG0wRgBp1yL17Rvvnnm6WrjM5yqFWw6BYlA58guV?=
 =?us-ascii?Q?3djzDyPlk7BTs4AqZ/WaTxEYeRhm+zATPQz+KqUZMV1JW7IqFM8Y1s8BvRiU?=
 =?us-ascii?Q?xZ5OYMpxvEfmOaNvbBcAq4D1OS1hbvWHZvpla1dwuFqfIYrtt99SjiC7eHY/?=
 =?us-ascii?Q?jfLgVbX6XW4LHdr7k1xwBgX32ljyQDNzVn06NBTNv0a5gfxRUKNOUFovt0jJ?=
 =?us-ascii?Q?acuiPEN4fHxCkEd3tsySTqN1vAPOT+/Y4YHIKPmMI+yYcjucBAaxYnNBi2Uq?=
 =?us-ascii?Q?3XfC1F0WQPFUqhcOz+qVsqjPSzaTr9cKD719Z4T0rH5G+hr24Bh44hkHp+JQ?=
 =?us-ascii?Q?AqxmRZql7cYOKJz49KpvvZoT2QzT+oIH7SRIsMsYPDok//AEJF7db+2EYtQD?=
 =?us-ascii?Q?zRIsb3iBA9CwFAJgi5k5mc7HYiQwCP96hDupfQ6Nfn/69C01QZsBECyqeRU1?=
 =?us-ascii?Q?sEkVA36HLAA0T36kLTdotlnKwfM1fwvOI7ytMgq5nXpGcYFFOSEC0TFtwZos?=
 =?us-ascii?Q?LswUJiCxuFU3pRF6pyXSxNe04DWD8f6DVDRGcnC2giHE/Eyee0L0V34rMKqa?=
 =?us-ascii?Q?98hJFeb1FOZjG7UX2vdaWU/m4OM9D6XM2Wauh8R2A0/vfu3amrD+yR8QXvsK?=
 =?us-ascii?Q?UZFIux01/C4XThFvFeVlYf67+L1X1G8jz7hricBiKwtVbP8bGYOcjd06gBxA?=
 =?us-ascii?Q?ZekXFNcZ9PYGMVbOSn+YILkELmq3SVoscgXMkBYoTChRthlclLDKPlRVO1AJ?=
 =?us-ascii?Q?NLm1dMv0/gLoCyO+8au0A/PM2Vspiz0p5FtADveCbdr/iuqz67ot4AUK2t1D?=
 =?us-ascii?Q?gXPP2BFDLdb7Fy7ocPs+FpYbHKIlAVJLs/BIK065vaNJEA/QSPwK0MDWZ3R+?=
 =?us-ascii?Q?LvGG8GWaDJaFkkdIO7dtliPci0jwt2IuTflcb5tbiSSy1K1av/tqE6M66jMv?=
 =?us-ascii?Q?9hdM/ZLTmlqO0llXIIb8ONXep9Gx73UNQTRTDOwlxFeOaKkztxbjxXFcyeRv?=
 =?us-ascii?Q?rUPwdYKq4kVoWsGBj7jAfSMYOTq6E9qNRpSI+2+Q?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 21713808-c816-4500-e97c-08daf592ad56
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 18:19:14.9780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INsR39Nd1RNWA/FHpYYE1zIMaUmpbjoLKSchGm8X8WbxwD0OmSol0oT7MsQcngKjF2aLM69q5o9Wwa+QoJydxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6462
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
Cc: Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Wedson Almeida Filho <wedsonaf@google.com>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, Guo Zhengkui <guozhengkui@vivo.com>, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Luis
 Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 12 Jan 2023 14:40:59 -0700
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:
> >
> > struct modversion_info {
> >-	unsigned long crc;
> >-	char name[MODULE_NAME_LEN];
> >+	/* Offset of the next modversion entry in relation to this one. */
> >+	u32 next;
> >+	u32 crc;
> >+	char name[0];  
> 
> although not really exported as uapi, this will break userspace as this is
> used in the  elf file generated for the modules. I think
> this change must be made in a backward compatible way and kmod updated
> to deal with the variable name length:
> 
> kmod $ git grep "\[64"
> libkmod/libkmod-elf.c:  char name[64 - sizeof(uint32_t)];
> libkmod/libkmod-elf.c:  char name[64 - sizeof(uint64_t)];
> 
> in kmod we have both 32 and 64 because a 64-bit kmod can read both 32
> and 64 bit module, and vice versa.
> 

Hi Lucas,

Thanks for the information.

The change can't be "truly" backward compatible, in a sense that
regardless of the new format we choose, kmod would not be able to decode
symbols longer than "64 - sizeof(long)" bytes. So the list it retrieves
is going to be incomplete, isn't it?

What kind of backward compatibility should be expected? It could be:
* short symbols can still be found by old versions of kmod, but not
  long symbols;
* or, no symbols are found by old versions of kmod, but it does not
  fail;
* or, old versions of kmod would fail gracefully for not able to
  recognise the format of __versions section, but it didn't do anything
  crazy (e.g. decode it as old format).

Also, do you think the current modversion format should stick forever
or would we be able to migrate away from it eventually and fail old
versions of modprobe given enough time?

Best,
Gary
