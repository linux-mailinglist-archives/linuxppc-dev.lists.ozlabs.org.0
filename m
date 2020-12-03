Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D59D2CCE43
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 06:07:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmkNy16fjzDrLX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 16:07:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=FuUcSxWr; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmkLh389qzDrJn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 16:05:46 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id a3so2399571wmb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Dec 2020 21:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XUBoIVUFuTda74sYhc9AaUfIF0VYHNgbgX6L3CSfTWQ=;
 b=FuUcSxWrRc7RgsOSwe/Ar1EO5Ff3N9odSv2XY0Zqm4g9XP/wOGYy94T5KC5HEmT6Zb
 CllAZYKNVheNctLUSpCVA6zIh60iTARxAlH2IqE8hO8QtRArgPC4FG1cylYSpVKMkKqk
 l/WPKsc5i7rBRvupJpVLvzY7Lu6Dye39+pVi0u97RbqVKvYtdT/QyH/uSImekLuKVcZI
 H2TXJq9pUhq9WbHGZbspm0eqJESP82vmo4Z90qkMrkjglVKyU2w+Rac/C03QfedVdBX2
 LYJ5cEWr8ojZ0eYqFB+t9XwtqTSSuxp1lTUuvAXfuVZpKCZbQNzq80tI6A6eI04Y+GWe
 mHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XUBoIVUFuTda74sYhc9AaUfIF0VYHNgbgX6L3CSfTWQ=;
 b=rVOHWjGNzhB5m/cdzcfsYYgaUVmb/pIe6RerTBIXwB5nOMETOqGFhFY9cl4j5nfMuX
 riHMfeLx6SC8fKyzUYoAa1pPy/cC7j/tE8sKCUNuZsZkZVV3MZABugJyaiu7ySBhpDzv
 vW9NX+6V5Mp1DkogdFab5xoaew9kTxNxVGa/T1ZOsxUAvgUSPQnUHVQFV8tJORck5Fvc
 5oA2OlOuWVQSlOE6GJZo5dJeVU8jqTuXb59SHWMZYi7IC3fuANIHjE6MGN13h+gpBhdp
 3jaJROwo/5L/hPFGGw1s8foVI+9o1zAC/36eNp6r1jlDIravPA8I0M7J5FJ9tzId6w5C
 j7hg==
X-Gm-Message-State: AOAM532Ii7FQ20YQVAcH6TYGLcWPgwQUkV/poDfwtVDbh0KHYkq+yz+D
 DfeUiB1ySV4t1FVxFar6rybqHYvtwV80GFkoOWA7oQ==
X-Google-Smtp-Source: ABdhPJw58yLVfBKzewS+37BuoRbKB9WSMia7+fhXYWK9vuZSkJTJI8hhAr2AGPTvmZJTPupRjW/sGVxlMYUtiS9xZq8=
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr1216271wmd.49.1606971941686; 
 Wed, 02 Dec 2020 21:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-7-npiggin@gmail.com>
 <CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31SaTOZw@mail.gmail.com>
 <CALCETrWBtCfD+jZ3S+O8FK-HFPODuhbDEbbfWvS=-iPATNFAOA@mail.gmail.com>
 <CALCETrXAR_9EGaOF8ymVkZycxgZkYk0dR+NjEpTfVzdcS3sOVw@mail.gmail.com>
 <1606879302.tdngvs3yq4.astroid@bobo.none>
In-Reply-To: <1606879302.tdngvs3yq4.astroid@bobo.none>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 2 Dec 2020 21:05:30 -0800
Message-ID: <CALCETrXi7YEk2KVSyXVuhUF_AYTqENx+XzYJqEhAYs=8oiSouA@mail.gmail.com>
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies,
 a non-refcounting lazy tlb option
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Dave Hansen <dave.hansen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On Dec 1, 2020, at 7:47 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> =EF=BB=BFExcerpts from Andy Lutomirski's message of December 1, 2020 4:31=
 am:
>> other arch folk: there's some background here:
>>
>> https://lkml.kernel.org/r/CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31S=
aTOZw@mail.gmail.com
>>
>>> On Sun, Nov 29, 2020 at 12:16 PM Andy Lutomirski <luto@kernel.org> wrot=
e:
>>>
>>> On Sat, Nov 28, 2020 at 7:54 PM Andy Lutomirski <luto@kernel.org> wrote=
:
>>>>
>>>> On Sat, Nov 28, 2020 at 8:02 AM Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>>>>>
>>>>> On big systems, the mm refcount can become highly contented when doin=
g
>>>>> a lot of context switching with threaded applications (particularly
>>>>> switching between the idle thread and an application thread).
>>>>>
>>>>> Abandoning lazy tlb slows switching down quite a bit in the important
>>>>> user->idle->user cases, so so instead implement a non-refcounted sche=
me
>>>>> that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot do=
wn
>>>>> any remaining lazy ones.
>>>>>
>>>>> Shootdown IPIs are some concern, but they have not been observed to b=
e
>>>>> a big problem with this scheme (the powerpc implementation generated
>>>>> 314 additional interrupts on a 144 CPU system during a kernel compile=
).
>>>>> There are a number of strategies that could be employed to reduce IPI=
s
>>>>> if they turn out to be a problem for some workload.
>>>>
>>>> I'm still wondering whether we can do even better.
>>>>
>>>
>>> Hold on a sec.. __mmput() unmaps VMAs, frees pagetables, and flushes
>>> the TLB.  On x86, this will shoot down all lazies as long as even a
>>> single pagetable was freed.  (Or at least it will if we don't have a
>>> serious bug, but the code seems okay.  We'll hit pmd_free_tlb, which
>>> sets tlb->freed_tables, which will trigger the IPI.)  So, on
>>> architectures like x86, the shootdown approach should be free.  The
>>> only way it ought to have any excess IPIs is if we have CPUs in
>>> mm_cpumask() that don't need IPI to free pagetables, which could
>>> happen on paravirt.
>>
>> Indeed, on x86, we do this:
>>
>> [   11.558844]  flush_tlb_mm_range.cold+0x18/0x1d
>> [   11.559905]  tlb_finish_mmu+0x10e/0x1a0
>> [   11.561068]  exit_mmap+0xc8/0x1a0
>> [   11.561932]  mmput+0x29/0xd0
>> [   11.562688]  do_exit+0x316/0xa90
>> [   11.563588]  do_group_exit+0x34/0xb0
>> [   11.564476]  __x64_sys_exit_group+0xf/0x10
>> [   11.565512]  do_syscall_64+0x34/0x50
>>
>> and we have info->freed_tables set.
>>
>> What are the architectures that have large systems like?
>>
>> x86: we already zap lazies, so it should cost basically nothing to do
>
> This is not zapping lazies, this is freeing the user page tables.
>
> "lazy mm" is where a switch to a kernel thread takes on the
> previous mm for its kernel mapping rather than switch to init_mm.

The intent of the code is to flush the TLB after freeing user pages
tables, but, on bare metal, lazies get zapped as a side effect.

Anyway, I'm going to send out a mockup of an alternative approach shortly.
