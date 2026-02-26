Return-Path: <linuxppc-dev+bounces-17322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNO6Abq0oGnClwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 22:01:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B421AF5CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 22:01:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMP5d6psxz2xNT;
	Fri, 27 Feb 2026 08:01:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772139701;
	cv=none; b=kEiBq6KwlR4WOqCwvhos98ah2BJk0s3vbH21sMfk9kccGvBtZYvJ0hnED3m9mRROPGUPAA9LXvqXtB+TAtIc9DSDf4z7H3rykM3i+zMr8ksBl7lRe+RgKgvWNmnTfrW76PiAwit9vnrjgNJSmDFLAyJIv0yzloZVV3gLAno+YPMl3eGFo+J4k28fSW9XjAXmJdu8gw5klwR0ikw9Tl4PHHmRU3KRNVZ9gQr4kaNE5BYYRsWxVKuNlh9d5INotVYGn/mr7IVfXR/407NUJ/8sYouKF5jGrxYmEkIrebg921ecreCSAwY7WxMhz0LsaY9Ad7UTFLKf5H1/baCodRX7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772139701; c=relaxed/relaxed;
	bh=bmxX/qYJNas+Kj/SszP9KMGgHjwU+T3IF8YxcVK/CRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SrHXn1JVAwPDd4XxHZoGKAVwXB37dANLL68//RU5PjshpDPpYZFhSnj85FguwigumU/bOucmgJkOMzQbT5rbT4uk39uX6KObEYOOpbDCok09UN7xDARks7xgNocUlMBxx+JU7bgzY8OpJKr2qocxLf8UY1ls11s6y2AOGSEws2QL5/S/VrFIoirbJUUAUU0IL57Lv8dAKzHCu72q2bJxc4nI8qTivnFComBEls5b9w0jPhU1gEyNbEOA2pieKy12gKMtcu7c4Z/s3x2srD7Lvxrvjqes0hA5eRa80/lEU2rblhNDGtgAysvc5ev0SPevY/qKPaAGHL1xGvPdKyTeQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iA/hbpDL; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iA/hbpDL; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=npache@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iA/hbpDL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iA/hbpDL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=npache@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMP5c2fjGz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 08:01:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772139695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmxX/qYJNas+Kj/SszP9KMGgHjwU+T3IF8YxcVK/CRk=;
	b=iA/hbpDLCfO5lyLyX77WdIbV67d0u5nW1R6fcLDJcWM+83D4W5uozuxXUHE5BeQkp24S7v
	/9xPgbV3aYLKZaFZ/T4zw37ZMBuE/go9P5aB6zBXJsMVCT6aYsZJqjj21+TR6JSYN94Yq5
	ZqwbYu6RK/URKYeMk6wr+FoGBtjIksg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772139695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmxX/qYJNas+Kj/SszP9KMGgHjwU+T3IF8YxcVK/CRk=;
	b=iA/hbpDLCfO5lyLyX77WdIbV67d0u5nW1R6fcLDJcWM+83D4W5uozuxXUHE5BeQkp24S7v
	/9xPgbV3aYLKZaFZ/T4zw37ZMBuE/go9P5aB6zBXJsMVCT6aYsZJqjj21+TR6JSYN94Yq5
	ZqwbYu6RK/URKYeMk6wr+FoGBtjIksg=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-b0_k-VcrOQCL78G6927ggg-1; Thu, 26 Feb 2026 16:01:32 -0500
X-MC-Unique: b0_k-VcrOQCL78G6927ggg-1
X-Mimecast-MFC-AGG-ID: b0_k-VcrOQCL78G6927ggg_1772139691
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79868381229so2257897b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 13:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772139691; x=1772744491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bmxX/qYJNas+Kj/SszP9KMGgHjwU+T3IF8YxcVK/CRk=;
        b=vrlDH+Ka5AcYn+9N9xHsIQXnBfscj5GhZvnv8SHdXE43PcevYbNnATI9v+rqaFUT9W
         51AATp7iEUHfdbyZ7bT0NjERo8VwPngAiQUoHGsER0FAE5C+0G71AGiQFVkFrFm8CJLl
         o/c5fNbnqx3suOCQjOJNDo3aFBvt1MbM+NJZSsSjwSuQBvr63AIpWt+zclZGHEhw0Brl
         0V6ytJFcOKylEpgIrpbR0lceybiAS0Dqlad7uMFklocnUgdx3Qtqik/SuHLzNqs1ja/K
         fvZo+UtYBElJxOLkTb3u3XN7aYX52WqCWutD8ifIhnJ7svHFGTQROxyEQB0bJFIwTItV
         Pr5A==
