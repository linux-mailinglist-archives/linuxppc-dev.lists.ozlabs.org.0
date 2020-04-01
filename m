Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B8919A50C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 08:04:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sbHT1Kg3zDr1G
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 17:04:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xilinx.com (client-ip=40.107.220.47;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=michals@xilinx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-xilinx-onmicrosoft-com
 header.b=VeXGjEHj; dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sbDy4l5YzDqyh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 17:01:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dynf6Pqp/2swjmESzUGW1vunYoqIcPJNysolIKyR8KcvEdhP5PdaPbnR46FhUP367xeRvulT1mLB63sKU6jal553cd9ui/8SaByOkXIikXyMAMXD/LY+L9j+tgk6koCS+IJBSr0jR/+ADrG17v7axUWkMbtOqTjMp7lfunw3kW4CF9Y13k5HADxgxcIWdQKqzelwuSC4lDIK8Nu4tXpBKQTmUajPF+GvXgGEgNsQnr17vFiWWpQV2wIjGx/BWva5BLmRoUXDx90DH8sw9tDKzsOa2Tuo6vuoJfQ7AUyOTw/IpE3HSiBSzpSXkw05JeH+mFvxAY/Zq9VZsTNM1LztyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnRoQ0j1J+IYNkR0tyoxpV3nojg4Cc5J0PnbYHK11vA=;
 b=MsfUwmRtr6UkHVVsCOckmXAzszy3aL+VnWs51Vqj5P/+GTDx+LrTDs+Q3UTGVYf00cGtR3GOUfabF74lkkJ763v89EyQGlKG/ANMooRRMWaPIT037X33vnw9HDeZxop+p98hJFf/jK1MbdclFnXxpxSPZ5dQ8DCQpqCIe4aKJIXXQ6p+oq4S1Klzbp9BXDwQTHH8oDYcuV6Kk27nQ1Y6vCKTWWoJf7IhAD5Yx7ANybj3R6dPGXRPJljD1KK7/C3RVCd47wOq4jcTfuk5ClEkchVr1DVJRlMfNa3PbGlg57QP8opyc9GAun1ZLcLwSBwM7enWt/Nl5qKDjovB4qp6xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnRoQ0j1J+IYNkR0tyoxpV3nojg4Cc5J0PnbYHK11vA=;
 b=VeXGjEHj+cvvxRYZAdbddcWlvVbi2zFHlXQr0vOyqsFHBVgFTm89fkjZSfiz0arSps6OjV5zUckTbrNbMVYWwYBIDjaZT8FpKnUdrSSqP1BTGb0nWDjpoaHE3DV5P7NrvOUnxjpnMYg0itNDiYK+aEWBbIk8wViXnHS/cbHbRGg=
Received: from DM6PR13CA0018.namprd13.prod.outlook.com (2603:10b6:5:bc::31) by
 BYAPR02MB5544.namprd02.prod.outlook.com (2603:10b6:a03:9b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Wed, 1 Apr 2020 06:01:48 +0000
Received: from CY1NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::8b) by DM6PR13CA0018.outlook.office365.com
 (2603:10b6:5:bc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.11 via Frontend
 Transport; Wed, 1 Apr 2020 06:01:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT027.mail.protection.outlook.com (10.152.75.159) with Microsoft SMTP
 Server id 15.20.2878.15 via Frontend Transport; Wed, 1 Apr 2020 06:01:47
 +0000
Received: from [149.199.38.66] (port=49461 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJWRd-00010d-Ce; Tue, 31 Mar 2020 23:01:45 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJWRf-0006Ev-3x; Tue, 31 Mar 2020 23:01:47 -0700
Received: from [172.30.17.108] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jJWRW-00069j-2e; Tue, 31 Mar 2020 23:01:38 -0700
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, git@xilinx.com, sfr@canb.auug.org.au, maz@kernel.org
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
Date: Wed, 1 Apr 2020 08:01:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87imikufes.fsf@mpe.ellerman.id.au>
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
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(186003)(966005)(7366002)(478600001)(336012)(8676002)(7406005)(2616005)(36756003)(9786002)(7416002)(44832011)(8936002)(81166006)(81156014)(426003)(47076004)(70586007)(31696002)(70206006)(2906002)(31686004)(5660300002)(316002)(6666004)(356004)(54906003)(4326008)(26005)(82740400003)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a091a712-ebb1-4c1c-85ba-08d7d60229da
X-MS-TrafficTypeDiagnostic: BYAPR02MB5544:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR02MB55446B9078E4FB9077985975C6C90@BYAPR02MB5544.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03607C04F0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fqx95JbJFSID0kKc1D+rNEHt8CqZjdLU8JT6m9leIJqz6Eu2HPJW8818H4kdm6epQZYpob2s1Kk1oZIAPFJawt8VPeioMBDDgKql4liUo2v1LR2uti7e7k6wnH7em+RtbsDGsynHiFn1SioVLi4qzZxpuaoQwP+WSj48XxdyuOfMs7+/iXIM/+uC6/BT/kETzW0cx9Dr2tmlYzMSHu8BbVEGICOWFn6D4enYxF9dPjWILpc5tQF5sU/DeUCcZCxS9M0dGt3L2fbs4ZXC3DR3s5UIhnc6e2e8BcD98CWCb2Bv6/YtSHuUnhPIvYX7nwEI/AP9wvbznIw9Ga0bMgn7vfibVdQRIEpH1HLsEeetEkkdf8+VAt8YvUOAm2hc89vFWVC5sTQ28+YY1nVPUlf0XyZG20ND10faJORZ7ogwfQ8qv/jst9tFD+qBLpbUvIhsVmrai1sG+yCvopPAWkN+yKMstqhfdRI9Viv2KnKaWw/48PRLlvhmASkQ288ZO5U8B/01kK3lsiiVFDPMXik2PzpwcMNqvPEDdQcFNmVRZSipkRqEKAL4XFZdOCP3LKWGKRy8PhtzItcOEPhzamQWtQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 06:01:47.5941 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a091a712-ebb1-4c1c-85ba-08d7d60229da
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5544
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
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Wei Hu <weh@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01. 04. 20 4:07, Michael Ellerman wrote:
> Michal Simek <michal.simek@xilinx.com> writes:
>> Hi,
>>
>> recently we wanted to update xilinx intc driver and we found that function
>> which we wanted to remove is still wired by ancient Xilinx PowerPC
>> platforms. Here is the thread about it.
>> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
>>
>> I have been talking about it internally and there is no interest in these
>> platforms and it is also orphan for quite a long time. None is really
>> running/testing these platforms regularly that's why I think it makes sense
>> to remove them also with drivers which are specific to this platform.
>>
>> U-Boot support was removed in 2017 without anybody complain about it
>> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
>>
>> Based on current ppc/next.
>>
>> If anyone has any objection about it, please let me know.
> 
> Thanks for taking the time to find all this code and remove it.
> 
> I'm not going to take this series for v5.7, it was posted too close to
> the merge window, and doing so wouldn't give people much time to object,
> especially given people are distracted at the moment.
> 
> I'm happy to take it for v5.8, assuming there's no major objections.

Sure. Just to let you know Christophe Leroy included this patch in his
series about ppc405 removal. It should be the same.

If you don't want to take that alsa patch I can send it separately and
this patch can be taken from his series. I don't really mind but please
let me know what way you prefer.

Thanks,
Michal

