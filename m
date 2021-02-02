Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2F830D01D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:03:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVhjG10yWzDr3R
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:03:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ItXmN3NR; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVGK56hWKzDwh6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 18:14:33 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id s15so11951049plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 23:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=1XGayTK4HPTLvC5l+72jKh59N3CTEjHrLWkQehRGI4E=;
 b=ItXmN3NR1uhvjzqMhai0oe/AOBk8yZPVZtFFUqAtmS4Dllk9QZV0DFdHv9xh0/O2lQ
 EhwVDbn/fmf58+fll9rf2Ckei2Jg23UhlL3V562Xn0HQIBHE8AbGCRVnPDQC6djDJO0I
 LMNA9yTNRRvdpn397ttKvdjjtpUhQ7fygDuMIwUeWOxAmpFxJk+imSVDvDMRu554Rxof
 aalfKn73ndZRTT62SVNi5svN9uFZZizCyZB8hf+1jf1EAK10PWlWe3OsQVebRA6Gbrs5
 D5pQvGfwDtE4eMxX5T0JAbphixa0YeBeOLqPZHp+CzYEoqvobSjJCzPc2SVosMHsPYtD
 97ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=1XGayTK4HPTLvC5l+72jKh59N3CTEjHrLWkQehRGI4E=;
 b=aNWjoDyfFakZQrklCAUizhccRVM7oMbJrYF68qjy2cMXjrYM+Q8Av4pLGgjXhqQ3gP
 FKw34GmJPRpY1U1LRPBsAPr5bublSiyyarx38ZLGg2nbZ/NH7eBRJr4wmetXqLm/KauG
 lGixvYl+HC5gH35LoheAyNnZHJb44p3MF5LKD7iJN3hCF+VABWrTi7PKQfhznMwzRknC
 I6bfWQjP8ETP68uz+K3ckiymZg6jpRzViMZKctKeyG5JmX7a/SYVY3hSVtlB3+HwFOor
 IssSHzbeDUxB40rJaw6rdG24zPQa3bUJvhwBS5KTFBjapf1kbchxcSmpSNaAVI8oFlEk
 hibw==
X-Gm-Message-State: AOAM532RHHRcHp+OkjMHbtdSizbSAO1hKIrBO/wJd+M2AMcBHTPe/llf
 ak9b/R6SyQMC7Fg35VlLnSA=
X-Google-Smtp-Source: ABdhPJzgPkbe03Mx8f1miu0cWw5cEuiVp4QPguObuIgvrXw4ZfAgK1E0Nl2N8P0OGZGEkqVVE7aicQ==
X-Received: by 2002:a17:90a:d714:: with SMTP id
 y20mr2720056pju.5.1612250069141; 
 Mon, 01 Feb 2021 23:14:29 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id v31sm22096301pgl.76.2021.02.01.23.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 23:14:28 -0800 (PST)
Date: Tue, 02 Feb 2021 17:14:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC 00/20] TLB batching consolidation and enhancements
To: Nadav Amit <namit@vmware.com>, Peter Zijlstra <peterz@infradead.org>
References: <20210131001132.3368247-1-namit@vmware.com>
 <1612063149.2awdsvvmhj.astroid@bobo.none>
 <A1589669-34AE-4E15-8358-79BAD7C72520@vmware.com>
 <YBf3sl3M+j3hJRoM@hirez.programming.kicks-ass.net>
In-Reply-To: <YBf3sl3M+j3hJRoM@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1612248111.g00kf5qxrp.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Peter Zijlstra's message of February 1, 2021 10:44 pm:
> On Sun, Jan 31, 2021 at 07:57:01AM +0000, Nadav Amit wrote:
>> > On Jan 30, 2021, at 7:30 PM, Nicholas Piggin <npiggin@gmail.com> wrote=
:
>=20
>> > I'll go through the patches a bit more closely when they all come=20
>> > through. Sparc and powerpc of course need the arch lazy mode to get=20
>> > per-page/pte information for operations that are not freeing pages,=20
>> > which is what mmu gather is designed for.
>>=20
>> IIUC you mean any PTE change requires a TLB flush. Even setting up a new=
 PTE
>> where no previous PTE was set, right?

In cases of increasing permissiveness of access, yes it may want to=20
update the "TLB" (read hash table) to avoid taking hash table faults.

But whatever the reason for the flush, there may have to be more
data carried than just the virtual address range and/or physical
pages.

If you clear out the PTE then you have no guarantee of actually being
able to go back and address the the in-memory or in-hardware translation=20
structures to update them, depending on what exact scheme is used
(powerpc probably could if all page sizes were the same, but THP or=20
64k/4k sub pages would throw a spanner in those works).

> These are the HASH architectures. Their hardware doesn't walk the
> page-tables, but it consults a hash-table to resolve page translations.

Yeah, it's very cool in a masochistic way.

I actually don't know if it's worth doing a big rework of it, as much=20
as I'd like to. Rather than just keep it in place and eventually
dismantling some of the go-fast hooks from core code if we can one day
deprecate it in favour of the much easier radix mode.

The whole thing is like a big steam train, years ago Paul and Ben and=20
Anton and co got the boiler stoked up and set all the valves just right=20
so it runs unbelievably well for what it's actually doing but look at it
the wrong way and the whole thing could blow up. (at least that's what=20
it feels like to me probably because I don't know the code that well).

Sparc could probably do the same, not sure about Xen. I don't suppose
vmware is intending to add any kind of paravirt mode related to this stuff?

Thanks,
Nick
