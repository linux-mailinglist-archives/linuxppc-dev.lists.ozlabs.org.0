Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF4C4C34A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:24:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Lry66HDz3cNl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 05:24:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=wanadoo.fr
 (client-ip=80.12.242.125; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4LrS29T0z2xtb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 05:23:34 +1100 (AEDT)
Received: from [192.168.1.18] ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id NIeQnn7MbrdkGNIeQnJ9oN; Thu, 24 Feb 2022 19:16:00 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 24 Feb 2022 19:16:00 +0100
X-ME-IP: 90.126.236.122
Message-ID: <b3e6a19b-caa0-f58a-1039-02b60b17ed21@wanadoo.fr>
Date: Thu, 24 Feb 2022 19:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
 <YhXmQwvjMFPQFPUr@infradead.org>
 <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
 <YhckzJp5/x9zW4uQ@infradead.org>
 <CAK8P3a23Pjm1Btc=mXX=vU4hkNiPqz3+o4=j0FuYKHB7KuMtPg@mail.gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CAK8P3a23Pjm1Btc=mXX=vU4hkNiPqz3+o4=j0FuYKHB7KuMtPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 linux-fpga@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 Kernel Janitors <kernel-janitors@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 Sathya Prakash <sathya.prakash@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com,
 hao.wu@intel.com,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 sreekanth.reddy@broadcom.com, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matt Turner <mattst88@gmail.com>,
 awalls@md.metrocast.net,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Miller <davem@davemloft.net>, Alex Bounine <alex.bou9@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, alpha <linux-alpha@vger.kernel.org>,
 dmaengine@vger.kernel.org, Moritz Fischer <mdf@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Le 24/02/2022 à 08:07, Arnd Bergmann a écrit :
> On Thu, Feb 24, 2022 at 7:25 AM Christoph Hellwig <hch@infradead.org> wrote:
>> On Wed, Feb 23, 2022 at 09:26:56PM +0100, Christophe JAILLET wrote:
>>> Patch 01, 04, 05, 06, 08, 09 have not reached -next yet.
>>> They all still apply cleanly.
>>>
>>> 04 has been picked it up for inclusion in the media subsystem for 5.18.
>>> The other ones all have 1 or more Reviewed-by:/Acked-by: tags.
>>>
>>> Patch 16 must be resubmitted to add "#include <linux/dma-mapping.h>" in
>>> order not to break builds.
>> So how about this:  I'll pick up 1, 5,6,8 and 9 for the dma-mapping
>> tree.  After -rc1 when presumably all other patches have reached
>> mainline your resubmit one with the added include and we finish this
>> off?
> Sounds good to me as well.
>
>         Arnd

This is fine for me.
When all patches have reached -next, I'll re-submit the fixed 16th patch.


Thanks for your assistance for ending this long story :)

CJ

