Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D475A4C1D31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 21:35:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3npc0rRKz3cTK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 07:35:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=wanadoo.fr
 (client-ip=80.12.242.130; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3npC0mSWz3c9v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 07:34:41 +1100 (AEDT)
Received: from [192.168.1.18] ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id MyDwnoius41cbMyDwni3p8; Wed, 23 Feb 2022 21:27:05 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 23 Feb 2022 21:27:05 +0100
X-ME-IP: 90.126.236.122
Message-ID: <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
Date: Wed, 23 Feb 2022 21:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
 <YhXmQwvjMFPQFPUr@infradead.org>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <YhXmQwvjMFPQFPUr@infradead.org>
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
Cc: airlied@linux.ie, trix@redhat.com, linux-fpga@vger.kernel.org,
 linux-pci@vger.kernel.org, paulus@samba.org, sparclinux@vger.kernel.org,
 linux-scsi@vger.kernel.org, sathya.prakash@broadcom.com,
 MPT-FusionLinux.pdl@broadcom.com, hao.wu@intel.com, arnd@arndb.de,
 suganath-prabu.subramani@broadcom.com, sreekanth.reddy@broadcom.com,
 ink@jurassic.park.msu.ru, bhelgaas@google.com, mchehab@kernel.org,
 mattst88@gmail.com, awalls@md.metrocast.net, davem@davemloft.net,
 alex.bou9@gmail.com, vkoul@kernel.org, linux-alpha@vger.kernel.org,
 dmaengine@vger.kernel.org, mdf@kernel.org, akpm@linux-foundation.org,
 linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, yilun.xu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 23/02/2022 à 08:46, Christoph Hellwig a écrit :
> Hi Christophe,
> 
> do you know what the state is in current linux-next?
> 
> I think we'll just want to queue up anything left at this point in the
> dma-mapping or PCI tree and get it done.
> 

Hi,

Patch 01, 04, 05, 06, 08, 09 have not reached -next yet.
They all still apply cleanly.

04 has been picked it up for inclusion in the media subsystem for 5.18.
The other ones all have 1 or more Reviewed-by:/Acked-by: tags.

Patch 16 must be resubmitted to add "#include <linux/dma-mapping.h>" in 
order not to break builds.


All the other patches have landed in -next.

CJ
