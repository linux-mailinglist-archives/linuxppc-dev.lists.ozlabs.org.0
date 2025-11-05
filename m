Return-Path: <linuxppc-dev+bounces-13788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F00C34F21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 10:49:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1gX95p4Sz30Qk;
	Wed,  5 Nov 2025 20:49:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762336169;
	cv=none; b=G6LpQqg0avQJHm87J5CVYyGhUhWBsm5LqaUYHdquL7YRHor0+I1WIMi0weFgALM1ytybrvWyWSj3yvbPb+f2MNPyBLYIlrFQHYus66MJr42b+kA+vcnmGVj3Nw7bviOnvW7daGOpv4Nn6UVFofix3mn6BVg0F43sytli9vBAEvYsgAvGc1kMRylQBXV+WlJpdqMHbltexwPoGPtVp71KcUZN1r03OaINlqBHOFPt70faJKKYIxb/eJ8ijgC2kR8eBYB8h++Dwd5fjRqaWerRgIuLPkvwBI7Iyov7r0LyC6iDnNxLsIn33O4GpMtS7sBrZTM80DNn93OOzHd6pRjOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762336169; c=relaxed/relaxed;
	bh=KSkImeW26wxHMAXfbe7WvrT7t//6KWteMn9Q9gZQJTU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=nyfrqkbsSOovubdx8ums8XmeGsF9E+jeTHiTMiGMTqHcmcSf03zQJJe8G1F/Gqgl6u3i7WOW6Ygcc/chchz7nQ+cj1eE00IgU0nw7h36bKeqbnlzfha18TYFM92epWNSUCjTN5AExjwZpLVEEcmeoGLeOispdM+u3y2pr1wB1gH2+oIvNEByGTT2b7LflUiKfTc0L21oCYwohwgrDnunZ8oljQYcB5vLnKnohHIOXtaXUC+/ufYudY7fbnVWnLcKEnnXUYBLUkFtO+UcOoJVhZv5g6O4xjrxUWaCcHLT1+xYv636foAF9G6vAsdgqByMA6vI/V1YggF9w5Vcp/PEsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C5XlgCC1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C5XlgCC1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1gX84Qf5z2yjp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 20:49:28 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7ae4656d6e4so604934b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Nov 2025 01:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762336166; x=1762940966; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KSkImeW26wxHMAXfbe7WvrT7t//6KWteMn9Q9gZQJTU=;
        b=C5XlgCC1GqXZV4BQf5kkpOxV85oweov5f3ggrBN2AdvCRybYdfchpqRbc724nsELG7
         0tya5K3ujQZqpgD96i0ABn04+h7FOOoddbKoQkvr+RPVwNzwq609I+Knts8tMau855YH
         fm5BL3jndo0ISiOZ9Sb56rDrQsJlahAjxzDo9/k9ZuSc8joacN/RAlHNeoHXxEapEp5n
         5ONVeMgqqNvhdYu9Cp7c9KHQ+jiId/D5I6iInWXmexJSgthXzCJlV9uh1wQvRq2F65C1
         khrENrrkayK8E9xsll69YnHd72u3WPqCdR++IRjVRRAVMNXEXCRCeaGWjSoYHGSEwod1
         /gSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336166; x=1762940966;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSkImeW26wxHMAXfbe7WvrT7t//6KWteMn9Q9gZQJTU=;
        b=pl7aphaDJ75bmEQp0XbYBQhTbpuTlSfraXJciRW+5a4LdQ/3QVLIMgc8X5W1wpUxgK
         u6NxHDASIYgLfhPM99jdb+qiHQtSlqBFhBnRWLJE/bskUEfPeH9nj8pweqZYAg41oJyo
         JpIyDFBkCo6L71X8k5YdT4EYNfNgRr/LEjD8lDHJCJ3Iqp4uWjUloYvAXF6OWZncXPWF
         0zU79I5cxLgbPXvQ7YvBL5xjyrHOP+72hhmy50CjpFP1RHGswkGF65nCoGccrBZPdU6g
         2t12KtZFfWaoWR5L5FwaGHUCmeiBcx2GDX5f4gIPvSyFTj1AAPnzAKFHP0EpGGta4Q1D
         xopA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ5uVE8K2FpvAg1e+NuRiAeLv1Q2f3wzP+nSLXdSzNbHP0xC/2R6txgaea+iQrkD/tQv0CFfHiE4DxuUs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywmm6GgJKXoAP4sb1lfinKpHeVDcQMxDMbnrNFiXZK55MDEKvmc
	xNSLfQS8HKaypRoPFhvz7/O/8Yzho+PLQzIBCNnGaLOT0DCw80wFiUZ+
X-Gm-Gg: ASbGnctHmovCKHAJVBBoU1jvrr8c1SJqLDH8EbxQJ9f4lDvy11WRPwFASAixcOrn/6u
	WbylBu+YeHFw+8JHd3aOVrTMSXQoryTNfHByTCGJZC/dvgb1ZTuZ1XUI0kZtWl7m81vpwZaXFyG
	CrpJGggkZi/4l98ATxgzqwOe/Jp/Yk0qUeMfy25IydRJA2zydd+Zq/Kbzfuu9xF0tCu/NrfIEUB
	sZBwt7bqhkfKwfOif/BC7kmPYEdqTx+Q9LvkSISQ3eydHFe/u7Q856ltZBItXnrG8EWeJnMWNyP
	jWYDcokdWGArW2P+kuDwtJTdbt6bKfkhfc8hEwZXxMzNFe1txSVHmd05RVX6zYyhXkHdRwNJDQ1
	76wGXruEqK/DvNuZ9mj7beERyBm4NL19TtLYvCfK1RFecbxQncLh9i5QvbR9fY3OTN4FgKA==
X-Google-Smtp-Source: AGHT+IGvXEix8Ale69u5jY13ojKwbWl3rHLnPywsClHEKGLTCQBX8z03LTjZkKtfW5wInDfRAomLmQ==
X-Received: by 2002:a05:6a20:7283:b0:343:88b4:a722 with SMTP id adf61e73a8af0-34f862ff4a8mr3711914637.52.1762336166397;
        Wed, 05 Nov 2025 01:49:26 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f765f148sm5030694a12.24.2025.11.05.01.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:49:25 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 09/12] powerpc/mm: replace batch->active with in_lazy_mmu_mode()
In-Reply-To: <20251029100909.3381140-10-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 15:10:20 +0530
Message-ID: <87ldkk4y2j.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-10-kevin.brodsky@arm.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> A per-CPU batch struct is activated when entering lazy MMU mode; its
> lifetime is the same as the lazy MMU section (it is deactivated when
> leaving the mode). Preemption is disabled in that interval to ensure
> that the per-CPU reference remains valid.
>
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. We can therefore use the generic helper in_lazy_mmu_mode()
> to tell whether a batch struct is active instead of tracking it
> explicitly.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 9 ---------
>  arch/powerpc/mm/book3s64/hash_tlb.c                | 2 +-
>  2 files changed, 1 insertion(+), 10 deletions(-)
>

This looks good to me.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

