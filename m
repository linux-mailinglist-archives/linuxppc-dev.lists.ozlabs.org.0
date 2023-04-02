Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0076D351E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Apr 2023 02:49:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PpwQx1F5Lz3chb
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Apr 2023 10:49:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C35uFhqG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C35uFhqG;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PpwQ15YQfz3cGr
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Apr 2023 10:48:55 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id o11so24925297ple.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Apr 2023 17:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680396531;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=769fy3W+8GF1XpGTcCE4kXG2vQJMw57gwKdzR53jc/c=;
        b=C35uFhqG5NtAn0jrZKb2bJbdHnL416S5yfJNjxHAS8JipuzCXAhfOW5vJ5+Fgqubm/
         ErFT/A7xVlMA69c9b12nKcITj5lIckjjGFJ2UyXMmPsPLG03oYBETVEvawTLpE1qXRmu
         b/RthQKCArEoLM+3obkXhXR+v09MZaQ3ihNVL3fo1AIWWRZndw7Uu+Hrku8YydhLbP7h
         OdBD+8ZoN/eXPC0FBdeCqyaufRAwnek4yswQBy+U8Uq560fETy9P7Rk49Bj3TNqalsro
         rW5qgaJZg/Mpbd8c01O79Fmoug62pr4IG9sP/PSKrk5fhOJJZC5TKYwXZRFch014v0hm
         karA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680396531;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=769fy3W+8GF1XpGTcCE4kXG2vQJMw57gwKdzR53jc/c=;
        b=6PNS7MyGxJUJ1byLmlxMoFhH29/lRjnLXVjcq7hNbmJHL7T/ktK3C9sXbeuCGW8k7/
         JvNDcCHrHCbNWVAs23ZVE6SHoJe2+J7VW1xpN8tIyps5W95gETs7ySxZjcQeXJuCH0k1
         rTGrCN8l4pd2JhoB+XetXMg7XgXgAqLhgX2rk8Bp0a9CSI8Ay46ipyuKQ35Xf2Guhykw
         VOTjklTR75flAEIavFUS8Q4JgLyXIr+49pjZQdV7bmrL43tyr6EuIsB0p/Wibwk4kqVk
         v/OE32EYSnB+fQ/WZFHLbdL2CzvFtBe5LgbRv2JwbWfwdtAOs+HjhK4wx6ay1a0sOvGp
         hx5Q==
X-Gm-Message-State: AAQBX9cKG/Fsty//u2TRw8nUqrEEbIpISjIUydUzwqDO22XPNkSHqtWy
	as2EBs6aFJuamP2zn3A+rKs=
X-Google-Smtp-Source: AKy350YEF2WyrFngtQH+LlDrGaKYg9D/63daDsHWTW/ihmxZBdOCML6g/5Ytv7vhppScY3Ak8/flZg==
X-Received: by 2002:a17:902:e34c:b0:1a0:69ba:832e with SMTP id p12-20020a170902e34c00b001a069ba832emr26018065plc.0.1680396531251;
        Sat, 01 Apr 2023 17:48:51 -0700 (PDT)
Received: from localhost (121-44-67-49.tpgi.com.au. [121.44.67.49])
        by smtp.gmail.com with ESMTPSA id d19-20020a170902b71300b00198d7b52eefsm3900623pls.257.2023.04.01.17.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 17:48:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Apr 2023 10:48:45 +1000
Message-Id: <CRLUUQQWIY0E.6XPIKFXECRBG@bobo>
Subject: Re: [PATCH 1/2] KVM: PPC: Add kvm selftests support for powerpc
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Sean Christopherson" <seanjc@google.com>
X-Mailer: aerc 0.13.0
References: <20230316031732.3591455-1-npiggin@gmail.com>
 <20230316031732.3591455-2-npiggin@gmail.com> <ZCSdWc9te0Noiwo3@google.com>
In-Reply-To: <ZCSdWc9te0Noiwo3@google.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hey thanks for the review. Points about formatting and style all
valid, I'll tidy those up. For the others,

