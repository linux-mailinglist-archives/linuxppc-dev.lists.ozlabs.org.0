Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCF23AE99
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 07:21:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MhLW4lcwzDqHl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 15:21:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="J+yeHloa"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MhJl2bDzzDqHl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 15:19:33 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id s11so4551480pfm.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jun 2019 22:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PV1miJff7868IUE8sEWPGZz3XS6/GG6ytz3XTIRW7/8=;
 b=J+yeHloau0DE6m4Xi9tgtSHJ9B/YM+x+pnqKGV2xIP6LY/Pvcm855iQI1z/6Dka9P+
 VUMtTbdWO0lRUk8GS4VMdASbxt47YY0q6R2/2REC+WdZ9e0noZFkSz558ULRQmdQ5TkU
 IBc2Agtd8t+P8O7QRVC0Z19wyZsEmpITJwK6p3fYBRLG0M1aDz1Z4B9U1+VxCi3DdzOM
 lGMN0lIlZNQwLyo9+rRgWKuVRcXLaMs23bgmgYjPmintB/E10sxsPzHLPQg5o6P7x5li
 d8f/8UlowMX89kVWHLbaDVvYvhWba2DBHQJI6F12Tjc9/WQkDp2B+XUqTSfdmD7uy1K5
 vlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PV1miJff7868IUE8sEWPGZz3XS6/GG6ytz3XTIRW7/8=;
 b=h+gWgvoIiiJB0T5u0praEUJlDtRCZm00y5gpvBl9XKOUq95q2HliIwHisBCX92c6Fr
 YZVGl8pI8rjB+qN6xthaUcPQGPNxVdH/6ZIUJc9t4hhTeZeXwcatOzv1+XJnnBDe7juj
 /2xHVGeFYtZDgW9GgYrD4P0eXJMrYwRZUDMx6XzLUSJiPgc28/iggjtxN3vHtReaYWyM
 VNNTYrFeUY+0ir8vod3CYq71IPBov9RQJzxPIKIv7zIqDfyFSlE6APNbJxpERxESEhvJ
 o2t3T8d6w8vUruoGjNRoGFEjSuqLDrQFupiIEui2NAMXwGW10KNcqapAT/t7wI/fir86
 y9ug==
X-Gm-Message-State: APjAAAW7iH185aDRNH96osywdEi2645Wpt7jVnPvWZF6k/e012xTIP8r
 3aOzMjoSrrlZm+0PyQdvzjs3Xcle1yY=
X-Google-Smtp-Source: APXvYqyCdMdEoimlw+pcurgr6gWlqnPJcAJ0dDknJOfbI5s8f7D1XHHReqC18sratgec7V/uVYVY1Q==
X-Received: by 2002:a17:90a:1c1:: with SMTP id 1mr19570137pjd.72.1560143971525; 
 Sun, 09 Jun 2019 22:19:31 -0700 (PDT)
Received: from [192.168.10.86] (124-171-137-251.dyn.iinet.net.au.
 [124.171.137.251])
 by smtp.gmail.com with ESMTPSA id l7sm9877360pfl.9.2019.06.09.22.19.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Jun 2019 22:19:30 -0700 (PDT)
Subject: Re: [PATCH kernel v3 0/3] powerpc/ioda2: Yet another attempt to allow
 DMA masks between 32 and 59
To: Alistair Popple <alistair@popple.id.au>, Oliver <oohall@gmail.com>
References: <20190530070355.121802-1-aik@ozlabs.ru>
 <4003261.yxAxO8Uj8t@townsend>
 <CAOSf1CEKwFHLHLC+CAiEiH=9v+hfRgTSuNUH3hXR4eDyQM1G9g@mail.gmail.com>
 <2377993.PuYYC6lyoP@townsend>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <d46372f8-2529-d5ae-5da0-cc1eafa1a59e@ozlabs.ru>
