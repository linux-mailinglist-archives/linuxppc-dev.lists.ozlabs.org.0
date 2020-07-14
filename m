Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E2721EC83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 11:19:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5Zhr2Yd0zDqLV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 19:19:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0qmWk7Sl; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5ZVt6VxhzDqcF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 19:10:46 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id l63so7318416pge.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 02:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VlVGzTMuMF/T4YATeKJyzLn0WQXGqD01V/wK+psem2k=;
 b=0qmWk7SlpQDKwYPxLtQIce1mjpHoB5HJt9fM2HVMZ52Ixnc2mrDMhhaWTzrHpD1pYr
 nDhXkURefPSyjuiuwikwnY7ItpeeyqWl4BR5BuckLAfH/++ASEKUGadvWCJ8NPkJ+Q2P
 4xZwWriMIcTgkim6Z5np+rj7u4nTJp6HxhnJvUuk/ZFDjh09H+Z1YMESxVvRWV9jQVwH
 Bh1EAIhcZ/whg9urahzuhlQ933HsKC4fubANhffG66vKfxAfeqfuua6POUSR0GAaezei
 p+vQxjiVOw3me0BUk0+YR8Rxx4PxeHJ53Tt6B7+XM82Fh2M0MfRytGhWhrWfskgEJugE
 ANkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VlVGzTMuMF/T4YATeKJyzLn0WQXGqD01V/wK+psem2k=;
 b=TNiv33GOSFWZX62QmTMBqMQjJGzkAk39r7aT36kT8eNOgDCO+rC7wVPPVFjowqxbpr
 Yd1SyZoTa+0sWGEZIxAdBpEqCdKe0cx77/xJmY/m8bJKzHNalouhIXbsGVnYP/HpIyZ8
 RFjIYL8LN6OKrPB8BvHElfzRagaye04gCeFrbYuZ6Cd3AbanChaEKd8dd4mOKhKBbjXx
 +BnDfgX20Si/l9EOWoj7zhMAYCYy+tq8+x4dtpyVCSvN7o35d+jsZcgRmZPZ/y2N7QcP
 MGDQKy9Qopmrr+aEgDzoZLDtZpbx4qb9pT13sOPWOV5M5EOP92xwee6nXtefXOqANr5v
 ddGg==
X-Gm-Message-State: AOAM531EafbRtlZqu5MwNjXSvdg4O8ga75e25HhqZuQ20Yn0lqwPYNTu
 AlYzhgGz2KszZsIrFjA7USitIA==
X-Google-Smtp-Source: ABdhPJz3wG3pAievdyM1GIlkLbNcRY0DrwjObAIuvlBM8iwmTQv+r4+qEmAUKBciBUiWYCkUMe7zcA==
X-Received: by 2002:a62:7581:: with SMTP id q123mr3595509pfc.232.1594717840784; 
 Tue, 14 Jul 2020 02:10:40 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id f3sm1840465pju.54.2020.07.14.02.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 02:10:40 -0700 (PDT)
Subject: Re: [PATCH 14/14] powerpc/eeh: Move PE tree setup into the platform
To: Oliver O'Halloran <oohall@gmail.com>
References: <20200706013619.459420-1-oohall@gmail.com>
 <20200706013619.459420-15-oohall@gmail.com>
 <d2ce45e8-92e6-f875-fd38-c3fa82bf8f4e@ozlabs.ru>
 <CAOSf1CGRXox-fO7cJNA+0APjrQOUve01jUbjLmXWqjH=07cGxg@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <aca6ef45-9661-aa7f-ceac-60b9a91a9f83@ozlabs.ru>
