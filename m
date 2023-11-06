Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6117E2997
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 17:18:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TXUVjutU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPGk24p90z3cBr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 03:18:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TXUVjutU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPGj91HzSz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 03:17:48 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-66d13ac2796so30033106d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 08:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699287466; x=1699892266; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUV8zKIdpTV0f8ZMhx633GQ2l+XRSBNMcsvYJoEfTx4=;
        b=TXUVjutUBQkdKjQeNbZmHoQTjTY5dthXwXoTIQjZ28wgT6QyInUEmAhwrdtxiYJXBW
         wEIVRLhmcAiIOHQBWLCMc2KtyhzhWnF3dPa1Uagk4rY6pzG7S/2IR16trtbY/uywAHkM
         smYbMJxTzHzv6E/FTrnaVN7GlBVL5Vfi4S3IAYAvihNGMffBi5trN+mrFrr5Je+ItyPP
         hkzfQ8YiRQdytUuZWNAjFBiW8sTHBDYH5NDCCGEVkvRVjqEGcuS2ffUs2LM6/7hmOLSy
         eUX+LkgO8+WtrXbs4QOufIcMkfCkJdXPPCH1276mzxzY97fv1WyTtAzRjUnOmvQm+0CD
         gEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699287466; x=1699892266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUV8zKIdpTV0f8ZMhx633GQ2l+XRSBNMcsvYJoEfTx4=;
        b=hD2c3zlvxl5t5UjBCUU9zJ2BAqVoDoWLjjVTBpUXI//PMpYuhfn67pWx0PSnV2ZJj6
         49D5C3/y0zenBLm0kwaQBylzY2UeBboMonhaYT1YhU1twcl0CztTqLwoAHFhRrCfhi8A
         GStGXzCwJNctPK63GoIi5wNLMVDLB+rZHbM0KT5AXv8xon28gM8Ry+bvY79hUAeOaUpq
         tuQOPEI5YHn9/HAzwrEL2v7D/26DmUwJaW+jY4HF7KkTbjXcHkpZIFZJBdU/cytIzNBY
         IQa23xXtW3K+adZp5kzWagtFGAkJmbbq0yfudoKQRVlZUYPmi/YL9vsU4OfU/KLqwpvL
         Jehg==
X-Gm-Message-State: AOJu0Yz+7YslaL/McOMSvH//Wg5iL182596HX/42RTDMfwej3YdvGMw3
	GIoho/vTymvXwyxuNOn6DOOKLPUilfi0TJe0mErneQ==
X-Google-Smtp-Source: AGHT+IFFqaeUa+zb1fqYMH2SBG8qERPcG1V2EKOvlLONFWJF+9JT7SC3ACnaIHdf6fX4zUtKFZJjWCRYHGHhXFDqHvM=
X-Received: by 2002:ad4:5c83:0:b0:670:9f8d:f7be with SMTP id
 o3-20020ad45c83000000b006709f8df7bemr44676404qvh.13.1699287465633; Mon, 06
 Nov 2023 08:17:45 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-28-pbonzini@redhat.com>
 <CA+EHjTxz-e_JKYTtEjjYJTXmpvizRXe8EUbhY2E7bwFjkkHVFw@mail.gmail.com> <ZUkOgdTMbH40XFGE@google.com>
In-Reply-To: <ZUkOgdTMbH40XFGE@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 16:17:09 +0000
Message-ID: <CA+EHjTzc4zwN1atU1mSnbi3Lvb0c83MATQSk1uSWxae2iKi0aw@mail.gmail.com>
Subject: Re: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
To: Sean Christopherson <seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracl
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 6, 2023 at 4:04=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Mon, Nov 06, 2023, Fuad Tabba wrote:
> > On Sun, Nov 5, 2023 at 4:34=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.c=
om> wrote:
> > >
> > > From: Sean Christopherson <seanjc@google.com>
> > >
> > > Add a "vm_shape" structure to encapsulate the selftests-defined "mode=
",
> > > along with the KVM-defined "type" for use when creating a new VM.  "m=
ode"
> > > tracks physical and virtual address properties, as well as the prefer=
red
> > > backing memory type, while "type" corresponds to the VM type.
> > >
> > > Taking the VM type will allow adding tests for KVM_CREATE_GUEST_MEMFD=
,
> > > a.k.a. guest private memory, without needing an entirely separate set=
 of
> > > helpers.  Guest private memory is effectively usable only by confiden=
tial
> > > VM types, and it's expected that x86 will double down and require uni=
que
> > > VM types for TDX and SNP guests.
> > >
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > Message-Id: <20231027182217.3615211-30-seanjc@google.com>
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> >
> > nit: as in a prior selftest commit messages, references in the commit
> > message to guest _private_ memory. Should these be changed to just
> > guest memory?
>
> Hmm, no, "private" is mostly appropriate here.  At this point in time, on=
ly x86
> supports KVM_CREATE_GUEST_MEMFD, and x86 only supports it for private mem=
ory.
> And the purpose of letting x86 selftests specify KVM_X86_SW_PROTECTED_VM,=
 i.e.
> the reason this patch exists, is purely to get private memory.
>
> Maybe tweak the second paragraph to this?
>
> Taking the VM type will allow adding tests for KVM_CREATE_GUEST_MEMFD
> without needing an entirely separate set of helpers.  At this time,
> guest_memfd is effectively usable only by confidential VM types in the
> form of guest private memory, and it's expected that x86 will double down
> and require unique VM types for TDX and SNP guests.

sgtm
/fuad
