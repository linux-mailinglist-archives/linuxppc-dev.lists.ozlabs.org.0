Return-Path: <linuxppc-dev+bounces-14515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE8C8CCE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 05:42:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dH3h11H5Mz30HQ;
	Thu, 27 Nov 2025 15:42:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e36"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764218561;
	cv=none; b=MapZpDhVR+v24XjUgjs0gsN+JPqMpG+izr3vtRf8V4u8cSZSb8YoIRr5Z8oabP3QYAhkqaXZ75R6o1c9M9VSx0lZuGAPkjxbwBLVT8qrR+cjVRGpQ4DY/TSTa+fJPhKQliFDVHw2lFX7gz4M5aLHBZ4OoVuJRvZCkeoDHIqPsGuS4HfUbWflTMhCDL0SqXZCMQWTr+8wt8jpvpqOWhBG2mBrqPl+3T9LwX9NWcnVS1TCDwB9HHnIdicieM6HKjxYe8MeCVyF3zlHSOTuG3tm2K5tbDqo1oFvp72ZAti+kNpeP3xDLfz1I4Z9sFDrYftX7UzNvbzjQEj3G3Uo4h1DWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764218561; c=relaxed/relaxed;
	bh=bEhopEuyFNhgXqkSaWLWBfzS2UzIUD/ULoq0kMipD7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikj0u0BYAAQF69Rx7f1ixmRI3sQOeogWpwFuxLxs95Crd7oml8E78aWnV6ilQXoKdRsW1vRagyGeNi1NHl+N5DweV9gg0ObfntHGX3HI4y7bvSkzEWv2PBXEI9efCD0d6NIZBTHF9snNXyTxqQDiVbgLIBonttvlLvGh8L2fNj9aHliJyt/E8Vu+0+PPHcmjzVcMPJZg1rzly7DJOUiR9Iwt27D2/8mPKD4gryWdJsekC9E4jjyLiYG4hKaPFbclejVlc7NVxXn8ZQKg/Nd4b8vgniySj6msD8/zldNm9NAuiKSdAh+QUdhD8Jp/1E9Ngmb3XOgHm60k6OLacQYqag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kIcCgqX4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kIcCgqX4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dH3gz5hl9z30FR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 15:42:38 +1100 (AEDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso430778137.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 20:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764218556; x=1764823356; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEhopEuyFNhgXqkSaWLWBfzS2UzIUD/ULoq0kMipD7w=;
        b=kIcCgqX47mr5MmCo/Idj+k+0R5QKOknw2AZ4Vi4CvJ98yC7bOToZP8rYfTxII+lrgD
         C2Q2D+NyRcdLoYffilHIclOC1AmDZ5I9pUcMntoXuoX0Rf1ufS5lAHj5vgZ8znErQiz0
         sD+cw3PgBmowTbZQsAswCHeQQNAKWIHzby8T1R1KObPiNBqPDEzkigwfyU5nVI66eNxj
         XXjnCf4+VEBez2FavfdCD2DFmWM5aqk+pWBybE7HILUB4GQA+pSkSP5xXjhLfp213CX9
         cbqQwz2SLrJkvj+o4UdgXwD2N1aRBFiGv2H+e9TyFsEaph/IZUFqeSqLlaKY+vfUYm6w
         EWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764218556; x=1764823356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bEhopEuyFNhgXqkSaWLWBfzS2UzIUD/ULoq0kMipD7w=;
        b=dAmG6Y1U3tXoe18XqJ0mbJPoOZBFyyb0NF2+06frlsUpN6pRGGOJP45Wig9lCvy2Cy
         2AgE5YI0tvHzsJYReOtMi5hV4IqsKagxtVLVqfRAVcJE50VnfJgL5z9zl4ldNSEv9P1s
         gtCMyRgN7jHKqGu5lsb6O2PcrvuctKQhwBnODj+Wxg8Jno7TIyUWXnh3Luu8WTy4o6H8
         InEXeFUG025DtqOJyQDSCXFEL+iph488Xtd1YdkqoByQ6vdSg47K+3dS/kiTS+TrzrkR
         gFrydVMb7bcw1HHaMEgYL50LYt5vsTi3A7LkPnFZRNYUMTqGES7LeUSqHzwv1Lwlu3j1
         7jwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5SFR/vcqYNoY/7SxnSCFwCEj3RexRfqTCACf6ma+szhrC13IXof2EtxfjrQnS56AUABOotUIZ7Mq2NtQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyRy+Wh1RR1znSCIiz8PTMKmiSzdT4NeW0o293mhIw8/PMXuaC+
	Dz2dsChCoaOWmy0sffEm7DAL/FHDdmkLX9JteuALuRZPO9sMzCUMICZMhXvbGnJWPyV11GYGg58
	ap/IGuaFm0C+/ko2RR9rBj6PtJxYW39M=
X-Gm-Gg: ASbGncvHwdflfDFe9h27EIq/0tT4ClKp0/eeDFbNSSOcHP8cyJtmbE5shY5+5gT9vLC
	xNR7SiLOQph1p0DuYzzWHgmInbyn1GX1Pw/R4ZiVf+w6xS5NUKTKs3G6hiH08mK0viY+QCb1nNX
	09IE9nRFlt1vACijcrGNKO3XK0+vBcORw+GKChSGFWiE1tMXTMdg8FaALQwtZ/f1WS/XzflFvhg
	SWDdNkuVc69oyKoswIsoVeNswFI1BtM7mknEKfZLkuqAWsJsIY9/GoggJSRUUsc3dhDrw==
X-Google-Smtp-Source: AGHT+IGH43TrgsJFNtUr5ao/vogWT9GdRhnXVZ07KbbMX+jdayVJE8Rn0KQfN/TjkQoluZkh1Kzptkw+oLx2u2WmID0=
X-Received: by 2002:a05:6102:54a2:b0:5db:3c3b:7767 with SMTP id
 ada2fe7eead31-5e1dcfaca59mr9155596137.16.1764218556121; Wed, 26 Nov 2025
 20:42:36 -0800 (PST)
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
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
In-Reply-To: <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 27 Nov 2025 12:42:24 +0800
X-Gm-Features: AWmQ_blP9KP_04bFNRiiSxH6Z8Vu2JxzZ1V6hdafxe8pxPoB5frW9rAs1E64Uhk
Message-ID: <CAGsJ_4w8550U+1dah2VoZNuvLT7D15ktC6704AEmz6eui60YwA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	Barry Song <v-songbaohua@oppo.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Pedro Falcato <pfalcato@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Oven Liyang <liyangouwen1@oppo.com>, Mark Rutland <mark.rutland@arm.com>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Robin Murphy <robin.murphy@arm.com>, 
	=?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Steven Rostedt <rostedt@goodmis.org>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 27, 2025 at 12:22=E2=80=AFPM Barry Song <21cnbao@gmail.com> wro=
te:
>
> On Thu, Nov 27, 2025 at 12:09=E2=80=AFPM Matthew Wilcox <willy@infradead.=
org> wrote:
> >
> > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > There is no need to always fall back to mmap_lock if the per-VMA
> > > lock was released only to wait for pagecache or swapcache to
> > > become ready.
> >
> > Something I've been wondering about is removing all the "drop the MM
> > locks while we wait for I/O" gunk.  It's a nice amount of code removed:
>
> I think the point is that page fault handlers should avoid holding the VM=
A
> lock or mmap_lock for too long while waiting for I/O. Otherwise, those
> writers and readers will be stuck for a while.
>
> >
> >  include/linux/pagemap.h |  8 +---
> >  mm/filemap.c            | 98 ++++++++++++-----------------------------=
--------
> >  mm/internal.h           | 21 -----------
> >  mm/memory.c             | 13 +------
> >  mm/shmem.c              |  6 ---
> >  5 files changed, 27 insertions(+), 119 deletions(-)
> >
> > and I'm not sure we still need to do it with per-VMA locks.  What I
> > have here doesn't boot and I ran out of time to debug it.
>
> I agree there=E2=80=99s room for improvement, but merely removing the "dr=
op the MM
> locks while waiting for I/O" code is unlikely to improve performance.
>

One idea I have is that we could conditionally remove the "drop lock and
retry page fault" step if we are reasonably sure the I/O has already
completed:

diff --git a/mm/filemap.c b/mm/filemap.c
index 57dfd2211109..151f6d38c284 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3517,7 +3517,9 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
                }
        }

-       if (!lock_folio_maybe_drop_mmap(vmf, folio, &fpin))
+       if (folio_test_uptodate(folio))
+               folio_lock(folio);
+       else if (!lock_folio_maybe_drop_mmap(vmf, folio, &fpin))
                goto out_retry;

        /* Did it get truncated? */
diff --git a/mm/memory.c b/mm/memory.c
index 7f70f0324dcf..355ed02560fd 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4758,7 +4758,10 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
        }

        swapcache =3D folio;
-       ret |=3D folio_lock_or_retry(folio, vmf);
+       if (folio_test_uptodate(folio))
+               folio_lock(folio);
+       else
+               ret |=3D folio_lock_or_retry(folio, vmf);
        if (ret & VM_FAULT_RETRY) {
                if (fault_flag_allow_retry_first(vmf->flags) &&
                    !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT) &&

In that case, we are likely just waiting for the mapping to be completed by
another process. I may develop the above idea as an incremental patch after
this patchset.

Thanks
Barry

