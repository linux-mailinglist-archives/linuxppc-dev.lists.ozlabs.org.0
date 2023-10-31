Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 730027DD601
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 19:25:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=i4Kry3Nf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKdpq2rzDz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 05:25:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=i4Kry3Nf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=dmatlack@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKdnv550Lz2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 05:24:18 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc329ce84cso31059875ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698776653; x=1699381453; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fA4BSuC8POmGjMQJ0k8vnna5BPAxY9Ekm8SCU7EDDBY=;
        b=i4Kry3NfAk1Lwqk9uJJcrwP5VQ1fkophVEf/Oq+z66NGNQZvS/B/zBG6VW7zCtUog4
         mIaPRa2sSgXX0ZOTXpakFrgpCZxM0dQJlvFfksEbRbJjA7b7QLZG6Wn+oX+xsqBZ27Js
         4rZSsEWD3DBZ2SuJhRrpuHg3sFjkHsbhLn0RS5nDeeCiQgu+DYE7GUtti83kZbqKCrun
         Ejh5qOcx3jJw7ZuX6GvQBtz9L+J5w8m34M5Euxn3LzxS0rYeYPLZzw5KdNKti9vxrUde
         bMLgHea0EIHACNEtRi6oeaNxEli/8CfxvI7cQWBm8+DV/vChwg3m+mH491AeUU5R94mY
         qBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698776653; x=1699381453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fA4BSuC8POmGjMQJ0k8vnna5BPAxY9Ekm8SCU7EDDBY=;
        b=QNB27aGwPLkldskMIiX0Ek9KeiWkWoz4waM3TlZbgZsCl6Kv5JNeM/wHcStVGKgbQG
         lwV4LJJ8stp2lL+87Grnj17STfhyilyxyGxfFCi4kZGRCho3BKisvyAXm5lhfRQQVJeu
         qo0lZDZfLM1hxw6kcM15ZbZ+HjgrceEObm93eNDKv/HlUoYxMpp0unaEau02mEeVkFMN
         WjtaUxCVmACPOAgPuCYGHtZ8WN29o4Sj254dnidVN88U6g9k5/gZq/hCtSEGue6VU/05
         aOUSjxua83ibf//iI8YEpx272owoKOfyzhg/GjuBJ8THF2DgLgBcVZKl/OgDFTQqbsKS
         fFVg==
X-Gm-Message-State: AOJu0YxOLDQ+FEqUPWlUs0JulWIqpvw8sGYOWBQ4fsj8c8nteg2FGAC4
	1ppIgf5gep4JmkKFiIRThVqhYg==
X-Google-Smtp-Source: AGHT+IFxkiDdZGGfHsdazjXYZcfW0cI1Huw/6T3VggKB9s0vUh/sA7Jolgtag5oCOtU2pTLnT1L5FA==
X-Received: by 2002:a17:902:ecca:b0:1cc:54b5:b4fa with SMTP id a10-20020a170902ecca00b001cc54b5b4famr5681643plh.18.1698776652868;
        Tue, 31 Oct 2023 11:24:12 -0700 (PDT)
Received: from google.com (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c20d00b001c5dea67c26sm1620267pll.233.2023.10.31.11.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 11:24:11 -0700 (PDT)
Date: Tue, 31 Oct 2023 11:24:07 -0700
From: David Matlack <dmatlack@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
Message-ID: <ZUFGRyQEuWj4RJS0@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-17-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Li
 am Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> Introduce an ioctl(), KVM_CREATE_GUEST_MEMFD, to allow creating file-based
> memory that is tied to a specific KVM virtual machine and whose primary
> purpose is to serve guest memory.
> 
> A guest-first memory subsystem allows for optimizations and enhancements
> that are kludgy or outright infeasible to implement/support in a generic
> memory subsystem.  With guest_memfd, guest protections and mapping sizes
> are fully decoupled from host userspace mappings.   E.g. KVM currently
> doesn't support mapping memory as writable in the guest without it also
> being writable in host userspace, as KVM's ABI uses VMA protections to
> define the allow guest protection.  Userspace can fudge this by
> establishing two mappings, a writable mapping for the guest and readable
> one for itself, but that’s suboptimal on multiple fronts.
> 
> Similarly, KVM currently requires the guest mapping size to be a strict
> subset of the host userspace mapping size, e.g. KVM doesn’t support
> creating a 1GiB guest mapping unless userspace also has a 1GiB guest
> mapping.  Decoupling the mappings sizes would allow userspace to precisely
> map only what is needed without impacting guest performance, e.g. to
> harden against unintentional accesses to guest memory.
> 
> Decoupling guest and userspace mappings may also allow for a cleaner
> alternative to high-granularity mappings for HugeTLB, which has reached a
> bit of an impasse and is unlikely to ever be merged.
> 
> A guest-first memory subsystem also provides clearer line of sight to
> things like a dedicated memory pool (for slice-of-hardware VMs) and
> elimination of "struct page" (for offload setups where userspace _never_
> needs to mmap() guest memory).

All of these use-cases involve using guest_memfd for shared pages, but
this entire series sets up KVM to only use guest_memfd for private
pages.

For example, the per-page attributes are a property of a KVM VM, not the
underlying guest_memfd. So that implies we will need separate
guest_memfds for private and shared pages. But a given memslot can have
a mix of private and shared pages. So that implies a memslot will need
to support 2 guest_memfds? But the UAPI only allows 1 and uses the HVA
for shared mappings.

My initial reaction after reading through this series is that the
per-page private/shared should be a property of the guest_memfd, not the
VM. Maybe it would even be cleaner in the long-run to make all memory
attributes a property of the guest_memfd. That way we can scope the
support to only guest_memfds and not have to worry about making per-page
attributes work with "legacy" HVA-based memslots.

Maybe can you sketch out how you see this proposal being extensible to
using guest_memfd for shared mappings?
