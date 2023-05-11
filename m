Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1CF6FFCB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 00:38:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHRcf4z1Pz3fWj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 08:38:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=leqASNj4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=leqASNj4;
	dkim-atps=neutral
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHRbl2lszz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 08:37:22 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-55a64f0053fso138501737b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 15:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683844637; x=1686436637;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7hKTTTuYzAS0vkkDuN/hWvEkav8P49YQtcFz2W5wMI=;
        b=leqASNj4yXDwWkS3XyfGWIhxAw4SXxeg+extgQ/D3LGDyC8VCP1/fZdCDvzoBwFKI4
         QsCpGgSaYJ3A6Zsn21DOX95W5x878ZXSFyOvGdFILF6cniMlbGpQ7kGstvh8Z0S2dYcr
         KAZan2e+K8+hIYGfwKwpNjm5N5qCVBq6paKd8Ge6TYCsDubNG0nFnc28YyshVIf+H1TB
         XtjHozhI9s8vKDiN1ralH7fr2aSIYGrsjfbuSUekrZzkfIqSGnPlfgmSzyftn9ttXqkA
         wtISLC6kLw6VjZt4HnbIKNxY1VCI8P1bODtk830M8QQedX+j6RlN/KsBHhJiNcIqK0oT
         5pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844637; x=1686436637;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7hKTTTuYzAS0vkkDuN/hWvEkav8P49YQtcFz2W5wMI=;
        b=jvOZUiirljYFyT0+PfGvS9yr/Np+bbbUE5HhWqhsc/AShqwxGHfyjhnrkCwB9A9thp
         YmIU5mnwcB7cJ5CObzXCQA0IfFaekSo0XOCxEXLqQxVDnKLwiKr8HhXz+bluTOOlXqFr
         j/yo7p0Nlms76MOx902spQsHcQP9ErFNJB9MJMQ5754KBKBPD64fa9ZJPd4Jlw30zQ0M
         udGOyPnCwpL9f0J2+Ox5WmX/P+KyggmL8cVe2St14Z/jii3N1fadwMk/3FLeOk21YGg/
         5ggaXo+/upwd1sx0j9lSbr5CokTMJIVdLZjnASp1cCPzyDgk2prWwIuWn0YobPA1qcOP
         eMDw==
X-Gm-Message-State: AC+VfDzKUJc5aaB730zvCi+bplVMbBM8GILA9B0+dmmisyfBPpTpdHqz
	y25ljsaTAvCgw0M0okPEgSTndQ==
X-Google-Smtp-Source: ACHHUZ5ulkW3cY83+IL8attIxR7bTyRhvIioTTYSGrJhrY5IS/y6LwBFwFzMwChvIicQOTRvegivGA==
X-Received: by 2002:a0d:d993:0:b0:559:d294:1c48 with SMTP id b141-20020a0dd993000000b00559d2941c48mr22473279ywe.24.1683844637583;
        Thu, 11 May 2023 15:37:17 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id k189-20020a0dfac6000000b0054fa5f6c0cdsm5262641ywf.53.2023.05.11.15.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:37:17 -0700 (PDT)
Date: Thu, 11 May 2023 15:37:06 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 00/23] arch: allow pte_offset_map[_lock]() to fail
In-Reply-To: <ZFz1j1slZHCQmwMJ@casper.infradead.org>
Message-ID: <5f1dd6f-1e75-8d98-3083-e1bd2163dcc6@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <ZFs0k2rrLPH9A/UU@casper.infradead.org> <d7f3c7b2-25b8-ef66-98a8-43d68f4499f@google.com> <ZFz1j1slZHCQmwMJ@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Michel Lespinasse <michel@lespinasse.org>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-ke
 rnel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 May 2023, Matthew Wilcox wrote:
> 
> I was thinking that removing CONFIG_HIGHPTE might simplify the page
> fault handling path a little, but now I've looked at it some more, and
> I'm not sure there's any simplification to be had.  It should probably
> use kmap_local instead of kmap_atomic(), though.

Re kmap_local, yes, one of the patches in the next series does make
that change.

> 
> I infer that what you need is a pte_access_start() and a
> pte_access_end() which look like they can be plausibly rcu_read_lock()
> and rcu_read_unlock(), but might need to be local_irq_save() and
> local_irq_restore() in some configurations?

Yes, except that the local_irq_restore() in PAE-like configurations
(if we need it at all) is not delayed until the pte_access_end() or
pte_unmap() - it's internal to the pte_access_start() or pte_offset_map():
interrupts only disabled across the getting of a consistent pmd entry.

Over-generalizing a little, any user of pte_offset_map() (as opposed to
pte_offset_map_lock()) has to be prepared for the ptes to change under
them: but we do need to give them something that is or was recently the
relevant page table, rather than a random page mishmashed from mismatched
pmd_low and pmd_high.

> 
> We also talked about moving x86 to always RCU-free page tables in
> order to make accessing /proc/$pid/smaps lockless.  I believe Michel
> is going to take a swing at this project.

(And /proc/$pid/numa_maps, I hope: that's even worse in some way, IIRC.)

That might be orthogonal to what I'm doing: many non-x86 architectures
already do RCU-freeing of page tables via the TLB route, but that doesn't
cover a pte_free() from retract_page_tables() or collapse_and_free_pmd().

Hugh
