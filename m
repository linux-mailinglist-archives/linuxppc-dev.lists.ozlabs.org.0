Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F99204E74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 11:51:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rhPb0gktzDqVC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 19:51:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=hejianet@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iS5yRye3; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rdTg1K9DzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 17:39:44 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id 35so8782276ple.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 00:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=uOQb9dQe44rsxmw6i/h0rSh/nLflDHEslMMMeD/giQw=;
 b=iS5yRye3rDh+O05niU8/utqB4imUEJKkAaWos4gUjcWXB4jNLvVIZDFcsRhJLnJspR
 7sFs+WDR9vjy847KXHy4gDO9V70Ecjc7NhgjSm4G90rk1NFUwrc8rRDUStNGGf9FQbYX
 X9MPm+wvPsQetwL/CZHmC2hoZDUNP+nMyKA+S4Z6j54pdc6NCKo+ndkHtFw+RmuUnWkg
 eytq7PAgfMiJowMtloZ6acFKnJKxtPazYdirzKc4aete4eP9rB3MeVsIRIGSfwaGwYDX
 bui9wXVyEqZjg4U8umlcPRsJL5E5suNWUJBiUpw8l/lM/CL/TB/FQnJkRbwoCM6oF1sQ
 vIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=uOQb9dQe44rsxmw6i/h0rSh/nLflDHEslMMMeD/giQw=;
 b=l4paxuUcI/d/4+JUcaZlXdjTQeI4bRNdb3YepoTZfV9hXWawhSNqIOJpfiMAS32mN9
 fSAeODvonxpyy5nDBFHRHLs2tZBvnTMvIpk5CzfiyqInP8z5+9c6c33P4IYze9/Gyar8
 XvZdwEb0OWsd8gwdW8sekpUmo1RefByUDVRz8wOw82s6XDtQOHc2SMKmxx4MT28Uo57e
 Rm0oKCo89oegkTOo3FFs6jFeZdQf4OW1acT8lBYx5J3VAqXg9lcOvfCAIsM6bTIZxbpf
 6SL06hLtBwFv6vPhGrd05uihJIPf024yWAUgKMZCp1RIIk3Ti3ur6AZcBp7yTY/JC6lN
 UNYQ==
X-Gm-Message-State: AOAM53173AeFHxpo9IiO0ZpD9YRHD7BLK9NQu8Saw8ENSnav5vBCnUMH
 iqVaOhYZomfYBQ7lFQQ7Mac=
X-Google-Smtp-Source: ABdhPJzl1907jFXmG8/hUrrT6R8iVBl17pz8a52tk13vPq7/sfscqbo9LriRFRn7RANhCL2RiJH8aw==
X-Received: by 2002:a17:902:44:: with SMTP id
 62mr22883504pla.104.1592897980547; 
 Tue, 23 Jun 2020 00:39:40 -0700 (PDT)
Received: from [0.0.0.0] ([45.76.223.48])
 by smtp.gmail.com with ESMTPSA id g21sm15811626pfh.134.2020.06.23.00.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2020 00:39:39 -0700 (PDT)
Subject: Re: [PATCH V3 (RESEND) 0/3] arm64: Enable vmemmap mapping from device
 memory
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1592442930-9380-1-git-send-email-anshuman.khandual@arm.com>
From: Jia He <hejianet@gmail.com>
Message-ID: <efeabd28-e5d4-3734-505a-77486c03f508@gmail.com>
Date: Tue, 23 Jun 2020 15:39:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592442930-9380-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: multipart/alternative;
 boundary="------------F45777FE1D773B7A3A04E8C0"
X-Mailman-Approved-At: Tue, 23 Jun 2020 19:46:01 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------F45777FE1D773B7A3A04E8C0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

I also tested the addional cases on arm64

1, 4k page size + devdax + --map=mem

2, 64k page size + devdax + --map=mem

3, 4k page size + devdax + --map=dev

4, 64k page size + devdax + --map=dev

case 4 is important to verify Anshuman's this series.

Host kernel: 5.7-rc3

guest kernel: 5.7-rc5 with this series

ndctl: https://github.com/pmem/ndctl/tree/c7767834871 
<https://github.com/pmem/ndctl/tree/c7767834871f7ce50a2abe1da946e9e16fb08eda>

