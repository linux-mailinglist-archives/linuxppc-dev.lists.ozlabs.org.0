Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E66F17E204C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 12:46:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=q4dv2Y+V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP8h56BsTz3dBl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 22:46:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=q4dv2Y+V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP8fs6Rtgz3cTF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 22:45:25 +1100 (AEDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-66d0f945893so36014236d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 03:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699271123; x=1699875923; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3+w7KiTzzQhCpJeg/0ek2R61CW1ssLM/7mTLxlOjqg=;
        b=q4dv2Y+VSldPTpjFemcSkXljyciNHXZTS9t006xap8qvq7L8tqYVoqPuwUMUlNveDp
         iTzHXa8y2iTTBGD43ldUKKT8gHjFEJShIGMsFcUf+fVZpyNOKNo8piJFiT83oRYNVTm7
         Fap7fQs+jptZ7H5rSQSd+9JCacnb5mTnShNmwjjbPhZmlha+6pwkb6HQgCPZqT5ZozS/
         dVLeV8HYUxsT6Aue3QzCmlJ2NLXR//QtWJX2FDtMUqMbY08dD8aOF2PLDo1eBfZ7keRz
         nROL2CUnMzpDPlNEeRMuqPRX51OMe8VvL0ezor7Xks/c99rXM1pBAHSfxfFYj8ukOPcX
         Bd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699271123; x=1699875923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3+w7KiTzzQhCpJeg/0ek2R61CW1ssLM/7mTLxlOjqg=;
        b=otMYAvacvXsCEuqsFrzbYQ5/7GJJErOEs8uHWWQgJElz04o/xNpoQZvZLKg/DX3VGU
         mZNC8li6nxu1ImDbBTsCowsjb3NMR+c6yeFsQDUh+RfeMrtS6yljr2dh0aGA2cfw805+
         ZEXaSElxBH2+xZQKYm/Cn5NepiWbBo+tKitkTDBYErRLqv+6E7KHjZVeCHx7G/u6s++O
         bi/PpfD52f0Taf9N6soup8n5YLf/DlO/UfiSfKw4mLMPNd/bZiIPijHgxzIk0Ucoo+nN
         ITYPgIvjka/nfP+p3Th3eHiwYg5H585Zv70yUAUxhbXC9dzOJeIzufryNSLpiH+uFCS/
         JVBA==
X-Gm-Message-State: AOJu0YwzVp2NyC/pgnA9DuhOTuSdIrvKgv81vzSX+la1Oq0/vFxgkWCv
	DNmfOdT2fkZOKBGTg6xjrVXTiFscZ9qLjuBgnvARDA==
X-Google-Smtp-Source: AGHT+IEl8/TeQ8yyhv97l+6UdWpd06zPBShx21QRSHFWAyL7jvCOyQqirpZN3XS/gBNGYYwpqQ32Yp/yP3xLHN3ZnjE=
X-Received: by 2002:a05:6214:252f:b0:66d:13c2:1c31 with SMTP id
 gg15-20020a056214252f00b0066d13c21c31mr13196146qvb.24.1699271123298; Mon, 06
 Nov 2023 03:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-29-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-29-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:44:47 +0000
Message-ID: <CA+EHjTyxH9JNL67Kz0y90CjrP_HMhmePav7qukJvMOcJrk81pg@mail.gmail.com>
Subject: Re: [PATCH 28/34] KVM: selftests: Add GUEST_SYNC[1-6] macros for
 synchronizing more data
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Sean Christopherson <seanjc@goog
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 5, 2023 at 4:34=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Add GUEST_SYNC[1-6]() so that tests can pass the maximum amount of
> information supported via ucall(), without needing to resort to shared
> memory.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-31-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  tools/testing/selftests/kvm/include/ucall_common.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/t=
esting/selftests/kvm/include/ucall_common.h
> index ce33d306c2cb..0fb472a5a058 100644
> --- a/tools/testing/selftests/kvm/include/ucall_common.h
> +++ b/tools/testing/selftests/kvm/include/ucall_common.h
> @@ -52,6 +52,17 @@ int ucall_nr_pages_required(uint64_t page_size);
>  #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4) \
>                                 ucall(UCALL_SYNC, 6, "hello", stage, arg1=
, arg2, arg3, arg4)
>  #define GUEST_SYNC(stage)      ucall(UCALL_SYNC, 2, "hello", stage)
> +#define GUEST_SYNC1(arg0)      ucall(UCALL_SYNC, 1, arg0)
> +#define GUEST_SYNC2(arg0, arg1)        ucall(UCALL_SYNC, 2, arg0, arg1)
> +#define GUEST_SYNC3(arg0, arg1, arg2) \
> +                               ucall(UCALL_SYNC, 3, arg0, arg1, arg2)
> +#define GUEST_SYNC4(arg0, arg1, arg2, arg3) \
> +                               ucall(UCALL_SYNC, 4, arg0, arg1, arg2, ar=
g3)
> +#define GUEST_SYNC5(arg0, arg1, arg2, arg3, arg4) \
> +                               ucall(UCALL_SYNC, 5, arg0, arg1, arg2, ar=
g3, arg4)
> +#define GUEST_SYNC6(arg0, arg1, arg2, arg3, arg4, arg5) \
> +                               ucall(UCALL_SYNC, 6, arg0, arg1, arg2, ar=
g3, arg4, arg5)
> +
>  #define GUEST_PRINTF(_fmt, _args...) ucall_fmt(UCALL_PRINTF, _fmt, ##_ar=
gs)
>  #define GUEST_DONE()           ucall(UCALL_DONE, 0)
>
> --
> 2.39.1
>
>
