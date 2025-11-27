Return-Path: <linuxppc-dev+bounces-14514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D189C8CCBE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 05:22:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dH3Dp22lWz30HQ;
	Thu, 27 Nov 2025 15:22:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764217354;
	cv=none; b=h17gp46InIZtkp41Crckibu0xsrfI4X/6kaEKDSA7KEEc8Dp2Q3N7F2bnuvnFpn4nFX53A1UDMMMeirRf6TM/nc19zwKBgp8A60P00MRElT+AD/R0XwvMT8W1GdtRhrY9cYsw9tYCNCR4Mib7DKqP5uttXnAytRIYq3sXXYs7YQEYXLpIfEdkylOQ2ZjzMIoqnyraS2Luj36cELp+1k+QmXf2tJCLfey6EwhZzzmYppIXIs1rRjJ/KC8zM4QN0P0VcnywSOezpBtrhUG/HaiFbHXo2uFZQu0bGXNwDnLjH6VeE0dVB1BcDgqnHgcjLeeOLmHvuPUhksekK5utRYmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764217354; c=relaxed/relaxed;
	bh=WBY2hGlp5xDNa7Ek85Hj92aNDRHVnR99QGNyQtFdIz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WF9SY0vf/5VxjdVBMsyXsjlCNiZUZs/+brpP/ZbADbnkjMGBMdQ+mxWLhuV1j7kRklfAytGdHs9ICGdwvzVVOTWCxcJQNTWQ+pWlEVCf04xUpS7Nfgm2wWT8cgmAptjm9lnFA+P4njk15CzGbUqkTvkY28WccxwvaksWinPW1VWWfx/hRC6gft0+bzGhIV/ZcNrU0OPaRhh68/80i1VRurkYMBOX8rgOsa3jY9lOT1rj125067MtfirEQaNGqi0sRmAw7DBgQadnZF5J1VjJ+anRMhS1RrL4KHwippbRUxNA9Mp9YYjvmX9ZfbBt1WBhFQeowmid0obPPaGAjWt0Lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k9s1B1D9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k9s1B1D9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dH3Dm3rrqz30FR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 15:22:31 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8b220ddc189so47644885a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 20:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764217349; x=1764822149; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBY2hGlp5xDNa7Ek85Hj92aNDRHVnR99QGNyQtFdIz8=;
        b=k9s1B1D9a8cev3GJsquuu9E+Ze5P12WwdJCp9N8AXr9ccgtjNJfavtjOxu4pXHUzX6
         Pl6tzOjOcjYUVwqvLHqq0O8nPE2rB0GZ6Hpg2fMmo3BWRxwFiAs5F/5ZahJRvSbgkv/Z
         XDuS2EXCPjx2smUcoGeMsMdcQSNjASIdS1c2Gw6ukV6XiTq+DeU8kjEWDQaXra2gcot8
         CgXl0yluNZXbKKn8K5aQhBVLYH2pvfmtK7iax1l6p7422mik2G9dqmWS5rBNQGl0lNtD
         k2kMsXGXL4HfvHyUx7x7M9F3LcDSfQjUHsTlHT1vMlPJjfQNKi0+BOzSBmyqpPSdYEJb
         pKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764217349; x=1764822149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WBY2hGlp5xDNa7Ek85Hj92aNDRHVnR99QGNyQtFdIz8=;
        b=YtqIsbqlx3rV3nwchvimmgG9wI290yUAdsd/tprbKextnG1nIPw/fxnJRJuxBGfT2q
         OXG47FEMQACWlMh5ZPQa42Kq3Jm0ObJKB+JCkeYkm7bQZV5Ok8aPIlz0k2HQ6/JrgqC3
         VFgGR7qj8Ha3Q/CLYBwaNv9V8qvPOyw0FVJLmKvtg2bByQ0km5WDiSU2LWZX5mRRTCco
         z18+ibxDUFSqKSGYTUel22BN3EUtUR2RMskJmqZX3+8At5702XihrsKphNOVNuYRuBmQ
         jGiPkM/KxbneCCl6cyWk43SGYHU0rqWWlF1nHuMY6JtLJN4X3EdywlBuWWLk+6CS/NoC
         2Bbg==
