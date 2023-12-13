Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A22812201
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 23:45:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cpmQelrF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cpmQelrF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr9Y15V52z3cTg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 09:45:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cpmQelrF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cpmQelrF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mlevitsk@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr9X61S8Cz3cBG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 09:44:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702507458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJ/noKt4RR9yP36R44EoDN70UzFeuyznjnW/8U/CnAQ=;
	b=cpmQelrFh2kfK6YmAaEdPqt7RajsqRJSunkeJfJTASYW94TaRPxGBt+fOxSasRF2ErfZvi
	TW3qd5Yh3eisKlbeLrxWoYrpZKVqD2+KBIc+puJfCu6ZvF0wcEjBM3fzSsOikvm5CTq5NR
	g9mllIu7kG63mgYKm/fNqytDuVrI6BQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702507458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJ/noKt4RR9yP36R44EoDN70UzFeuyznjnW/8U/CnAQ=;
	b=cpmQelrFh2kfK6YmAaEdPqt7RajsqRJSunkeJfJTASYW94TaRPxGBt+fOxSasRF2ErfZvi
	TW3qd5Yh3eisKlbeLrxWoYrpZKVqD2+KBIc+puJfCu6ZvF0wcEjBM3fzSsOikvm5CTq5NR
	g9mllIu7kG63mgYKm/fNqytDuVrI6BQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-kecm5p2gNjy9qGpUqkaqjQ-1; Wed, 13 Dec 2023 17:44:17 -0500
X-MC-Unique: kecm5p2gNjy9qGpUqkaqjQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33342e25313so6240928f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 14:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702507456; x=1703112256;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJ/noKt4RR9yP36R44EoDN70UzFeuyznjnW/8U/CnAQ=;
        b=gBdnh5zQEJ7n07cYJxBKJ+lfJ828Uek4NzKElhe67PZEFKqIKhzWFUAjVntshtIAwB
         xDKGC2ESk1mDz8JDB9xbM2WKqUEfMtS8Or4gZVk8pdvHXqzla5d+fnQzQqm4Do238yoJ
         zsTPXZs+vfpyjxRw9rJH8p5PCFIMdxjaBpuSbczNihPgVCtKcTT7cVnG/s4vDjyJsySR
         xKbA61nLEo4gU4VXkCbqMompGz79zTG6nPPJB74xBrF+aC/eLuXVZ2uwDlf5A/FJVxRB
         EjmOYy1ZF9s1xQMkJhI1h5qh7v+cAdgupz+HBABkS2ArWU7VZyswSZrVzBhq/Q9QHIgb
         IRnw==
X-Gm-Message-State: AOJu0Yx8urjPuAx6Dlngum4vuipjGwc1sPZ21U2ZsjAwVgsU6TUx0RhE
	a3PgedhNq6oLjvN/Zqmycs1gk1sWTgvVT96BCKZiuK8kR9waNael+V32k8d9XX/R9oBZACRQVx3
	qQYbobvrhQ045OB2Y0365SrxxTQ==
X-Received: by 2002:a7b:cd91:0:b0:40c:3399:d5a0 with SMTP id y17-20020a7bcd91000000b0040c3399d5a0mr3902511wmj.100.1702507455966;
        Wed, 13 Dec 2023 14:44:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5EdNQIMrjofmVv1zrJdv8ykEuwHCs2ZxHKs/y4nPdIAePbusp9PWe8bHPWPpyIDEswd1Chw==
X-Received: by 2002:a7b:cd91:0:b0:40c:3399:d5a0 with SMTP id y17-20020a7bcd91000000b0040c3399d5a0mr3902490wmj.100.1702507455621;
        Wed, 13 Dec 2023 14:44:15 -0800 (PST)
Received: from starship ([77.137.131.62])
        by smtp.gmail.com with ESMTPSA id az23-20020a05600c601700b0040c0902dc22sm22569330wmb.31.2023.12.13.14.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:44:15 -0800 (PST)
Message-ID: <0c86e5ffb65f07cd3e444038d1f0ed39f0f4130a.camel@redhat.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from
 kvm_vcpu_check_block()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Jim Mattson <jmattson@google.com>
Date: Thu, 14 Dec 2023 00:44:12 +0200
In-Reply-To: <CALMp9eQ69dGSix-9pJdEtEw9T1Mqz9E1eaf1-yGP9k4_nMZogw@mail.gmail.com>
References: <20220921003201.1441511-11-seanjc@google.com>
	 <20231207010302.2240506-1-jmattson@google.com>
	 <ZXHw7tykubfG04Um@google.com>
	 <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
	 <ZXh8Nq_y_szj1WN0@google.com>
	 <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
	 <CALMp9eQ69dGSix-9pJdEtEw9T1Mqz9E1eaf1-yGP9k4_nMZogw@mail.gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, david@redhat.com, atishp@atishpatra.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, imbrenda@linux.ibm.com, frankja@linux.ibm.com, maz@kernel.org, chenhuacai@kernel.org, palmer@dabbelt.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, suzuki.poulose@arm.com, paul.walmsley@sifive.com, alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, james.morse@arm.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-12-13 at 14:31 -0800, Jim Mattson wrote:
> On Wed, Dec 13, 2023 at 2:25 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
> > On Tue, 2023-12-12 at 07:28 -0800, Sean Christopherson wrote:
> > > On Sun, Dec 10, 2023, Jim Mattson wrote:
> > > > On Thu, Dec 7, 2023 at 8:21 AM Sean Christopherson <seanjc@google.com> wrote:
> > > > > Doh.  We got the less obvious cases and missed the obvious one.
> > > > > 
> > > > > Ugh, and we also missed a related mess in kvm_guest_apic_has_interrupt().  That
> > > > > thing should really be folded into vmx_has_nested_events().
> > > > > 
> > > > > Good gravy.  And vmx_interrupt_blocked() does the wrong thing because that
> > > > > specifically checks if L1 interrupts are blocked.
> > > > > 
> > > > > Compile tested only, and definitely needs to be chunked into multiple patches,
> > > > > but I think something like this mess?
> > > > 
> > > > The proposed patch does not fix the problem. In fact, it messes things
> > > > up so much that I don't get any test results back.
> > > 
> > > Drat.
> > > 
> > > > Google has an internal K-U-T test that demonstrates the problem. I
> > > > will post it soon.
> > > 
> > > Received, I'll dig in soonish, though "soonish" might unfortunately might mean
> > > 2024.
> > > 
> > 
> > Hi,
> > 
> > So this is what I think:
> > 
> > 
> > KVM does have kvm_guest_apic_has_interrupt() for this exact purpose,
> > to check if nested APICv has a pending interrupt before halting.
> > 
> > 
> > However the problem is bigger - with APICv we have in essence 2 pending interrupt
> > bitmaps - the PIR and the IRR, and to know if the guest has a pending interrupt
> > one has in theory to copy PIR to IRR, then see if the max is larger then the current PPR.
> > 
> > Since we don't want to write to guest memory, and the IRR here resides in the guest memory,
> > I guess we have to do a 'dry-run' version of 'vmx_complete_nested_posted_interrupt' and call
> > it from  kvm_guest_apic_has_interrupt().
> > 
> > What do you think? I can prepare a patch for this.
> > 
> > Can you share a reproducer or write a new one that can be shared?
> 
> See https://lore.kernel.org/kvm/20231211185552.3856862-1-jmattson@google.com/.

Thank you!

Best regards,
	Maxim Levitsky

> 
> > Best regards,
> >         Maxim Levitsky
> > 


