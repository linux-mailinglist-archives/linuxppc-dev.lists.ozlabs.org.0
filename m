Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F14B812168
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 23:26:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rmkb2yOD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rmkb2yOD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr97w1nLqz3cW0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 09:26:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rmkb2yOD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rmkb2yOD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mlevitsk@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr96z70XCz3c3K
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 09:26:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702506357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtHNIqYNLvneVefWnBC6zOfsKWdZrXaTN0MEXSsNlm4=;
	b=Rmkb2yODSi2De1AAGZTsceFTfeeBTexRdmVxK6k9A2AmIuIe6ba6KkKdMB5bQBBUSMNBwy
	hxzc5ewD84q5lO/6dzWIuMSkZivZSWsJAE4rLQ78O28AQyeP8/8AVD2tm12uWW3V4URhkN
	FJH7jc5KyW6m5rbryI++UG3MR90cvt4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702506357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtHNIqYNLvneVefWnBC6zOfsKWdZrXaTN0MEXSsNlm4=;
	b=Rmkb2yODSi2De1AAGZTsceFTfeeBTexRdmVxK6k9A2AmIuIe6ba6KkKdMB5bQBBUSMNBwy
	hxzc5ewD84q5lO/6dzWIuMSkZivZSWsJAE4rLQ78O28AQyeP8/8AVD2tm12uWW3V4URhkN
	FJH7jc5KyW6m5rbryI++UG3MR90cvt4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-v0aZFzLHMD258URPd50rYg-1; Wed, 13 Dec 2023 17:25:55 -0500
X-MC-Unique: v0aZFzLHMD258URPd50rYg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40c22bc1ebdso50825e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 14:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702506354; x=1703111154;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtHNIqYNLvneVefWnBC6zOfsKWdZrXaTN0MEXSsNlm4=;
        b=auy9ZWkgpJpD4upawaIKN7ZRNMb7Gxktzx9lgyHyPY0lEv2TgHDqXPX9tCe55tHnf3
         NeFQde5bxfnJ+jDpzMK5EUjD6W9aG4fiTWemUfvg86w3BzRCT2foygB3VpB6BruYTb3S
         KedcngCGQYd7ORnBfaF3DwiccPBACsilOfvo5Xh3ZxvAxWEhC4VCoH3eSebje9KtmljL
         m9lLMNwtYs0tnXTZic8CRrEPHYTGQl/CkwGAFq9RYkGOUXyKI9/BwPJ5+5VTcwKENOp1
         JycEWyQsWw+xX7CD5yB0APTjkwyFBPYj1rhWfaGhnub11cPZLHc7IHyKPLeSA4ddzexK
         7bLA==
X-Gm-Message-State: AOJu0Yy997gtNBw2T9i2XAZ/BnppFlU1//tm8g4kD4xn2l+FcehAgsQt
	tjY519mYgeX/gDpdt+9LsIO7KzoNe6PnQUULL3zvIym65YxTovGoCH7tewtL1V4UL5/uyjINFyB
	s8zTlQjUOkEvUrUTNtx90jF0PoQ==
X-Received: by 2002:a05:600c:518a:b0:40b:5e4a:2354 with SMTP id fa10-20020a05600c518a00b0040b5e4a2354mr4800775wmb.86.1702506354407;
        Wed, 13 Dec 2023 14:25:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGq5vSBS9iWIl4hhY+47LaF7O2e11U2yVs0UmGQ3dWeLwMn5yVhoe2ukGq+e6/HNoX4k1QrCw==
X-Received: by 2002:a05:600c:518a:b0:40b:5e4a:2354 with SMTP id fa10-20020a05600c518a00b0040b5e4a2354mr4800760wmb.86.1702506354019;
        Wed, 13 Dec 2023 14:25:54 -0800 (PST)
Received: from starship ([77.137.131.62])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm24509354wms.30.2023.12.13.14.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:25:53 -0800 (PST)
Message-ID: <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from
 kvm_vcpu_check_block()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Jim Mattson
 <jmattson@google.com>
Date: Thu, 14 Dec 2023 00:25:50 +0200
In-Reply-To: <ZXh8Nq_y_szj1WN0@google.com>
References: <20220921003201.1441511-11-seanjc@google.com>
	 <20231207010302.2240506-1-jmattson@google.com>
	 <ZXHw7tykubfG04Um@google.com>
	 <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
	 <ZXh8Nq_y_szj1WN0@google.com>
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
Cc: kvm@vger.kernel.org, david@redhat.com, atishp@atishpatra.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, imbrenda@linux.ibm.com, frankja@linux.ibm.com, maz@kernel.org, chenhuacai@kernel.org, palmer@dabbelt.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, suzuki.poulose@arm.com, paul.walmsley@sifive.com, alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, james.morse@arm.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-12-12 at 07:28 -0800, Sean Christopherson wrote:
> On Sun, Dec 10, 2023, Jim Mattson wrote:
> > On Thu, Dec 7, 2023 at 8:21 AM Sean Christopherson <seanjc@google.com> wrote:
> > > Doh.  We got the less obvious cases and missed the obvious one.
> > > 
> > > Ugh, and we also missed a related mess in kvm_guest_apic_has_interrupt().  That
> > > thing should really be folded into vmx_has_nested_events().
> > > 
> > > Good gravy.  And vmx_interrupt_blocked() does the wrong thing because that
> > > specifically checks if L1 interrupts are blocked.
> > > 
> > > Compile tested only, and definitely needs to be chunked into multiple patches,
> > > but I think something like this mess?
> > 
> > The proposed patch does not fix the problem. In fact, it messes things
> > up so much that I don't get any test results back.
> 
> Drat.
> 
> > Google has an internal K-U-T test that demonstrates the problem. I
> > will post it soon.
> 
> Received, I'll dig in soonish, though "soonish" might unfortunately might mean
> 2024.
> 

Hi,

So this is what I think:


KVM does have kvm_guest_apic_has_interrupt() for this exact purpose,
to check if nested APICv has a pending interrupt before halting.


However the problem is bigger - with APICv we have in essence 2 pending interrupt
bitmaps - the PIR and the IRR, and to know if the guest has a pending interrupt
one has in theory to copy PIR to IRR, then see if the max is larger then the current PPR.

Since we don't want to write to guest memory, and the IRR here resides in the guest memory,
I guess we have to do a 'dry-run' version of 'vmx_complete_nested_posted_interrupt' and call
it from  kvm_guest_apic_has_interrupt().

What do you think? I can prepare a patch for this.

Can you share a reproducer or write a new one that can be shared?

Best regards,
	Maxim Levitsky

