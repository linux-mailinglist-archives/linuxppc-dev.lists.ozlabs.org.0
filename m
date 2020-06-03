Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E121ECB33
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 10:14:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cMBg1NZNzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 18:14:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xilinx.com (client-ip=40.107.76.82;
 helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=michals@xilinx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-xilinx-onmicrosoft-com
 header.b=YlXeISiM; dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760082.outbound.protection.outlook.com [40.107.76.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cM6p1LDKzDq8W
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 18:10:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi2wgVlkyD/MoZs3mktxyGUfi8dBdQhSpoUQvBbcY5IeZ4kJ4oA1N/cofOvY4rqcbumoZeV0N/VCM4j++er+dvtIn8yiEwjEzdOcFUBh7czn0DUvNRfgl7VBp5AASvzu0BiZ+QpgU/4ug1oVCWlO2AxacToK+XUU/DLo4sYPMAyA2uEdRbOeeBks1qEsY2FtRZeb/TA7434uUWIqXjDpF4SHeUyLZ641XAfM1UAGIX45SobCYZJdAvFjtL4vnpmdIZTL1yaGSavkoGpEupfS8oiBe/H7sgKgfjq+c93ccHSSsxQ8jwwg9tsvfWd58OvcCYZa67PGr9jolL3uuzEkpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hn25T0nqFh3yy/F1pPmJxN4fgLCxRvCTfWQIN4yGCuE=;
 b=HmqQXfVQlnuXyH2EGHw306/b44jO8DezXztOorkXjzSHSlydRD5KKAZbML0+WfkO5ukit1eIBfcq/cDVRR21ZnTSuBp+TBuCH+0l2BMOnjLSFjUWqqi6EjDceBSZuTb8hBxU4tS1g5fgeVfDbTKo7mldMsZRbsiuB7NLFw9m2lh+Yai1eQkEjnnVN+dvVtdbUPJnYy/CV0587lm6hPQI4zjIKo/fVtnW8PNxo6AwnoCV15B4zFsXedKkk+4Hp8tm19Y/deNyL/Lc7GVATviSWv7WIdEBHNsX966s+WU2Dt+kwIN8AVP5E25+Wjlt/Q3SrF+NKTiyDRAO9W9igd6XWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hn25T0nqFh3yy/F1pPmJxN4fgLCxRvCTfWQIN4yGCuE=;
 b=YlXeISiMT1OG3lI9cRlKzUQ1JiJ2ySgTcfkLjGLOzUcEL6pjWD1lDnNqF1Ww/gUcmhp/5+jCWt3W261OddpdbqhEycMwB+C/vBzuuBCJH62JbIQGQwe5B143vnkRKIJAV1WKMgW2n1pNhZ/wTt3UjT8gd90963ZLr2GT0TrQSVo=
Received: from MN2PR16CA0056.namprd16.prod.outlook.com (2603:10b6:208:234::25)
 by SN6PR02MB5648.namprd02.prod.outlook.com (2603:10b6:805:e8::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 3 Jun
 2020 08:10:50 +0000
Received: from BL2NAM02FT039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:234:cafe::e2) by MN2PR16CA0056.outlook.office365.com
 (2603:10b6:208:234::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Wed, 3 Jun 2020 08:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT039.mail.protection.outlook.com (10.152.77.152) with Microsoft SMTP
 Server id 15.20.3045.17 via Frontend Transport; Wed, 3 Jun 2020 08:10:49
 +0000
Received: from [149.199.38.66] (port=50779 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jgOTM-0005nN-0r; Wed, 03 Jun 2020 01:10:04 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jgOU5-0005nE-Dz; Wed, 03 Jun 2020 01:10:49 -0700
Received: from [172.30.17.109] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jgOTw-0005Ee-Eb; Wed, 03 Jun 2020 01:10:40 -0700
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <michal.simek@xilinx.com>, Takashi Iwai <tiwai@suse.de>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
 <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
 <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
 <87wo4yerom.fsf@mpe.ellerman.id.au>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <4b807ebc-8d8f-ad76-f5e2-9ce8410dc70c@xilinx.com>
Date: Wed, 3 Jun 2020 10:10:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87wo4yerom.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(346002)(39860400002)(376002)(136003)(396003)(46966005)(9786002)(5660300002)(6666004)(70586007)(44832011)(426003)(82310400002)(2616005)(356005)(81166007)(966005)(26005)(2906002)(31686004)(4326008)(186003)(478600001)(336012)(70206006)(83380400001)(8936002)(31696002)(82740400003)(316002)(47076004)(8676002)(36756003)(7366002)(7406005)(54906003)(7416002)(110136005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9535ab91-4fe1-46b9-439a-08d80795a0b4
X-MS-TrafficTypeDiagnostic: SN6PR02MB5648:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5648762759060983638902BEC6880@SN6PR02MB5648.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AYpbhSOnqFpeQ+uE6RyPc55c+0Q85YqoTxq7gj/ImCopOtRX1wDtXbIB4cm8xwj65556Nu2cCuN9YeWCvWjnvPngXjIbJhTZk7FPf3PHVddpHcP+zg2/YrSYGD9FeCQV4S1cGXTHcVLh00il6wlwFOcdK1yi/zg/GEMFarXAKIs4EHLGiJgI0H0YVVUFK4fiOfekrJ4zzIgvxVzGMzypGXD/5otvFgZO8n/V3BSOYCWK7RBn/IBF4XAmO3c4uNu9CKVdbuJAvkUXUrDGIbucMmoUZwJAOWpwT+1z4TqRPEsNrEL1hUlZ6WxF7Bq06mGcTLSR+EQniyzhhDSE4/hgcIgxs0zMqvUrb2bZbBN6VGQtDNQRhy+0MSSbkyl1/KYS/ibyMlyrCccahmT2rzP5nJiWzue6iBwlKaaKAfVWyoQRWZ+gNOpFiLP1k8Vr3SfPusZRA+o0prYpZdsC19k56+lnaWcJgDQeOHdiWKhwR2JGpwNazzOZrTHvZ6UpUguD
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 08:10:49.9916 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9535ab91-4fe1-46b9-439a-08d80795a0b4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5648
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
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On 26. 05. 20 15:44, Michael Ellerman wrote:
> Michal Simek <monstr@monstr.eu> writes:
>> Hi Michael,
>>
>> On 01. 04. 20 13:30, Michal Simek wrote:
>>> On 01. 04. 20 12:38, Takashi Iwai wrote:
>>>> On Wed, 01 Apr 2020 12:35:16 +0200,
>>>> Michael Ellerman wrote:
>>>>>
>>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>>> On 01. 04. 20 4:07, Michael Ellerman wrote:
>>>>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> recently we wanted to update xilinx intc driver and we found that function
>>>>>>>> which we wanted to remove is still wired by ancient Xilinx PowerPC
>>>>>>>> platforms. Here is the thread about it.
>>>>>>>> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
>>>>>>>>
>>>>>>>> I have been talking about it internally and there is no interest in these
>>>>>>>> platforms and it is also orphan for quite a long time. None is really
>>>>>>>> running/testing these platforms regularly that's why I think it makes sense
>>>>>>>> to remove them also with drivers which are specific to this platform.
>>>>>>>>
>>>>>>>> U-Boot support was removed in 2017 without anybody complain about it
>>>>>>>> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
>>>>>>>>
>>>>>>>> Based on current ppc/next.
>>>>>>>>
>>>>>>>> If anyone has any objection about it, please let me know.
>>>>>>>
>>>>>>> Thanks for taking the time to find all this code and remove it.
>>>>>>>
>>>>>>> I'm not going to take this series for v5.7, it was posted too close to
>>>>>>> the merge window, and doing so wouldn't give people much time to object,
>>>>>>> especially given people are distracted at the moment.
>>>>>>>
>>>>>>> I'm happy to take it for v5.8, assuming there's no major objections.
>>>>>>
>>>>>> Sure. Just to let you know Christophe Leroy included this patch in his
>>>>>> series about ppc405 removal. It should be the same.
>>>>>>
>>>>>> If you don't want to take that alsa patch I can send it separately and
>>>>>> this patch can be taken from his series. I don't really mind but please
>>>>>> let me know what way you prefer.
>>>>>
>>>>> It's better to keep it all together, so I'm happy take the alsa patch as
>>>>> well, it's already been acked.
>>
>> Can you please take this series? I know that there is v5 from Christophe
>> which has this 1/2 as 1/13. But I need this alsa patch too and I would
>> like to close this because it is around for almost 2 months and none
>> raised a concern about removing just these Xilinx platforms.
> 
> Sorry I meant to reply to your last mail.
> 
> I have Christophe's series in my testing branch, planning for it to be
> in v5.8.
> 
> Even if the rest of his series doesn't make it for some reason, as you
> say the Xilinx removal is uncontroversial so I'll keep that in.
> 
> I forgot about the sound patch, I'll pick that up as well.

I took a look at your
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git repo
and I can't see any branch with my patches.
Also was checking linux-next and my patches are also not there.
That's why I am curious if this will be go v5.8 in MW.

Thanks,
Michal


