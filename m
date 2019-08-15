Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F61E8ED97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 16:03:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468Spk2Kg6zDqtS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 00:03:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="aYEPvkrH"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Sl46GdhzDr42
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 00:00:15 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id b24so1395282pfp.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 07:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=kot60O3Olu8WqeSmjEjz6CQZgG8vPCoSAfrIy/T0dgU=;
 b=aYEPvkrHn1SfQaI1tCZG8bouFvgu3mTRwAedGlo45/AsIQdsHVyhJwN+9lT3Gq1wGo
 veq+qgD3NNN8e4otDWN5U/D+7daAptfC4u1ojRINY7URfs4ueB6AE1TIU7BecKKgbqyl
 PF82xEg/PlEhxYdTu8yzoI+u+J1gogFicpOAIKgLU1r/JNYnyFIs6i8qBmOV6sn8XoHV
 4yRFQtFKvWoLLwM81+d9TZNPjG7+nGnH6o/rr1zpBL8945k0HC8Wwzqn4vcpWGa2c56/
 hsIVOyKXMEC2BNpEU1Dp7c75J5Qiitd2ED0eGbPVBp1mn47iCPtkSQDfpQm2DRIK67jD
 IF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=kot60O3Olu8WqeSmjEjz6CQZgG8vPCoSAfrIy/T0dgU=;
 b=OrH9EQ6UBxO5NJIgxDqfLZhB7kXx4oWjaTfEBcW9iuSdRbr/6BEe4PZPsQaG0EK6vY
 T27yBQ0/WDothd1J9YZIL+708jUcpUl3ieFIFfDaVEEWF4rafqV3FmtkdSFbAx1B5Hvt
 iH+0bqijtXkXrqTY8dfs9AStS4LZTAoktCJUTyGrjFUQaJvWY5cWgOiFkhj2YOrmOPtH
 3CkCLwd1Wj2F6WgMuJPCoCxUu7NrfpkE/W9jy3PIgAn8xw2xGtfEMgib6irz7SEwg57y
 n51N4kyli6b4Eg2FvrkpG9iDVDeir06RJullL7xPfiRpNCsH4klEnw+NLBMl2QZwxCkq
 F2lg==
X-Gm-Message-State: APjAAAXPTtrE3wNCuQSeRq3yMG4KQdIuPGVC151Nq5aMq4ay5qgfoa/t
 lpW1YKwiMIXSlRcerRmue0nbQw==
X-Google-Smtp-Source: APXvYqxvWphnfI7ZrW62rZyazHLUGGLZHguV+yc6COlZo1PP9Tyq7ZoC31DLl3Waj3ufpVjdOoWpiw==
X-Received: by 2002:a62:1444:: with SMTP id 65mr5469863pfu.145.1565877611635; 
 Thu, 15 Aug 2019 07:00:11 -0700 (PDT)
Received: from localhost ([49.205.218.176])
 by smtp.gmail.com with ESMTPSA id s16sm2870024pfs.6.2019.08.15.07.00.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 15 Aug 2019 07:00:10 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH 3/3] papr/scm: Add bad memory ranges to nvdimm bad ranges
In-Reply-To: <CAOSf1CFqFHqCKQ7tf1CZjucdH5UnZ_DiuqEkppwZZLc0qYY-ZQ@mail.gmail.com>
References: <20190814082452.28013-1-santosh@fossix.org>
 <20190814082452.28013-4-santosh@fossix.org>
 <CAOSf1CFqFHqCKQ7tf1CZjucdH5UnZ_DiuqEkppwZZLc0qYY-ZQ@mail.gmail.com>
Date: Thu, 15 Aug 2019 19:30:08 +0530
Message-ID: <87imqyplzr.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Reza Arbab <arbab@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:

> On Wed, Aug 14, 2019 at 6:25 PM Santosh Sivaraj <santosh@fossix.org> wrote:
>>
>> Subscribe to the MCE notification and add the physical address which
>> generated a memory error to nvdimm bad range.
>>
>> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
>> ---
>>  arch/powerpc/platforms/pseries/papr_scm.c | 65 +++++++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index a5ac371a3f06..4d25c98a9835 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -12,6 +12,8 @@
>>  #include <linux/libnvdimm.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/delay.h>
>> +#include <linux/nd.h>
>> +#include <asm/mce.h>
>>
>>  #include <asm/plpar_wrappers.h>
>>
>> @@ -39,8 +41,12 @@ struct papr_scm_priv {
>>         struct resource res;
>>         struct nd_region *region;
>>         struct nd_interleave_set nd_set;
>> +       struct list_head list;
>
> list is not a meaningful name. call it something more descriptive.
>
>>  };
>>
>> +LIST_HEAD(papr_nd_regions);
>> +DEFINE_MUTEX(papr_ndr_lock);
>
> Should this be a mutex or a spinlock? I don't know what context the
> mce notifier is called from, but if it's not sleepable then a mutex
> will cause problems. Did you test this with lockdep enabled?

