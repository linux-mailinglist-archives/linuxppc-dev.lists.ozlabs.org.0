Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B11198CA7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 09:01:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s0cc0rhtzDqdq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 18:01:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xilinx.com (client-ip=40.107.220.54;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=michals@xilinx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-xilinx-onmicrosoft-com
 header.b=RVI5RsBx; dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s0ZX09lmzDqSY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 18:00:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbVHZvYQSo8WEaG5tyBaF75ebj1E6rEOguJStGghRBXxI5lG27RViebd0+hRVILVis/1W1VzjZ13AcYpk0gDnfQ8+NxgIaeWTbgJKfrV8FAEFkgatX8L0l3SnW82HhSDafPhfNzV+o81T4U6nW5ka+RwiQcLfnvKMAfZBfs46YQfiJimNCkQ0qnkd/TEq3fxS4oqt64C+plW/gFRJNmfr++tDnjC6XJQuQkWvfE6dYVdUjsPRl6Rfx76rvvMbyNSwvs7sHVytLfYks3UOqm4SjzU3ReKHGsAK13iOB/HDEeS+wGd0HGmjCLou5QG5IGGACA3T3+vvzot6jPiIJfNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDgClzBf/Hti3579BZ19ywYfTGYv5EUbB3FPmLePVDE=;
 b=ksdZn/fejDxiUA+GscFQBQAJSKMLqoxWX42V6I1WH4HllO5E8Cr14MZwA17JRYmNgGtlSjW/RpMtDPK2HZPtWNjQnMkdCmEt/+AH6suirEOh+34nsv19gnSkKmb5SjbfhJ8YZhiu8Ekd5F6j8YIE0GHnJQRrp8jr9Ghf52SluHZJzZnEB1xeq3EF2u0AY619RE3IXwF2IaH5D5WMIfE2hqbmT4aJ6TVvCfU0U+SRzy0sO833eSCAhQU0bXHB9h7pxgMVjB/sSgk1o0Ai3jsAGRsCcJFHs3haFx3+JVR89VP5jgUasc3WSMcbVu1rDnYns3+w9J73RzCc5rApAd1htA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=c-s.fr smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDgClzBf/Hti3579BZ19ywYfTGYv5EUbB3FPmLePVDE=;
 b=RVI5RsBxdSGY0U2xeeg0M+ok9Lqoi1PuwW7hLBMbt2SBm0BqpeEp5YGUxa6+frKB8coh/mNVksd3F1gW51nwwYdyTxCVE+tqfHndsnXTrD5Ut/CJEV1Q3ajNTeNW1U0IGqoZr1TYUaQ2yR//Ltm4eg6FnW/yagU5H0czyU7SMss=
Received: from SN4PR0501CA0032.namprd05.prod.outlook.com
 (2603:10b6:803:40::45) by BL0PR02MB5523.namprd02.prod.outlook.com
 (2603:10b6:208:84::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 06:59:57 +0000
Received: from SN1NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:40:cafe::e) by SN4PR0501CA0032.outlook.office365.com
 (2603:10b6:803:40::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.12 via Frontend
 Transport; Tue, 31 Mar 2020 06:59:57 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; c-s.fr; dkim=none (message not signed)
 header.d=none; c-s.fr; dmarc=bestguesspass action=none header.from=xilinx.com; 
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT027.mail.protection.outlook.com (10.152.72.99) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2856.17
 via Frontend Transport; Tue, 31 Mar 2020 06:59:56 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJAsO-0004WQ-09; Mon, 30 Mar 2020 23:59:56 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJAsI-0003Q5-Ss; Mon, 30 Mar 2020 23:59:50 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02V6xiVp004073; 
 Mon, 30 Mar 2020 23:59:44 -0700
Received: from [172.30.17.108] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jJAsB-0003OK-Jh; Mon, 30 Mar 2020 23:59:43 -0700
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <adb18d3b-fd30-c328-cedd-bac5d8611fa2@xilinx.com>
Date: Tue, 31 Mar 2020 08:59:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(426003)(316002)(186003)(110136005)(966005)(2616005)(26005)(54906003)(4326008)(6666004)(478600001)(356004)(7366002)(8936002)(31686004)(336012)(8676002)(53546011)(44832011)(47076004)(82740400003)(2906002)(70586007)(7416002)(81166006)(81156014)(31696002)(9786002)(7406005)(36756003)(5660300002)(70206006);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79617cb0-b9ca-4211-a17e-08d7d5411f19
X-MS-TrafficTypeDiagnostic: BL0PR02MB5523:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <BL0PR02MB552360521C0297D1FE74A6EDC6C80@BL0PR02MB5523.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0359162B6D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RoxM6hOZlHdjJ8rjXjfETbqRf1ywO8mmR6/uTeNbVdkNR2R9Pn8vHx3wJSF5SXnwJf20P082QK4A4TvLPgiY97WlZGw+VZDQNNWfvADw3qXBHeK0m0CEpDEI2OmJ3e1wQqlNIiw17RepTVJP/+egr65/geJ98UWWN5QjWfOUg+NzTmUSLfCdSLvuXfbLJZkjiQhawG19ff5DFGFqyqkx9E/OBGooDbE/KSuuznKk4Zzas6LTG+Gd1pvv3lrF3FFb0TLruvSWbVHklISJxdrq5IMK267vPWe5hnN91rDFPOu03yTlURFYnhYe/gHDqnu3Y4n21Y/rDbq2pPSSEYiVZVlqDG5Dz2GRqQxMmcDswudr4u8UPWPK8qlomIpd5XbIMv+bW7IZkSwYTGAXuAHwP/JvTiQzlQXI+pEgLdEWlKIFbYhulSjRwHuKdge9lSoIs1d7BLPfScfkhK9XBJYZe7Sc29q85vj9VaG5Z20NIkY2dUuALD3LgbUIGdSvCVSomt4IthhosEPNG98H/mhsMc+Ysp9EZfmcrYGO2/ZGriQguEGH9UcuQ11JUFXgdbdqt41trJlQzRbFWRB045L69pq+1o/kFGmFcmm7vFS26Y=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2020 06:59:56.5449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79617cb0-b9ca-4211-a17e-08d7d5411f19
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5523
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Leonardo Bras <leonardo@linux.ibm.com>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Michal Simek <monstr@monstr.eu>, Wei Hu <weh@microsoft.com>,
 Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31. 03. 20 8:56, Christophe Leroy wrote:
> 
> 
> Le 31/03/2020 à 07:30, Michael Ellerman a écrit :
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>> Le 27/03/2020 à 15:14, Andy Shevchenko a écrit :
>>>> On Fri, Mar 27, 2020 at 02:22:55PM +0100, Arnd Bergmann wrote:
>>>>> On Fri, Mar 27, 2020 at 2:15 PM Andy Shevchenko
>>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>> On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
>>>>>>> On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
>>>>>>>> On Fri, Mar 27, 2020 at 1:12 PM Michal Simek
>>>>>>>> <michal.simek@xilinx.com> wrote:
>>>> ...
>>>>
>>>>>>>> It does raise a follow-up question about ppc40x though: is it
>>>>>>>> time to
>>>>>>>> retire all of it?
>>>>>>>
>>>>>>> Who knows?
>>>>>>>
>>>>>>> I have in possession nice WD My Book Live, based on this
>>>>>>> architecture, and I
>>>>>>> won't it gone from modern kernel support. OTOH I understand that
>>>>>>> amount of real
>>>>>>> users not too big.
>>>>>>
>>>>>> +Cc: Christian Lamparter, whom I owe for that WD box.
>>>>>
>>>>> According to https://openwrt.org/toh/wd/mybooklive, that one is
>>>>> based on
>>>>> APM82181/ppc464, so it is about several generations newer than what I
>>>>> asked about (ppc40x).
>>>>>
>>>>>>> Ah, and I have Amiga board, but that one is being used only for
>>>>>>> testing, so,
>>>>>>> I don't care much.
>>>>>
>>>>> I think there are a couple of ppc440 based Amiga boards, but again,
>>>>> not 405
>>>>> to my knowledge.
>>>>
>>>> Ah, you are right. No objections from ppc40x removal!
>>>
>>> Removing 40x would help cleaning things a bit. For instance 40x is the
>>> last platform still having PTE_ATOMIC_UPDATES. So if we can remove 40x
>>> we can get rid of PTE_ATOMIC_UPDATES completely.
>>>
>>> If no one objects, I can prepare a series to drop support for 40x
>>> completely.
>>>
>>> Michael, any thought ?
>>
>> I have no attachment to 40x, and I'd certainly be happy to have less
>> code in the tree, we struggle to keep even the modern platforms well
>> maintained.
>>
>> At the same time I don't want to render anyone's hardware obsolete
>> unnecessarily. But if there's really no one using 40x then we should
>> remove it, it could well be broken already.
>>
>> So I guess post a series to do the removal and we'll see if anyone
>> speaks up.
>>
> 
> Ok, series sent out, see
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=167757

ok. I see you have done it completely independently of my patchset.
Would be better if you can base it on the top of my 2 patches because
they are in conflict now and I need to also remove virtex 44x platform
also with alsa driver.

Thanks,
Michal

