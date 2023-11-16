Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 957AD7EE89B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 22:01:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HSanfYpl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWXWk3czwz3dH2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 08:01:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HSanfYpl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ackerleytng.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=36ijwzqskdhkxzhboibvqkddlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--ackerleytng.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWXVn3gMzz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 08:00:31 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a828bdcfbaso19435497b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 13:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700168424; x=1700773224; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcg1jHOi88FLN7hCqkcZwcR8zkGGhGMDTBufXRqyOok=;
        b=HSanfYplgogQX3mTVAH33kEJzVBVySwYQfEP7zgxDT1hlBEApCVYZn0sleMLCFsjw/
         jRZEanIlYfcodf6dqibumq6R2hkCc+4QZ7Jj86KNDqZ1ofTSIU0IE32hLR8YAEsUP01k
         lM+L5FFPgRPQby3038WxWd5GQW6/aAQ1bbOpsRcISF2ITIIOLFUqvocOLv5v3XhPrNzu
         FUbRhE28g4ZR8CymOQ/EJaqaOUrt7HfGhXQ6zuf0FZCAH+2KsmIc7373ImkmDCTXBWfM
         uuFbHWdvW7RM39RjmicLub2y6u918mUHbdcWjnBgcYichhCapwY5pq8Xe2fkZp5+GRGH
         uXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700168424; x=1700773224;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcg1jHOi88FLN7hCqkcZwcR8zkGGhGMDTBufXRqyOok=;
        b=k4aI1gd2xstZmq6eHAD98NH5T5Rja7LHdaKG8xpLZCrMhOBcw3iWm8ZZqlh5p6m/+R
         WJtFtLK6xQ02d4WpwAMv/qz5QVOdFFJb7C0YGyDurKtYC3/EfgEQhu1dKzkxhsPx+YkM
         ozFGv7eAcvAyDtJ8k9bzaSpT2/vPriTv94SZT6sKRS/+XrQlIVaTBg3BcVuh1xcAvXgt
         jloznWDwK+vETLACII4/x6ErA99df/Eblj7sTdmhqUNcFuA7zAkV2WivYTIOtF4clPkU
         Z1GBweE5fnhQxG18IKLCAO47QCBNyAWG72uPjeC9WOWuX1DlwLcSl1GKsJSm7x7+oZNf
         mc4A==
X-Gm-Message-State: AOJu0YwhjgaPxkyOsvTM3JDS+VHS9b3HeSNFcvxfNubQcefF+p1hXRlh
	Y1QXt0+nJGbTkB7vK2TUQrm1n3blnhkOdGCEpg==
X-Google-Smtp-Source: AGHT+IERExc4D+qrt27go/xYBPrtoAORZdvfQFtSO07pMqMqSuTLQB8wBOPMZT1riqPUGW5/Jxx9EA2kvlBTv30QyA==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a25:7644:0:b0:da3:a4ae:1525 with SMTP
 id r65-20020a257644000000b00da3a4ae1525mr393167ybc.5.1700168424573; Thu, 16
 Nov 2023 13:00:24 -0800 (PST)
Date: Thu, 16 Nov 2023 21:00:22 +0000
In-Reply-To: <20231105163040.14904-33-pbonzini@redhat.com> (message from Paolo
 Bonzini on Sun,  5 Nov 2023 17:30:35 +0100)
Mime-Version: 1.0
Message-ID: <diqzfs15o1ll.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH 32/34] KVM: selftests: Add basic selftest for guest_memfd()
From: Ackerley Tng <ackerleytng@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, david@redhat.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, maz@kernel.org, chenhuacai@kernel.org, xiaoyao.li@intel.com, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, yu.c.zhang@linux.intel.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, viro@zeniv.linux.org.uk, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, mic@digikod.net, isaku.yamahata@intel.com, brauner@kernel.org, qperret@google.com, seanjc@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, dmatlack@google.com, jarkko@kernel.org, palmer@dabbelt.com, kirill.shutemov@linux.intel.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, yilun.xu
 @intel.com, amoorthy@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> <snip>
>
> +static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
> +{
> +	size_t page_size = getpagesize();
> +	uint64_t flag;
> +	size_t size;
> +	int fd;
> +
> +	for (size = 1; size < page_size; size++) {
> +		fd = __vm_create_guest_memfd(vm, size, 0);
> +		TEST_ASSERT(fd == -1 && errno == EINVAL,
> +			    "guest_memfd() with non-page-aligned page size '0x%lx' should fail with EINVAL",
> +			    size);
> +	}
> +
> +	for (flag = 1; flag; flag <<= 1) {

Since transparent hugepage support is no longer officially part of this
series, 

> +		uint64_t bit;

this declaration of bit can be removed.

> +
> +		fd = __vm_create_guest_memfd(vm, page_size, flag);
> +		TEST_ASSERT(fd == -1 && errno == EINVAL,
> +			    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
> +			    flag);
> +

This loop can also be removed,

> +		for_each_set_bit(bit, &valid_flags, 64) {
> +			fd = __vm_create_guest_memfd(vm, page_size, flag | BIT_ULL(bit));
> +			TEST_ASSERT(fd == -1 && errno == EINVAL,
> +				    "guest_memfd() with flags '0x%llx' should fail with EINVAL",
> +				    flag | BIT_ULL(bit));
> +		}

otherwise this won't compile because valid_flags is not declared.

These lines will have to be added back when adding transparent hugepage
support.

> +	}
> +}

Tested-by: Ackerley Tng <ackerleytng@google.com>
