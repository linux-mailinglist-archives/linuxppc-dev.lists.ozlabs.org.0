Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F7E21E742
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 07:01:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5SzF52GTzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 15:01:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=QqSsUUqP; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5Smh74zQzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 14:52:20 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id d4so7066026pgk.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 21:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wL6p9uiSK8+WCAZmqiXZp3eTaRiKzRKo7/r/xXG5Ihk=;
 b=QqSsUUqPN5AsmAJ71rJ21Uu5ONnQDGOEc1xrQ85JJjVo7nN0iH3yUTrf+6oLwT1jZw
 XCbBur2174doqajG9dj1pb7WZ6SKlGpWr+978dOPDsTEGT0n350v5F5k53TCL8w4I0CN
 c/m1Sl40y6ONmzvQUzz8jZNXblp+NVXIYyl389PbPgbY0NnnbIpY8R3VYe5oLHIc8+Ek
 wGb/9SL4SV+fWrwm0gTC2+kDaWRRKbjyNC5cr8+oo8vyKC4yo/zJNukqK1/KrePi2u0n
 lXnjkowug1CnbEHjBPETsZENjUAEr6y2Dm1kPoOUYhQ9NUipY0keyW6Kvtom35EQbjEJ
 Z5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wL6p9uiSK8+WCAZmqiXZp3eTaRiKzRKo7/r/xXG5Ihk=;
 b=i10SxqbJFDjAu9+CCr5ijDNghMzL1plsGNYgOj7uqCE9YsVh6ZPVtr9ICZy8ebMbRF
 sSmNBjs+DEbcOBt5EGgwIwXGyrrRfwTQztk25W0Me6PwOLLp2OEOdrjnhxk9zihtzl5b
 3Hce2Km/MBVH/5IA+9TVaTYioR8soU9vUgF9Ivbrk6P/g5f3jyPQ9T/PWjjzUemgVRPs
 ft/iPLdUL9Czxmn6t8vO/SmKa3pvxFymi9ZClIszXQoOnxuX25ZSg+mwHExC/5vGWAIh
 YOWINw9LKij3zg9HUnKOFbJgs2Srnm/lQ/SOy+OC3O5OKwYj0H2oKQfVS/lYHG7KFJDb
 lQSA==
X-Gm-Message-State: AOAM533YUfkaHfLZnusDxy4SuHiosKboE424kTOujrAxxqN245bYKDFw
 9g5BYVeyKt6d4+rid93X2Qv7qg==
X-Google-Smtp-Source: ABdhPJzsiw+0XEW3ygSntiNJlYzJcmPlCVdCD5nr0WXIKdwS/Vo3Eb6mb3Hl/BAejvkcbIV1sPr3HA==
X-Received: by 2002:a65:55c2:: with SMTP id k2mr1943602pgs.451.1594702336611; 
 Mon, 13 Jul 2020 21:52:16 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id p30sm16776793pfq.153.2020.07.13.21.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 21:52:15 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
References: <20200703061844.111865-1-leobras.c@gmail.com>
 <20200703061844.111865-5-leobras.c@gmail.com>
 <cc15a81d-04d9-3ee4-4fdb-093618f6e635@ozlabs.ru>
 <8c29be499e8741e7d77d53ca005034a2ca0179ac.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <18fd94d2-4365-16d1-7c85-af07d5c9a0f3@ozlabs.ru>
Date: Tue, 14 Jul 2020 14:52:10 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8c29be499e8741e7d77d53ca005034a2ca0179ac.camel@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/07/2020 12:40, Leonardo Bras wrote:
> Thank you for this feedback Alexey!
> 
> On Mon, 2020-07-13 at 17:33 +1000, Alexey Kardashevskiy wrote:
>> [...]
>>> -	int len, ret;
>>> +	int len, ret, reset_win_ext;
>>
>> Make it "reset_token".
> 
> Oh, it's not a token here, it just checks if the reset_win extension
> exists. The token would be returned in *value, but since we did not
> need it here, it's not copied.

ah right, so it is a bool actually.


> 
>>> [...]
>>> -out_failed:
>>> +out_restore_defwin:
>>> +	if (default_win && reset_win_ext == 0)
>>
>> reset_win_ext potentially may be uninitialized here. Yeah I know it is
>> tied to default_win but still.
> 
> I can't see it being used uninitialized here, as you said it's tied to
> default_win. 

Where it is declared - it is not initialized so in theory it can skip
"if (query.windows_available == 0)".


> Could you please tell me how it can be used uninitialized here, or what
> is bad by doing this way?
> 
>> After looking at this function for a few minutes, it could use some
>> refactoring (way too many gotos)  such as:
> 
> Yes, I agree.
> 
>> 1. move (query.page_size & xx) checks before "if
>> (query.windows_available == 0)"
> 
> Moving 'page_size selection' above 'checking windows available' will
> need us to duplicate the 'page_size selection' after the new query,
> inside the if.

page_size selection is not going to change, why?


