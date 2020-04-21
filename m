Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0590E1B1E0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 07:12:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495sBy6PBczDqfJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 15:12:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=vZkuQ0P2; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495s9M5YXhzDr0v
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 15:11:18 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id p25so6080279pfn.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 22:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hUBFH9eyZTt6bhUtoAVnmyt4lntUwfknm928LguU/JQ=;
 b=vZkuQ0P2Yflt1uelhuzdMgLfq2ZxiN36SEIS8pZmhaQJgATmSD5U5stqDkDrUduhtO
 qgRAFYL6w6pR0nP2QMMB82BiP8BMl9ZNmv2duW4hN8VQ9O7CiHEkZnLy/9M76C5RMHUo
 PYkI/SvHMoS9KqBOOgz5iKyaNnQv2XVfHl959prXlMpZvCjDHFMgq7o2vpQtUBJdZNoi
 b1iu1NjUz/VN0Ua/bhdf2y4+u541oVrQOVUKl48NyXWJIQ46eQAogtusQz+U0F7aKDkE
 tuqwUKTZNxGSMfrmz5aabvJ2U37Vo/IaHonvU+TtQzJ7LHDLn8iLG0Jo8SR5vSoMx1n5
 cPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hUBFH9eyZTt6bhUtoAVnmyt4lntUwfknm928LguU/JQ=;
 b=RoAj81Bp1HrxpgGrzhPdtIlcXqaq9tZX8Qkp5/aU3jLn4fbZScjBqtCr+dNizb4XOF
 IRHJ9WLJWCUMSIEhWd1QBGQtXPZhZIHtIsrGKctZWgVa+ulL7ONDiQuBuDPf+YuDngef
 nbPxksp/5I5KLNfgLogfrSUYcEBYlg0PyxNaokU9w4PVRMf678honq5DRbHMwxSNjEz8
 rTs3QYLKmgTOb6P2ns67Bz/yryyM1gk3p1pl8rXqOSPxgTw1anuh+HHqKuxDbkRu7QV1
 cuMer2Llza98gxJMd7apH1JkHGvUAczad3AKOfv5/u0lOJIkQYOEaoc/6jZeOIJuTgl7
 +0Ww==
X-Gm-Message-State: AGi0PuYCiTYkkEErJl8KAkDblApCJUu4BcH3Fa7X7ze7Egduy6BzlDfT
 q03QtkzFPLIXVFy2dyRNtm2FMA==
X-Google-Smtp-Source: APiQypIe+34zcKrGlTL6Em+QiEeMS5MXoAO4LeOI04UDml1Jp7oan4snqMSvbaSVDSTMgTk7nXAbuw==
X-Received: by 2002:a63:1665:: with SMTP id 37mr20348138pgw.308.1587445875627; 
 Mon, 20 Apr 2020 22:11:15 -0700 (PDT)
Received: from [192.168.10.94] (124-171-87-207.dyn.iinet.net.au.
 [124.171.87.207])
 by smtp.gmail.com with ESMTPSA id v9sm1090766pju.3.2020.04.20.22.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 22:11:14 -0700 (PDT)
Subject: Re: [PATCH kernel v2 0/7] powerpc/powenv/ioda: Allow huge DMA window
 at 4GB
To: Oliver O'Halloran <oohall@gmail.com>, Russell Currey <ruscur@russell.cc>
References: <20200323075354.93825-1-aik@ozlabs.ru>
 <b512ac5e-dca5-4c08-8ea1-a636b887c0d0@ozlabs.ru>
 <d5cac37a-8b32-cabf-e247-10e64f0110ab@ozlabs.ru>
 <CAOSf1CGfjX9LGQ1GDSmxrzjnaWOM3mUvBu9_xe-L2umin9n66w@mail.gmail.com>
 <CAOSf1CHgUsJ7jGokg6QD6cEDr4-o5hnyyyjRZ=YijsRY3T1sYA@mail.gmail.com>
 <b0b361092d2d7e38f753edee6dcd9222b4e388ce.camel@russell.cc>
 <9893c4db-057d-8e42-52fe-8241d6d90b5f@ozlabs.ru>
 <76718d0c46f4638a57fd2deeeed031143599d12d.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <8f317916-06be-ed25-4d9b-a8e2e993b112@ozlabs.ru>
