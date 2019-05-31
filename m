Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 041023077A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 05:57:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FVyl0mx1zDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 13:57:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="I6jQc8U4"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FVxH1yStzDqXb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 13:56:16 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id r22so5293288pfh.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 20:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Eas3MwJQzmQrRuY4Awf55ejQ3Ir7mFEqMQONUjwlCw=;
 b=I6jQc8U4ZSOHbvKtWWhuUsSCmV3HQ3Qa5+pe77Z3I/9OjSVI/FLlSI+yCk66oouwhh
 wgFL15/ih4bPU+Da6S5CSxqJ4MtbOHUTOYbB7tKArC4McukIQZNK847Od07F13PfCqP+
 K5qSJAuSKZr5duFv98yUOP2o5vb6jAmng2vfEZ1HA5sE36TDlkXZ+3kJ+Mcz7CkLMicu
 hYxH7XPzrCet0w/qKoWP++UGgtOJi+nINa6QD92JXNaUkIrda/CAbxa3H8seSb5jZpC2
 jeyICaovdU9BhwSS9+5Xk/SpqGYt3dq5pVd2/JYqwEv9GEXiGY9HAmTZ0gHy9p1Pl//P
 jcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4Eas3MwJQzmQrRuY4Awf55ejQ3Ir7mFEqMQONUjwlCw=;
 b=tFHvDN7zTVfJv0Zjk1MQxXfAq1zvNku5iXT2CP/flEy1gALYZrqKAIynLnBaj/TJ2S
 SFEwAlEO11+Rs9bVDpYzDyL8utxBIE2KoITtNzwEJPsqVDlnUI4/woJm1ocYF8t1M9LN
 GcNOGemCPnOzoH+yilBGxjFU27Lmzv5wQhu18iIuc8r/lbXZpn3G8G/ZxB58qFh7tV0Q
 rUJocVjIQolxsHmtjQZmzCfdxxaZuwpWvHsBKnMiBQ3WfgasvZZ9tXU7UqRiXtZK/dAp
 OzRL6poFR5QLhrgJE4JypXL4ezp4mTDt9ZaylIsr78RP+60RFXz9QfxWuPGUstF0UiNB
 ae0w==
X-Gm-Message-State: APjAAAXisNQ5r2dfepAVOp/wpc0XIPtnJueRmTPcJXSndADgOq+smdyX
 JuAdaHa9mL3p19ZDX4cf63OYqqJq5Q0=
X-Google-Smtp-Source: APXvYqxPKg4n1zJzvch6Mggp2c9KYhCWIutC6q9IYpuFihz8kTN+DzjHfETNBI2MZTNb/+I4btTppA==
X-Received: by 2002:a63:5d20:: with SMTP id r32mr2472002pgb.393.1559274973315; 
 Thu, 30 May 2019 20:56:13 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id s66sm3940582pgs.87.2019.05.30.20.56.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 20:56:12 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] PCI: Introduce pcibios_ignore_alignment_request
To: Shawn Anastasio <shawn@anastas.io>, Oliver <oohall@gmail.com>
References: <20190528040313.35582-1-shawn@anastas.io>
 <20190528040313.35582-2-shawn@anastas.io>
 <CAOSf1CEFfbmwfvmdqT1xdt8SFb=tYdYXLfXeyZ8=iRnhg4a3Pg@mail.gmail.com>
 <b0a38504-24c3-77bc-b308-7b498f07760a@ozlabs.ru>
 <bccfec8f-c8a4-fac1-7e96-be84113b9a73@anastas.io>
 <3e6b9d7d-5d18-645e-5ef9-6b8a77fa62e9@ozlabs.ru>
 <985681e4-1236-fff7-e9e7-189a340487dd@anastas.io>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <81a015ed-2c99-7ca8-c5ad-cede93aeba97@ozlabs.ru>