X-Forwarded-Encrypted: i=1; AJvYcCXRZtANFtZjx9MAGNYVAgs+8S8iN3F1dGBzGthq9OSLrWRjc2FAuZQhzwsM0CPWZp6/bbdYl1ng4ddN5/Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4mafTwGsLcmolPr0q0OgO9BpijjuGOkqf5xOlCvaIH2t4Ay9b
	/8d6K2gIowfGZTS0yuq1SCpzKEoeEMNOFdRqdv64XC6Xd4nN0+OAb/XKnm2S0UTSAel916AJvkF
	8rYRlERs37cPrheYZXlaxkoUYPY0oBkBIoYP3cdBZA2y5oLTyogigioK62h3bonfC43e/5dMG21
	God+6iEPb0YL4mrlZYyoC9+7wIOn3zVNusngWq1l9llQ==
X-Gm-Gg: ATEYQzxJtvT7JUXsrWSjuoJJDZe2S07B1lq+P7fRtKzSWzybNz9dTvpeUtUlQDkVjFw
	fpNX0jeI/zdbcw45D0XGRdwguUujHUwTgKa5Doefzz3uwgbLsiEauOHL5Fji269PGOyWAZ3pR4K
	Qx4avq2GuothDbqxys+bdwDc+5rWwCcU+ENfb9OVuqDtN/k2K9Io1OObHt6x1NzKCXme9wpqCV0
	PWR
X-Received: by 2002:a05:690e:bc6:b0:649:4f58:5cd2 with SMTP id 956f58d0204a3-64cb6e0c928mr3154551d50.0.1772139691119;
        Thu, 26 Feb 2026 13:01:31 -0800 (PST)