Date: Tue, 21 Apr 2020 15:11:09 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <76718d0c46f4638a57fd2deeeed031143599d12d.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: KVM list <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 21/04/2020 00:04, Oliver O'Halloran wrote:
> On Fri, 2020-04-17 at 15:47 +1000, Alexey Kardashevskiy wrote:
>>
>> On 17/04/2020 11:26, Russell Currey wrote:
>>>
>>> For what it's worth this sounds like a good idea to me, it just sounds
>>> tricky to implement.  You're adding another layer of complexity on top
>>> of EEH (well, making things look simple to the EEH core and doing your
>>> own freezing on top of it) in addition to the DMA handling.
>>>
>>> If it works then great, just has a high potential to become a new bug
>>> haven.
>>
>> imho putting every PCI function to a separate PE is the right thing to
>> do here but I've been told it is not that simple, and I believe that.
>> Reusing slave PEs seems unreliable - the configuration will depend on
>> whether a PE occupied enough segments to give an unique PE to a PCI
>> function and my little brain explodes.
> 
> You're overthinking it.
> 
> If a bus has no m64 MMIO space we're free to assign whatever PE number
> we want since the PE for the bus isn't fixed by the m64 segment its
> BARs were placed in. For those buses we assign a PE number starting
> from the max and counting down (0xff, 0xfe, etc). For example, with
> this PHB:
> 
> # lspci -s 1:: -v | egrep '0001:|Memory at'
> 0001:00:00.0 PCI bridge: IBM Device 04c1 (prog-if 00 [Normal decode])
> 0001:01:00.0 PCI bridge: PLX Technology, Inc. Device 8725 (rev ca)
> (prog-if 00 [Normal decode])
>         Memory at 600c081000000 (32-bit, non-prefetchable) [size=256K]
> 0001:02:01.0 PCI bridge: PLX Technology, Inc. Device 8725 (rev ca)
> (prog-if 00 [Normal decode])
> 0001:02:08.0 PCI bridge: PLX Technology, Inc. Device 8725 (rev ca)
> (prog-if 00 [Normal decode])
> 0001:02:09.0 PCI bridge: PLX Technology, Inc. Device 8725 (rev ca)
> (prog-if 00 [Normal decode])
> 0001:03:00.0 Non-Volatile memory controller: PMC-Sierra Inc. Device
> f117 (rev 06) (prog-if 02 [NVM Express])
>         Memory at 600c080000000 (64-bit, non-prefetchable) [size=16K]
>         Memory at 6004000000000 (64-bit, prefetchable) [size=1M]
> 0001:09:00.0 Ethernet controller: Intel Corporation Ethernet Controller
> X710/X557-AT 10GBASE-T (rev 02)
>         Memory at 6004048000000 (64-bit, prefetchable) [size=8M]
>         Memory at 600404a000000 (64-bit, prefetchable) [size=32K]
> (redundant functions removed)
> 
> We get these PE assignments:
> 
> 0001:00:00.0 - 0xfe # Root port
> 0001:01:00.0 - 0xfc # upstream port
> 0001:02:01.0 - 0xfd # downstream port bus
> 0001:02:08.0 - 0xfd
> 0001:02:09.0 - 0xfd
> 0001:03:00.0 - 0x0  # NVMe
> 0001:09:00.0 - 0x1  # Ethernet
> 
> All the switch ports either have 32bit BARs or no BARs so they get
> assigned PEs starting from the top. The Ethernet and the NVMe have some
> prefetchable 64bit BARs so they have to be in PE 0x0 and 0x1
> respectively since that's where their m64 BARs are located. For our
> DMA-only slave PEs any MMIO space would remain in their master PE so we
> can allocate a PE number for the DMA-PE (our iommu context).


One example of a problem device is AMD GPU with 64bit video PCI function
and 32bit audio, no?

What PEs will they get assigned to now? Where will audio's MMIO go? It
cannot be the same 64bit MMIO segment, right? If so, it is a separate PE
already. If not, then I do not understand "we're free to assign whatever
PE number we want.


> I think the key thing to realise is that we'd only be using the DMA-PE
> when a crippled DMA mask is set by the driver. In all other cases we
> can just use the "native PE" and when the driver unbinds we can de-
> allocate our DMA-PE and return the device to the PE containing it's
> MMIO BARs. I think we can keep things relatively sane that way and the
> real issue is detecting EEH events on the DMA-PE.


Oooor we could just have 1 DMA window (or, more precisely, a single
"TVE" as it is either window or bypass) per a PE and give every function
its own PE and create a window or a table when a device sets a DMA mask.
I feel I am missing something here though.


> 
> On P9 we don't have PHB error interrupts enabled in firmware so we're
> completely reliant on seeing a 0xFF response to an MMIO and manually
> checking the PE status to see if it's due to a PE freeze. For our DMA-
> PE it could be frozen (due to a bad DMA) and we'd never notice unless
> we explicitly check the status of the DMA-PE since there's no
> corresponding MMIO space to freeze.
> 
> On P8 we had PHB Error interrupts so you would notice that *something*
> happened, then go check for frozen PEs, at which point the master-slave 
> grouping logic would see that one PE in the group was frozen and freeze
> the rest of them. We can re-use that on that, but we still need
> something to actually notice a freeze occured. A background poller
> checking for freezes on each PE might do the trick.
> 
>> So this is not happening soon.
> 
> Oh ye of little faith.
> 
>> For the time being, this patchset is good for:
>> 1. weird hardware which has limited DMA mask (this is why the patchset
>> was written in the first place)
>> 2. debug DMA by routing it via IOMMU (even when 4GB hack is not enabled).
> 
> Sure, but it's still dependent on having firmware which supports the
> 4GB hack and I don't think that's in any offical firmware releases yet.

It's been a while :-/


-- 
Alexey
