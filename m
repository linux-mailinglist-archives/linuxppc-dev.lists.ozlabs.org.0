Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3373828D8BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 04:57:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9xsZ6lNBzDqlr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 13:57:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UJb6xowe; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9xqs2Hn4zDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 13:55:47 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id d6so989138plo.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 19:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/CF7sGkvM8qigMWqyh3wqQ7xb/wKWDNOqvJPjBYV0xs=;
 b=UJb6xowePTVjk6UH2lufE76prWIyq5Do5ZM5ObFfyFWbipyEUpXPgFPMnPcsS0vE4X
 3iGuQIiX+1/7TSmFZ4/KCaHCGZYEbiGAlpmYcvXj5bj1bKvWJKqzFVA1iY/13RzovpEM
 UFjaKMz2rgZvfVQkHikUVfYFlDVNz4eqeL6Xk00LpjKexIXSoYzbTEuroe3C2sHVh3rd
 QLMIBgdLzNq/HcFVVwtpdrPz/cZ/ZaFJx3HXN3UDSgb2WVFITpqNcHumC3zTkidqFXjv
 VF/Upr+IzLJI6+SYTaNq5A2/TMg+In31R2llt1A7BF/L0SyW19gmKU2S687sIRWKPaFY
 KeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/CF7sGkvM8qigMWqyh3wqQ7xb/wKWDNOqvJPjBYV0xs=;
 b=BXPYRpdv4j1N6qmi0XbPl97yXFc3xbDSREAZ2nSgSwh6pc2jvfOLWeNGi1CqQaZ421
 jttCclB3QxhaMF+uoPtDvzIvc8CEYpgtxeGlarQPOdI14SDYSz9AmLe/yHaCgnzv12AL
 VxPnXHYeUQyCOgSwEq0kypZNMy4ecb0PL+j6DyeEuWDvcsg7Iw/EAMFpI5FHvtfZPd9v
 I+S6GdZKspW+dHBfZtfY/W56wRV9ydKbd4HKyvJJBxwkwMom9m3EDZUNvv6pOwPMzQ/I
 E+k3QfKPG/YKtVLQCnR0S+aLXeUgj5nF9+e50S6grAd2fGdCR888YaTEtvHu6PfkcY3n
 8V9Q==
X-Gm-Message-State: AOAM532EHe9XbgTtvVWzZ4WvQ9wRiV1Jol3ax1VYyCT1GI6A7ym3oDqu
 rigFTENOai7R7+GhGUrBSf2Qvg==
X-Google-Smtp-Source: ABdhPJxcYq+w36c3Hv9a7AbAwXFf6fXw12Qi+PKp0U/QWWghuBuByTInn9mZjVujERP6vR7lPO/qRg==
X-Received: by 2002:a17:90b:1a90:: with SMTP id
 ng16mr1379169pjb.172.1602644143206; 
 Tue, 13 Oct 2020 19:55:43 -0700 (PDT)
Received: from [192.168.10.88] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with UTF8SMTPSA id ne16sm692271pjb.11.2020.10.13.19.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 19:55:40 -0700 (PDT)
Subject: Re: [PATCH v2] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Qian Cai <cai@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200807101854.844619-1-clg@kaod.org>
 <9c5eca863c63e360662fae7597213e8927c2a885.camel@redhat.com>
 <fce8ffe1-521c-8344-c7ad-53550e408cdc@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <89726af2-00ca-9d47-f417-4bea8d5b8b1f@ozlabs.ru>
Date: Wed, 14 Oct 2020 13:55:35 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <fce8ffe1-521c-8344-c7ad-53550e408cdc@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 23/09/2020 17:06, Cédric Le Goater wrote:
> On 9/23/20 2:33 AM, Qian Cai wrote:
>> On Fri, 2020-08-07 at 12:18 +0200, Cédric Le Goater wrote:
>>> When a passthrough IO adapter is removed from a pseries machine using
>>> hash MMU and the XIVE interrupt mode, the POWER hypervisor expects the
>>> guest OS to clear all page table entries related to the adapter. If
>>> some are still present, the RTAS call which isolates the PCI slot
>>> returns error 9001 "valid outstanding translations" and the removal of
>>> the IO adapter fails. This is because when the PHBs are scanned, Linux
>>> maps automatically the INTx interrupts in the Linux interrupt number
>>> space but these are never removed.
>>>
>>> To solve this problem, we introduce a PPC platform specific
>>> pcibios_remove_bus() routine which clears all interrupt mappings when
>>> the bus is removed. This also clears the associated page table entries
>>> of the ESB pages when using XIVE.
>>>
>>> For this purpose, we record the logical interrupt numbers of the
>>> mapped interrupt under the PHB structure and let pcibios_remove_bus()
>>> do the clean up.
>>>
>>> Since some PCI adapters, like GPUs, use the "interrupt-map" property
>>> to describe interrupt mappings other than the legacy INTx interrupts,
>>> we can not restrict the size of the mapping array to PCI_NUM_INTX. The
>>> number of interrupt mappings is computed from the "interrupt-map"
>>> property and the mapping array is allocated accordingly.
>>>
>>> Cc: "Oliver O'Halloran" <oohall@gmail.com>
>>> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>
>> Some syscall fuzzing will trigger this on POWER9 NV where the traces pointed to
>> this patch.
>>
>> .config: https://gitlab.com/cailca/linux-mm/-/blob/master/powerpc.config
> 
> OK. The patch is missing a NULL assignement after kfree() and that
> might be the issue.
> 
> I did try PHB removal under PowerNV, so I would like to understand
> how we managed to remove twice the PCI bus and possibly reproduce.
> Any chance we could grab what the syscall fuzzer (syzkaller) did ?


How do you remove PHBs exactly? There is no such thing in the powernv 
platform, I thought someone added this and you are fixing it but no. 
PHBs on powernv are created at the boot time and there is no way to 
remove them, you can only try removing all the bridges.

So what exactly are you doing?


-- 
Alexey
