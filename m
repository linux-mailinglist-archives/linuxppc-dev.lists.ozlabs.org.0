Return-Path: <linuxppc-dev+bounces-13809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6DBC3650D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 16:26:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1q1D29phz3bW7;
	Thu,  6 Nov 2025 02:26:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762356400;
	cv=none; b=MOeK9tt3wVe8hWhJNyIJJEKoEmc/UQBzCCJpA8wy5dvWkpLItpL/W6/plX9924G3pIQOXk1s+2d4HmZuqffiWV3UBFjMzJXXuMzkxiacnNCdpH0FZO9gpZg0one8Dj/BzmUGm8oaR8yPPmT1wnReVFDX6RmojkE+RYmSMAIc+JR9FDYu449nFrAaGD6+s0U2ZYE6hdiY8fB3nP9M3cOsjM6ADk3s0eRnBtOdEuZUx0DOV0w75O92tDNKDKlAGPfJl3XQd5DECYNDYfYTNI8WlZWYquiHYQbi04ORBP2xAKaZGz9ISuhiNyTneZDdlbksvwRXOsydjEGSltyTtiyeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762356400; c=relaxed/relaxed;
	bh=dmjmfo22QwufKip+RFN2GwcKXDk7+fDMohFzNqFh1wo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UIqp319MgdmTK+sJvwEyVx9feR58uiVu68oPC8YwiguByHkdvn4ufHsg7h9vPrlWh4lPAwso+1Wntx77BfyMREzXSs54IYezGH3zqZCj65NJvDHpm9fga+tI46EJMCpQc9Z2esiaDDioBOIqOp9bvKtZZUBR22UH78f8hkDY+N+xyeHVennuZlEcwNhqNXEj8voqKTN+Nx1EOuoTTx3qFhqSDIikJ2bIRV5pkWybOrfHlDGYaec01rKigo3rwfA5PcziNFqYRyYdUJMLmVTPOWI1Sk9N832jQlLS+g+1HH4xAH397bGftHFfXRKqwU/OrAxCQIIa44Q02klfBZD4gA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZZOkuYE/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3q2wlaqykdaiugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZZOkuYE/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3q2wlaqykdaiugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1q1B6Tjtz2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 02:26:38 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3418ada9e6cso1978173a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Nov 2025 07:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762356395; x=1762961195; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dmjmfo22QwufKip+RFN2GwcKXDk7+fDMohFzNqFh1wo=;
        b=ZZOkuYE/1097Ji/CVc3vYIoW99gMB2PX6BDXbtXUWJkIGfBnvBFaudwjj5muBCYWQo
         5IFJHWjVDGqUyj9FBhoyBItJLt59O/PDVIEMdJnHkTojzAh8idJZmW3IWPhaWL1g1Gmf
         8Eqg9yl5aDyGpEiS+NmMwjtgCmzpzPgj+suS69DxAsbB6jpeUmYAyEswP5mqBgrkmyQa
         +a+c8HBGXaXWvNma2KtakHNAiUc18080xJQ2uawfSf2hM39x+crSLSeb6ePgliY2glIk
         LE0Dyw5VYbxyIj5S/d4imW6A00JLyXbAfgv3TIDhB4FkmCbDvmqwL3Bn/xrf/+p/hryX
         E5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762356395; x=1762961195;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmjmfo22QwufKip+RFN2GwcKXDk7+fDMohFzNqFh1wo=;
        b=sRpL3hBwaPUZysMZ2qtCu5hJuB2lvzk9PtSTSAMlGfflgrwNM6BueSu9byRR5DZpXI
         VCandOJIQHAlCWdgsNUxG42lb301j+2p65pvgGeV2nAv50bLNSB5yZwt2HA1Dwx83D8B
         4mPSAtJHMzpclsuHWFpFom/c6BMMK9Hc3oGXIG7IIOyaEutMxpGULW9gpIBqcjj8l/wj
         u1Yptn/oJwhoNOKdyVJzWs8+3C3lhEufWNAJStiUunP56/K8/ozzqxL9KOr2WMQIC6lC
         Bkq9+LrWrBz7gLpHFiUNFC1B5JFM1uVqYbFcf+rV/tjeHyS6XoEd+xHEKk2X/YOxj4ph
         Mftg==
