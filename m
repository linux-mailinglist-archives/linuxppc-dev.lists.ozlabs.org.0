Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 458437E2047
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 12:45:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YVPACWQ+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP8gB0yszz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 22:45:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YVPACWQ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP8fJ62QWz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 22:44:56 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a822f96aedso52096977b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 03:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699271092; x=1699875892; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DX7ek6JbnQBP3kmz+KR8GNUYI0kM1PtX+UUHfn3vax8=;
        b=YVPACWQ+j9M02pcyw4QkBBax2wW+RNIkTM/QwCKS+vEczLN5eD8Ys6dI6L4cTJvIEe
         +KiHpd6JqavGaUs9wvezwH92fM4RGtvHLNxXJH8njz8PdkefR1M4ThPq5n65HB+TDGWS
         WD5FiPKykV4jYFP/A38nfkux5fs4FPOHn3QP5RufGhvOyNkKjgXPOQeqR6D3/rbnwyQm
         Baq3+1Qo2HKQ5KMS6txUt1JpIL6NYbR34IOpWUf1H9OkzM6wkOBbneq4ie+226/EKC4F
         L+7uoym93mDtL91bYowjSoBvrEijtGXddVPB5S4dBoM0hnaJnEDw7gRW2IvIGnlGbzi0
         YS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699271092; x=1699875892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DX7ek6JbnQBP3kmz+KR8GNUYI0kM1PtX+UUHfn3vax8=;
        b=Va1/31/6j+2FPl4Y3D11gQWZ/ksUBShpllX2S8yuNeKNSgvO073JZXKDgS+gDao3N8
         w+tpw6QNoccPOwfjZcwnBneD6WTLEgMZDTOq3fi7VItfI+ZcpXr2eO3XB3STbT2jVi7n
         oy6uX8KtHNL+A/Dk1+yG2NGAmbenlwL8MmxYnb0+wjUf8eXtZD8pfjKDlhtg36feoytK
         7tnoXommkV6rF4zexp0eCJm72N3uwuYaPhtXuV6rJkKSSs3x/Ba7Sf31YLrEPuelygJw
         D6eAEJyfVHSxaytTuGwciIU275IdCxTmebvPn/WlDzC6boEsBmTuYiIKFEq+hUgmK6yg
         yRtw==
X-Gm-Message-State: AOJu0YwiyzjHVAsa0G+ZFXvTIG2kB4Ok8PEIaypErJgHdx8IjSNhVmIE
	1GsxwnPhTGO1VkpIPNYK6/TYlgjtpY1ndPTdkrE8PA==
X-Google-Smtp-Source: AGHT+IERnN25ZpQWhSoveHYhjH1bHINt0TuAVLiTz7wZcF5ueihZgXoSAZV3dV6i7b/f23cd983VPNMQFTyQCDpDsN0=
X-Received: by 2002:a0d:ccc5:0:b0:5a7:e4fe:ea3 with SMTP id
 o188-20020a0dccc5000000b005a7e4fe0ea3mr10768851ywd.22.1699271092440; Mon, 06
 Nov 2023 03:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-27-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-27-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:44:16 +0000
Message-ID: <CA+EHjTymGLsfHvdP4fPOFWTtaRwbtbCOBZ0XOC3gsX+nYm-cZQ@mail.gmail.com>
Subject: Re: [PATCH 26/34] KVM: selftests: Add helpers to do
 KVM_HC_MAP_GPA_RANGE hypercalls (x86)
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
> From: Vishal Annapurve <vannapurve@google.com>
>
> Add helpers for x86 guests to invoke the KVM_HC_MAP_GPA_RANGE hypercall,
> which KVM will forward to userspace and thus can be used by tests to
> coordinate private<=3D>shared conversions between host userspace code and
> guest code.
>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> [sean: drop shared/private helpers (let tests specify flags)]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-29-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  .../selftests/kvm/include/x86_64/processor.h      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/too=
ls/testing/selftests/kvm/include/x86_64/processor.h
> index 25bc61dac5fb..a84863503fcb 100644
> --- a/tools/testing/selftests/kvm/include/x86_64/processor.h
> +++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
> @@ -15,6 +15,7 @@
>  #include <asm/msr-index.h>
>  #include <asm/prctl.h>
>
> +#include <linux/kvm_para.h>
>  #include <linux/stringify.h>
>
>  #include "../kvm_util.h"
> @@ -1194,6 +1195,20 @@ uint64_t kvm_hypercall(uint64_t nr, uint64_t a0, u=
int64_t a1, uint64_t a2,
>  uint64_t __xen_hypercall(uint64_t nr, uint64_t a0, void *a1);
>  void xen_hypercall(uint64_t nr, uint64_t a0, void *a1);
>
> +static inline uint64_t __kvm_hypercall_map_gpa_range(uint64_t gpa,
> +                                                    uint64_t size, uint6=
4_t flags)
> +{
> +       return kvm_hypercall(KVM_HC_MAP_GPA_RANGE, gpa, size >> PAGE_SHIF=
T, flags, 0);
> +}
> +
> +static inline void kvm_hypercall_map_gpa_range(uint64_t gpa, uint64_t si=
ze,
> +                                              uint64_t flags)
> +{
> +       uint64_t ret =3D __kvm_hypercall_map_gpa_range(gpa, size, flags);
> +
> +       GUEST_ASSERT(!ret);
> +}
> +
>  void __vm_xsave_require_permission(uint64_t xfeature, const char *name);
>
>  #define vm_xsave_require_permission(xfeature)  \
> --
> 2.39.1
>
>