On the guest:

1. ./ndctl/.libs/ndctl create-namespace -e namespace0.0 --mode=devdax --map=dev 
-s 1g -f -v -a 64K

  echo dax0.0 > /sys/bus/dax/drivers/device_dax/unbind
  echo dax0.0 > /sys/bus/dax/drivers/kmem/new_id

The 1g block was added

2. echo 0 > /sys/devices/system/memory/memory10/online

modprobe -r dax_pmem

The 1g block was removed


Some minor fix should be applied which is not relevant to this series itself. 
e.g numa id

---
Cheers,
Justin (Jia He)

On 2020/6/18 9:15, Anshuman Khandual wrote:
> This series enables vmemmap backing memory allocation from device memory
> ranges on arm64. But before that, it enables vmemmap_populate_basepages()
> and vmemmap_alloc_block_buf() to accommodate struct vmem_altmap based
> alocation requests.
>
> This series applies on 5.8-rc1.
>
> Pending Question:
>
> altmap_alloc_block_buf() does not have any other remaining users in the
> tree after this change. Should it be converted into a static function and
> it's declaration be dropped from the header (include/linux/mm.h). Avoided
> doing so because I was not sure if there are any off-tree users or not.
>
> Changes in V3:
>
> - Dropped comment from free_hotplug_page_range() per Robin
> - Modified comment in unmap_hotplug_range() per Robin
> - Enabled altmap support in vmemmap_alloc_block_buf() per Robin
>
> Changes in V2: (https://lkml.org/lkml/2020/3/4/475)
>
> - Rebased on latest hot-remove series (v14) adding P4D page table support
>
> Changes in V1: (https://lkml.org/lkml/2020/1/23/12)
>
> - Added an WARN_ON() in unmap_hotplug_range() when altmap is
>    provided without the page table backing memory being freed
>
> Changes in RFC V2: (https://lkml.org/lkml/2019/10/21/11)
>
> - Changed the commit message on 1/2 patch per Will
> - Changed the commit message on 2/2 patch as well
> - Rebased on arm64 memory hot remove series (v10)
>
> RFC V1: (https://lkml.org/lkml/2019/6/28/32)
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Fenghua Yu <fenghua.yu@intel.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: x86@kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
>
> Anshuman Khandual (3):
>    mm/sparsemem: Enable vmem_altmap support in vmemmap_populate_basepages()
>    mm/sparsemem: Enable vmem_altmap support in vmemmap_alloc_block_buf()
>    arm64/mm: Enable vmem_altmap support for vmemmap mappings
>
>   arch/arm64/mm/mmu.c       | 59 ++++++++++++++++++++++++++-------------
>   arch/ia64/mm/discontig.c  |  2 +-
>   arch/powerpc/mm/init_64.c | 10 +++----
>   arch/riscv/mm/init.c      |  2 +-
>   arch/x86/mm/init_64.c     | 12 ++++----
>   include/linux/mm.h        |  8 ++++--
>   mm/sparse-vmemmap.c       | 38 ++++++++++++++++++++-----
>   7 files changed, 87 insertions(+), 44 deletions(-)
>
-- 


--------------F45777FE1D773B7A3A04E8C0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi</p>
    <p>I also tested the addional cases on arm64<br>
    </p>
    <p>1, 4k page size + devdax + --map=mem</p>
    <p>2, 64k page size + devdax + --map=mem</p>
    <p>3, 4k page size + devdax + --map=dev</p>
    <p>4, 64k page size + devdax + --map=dev</p>
    <p>case 4 is important to verify Anshuman's this series.</p>
    <p>Host kernel: 5.7-rc3</p>
    <p>guest kernel: 5.7-rc5 with this series</p>
    <p>ndctl: <a
href="https://github.com/pmem/ndctl/tree/c7767834871f7ce50a2abe1da946e9e16fb08eda"
        class="external-link" rel="nofollow" style="color: rgb(102, 0,
        0); text-decoration: underline; cursor: pointer; font-family:
        -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto,
        Oxygen, Ubuntu, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;,
        &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(244, 245, 247);">https://github.com/pmem/ndctl/tree/c7767834871</a><span
        style="color: rgb(23, 43, 77); font-family: -apple-system,
        BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen,
        Ubuntu, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;,
        &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(244, 245, 247); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"><br>
      </span></p>
    <p>On the guest:</p>
    <p>1. ./ndctl/.libs/ndctl create-namespace -e namespace0.0
      --mode=devdax --map=dev -s 1g -f -v -a 64K</p>
    <p> echo dax0.0 &gt; /sys/bus/dax/drivers/device_dax/unbind<br>
       echo dax0.0 &gt; /sys/bus/dax/drivers/kmem/new_id</p>
    <p>The 1g block was added</p>
    <p>2. echo 0 &gt; /sys/devices/system/memory/memory10/online</p>
    <p>modprobe -r dax_pmem</p>
    <p>The 1g block was removed</p>
    <p><br>
    </p>
    <p>Some minor fix should be applied which is not relevant to this
      series itself. e.g numa id <br>
    </p>
    <pre class="moz-signature" cols="79">---
Cheers,
Justin (Jia He)</pre>
    <div class="moz-cite-prefix">On 2020/6/18 9:15, Anshuman Khandual
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1592442930-9380-1-git-send-email-anshuman.khandual@arm.com">
      <pre class="moz-quote-pre" wrap="">This series enables vmemmap backing memory allocation from device memory
ranges on arm64. But before that, it enables vmemmap_populate_basepages()
and vmemmap_alloc_block_buf() to accommodate struct vmem_altmap based
alocation requests.

This series applies on 5.8-rc1.

Pending Question:

altmap_alloc_block_buf() does not have any other remaining users in the
tree after this change. Should it be converted into a static function and
it's declaration be dropped from the header (include/linux/mm.h). Avoided
doing so because I was not sure if there are any off-tree users or not.

Changes in V3:

- Dropped comment from free_hotplug_page_range() per Robin
- Modified comment in unmap_hotplug_range() per Robin
- Enabled altmap support in vmemmap_alloc_block_buf() per Robin

Changes in V2: (<a class="moz-txt-link-freetext" href="https://lkml.org/lkml/2020/3/4/475">https://lkml.org/lkml/2020/3/4/475</a>)

- Rebased on latest hot-remove series (v14) adding P4D page table support

Changes in V1: (<a class="moz-txt-link-freetext" href="https://lkml.org/lkml/2020/1/23/12">https://lkml.org/lkml/2020/1/23/12</a>)

- Added an WARN_ON() in unmap_hotplug_range() when altmap is
  provided without the page table backing memory being freed

Changes in RFC V2: (<a class="moz-txt-link-freetext" href="https://lkml.org/lkml/2019/10/21/11">https://lkml.org/lkml/2019/10/21/11</a>)

- Changed the commit message on 1/2 patch per Will
- Changed the commit message on 2/2 patch as well
- Rebased on arm64 memory hot remove series (v10)

RFC V1: (<a class="moz-txt-link-freetext" href="https://lkml.org/lkml/2019/6/28/32">https://lkml.org/lkml/2019/6/28/32</a>)

Cc: Catalin Marinas <a class="moz-txt-link-rfc2396E" href="mailto:catalin.marinas@arm.com">&lt;catalin.marinas@arm.com&gt;</a>
Cc: Will Deacon <a class="moz-txt-link-rfc2396E" href="mailto:will@kernel.org">&lt;will@kernel.org&gt;</a>
Cc: Mark Rutland <a class="moz-txt-link-rfc2396E" href="mailto:mark.rutland@arm.com">&lt;mark.rutland@arm.com&gt;</a>
Cc: Paul Walmsley <a class="moz-txt-link-rfc2396E" href="mailto:paul.walmsley@sifive.com">&lt;paul.walmsley@sifive.com&gt;</a>
Cc: Palmer Dabbelt <a class="moz-txt-link-rfc2396E" href="mailto:palmer@dabbelt.com">&lt;palmer@dabbelt.com&gt;</a>
Cc: Tony Luck <a class="moz-txt-link-rfc2396E" href="mailto:tony.luck@intel.com">&lt;tony.luck@intel.com&gt;</a>
Cc: Fenghua Yu <a class="moz-txt-link-rfc2396E" href="mailto:fenghua.yu@intel.com">&lt;fenghua.yu@intel.com&gt;</a>
Cc: Dave Hansen <a class="moz-txt-link-rfc2396E" href="mailto:dave.hansen@linux.intel.com">&lt;dave.hansen@linux.intel.com&gt;</a>
Cc: Andy Lutomirski <a class="moz-txt-link-rfc2396E" href="mailto:luto@kernel.org">&lt;luto@kernel.org&gt;</a>
Cc: Peter Zijlstra <a class="moz-txt-link-rfc2396E" href="mailto:peterz@infradead.org">&lt;peterz@infradead.org&gt;</a>
Cc: Thomas Gleixner <a class="moz-txt-link-rfc2396E" href="mailto:tglx@linutronix.de">&lt;tglx@linutronix.de&gt;</a>
Cc: Ingo Molnar <a class="moz-txt-link-rfc2396E" href="mailto:mingo@redhat.com">&lt;mingo@redhat.com&gt;</a>
Cc: David Hildenbrand <a class="moz-txt-link-rfc2396E" href="mailto:david@redhat.com">&lt;david@redhat.com&gt;</a>
Cc: Mike Rapoport <a class="moz-txt-link-rfc2396E" href="mailto:rppt@linux.ibm.com">&lt;rppt@linux.ibm.com&gt;</a>
Cc: Michal Hocko <a class="moz-txt-link-rfc2396E" href="mailto:mhocko@suse.com">&lt;mhocko@suse.com&gt;</a>
Cc: "Matthew Wilcox (Oracle)" <a class="moz-txt-link-rfc2396E" href="mailto:willy@infradead.org">&lt;willy@infradead.org&gt;</a>
Cc: "Kirill A. Shutemov" <a class="moz-txt-link-rfc2396E" href="mailto:kirill.shutemov@linux.intel.com">&lt;kirill.shutemov@linux.intel.com&gt;</a>
Cc: Andrew Morton <a class="moz-txt-link-rfc2396E" href="mailto:akpm@linux-foundation.org">&lt;akpm@linux-foundation.org&gt;</a>
Cc: Dan Williams <a class="moz-txt-link-rfc2396E" href="mailto:dan.j.williams@intel.com">&lt;dan.j.williams@intel.com&gt;</a>
Cc: Pavel Tatashin <a class="moz-txt-link-rfc2396E" href="mailto:pasha.tatashin@soleen.com">&lt;pasha.tatashin@soleen.com&gt;</a>
Cc: Benjamin Herrenschmidt <a class="moz-txt-link-rfc2396E" href="mailto:benh@kernel.crashing.org">&lt;benh@kernel.crashing.org&gt;</a>
Cc: Paul Mackerras <a class="moz-txt-link-rfc2396E" href="mailto:paulus@samba.org">&lt;paulus@samba.org&gt;</a>
Cc: Michael Ellerman <a class="moz-txt-link-rfc2396E" href="mailto:mpe@ellerman.id.au">&lt;mpe@ellerman.id.au&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:linux-ia64@vger.kernel.org">linux-ia64@vger.kernel.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:linux-riscv@lists.infradead.org">linux-riscv@lists.infradead.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:x86@kernel.org">x86@kernel.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:linuxppc-dev@lists.ozlabs.org">linuxppc-dev@lists.ozlabs.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:linux-mm@kvack.org">linux-mm@kvack.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org</a>

Anshuman Khandual (3):
  mm/sparsemem: Enable vmem_altmap support in vmemmap_populate_basepages()
  mm/sparsemem: Enable vmem_altmap support in vmemmap_alloc_block_buf()
  arm64/mm: Enable vmem_altmap support for vmemmap mappings

 arch/arm64/mm/mmu.c       | 59 ++++++++++++++++++++++++++-------------
 arch/ia64/mm/discontig.c  |  2 +-
 arch/powerpc/mm/init_64.c | 10 +++----
 arch/riscv/mm/init.c      |  2 +-
 arch/x86/mm/init_64.c     | 12 ++++----
 include/linux/mm.h        |  8 ++++--
 mm/sparse-vmemmap.c       | 38 ++++++++++++++++++++-----
 7 files changed, 87 insertions(+), 44 deletions(-)

</pre>
    </blockquote>
    <pre class="moz-signature" cols="79">-- 

</pre>
  </body>
</html>

--------------F45777FE1D773B7A3A04E8C0--