X-Received: by 2002:a05:690e:bc6:b0:649:4f58:5cd2 with SMTP id
 956f58d0204a3-64cb6e0c928mr3154488d50.0.1772139690404; Thu, 26 Feb 2026
 13:01:30 -0800 (PST)
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
References: <20260226113233.3987674-1-usama.arif@linux.dev>
In-Reply-To: <20260226113233.3987674-1-usama.arif@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Thu, 26 Feb 2026 14:01:04 -0700
X-Gm-Features: AaiRm5209LV06f3Unt5ipFy-rNSZmlqNghFDY0XoCRoPEuuBfLMWoAzmF-tTAXE
Message-ID: <CAA1CXcAYt3OfW_uBTYZgr-dBhg99x=5pUs5uvqtpg+PNJ1KxGQ@mail.gmail.com>
Subject: Re: [RFC v2 00/21] mm: thp: lazy PTE page table allocation at PMD split
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, lorenzo.stoakes@oracle.com, 
	willy@infradead.org, linux-mm@kvack.org, fvdl@google.com, hannes@cmpxchg.org, 
	riel@surriel.com, shakeel.butt@linux.dev, kas@kernel.org, baohua@kernel.org, 
	dev.jain@arm.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, linux-s390@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SitpAoUoNG1_uwv8xdJWgxz8ipc6sxyPEWEf0J0smUU_1772139691
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:usama.arif@linux.dev,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[npache@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-17322-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[npache@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: 91B421AF5CF
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 4:33=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> When the kernel creates a PMD-level THP mapping for anonymous pages, it
> pre-allocates a PTE page table via pgtable_trans_huge_deposit(). This
> page table sits unused in a deposit list for the lifetime of the THP
> mapping, only to be withdrawn when the PMD is split or zapped. Every
> anonymous THP therefore wastes 4KB of memory unconditionally. On large
> servers where hundreds of gigabytes of memory are mapped as THPs, this
> adds up: roughly 200MB wasted per 100GB of THP memory. This memory
> could otherwise satisfy other allocations, including the very PTE page
> table allocations needed when splits eventually occur.
>
> This series removes the pre-deposit and allocates the PTE page table
> lazily =E2=80=94 only when a PMD split actually happens. Since a large nu=
mber
> of THPs are never split (they are zapped wholesale when processes exit or
> munmap the full range), the allocation is avoided entirely in the common
> case.
>
> The pre-deposit pattern exists because split_huge_pmd was designed as an
> operation that must never fail: if the kernel decides to split, it needs
> a PTE page table, so one is deposited in advance. But "must never fail"
> is an unnecessarily strong requirement. A PMD split is typically triggere=
d
> by a partial operation on a sub-PMD range =E2=80=94 partial munmap, parti=
al
> mprotect, partial mremap and so on.
> Most of these operations already have well-defined error handling for
> allocation failures (e.g., -ENOMEM, VM_FAULT_OOM). Allowing split to
> fail and propagating the error through these existing paths is the natura=
l
> thing to do. Furthermore, split failing requires an order-0 allocation fo=
r
> a page table to fail, which is extremely unlikely.
>
> Designing functions like split_huge_pmd as operations that cannot fail
> has a subtle but real cost to code quality. It forces a pre-allocation
> pattern - every THP creation path must deposit a page table, and every
> split or zap path must withdraw one, creating a hidden coupling between
> widely separated code paths.
>
> This also serves as a code cleanup. On every architecture except powerpc
> with hash MMU, the deposit/withdraw machinery becomes dead code. The
> series removes the generic implementations in pgtable-generic.c and the
> s390/sparc overrides, replacing them with no-op stubs guarded by
> arch_needs_pgtable_deposit(), which evaluates to false at compile time
> on all non-powerpc architectures.

Hi Usama,

Thanks for tackling this, it seems like an interesting problem. Im
trying to get more into reviewing, so bare with me I may have some
stupid comments or questions. Where I can really help out is with
testing. I will build this for all RH-supported architectures and run
some automated test suites and performance metrics. I'll report back
if I spot anything.

Cheers!
-- Nico

>
> The series is structured as follows:
>
> Patches 1-2:    Error infrastructure =E2=80=94 make split functions retur=
n int
>                 and propagate errors from vma_adjust_trans_huge()
>                 through __split_vma, vma_shrink, and commit_merge.
>
> Patches 3-12:   Handle split failure at every call site =E2=80=94 copy_hu=
ge_pmd,
>                 do_huge_pmd_wp_page, zap_pmd_range, wp_huge_pmd,
>                 change_pmd_range (mprotect), follow_pmd_mask (GUP),
>                 walk_pmd_range (pagewalk), move_page_tables (mremap),
>                 move_pages (userfaultfd), and device migration.
>                 The code will become affective in Patch 14 when split
>                 functions start returning -ENOMEM.
>
> Patch 13:       Add __must_check to __split_huge_pmd(), split_huge_pmd()
>                 and split_huge_pmd_address() so the compiler warns on
>                 unchecked return values.
>
> Patch 14:       The actual change =E2=80=94 allocate PTE page tables lazi=
ly at
>                 split time instead of pre-depositing at THP creation.
>                 This is when split functions will actually start returnin=
g
>                 -ENOMEM.
>
> Patch 15:       Remove the now-dead deposit/withdraw code on
>                 non-powerpc architectures.
>
> Patch 16:       Add THP_SPLIT_PMD_FAILED vmstat counter for monitoring
>                 split failures.
>
> Patches 17-21:  Selftests covering partial munmap, mprotect, mlock,
>                 mremap, and MADV_DONTNEED on THPs to exercise the
>                 split paths.
>
> The error handling patches are placed before the lazy allocation patch so
> that every call site is already prepared to handle split failures before
> the failure mode is introduced. This makes each patch independently safe
> to apply and bisect through.
>
> The patches were tested with CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_DEBUG_V=
M
> enabled. The test results are below:
>
> TAP version 13
> 1..5
> # Starting 5 tests from 1 test cases.
> #  RUN           thp_pmd_split.partial_munmap ...
> # thp_pmd_split_test.c:60:partial_munmap:thp_split_pmd: 0 -> 1
> # thp_pmd_split_test.c:62:partial_munmap:thp_split_pmd_failed: 0 -> 0
> #            OK  thp_pmd_split.partial_munmap
> ok 1 thp_pmd_split.partial_munmap
> #  RUN           thp_pmd_split.partial_mprotect ...
> # thp_pmd_split_test.c:60:partial_mprotect:thp_split_pmd: 1 -> 2
> # thp_pmd_split_test.c:62:partial_mprotect:thp_split_pmd_failed: 0 -> 0
> #            OK  thp_pmd_split.partial_mprotect
> ok 2 thp_pmd_split.partial_mprotect
> #  RUN           thp_pmd_split.partial_mlock ...
> # thp_pmd_split_test.c:60:partial_mlock:thp_split_pmd: 2 -> 3
> # thp_pmd_split_test.c:62:partial_mlock:thp_split_pmd_failed: 0 -> 0
> #            OK  thp_pmd_split.partial_mlock
> ok 3 thp_pmd_split.partial_mlock
> #  RUN           thp_pmd_split.partial_mremap ...
> # thp_pmd_split_test.c:60:partial_mremap:thp_split_pmd: 3 -> 4
> # thp_pmd_split_test.c:62:partial_mremap:thp_split_pmd_failed: 0 -> 0
> #            OK  thp_pmd_split.partial_mremap
> ok 4 thp_pmd_split.partial_mremap
> #  RUN           thp_pmd_split.partial_madv_dontneed ...
> # thp_pmd_split_test.c:60:partial_madv_dontneed:thp_split_pmd: 4 -> 5
> # thp_pmd_split_test.c:62:partial_madv_dontneed:thp_split_pmd_failed: 0 -=
> 0
> #            OK  thp_pmd_split.partial_madv_dontneed
> ok 5 thp_pmd_split.partial_madv_dontneed
> # PASSED: 5 / 5 tests passed.
> # Totals: pass:5 fail:0 xfail:0 xpass:0 skip:0 error:0
>
> The patches are based off of 957a3fab8811b455420128ea5f41c51fd23eb6c7 fro=
m
> mm-unstable as of 25 Feb (7.0.0-rc1).
>
>
> RFC v1 -> v2: https://lore.kernel.org/all/20260211125507.4175026-1-usama.=
arif@linux.dev/
> - Change counter name to THP_SPLIT_PMD_FAILED (David)
> - remove pgtable_trans_huge_{deposit/withdraw} when not needed and
>   make them arch specific (David)
> - make split functions return error code and have callers handle them
>   (David and Kiryl)
> - Add test cases for splitting
>
> Usama Arif (21):
>   mm: thp: make split_huge_pmd functions return int for error
>     propagation
>   mm: thp: propagate split failure from vma_adjust_trans_huge()
>   mm: thp: handle split failure in copy_huge_pmd()
>   mm: thp: handle split failure in do_huge_pmd_wp_page()
>   mm: thp: handle split failure in zap_pmd_range()
>   mm: thp: handle split failure in wp_huge_pmd()
>   mm: thp: retry on split failure in change_pmd_range()
>   mm: thp: handle split failure in follow_pmd_mask()
>   mm: handle walk_page_range() failure from THP split
>   mm: thp: handle split failure in mremap move_page_tables()
>   mm: thp: handle split failure in userfaultfd move_pages()
>   mm: thp: handle split failure in device migration
>   mm: huge_mm: Make sure all split_huge_pmd calls are checked
>   mm: thp: allocate PTE page tables lazily at split time
>   mm: thp: remove pgtable_trans_huge_{deposit/withdraw} when not needed
>   mm: thp: add THP_SPLIT_PMD_FAILED counter
>   selftests/mm: add THP PMD split test infrastructure
>   selftests/mm: add partial_mprotect test for change_pmd_range
>   selftests/mm: add partial_mlock test
>   selftests/mm: add partial_mremap test for move_page_tables
>   selftests/mm: add madv_dontneed_partial test
>
>  arch/powerpc/include/asm/book3s/64/pgtable.h  |  12 +-
>  arch/s390/include/asm/pgtable.h               |   6 -
>  arch/s390/mm/pgtable.c                        |  41 ---
>  arch/sparc/include/asm/pgtable_64.h           |   6 -
>  arch/sparc/mm/tlb.c                           |  36 ---
>  include/linux/huge_mm.h                       |  51 +--
>  include/linux/pgtable.h                       |  16 +-
>  include/linux/vm_event_item.h                 |   1 +
>  mm/debug_vm_pgtable.c                         |   4 +-
>  mm/gup.c                                      |  10 +-
>  mm/huge_memory.c                              | 208 +++++++++----
>  mm/khugepaged.c                               |   7 +-
>  mm/memory.c                                   |  26 +-
>  mm/migrate_device.c                           |  33 +-
>  mm/mprotect.c                                 |  11 +-
>  mm/mremap.c                                   |   8 +-
>  mm/pagewalk.c                                 |   8 +-
>  mm/pgtable-generic.c                          |  32 --
>  mm/rmap.c                                     |  42 ++-
>  mm/userfaultfd.c                              |   8 +-
>  mm/vma.c                                      |  37 ++-
>  mm/vmstat.c                                   |   1 +
>  tools/testing/selftests/mm/Makefile           |   1 +
>  .../testing/selftests/mm/thp_pmd_split_test.c | 290 ++++++++++++++++++
>  tools/testing/vma/include/stubs.h             |   9 +-
>  25 files changed, 645 insertions(+), 259 deletions(-)
>  create mode 100644 tools/testing/selftests/mm/thp_pmd_split_test.c
>
> --
> 2.47.3
>