X-Forwarded-Encrypted: i=1; AJvYcCUevF4tktg8qsbK8I8NDHnfP9WklIP2NSYhkh+gyS+LzFvSgJqXgTe5AcjHrCEXmw6eHnqUZ/mfhi48Iio=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbwA1iz8QPzI252FSH97CzFu+dZRLlDR26Y/3IvKyEHz8lwicH
	xBB7tiZ+bItcxViZwYFgQ89MwvHEhrZ+Mo5LdzLe6FL+Vn2EG7ar4m4UbvPy2OrAzO7Dgp9hPIG
	eU+LEbQ==
X-Google-Smtp-Source: AGHT+IEksiko2nLkYHDcuQoizh41Xk4dhEPlLcSxUswEaWhydqjlp9gNPv6q5VYl/pXem0FsGEVxprPZGIk=
X-Received: from pjbtc7.prod.google.com ([2002:a17:90b:5407:b0:340:b503:505f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:384d:b0:340:9cf1:54d0
 with SMTP id 98e67ed59e1d1-341a6c08e65mr4623520a91.1.1762356395074; Wed, 05
 Nov 2025 07:26:35 -0800 (PST)
Date: Wed, 5 Nov 2025 07:26:33 -0800
In-Reply-To: <aQsBI1/SIXGbf9nA@yzhao56-desk.sh.intel.com>
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
Precedence: list
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-5-seanjc@google.com>
 <aPhjYcOFjL1Z8m2s@yzhao56-desk.sh.intel.com> <aQMi/n9DVyeaWsVH@yzhao56-desk.sh.intel.com>
 <aQo-hus99rE7WBgb@google.com> <aQr9jW/7zwWJaDFf@yzhao56-desk.sh.intel.com> <aQsBI1/SIXGbf9nA@yzhao56-desk.sh.intel.com>
Message-ID: <aQtsqXPaZo2SMdJU@google.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 05, 2025, Yan Zhao wrote:
> On Wed, Nov 05, 2025 at 03:32:29PM +0800, Yan Zhao wrote:
> > On Tue, Nov 04, 2025 at 09:57:26AM -0800, Sean Christopherson wrote:
> > > On Thu, Oct 30, 2025, Yan Zhao wrote:
> > > > On Wed, Oct 22, 2025 at 12:53:53PM +0800, Yan Zhao wrote:
> > > > > On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > > > > > Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
> > > > > 
> > > > > Hi Sean,                                                                         
> > > > > 
> > > > > Will you post [1] to fix the AB-BA deadlock issue for huge page in-place
> > > > > conversion as well?
> > > 
> > > If you (or anyone) has the bandwidth, please pick it up.  I won't have cycles to
> > > look at that for many weeks (potentially not even this calendar year).
> > Got it!
> > On the other hand, do you think we can address the warning as below?
> > The code is based on [2].
> Hmm, updated the diff.
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 7b4a4474d468..543e1eb9db65 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -853,6 +853,9 @@ static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 flags)
>         inode->i_size = size;
>         mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
>         mapping_set_inaccessible(inode->i_mapping);
> +       if (flags &GUEST_MEMFD_FLAG_MMAP)
> +               lockdep_set_subclass(&inode->i_mapping->invalidate_lock, 1);
> +
>         /* Unmovable mappings are supposed to be marked unevictable as well. */
>         WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
> 
>  
> > As noted in [3], the only scenario can trigger the warning after [2] is when a
> > process creates a TDX VM with non-in-place-conversion guest_memfd and a normal
> > VM with in-place-conversion guest_memfd. The two invalidate_lock's don't contend
> > with each other theoretically.

Hmm, no, I think we need to hoist gup() call outside of filemap_invalidate_lock(),
because I don't think this is strictly limited to TDX VMs without in-place
conversion.  Even with in-place conversion, I think KVM should allow the source
page to be shared memory, at which point I believe this becomes a legimate AB-BA
issue.

In general, playing lockdep games with so many subsystems involved terrifies me.

> > [2] https://lore.kernel.org/all/cover.1760731772.git.ackerleytng@google.com/
> > [3] https://lore.kernel.org/all/aQMi%2Fn9DVyeaWsVH@yzhao56-desk.sh.intel.com/

