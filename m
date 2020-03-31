Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE741993F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 12:51:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s5jP0rGNzDqm6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 21:51:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xilinx.com (client-ip=40.107.94.40;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=michals@xilinx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-xilinx-onmicrosoft-com
 header.b=oOqHQZjj; dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s4h81PMGzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 21:05:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmvYxiiDNGMzlSQL5NN9EcBUxS+l6dGCaThnfBNHGPYHE7d4IXXnmM/7GnQwKj99w7j6De1z9Rf+G7Ph/rxHb4BamV4eU7MbSXQnhwPAgr2s1VXQOCikyjjhvM4bzYAcKr2sj9hMDORvfaON+n1FvZHz44VZtwvgrTclKfKigGJo1R1nw3u8sM5O03LRHHyt5Njhpl6GODQX5ytqpXOXXap39VFgBoEv346mYGiDEzOeYdZ/Gyqj2P4LWJtDxnHQTCzsezrJ8/vRITXKT7b9oP4p1Q5QhAzttM6GAUWt+u6Md6AU/1AkxeCIOzSi3jvKFbXpln7V7Z1KiXHnA9sSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtQF7Mz3z7TAW1QpGx9kzi/8nW7DbkGdSDGP2GvAozE=;
 b=MK0TcCbd2l8Z+RjB/P3QAyBktQ2+tUJBfFTKnyF6stdOLzs4YDjMX2yJSYj0d2NylWeNZcQIqcYwcqUrncI1mLwDuGi4bQFujWdruBVvV55Qiy06SuUUfESNPs5Uv8eKmNX+AISGUB1ep/Wgbb+prfwSvJYFX+c738krWAwVy/3HyZEnGF8+iv6w7JWrZ1TBHuFF/BV38i11EVuA5VmGJ629PlYYp5B76y6dNVJ02OX8KBN0N9DGKUjgR7XnyS7gqa1JwWb/mtsdY97BEgppLrNeJnrbGdbS3UDRcb1KmX49n25zAReD1pdmVCJ/onv0Y+K2eVQdltGyEqG3xFOi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtQF7Mz3z7TAW1QpGx9kzi/8nW7DbkGdSDGP2GvAozE=;
 b=oOqHQZjjvCRVOvMZpZh/Re8Lj2UbC2hGxKZ1e43j6XKsGmm4EnGk2SSrBGzChgxwCP+/tQlTsUriV5pTF6uAAXZeJWvCvfHtSSkOWJq4MsPpBN5qFp9BWjYuNeXcTm/rf+MXm+jwi53m9OplzkE/xcwPsl3QAeIRgtiknP0/6Xw=
Received: from CY4PR13CA0036.namprd13.prod.outlook.com (2603:10b6:903:99::22)
 by CH2PR02MB6038.namprd02.prod.outlook.com (2603:10b6:610:12::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 10:05:06 +0000
Received: from CY1NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:99:cafe::1) by CY4PR13CA0036.outlook.office365.com
 (2603:10b6:903:99::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.9 via Frontend
 Transport; Tue, 31 Mar 2020 10:05:06 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT004.mail.protection.outlook.com (10.152.74.112) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2856.17
 via Frontend Transport; Tue, 31 Mar 2020 10:05:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJDlZ-0005gR-A3; Tue, 31 Mar 2020 03:05:05 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJDlU-00029P-6s; Tue, 31 Mar 2020 03:05:00 -0700
Received: from [172.30.17.108] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jJDlO-000288-5q; Tue, 31 Mar 2020 03:04:54 -0700
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michal Simek <michal.simek@xilinx.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
 <adb18d3b-fd30-c328-cedd-bac5d8611fa2@xilinx.com>
 <a1212105-3894-c282-0f1e-a1ac9a35cd4e@c-s.fr>
 <12a1f423-7e54-6423-1c8c-33e221664272@c-s.fr>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <d822c806-14c5-4ce7-b559-090b0685fa43@xilinx.com>
Date: Tue, 31 Mar 2020 12:04:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <12a1f423-7e54-6423-1c8c-33e221664272@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(110136005)(54906003)(336012)(316002)(70586007)(8676002)(31686004)(9786002)(356004)(6666004)(70206006)(31696002)(81156014)(44832011)(4326008)(7366002)(478600001)(82740400003)(47076004)(26005)(966005)(186003)(5660300002)(426003)(2616005)(8936002)(81166006)(36756003)(7406005)(7416002)(2906002)(53546011);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c9f0f8a-afdd-4838-1385-08d7d55afcba
X-MS-TrafficTypeDiagnostic: CH2PR02MB6038:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR02MB6038CA7B9498F0DB2BBC76FDC6C80@CH2PR02MB6038.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0359162B6D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RFZXih/c/iaxVYqpBg1T6IAoNBM53QthFJ2fNVYL+ka54K8bu7NotcOPqp23NtW9uSY8HpFLe+b0Ykv3F+9tN3z+Lho6Cw+Tbe0c3GhXfl+VuLfbMtO4xP4PPyOtgYdui3+bZACpVZCNHNLSS4F8eQll7SmGB1FPpzRWR/Am7BZFRW+RvNi21Fd2I1iubHJpB4GBlqEvabMY43MSj7AYz+vggTqt0IBn0yZpeeVSEG4SN9W1aZSgvxkqLR5KehAJ9TymtQihvo6I1aYk486NATd2EktkYWJ8nQdcbgmQVtA7xU0sDh0mENhGQYS5gA/jsXhYsmzooFN82Z70ZaRqnHszEfsoMBWarsiCda/m6tVhUkVPuiWYX3ShYRBzhFwvvNuANYnF0HrwrVOOr+vZwG8UN69cLFYkY7lP0xgKTIAVgwFoboyR5Bo0/CbY6Y35QqFv6VhsunOuWhcTQC8vdSfjXUpV3gXvaWeMEdGbDjynrFqVm+BNb9xFpwoqvgvdpVJCP+m9Ej/6BcBgjH4RCPCWZfSHn/8xTTF8DLLr/2arFSZFB8AkW/wQtNtq+Plyd2C07y++nOKtoHnYGoFDZyinDvSRZGYHlaal4akoSx8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2020 10:05:05.8101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9f0f8a-afdd-4838-1385-08d7d55afcba
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6038
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
 Masahiro Yamada <masahiroy@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Allison Randal <allison@lohutok.net>,
 Leonardo Bras <leonardo@linux.ibm.com>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Enrico Weigelt <info@metux.net>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31. 03. 20 11:49, Christophe Leroy wrote:
> 
> 
> Le 31/03/2020 à 09:19, Christophe Leroy a écrit :
>>
>>
>> Le 31/03/2020 à 08:59, Michal Simek a écrit :
>>> On 31. 03. 20 8:56, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 31/03/2020 à 07:30, Michael Ellerman a écrit :
>>>>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>>>>> Le 27/03/2020 à 15:14, Andy Shevchenko a écrit :
>>>>>>> On Fri, Mar 27, 2020 at 02:22:55PM +0100, Arnd Bergmann wrote:
>>>>>>>> On Fri, Mar 27, 2020 at 2:15 PM Andy Shevchenko
>>>>>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>>>>> On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
>>>>>>>>>> On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
>>>>>>>>>>> On Fri, Mar 27, 2020 at 1:12 PM Michal Simek
>>>>>>>>>>> <michal.simek@xilinx.com> wrote:
>>>>>>> ...
>>>>>>>
>>>>>>>>>>> It does raise a follow-up question about ppc40x though: is it
>>>>>>>>>>> time to
>>>>>>>>>>> retire all of it?
>>>>>>>>>>
>>>>>>>>>> Who knows?
>>>>>>>>>>
>>>>>>>>>> I have in possession nice WD My Book Live, based on this
>>>>>>>>>> architecture, and I
>>>>>>>>>> won't it gone from modern kernel support. OTOH I understand that
>>>>>>>>>> amount of real
>>>>>>>>>> users not too big.
>>>>>>>>>
>>>>>>>>> +Cc: Christian Lamparter, whom I owe for that WD box.
>>>>>>>>
>>>>>>>> According to https://openwrt.org/toh/wd/mybooklive, that one is
>>>>>>>> based on
>>>>>>>> APM82181/ppc464, so it is about several generations newer than
>>>>>>>> what I
>>>>>>>> asked about (ppc40x).
>>>>>>>>
>>>>>>>>>> Ah, and I have Amiga board, but that one is being used only for
>>>>>>>>>> testing, so,
>>>>>>>>>> I don't care much.
>>>>>>>>
>>>>>>>> I think there are a couple of ppc440 based Amiga boards, but again,
>>>>>>>> not 405
>>>>>>>> to my knowledge.
>>>>>>>
>>>>>>> Ah, you are right. No objections from ppc40x removal!
>>>>>>
>>>>>> Removing 40x would help cleaning things a bit. For instance 40x is
>>>>>> the
>>>>>> last platform still having PTE_ATOMIC_UPDATES. So if we can remove
>>>>>> 40x
>>>>>> we can get rid of PTE_ATOMIC_UPDATES completely.
>>>>>>
>>>>>> If no one objects, I can prepare a series to drop support for 40x
>>>>>> completely.
>>>>>>
>>>>>> Michael, any thought ?
>>>>>
>>>>> I have no attachment to 40x, and I'd certainly be happy to have less
>>>>> code in the tree, we struggle to keep even the modern platforms well
>>>>> maintained.
>>>>>
>>>>> At the same time I don't want to render anyone's hardware obsolete
>>>>> unnecessarily. But if there's really no one using 40x then we should
>>>>> remove it, it could well be broken already.
>>>>>
>>>>> So I guess post a series to do the removal and we'll see if anyone
>>>>> speaks up.
>>>>>
>>>>
>>>> Ok, series sent out, see
>>>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=167757
>>>
>>> ok. I see you have done it completely independently of my patchset.
>>> Would be better if you can base it on the top of my 2 patches because
>>> they are in conflict now and I need to also remove virtex 44x platform
>>> also with alsa driver.
>>>
>>
>> I can't see your first patch, only the second one shows up in the
>> series, see
>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=167757
>>
> 
> 
> Ok, I found your first patch on another patchwork, it doesn't touch any
> file in arch/powerpc/

There was just driver dependency on symbol which is removed by 2/2.
Let's see what you get from kbuild if any symbol is removed but still
used in drivers folder.

> 
> I sent a v2 series with your powerpc patch as patch 2/11
> 
> See https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=167766

Thanks,
Michal


