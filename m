Return-Path: <linuxppc-dev+bounces-14785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A891ACC0FE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 06:18:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVlZ0269Lz2yDY;
	Tue, 16 Dec 2025 16:18:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765862280;
	cv=none; b=RngiSsLHZQSG6y1JTZYa29vfVmz827FRXFsY20gZgfIH0eHlkxz6fJU5fytaFBs2q7k59NrCaHTurJVQXeL35J7bbQw5ty6tEgDRdGyGG4ppVfMCTWI6/HtKbhbKGnlnNUrnbeDVR4karukSe5gUA4fKMz2ikHQgSzfQ3HDjAo1N9EswFS2PcP0l6ngwQK8wk3jaWTIJr+ujTCQKmgvbo26QLe+Ww/wuCaLOhd+6IVcOg+2jLxmeNp3S+r6cIlunpETI4S/RAmST8umPH3OX72YamYmZvqnoIZGHuqiTnHwsJu0pFpm0NII8GvoHuHWJgX2ewsAqQ9AKyr/B+hJFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765862280; c=relaxed/relaxed;
	bh=xjD+cNbyJGOMAKpBo5e8LJBh9aFpu4/6uuuLCwZXOF0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=CwrSmLWAFEZoaSFiiYeZShyptAOVBy7x8nDwznUCohz0iJQSvkozsBJn3sWhgz/1xea/haInj5fK0f26OrBXhunz+zXWDxfYzSvx22HoXTJg+Tl+6nMJMohJPTptyqncISoTI+mHwAdwniaqyO+EaP59aYdOL+X5liYObWTSdRxx7tNcEemNe9QaoigQRk1q4KLGZD/nXzwMdrvGp6WwkfN11Mx5OQ1kpwTjrpblOvw+dwZr1yhiaMPKdjf/FFazE+elt+0ic2mw0KeWWqBJUMXxduQJ0tzC2fSUP/w1+hBwsUdmUzc7kLkXCo4ooURkXLgjF4FMce8Rqx341Xkfww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JntFh8hm; dkim-atps=neutral; spf=pass (client-ip=209.85.210.178; helo=mail-pf1-f178.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JntFh8hm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.178; helo=mail-pf1-f178.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVlYy1Xw0z2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 16:17:57 +1100 (AEDT)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7ade456b6abso3206194b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 21:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765862214; x=1766467014; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xjD+cNbyJGOMAKpBo5e8LJBh9aFpu4/6uuuLCwZXOF0=;
        b=JntFh8hm+98w9Ypn1+GwF2OQ/hFSgC9BtFYWEEz6rjMxDlC3XbKe/+Gu9IjUiLRwb5
         XMXprsj65p9wXhRtd5mAMu0nR7KHfh8noOuUe5EKdnS0voXhKQY7+Axhy+s0Z0Sppmg2
         IPtdcfyGnZE3P+fSCF2UZ7u+oMKyK3oicL8YYm8QykU8wr1lcfNbVFAPw7I8nABB5u8V
         enXpxdOZxrpngo03duh+Ub1wQ7CbEZ2PO5jEVX7VPCJh8WeLY0C2oQ0oBj+mNUrSLH1x
         PG35gITyLxDFUPSQtQnFqY6AQsn8Jqgbf0Lfmre5xBtxrFOnJTLMo1WsHL85rjXKTuqH
         f2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765862214; x=1766467014;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjD+cNbyJGOMAKpBo5e8LJBh9aFpu4/6uuuLCwZXOF0=;
        b=KjS78i2QdjlJvdR8EcNxhveFWlNJ7YFEcmwqCBBOXe8pbSZmmxPrnWbkZQDnVJDsRt
         1DD/RidklVy5OWDytwUe0tZfBivFlQ5WxiQvB8j7jwokYVIt/Madn5KN4NGOYXWOhSwT
         byHTyvnj3upNvHbWPR3GscXUDw54RqRTFuGIzklLUJeO9EUCCSlsrT9NMfD5Z+vunkhz
         CcT9O2/qHpK5HYyBF6ZaR8MoeM8DIREHmw+vSLtn+Y6OGSdmErP2lTH/ekuNZV5gXpqE
         FQdUnLCLa1GyOdiI4uwhV1bpUqyX995mOsEVWiLSCqAoTJCmyLpYv7iZ+Mq5EYDtdSn3
         mwbw==
X-Forwarded-Encrypted: i=1; AJvYcCUWvtfCxqfU7ena4zpNCSaUZcXAddjvE1ld/henUu2tMTNyGJ7LzNzLhk32T1tPTiCSZ/uZmBviyIlTy5c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJkrlkY2BFyVZyFeMSMf29YDU21OEmWmw7Uy7iCLnzOwnCtkYb
	HcJvK4w3owwDCk1iopP9JHlLD9gBBwMT5bc0Y1mvtA0ds58wyaDXGC2g
X-Gm-Gg: AY/fxX7wWKKahz9GEW+7zBqU+sGuuUc7yG99erYNpM+LMoh9BR3Y9NeHf3g8eQmBu5y
	xN1vk9Doo+cq5ymnLypVJdvVUFUEo49r5AFuAMJdG5+e+A8vEThyjyGw0UDKKUCZcwSStgbGvUH
	RkXvl7/YN81o76jiDYv0C8YkQ62TCeLxe+lD8AYAPowYHoUKsSnFJjnDabuCk3PJogwGPTnTdk1
	sOW6V24GRGi4rJDEMaF8mCsZIQK4PAimfyWpirxm5ZH27qHpamUHZ19yEdSxoWbBORqrOQMzdGz
	DHUoOaqTEakKuxyegQOEUR9BYMIOO45U+UV7qqije04uxdKbAJyInaZolmpArPUbnV99N5kwTeJ
	yWPbd9QO55vwMDF8Rv0UXD+hHWSrypJL4Crw/Msmw4vfV4q+/Z7Q1a+p0tWPnkxl3IET0bVAuej
	DJuNv0
X-Google-Smtp-Source: AGHT+IFRNBpu36xO7SS++RmJSf+Yd0YivNXXnhzhZN3Px6CmR0fp7AX2KZRojw083jfNpLsrb718Lg==
X-Received: by 2002:a05:6a20:5491:b0:366:14b0:4b05 with SMTP id adf61e73a8af0-369afc00407mr13380900637.65.1765862214371;
        Mon, 15 Dec 2025 21:16:54 -0800 (PST)
Received: from dw-tp ([203.81.242.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c25a87487sm14064659a12.7.2025.12.15.21.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 21:16:53 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Juergen Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v6 03/14] powerpc/mm: implement arch_flush_lazy_mmu_mode()
In-Reply-To: <20251215150323.2218608-4-kevin.brodsky@arm.com>
Date: Tue, 16 Dec 2025 10:44:45 +0530
Message-ID: <87345b6m9m.ritesh.list@gmail.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com> <20251215150323.2218608-4-kevin.brodsky@arm.com>
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
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
>
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter. The
> radix_enabled() check is required in both as
> arch_flush_lazy_mmu_mode() will be called directly from the generic
> layer in a subsequent patch.
>
> Note: the additional this_cpu_ptr() and radix_enabled() calls on the
> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
> patch.
>
> Acked-by: David Hildenbrand <david@redhat.com>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Sorry I was away for a while. 

Thanks for taking care of the radix path as we had discussed previously
here [1]. 

[1]: https://lore.kernel.org/all/87jz044xn4.ritesh.list@gmail.com/

The change looks good to me. So, please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