On Thu Mar 30, 2023 at 6:19 AM AEST, Sean Christopherson wrote:
> On Thu, Mar 16, 2023, Nicholas Piggin wrote:
> > +#ifdef __powerpc__
> > +		TEST_ASSERT(getpagesize() =3D=3D 64*1024,
>
> This can use SZ_64K (we really need to convert a bunch of open coded stuf=
f...)
>
> > +			    "KVM selftests requires 64K host page size\n");
>
> What is the actual requirement?  E.g. is it that the host and guest page =
sizes
> must match, or is that the selftest setup itself only supports 64KiB page=
s?  If
> it's the former, would it make sense to assert outside of the switch stat=
ement, e.g.
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/s=
elftests/kvm/lib/kvm_util.c
> index 298c4372fb1a..920813a71be0 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -291,6 +291,10 @@ struct kvm_vm *____vm_create(enum vm_guest_mode mode=
)
>  #ifdef __aarch64__
>         if (vm->pa_bits !=3D 40)
>                 vm->type =3D KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
> +#endif
> +#ifdef __powerpc__
> +       TEST_ASSERT(getpagesize() =3D=3D vm->page_size, "blah blah blah")=
;
> +
>  #endif
> =20
>         vm_open(vm);
>
> If it's the latter (selftests limitation), can you add a comment explaini=
ng the
> limitation?

It's the selftests setup, requires both host and guest to be 64k page
size. I think it shouldn't be *too* hard to add any mix of 64k/4k, but
there are a few quirks like requiring pgd to have 64k size allocation.
64/64 is the most important for us, but it would be nice to get other
combos working soon if nothing else than because they don't get as much
testing in other ways.

I can add a comment.

> > +
> > +	/* If needed, create page table */
> > +	if (vm->pgd_created)
> > +		return;
>
> Heh, every arch has this.  Any objection to moving the check to virt_pgd_=
alloc()
> as a prep patch?

I have no objection, I can do that for the next spin.

> > +		"PTE not valid at level: %u gva: 0x%lx pte:0x%lx\n",
> > +		level, gva, pte);
> > +
> > +	return (pte & PTE_PAGE_MASK) + (gva & (vm->page_size - 1));
> > +}
> > +
> > +static void virt_arch_dump_pt(FILE *stream, struct kvm_vm *vm, vm_padd=
r_t pt, vm_vaddr_t va, int level, uint8_t indent)
>
> And here.  Actually, why bother with the helper?  There's one caller, and=
 that
> callers checks pgd_created, i.e. is already assuming its dumping only pag=
e tables.
> Ooh, nevermind, it's recursive.
>
> Can you drop "arch" from the name?  Selftests uses "arch" to tag function=
s that
> are provided by arch code for use in generic code.

Yeah agree, I'll drop that.

> > +			} else {
> > +				virt_arch_dump_pt(stream, vm, pte & PDE_PT_MASK, va, level + 1, in=
dent);
> > +			}
> > +		}
> > +		va +=3D pt_entry_coverage(vm, level);
>
> The shift is constant for vm+level, correct?  In that case, can't this be=
 written
> as
>
> 	for (idx =3D 0; idx < size; idx++, va +=3D va_coverage) {
>
> or even without a snapshot
>
> 	for (idx =3D 0; idx < size; idx++, va +=3D pt_entry_coverage(vm, level))=
 {
>
> That would allow
>
> 		if (!(pte & PTE_VALID)
> 			continue
>
> to reduce the indentation of the printing.

It is constant for a given (vm, level). Good thinking, that should work.

> > +	stack_vaddr =3D __vm_vaddr_alloc(vm, stack_size,
> > +				       DEFAULT_GUEST_STACK_VADDR_MIN,
> > +				       MEM_REGION_DATA);
> > +
> > +	vcpu =3D __vm_vcpu_add(vm, vcpu_id);
> > +
> > +	vcpu_enable_cap(vcpu, KVM_CAP_PPC_PAPR, 1);
> > +
> > +	/* Setup guest registers */
> > +	vcpu_regs_get(vcpu, &regs);
> > +	vcpu_get_reg(vcpu, KVM_REG_PPC_LPCR_64, &lpcr);
> > +
> > +	regs.pc =3D (uintptr_t)guest_code;
> > +	regs.gpr[12] =3D (uintptr_t)guest_code;
> > +	regs.msr =3D 0x8000000002103032ull;
> > +	regs.gpr[1] =3D stack_vaddr + stack_size - 256;
> > +
> > +	if (BYTE_ORDER =3D=3D LITTLE_ENDIAN) {
> > +		regs.msr |=3D 0x1; // LE
> > +		lpcr |=3D 0x0000000002000000; // ILE
>
> Would it be appropriate to add #defines to processor.h instead of open co=
ding the
> magic numbers?

Yes it would. I should have not been lazy about it from the start, will
fix.

(Other comments snipped but agreed for all)

Thanks,
Nick
