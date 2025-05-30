Return-Path: <linuxppc-dev+bounces-9045-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A3AAC9388
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 18:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b87tn5lXvz2xHv;
	Sat, 31 May 2025 02:27:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748622448;
	cv=none; b=I5CoHv19sx33GotYTCSWNcMGR0ryL4BastCyxiR6AN/32WtiDULR/bYw2NtM7sv2Ss2TWIo6lQss3pD6yNXFrQlpT5s5+sQdzTleuEsSj3o7LG0HIsQJTDlMHNZ8kvXuU1YoiGTxcUJQADNdY4SDL3LnsuoqxWJxBEq6k7yC23fLBnt7SNadWhiMqHvJk8pedPDHyMHd7Ce4JXDV/+Mn9QuMyF0zI/82YKOk8M8dufMRll0KpROFuxyorHmOoIazEJSJjTwr+LhME6Rc1/7OZ6AEkYzVpnzRJqJhgdu7enhYZ/d4+gDgY47j5vjdt3QVuojBPvDwO/olE8fgc7cxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748622448; c=relaxed/relaxed;
	bh=Wb7EzNeuZNtT7LoNB6YIvTwNTIj8nYWDYSy4GeuX+MM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMFk7meJbORp4MDtgj6JPOX2ugplwfUBAjcZKSYQpnTHKkMcAeSTzdHRW+SPKSYWml3OuHw29NB9HozUqZYfMyHZSmJRl0ctUTvWVXkUiOCQJ5+PdsgkEu9BpPEUW9AUnSlbLG1M5UJFy2dVSJZPhjMMfBBS9vG/rnVXmNrtDPp6vNpiH/sJ993UfkEjazgxwjenA5PDRe9pwvk35DZ5Q8g3cgiAW5WNWjLFU9Ek77zqqoMSLeJZtHRX3XreGswMguNeqU8BrqX7DQTaFEC7h4fxWR4922iglF80CKf341YGb9FlQGlKMQ9UQ9RFlgQzDck6T8HAEgWJsr60CwIJaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wuz6ydoE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wuz6ydoE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b87tk4fYpz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 02:27:26 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so11068a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 09:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748622441; x=1749227241; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wb7EzNeuZNtT7LoNB6YIvTwNTIj8nYWDYSy4GeuX+MM=;
        b=wuz6ydoEOfnJ0p4nht1/gH0D6kIuayY10uO3e6H1vbNTVfChWa0+/Rcgdxgc5N+gj5
         q68zFRtEUIFKp4JwV8UWqvz/wnSrHYhPnA0vXQK2MvXwzOCJPJZFEobRZiak+zZblgWZ
         SiRB/ZoHbJz0dbinc0gctdpu71C1DrOPpOaVwXT0nPxNKUwPIyLhKeqZYyBC+Xh2+FFh
         dgOOwIRMw9S6DdehDqUw5A26b73w9EauKjvkyPXozyzsy8s/EFtQ2nCwdjnZmK7Bgquf
         HxjT5TGsS8xaJ7CkgjS8V9o2V8HipIff1E1vPlKBzxN1kTDJgfSLKcOA9VUhbnxUoJdF
         2Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622441; x=1749227241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wb7EzNeuZNtT7LoNB6YIvTwNTIj8nYWDYSy4GeuX+MM=;
        b=eMVMQG5IY/QE8MQBzSSWI0yko0CRKfBA/haYj5KKPosIvX4h7YYjZ056TiyDWfq73t
         Jy69noPiddcXz7/tUGN8Oks9rfio1Ozwg6Cy6HwUrF8et4kXuurxvWJjIGxzqPkFtxOx
         jqMxc3uaR+YNE4GibmcYc38bdDhNpz7gVCbwEQzBan7vreauxGhxgDQgBDvh0/3ENPid
         R46BDLYSmSATmHwegnqp689AlB6/cYNMq1HvQlhGMhNI72DUwPurgQiVTvdTB+zTB6vw
         Ed51wcNqWm5qIuXSRhgAEO+Y10Tsd+vx3gtlJYggABAy8BJmlUV9v4GeqaC87WE+bE7i
         Eg4g==
