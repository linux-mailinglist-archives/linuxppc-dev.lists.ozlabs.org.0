Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F0B942135
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 22:01:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tfsz3TE/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYR234nSTz2y66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 06:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tfsz3TE/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3c0apzgykdoaugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYR1N1cQTz3cVW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 06:00:54 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-79d95667cfaso5086162a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 13:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722369651; x=1722974451; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1b0dd+u4QtRKmjCQ1fWaclUboiBOp5PBFZF+RqiWy8=;
        b=tfsz3TE/3RkdFu7X8JhgFbe848NXCV9lDBkc2uVNjS6QdaxbuRbhLnMKNoQ1j8vOds
         wpuml2qY+jZF/TtyXZRC41o7dTVSSQNQXYOnKmmRmAcoEOsGhhhnHOh0NQNjEkCxkyiv
         koPE6pD+n9qhO4t31zH7qRAg0hrWHNoQRjuBJLdXpLPY2ehVhwlP28ro2WQqaWh0lKBC
         7P6nhVeihR5DHYnofWU23W0zZWnoWrd6UjeDRCmrBLeV1i0pTrcszbtG+hxCqyEK9hHg
         WYcHFv8QwdRcQTo0loJgKkZp5E1NvLbqBMKHYzeZDCxBQcQRC7Ao/OrdJBX3b7bINndT
         zBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722369651; x=1722974451;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1b0dd+u4QtRKmjCQ1fWaclUboiBOp5PBFZF+RqiWy8=;
        b=KQ51mM3G3RMRAxFtQ5ax2k8fdyFL7mPnBZXyPDxYFnzwF5iw6lF/sg1xdjIkKQ84vK
         R3wCjYilFiEvkPn4/sh7WEDSorexq0/ZQw+/sNHuvGdmbHQU46hI8O0vmfE0Mlwy6mII
         0HcZQYGgpZclKzMX2azv+hLnXIyUZ+nipOJnyht68U7shzrXhY44KqoYe6BtSqZdzy3v
         1/BinzBhOK1f9qlM3kYQiTYDdXqOOriepK3LSwNX1RWdLIVHqtAEAdNlnNhR8Czfz4UY
         BSdvOGNnF3Pfwrj7u6HLOZ2weh/k6uDwiqG2cSlgEYKt/ruVg5tg17R1mbgTOKoxYKTo
         Iy/A==
X-Forwarded-Encrypted: i=1; AJvYcCX1Lj8iLOrJK9djmG0UTRUX5bG7plLYja/az0byuU3QhtmISAkIYeVQWNvcmcDnxQstr2VkXNfe284/KDnaPWmGYWdYGvBY2evI2s+aDg==
X-Gm-Message-State: AOJu0Yz+RbfzPIunzNdE923Y1BeIHTYNd7DC/o1Z0kDX42pt3gOBcBGD
	YaCfXW1izjgSpw8dzDEFvLSbcYxcc8gAxGeoppXj14vEjkYNkWFFkwr8THtE0/ea5OC2amwuaY4
	xoA==
X-Google-Smtp-Source: AGHT+IFIpN0t9CwDntyaqKmkPJ5cyx3sfG1IwNUw2ka0n2i9gazwPDbMR7YOpYtas1d8Mj8EPxP4qtxT2wA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:5a3:b0:6bc:b210:c1dd with SMTP id
 41be03b00d2f7-7ac8fd2ec71mr34114a12.8.1722369651264; Tue, 30 Jul 2024
 13:00:51 -0700 (PDT)
Date: Tue, 30 Jul 2024 13:00:49 -0700
In-Reply-To: <2da6b57e-d5c2-4016-b89b-d51700eeb845@redhat.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-46-seanjc@google.com>
 <2da6b57e-d5c2-4016-b89b-d51700eeb845@redhat.com>
Message-ID: <ZqlGcaESdxw5vzl8@google.com>
Subject: Re: [PATCH v12 45/84] KVM: guest_memfd: Provide "struct page" as
 output from kvm_gmem_get_pfn()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:51, Sean Christopherson wrote:
> > Provide the "struct page" associated with a guest_memfd pfn as an output
> > from __kvm_gmem_get_pfn() so that KVM guest page fault handlers can
>        ^^^^^^^^^^^^^^^^^^^^
> 
> Just "kvm_gmem_get_pfn()".
> 
> > directly put the page instead of having to rely on
> > kvm_pfn_to_refcounted_page().
> 
> This will conflict with my series, where I'm introducing
> folio_file_pfn() and using it here:
> > -	page = folio_file_page(folio, index);
> > +	*page = folio_file_page(folio, index);
> > -	*pfn = page_to_pfn(page);
> > +	*pfn = page_to_pfn(*page);
> >   	if (max_order)
> >   		*max_order = 0;
> 
> That said, I think it's better to turn kvm_gmem_get_pfn() into
> kvm_gmem_get_page() here, and pull the page_to_pfn() or page_to_phys()
> to the caller as applicable.  This highlights that the caller always
> gets a refcounted page with guest_memfd.

I have mixed feelings on this.

On one hand, it's silly/confusing to return a pfn+page pair and thus imply that
guest_memfd can return a pfn without a page.

On the other hand, if guest_memfd does ever serve pfns without a struct page,
it could be quite painful to unwind all of the arch arch code we'll accrue that
assumes guest_memfd only ever returns a refcounted page (as evidenced by this
series).

The probability of guest_memfd not having struct page for mapped pfns is likely
very low, but at the same time, providing a pfn+page pair doesn't cost us much.
And if it turns out that not having struct page is nonsensical, deferring the
kvm_gmem_get_pfn() => kvm_gmem_get_page() conversion could be annoying, but highly
unlikely to be painful since it should be 100% mechanical.  Whereas reverting back
to kvm_gmem_get_pfn() if we make the wrong decision now could mean doing surgery
on a pile of arch code.
