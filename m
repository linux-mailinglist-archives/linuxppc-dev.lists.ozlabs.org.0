Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAF81DD0B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 17:03:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SXvD0VWzzDqfD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 01:03:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xilinx.com (client-ip=2a01:111:f400:7eab::630;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=michals@xilinx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-xilinx-onmicrosoft-com
 header.b=f4QY3W0B; dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SXnL0YqdzDqCX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 00:58:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9AQ7oO/gxsqg+xuYIrmatXG2R15fxA5dSSPXyqrudJiKKYAfzAqDIvy+ld/NK+yPkgwgu5MdlChlgovrmci040HHP+Ola79HRP46HHD/mA/ymscgAumloCSVn86dKqBdCwJOQ4mSGns1ybfXCRVAh4gs16+rJq41DtP+Vi1PgQE61x1j7FDNxqDay0Rn592/X8jmoxXUcDn26yBBPXOpD5WoUZ0DCDer/9g2WhTWxRB2Bskt/RtlACKNBYmAh+ce1AhRShKGVyO3/9BvLpr9g1y2KGhXU2PPbgrmUq43NK01ropE76jAETqoJLKjDJeLfEN4b3USumKDI/wdrtEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJOkTVVNPsgqkvYSFXGUKWThzDw4DF0o7zeGUpmAbsY=;
 b=AcgR1FZTCRqdst6XjCcyCLZ5TA7VvUUf8Ku27Seviz6e+wD2CgclsEmnIAlZshmxfm3IWPpjCJj1d2GxM26Hci6e6oIT88/+h5bVgeW73++/cftwEBREiEdtZ6nMvida+bb6Dl/yz6W8reBGv064oIhXPB77gOZnpyC5vnfjGsEOH+9t0zcxqXtM0oKdS3AE1+GCBbSCuCDBLhs/67ZKSRzCy/q6oL/FDAYIqYj3IsdlQfQJaPUjLvmY1iheJ9pvX2vl3eaUyXoRALVgpvojmgm60jXpSmbZcl5m+iut/OuN/IC7J1nV17CJrM3Ii67yqzBROqbD4joFARgjjuRStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ellerman.id.au smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJOkTVVNPsgqkvYSFXGUKWThzDw4DF0o7zeGUpmAbsY=;
 b=f4QY3W0BPZQcd+syDSYnO5Ro1cc8Uy12ouXoTi5l5iJvx3j30Yd08BmwXjmMFLGG2LHeXpbmfBwtIV6b3b44XbLVXoWmf1iwKIk8Mg4DQ6VoLqVfEoweuRxoB765WB82ZK+OHZNW1uW+5ArvSNoyLBg6EMW1xDtUCElTbzejMtM=
Received: from SN4PR0501CA0062.namprd05.prod.outlook.com
 (2603:10b6:803:41::39) by BYAPR02MB6438.namprd02.prod.outlook.com
 (2603:10b6:a03:11d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Thu, 21 May
 2020 14:58:38 +0000
Received: from SN1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:41:cafe::37) by SN4PR0501CA0062.outlook.office365.com
 (2603:10b6:803:41::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.12 via Frontend
 Transport; Thu, 21 May 2020 14:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT064.mail.protection.outlook.com (10.152.72.143) with Microsoft SMTP
 Server id 15.20.3021.23 via Frontend Transport; Thu, 21 May 2020 14:58:38
 +0000
Received: from [149.199.38.66] (port=50841 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jbme9-000129-6Z; Thu, 21 May 2020 07:58:09 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jbmeb-0005bL-0E; Thu, 21 May 2020 07:58:37 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04LEwTsO007698; 
 Thu, 21 May 2020 07:58:29 -0700
Received: from [172.30.17.109] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jbmeT-0005ZQ-1b; Thu, 21 May 2020 07:58:29 -0700
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Arnd Bergmann <arnd@arndb.de>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <bac9af641140cf6df04e3532589a11c2f3bccd2f.camel@kernel.crashing.org>
 <87pncprwp9.fsf@mpe.ellerman.id.au>
 <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
 <871roykwu6.fsf@mpe.ellerman.id.au>
 <CAK8P3a1XmeeP7FKfNwXZO8cXyJ_U_Jr0kjOaGZ6F=7OcoZ+0nw@mail.gmail.com>
 <87zha17otl.fsf@mpe.ellerman.id.au>
 <33b873a8-ded2-4866-fb70-c336fb325923@csgroup.eu>
 <87o8qhgzrq.fsf@mpe.ellerman.id.au>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <4d188e84-8789-32d6-0efd-d9e783a72a5a@xilinx.com>
Date: Thu, 21 May 2020 16:58:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87o8qhgzrq.fsf@mpe.ellerman.id.au>
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
 SFS:(346002)(396003)(376002)(39860400002)(136003)(46966005)(82740400003)(47076004)(82310400002)(316002)(426003)(336012)(7366002)(31696002)(7416002)(7406005)(8936002)(5660300002)(110136005)(8676002)(31686004)(81166007)(356005)(186003)(26005)(54906003)(9786002)(36756003)(2616005)(6666004)(44832011)(70586007)(4326008)(70206006)(478600001)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 480af9f6-3d88-467f-6eae-08d7fd97717a
X-MS-TrafficTypeDiagnostic: BYAPR02MB6438:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR02MB6438CE28A1703D032629D216C6B70@BYAPR02MB6438.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uez/Sxt0dh205cLfARoiX3MLAJFAqbDz/7qp5nSb2yaSbTGjLseanl2PSI6xLidrSg2md/V+TNrExH3HFGA3ItoOcwCpNS46NQtaQTZBN5OJHV+jjvKTySGebnBV/s17DE9PtI5Gi5V/LCXSKlhEcoLxF4lQJf3x8z4APr/p8UJ+1Ftc0SPEFkyg//LX/2IBufYWPI3sV1R1da8A51JbrxhcYrHW4rpITnshs+5tAaqgwuo8CcpE8YY99HlsEUlGcnIaelFs77FSPxnwl4aPtxnnIA7ptzZqaSkP58+Ps1iaPQXENI6t3lANPTnnJt31bJjRamPSU6QxMK3Ys7u1p+T80rZYYHB7MiIvmdhttNe5X/llPbXkOADYUjV+Md0bc9bkZ0XRIxhf7QwK5N/QUxtVTRNQj7FmSnDRyV8HxUDCUNoT0WRtRSVEAmcqnVMx
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 14:58:38.0533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 480af9f6-3d88-467f-6eae-08d7fd97717a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB6438
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
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21. 05. 20 15:53, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 21/05/2020 à 09:02, Michael Ellerman a écrit :
>>> Arnd Bergmann <arnd@arndb.de> writes:
>>>> +On Wed, Apr 8, 2020 at 2:04 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>>>> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>>>>>> On Fri, 2020-04-03 at 15:59 +1100, Michael Ellerman wrote:
>>>>>>> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>>>>>> IBM still put 40x cores inside POWER chips no ?
>>>>>
>>>>> Oh yeah that's true. I guess most folks don't know that, or that they
>>>>> run RHEL on them.
>>>>
>>>> Is there a reason for not having those dts files in mainline then?
>>>> If nothing else, it would document what machines are still being
>>>> used with future kernels.
>>>
>>> Sorry that part was a joke :D  Those chips don't run Linux.
>>>
>>
>> Nice to know :)
>>
>> What's the plan then, do we still want to keep 40x in the kernel ?
> 
> I guess we keep it for now.
> 
> Perhaps we mark it BROKEN for a few releases and see if anyone
> complains?

I would like to get at least that xilinx patch to the tree to unblock
our changes on interrupt controller.

Thanks,
Michal

