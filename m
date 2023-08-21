Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8378310E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 21:50:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RZl6OjBi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV33w5Ql7z30hh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 05:50:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RZl6OjBi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ackerleytng.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3sr_jzaskdo0prztgatnicvvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--ackerleytng.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV32b23z5z3bv9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 05:49:10 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d7493303b5cso2308895276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692647347; x=1693252147;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJZGEQtf1VL3HQEXak5eCjnl1mSbYK2LpINf2Y7mWuc=;
        b=RZl6OjBiLyxrlN7m8yUzSzxx4s8l6y5XQtCqoL2DKa9CznCEyAG8OEzPqxiGWWfNJU
         DP58nwM09rHRg7Se9vncvUgBs+EoatdB0oIHiYis/CY/mK8bpz5tBW/wF/N/V/N/8FcH
         u/rMp5FZpxMI+ASR8w8FwZSKb5yUKy8z1UKPp14XAoTBk3vwb+9KvbuE4eIugJspN8RX
         snR6LHbvF/g0TCDHMTgr7kn44jTj6A+c9BdOOfnITVAKCoxj2XXqVMiBuH5zs1EhWFJ1
         LASBEZFLbEqzA+6VnHUNymrGUBh6X+GLDf47Xj3E2vNSql4sDsL+0xZSb2rnh4OE9Sf8
         LLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692647347; x=1693252147;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJZGEQtf1VL3HQEXak5eCjnl1mSbYK2LpINf2Y7mWuc=;
        b=O3egJ4D0cvipy6+JqfzzMKWmAnx/d3Tbkd0FD0sSBiyODsIEut+V5AxmOk52MkKSSV
         GtHpz3lqDdsXXSNA0hSq/c20cshrJ7HzYxI+kzrAGnNPph9Q93HBrCRRzUFE+p9P7UlF
         Fb/BXhUNjFBevg67FyIdjIg46OkI90UK6YzitWidkQAUdayRZ9uABhVwVKLJEoH7xiDo
         FCMreaj+byWDRTi8DIMMT6fNfHak/LGyU2ymY8Zg6wbovbsTca+vrLnad4gTczCccr+j
         2VRClqkRHk7qj/G82Fl0FTlyUnYKerIXoPrkd1BcDZ9+lD96Wn/De21fc+qxyx7lO7+t
         n7mw==
X-Gm-Message-State: AOJu0YxT85Olc7a28Gh1vyzyAX/ivZVFxnGMUlRm31PqH9qGo2h0jKGe
	m2LVIN/YDTGVAhUgNsaGT8GwX5DAWZv4kQ6yJw==
X-Google-Smtp-Source: AGHT+IHM9bfoMlIQRP0Zhx06e/5qWh61CmNcgWIzhDyB//MY5jBFnNMVKsg1bGSAIpor6rGkYRANDK9cShM4uv9gKA==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a25:fc0d:0:b0:d07:e80c:412e with SMTP
 id v13-20020a25fc0d000000b00d07e80c412emr56346ybd.12.1692647346791; Mon, 21
 Aug 2023 12:49:06 -0700 (PDT)
Date: Mon, 21 Aug 2023 19:49:05 +0000
In-Reply-To: <ZN/4RjDsBLf0FB98@google.com> (message from Sean Christopherson
 on Fri, 18 Aug 2023 16:01:26 -0700)
Mime-Version: 1.0
Message-ID: <diqzwmxotbv2.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Aug 07, 2023, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> 
>> > Add a selftest to verify the basic functionality of guest_memfd():
>> >
>> > <snip>
>> 
>> Here's one more test:
>
> First off, thank you!  I greatly appreciate all the selftests work you (and
> others!) have been doing.
>
> For v2, can you please post a standalone patch?  My workflow barfs on unrelated,
> inlined patches.  I'm guessing I can get b4 to play nice, but it's easier to just
> yell at people :-)
>

Here's a standalone patch :)
https://lore.kernel.org/lkml/20230821194411.2165757-1-ackerleytng@google.com/

> <snip>
