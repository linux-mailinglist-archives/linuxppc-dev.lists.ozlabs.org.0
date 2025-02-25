Return-Path: <linuxppc-dev+bounces-6469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1414A443D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 16:05:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2LW00n7Tz30VJ;
	Wed, 26 Feb 2025 02:05:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740495900;
	cv=none; b=QVxCpBF4/HtCPESpvp15D9yiPgtVBPM2lGVrGvO2OTZ4NtR7zq9omWxNMYXY+0CF5YOpeIQXZ97U3hJhteew0PSR9BYNCPwLyHPC8uLjHwQPaXgzpbIEVn9kf2QnG558h2uq0VzrJrbt0j1g9GdMdpJ52u0WaEQ0U+J2NcWRMpdPWmTw1hSaqXXR4hEzwZsSI0IVU2X3rjt2hJDV/DdjiixjshEe5qNjwvNV3q0s+2oa5E8uKOmvcjXlh8P5EFQ9MLw8VASj7IuNFSla1APSnUdultvlszLgZ1tAe5SXwn9o6kyBmYU72VGV0z1H6gFwQo4fG2ZnHScQyErvTHrwVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740495900; c=relaxed/relaxed;
	bh=SksBvCkZJsvM7Rmqh0mGEf+0QRJJwMrgdQAdOhKbL9I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XvYW85BgisMcX/m8XLSAPYsl0ThknwrSVLNs7FzcBS6dh3t1+vP7/CvExeuW6o3fTcD5E06f+dZPXGSK5TfLzAay8/4k5WQhHASWGRdpT8+fqfNfoiCTe97uui2pltFIeaScrkeWZ4PzgxcTOpMT8DLUFzV/AbwmVo4ZJtkUs2pp5YCmlyZVnEE6LepnsKhOBOy1BVKKgU6TyWk1yNBGYFx1T6VLGiNuwpVOg8m4oyUuzzNBF6MTFBTkqjhQ4+HVlvCubyeznW6yh5CEcf9v9rCnX8iWg2syYWy3mANnWzBrDgkbG1tzYHFgQF0dvq2wYgbjMTb2KODcaCCpfuT3ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Ccksf4x2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3gny9zwykda05rn0wpt11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Ccksf4x2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3gny9zwykda05rn0wpt11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2LVz04wqz30T1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 02:04:58 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so12372908a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 07:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740495897; x=1741100697; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SksBvCkZJsvM7Rmqh0mGEf+0QRJJwMrgdQAdOhKbL9I=;
        b=Ccksf4x2LXoVFZS+Up+Nwv3w9JV/1+Vfu0YqXaabT8MJ7KY/xx17xls23jfH0uPNXk
         Eku1j1/sWtyduLGlfwWXx+Kg/YoX0PV221OBI2DqVL4lvg0QNWgm6LbBRjGMypuUAP1Y
         GDqdZTUIvvLr22gH4+2yCE1PV0BhF+Lg5UWXYpGa2NQi7i6/cgAgQ696LqXk5fkMCA8f
         fmV+0yTmlEK0GubMP0pUh4uPU82alpR5js69pR9ZF36tqU6mt3KF5E9KKKHnXXu7nWQJ
         bulwrsOwNo+MyKPxxSDThYEASmGSSke7SZETGCCjTbDihSMEMcBfFk6PDIHbnLdvQZHY
         mk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740495897; x=1741100697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SksBvCkZJsvM7Rmqh0mGEf+0QRJJwMrgdQAdOhKbL9I=;
        b=lrsZJ4Xvjmp7kSz7w6EuNsWdHfVP6YfTOEAFBKy1B91z95XVP0UE4M3lu/9bRwsY8H
         xST6tZHcDy1whusJtkD2dzKhBQH0XhMVgVU/SKdAN3T7cECx4VsH0M6qOdNfhNTkaLUp
         +XilF+Lpo08+DAjFfKWpr+b1ybLIOtTXg6PL+vRhv5N7Zo+5LiMFl89OXGLNwPQgo+Mq
         FxoXkMmODy6mabfktWVcpiovW3jCxSxBHdpc7RZqjmzWS7SAWRKPXL7gfZmIU9maHSmv
         cd8QWdk4W2j1B6FCzG2xiC9AT/ZR2yFplzBk6Ah9iP/NtGxpqGd71ng6M5MvAajJIM6A
         m0rg==