Date: Mon, 10 Jun 2019 15:19:26 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2377993.PuYYC6lyoP@townsend>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Shawn Anastasio <shawn@anastas.io>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/06/2019 11:41, Alistair Popple wrote:
> On Thursday, 6 June 2019 10:07:54 PM AEST Oliver wrote:
>> On Thu, Jun 6, 2019 at 5:17 PM Alistair Popple <alistair@popple.id.au> 
> wrote:
>>> I have been hitting EEH address errors testing this with some network
>>> cards which map/unmap DMA addresses more frequently. For example:
>>>
>>> PHB4 PHB#5 Diag-data (Version: 1)
>>> brdgCtl:    00000002
>>> RootSts:    00060020 00402000 a0220008 00100107 00000800
>>> PhbSts:     0000001c00000000 0000001c00000000
>>> Lem:        0000000100000080 0000000000000000 0000000000000080
>>> PhbErr:     0000028000000000 0000020000000000 2148000098000240
>>> a008400000000000 RxeTceErr:  2000000000000000 2000000000000000
>>> c000000000000000 0000000000000000 PblErr:     0000000000020000
>>> 0000000000020000 0000000000000000 0000000000000000 RegbErr:   
>>> 0000004000000000 0000004000000000 61000c4800000000 0000000000000000
>>> PE[000] A/B: 8300b03800000000 8000000000000000
>>>
>>> Interestingly the PE[000] A/B data is the same across different cards
>>> and drivers.
>>
>> TCE page fault due to permissions so odds are the DMA address was unmapped.
>>
>> What cards did you get this with? I tried with one of the common
>> BCM5719 NICs and generated network traffic by using rsync to copy a
>> linux git tree to the system and it worked fine.
> 
> Personally I've seen it with the BCM5719 with the driver modified to set a DMA 
> mask of 48 bits instead of 64 and using scp to copy a random 1GB file to the 
> system repeatedly until it crashes. 
> 
> I have also had reports of someone hitting the same error using a Mellanox 
> CX-5 adaptor with a similar driver modification.
> 
> - Alistair


Seems to be a race (I could see broken TCEs), this helps on my setup:


diff --git a/arch/powerpc/include/asm/iommu.h
b/arch/powerpc/include/asm/iommu.h
index f920697c03ef..215351e16ae8 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -113,6 +113,7 @@ struct iommu_table {
        int it_nid;
        unsigned long it_reserved_start; /* Start of not-DMA-able (MMIO)
area */
        unsigned long it_reserved_end;
+       spinlock_t lock;
 };

 #define IOMMU_TABLE_USERSPACE_ENTRY_RO(tbl, entry) \
diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
index c75ec37bf0cd..7045b6518243 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
@@ -29,6 +29,7 @@ void pnv_pci_setup_iommu_table(struct iommu_table *tbl,
        tbl->it_size = tce_size >> 3;
        tbl->it_busno = 0;
        tbl->it_type = TCE_PCI;
+       spin_lock_init(&tbl->lock);
 }

 static __be64 *pnv_alloc_tce_level(int nid, unsigned int shift)
@@ -65,14 +66,17 @@ static __be64 *pnv_tce(struct iommu_table *tbl, bool
user, long idx, bool alloc)

                        if (!alloc)
                                return NULL;
-
-                       tmp2 = pnv_alloc_tce_level(tbl->it_nid,
-                                       ilog2(tbl->it_level_size) + 3);
-                       if (!tmp2)
-                               return NULL;
-
-                       tmp[n] = cpu_to_be64(__pa(tmp2) |
-                                       TCE_PCI_READ | TCE_PCI_WRITE);
+                       }
+                       spin_lock(&tbl->lock);
+                       if (tmp[n] == 0) {
+                               tmp2 = pnv_alloc_tce_level(tbl->it_nid,
+
ilog2(tbl->it_level_size) + 3);
+                               if (!tmp2)
+                                       return NULL;
+                               tmp[n] = cpu_to_be64(__pa(tmp2) |
+                                               TCE_PCI_READ |
TCE_PCI_WRITE);
+                       }
+                       spin_unlock(&tbl->lock);
                }
                tce = be64_to_cpu(tmp[n]);




-- 
Alexey