> I mean, as query will be done again, it will need to get the (new) page
> size.
> 
>> 2. move "win64 = kzalloc(sizeof(struct property), GFP_KERNEL)" before
>> "if (query.windows_available == 0)"
> 
>> 3. call "reset_dma_window(dev, pdn)" inside the "if
>> (query.windows_available == 0)" branch.
> 
>> Then you can drop all "goto out_restore_defwin" and move default_win and
>> reset_win_ext inside "if (query.windows_available == 0)".
> 
> I did all changes suggested locally and did some analysis in the
> result:
> 
> I did not see a way to put default_win and reset_win_ext inside 
> "if (query.windows_available == 0)", because if we still need a way to
> know if the default window was removed, and if so, restore in case
> anything ever fails ahead (like creating the node property). 

Ah, I missed that new out_restore_defwin label is between other exit
labels. Sorry :-/


> But from that analysis I noted it's possible to remove all the new
> "goto out_restore_defwin", if we do default_win = NULL if
> ddw_read_ext() fails. 
> 
> So testing only default_win should always be enough to say if the
> default window was deleted, and reset_win_ext could be moved inside "if
> (query.windows_available == 0)".
> Also, it would avoid reset_win_ext being 'used uninitialized' and
> "out_restore_defwin:" would not be needed.
> 
> Against the current patch, we would have something like this:
> 
> #####
> 
>  static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  {
> -       int len, ret, reset_win_ext;
> +       int len, ret;
>         struct ddw_query_response query;
>         struct ddw_create_response create;
>         int page_shift;
> @@ -1173,25 +1173,28 @@ static u64 enable_ddw(struct pci_dev *dev,
> struct device_node *pdn)
>          * for extensions presence.
>          */
>         if (query.windows_available == 0) {
> +               int reset_win_ext;
>                 default_win = of_find_property(pdn, "ibm,dma-window",
> NULL);
>                 if (!default_win)
>                         goto out_failed;
>  
>                 reset_win_ext = ddw_read_ext(pdn,
> DDW_EXT_RESET_DMA_WIN, NULL);
> -               if (reset_win_ext)
> +               if (reset_win_ext){
> +                       default_win = NULL;
>                         goto out_failed;
> +               }


This says "if we can reset, then we fail", no?

>                 remove_dma_window(pdn, ddw_avail, default_win);


I think you can do "default_win=NULL" here and later at
out_restore_defwin check if it is NULL - then call reset.

>                 /* Query again, to check if the window is available */
>                 ret = query_ddw(dev, ddw_avail, &query, pdn);
>                 if (ret != 0)
> -                       goto out_restore_defwin;
> +                       goto out_failed;
>  
>                 if (query.windows_available == 0) {
>                         /* no windows are available for this device. */
>                         dev_dbg(&dev->dev, "no free dynamic windows");
> -                       goto out_restore_defwin;
> +                       goto out_failed;
>                 }
>         }
>         if (query.page_size & 4) {
> @@ -1203,7 +1206,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct
> device_node *pdn)
>         } else {
>                 dev_dbg(&dev->dev, "no supported direct page size in
> mask %x",
>                           query.page_size);
> -               goto out_restore_defwin;
> +               goto out_failed;
>         }
>         /* verify the window * number of ptes will map the partition */
>         /* check largest block * page size > max memory hotplug addr */
> @@ -1212,14 +1215,14 @@ static u64 enable_ddw(struct pci_dev *dev,
> struct device_node *pdn)
>                 dev_dbg(&dev->dev, "can't map partition max 0x%llx with
> %llu "
>                           "%llu-sized pages\n",
> max_addr,  query.largest_available_block,
>                           1ULL << page_shift);
> -               goto out_restore_defwin;
> +               goto out_failed;
>         }
>         len = order_base_2(max_addr);
>         win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
>         if (!win64) {
>                 dev_info(&dev->dev,
>                         "couldn't allocate property for 64bit dma
> window\n");
> -               goto out_restore_defwin;
> +               goto out_failed;
>         }
>         win64->name = kstrdup(DIRECT64_PROPNAME, GFP_KERNEL);
>         win64->value = ddwprop = kmalloc(sizeof(*ddwprop), GFP_KERNEL);
> @@ -1282,11 +1285,10 @@ static u64 enable_ddw(struct pci_dev *dev,
> struct device_node *pdn)
>         kfree(win64->value);
>         kfree(win64);
>  
> -out_restore_defwin:
> -       if (default_win && reset_win_ext == 0)
> +out_failed:
> +       if (default_win)
>                 reset_dma_window(dev, pdn);
>  
> -out_failed:
>         fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
>         if (!fpdn)
>                 goto out_unlock;
> 
> #####
> 
> What do you think?
> 
> 
> 
>> The rest of the series is good as it is,
> 
> Thank you :)
> 
>>  however it may conflict with
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200713062348.100552-1-aik@ozlabs.ru/
>> and the patchset it is made on top of -
>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=188385 .
> 
> <From the message of the first link>
>> (do not rush, let me finish reviewing this first) 
> 
> Ok, I have no problem rebasing on top of those patchsets, but what
> would you suggest to be done?

Polish this patch one more time and if by the time when you reposted it
the other patchset is not in upstream, I'll ask Michael to take yours first.


> Would it be ok doing a big multi-author patchset, so we guarantee it
> being applied in the correct order?
>> (You probably want me to rebase my patchset on top of Hellwig + yours,
> right?) 

Nah, at least not yet.


-- 
Alexey
