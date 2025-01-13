Return-Path: <linuxppc-dev+bounces-5193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8FFA0C457
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 23:04:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX5rj3jlZz3by2;
	Tue, 14 Jan 2025 09:04:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736805861;
	cv=none; b=jac7dL1t+gzemMPp2M0XEp5bEuytHgEzGQPxtX0x7cfUKrsgUP/k5b6Zx6UQ8fqniWCpQGYKUU9ioWh6XLWhNNNFlgwbtrfZ3+XDC0dkHg8i2nt1RYD5V1v/WKEFbfUjTxkbad/YFOQ+u05K9xzHOwK0aIZRFXW2pqvDUjwmqWbycztzhzy6f/jUV8r9uBu9NpOuUfHk4wpOB2NLLwwwrBMkjg1Am3I9A3r9vtEK16Ehv02WoHc65bSAF8cJyynd45y0GbKb7Ihk/yz+f4HPPPAeMKqyp10jPg4NZqkx27n2lVEkoocsuaYs+IL4ZEvq+5b03nqaWhMXtzinxiaeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736805861; c=relaxed/relaxed;
	bh=5ouQM0W6rpy+hi197i8Zk+lTDosT4d/QAcoc26c/0W4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QhHqc+KZmNMtw92fp6i5XIzHbZSfPZZnPiskobKgBariKYXcL6AcGqFT5bQs+vtkxfUVZi5aZUmgVGAV0iL00GRI9LSlqe1lc04NLMbFV0WHNdsaTk06+kYlcpy1e+bwDQjVhZMAcRKl80Qf7yD5lXdvexLiQLqDt/oIkox8nY9I0Xyd5B5sRv5dniBAXw49C4zpmWhJYhYrFcM/QnJSVJmwbeqKrwnEV+lYp1N3xnT1DyBXIVFGsPd+vDnfN9Dp4mi1iCyxkFTRh3BoinOboznqnbCKJDATSgDRs3Y90behE9/BIEfaJP4a61/qBUoSfLXc7lTvBPfSI3driUtZKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=EK7G42ul; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=34i2fzwykdfuf1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=EK7G42ul;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=34i2fzwykdfuf1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX5rg75Mwz3bxf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 09:04:18 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso8637245a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 14:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736805857; x=1737410657; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ouQM0W6rpy+hi197i8Zk+lTDosT4d/QAcoc26c/0W4=;
        b=EK7G42ul/snrbnPMICfcvQv7rbp/ssOB3rOEf+vXU1mr+hvuCarAPjmW4RZvmqUxE8
         UC4z8qbVkUYYRAuNeHoeqvQrZLry5wTyOoDDiSkHVDL1K/ZW2RLbcDViNiFyrRJp5AGG
         JZbKq9CdiOb3D9+puUh1Fk96zr4EzcXaO+9Zo/K6Q2EMpS1rtTChqfu7DQ8khzd5pO95
         10gQsARP5H4garumQUhqHvv72OQze0cbZGqoQ1IOJlux7QWEq7xZGHB+LrcPEpAviJTG
         Jlw+PlJIh2NpT2dRGW20s1MfdFIIk74yb+3pj53U9tfZ7QK14ENWJ9ZIY5WmCUPCmd23
         TvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736805857; x=1737410657;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ouQM0W6rpy+hi197i8Zk+lTDosT4d/QAcoc26c/0W4=;
        b=v7lvgofhr65JUBodyiOg6qX9DyA6ttaEI/FmbqnsXza4ff/UmVQQLkmRHpXsQMLt0m
         ttIZAydaV5HC/CPJ70LGCu/gPd/d8/yf+kARPsycQgiZthe7ZeTXczo9SY0kfDI+Up7/
         2ou7hWpHhpOdU3bt2rnbyTm3+bP3J0gCgbVDCa3J4na7dsLtgCqEmC+umbtaRdaFCDQn
         +HOAnDH69+7w63x3uPH6xLlz/G1vH5WPLOMZKvsBjm1PGWjuwdNil3jzaxyrMEUz404F
         B7Dt63XqFkV7mx8iX2VL/SGDacfuRc7pVx5yJ3WK//GMJh43r9FXcOdQhhNjZWihqxQw
         K+xA==
X-Forwarded-Encrypted: i=1; AJvYcCX3pSOvQiVyruDGZLPY2bRk/Xo9jX+HNp94uigo2tg84Ctzq0B+LqttKb4KLLs3WdNNdtYU2LzvCQeyZmQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuyZLJDoDtaVyxtQUBIdbxXUA3QdTx9akzh+M8CzoHAxlu2jOP
	84S1eU3Rrbr47r1Q/RVOJ6bYRvutKbU8SGYwJCyUxswLN2WvyE5OMpX8LYiB7DbTNt7GoOAOo9h
	sCA==