Date: Fri, 31 May 2019 13:56:07 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <985681e4-1236-fff7-e9e7-189a340487dd@anastas.io>
Content-Type: text/plain; charset=utf-8
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rppt@linux.ibm.com,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 xyjxie@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 31/05/2019 08:49, Shawn Anastasio wrote:
> On 5/29/19 10:39 PM, Alexey Kardashevskiy wrote:
>>
>>
>> On 28/05/2019 17:39, Shawn Anastasio wrote:
>>>
>>>
>>> On 5/28/19 1:27 AM, Alexey Kardashevskiy wrote:
>>>>
>>>>
>>>> On 28/05/2019 15:36, Oliver wrote:
>>>>> On Tue, May 28, 2019 at 2:03 PM Shawn Anastasio <shawn@anastas.io>
>>>>> wrote:
>>>>>>
>>>>>> Introduce a new pcibios function pcibios_ignore_alignment_request
>>>>>> which allows the PCI core to defer to platform-specific code to
>>>>>> determine whether or not to ignore alignment requests for PCI
>>>>>> resources.
>>>>>>
>>>>>> The existing behavior is to simply ignore alignment requests when
>>>>>> PCI_PROBE_ONLY is set. This is behavior is maintained by the
>>>>>> default implementation of pcibios_ignore_alignment_request.
>>>>>>
>>>>>> Signed-off-by: Shawn Anastasio <shawn@anastas.io>
>>>>>> ---
>>>>>>    drivers/pci/pci.c   | 9 +++++++--
>>>>>>    include/linux/pci.h | 1 +
>>>>>>    2 files changed, 8 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>>>>>> index 8abc843b1615..8207a09085d1 100644
>>>>>> --- a/drivers/pci/pci.c
>>>>>> +++ b/drivers/pci/pci.c
>>>>>> @@ -5882,6 +5882,11 @@ resource_size_t __weak
>>>>>> pcibios_default_alignment(void)
>>>>>>           return 0;
>>>>>>    }
>>>>>>
>>>>>> +int __weak pcibios_ignore_alignment_request(void)
>>>>>> +{
>>>>>> +       return pci_has_flag(PCI_PROBE_ONLY);
>>>>>> +}
>>>>>> +
>>>>>>    #define RESOURCE_ALIGNMENT_PARAM_SIZE COMMAND_LINE_SIZE
>>>>>>    static char
>>>>>> resource_alignment_param[RESOURCE_ALIGNMENT_PARAM_SIZE] = {0};
>>>>>>    static DEFINE_SPINLOCK(resource_alignment_lock);
>>>>>> @@ -5906,9 +5911,9 @@ static resource_size_t
>>>>>> pci_specified_resource_alignment(struct pci_dev *dev,
>>>>>>           p = resource_alignment_param;
>>>>>>           if (!*p && !align)
>>>>>>                   goto out;
>>>>>> -       if (pci_has_flag(PCI_PROBE_ONLY)) {
>>>>>> +       if (pcibios_ignore_alignment_request()) {
>>>>>>                   align = 0;
>>>>>> -               pr_info_once("PCI: Ignoring requested alignments
>>>>>> (PCI_PROBE_ONLY)\n");
>>>>>> +               pr_info_once("PCI: Ignoring requested alignments\n");
>>>>>>                   goto out;
>>>>>>           }
>>>>>
>>>>> I think the logic here is questionable to begin with. If the user has
>>>>> explicitly requested re-aligning a resource via the command line then
>>>>> we should probably do it even if PCI_PROBE_ONLY is set. When it breaks
>>>>> they get to keep the pieces.
>>>>>
>>>>> That said, the real issue here is that PCI_PROBE_ONLY probably
>>>>> shouldn't be set under qemu/kvm. Under the other hypervisor (PowerVM)
>>>>> hotplugged devices are configured by firmware before it's passed to
>>>>> the guest and we need to keep the FW assignments otherwise things
>>>>> break. QEMU however doesn't do any BAR assignments and relies on that
>>>>> being handled by the guest. At boot time this is done by SLOF, but
>>>>> Linux only keeps SLOF around until it's extracted the device-tree.
>>>>> Once that's done SLOF gets blown away and the kernel needs to do it's
>>>>> own BAR assignments. I'm guessing there's a hack in there to make it
>>>>> work today, but it's a little surprising that it works at all...
>>>>
>>>>
>>>> The hack is to run a modified qemu-aware "/usr/sbin/rtas_errd" in the
>>>> guest which receives an event from qemu (RAS_EPOW from
>>>> /proc/interrupts), fetches device tree chunks (and as I understand it -
>>>> they come with BARs from phyp but without from qemu) and writes "1" to
>>>> "/sys/bus/pci/rescan" which calls pci_assign_resource() eventually:
>>>
>>> Interesting. Does this mean that the PHYP hotplug path doesn't
>>> call pci_assign_resource?
>>
>>
>> I'd expect dlpar_add_slot() to be called under phyp and eventually
>> pci_device_add() which (I think) may or may not trigger later
>> reassignment.
>>
>>
>>> If so it means the patch may not
>>> break that platform after all, though it still may not be
>>> the correct way of doing things.
>>
>>
>> We should probably stop enforcing the PCI_PROBE_ONLY flag - it seems
>> that (unless resource_alignment= is used) the pseries guest should just
>> walk through all allocated resources and leave them unchanged.
> 
> If we add a pcibios_default_alignment() implementation like was
> suggested earlier, then it will behave as if the user has
> specified resource_alignment= by default and SLOF's assignments
> won't be honored (I think).


I removed pci_add_flags(PCI_PROBE_ONLY) from pSeries_setup_arch and
tried booting with and without pci=resource_alignment= and I can see no
difference - BARs are still aligned to 64K as programmed in SLOF; if I
hack SLOF to align to 4K or 32K - BARs get packed and the guest leaves
them unchanged.


> I guess it boils down to one question - is it important that we
> observe SLOF's initial BAR assignments?

It isn't if it's SLOF but it is if it's phyp. It used to not
allow/support BAR reassignment and even if it does not, I'd rather avoid
touching them.


> If not, the device tree
> modification that Sam found would work fine here. Otherwise,
> we need a way to honor the initial assignments from SLOF while
> still allowing custom alignments for hotplugged devices, either
> by deferring to the platform code like I do here, unsetting
> PCI_PROBE_ONLY in certain cases or by using IORESOURCE_PCI_FIXED
> like Bjorn suggested.
> 
>>
>>
>>>> [c000000006e6f960] [c0000000005f62d4] pci_assign_resource+0x44/0x360
>>>>
>>>> [c000000006e6fa10] [c0000000005f8b54]
>>>> assign_requested_resources_sorted+0x84/0x110
>>>> [c000000006e6fa60] [c0000000005f9540]
>>>> __assign_resources_sorted+0xd0/0x750
>>>> [c000000006e6fb40] [c0000000005fb2e0]
>>>> __pci_bus_assign_resources+0x80/0x280
>>>> [c000000006e6fc00] [c0000000005fb95c]
>>>> pci_assign_unassigned_bus_resources+0xbc/0x100
>>>> [c000000006e6fc60] [c0000000005e3d74] pci_rescan_bus+0x34/0x60
>>>>
>>>> [c000000006e6fc90] [c0000000005f1ef4] rescan_store+0x84/0xc0
>>>>
>>>> [c000000006e6fcd0] [c00000000068060c] bus_attr_store+0x3c/0x60
>>>>
>>>> [c000000006e6fcf0] [c00000000037853c] sysfs_kf_write+0x5c/0x80
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>>
>>>>> IIRC Sam Bobroff was looking at hotplug under pseries recently so he
>>>>> might have something to add. He's sick at the moment, but I'll ask him
>>>>> to take a look at this once he's back among the living
>>>>>
>>>>>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>>>>>> index 4a5a84d7bdd4..47471dcdbaf9 100644
>>>>>> --- a/include/linux/pci.h
>>>>>> +++ b/include/linux/pci.h
>>>>>> @@ -1990,6 +1990,7 @@ static inline void
>>>>>> pcibios_penalize_isa_irq(int irq, int active) {}
>>>>>>    int pcibios_alloc_irq(struct pci_dev *dev);
>>>>>>    void pcibios_free_irq(struct pci_dev *dev);
>>>>>>    resource_size_t pcibios_default_alignment(void);
>>>>>> +int pcibios_ignore_alignment_request(void);
>>>>>>
>>>>>>    #ifdef CONFIG_HIBERNATE_CALLBACKS
>>>>>>    extern struct dev_pm_ops pcibios_pm_ops;
>>>>>> -- 
>>>>>> 2.20.1
>>>>>>
>>>>
>>

-- 
Alexey
