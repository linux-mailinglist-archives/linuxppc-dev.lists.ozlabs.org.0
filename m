Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 769C28B24BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 17:10:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yHAmU/QT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQK6h11j8z3dSx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 01:10:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yHAmU/QT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3pniqzgykdauxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQK5v25q6z3dS0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 01:09:53 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61b330409b7so20987977b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 08:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714057791; x=1714662591; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m1qzGW4ycfJBkwOtQag42BpB9F1dgLw6AsC1TpSQ/BE=;
        b=yHAmU/QTwL4cCg7a0CbiadBOuHDP0nh8RHf1TBcSAqLUadHlvowfkm4kS5AwhAF+iq
         GoJlRpi1WaPMjDwHSzNN+h2w/fTA5eYNVe93lDkIFo8IuyveLkKVNsyze1aeNZgRM6rr
         4XMledZ4cAKT8hAl0ZVO6xAeW5yNsFoGHN3OjI8iYrRAagt1Ql4Y3+BhO+3rkAnp+NwJ
         a8amLQQtBYNkY2Z2eIW4StfWEP7avSHqzQc65mjrkJvU4aNVoWJI1XMB5NBnhiHaOwXA
         O0fdskO935JRl1fpSXtW1hw6qmSMvIZcib5sbXAu1Jh2O1szIq6sLJ9tG94y4FldCNY3
         hkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714057791; x=1714662591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1qzGW4ycfJBkwOtQag42BpB9F1dgLw6AsC1TpSQ/BE=;
        b=FrJ9yDcBpY30FHNek1kmoLee1jlTgZFRHwy6fA91wiGs5nFZHpuu0nBJsA0J9m6pfV
         Nsjcq9Hf/lpy0VjAo9WsL0nTS0iBF+W/sP7cGKMJhKXijL+xqZjOvi+rcNHXXqt9O5TU
         y0W1k6EunFJ/jGJY3HFvm7YrpS46zZtFzJ0lOGIE3D+t3441za4tLZILgpfvs0Wj2r99
         98pH7+DvfSYp1TF8uzOd9wSP4bC2jcjc1Yr4vspAj+PYl/6rRERZycubjdNrvKfq+7PT
         IdNTN32HC3oUyEorUTAwJxJFJif1QIKqrE92IH2ucjCdqszVFHFpH9eja9CyA8hMlqpI
         AtaA==
X-Forwarded-Encrypted: i=1; AJvYcCXYXuRxQYbRBDETkxZiztyR0bjSLx6k2WoYpXQQgq3FM/eLhtgyYfhSWIIWzrDMUT2qqiUw29TPcYA1oYvC8qWvmsdN8NiOrK5tP7RUiQ==
X-Gm-Message-State: AOJu0Yx+fwqHIXB5z69DDHWY8FqNy7H7N3Mq2HzgpKvrhKEMI5NNRXRg
	3g1FxDl+nR90IBScOFbB4OFaz8rszwTAhuo63m79K7UawGOfcZYVCh5Cj4KyNnhMZor3tn+QqEO
	upw==
X-Google-Smtp-Source: AGHT+IESJpACVh541xxXAQ9OLoBU3w6/mlBcJ1Y0e41i9MN7u+mraz/pMXzsHrFUz1aVf7/+mBldg/ztHFs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:698a:0:b0:de4:c2d4:e14f with SMTP id
 e132-20020a25698a000000b00de4c2d4e14fmr1617703ybc.11.1714057790783; Thu, 25
 Apr 2024 08:09:50 -0700 (PDT)
Date: Thu, 25 Apr 2024 08:09:49 -0700
In-Reply-To: <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-26-seanjc@google.com>
 <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain> <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
Message-ID: <ZipyPYR8Nv_usoU4@google.com>
Subject: Re: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to KVM_SET_USER_MEMORY_REGION2
From: Sean Christopherson <seanjc@google.com>
To: Shuah Khan <skhan@linuxfoundation.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, Benjamin Copeland <ben.copeland@linaro.org>, Marc Zyngier <maz@kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Isaku Yamahata <isaku.yamahata@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-k
 ernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 25, 2024, Shuah Khan wrote:
> On 4/25/24 08:12, Dan Carpenter wrote:
> > On Fri, Oct 27, 2023 at 11:22:07AM -0700, Sean Christopherson wrote:
> > > Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so that
> > > support for guest private memory can be added without needing an entirely
> > > separate set of helpers.
> > > 
> > > Note, this obviously makes selftests backwards-incompatible with older KVM
> >    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > versions from this point forward.
> >    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > Is there a way we could disable the tests on older kernels instead of
> > making them fail?  Check uname or something?  There is probably a
> > standard way to do this...  It's these tests which fail.
> 
> They shouldn't fail - the tests should be skipped on older kernels.

Ah, that makes sense.  Except for a few outliers that aren't all that interesting,
all KVM selftests create memslots, so I'm tempted to just make it a hard requirement
to spare us headache, e.g.

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b2262b5fad9e..4b2038b1f11f 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2306,6 +2306,9 @@ void __attribute((constructor)) kvm_selftest_init(void)
        /* Tell stdout not to buffer its content. */
        setbuf(stdout, NULL);
 
+       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
+                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
+
        kvm_selftest_arch_init();
 }

--

but it's also easy enough to be more precise and skip only those that actually
create memslots.

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b2262b5fad9e..b21152adf448 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -944,6 +944,9 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flag
                .guest_memfd_offset = guest_memfd_offset,
        };
 
+       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
+                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
+
        return ioctl(vm->fd, KVM_SET_USER_MEMORY_REGION2, &region);
 }
 
@@ -970,6 +973,9 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
        size_t mem_size = npages * vm->page_size;
        size_t alignment;
 
+       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
+                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
+
        TEST_ASSERT(vm_adjust_num_guest_pages(vm->mode, npages) == npages,
                "Number of guest pages is not compatible with the host. "
                "Try npages=%d", vm_adjust_num_guest_pages(vm->mode, npages));
--
