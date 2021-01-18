Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B22292F9894
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 05:15:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJz311bqnzDrPv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 15:15:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=lH9p2Kbx; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DJz0d3Mn0zDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 15:13:02 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id cq1so8631054pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jan 2021 20:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tLTmDb7Sn99oTxNR4i6w76cwCUK+qAEpFF0lq63zckA=;
 b=lH9p2Kbxl5mIleldDx2khKoRFsywv82NlKBXOvROwPImratdO6+Cy57Y7iyWEyUI+W
 O/uKsoe/HLzHnGPpFNEHjUW0512YEQBYL0NWZtLURwcQsFj0PH7RAcASCfDqcbEC4s2Z
 fUOEtfLTZMo+7HQyWCZ8HFVq5D/yr5SreB8hRKNjngEtV9qQYsD9H5KBUc+Oum9deu7G
 257tsoXJglysLaVW6+UnOu+KLI9TEkvpcUpyHqE0Glhezfg6o32uQnTWTvipHGLoWI/0
 k3+RTV0JO8xvZmKDdFXKpvARJ9hWALy3A7BkibxeLldJBq3qgx2EKDVgaUUBeTlqykAe
 3VWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tLTmDb7Sn99oTxNR4i6w76cwCUK+qAEpFF0lq63zckA=;
 b=qZjZL5aHhxspSFsYaCdGj+o3BGAq9ICbaXGQfvOB4ietpM6304rs4WIeebUsdNo5iU
 LADgras5FuAxQv7jmg6OfkFJdRCwAuPkA4nAgllXhxkmUOrOn7r/NU3aaHEDnlKKnAkc
 jVGdGN1DaHT0F8Jh+Asxe+Y5unU9a57Ld2P9aQuAwMN/wdAQUzzWKV8+OzMRG70VewtL
 tpBoopJHMMbpYfUlzQXM0ipmxTsLoiTUQTvmTRWmPB7uJvLa2UdBUQc5HQnwfmKHK4tA
 YobT/42sOTO3TJ5ZPz0d/0Qyt1jF8TK7ioVgyp4DKqY1Uyt92MPJz1XQNZXjle7iKCQZ
 gNzg==
X-Gm-Message-State: AOAM531NxMFgbAmEUNXdbfMtdBqZcmHoiOhyyj8a0v7zk/oMmDwhhFQ8
 m2Qr8VxKrHwb8wiu7ELe7ej0TA==
X-Google-Smtp-Source: ABdhPJwNGwBPbg78bYgEnTJjIT7C2CX8mMffcE1UrJ0CAuF/YXUt1ik+EheJcoXrw3mKGzDt5xvWvA==
X-Received: by 2002:a17:902:9894:b029:da:5698:7f7b with SMTP id
 s20-20020a1709029894b02900da56987f7bmr24665976plp.78.1610943178095; 
 Sun, 17 Jan 2021 20:12:58 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id z3sm14383559pfq.89.2021.01.17.20.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 20:12:57 -0800 (PST)
Subject: Re: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-7-nathanl@linux.ibm.com>
 <5276937f-b72a-89ba-d0d8-19e4be55ae35@ozlabs.ru>
 <87czy6xlap.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <3c5141d5-ee78-3771-3410-37635d423945@ozlabs.ru>
