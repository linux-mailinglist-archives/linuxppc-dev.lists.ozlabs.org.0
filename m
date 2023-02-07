Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E388068DDEB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 17:26:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PB7n55CJXz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 03:26:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Pp+tHvfQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Pp+tHvfQ;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB7m73vv7z2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 03:25:58 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id pj3so15546208pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 08:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yFM5Yaobs2Occpb2FR0i8/T7O2SHqwcz7pTe7Mef/v8=;
        b=Pp+tHvfQW77EcmLrVzwpDEqex9kxOQW9cn12Fjx4d+fa3xnEk2vJ9F9TkGkobSW19M
         dByP9frvRsbIXbXjb2efS9+tqXQpXjQlvNtr9Dm6bWnJbNDSU0wVSbvHfWOzRBBV7MqM
         NDJE8BNY79496tj5XtAn3OU83y+G4v4V1zB2E9OX09d6N6ckW16Dg78wZjBk0hsc09kz
         7ei8cbZqtgnhiXHAhi2n0YtWVuzllo2PPATJVCNy4QUf7eRc8IEgtqD8HzRUvKLnrIcT
         c48F0FOI6QHzfYPpZxExZKKYoBamCbPIloyEHea3WYpbTPvA8NCqtgBA6nIuN8/2I+8b
         50nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFM5Yaobs2Occpb2FR0i8/T7O2SHqwcz7pTe7Mef/v8=;
        b=g09CUsHgOwfkUimWKtk4nikxjOEb23I07mbb90c9+Q6Yuqm3LeutL+oFrnBbVGO6DZ
         gclNrRGwWeoSM2UnBHFDCzvX8qNuxYGs2kE4vMZhRXpGh3Uuu2YlkmjVNlposvfXyqkX
         yUYmsHmLn7lmAu9ztzFoNQgOvoRCvxcQBxmInJ2dPbAePydl51bcjwe7Z073pZagJKLI
         Fw2mZwpnds9CyOY4vGRBjjPKpUnAifIbQeySjrZoDWCOl9NwoncrL9LK8fVmp6RODJxY
         HWPwbc0ApazS+4c/I8rXWFDfodGwid73Rcb7codVRPUmW/q1woCEvSJGBrXa4OrmXLon
         3iVw==
X-Gm-Message-State: AO0yUKVpFGfb45s58V1y3WQfvi1Hevb0qmBPVfTpBxq+toqBHpq9uPL+
	yMKMRZLgbGRO9vk3YwKkadAXHg==
X-Google-Smtp-Source: AK7set98tqnb6UcqS0jXGArlNRvpmZM98md0FhgwG4ZnBzdTDS8Acb6IumbHidk9lfYERcSDh1kQSA==
X-Received: by 2002:a17:902:7c0b:b0:198:af4f:de0d with SMTP id x11-20020a1709027c0b00b00198af4fde0dmr206086pll.13.1675787154893;
        Tue, 07 Feb 2023 08:25:54 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id a23-20020aa78657000000b005a75d85c0c7sm1902879pfo.51.2023.02.07.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 08:25:54 -0800 (PST)
Date: Tue, 7 Feb 2023 16:25:50 +0000
From: Sean Christopherson <seanjc@google.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/7] KVM: x86: Improve return type handling in
 kvm_vm_ioctl_get_nr_mmu_pages()
Message-ID: <Y+J7jurSKEIeYEeM@google.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-3-thuth@redhat.com>
 <Y91JAb0kKBYQjO8a@google.com>
 <579f432d-6100-0ba1-5ba4-f72349ec9173@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <579f432d-6100-0ba1-5ba4-f72349ec9173@redhat.com>
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 07, 2023, Thomas Huth wrote:
> On 03/02/2023 18.48, Sean Christopherson wrote:
> > On Fri, Feb 03, 2023, Thomas Huth wrote:
> > > kvm_vm_ioctl_get_nr_mmu_pages() tries to return a "unsigned long" value,
> > > but its caller only stores ther return value in an "int" - which is also
> > > what all the other kvm_vm_ioctl_*() functions are returning. So returning
> > > values that do not fit into a 32-bit integer anymore does not work here.
> > > It's better to adjust the return type, add a sanity check and return an
> > > error instead if the value is too big.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   arch/x86/kvm/x86.c | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > > index da4bbd043a7b..caa2541833dd 100644
> > > --- a/arch/x86/kvm/x86.c
> > > +++ b/arch/x86/kvm/x86.c
> > > @@ -6007,8 +6007,11 @@ static int kvm_vm_ioctl_set_nr_mmu_pages(struct kvm *kvm,
> > >   	return 0;
> > >   }
> > > -static unsigned long kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
> > > +static int kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
> > >   {
> > > +	if (kvm->arch.n_max_mmu_pages > INT_MAX)
> > > +		return -EOVERFLOW;
> > > +
> > >   	return kvm->arch.n_max_mmu_pages;
> > >   }
> > 
> > My vote is to skip this patch, skip deprecation, and go straight to deleting
> > KVM_GET_NR_MMU_PAGES.  The ioctl() has never worked[*], and none of the VMMs I
> > checked use it (QEMU, Google's internal VMM, kvmtool, CrosVM).
> 
> I guess I'm living too much in the QEMU world where things need to be
> deprecated first before removing them ;-)

If KVM_GET_NR_MMU_PAGES actually worked or had users then I'd feel differently.
Anything we do to try and make this less awful is going to be an ABI change, so
we might as well go for broke.

> But sure, if everybody agrees that removing this directly is fine, too, I
> can do this in v2.
> 
>  Thomas
> 
> 
> PS: Has there ever been a discussion about the other deprecated interfaces
> in include/uapi/linux/kvm.h ? Most of the stuff there seems to be from 2009
> ... so maybe it's time now to remove that, too?

Not sure.  They aren't actually "deprecated" for most projects' definition of
"deprecated".  AFAICT, "deprecated" here means "removed, but with a placeholder
so that KVM doesn't reuse the old ioctl() number".

It probably makes sense to do the same for KVM_GET_NR_MMU_PAGES.  Yank out the
backing code but leave the ioctl() definition so that if there are users, they
get an explicit error code instead of random behavior, i.e. prevent KVM from
reusing the number in the near future.