X-Forwarded-Encrypted: i=1; AJvYcCUk+/3ND+A/K18kr1D9CywT8kezJlgP61qtl7irGUSwgWAxPimYl9W03U96SIek5c13Tq9sAvUTY9NAdGY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwN2IKBxvSXfltirUBJyypYvZKncheXlF7n8WbTkR7wjQGpKYoj
	rlE6IYC4q61SyMtlVPZSb7U9m9NNhTenjSiVjifkA2ynnKfKUeHTuNydKgvKj2L9XxyjDjzuZkB
	C8Q==
X-Google-Smtp-Source: AGHT+IGZHL7uZNM7BfQEbB7Kx7BtB5DxGYYXBfSiN251AAOj3wJWNSwzk9hwQvuFf2tqN0hxCASkCwncVrs=
X-Received: from pgmm27.prod.google.com ([2002:a05:6a02:551b:b0:ad5:4c6b:ab72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9d8f:b0:1f0:e430:43f8
 with SMTP id adf61e73a8af0-1f0fbff6f36mr6428815637.1.1740495896725; Tue, 25
 Feb 2025 07:04:56 -0800 (PST)
Date: Tue, 25 Feb 2025 07:04:55 -0800
In-Reply-To: <Z71072F7FMz5aq/Q@yzhao56-desk.sh.intel.com>
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
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <Z71072F7FMz5aq/Q@yzhao56-desk.sh.intel.com>
Message-ID: <Z73cF_pWIFMreOf5@google.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 25, 2025, Yan Zhao wrote:
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 58b82d6fd77c..045c61cc7e54 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -12890,11 +12890,11 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
> >  		mutex_unlock(&kvm->slots_lock);
> >  	}
> >  	kvm_unload_vcpu_mmus(kvm);
> > +	kvm_destroy_vcpus(kvm);
> >  	kvm_x86_call(vm_destroy)(kvm);
> >  	kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
> >  	kvm_pic_destroy(kvm);
> >  	kvm_ioapic_destroy(kvm);
> > -	kvm_destroy_vcpus(kvm);
> >  	kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
> >  	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
> >  	kvm_mmu_uninit_vm(kvm);
> After this change, now the sequence is that
> 
> 1. kvm_arch_pre_destroy_vm()
> 2. kvm_arch_destroy_vm()
>    2.1 kvm_destroy_vcpus()
>    2.2 .vm_destroy hook
>    2.3 kvm_mmu_uninit_vm() --> mirror root ref is 1 upon here. Zap the mirror
>                                root and reclaim SETP page table pages.
>    2.4 .vm_free hook
> 
> Since TDX needs to reclaim the TDR page after reclaiming all other pages, we
> currently added a vm_free hook at 2.4, after 2.3.
> 
> Could we move kvm_mmu_uninit_vm() before the .vm_destroy hook and after
> kvm_destroy_vcpus()?
> 
> Or move the .vm_destroy hook after kvm_mmu_uninit_vm(), e.g. after
> kvm_page_track_cleanup()?

I would go for the first option.  I'll tack on a patch since I need to test all
of these flows anyways, and I would much prefer to change course sooner rather
than later if it doesn't work for whatever reason.

Is this comment accurate?

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1e5f6f820c0b..f5685f153e08 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12874,13 +12874,19 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
                mutex_unlock(&kvm->slots_lock);
        }
        kvm_destroy_vcpus(kvm);
+
+       /*
+        * Do final MMU teardown prior to calling into vendor code.  All pages
+        * that were donated to the TDX module, e.g. for S-EPT tables, need to
+        * be reclaimed before the VM metadata page can be freed.
+        */
+       kvm_mmu_uninit_vm(kvm);
        kvm_x86_call(vm_destroy)(kvm);
        kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
        kvm_pic_destroy(kvm);
        kvm_ioapic_destroy(kvm);
        kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
        kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
-       kvm_mmu_uninit_vm(kvm);
        kvm_page_track_cleanup(kvm);
        kvm_xen_destroy_vm(kvm);
        kvm_hv_destroy_vm(kvm);