X-Forwarded-Encrypted: i=1; AJvYcCXiveleh+b3eWU0SCxHEpGEolP8ek5OfY0/LoXB2QTyd8AKN1zPih1uBsJD5Ryk/AZp9zq4+j+4FIiMbsA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgUgh/27ypgZIeoeq3Qt15IuIRU/ije6NLgdV6I25rZ3xpMB8U
	Ym5OSByUbX1BEY4ynKi34lo34gWvfAUZwKmrqeknLrD0JIezPxIidncQMAUox5YgTOhChk0q2lc
	xcFFoByRDnManAY1zmYWi63yWsqSYaN8=
X-Gm-Gg: ASbGncsHUcq0YITLYDa6heznbBvg0jhkVOJ9pd92f+B+6nlUmt9f1eDeEUWjKUM31ex
	4MFTDe23Dlx3PhR6lcAm9XYdtJB2c4C7qMZg8SsTSMbEmwtSuaj6w0FECld1NpSqZsbKHSQ558+
	VjXQDIP23bKvj7ko4JNv2gcs+mFJXhjQiO4q6dX161dPywP+O4CRpUflN1NiHiHHPIh3X6WPEtq
	nAqwbSsurlmpI3vXeut+/ZiH1FEZO4vXTmziRBzGbcodmdJPxK/Lla8+bw5r/OLc0MuNPGNDwQb
	Z4sG
X-Google-Smtp-Source: AGHT+IF/2OHEG3LUgPMXOJw4DDaFf/N1kDbkxj4PlQ+jOCs1AfpUOxHzVBEY8oHxETzeiPPKmtGSMi/k9qIz1abldeY=
X-Received: by 2002:a05:620a:44d4:b0:8b2:f9ac:a893 with SMTP id
 af79cd13be357-8b33d49a4c6mr3106281485a.66.1764217348492; Wed, 26 Nov 2025
 20:22:28 -0800 (PST)
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
In-Reply-To: <aSfO7fA-04SBtTug@casper.infradead.org>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 27 Nov 2025 12:22:16 +0800
X-Gm-Features: AWmQ_bnJyCR-GwS1_fTaB2mJ8nbB2MiVvoC0dBi_6l0nwDIR-Nl2i2LJsMX4LWo
Message-ID: <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
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

On Thu, Nov 27, 2025 at 12:09=E2=80=AFPM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > There is no need to always fall back to mmap_lock if the per-VMA
> > lock was released only to wait for pagecache or swapcache to
> > become ready.
>
> Something I've been wondering about is removing all the "drop the MM
> locks while we wait for I/O" gunk.  It's a nice amount of code removed:

I think the point is that page fault handlers should avoid holding the VMA
lock or mmap_lock for too long while waiting for I/O. Otherwise, those
writers and readers will be stuck for a while.

>
>  include/linux/pagemap.h |  8 +---
>  mm/filemap.c            | 98 ++++++++++++-------------------------------=
------
>  mm/internal.h           | 21 -----------
>  mm/memory.c             | 13 +------
>  mm/shmem.c              |  6 ---
>  5 files changed, 27 insertions(+), 119 deletions(-)
>
> and I'm not sure we still need to do it with per-VMA locks.  What I
> have here doesn't boot and I ran out of time to debug it.

I agree there=E2=80=99s room for improvement, but merely removing the "drop=
 the MM
locks while waiting for I/O" code is unlikely to improve performance.

For example, we could change the flow to:
1. Release the VMA lock or mmap_lock
2. Lock the folio
3. Re-acquire the VMA lock or mmap_lock
4. Re-check whether we can still map the PTE
5. Map the PTE

Currently, the flow is always:

1. Release the VMA lock or mmap_lock
2. Lock the folio
3. Unlock the folio
4. Re-enter the page fault handling from the beginning

The change would be much more complex, so I=E2=80=99d prefer to land the cu=
rrent
patchset first. At least this way, we avoid falling back to mmap_lock and
causing contention or priority inversion, with minimal changes.

Thanks
Barry

