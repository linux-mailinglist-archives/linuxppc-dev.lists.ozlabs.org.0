Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C61002CB39F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 04:49:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm4hy5Gc9zDr22
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 14:49:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lNI3XBCF; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm4gD08N0zDr0K
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 14:47:50 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id bj5so368117plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 19:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=vso9fbKrp7rJuhxeZyuQMFTDzR5eCp91S2Q2UmwQNu8=;
 b=lNI3XBCFKt2LLxNR4G2aKs8QzeSwN8YoU49RmlOYwZwhWjw4zA9T4uk4bJt4038fio
 HF1AAiSIf+2LaxjPI/5ZoPjer3NeUrGzko76uTXIV1FVMhnXXBucKWcxcmpMUHkcI3eu
 C/bdlRXKe9gTSjQqv6gYD8Qv2XuBGcdRsZLea4+0Nexg8KNpYCVIplCa5rByseSCLDsg
 8eAVsgDkJTG1nOljMO4ke/UQBBaBZT6ll4meohVY15rxBq4EOB/u5IwYekrurQNFMYKz
 FafYNj64nqYmZCsKlMjf2RnxlBW3z3m8fhVU1BPA39SZhrnG5PWaghQkMOMETRpBoz7j
 pqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=vso9fbKrp7rJuhxeZyuQMFTDzR5eCp91S2Q2UmwQNu8=;
 b=R7xCUcCGYHBjgVytulk20pJ9j/zs1YKsoIULQrvgjBt2lP6vjLVplIJiw9bf4EAoBE
 vKuQyWR0u1fCjmk7v65qPsFV9JyxZvFQA6qrpNGiqtoBocuTp9dh6s5tjxWJ0ANF6nKt
 i8RriByOpxTSk4v3rrvoVq8kpL73BfJSIeciUqmVkq4Qhjpe+t3wI32rubORntJ37f25
 UEiEYRJjhMYhuHMLQlXweNpk6YLhlbwJ6sZGtpROGLke/UfTexuaaATuE6QHfMo5LIrE
 hdWJN96fpqG1LF1lRaaBl55/+Utbfms+PWrcP3ejBXM6W/uDxRfcFRnPM5WZ//ap69m9
 Ziag==
X-Gm-Message-State: AOAM533sUDt7ZQncLStbs3vob03xdx2bkE56xb1GQrFIFIqzDhdrAy3o
 IPbpygf1G9PHCqXcKzpJyNk=
X-Google-Smtp-Source: ABdhPJxXlpx2on+HCIB29S2yb5xH/4Wll0pcilrWx+Z8+P3dZi38+5/M+J7hVGfmNgjxUiHj+7OKCA==
X-Received: by 2002:a17:90a:d249:: with SMTP id
 o9mr489390pjw.158.1606880867992; 
 Tue, 01 Dec 2020 19:47:47 -0800 (PST)
Received: from localhost ([1.132.176.4])
 by smtp.gmail.com with ESMTPSA id q200sm384496pfq.95.2020.12.01.19.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 19:47:47 -0800 (PST)
Date: Wed, 02 Dec 2020 13:47:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies, a non-refcounting lazy tlb
 option
To: Christian Borntraeger <borntraeger@de.ibm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@intel.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Andy Lutomirski
 <luto@kernel.org>, Will Deacon <will@kernel.org>
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-7-npiggin@gmail.com>
 <CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31SaTOZw@mail.gmail.com>
 <CALCETrWBtCfD+jZ3S+O8FK-HFPODuhbDEbbfWvS=-iPATNFAOA@mail.gmail.com>
 <CALCETrXAR_9EGaOF8ymVkZycxgZkYk0dR+NjEpTfVzdcS3sOVw@mail.gmail.com>