Date: Mon, 18 Jan 2021 15:12:51 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <87czy6xlap.fsf@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 16/01/2021 02:38, Nathan Lynch wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>> On 15/01/2021 09:00, Nathan Lynch wrote:
>>> Memory locations passed as arguments from the OS to RTAS usually need
>>> to be addressable in 32-bit mode and must reside in the Real Mode
>>> Area. On PAPR guests, the RMA starts at logical address 0 and is the
>>> first logical memory block reported in the LPAR’s device tree.
>>>
>>> On powerpc targets with RTAS, Linux makes available to user space a
>>> region of memory suitable for arguments to be passed to RTAS via
>>> sys_rtas(). This region (rtas_rmo_buf) is allocated via the memblock
>>> API during boot in order to ensure that it satisfies the requirements
>>> described above.
>>>
>>> With radix MMU, the upper limit supplied to the memblock allocation
>>> can exceed the bounds of the first logical memory block, since
>>> ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB. (512MB is
>>> a common size of the first memory block according to a small sample of
>>> LPARs I have checked.) This leads to failures when user space invokes
>>> an RTAS function that uses a work area, such as
>>> ibm,configure-connector.
>>>
>>> Alter the determination of the upper limit for rtas_rmo_buf's
>>> allocation to consult the device tree directly, ensuring placement
>>> within the RMA regardless of the MMU in use.
>>
>> Can we tie this with RTAS (which also needs to be in RMA) and simply add
>> extra 64K in prom_instantiate_rtas() and advertise this address
>> (ALIGH_UP(rtas-base + rtas-size, PAGE_SIZE)) to the user space? We do
>> not need this RMO area before that point.
> 
> Can you explain more about what advantage that would bring? I'm not
> seeing it. It's a more significant change than what I've written
> here.


We already allocate space for RTAS and (like RMO) it needs to be in RMA, 
and RMO is useless without RTAS. We can reuse RTAS allocation code for 
RMO like this:

===
diff --git a/arch/powerpc/kernel/prom_init.c 
b/arch/powerpc/kernel/prom_init.c
index e9d4eb6144e1..d9527d3e01d2 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1821,7 +1821,8 @@ static void __init prom_instantiate_rtas(void)
         if (size == 0)
                 return;

-       base = alloc_down(size, PAGE_SIZE, 0);
+       /* One page for RTAS, one for RMO */
+       base = alloc_down(size, PAGE_SIZE + PAGE_SIZE, 0);
         if (base == 0)
                 prom_panic("Could not allocate memory for RTAS\n");

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index d126d71ea5bd..885d95cf4ed3 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1186,6 +1186,7 @@ void __init rtas_initialize(void)
         rtas.size = size;
         no_entry = of_property_read_u32(rtas.dev, "linux,rtas-entry", 
&entry);
         rtas.entry = no_entry ? rtas.base : entry;
+       rtas_rmo_buf = rtas.base + PAGE_SIZE;

         /* If RTAS was found, allocate the RMO buffer for it and look for
          * the stop-self token if any
@@ -1196,11 +1197,6 @@ void __init rtas_initialize(void)
                 ibm_suspend_me_token = rtas_token("ibm,suspend-me");
         }
  #endif
-       rtas_rmo_buf = memblock_phys_alloc_range(RTAS_RMOBUF_MAX, PAGE_SIZE,
-                                                0, rtas_region);
-       if (!rtas_rmo_buf)
-               panic("ERROR: RTAS: Failed to allocate %lx bytes below 
%pa\n",
-                     PAGE_SIZE, &rtas_region);
===


May be store in the FDT as "linux,rmo-base" next to "linux,rtas-base", 
for clarity, as sharing symbols between prom and main kernel is a bit 
tricky.

The benefit is that we do not do the same thing   (== find 64K in RMA) 
in 2 different ways and if the RMO allocated my way is broken - we'll 
know it much sooner as RTAS itself will break too.


> Would it interact well with kexec?


Good point. For this, the easiest will be setting rtas-size in the FDT 
to the allocated RTAS space (PAGE_SIZE*2 with the hunk above applied). 
Probably.


>> And probably do the same with per-cpu RTAS argument structures mentioned
>> in the cover letter?
> 
> I don't think so, since those need to be allocated with the pacas and
> limited to the maximum possible CPUs, which is discovered by the kernel
> much later.


The first cell of /proc/device-tree/cpus/ibm,drc-indexes is the number 
of cores, it is there when RTAS is instantiated, we know SMT after 
"ibm,client-architecture-support" (if I remember correctly).


> But maybe I misunderstand what you're suggesting.


Usually it is me missing the bigger picture :)


-- 
Alexey
