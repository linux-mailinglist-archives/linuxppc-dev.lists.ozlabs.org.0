Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F4372EEE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 00:09:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Js6q8+xF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Js6q8+xF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgjQT6Wjrz30gr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 08:09:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Js6q8+xF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Js6q8+xF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Tue, 13 Jun 2023 22:28:12 AEST
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgSWc74NGz2xq3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 22:28:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686659290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x4X42epITHEmHx9Rdq7WZvtJt4reSEJsGpXTx4uakPs=;
	b=Js6q8+xFWhfup7yzBkqE2tMJhA8I1NXIAnnb9N6UlvhktCEM0/Z03UagXiTFX6t/E7c/vY
	R63BmRwIDzYR7xediA00s49i8xseh+HySzWZP1iJMoznbQOsQBKp5lG/trpb2cLVhEyYzo
	JkpRKwBXmpHFkJDJG7svaxqB4Di4q6I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686659290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x4X42epITHEmHx9Rdq7WZvtJt4reSEJsGpXTx4uakPs=;
	b=Js6q8+xFWhfup7yzBkqE2tMJhA8I1NXIAnnb9N6UlvhktCEM0/Z03UagXiTFX6t/E7c/vY
	R63BmRwIDzYR7xediA00s49i8xseh+HySzWZP1iJMoznbQOsQBKp5lG/trpb2cLVhEyYzo
	JkpRKwBXmpHFkJDJG7svaxqB4Di4q6I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-ved2DD4INoGnJ_VlrxoT-g-1; Tue, 13 Jun 2023 08:26:58 -0400
X-MC-Unique: ved2DD4INoGnJ_VlrxoT-g-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30fc67636a2so779582f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 05:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686659217; x=1689251217;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4X42epITHEmHx9Rdq7WZvtJt4reSEJsGpXTx4uakPs=;
        b=YUphOTshNYwTCty3ACwH4VOTB3sEGmuCqdtJiHgK/45jEx/Kagr91g4e0TbdNTrx77
         zvGfFt3j1tBKhTOF3KlZ5bwx2Y9CRkA1a+FX2IMcf3CE0Dlws17PhkFoi1RJYfHqJVxs
         xPmLKDQcqvFTyMT9lec5odZj8knkux4DX/jT1HuS1xJ0csoj099JjysmKuJi22Tai2BN
         lDoArRFQOsYzmh8V9RWKRPCRTtS5r1Aiu2EBempqO3QREFCODdzExy70f3PzggE6azS6
         qX2xJ5/UkgbgtWN4fQ6lAW/vYml2qdV1N3MKl4aRilTQHBCM/9da2lPHI55p00r8JouD
         UZVQ==
X-Gm-Message-State: AC+VfDzXE4dClhRRmv9I2BLc9ycGmeoEkEAhcfgU9RlP6UJGnpV+WnUp
	j+G50nGs71ibsVR6HTN1dXOWdQOqO6114/xu9Fv6GvjVB/7J9Qx1/xb88DCO6NdIFGNxOINW6Ey
	nyU18Miu/HpRHeVurc/v9H7guyw==
X-Received: by 2002:a5d:6acd:0:b0:30f:b7b4:3e55 with SMTP id u13-20020a5d6acd000000b0030fb7b43e55mr6371741wrw.19.1686659216770;
        Tue, 13 Jun 2023 05:26:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4yteTIZOrnVCopzRkUBsfyPnfoDVYPpW9xv2sO4EBsmO+rg3naLzU0Pz+CwjSuscU8Zw+bFQ==
X-Received: by 2002:a5d:6acd:0:b0:30f:b7b4:3e55 with SMTP id u13-20020a5d6acd000000b0030fb7b43e55mr6371694wrw.19.1686659216382;
        Tue, 13 Jun 2023 05:26:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c710:ff00:1a06:80f:733a:e8c6? (p200300cbc710ff001a06080f733ae8c6.dip0.t-ipconnect.de. [2003:cb:c710:ff00:1a06:80f:733a:e8c6])
        by smtp.gmail.com with ESMTPSA id i1-20020adff301000000b002f28de9f73bsm15275419wro.55.2023.06.13.05.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 05:26:55 -0700 (PDT)
