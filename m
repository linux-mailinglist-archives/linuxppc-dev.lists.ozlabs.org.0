Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C4D7DBE72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 18:02:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TiBIMGrm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=isPr+gv1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK01Z6zv6z3cTN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 04:02:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TiBIMGrm;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=isPr+gv1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK00g3PLMz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 04:01:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698685279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ySiJbXtvuo/ap347BrtctuG5UsffPvyxiWszBOWPpzU=;
	b=TiBIMGrmPRqllEWCftZ4Qq3VZVIyUvi1o4+6Fh7imMt7BwGGlP8TBUTFF67cEZ7NLNWn4V
	m+4Zr1I47PRMRTeZHpuJhIMCopPzcauK+OawBdRNmVryzyq9uRoaz0R86UxUsGpzQ6XF74
	yAi16/UxKc74yvLNWJvhM88LGaA5oog=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698685280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ySiJbXtvuo/ap347BrtctuG5UsffPvyxiWszBOWPpzU=;
	b=isPr+gv1RvtaHrTLQ9jBCSOrNN8UnqwtYRRDXg28SPT7lwqE0sMSfpeJswyUbwV51ZX7A0
	IoIUg7fNLn5T8YJ6rI7HkZiyNZAKALPDpnIlHu58GapX3NhhtKAeMwtZhatuH1e/9syINF
	bb/eJ77E6+s7D8TkCWsUIx5i+0ACcNI=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-g8uZI-NqMpi4_db8ldKvvw-1; Mon, 30 Oct 2023 13:01:11 -0400
X-MC-Unique: g8uZI-NqMpi4_db8ldKvvw-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1e9a324c12fso6460418fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 10:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698685266; x=1699290066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySiJbXtvuo/ap347BrtctuG5UsffPvyxiWszBOWPpzU=;
        b=Zg+4jwcyiWmG9ITiM8/WpLWcV5AkeHmKypB9+PHwAiPTZdK257u1guVoQmNLAisC/C
         n5k9I1RmB5NWmZTuSvW/MxDjpdEa7KtHe2xIaEU4B/j5849yfm7hkugR+m6fQvJhquCn
         GWILj+/ExbUGQwJNDPr9CgNrRCOcHmXq5izWtI7pEt2MXpX+U8+Szp+4vOPQ9NvNAnSr
         RdyuGgnfzeF15l2YjlakrC1O+iiKbvIY3Yr5UU7ag+52raxAQpm9G0ZT5qPKxpanII0K
         +wytASDV9p2lrhx7gAdX73w9aaGYQzp+kvULmn1wuiT7JdWD6mrXNT45w74M1q8vG/1y
         HsAA==
X-Gm-Message-State: AOJu0Yx4MqC379NpY9pJM4/TQDEYho+UCZbqi07dEDTTlwZTDFBVra13
	pLv7KJYHEAYkbp0PKl9nJhZvEzEkVr1H4AbpLk56Q5mLZQlWoOZ5sFJI8LUqWsipYOA87F7EoHb
	sFHmilmMWOEb217t9NQNeAnrpmvkgLHPB3efcrdKhNw==
X-Received: by 2002:a05:6871:5c45:b0:1ea:3f79:defb with SMTP id os5-20020a0568715c4500b001ea3f79defbmr14807548oac.52.1698685265964;
        Mon, 30 Oct 2023 10:01:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExUXzp0cSzQuFI/AWzKwhXt4UU+QvY8z/fyApz/M7sPoBiF5GZjJ7SszJVxAGAXDpAW5+AxTqFEaHAzsc1Bic=
X-Received: by 2002:a05:6871:5c45:b0:1ea:3f79:defb with SMTP id
 os5-20020a0568715c4500b001ea3f79defbmr14807416oac.52.1698685264406; Mon, 30
 Oct 2023 10:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-4-seanjc@google.com>
 <ZT_fnAcDAvuPCwws@google.com>
In-Reply-To: <ZT_fnAcDAvuPCwws@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 18:00:49 +0100
Message-ID: <CABgObfYM4nyb1K3xJVGvV+eQmZoLPAmz2-=1CG8++pCwvVW7Qg@mail.gmail.com>
Subject: Re: [PATCH v13 03/35] KVM: Use gfn instead of hva for mmu_notifier_retry
To: David Matlack <dmatlack@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quen
 tin Perret <qperret@google.com>, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 30, 2023 at 5:53=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> >
> > Currently in mmu_notifier invalidate path, hva range is recorded and
> > then checked against by mmu_notifier_retry_hva() in the page fault
> > handling path. However, for the to be introduced private memory, a page
>                           ^^^^^^^^^^^^^^^^^^^^^^^^
>
> Is there a missing word here?

No but there could be missing hyphens ("for the to-be-introduced
private memory"); possibly a "soon" could help parsing and that is
what you were talking about?

> >       if (likely(kvm->mmu_invalidate_in_progress =3D=3D 1)) {
> > +             kvm->mmu_invalidate_range_start =3D INVALID_GPA;
> > +             kvm->mmu_invalidate_range_end =3D INVALID_GPA;
>
> I don't think this is incorrect, but I was a little suprised to see this
> here rather than in end() when mmu_invalidate_in_progress decrements to
> 0.

I think that would be incorrect on the very first start?

> > +     }
> > +}
> > +
> > +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t =
end)
> > +{
> > +     lockdep_assert_held_write(&kvm->mmu_lock);
>
> Does this compile/function on KVM architectures with
> !KVM_HAVE_MMU_RWLOCK?

Yes:

#define lockdep_assert_held_write(l)    \
        lockdep_assert(lockdep_is_held_type(l, 0))

where 0 is the lock-held type used by lock_acquire_exclusive. In turn
is what you get for a spinlock or mutex, in addition to a rwlock or
rwsem that is taken for write.

Instead, lockdep_assert_held() asserts that the lock is taken without
asserting a particular lock-held type.

> > @@ -834,6 +851,12 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsig=
ned long start,
>
> Let's add a lockdep_assert_held_write(&kvm->mmu_lock) here too while
> we're at it?

Yes, good idea.

Paolo