In-Reply-To: <CALCETrXAR_9EGaOF8ymVkZycxgZkYk0dR+NjEpTfVzdcS3sOVw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1606879302.tdngvs3yq4.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of December 1, 2020 4:31 am:
> other arch folk: there's some background here:
>=20
> https://lkml.kernel.org/r/CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31Sa=
TOZw@mail.gmail.com
>=20
> On Sun, Nov 29, 2020 at 12:16 PM Andy Lutomirski <luto@kernel.org> wrote:
>>
>> On Sat, Nov 28, 2020 at 7:54 PM Andy Lutomirski <luto@kernel.org> wrote:
>> >
>> > On Sat, Nov 28, 2020 at 8:02 AM Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>> > >
>> > > On big systems, the mm refcount can become highly contented when doi=
ng
>> > > a lot of context switching with threaded applications (particularly
>> > > switching between the idle thread and an application thread).
>> > >
>> > > Abandoning lazy tlb slows switching down quite a bit in the importan=
t
>> > > user->idle->user cases, so so instead implement a non-refcounted sch=
eme
>> > > that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot d=
own
>> > > any remaining lazy ones.
>> > >
>> > > Shootdown IPIs are some concern, but they have not been observed to =
be
>> > > a big problem with this scheme (the powerpc implementation generated
>> > > 314 additional interrupts on a 144 CPU system during a kernel compil=
e).
>> > > There are a number of strategies that could be employed to reduce IP=
Is
>> > > if they turn out to be a problem for some workload.
>> >
>> > I'm still wondering whether we can do even better.
>> >
>>
>> Hold on a sec.. __mmput() unmaps VMAs, frees pagetables, and flushes
>> the TLB.  On x86, this will shoot down all lazies as long as even a
>> single pagetable was freed.  (Or at least it will if we don't have a
>> serious bug, but the code seems okay.  We'll hit pmd_free_tlb, which
>> sets tlb->freed_tables, which will trigger the IPI.)  So, on
>> architectures like x86, the shootdown approach should be free.  The
>> only way it ought to have any excess IPIs is if we have CPUs in
>> mm_cpumask() that don't need IPI to free pagetables, which could
>> happen on paravirt.
>=20
> Indeed, on x86, we do this:
>=20
> [   11.558844]  flush_tlb_mm_range.cold+0x18/0x1d
> [   11.559905]  tlb_finish_mmu+0x10e/0x1a0
> [   11.561068]  exit_mmap+0xc8/0x1a0
> [   11.561932]  mmput+0x29/0xd0
> [   11.562688]  do_exit+0x316/0xa90
> [   11.563588]  do_group_exit+0x34/0xb0
> [   11.564476]  __x64_sys_exit_group+0xf/0x10
> [   11.565512]  do_syscall_64+0x34/0x50
>=20
> and we have info->freed_tables set.
>=20
> What are the architectures that have large systems like?
>=20
> x86: we already zap lazies, so it should cost basically nothing to do

This is not zapping lazies, this is freeing the user page tables.

"lazy mm" is where a switch to a kernel thread takes on the
previous mm for its kernel mapping rather than switch to init_mm.

> a little loop at the end of __mmput() to make sure that no lazies are
> left.  If we care about paravirt performance, we could implement one
> of the optimizations I mentioned above to fix up the refcounts instead
> of sending an IPI to any remaining lazies.

It might be possible x86's scheme you could scan mm_cpumask
carefully synchronized or something when the last user reference
gets dropped that frees the lazy at that point, but I don't know
what that would buy you because you're still having to maintain
the mm_cpumask on switches. powerpc's characteristics are just
different here so it makes sense whereas I don't know if it
would on x86.

>=20
> arm64: AFAICT arm64's flush uses magic arm64 hardware support for
> remote flushes, so any lazy mm references will still exist after
> exit_mmap().  (arm64 uses lazy TLB, right?)  So this is kind of like
> the x86 paravirt case.  Are there large enough arm64 systems that any
> of this matters?
>=20
> s390x: The code has too many acronyms for me to understand it fully,
> but I think it's more or less the same situation as arm64.  How big do
> s390x systems come?
>=20
> power: Ridiculously complicated, seems to vary by system and kernel confi=
g.
>=20
> So, Nick, your unconditional IPI scheme is apparently a big
> improvement for power, and it should be an improvement and have low
> cost for x86.

As said, the tradeoffs are different, I'm not so sure. It was a big=20
improvement on a very big system with the powerpc mm_cpumask switching
model on a microbenchmark designed to stress this, which is about all
I can say for it.

> On arm64 and s390x it will add more IPIs on process
> exit but reduce contention on context switching depending on how lazy
> TLB works.  I suppose we could try it for all architectures without
> any further optimizations.

It will remain opt-in but certainly try it out and see. There are some
requirements as documented in the config option text.

> Or we could try one of the perhaps
> excessively clever improvements I linked above.  arm64, s390x people,
> what do you think?
>=20

I'm not against improvements to the scheme. e.g., from the patch

+               /*
+                * IPI overheads have not found to be expensive, but they c=
ould
+                * be reduced in a number of possible ways, for example (in
+                * roughly increasing order of complexity):
+                * - A batch of mms requiring IPIs could be gathered and fr=
eed
+                *   at once.
+                * - CPUs could store their active mm somewhere that can be
+                *   remotely checked without a lock, to filter out
+                *   false-positives in the cpumask.
+                * - After mm_users or mm_count reaches zero, switching awa=
y
+                *   from the mm could clear mm_cpumask to reduce some IPIs
+                *   (some batching or delaying would help).
+                * - A delayed freeing and RCU-like quiescing sequence base=
d on
+                *   mm switching to avoid IPIs completely.
+                */

But would like to have numbers before being too clever.

Thanks,
Nick
