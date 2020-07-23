Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BD222A6E2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 07:23:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC12Y1KsBzDr7V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 15:23:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ghiti.fr
 (client-ip=217.70.183.195; helo=relay3-d.mail.gandi.net;
 envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ghiti.fr
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC10t6Q90zDr7K
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 15:22:04 +1000 (AEST)
X-Originating-IP: 90.112.45.105
Received: from [192.168.1.14] (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 722BD60002;
 Thu, 23 Jul 2020 05:21:51 +0000 (UTC)
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-831c4073-aefa-4aa0-a583-6a17f9aff9b7@palmerdabbelt-glaptop1>
 <d7e3cbb7-c12a-bce2-f1db-c336d15f74bd@ghiti.fr>
 <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
 <54af168083aee9dbda1b531227521a26b77ba2c8.camel@kernel.crashing.org>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <cade70e2-0179-2650-41c5-036679aaf30c@ghiti.fr>
Date: Thu, 23 Jul 2020 01:21:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <54af168083aee9dbda1b531227521a26b77ba2c8.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: aou@eecs.berkeley.edu, linux-mm@kvack.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 paulus@samba.org, zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Benjamin,

Le 7/21/20 à 7:11 PM, Benjamin Herrenschmidt a écrit :
> On Tue, 2020-07-21 at 14:36 -0400, Alex Ghiti wrote:
>>>> I guess I don't understand why this is necessary at all.
>>>> Specifically: why
>>>> can't we just relocate the kernel within the linear map?  That would
>>>> let the
>>>> bootloader put the kernel wherever it wants, modulo the physical
>>>> memory size we
>>>> support.  We'd need to handle the regions that are coupled to the
>>>> kernel's
>>>> execution address, but we could just put them in an explicit memory
>>>> region
>>>> which is what we should probably be doing anyway.
>>>
>>> Virtual relocation in the linear mapping requires to move the kernel
>>> physically too. Zong implemented this physical move in its KASLR RFC
>>> patchset, which is cumbersome since finding an available physical spot
>>> is harder than just selecting a virtual range in the vmalloc range.
>>>
>>> In addition, having the kernel mapping in the linear mapping prevents
>>> the use of hugepage for the linear mapping resulting in performance loss
>>> (at least for the GB that encompasses the kernel).
>>>
>>> Why do you find this "ugly" ? The vmalloc region is just a bunch of
>>> available virtual addresses to whatever purpose we want, and as noted by
>>> Zong, arm64 uses the same scheme.
> 
> I don't get it :-)
> 
> At least on powerpc we move the kernel in the linear mapping and it
> works fine with huge pages, what is your problem there ? You rely on
> punching small-page size holes in there ?
> 

ARCH_HAS_STRICT_KERNEL_RWX prevents the use of a hugepage for the kernel 
mapping in the direct mapping as it sets different permissions to 
different part of the kernel (data, text..etc).


> At least in the old days, there were a number of assumptions that
> the kernel text/data/bss resides in the linear mapping.
> 
> If you change that you need to ensure that it's still physically
> contiguous and you'll have to tweak __va and __pa, which might induce
> extra overhead.
> 

Yes that's done in this patch and indeed there is an overhead to those 
functions.

> Cheers,
> Ben.
>   
> 

Thanks,

Alex
