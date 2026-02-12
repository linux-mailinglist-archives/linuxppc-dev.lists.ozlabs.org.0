Return-Path: <linuxppc-dev+bounces-16842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHOhIYTdjWna8AAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 15:02:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA33912E0FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 15:02:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBcST0S4dz2yLH;
	Fri, 13 Feb 2026 01:02:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770904952;
	cv=none; b=NRpd54fjq8zqa1GzHL/9GBeUD7OgRcM/titTPmcJGdBcN6tACpJu6rdLhlZpXWvD50pmW+wD1v2bJyx2vMF45hc5cl50ENUUVdoOE8lzM4vb0dWAY8/pp5lBETV9vEIlVASMY1neBJ3dE53g2Dvs3TX6KWZiCHNTL9EZoRyQxl3/fub6DIohS3xuzdyNhWuTjhaqjwX/7s5ZcCaX2hl56vFIsxnqufMBtPY1hFccrhBhMRcQw0R0QeQtIFVwykexZs8NCnjiGgFyGqbUug60UxFAYObLkv0H1ixb/hmF20YhEENTz+h/2AhQkyaxdHL1CxhfC4ndRsgFJQG6RUpzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770904952; c=relaxed/relaxed;
	bh=TFo74y0zOAZJ1gXikBmhZ5x7gnmWzyBSYEmf4KFlu6g=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=PQBhhnGEjJJoVFrHAr/avm0qT8Ss4rhpp6TXtk51oRoSs515QnUuf687hbwDplPVPu5gmwblQTwY2MGlYJMUKScaanjpfFn6jGyTlmEv1+bGajrCrP9E7kALoW+zv5Q/ssJCHSsvFTrLzEXPv4eB7MQviefGAkRhYJa1uax+o+x06jxoT+Tx5MXWnsNeqiIz07joojweUL+hWV/o9+3skU5642fK0VfVoztbf1AVMU10iEGS1Hu3ELctDiK98eWBOmfzEhGqAUj8H7DjNAVm4c/oK800jDhUBsNmT9aqQ8jN/g6wA9buzd/P6DJIrS/m14t0nxkILpqL+ystuzO+QQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AOI6KiAS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AOI6KiAS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBcSR1pZZz2xXB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Feb 2026 01:02:30 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso3405139b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 06:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770904947; x=1771509747; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFo74y0zOAZJ1gXikBmhZ5x7gnmWzyBSYEmf4KFlu6g=;
        b=AOI6KiASdqAnBkZ1CLXTjCAgtvO5jBVezitMDUR4p3FMtgM+h6Rp5es4+9XvEC1bP3
         9MuYVtHYJ7C6pNtZ2t8/WtQhGuYZ17hIDMs4mpftkPTCfzFNz/EVdr8MR7keOJoecg78
         iDruzQvKptSjasxW50wIX1JIpjSHhRa4Rhjn1Qvm1L02Wuz705ySdqqmvXZFonHfkzqr
         svOzRWNq0bisDq3MiyH7qFacnaQkaspVHWVymo9vVVuZGsm+oEUEo/HO/4E/ELv3uCYX
         VhFFteWZT/i0p3uTexRctegrRGp1olsR1VzPW7xxzG9Omu1xDfNiWSZSiVGO9VRo/qmS
         SC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770904947; x=1771509747;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TFo74y0zOAZJ1gXikBmhZ5x7gnmWzyBSYEmf4KFlu6g=;
        b=LoIEtizd69NVSDJNiKxGIGzeBzCRRHUmXdiUv/7VRJo4tiryM6+zmfshj3hw5JCSPa
         hjK+zj87gcxYjbyqd9WtzTy6hzvKQcqcMJXYIRhuIlOlSKikNsH6HxwfBLX010guoG6p
         kwq4OamNJxIHIz+axjjFPlIhaTCoSil4TqfuIoyu0Hq+RLOHacgLFgSKp0zXx9vTIkmf
         lRb68iQPqjxcHlJ0AEH5jc+t06Ne7UiSSHCd7mPNGSXBHyNlfCBm1LxsrzG4Tvj6rVpS
         TEICAyRs8TLkTm8VPJ8M6YporJ0h6DNtnj/Nh5hsRgic/dyuLGqrV2bdwa9ZjehoiCkv
         TC8A==
X-Forwarded-Encrypted: i=1; AJvYcCWrn5KUfGTYTEfImQ6b7V/r9d54fZqXYyCH82lun/kAY+wbp4v6J45Np4Lpj8Lv7cfySpbhH5e+BVmTd8U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwfuUWBU2lXpTNECIi6zkcpVMaZl8op/odZ9zkJ64Okwz0oaGFN
	IVliHiy8ERTcwsNRNJ2dhfeI08Eb0WdqXrTSaTSo4oYwOc9xvskIfcomw/9Jyb8S
X-Gm-Gg: AZuq6aKSve33QF8F1varSgmbJsZQ8+FpR2c3sJLpCIILy2gnpIimAq08HF7xdQ0Exc3
	I1UwI+ub8D1Z6OChaLLEWkQFYpxFi/g0s4a6OOSCo7GDOhhPZO+mWtvEGnBF9LcC1+2H9t4WOH5
	BwlbV1h9zXcmjPzC9MTVJyiHD87JlMpKioUxy9PXi6ZJgYNh641CiY3gcdvBTBkFUMKsSPJi704
	usqls9Q/UUM0TJ2m/hvJWohnWOiHoLjGgifJqAFma/n6b3N5IlHIuT+tHxcVov7XY8B3YPe4ifc
	RJ+7xavcOJiPnemdELc2lm92u+GXSCkMWuoFSusF87ZIRAoXLu7PqSRcnbSSlUeYULrgxGiFPw8
	sk+ICVa1BUwVi2HIsHzXnUXhkopMwd6HpjynZOdALyVLvHY4e6v5+NN8LJoAAXVVMgLd1s7q3CO
	/ieBD3kzyrMLNSmMjL
