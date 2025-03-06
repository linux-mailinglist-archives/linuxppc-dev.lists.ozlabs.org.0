Return-Path: <linuxppc-dev+bounces-6785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2625CA55987
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 23:17:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z83hN3L5jz3c7S;
	Fri,  7 Mar 2025 09:17:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741299476;
	cv=none; b=Z7z5Tupi8Sy5WFYVajGGjvOKJ2agUBmFh0Lmt1Lzw8K3JGz5n/HmjRWPNFvPJRvJF4tc0YkNOZc1NIWtTP5Bv9+FpT3mt8bhyK4/wgBZgTgP8Xq8H71hDPO/AcUQYcdpYlnrEGxdrneZswvJQeVC4SygHyIAU2yyZ0+y2ErMkdbj52UDO3DrDdc8Y6X4iUmDsk88U+7h1hh6jeoKr0ZmWB6wMyAsOLd1xeSC4HVI1hCIuaXRfZTdqdwdi2W8snPkFDTyPX2HT1c8mySX4RFLA1UT8WRFQ3L0yqIfVgkRWIawuPzdfrZE63dubrBXc9XTnIKGeXYgURgy18LErdK6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741299476; c=relaxed/relaxed;
	bh=1fVM2KE3EoOsuu2EWcqC1HC9DuBoPNNqkucuTCqqHCw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fDDSK8b3n3eQ4onlHxurKdbwLXvG81oI38dhlDO+a+iu1W8VCdVxRBCbRm0tqlCPyZlFlOhchxGwbX9EENoaURnXSSPbhrddnO+pEhvLYbUjc7Yn+spkuWkfu7P6pI6z48BWmbxLWf2IxxVA09hXuOjxsg1cZG2nIxPnZ+Wab6625w8NpteSYxf7oFv19Bp30Z90j1RaShentImsiNH0+bfvLqrOCEE7I2COJK4L1gRzqi9/e1MTd/H94feKa9a9pQEs9WRYl8/siKAnpXFx8Ic7O1XKoLtar6evHTlLCU3bGYu4V8HamtGsYYnbjljYBQwu+BDHigwepYo8HVfDWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Vmvkzw1/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3dx_kzwykdloxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Vmvkzw1/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3dx_kzwykdloxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z83hM0wDnz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 09:17:54 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-223d86b4df0so33348315ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Mar 2025 14:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741299472; x=1741904272; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1fVM2KE3EoOsuu2EWcqC1HC9DuBoPNNqkucuTCqqHCw=;
        b=Vmvkzw1/wrAtKXhUdtEJM4kQFwAO8TpACTWa2UEMlo/LvKuLFypbFwR0sHWTsgARry
         5BPztWGziRlLRWpJZjAq2NOV/vTBxYalowomSWo9N32h0SXuVx4VMCCiGRClKw5TxjJ+
         rmo7nxSuIoNk7Goz+k7JgASn1EQzj4h5aoQ7Qtrs6tbHNefdt59R4zQbeQ4JRH1xQHTf
         mHYCchKhfkfnbq4wqIlZz8r2ZsFgFQT+3zRt1mT2F0eO82GFmiyLYgyobPF+88Xy1blb
         9GmdcNmHzn/Dfh4RPnuqMwh3TiTQImKJC9z7oOOovYN8bI2Qklt5TUHtRJN3i8UzRcd5
         4BnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741299472; x=1741904272;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fVM2KE3EoOsuu2EWcqC1HC9DuBoPNNqkucuTCqqHCw=;
        b=cIoefUGPpWlUpcEi+2j6K59pzSoiGG/XosUr6zwW6ncKkILXdKBu1M2Dm9/IYKIq5/
         8+WUMmISU76kxdE6fTH7DYd6uSxN+TyVFjHhoByH0IkH6PdzKgsNpG62H2vXTZFE3y9F
         fVGv6usizQobYyLUd2uIcmaLIdFv+te1mbzbCX8OmMUaUVhkiOrjuR95qAqSPmQTlKPN
         Nm1ZzJ0RUki+HKIIIoU/sCYDvfGO4lfi0Clf86RfX2hpO7mgXjG7Rl7oI95fhLgOWY8O
         DnMwSC31ECTGIsrmggRUdnGN96KBsSjHUjLFAc4/qwRTvIyfnk3IgtH4om3T6vR+/o+b
         UcCA==
X-Forwarded-Encrypted: i=1; AJvYcCUYcaMkBpZPLNGbs8emjZMN5bi6xdGA35AbSp49cDZkH9Pbc4yFMBN1yuJeRDVDKtbQfVQWWYR/jSE6Crk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyx4N/jB+RAQyG+Ad0pVcAPhrF5K6sP6354mDo8qwbDO866B/Zi
	cXW+0JW7vOE+QUGg9upT08qhMc/x52r2Sd2rGtLoTphXqFqcscghQKx9RumyVLCiKj++n3KZfik
	REA==
X-Google-Smtp-Source: AGHT+IHj9hf+RSGnxoRCsNAWfapX74dbG0cv1fVCIplmAgCoqTHkKkEEOlwzNxPnN2S64GQaJbv4Oc/F+lY=
X-Received: from pfjg21.prod.google.com ([2002:a05:6a00:b95:b0:736:415f:3d45])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b4a:b0:736:a8db:93b8
 with SMTP id d2e1a72fcca58-736aa9b3970mr1923671b3a.3.1741299471981; Thu, 06
 Mar 2025 14:17:51 -0800 (PST)
Date: Thu, 6 Mar 2025 14:17:50 -0800
In-Reply-To: <a10378eb-4bff-488c-86f7-b4fec20feb6a@redhat.com>
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
Mime-Version: 1.0
References: <20250222014526.2302653-1-seanjc@google.com> <a10378eb-4bff-488c-86f7-b4fec20feb6a@redhat.com>
Message-ID: <Z8ofDmVbhjfLVwQD@google.com>
Subject: Re: [RFC kvm-unit-tests PATCH] lib: Use __ASSEMBLER__ instead of __ASSEMBLY__
From: Sean Christopherson <seanjc@google.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, Laurent Vivier <lvivier@redhat.com>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 06, 2025, Thomas Huth wrote:
> On 22/02/2025 02.45, Sean Christopherson wrote:
> > Convert all non-x86 #ifdefs from __ASSEMBLY__ to __ASSEMBLER__, and remove
> > all manual __ASSEMBLY__ #defines.  __ASSEMBLY_ was inherited blindly from
> > the Linux kernel, and must be manually defined, e.g. through build rules
> > or with the aforementioned explicit #defines in assembly code.
> > 
> > __ASSEMBLER__ on the other hand is automatically defined by the compiler
> > when preprocessing assembly, i.e. doesn't require manually #defines for
> > the code to function correctly.
> > 
> > Ignore x86, as x86 doesn't actually rely on __ASSEMBLY__ at the moment,
> > and is undergoing a parallel cleanup.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> > 
> > Completely untested.  This is essentially a "rage" patch after spending
> > way, way too much time trying to understand why I couldn't include some
> > __ASSEMBLY__ protected headers in x86 assembly files.
> 
> Thanks, applied (after fixing the spot that Andrew mentioned and another one
> that has been merged in between)!
> 
> BTW, do you happen to know why the kernel uses __ASSEMBLY__ and not
> __ASSEMBLER__? Just grown historically, or is there a real reason?

AFAICT, it's purely historical.