X-Forwarded-Encrypted: i=1; AJvYcCXn97t88uS2rcE5DCIu3TJAFnYVZjr/FTogznL73vSpLeR9th9c01c5OF81HLr5INa6HyoupetRUWXE4Zo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnvCLRfVInqir9u2l/vHcvm3pwg5MpbMpZNGBofytAWknzcdIw
	x6Gc+PyyhvZ0lvigR3BjA2GIpc7xelmllfuDigYf+YbYVA2Wuk42P+kYWBK9xJ7cTFZgc8dBg5G
	xOdlJLSasrrmt3gr9dD9KNyhq6WPKLKpQfHR9ask0
X-Gm-Gg: ASbGnctLge7dS3qbh7K0v40aMMp0EYpxfeHrM8h6+oJToeBfwDOfC1vjUTF3kt/QpBD
	tH8aaQ/2DumeTUM6E3RdXJYaGku771n8+M4tIODPYIorx2I3rzD8wTcgw9cyM7bjOteNrslbRJb
	5ZXA0A5dOYkK8sFYFMC9XgE9qnpAu3SLyrRRWK8RZ5sj+/sMOMpZnEyIShfTgEHvabQrxyBC8=
X-Google-Smtp-Source: AGHT+IFvo4UeYXqvvR6hGpmlYjccx/P9qAgBVyNpakUtwWnk/plyYyjpSLFfr/exrsOHq2DB2NbEp4NJnsA/fPm9vYQ=
X-Received: by 2002:a50:f608:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-60577a55f40mr88916a12.7.1748622440589; Fri, 30 May 2025
 09:27:20 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250530140446.2387131-1-ryan.roberts@arm.com> <20250530140446.2387131-2-ryan.roberts@arm.com>
In-Reply-To: <20250530140446.2387131-2-ryan.roberts@arm.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 30 May 2025 18:26:44 +0200
X-Gm-Features: AX0GCFt5gaAeg9wlqckCjWiqvoyfvAtwj8XYq0jNIyzkBuWgoy0LcwI3HloBVMo
Message-ID: <CAG48ez2k6ZmM-335EQjXeL6OtKzuOjVPWQDuJ75ww9Z6NMeg5w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/6] fs/proc/task_mmu: Fix pte update and tlb
 maintenance ordering in pagemap_scan_pmd_entry()
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mm@kvack.org, 
	Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-16.2 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 30, 2025 at 4:04=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
> pagemap_scan_pmd_entry() was previously modifying ptes while in lazy mmu
> mode, then performing tlb maintenance for the modified ptes, then
> leaving lazy mmu mode. But any pte modifications during lazy mmu mode
> may be deferred until arch_leave_lazy_mmu_mode(), inverting the required
> ordering between pte modificaiton and tlb maintenance.
>
> Let's fix that by leaving mmu mode, forcing all the pte updates to be
> actioned, before doing the tlb maintenance.
>
> This is a theorectical bug discovered during code review.
>
> Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and option=
ally clear info about PTEs")

Hmm... isn't lazy mmu mode supposed to also delay TLB flushes, and
preserve the ordering of PTE modifications and TLB flushes?

Looking at the existing implementations of lazy MMU:

 - In Xen PV implementation of lazy MMU, I see that TLB flush
hypercalls are delayed as well (xen_flush_tlb(),
xen_flush_tlb_one_user() and xen_flush_tlb_multi() all use
xen_mc_issue(XEN_LAZY_MMU) which delays issuing if lazymmu is active).
 - The sparc version also seems to delay TLB flushes, and sparc's
arch_leave_lazy_mmu_mode() seems to do TLB flushes via
flush_tlb_pending() if necessary.
 - powerpc's arch_leave_lazy_mmu_mode() also seems to do TLB flushes.

Am I missing something?

If arm64 requires different semantics compared to all existing
implementations and doesn't delay TLB flushes for lazy mmu mode, I
think the "Fixes" tag should point to your addition of lazy mmu
support for arm64.

> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  fs/proc/task_mmu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 994cde10e3f4..361f3ffd9a0c 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -2557,10 +2557,9 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsi=
gned long start,
>         }
>
>  flush_and_return:
> +       arch_leave_lazy_mmu_mode();
>         if (flush_end)
>                 flush_tlb_range(vma, start, addr);
> -
> -       arch_leave_lazy_mmu_mode();

I think this ordering was probably intentional, because doing it this
way around allows Xen PV to avoid one more hypercall, because the TLB
flush can be batched together with the page table changes?


>         pte_unmap_unlock(start_pte, ptl);
>
>         cond_resched();
> --
> 2.43.0
>