This would be a mutex, we are called from a blocking notifier.

>
>> +
>>  static int drc_pmem_bind(struct papr_scm_priv *p)
>>  {
>>         unsigned long ret[PLPAR_HCALL_BUFSIZE];
>> @@ -364,6 +370,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>>                 dev_info(dev, "Region registered with target node %d and online node %d",
>>                          target_nid, online_nid);
>>
>> +       mutex_lock(&papr_ndr_lock);
>> +       list_add_tail(&p->list, &papr_nd_regions);
>> +       mutex_unlock(&papr_ndr_lock);
>> +
>
> Where's the matching remove when we unbind the driver?

Missed it completely. Will fix it.

>
>>         return 0;
>>pp
>>  err:   nvdimm_bus_unregister(p->bus);
>> @@ -371,6 +381,60 @@ err:       nvdimm_bus_unregister(p->bus);
>>         return -ENXIO;
>>  }
>>
>> +static int handle_mce_ue(struct notifier_block *nb, unsigned long val,
>> +                        void *data)
>> +{
>> +       struct machine_check_event *evt = data;
>> +       struct papr_scm_priv *p;
>> +       u64 phys_addr;
>> +
>> +       if (evt->error_type != MCE_ERROR_TYPE_UE)
>> +               return NOTIFY_DONE;
>> +
>> +       if (list_empty(&papr_nd_regions))
>> +               return NOTIFY_DONE;
>> +
>> +       phys_addr = evt->u.ue_error.physical_address +
>> +               (evt->u.ue_error.effective_address & ~PAGE_MASK);
>
> Wait what? Why is physical_address page aligned, but effective_address
> not? Not a problem with this patch, but still, what the hell?

Not sure why, but its the way now. I can see if I can update it if it makes
sense in a later patch.

>
>> +       if (!evt->u.ue_error.physical_address_provided ||
>> +           !is_zone_device_page(pfn_to_page(phys_addr >> PAGE_SHIFT)))
>> +               return NOTIFY_DONE;
>> +
>> +       mutex_lock(&papr_ndr_lock);
>> +       list_for_each_entry(p, &papr_nd_regions, list) {
>> +               struct resource res = p->res;
>> +               u64 aligned_addr;
>> +
>
>> +               if (res.start > phys_addr)
>> +                       continue;
>> +
>> +               if (res.end < phys_addr)
>> +                       continue;
>
> surely there's a helper for this
>
>> +
>> +               aligned_addr = ALIGN_DOWN(phys_addr, L1_CACHE_BYTES);
>> +               pr_debug("Add memory range (0x%llx -- 0x%llx) as bad range\n",
>> +                        aligned_addr, aligned_addr + L1_CACHE_BYTES);
>> +
>> +               if (nvdimm_bus_add_badrange(p->bus,
>> +                                           aligned_addr, L1_CACHE_BYTES))
>> +                       pr_warn("Failed to add bad range (0x%llx -- 0x%llx)\n",
>> +                               aligned_addr, aligned_addr + L1_CACHE_BYTES);
>> +
>> +               nvdimm_region_notify(p->region,
>> +                                    NVDIMM_REVALIDATE_POISON);
>> +
>> +               break;
>
> nit: you can avoid stacking indetation levels by breaking out of the
> loop as soon as you've found the region you're looking for.

True.

>
>> +       }
>> +       mutex_unlock(&papr_ndr_lock);
>> +
>> +       return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block mce_ue_nb = {
>> +       .notifier_call = handle_mce_ue
>> +};
>> +
>>  static int papr_scm_probe(struct platform_device *pdev)
>>  {
>>         struct device_node *dn = pdev->dev.of_node;
>> @@ -456,6 +520,7 @@ static int papr_scm_probe(struct platform_device *pdev)
>>                 goto err2;
>>
>>         platform_set_drvdata(pdev, p);
>> +       mce_register_notifier(&mce_ue_nb);
>
> Either get rid of the global region list and have a notifier block in
> each device's driver private data, or keep the global list and
> register the notifier in module_init(). Re-registering the notifier
> each time a seperate device is probed seems very sketchy.

Registering the notifier in the init is simpler. I will change it.

>
>>         return 0;
>>
>> --
>> 2.21.0
p>>
