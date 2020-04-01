Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD8B19AAD2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 13:33:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48skbF5c6nzDr7G
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 22:33:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xilinx.com (client-ip=40.107.236.78;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=michals@xilinx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-xilinx-onmicrosoft-com
 header.b=NWZUyQVp; dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48skXq5453zDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 22:31:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3cm/lTBRoHSSMfIeRwiFzAAWFjjbkUSieFGbUagKxDCqxRstvsaXobzvyUGGkYMrBGK9FvV68Q/9nPldU0Bhsel2FUC2u5qf91Ai+c51FD4ye7bKJ2Jc+6UKOFOqr+L3SpFqbbbuLj8Dy5gdckjIwkmuPYLYRnRahAtnSDD+eYlzDVkoPpEVT89B/OxOiZuc/mXpvn4z7mzLfWhLq3LhNvNbi5hgdLLs6XIvrlmNDhxw7DaoQWEWsOAttKWZnhqUQDYicJAo8YmKgqpcdzrFxDs37fTmL8GbcJaZRqWwVCVvs6ot7ko1wnN/yJ0BsN6sAVGPMUlwvYMeX88finpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsxNFZRykI0/83ykuJMcgdMC6mPCZVa8LDZEpn4HxK0=;
 b=J7SoY8dMzKLsJjQMExWxbdUhKS8GcBSi3SDzvFf1wCOx4/Bc8Cu050oXMqHnIW/n6LUj8DguZks9ei+nalg3pTlnpt84BVOpWJpQ569r2plL8aPU0HwgoxVKKIfw+XbApgCpf9L59yhbj5z2LPf2Xi3ZQYcwTty058cCZhISEJhrpDkYnpunWdTLYmct9JBogcth1FnwWNDIULWPOvU0HC9WWU/lfO4RlipJ2TBAZ3G3mLYiXcXUIjATfINevkdB6jwKVBb1EZjnYYC4gFLFsJhPJijtmuuwmcBfUhq0vzfzuGOaqVy8Iuv3wly+E02Fr5UxOpFq1Ff91ps1fE6kzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=suse.de smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsxNFZRykI0/83ykuJMcgdMC6mPCZVa8LDZEpn4HxK0=;
 b=NWZUyQVponiN0BjYc6nQ/vuUHyA9iLZ//ysZx9ojTbO9/ROmhE27IbnXn338wbEW+WcoFPZF3XRBiss6FEaQEEdFuv+FkDMcniGmiY1BdpqpxGLzHnC68FBeGJEIzseLAhOJ8SJ/TIBF42KPEojxfQLBq9jBb7VCUXccQqkIdMI=
Received: from CY4PR21CA0035.namprd21.prod.outlook.com (2603:10b6:903:12b::21)
 by BL0PR02MB4804.namprd02.prod.outlook.com (2603:10b6:208:5f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Wed, 1 Apr
 2020 11:31:01 +0000
Received: from CY1NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:12b:cafe::fd) by CY4PR21CA0035.outlook.office365.com
 (2603:10b6:903:12b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.4 via Frontend
 Transport; Wed, 1 Apr 2020 11:31:01 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT042.mail.protection.outlook.com (10.152.75.136) with Microsoft SMTP
 Server id 15.20.2878.15 via Frontend Transport; Wed, 1 Apr 2020 11:31:01
 +0000
Received: from [149.199.38.66] (port=36160 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJbaE-0008If-6u; Wed, 01 Apr 2020 04:30:58 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJbaG-0002uf-JB; Wed, 01 Apr 2020 04:31:00 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 031BUrWL012673; 
 Wed, 1 Apr 2020 04:30:53 -0700
Received: from [172.30.17.108] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jJba8-0002jl-Rf; Wed, 01 Apr 2020 04:30:53 -0700
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Takashi Iwai <tiwai@suse.de>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
Date: Wed, 1 Apr 2020 13:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5hk12z4hj5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966005)(316002)(426003)(110136005)(7416002)(70586007)(2616005)(6666004)(31696002)(186003)(4326008)(54906003)(5660300002)(9786002)(82740400003)(36756003)(70206006)(47076004)(31686004)(356004)(966005)(81156014)(8936002)(336012)(2906002)(7366002)(26005)(44832011)(81166006)(8676002)(478600001)(7406005);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4b9b715-2deb-40dc-cf62-08d7d63027d9
X-MS-TrafficTypeDiagnostic: BL0PR02MB4804:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <BL0PR02MB4804F593C4C82B29D5EFA1D2C6C90@BL0PR02MB4804.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03607C04F0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XwggZbNoDBd/lXHCqSqSaIaup4xSbalQJLtSnsPXJs+sgVjHqLJAHjiXJUHpl83JlhF1y2u9hRU1t0VXIB6xbNoQv4d+adDDaQzYq4zW2jSIjOoJwTs4vIlAToeMyodKHqFmbirHBzs/0j08s95aetKRFJ9lRPulTe0xUCg+Jd3bisu1qlMGxZQUd/6R1qMbqAKf+LDmHPYz5CQdNu65QUmAai4zvgp4aAzog7sADLWdwiYqQJaobpkPxrF8oI+jN/4kkCf7YGT04gq67lOmVCeZla8tMxnTPJKgzXUYVMUDAEZ4d+c6hkJEU7mScYwUYWxvUEBu5SaRxISh4eo6n0BQ8ZwtgVFZO/vRWgggQfzD3E2adIwO9GmJ5UrDFCZAFh3g1fI+oOL9fhyPqy+mv8Kh3UGZOtkgeelxGDzhZT3gnGlbkm+LVw2M234fFOtYbuXM6/I18wCGP5g6AlxPKEnQUH52ilWLCCA1M8/D/uPzb4QPYFC9/R2wXA/68cJy02xtXE0M2jChGjVOGBtYA+tNcj58zR5Jp0WKFBKQY5GrAdnYtZD1Ufe+r2CGjwcEoo2+Ds/zeKCiZr307brklA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 11:31:01.0874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b9b715-2deb-40dc-cf62-08d7d63027d9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4804
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 sfr@canb.auug.org.au, Jonathan Corbet <corbet@lwn.net>, maz@kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Allison Randal <allison@lohutok.net>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, monstr@monstr.eu,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01. 04. 20 12:38, Takashi Iwai wrote:
> On Wed, 01 Apr 2020 12:35:16 +0200,
> Michael Ellerman wrote:
>>
>> Michal Simek <michal.simek@xilinx.com> writes:
>>> On 01. 04. 20 4:07, Michael Ellerman wrote:
>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>> Hi,
>>>>>
>>>>> recently we wanted to update xilinx intc driver and we found that function
>>>>> which we wanted to remove is still wired by ancient Xilinx PowerPC
>>>>> platforms. Here is the thread about it.
>>>>> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
>>>>>
>>>>> I have been talking about it internally and there is no interest in these
>>>>> platforms and it is also orphan for quite a long time. None is really
>>>>> running/testing these platforms regularly that's why I think it makes sense
>>>>> to remove them also with drivers which are specific to this platform.
>>>>>
>>>>> U-Boot support was removed in 2017 without anybody complain about it
>>>>> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
>>>>>
>>>>> Based on current ppc/next.
>>>>>
>>>>> If anyone has any objection about it, please let me know.
>>>>
>>>> Thanks for taking the time to find all this code and remove it.
>>>>
>>>> I'm not going to take this series for v5.7, it was posted too close to
>>>> the merge window, and doing so wouldn't give people much time to object,
>>>> especially given people are distracted at the moment.
>>>>
>>>> I'm happy to take it for v5.8, assuming there's no major objections.
>>>
>>> Sure. Just to let you know Christophe Leroy included this patch in his
>>> series about ppc405 removal. It should be the same.
>>>
>>> If you don't want to take that alsa patch I can send it separately and
>>> this patch can be taken from his series. I don't really mind but please
>>> let me know what way you prefer.
>>
>> It's better to keep it all together, so I'm happy take the alsa patch as
>> well, it's already been acked.
> 
> Sure, please go ahead.


g8.

Thanks,
Michal
