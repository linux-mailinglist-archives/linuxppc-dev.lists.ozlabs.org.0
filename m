Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16E7E2966
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 17:05:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=oEmvQq09;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPGQV3TTqz3cVD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 03:05:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=oEmvQq09;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3gw5jzqykdpqoawjfyckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPGPg3hzQz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 03:04:21 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a9012ab0adso64335487b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 08:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699286659; x=1699891459; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBcfSXW+7b0RYZr/CwodaGuIC1t2rSK8z82L7NdJqdg=;
        b=oEmvQq09lW20bFQB/kfj09X92ChYHaZOUz0dtL6McCByNl0eGHczKbMay0bqbQUjmT
         QUD3W/n+mYobvuVGrldejRFqL5rJ8Iz5NnUzaQnPJhWlq2nJAl3iE5mK4oZ3YTM8AOdb
         mBX4kkoCSPYwu76mCNGuZ5gKGv+HRDofv6GRyULV/4hed7BMEuhXIkiEsdo3Bha0MdeT
         tn6cPfI20j0mP12X4/w6HufiMjcgfPNbIauylZQALbLO9cS9ba/7qgaIkQWEO9sjJtSC
         HRxmrQBSlTtWnxd9YwLF8fJPplZUgUhZCOz76AHQub6Lt3sWm1te14IAJYNRa8hr/cnY
         WbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286659; x=1699891459;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vBcfSXW+7b0RYZr/CwodaGuIC1t2rSK8z82L7NdJqdg=;
        b=YowLxjUOmch826opycUPWf9bZMYcRuz0sicILPyra+NkPtY6P1jtjsQdPJdWd7gr9y
         CPcxHWmxRszBErZ0/AN/vHb9oXN1R0Lz38d+ZXu/vntgY0Dg0RIZnhWn8Xtt46DH0kR3
         tJ25CFiZM3OXxRDUY8+Q3eT7e+ZLO/OQi/WU+PpXndsZZvv6Dwrr5YBnX6nEAoI9WDku
         O0bPTUO4R/vwzC0e2d5NVQ80s0diSyp7koGFS7r7fh/KVCQzL8S3B5MPcu1YfWBPr2sj
         Owb9XfVsz37P5AgfCwsGXORuNPcqju+3Ju2JpBgJpdX/HPlgHuPPM7teJlh7wEuEv54Y
         O+iQ==
X-Gm-Message-State: AOJu0YxKrO047denI1Rsch/OkdXZYUmWu7E40rx6zen/v/H19kmbdXsC
	/EzfL8XkZx2lCe9mVOuKW9eefpy56ng=
X-Google-Smtp-Source: AGHT+IG4M/eznhqFxpL/eWUumIXP2aANvxiOg95OzhM2lh4aiDVuodrpXWON7UbLhWxQPiRYqqCoKKt9NcE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:830d:0:b0:5a8:6162:b69 with SMTP id
 t13-20020a81830d000000b005a861620b69mr214046ywf.3.1699286659321; Mon, 06 Nov
 2023 08:04:19 -0800 (PST)
Date: Mon, 6 Nov 2023 08:04:17 -0800
In-Reply-To: <CA+EHjTxz-e_JKYTtEjjYJTXmpvizRXe8EUbhY2E7bwFjkkHVFw@mail.gmail.com>
Mime-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-28-pbonzini@redhat.com>
 <CA+EHjTxz-e_JKYTtEjjYJTXmpvizRXe8EUbhY2E7bwFjkkHVFw@mail.gmail.com>
Message-ID: <ZUkOgdTMbH40XFGE@google.com>
Subject: Re: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracl
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 06, 2023, Fuad Tabba wrote:
> On Sun, Nov 5, 2023 at 4:34=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
> >
> > From: Sean Christopherson <seanjc@google.com>
> >
> > Add a "vm_shape" structure to encapsulate the selftests-defined "mode",
> > along with the KVM-defined "type" for use when creating a new VM.  "mod=
e"
> > tracks physical and virtual address properties, as well as the preferre=
d
> > backing memory type, while "type" corresponds to the VM type.
> >
> > Taking the VM type will allow adding tests for KVM_CREATE_GUEST_MEMFD,
> > a.k.a. guest private memory, without needing an entirely separate set o=
f
> > helpers.  Guest private memory is effectively usable only by confidenti=
al
> > VM types, and it's expected that x86 will double down and require uniqu=
e
> > VM types for TDX and SNP guests.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > Message-Id: <20231027182217.3615211-30-seanjc@google.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
>=20
> nit: as in a prior selftest commit messages, references in the commit
> message to guest _private_ memory. Should these be changed to just
> guest memory?

Hmm, no, "private" is mostly appropriate here.  At this point in time, only=
 x86
supports KVM_CREATE_GUEST_MEMFD, and x86 only supports it for private memor=
y.
And the purpose of letting x86 selftests specify KVM_X86_SW_PROTECTED_VM, i=
.e.
the reason this patch exists, is purely to get private memory.

Maybe tweak the second paragraph to this?

Taking the VM type will allow adding tests for KVM_CREATE_GUEST_MEMFD
without needing an entirely separate set of helpers.  At this time,
guest_memfd is effectively usable only by confidential VM types in the
form of guest private memory, and it's expected that x86 will double down
and require unique VM types for TDX and SNP guests.
