Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A77DF4C4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 15:18:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3JxrC37o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLmF13HrCz3clH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 01:18:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3JxrC37o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLmDB3tNvz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 01:17:29 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-66d190a8f87so5753166d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 07:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698934645; x=1699539445; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7O2KSplInLsDb19B+zn/jm8iaKKD/NZ+yWSezVEL04=;
        b=3JxrC37om4Jtv1KU7zRFkmXb6g3Ej/GkGAS29vgge7AuLcJGrOTe0j1JW3GpxDCMt2
         gMxh5HDHQdcWNCB2WjUl2Z/FjU6soMRwz6p4RCH2Evw7YQo66rK3lnpNE/KFLNSLOrUX
         SOdgX0Osx4lrJ65y4Ztvy6qyO1OxULbzNxZh1FdKnGOK9vzXqIwbl0t0pv1N702hJCMK
         RYRa7AkTdaMJwzvk2JkKMRSNCPBIbEjVRuO2ApAGIgdCUufdNwEx7l0r9WYzb/ACHNsp
         4YS7nZrMltwUePDTIS6gqnpMyenbmMA56qpQWJcBsiwnVHkyn9rxv6li+m4MR/JZZFnh
         r+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698934645; x=1699539445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7O2KSplInLsDb19B+zn/jm8iaKKD/NZ+yWSezVEL04=;
        b=fYXL2DoTui6ebu8jmFM8SgkQlAEe4aPNLwRVSjVbx40BSxPFiedqwMF2b7XwJt5e1S
         D+R9LFbhfaUcgD2uB95ss1PVhdxeRCWPu+YldDDYAB/gwe0wNCsL2iYClENFAExSR03M
         4KnF5auBzBGI2Ge4NtiWUr4qW//cTikP+eXAB2ZU6PKMUYMSvJIaIp2I+J68rx6mALPD
         QKWivAI66Lvvrb1wkLT2nLsBkly+YrZs6wxX+qJv1Mj6o2G/1DND75J33toJyjiIS6jl
         paX8cRGsFHHW4TJ0e74e4EG0rdg4qMdvqeKu7zNEIbTjOe57Vfm1lEImhcd8eT4U21Nr
         JwCg==
X-Gm-Message-State: AOJu0YyKWPu3vqwxbCbv0w2IuZu/s7lacvh70QCA1qQlmj0bwngoG+L4
	NkJNb8EhVvWI6oHsi/hXueXOzQ4nhBIWF5HCmKDJPg==
X-Google-Smtp-Source: AGHT+IGAosxm/0woyiCy5wtpQ5hw9PNiMnNT8Y+nXK7zRiDLlPKvw69895suNy2q5wz5DwPz9Dn0X+ha5Vtg4tVBUZc=
X-Received: by 2002:a05:6214:d88:b0:66d:3a0f:97a with SMTP id
 e8-20020a0562140d8800b0066d3a0f097amr20020837qve.6.1698934645120; Thu, 02 Nov
 2023 07:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-19-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-19-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 14:16:49 +0000
Message-ID: <CA+EHjTwXdntKGMjb8Zj1M3iVVN5NX6iLwbzJjE72j_eVczTQYw@mail.gmail.com>
Subject: Re: [PATCH v13 18/35] KVM: x86: "Reset" vcpu->run->exit_reason early
 in KVM_RUN
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
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 27, 2023 at 7:23=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Initialize run->exit_reason to KVM_EXIT_UNKNOWN early in KVM_RUN to reduc=
e
> the probability of exiting to userspace with a stale run->exit_reason tha=
t
> *appears* to be valid.
>
> To support fd-based guest memory (guest memory without a corresponding
> userspace virtual address), KVM will exit to userspace for various memory
> related errors, which userspace *may* be able to resolve, instead of usin=
g
> e.g. BUS_MCEERR_AR.  And in the more distant future, KVM will also likely
> utilize the same functionality to let userspace "intercept" and handle
> memory faults when the userspace mapping is missing, i.e. when fast gup()
> fails.
>
> Because many of KVM's internal APIs related to guest memory use '0' to
> indicate "success, continue on" and not "exit to userspace", reporting
> memory faults/errors to userspace will set run->exit_reason and
> corresponding fields in the run structure fields in conjunction with a
> a non-zero, negative return code, e.g. -EFAULT or -EHWPOISON.  And becaus=
e
> KVM already returns  -EFAULT in many paths, there's a relatively high
> probability that KVM could return -EFAULT without setting run->exit_reaso=
n,
> in which case reporting KVM_EXIT_UNKNOWN is much better than reporting
> whatever exit reason happened to be in the run structure.
>
> Note, KVM must wait until after run->immediate_exit is serviced to
> sanitize run->exit_reason as KVM's ABI is that run->exit_reason is
> preserved across KVM_RUN when run->immediate_exit is true.
>
> Link: https://lore.kernel.org/all/20230908222905.1321305-1-amoorthy@googl=
e.com
> Link: https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf@google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/x86/kvm/x86.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ee3cd8c3c0ef..f41dbb1465a0 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -10963,6 +10963,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
>  {
>         int r;
>
> +       vcpu->run->exit_reason =3D KVM_EXIT_UNKNOWN;
>         vcpu->arch.l1tf_flush_l1d =3D true;
>
>         for (;;) {
> --
> 2.42.0.820.g83a721a137-goog
>