Message-ID: <497e571e-e4de-7634-7da6-683599a4bbba@redhat.com>
Date: Tue, 13 Jun 2023 14:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v9 01/42] mm: Rename arch pte_mkwrite()'s to
 pte_mkwrite_novma()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Andy Lutomirski <luto@kernel.org>, Balbir Singh <bsingharora@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Cyrill Gorcunov <gorcunov@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Eugene Syromiatnikov <esyr@redhat.com>, Florian Weimer <fweimer@redhat.com>,
 "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, Nadav Amit <nadav.amit@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 Weijiang Yang <weijiang.yang@intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 John Allen <john.allen@amd.com>, kcc@google.com, eranian@google.com,
 rppt@kernel.org, jamorris@linux.microsoft.com, dethoma@microsoft.com,
 akpm@linux-foundation.org, Andrew.Cooper3@citrix.com,
 christina.schimpe@intel.com, debug@rivosinc.com, szabolcs.nagy@arm.com,
 torvalds@linux-foundation.org, broonie@kernel.org
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
 <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 14 Jun 2023 08:08:01 +1000
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
Cc: linux-s390@vger.kernel.org, Michal Simek <monstr@monstr.eu>, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Linus Torvalds <torvalds@linuxfoundation.org>, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13.06.23 02:10, Rick Edgecombe wrote:
> The x86 Shadow stack feature includes a new type of memory called shadow
> stack. This shadow stack memory has some unusual properties, which requires
> some core mm changes to function properly.
> 
> One of these unusual properties is that shadow stack memory is writable,
> but only in limited ways. These limits are applied via a specific PTE
> bit combination. Nevertheless, the memory is writable, and core mm code
> will need to apply the writable permissions in the typical paths that
> call pte_mkwrite(). Future patches will make pte_mkwrite() take a VMA, so
> that the x86 implementation of it can know whether to create regular
> writable memory or shadow stack memory.
> 
> But there are a couple of challenges to this. Modifying the signatures of
> each arch pte_mkwrite() implementation would be error prone because some
> are generated with macros and would need to be re-implemented. Also, some
> pte_mkwrite() callers operate on kernel memory without a VMA.
> 
> So this can be done in a three step process. First pte_mkwrite() can be
> renamed to pte_mkwrite_novma() in each arch, with a generic pte_mkwrite()
> added that just calls pte_mkwrite_novma(). Next callers without a VMA can
> be moved to pte_mkwrite_novma(). And lastly, pte_mkwrite() and all callers
> can be changed to take/pass a VMA.
> 
> Start the process by renaming pte_mkwrite() to pte_mkwrite_novma() and
> adding the pte_mkwrite() wrapper in linux/pgtable.h. Apply the same
> pattern for pmd_mkwrite(). Since not all archs have a pmd_mkwrite_novma(),
> create a new arch config HAS_HUGE_PAGE that can be used to tell if
> pmd_mkwrite() should be defined. Otherwise in the !HAS_HUGE_PAGE cases the
> compiler would not be able to find pmd_mkwrite_novma().
> 
> No functional change.
> 
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: openrisc@lists.librecores.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
> Suggested-by: Linus Torvalds <torvalds@linuxfoundation.org>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Link: https://lore.kernel.org/lkml/CAHk-=wiZjSu7c9sFYZb3q04108stgHff2wfbokGCCgW7riz+8Q@mail.gmail.com/
> ---
> Hi Non-x86 Arch’s,
> 
> x86 has a feature that allows for the creation of a special type of
> writable memory (shadow stack) that is only writable in limited specific
> ways. Previously, changes were proposed to core MM code to teach it to
> decide when to create normally writable memory or the special shadow stack
> writable memory, but David Hildenbrand suggested[0] to change
> pXX_mkwrite() to take a VMA, so awareness of shadow stack memory can be
> moved into x86 code. Later Linus suggested a less error-prone way[1] to go
> about this after the first attempt had a bug.
> 
> Since pXX_mkwrite() is defined in every arch, it requires some tree-wide
> changes. So that is why you are seeing some patches out of a big x86
> series pop up in your arch mailing list. There is no functional change.
> After this refactor, the shadow stack series goes on to use the arch
> helpers to push arch memory details inside arch/x86 and other arch's
> with upcoming shadow stack features.
> 
> Testing was just 0-day build testing.
> 
> Hopefully that is enough context. Thanks!
> 
> [0] https://lore.kernel.org/lkml/0e29a2d0-08d8-bcd6-ff26-4bea0e4037b0@redhat.com/
> [1] https://lore.kernel.org/lkml/CAHk-=wiZjSu7c9sFYZb3q04108stgHff2wfbokGCCgW7riz+8Q@mail.gmail.com/
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