Date: Tue, 14 Jul 2020 19:10:36 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CGRXox-fO7cJNA+0APjrQOUve01jUbjLmXWqjH=07cGxg@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/07/2020 13:08, Oliver O'Halloran wrote:
> On Tue, Jul 14, 2020 at 11:50 AM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>> On 06/07/2020 11:36, Oliver O'Halloran wrote:
>>>  /**
>>>   * eeh_pe_tree_insert - Add EEH device to parent PE
>>>   * @edev: EEH device
>>> + * @new_pe_parent: PE to create additional PEs under
>>>   *
>>> - * Add EEH device to the parent PE. If the parent PE already
>>> - * exists, the PE type will be changed to EEH_PE_BUS. Otherwise,
>>> - * we have to create new PE to hold the EEH device and the new
>>> - * PE will be linked to its parent PE as well.
>>> + * Add EEH device to the PE in edev->pe_config_addr. If a PE already
>>> + * exists with that address then @edev is added to that PE. Otherwise
>>> + * a new PE is created and inserted into the PE tree as a child of
>>> + * @new_pe_parent.
>>> + *
>>> + * If @new_pe_parent is NULL then the new PE will be inserted under
>>> + * directly under the the PHB.
>>>   */
>>> -int eeh_pe_tree_insert(struct eeh_dev *edev)
>>> +int eeh_pe_tree_insert(struct eeh_dev *edev, struct eeh_pe *new_pe_parent)
>>>  {
>>>       struct pci_controller *hose = edev->controller;
>>>       struct eeh_pe *pe, *parent;
>>
>>
>> We can ditch this "parent" in that single place now and use "pe"
>> instead. And name the new parameter simply "parent". Dunno if it
>> improves things though.
> 
> I did this at some point and then decided not to. It added a bunch of
> noise to the diff and calling the parameter "parent" ended up being
> pretty unreadable. The parameter is "the parent of the PE that will be
> created to contain edev", or "parent of the parent PE". It's pretty
> unwieldy.

Ok fine but we still do not need both pe and parent in that function
(may be one day...).


> 
>>> @@ -399,7 +366,7 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
>>>                       }
>>>
>>>                       eeh_edev_dbg(edev,
>>> -                                  "Added to device PE (parent: PE#%x)\n",
>>> +                                  "Added to existing PE (parent: PE#%x)\n",
>>>                                    pe->parent->addr);
>>>               } else {
>>>                       /* Mark the PE as type of PCI bus */
>>> @@ -431,10 +398,9 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
>>>        * to PHB directly. Otherwise, we have to associate the
>>>        * PE with its parent.
>>>        */
>>> -     parent = eeh_pe_get_parent(edev);
>>> -     if (!parent) {
>>> -             parent = eeh_phb_pe_get(hose);
>>> -             if (!parent) {
>>> +     if (!new_pe_parent) {
>>> +             new_pe_parent = eeh_phb_pe_get(hose);
>>> +             if (!new_pe_parent) {
>>
>>
>>
>> afaict only pseries can realisticly pass new_pe_parent==NULL so this
>> chunk could go to pseries_eeh_pe_get_parent.
> 
> pnv_eeh_get_upstream_pe() will never return the PHB PE so
> new_pe_parent will be NULL for the first PE created under a PowerNV
> PHB. I guess we could move the PHB PE handling into the platform too,
> but I think that just results in having to special case PHB PEs in two
> places rather than one.
> 
>>> +static struct eeh_pe *pseries_eeh_pe_get_parent(struct eeh_dev *edev)
>>> +{
>>> +     struct eeh_dev *parent;
>>> +     struct pci_dn *pdn = eeh_dev_to_pdn(edev);
>>> +
>>> +     /*
>>> +      * It might have the case for the indirect parent
>>> +      * EEH device already having associated PE, but
>>> +      * the direct parent EEH device doesn't have yet.
>>> +      */
>>> +     if (edev->physfn)
>>> +             pdn = pci_get_pdn(edev->physfn);
>>> +     else
>>> +             pdn = pdn ? pdn->parent : NULL;
>>> +     while (pdn) {
>>> +             /* We're poking out of PCI territory */
>>
>>
>> We are traversing up PCI hierarchy here - pci_dn->parent, how is this
>> out of PCI territory? Or I understand "out of" incorrectly?
>>
>>
>>> +             parent = pdn_to_eeh_dev(pdn);
>>> +             if (!parent)
>>> +                     return NULL;
> 
> If there's no eeh dev then the node we're looking at is a PHB rather
> than an actual PCI device so it stops looking. I think. The comment
> was copied over from the existing code and I haven't spent a whole lot
> of time parsing it's meaning.


I noticed cut-n-paste. May be just ditch it if nobody can parse it?

> 
> 
> 
>>> @@ -301,6 +343,8 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
>>>       if (ret) {
>>>               eeh_edev_dbg(edev, "EEH failed to enable on device (code %d)\n", ret);
>>>       } else {
>>> +             struct eeh_pe *parent;
>>> +
>>>               /* Retrieve PE address */
>>>               edev->pe_config_addr = pseries_eeh_get_pe_addr(pdn);
>>>               pe.addr = edev->pe_config_addr;
>>> @@ -313,16 +357,23 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
>>>               if (ret > 0 && ret != EEH_STATE_NOT_SUPPORT)
>>>                       enable = 1;
>>>
>>> -             if (enable) {
>>> +             /* This device doesn't support EEH, but it may have an
>>> +              * EEH parent, in which case we mark it as supported.
>>> +              */
>>> +             parent = pseries_eeh_pe_get_parent(edev);
>>> +             if (parent && !enable)
>>> +                     edev->pe_config_addr = parent->addr;
>>
>>
>> What if pseries_eeh_pe_get_parent() returned NULL - we won't write
>> edev->pe_config_addr so it remains 0 which is fine just by accident? :)
> 
> edev->pe_config_addr is set above when we call
> pseries_eeh_get_pe_addr(). The check there is mainly to cover the case
> where pseries_eeh_get_pe_addr() fails because the device is on a
> subordinate bus rather than the root bus of the PE. PAPR says the
> get-pe-addr-info RTAS call can fail in that situation and that you're
> supposed to traverse up the DT to find the pe_config_addr, which is
> what pe_get_parent() does. Yeah it's confusing, but that's what it
> does today too.
> 
>> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>
>>> +
>>> +             if (enable || parent) {
>>>                       eeh_add_flag(EEH_ENABLED);
>>> -                     eeh_pe_tree_insert(edev);
>>> +                     eeh_pe_tree_insert(edev, parent);
> 
>>>               } else if (pdn->parent && pdn_to_eeh_dev(pdn->parent) &&
>>>                          (pdn_to_eeh_dev(pdn->parent))->pe) {
>>>                       /* This device doesn't support EEH, but it may have an
>>>                        * EEH parent, in which case we mark it as supported.
>>>                        */
>>>                       edev->pe_config_addr = pdn_to_eeh_dev(pdn->parent)->pe_config_addr;
>>> -                     eeh_pe_tree_insert(edev);
>>> +                     eeh_pe_tree_insert(edev, parent);
> 
> I think I was supposed to delete this hunk and then forgot to since it
> handles the same case mentioned above.

A-ha!


> 
>>>               }
>>>               eeh_edev_dbg(edev, "EEH is %s on device (code %d)\n",
>>>                            (enable ? "enabled" : "unsupported"), ret);
>>>
>>
>> --
>> Alexey

-- 
Alexey