X-Google-Smtp-Source: AGHT+IHPN8TIZGkXrQIWMGITx0F8fOm3vw8dMWb7JVx/B9HZzRXtZecChEPlXNK7/wkOh+HdmqOb1zcL5aE=
X-Received: from pjbdb14.prod.google.com ([2002:a17:90a:d64e:b0:2e2:9021:cf53])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f90:b0:2f6:f107:faf8
 with SMTP id 98e67ed59e1d1-2f6f107fe30mr4478474a91.24.1736805856584; Mon, 13
 Jan 2025 14:04:16 -0800 (PST)
Date: Mon, 13 Jan 2025 14:04:15 -0800
In-Reply-To: <87bjwaqzbz.wl-maz@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com> <20250111012450.1262638-4-seanjc@google.com>
 <87ikqlr4vo.wl-maz@kernel.org> <Z4U03KRYy2DVEgJR@google.com>
 <86ikqiwq7y.wl-maz@kernel.org> <Z4ViZb7rruRiN-Oe@google.com> <87bjwaqzbz.wl-maz@kernel.org>
Message-ID: <Z4WN3_wUZ1H_e7ou@google.com>
Subject: Re: [PATCH 3/5] KVM: Add a common kvm_run flag to communicate an exit
 needs completion
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Michael Ellerman <mpe@ellerman.id.au>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025, Marc Zyngier wrote:
> On Mon, 13 Jan 2025 18:58:45 +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> > 
> > On Mon, Jan 13, 2025, Marc Zyngier wrote:
> > > On Mon, 13 Jan 2025 15:44:28 +0000,
> > > Sean Christopherson <seanjc@google.com> wrote:
> > > > 
> > > > On Sat, Jan 11, 2025, Marc Zyngier wrote:
> > > > > Yet, you don't amend arm64 to publish that flag. Not that I think this
> > > > > causes any issue (even if you save the state at that point without
> > > > > reentering the guest, it will be still be consistent), but that
> > > > > directly contradicts the documentation (isn't that ironic? ;-).
> > > > 
> > > > It does cause issues, I missed this code in kvm_arch_vcpu_ioctl_run():
> > > > 
> > > > 	if (run->exit_reason == KVM_EXIT_MMIO) {
> > > > 		ret = kvm_handle_mmio_return(vcpu);
> > > > 		if (ret <= 0)
> > > > 			return ret;
> > > > 	}
> > > 
> > > That's satisfying a load from the guest forwarded to userspace.
> > 
> > And MMIO stores, no?  I.e. PC needs to be incremented on stores as well.
> 
> Yes, *after* the store as completed. If you replay the instruction,
> the same store comes out.
> 
> > > If the VMM did a save of the guest at this stage, restored and resumed it,
> > > *nothing* bad would happen, as PC still points to the instruction that got
> > > forwarded. You'll see the same load again.
> > 
> > But replaying an MMIO store could cause all kinds of problems, and even MMIO
> > loads could theoretically be problematic, e.g. if there are side effects in the
> > device that trigger on access to a device register.
> 
> But that's the VMM's problem. If it has modified its own state and
> doesn't return to the guest to complete the instruction, that's just
> as bad as a load, which *do* have side effects as well.

Agreed, just wanted to make sure I wasn't completely misunderstanding something
about arm64.

> Overall, the guest state exposed by KVM is always correct, and
> replaying the instruction is not going to change that. It is if the
> VMM is broken that things turn ugly *for the VMM itself*, 
> and I claim that no amount of flag being added is going to help that.

On x86 at least, adding KVM_RUN_NEEDS_COMPLETION reduces the chances for human
error.  x86 has had bugs in both KVM (patch 1) and userspace (Google's VMM when
handling MSR exits) that would have been avoided if KVM_RUN_NEEDS_COMPLETION existed.
Unless the VMM is doing something decidely odd, userspace needs to write code once
(maybe even just once for all architectures).  For KVM, the flag is set based on
whether or not the vCPU has a valid completion callback, i.e. will be correct so
long as the underlying KVM code is correct.

Contrast that with the current approach, where the KVM developer needs to get
the KVM code correct and remember to update KVM's documentation.  Documentation
is especially problematic, because in practice it can't be tested, i.e. is much
more likely to be missed by the developer and the maintainer.  The VMM either
needs to blindly redo KVM_RUN (as selftests do, and apparently as QEMU does), or
the developer adding VMM support needs to be diligent in reading KVM's documentation.
And like KVM documentation, testing that the VMM is implemented to KVM's "spec"
is effectively impossible in practice, because 99.9999% of the time userspace
exits and save/restore will work just fine.

I do agree that the VMM is likely going to run into problems sooner or later if
the developers/maintainers don't fundamentally understand the need to redo KVM_RUN,
but I also think there's significant value in reducing the chances for simple
human error to result in broken VMs.

