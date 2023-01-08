Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98084661498
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 11:49:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqYk13GvSz3cCk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 21:49:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=khZsRl3/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=khZsRl3/;
	dkim-atps=neutral
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqYj609BQz3bVZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 21:48:57 +1100 (AEDT)
Received: by mail-vk1-xa2c.google.com with SMTP id w72so2647157vkw.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Jan 2023 02:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o+ulyHY5t1vIQHRPkJRkZkMsVhYDzl0Wi1NRRdUXX9E=;
        b=khZsRl3/h6xFPtV+trGF8SoZlhUH7CXOkbNSVy0ph0vcxdY2POtEBg03zxNX8NOjKd
         tk0nBaNgQ7Qkcbndq/9sUu9/ASJ7jbK4uYDbK/bTz5OlmFXDU8glJgzuEEv6Z/s6NMfA
         mp4rpznbR52Td9JIJd+jemR2waWnWqaR5O+5xO3DbdqK/ncWuaOvXDjz4YwzrATW6+AT
         M8+n4X/t1ZgquFU/5c+wBFLYST09b1qKcf+ZPYUk9m3W2UOYcUJY3wtRak73CebxOF2s
         Srav0OegoVZNvk1eaPYqXHoJyRanQU2FIyrTJWyfZ4nP8ieu3yAmmAtAsqqtCCVbv2RA
         wVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+ulyHY5t1vIQHRPkJRkZkMsVhYDzl0Wi1NRRdUXX9E=;
        b=gTJ9GMfrzW6tMe5p0GcqIaCSVd6R+sHyHKFB1V+X2p0OFOmb9adzvyJX2y2zwkEIvu
         r+hyoCaUiYUOb5pC7gD12CQe2L42dnIKfyeWkIk41RNy7KHmRIy9mOJxa9409CwJ1qY1
         kQkIy2alcrsQV/xz/yTFnc7Fxyo1QWa84oX9KBsNbNkuWqaPKux/QtPHXkLvpSYyGsMn
         Cp4aaig6ZQRasmgh9iILE2wEID16lK2C+ko9DO8wOWPQR1oeIhMfT+pJnyTZSASm27eQ
         XHYKXoV3Zxlw65gaeWLJEv36iPctaY9Ef7rUXqFQ1k0oPXrlxDCL+vM5oRwfxqwuJibi
         TaZw==
X-Gm-Message-State: AFqh2ko9pONdYxbYw91nOs+MMkfBFf1908zGEzbY+8ktrPho0ojSsLtw
	aEBZxEclxlvLBqEWcF4Jw4FkIqd3ypBneNqD1js=
X-Google-Smtp-Source: AMrXdXsC9zjoSX3JUJXUNKpbqfCGbJ5sLgu3n0p9Rc2JNm9GFnGoyDe1ACeN5YOtUEET51RrQuI/o6A4avtvFhehWBM=
X-Received: by 2002:a1f:2e4e:0:b0:3d5:5ea6:ccb9 with SMTP id
 u75-20020a1f2e4e000000b003d55ea6ccb9mr6218898vku.7.1673174933379; Sun, 08 Jan
 2023 02:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20221117082648.47526-1-yangyicong@huawei.com> <20221117082648.47526-3-yangyicong@huawei.com>
 <Y7cToj5mWd1ZbMyQ@arm.com>
In-Reply-To: <Y7cToj5mWd1ZbMyQ@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 8 Jan 2023 18:48:41 +0800
Message-ID: <CAGsJ_4yC0i6MYwvosRSrdQ1iT7n88ypmK3aOQJkuusqNKtddtg@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com, linux-doc@vger.kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>, arnd@arndb.de, anshuman.khandual@arm.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org, guojian@oppo.com, xhao@linux.alibaba.com, linux-mips@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 6, 2023 at 2:15 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Thu, Nov 17, 2022 at 04:26:48PM +0800, Yicong Yang wrote:
> > It is tested on 4,8,128 CPU platforms and shows to be beneficial on
> > large systems but may not have improvement on small systems like on
> > a 4 CPU platform. So make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends
> > on CONFIG_EXPERT for this stage and make this disabled on systems
> > with less than 8 CPUs. User can modify this threshold according to
> > their own platforms by CONFIG_NR_CPUS_FOR_BATCHED_TLB.
>
> What's the overhead of such batching on systems with 4 or fewer CPUs? If
> it isn't noticeable, I'd rather have it always on than some number
> chosen on whichever SoC you tested.

On the one hand, tlb flush is cheap on a small system. so batching tlb flush
helps very minorly.

On the other hand, since we have batched the tlb flush, new PTEs might be
invisible to others before the final broadcast is done and Ack-ed. thus, there
is a risk someone else might do mprotect or similar things  on those deferred
pages which will ask for read-modify-write on those deferred PTEs. in this
case, mm will do an explicit flush by flush_tlb_batched_pending which is
not required if tlb flush is not deferred. the code is in:

static unsigned long change_pte_range(struct mmu_gather *tlb,
struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
unsigned long end, pgprot_t newprot, unsigned long cp_flags)
{
        ...

      pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);

      flush_tlb_batched_pending(vma->vm_mm);
      arch_enter_lazy_mmu_mode();
      do {
                oldpte = *pte;
                if (pte_present(oldpte)) {
                           pte_t ptent;
                ...
}

since we don't have the mechanism to record which pages should be
flushed in flush_tlb_batched_pending(), flush_tlb_batched_pending()
is flushing the whole process,

void flush_tlb_batched_pending(struct mm_struct *mm)
{
       int batch = atomic_read(&mm->tlb_flush_batched);
       int pending = batch & TLB_FLUSH_BATCH_PENDING_MASK;
       int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;

       if (pending != flushed) {
               flush_tlb_mm(mm);
        /*
         * If the new TLB flushing is pending during flushing, leave
         * mm->tlb_flush_batched as is, to avoid losing flushing.
        */
      atomic_cmpxchg(&mm->tlb_flush_batched, batch,
           pending | (pending << TLB_FLUSH_BATCH_FLUSHED_SHIFT));
     }
}

I guess mprotect things won't be that often for a running process especially
when the system has begun to reclaim its memory. it might be more often
only during the initialization of a process. And x86 has enabled this feature
for a long time, probably this concurrency doesn't matter too much.

but it is still case by case. That is why we have decided to be more
conservative
on globally enabling this feature and why it also depends on CONFIG_EXPERT.

I believe Anshuman has contributed many points on this in those previous
discussions.

Thanks
Barry