X-Received: by 2002:a05:6a00:a24b:b0:823:7ac:1417 with SMTP id d2e1a72fcca58-824b05a920bmr2508988b3a.67.1770904946842;
        Thu, 12 Feb 2026 06:02:26 -0800 (PST)
Received: from dw-tp ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3bd8cbsm5369677b3a.24.2026.02.12.06.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:02:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, Usama Arif <usama.arif@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, lorenzo.stoakes@oracle.com, willy@infradead.org, linux-mm@kvack.org
Cc: fvdl@google.com, hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, kas@kernel.org, baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com, npache@redhat.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, vbabka@suse.cz, lance.yang@linux.dev, linux-kernel@vger.kernel.org, kernel-team@meta.com, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC 1/2] mm: thp: allocate PTE page tables lazily at split time
In-Reply-To: <13ab56cb-7fdb-4ee4-9170-f9f4fa4b6e37@kernel.org>
Date: Thu, 12 Feb 2026 17:43:33 +0530
Message-ID: <875x82ma6q.ritesh.list@gmail.com>
References: <20260211125507.4175026-1-usama.arif@linux.dev> <20260211125507.4175026-2-usama.arif@linux.dev> <13ab56cb-7fdb-4ee4-9170-f9f4fa4b6e37@kernel.org>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:usama.arif@linux.dev,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@suse.cz,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16842-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[david.kernel.org:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: EA33912E0FA
X-Rspamd-Action: no action

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> CCing ppc folks
>

Thanks David!

> On 2/11/26 13:49, Usama Arif wrote:
>> When the kernel creates a PMD-level THP mapping for anonymous pages,
>> it pre-allocates a PTE page table and deposits it via
>> pgtable_trans_huge_deposit(). This deposited table is withdrawn during
>> PMD split or zap. The rationale was that split must not fail—if the
>> kernel decides to split a THP, it needs a PTE table to populate.
>> 
>> However, every anon THP wastes 4KB (one page table page) that sits
>> unused in the deposit list for the lifetime of the mapping. On systems
>> with many THPs, this adds up to significant memory waste. The original
>> rationale is also not an issue. It is ok for split to fail, and if the
>> kernel can't find an order 0 allocation for split, there are much bigger
>> problems. On large servers where you can easily have 100s of GBs of THPs,
>> the memory usage for these tables is 200M per 100G. This memory could be
>> used for any other usecase, which include allocating the pagetables
>> required during split.
>> 
>> This patch removes the pre-deposit for anonymous pages on architectures
>> where arch_needs_pgtable_deposit() returns false (every arch apart from
>> powerpc, and only when radix hash tables are not enabled) and allocates
>> the PTE table lazily—only when a split actually occurs. The split path
>> is modified to accept a caller-provided page table.
>> 
>> PowerPC exception:
>> 
>> It would have been great if we can completely remove the pagetable
>> deposit code and this commit would mostly have been a code cleanup patch,
>> unfortunately PowerPC has hash MMU, it stores hash slot information in
>> the deposited page table and pre-deposit is necessary. All deposit/
>> withdraw paths are guarded by arch_needs_pgtable_deposit(), so PowerPC
>> behavior is unchanged with this patch. On a better note,
>> arch_needs_pgtable_deposit will always evaluate to false at compile time
>> on non PowerPC architectures and the pre-deposit code will not be
>> compiled in.
>
> Is there a way to remove this? It's always been a confusing hack, now 
> it's unpleasant to have around :)
>

Hash MMU on PowerPC works fundamentally different than other MMUs
(unlike Radix MMU on PowerPC). So yes, it requires few tricks to fit
into the Linux's multi-level SW page table model. ;) 


> In particular, seeing that radix__pgtable_trans_huge_deposit() just 1:1 
> copied generic pgtable_trans_huge_deposit() hurts my belly.
>

On PowerPC, pgtable_t can be a pte fragment. 

typedef pte_t *pgtable_t;

That means a single page can be shared among other PTE page tables. So, we
cannot use page->lru which the generic implementation uses. I guess due
to this, there is a slight change in implementation of
radix__pgtable_trans_huge_deposit(). 

Doing a grep search, I think that's the same for sparc and s390 as well.

>
> IIUC, hash is mostly used on legacy power systems, radix on newer ones.
>
> So one obvious solution: remove PMD THP support for hash MMUs along with 
> all this hacky deposit code.
>

Unfortunately, please no. There are real customers using Hash MMU on
Power9 and even on older generations and this would mean breaking Hash
PMD THP support for them. 


>
> the "vma_is_anonymous(vma) && !arch_needs_pgtable_deposit()" and similar 
> checks need to be wrapped in a reasonable helper and likely this all 
> needs to get cleaned up further.
>
> The implementation if the generic pgtable_trans_huge_deposit and the 
> radix handlers etc must be removed. If any code would trigger them it 
> would be a bug.
>

Sure, I think after this patch series, the radix__pgtable_trans_huge_deposit() 
will mostly be a dead code anyways. I will spend some time going
through this series and will also give it a test on powerpc HW (with
both Hash and Radix MMU).

I guess, we should also look at removing pgtable_trans_huge_deposit() and
pgtable_trans_huge_withdraw() implementations from s390 and sparc, since
those too will be dead code after this.


> If we have to keep this around, pgtable_trans_huge_deposit() should 
> likely get renamed to arch_pgtable_trans_huge_deposit() etc, as there 
> will not be generic support for it.
>

Sure. That make sense since PowerPC Hash MMU will still need this.

-ritesh

