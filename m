Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9016775B232
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 17:15:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=zTnr2gXY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6GTt3fLdz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 01:15:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=zTnr2gXY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3au-5zaykdboi40d926ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6GSx2wj0z30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 01:14:55 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c0f35579901so791795276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 08:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689866089; x=1690470889;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jyO/GZcznauRS+IxFjefkQ411ageTxV8Pq4vykaVGvo=;
        b=zTnr2gXYIfqrhSL0WP50qLuqh3ZSH0gfVOnKmqwBvWYCge11/urc6Mcz48DQC5VeI6
         s/bgjrFlzBMXd0PxaHBdxoR2ZqKrVqjnkCnhcQbbSnTvJYQ3aBe8wGkYdi1iCIBydfGh
         kDBro1Ztm9Xs7cfFTvZ7Ey8Gxe05PCCIDn4nx9L+2nwHbFPbro9d3jap/zFGaLY9lF26
         GO0Vu5OUt+nUmBQOwJoSD8n40MC7ZQXlXpaj59Y1nIZxZy5/TzmEdTKZZXkcpmTSKYdO
         Y0fmzsgj8zCYsvUdMgpPWIv3Ur8RBp8NDUrrxEURomdLy8NcckIjCEtpSXTS4KS2mzFS
         29+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689866089; x=1690470889;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyO/GZcznauRS+IxFjefkQ411ageTxV8Pq4vykaVGvo=;
        b=QSygwMYTjVA93ExJ2oNL3gccQya5pJrVwX9aV98fi3lccHQYPCKRAUYfk/Sft0DXX6
         RhVo7glblR37Q0siIB4fQxanGXftXNb9nU1OBwbEvzwNR7vMB7Wz20w3jQk4aMyRlNSR
         LIWkyhQCr/70E4fe79DwV45oHUKsp1BTwOyiXmUotIdqIv7406QoKawc0NqgVkANI8Ov
         AA5x27wjRLoNhkf/NEm6YQNXliTmbkh8DLb0QxjoL83OEuQawVxtrbqMO961Joik1pe7
         LjRKPAcb4KbvdYiEJuYREAXGth/ANh77R1DUvD7ltEE/heuMa67J4qLc1u9nCXyi5K4i
         SDFQ==
X-Gm-Message-State: ABy/qLbM2iIT+KpNQG5bGS05kw2s2Urrrr9LLQmL+0825y73wWjtuc5r
	bJTwxtddwbZPzDswdR3votO5s140SgM=
X-Google-Smtp-Source: APBJJlHgB47FmXfk0Rt+Hyu6ZgRaD/aSiXUWbAQerG5WzFKE3pY5cKaePpzhb9OPvUF/5F0XHeWF4GbW2oc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:a105:0:b0:c65:8983:ac2 with SMTP id
 z5-20020a25a105000000b00c6589830ac2mr17912ybh.5.1689866089303; Thu, 20 Jul
 2023 08:14:49 -0700 (PDT)
Date: Thu, 20 Jul 2023 08:14:47 -0700
In-Reply-To: <83eb5c50-7287-7845-ffc3-a7c58e638ea5@intel.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <83eb5c50-7287-7845-ffc3-a7c58e638ea5@intel.com>
Message-ID: <ZLlLx7wkE6iPTIcI@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 20, 2023, Xiaoyao Li wrote:
> On 7/19/2023 7:44 AM, Sean Christopherson wrote:
> > @@ -5134,6 +5167,16 @@ static long kvm_vm_ioctl(struct file *filp,
> >   	case KVM_GET_STATS_FD:
> >   		r = kvm_vm_ioctl_get_stats_fd(kvm);
> >   		break;
> > +	case KVM_CREATE_GUEST_MEMFD: {
> > +		struct kvm_create_guest_memfd guest_memfd;
> > +
> > +		r = -EFAULT;
> > +		if (copy_from_user(&guest_memfd, argp, sizeof(guest_memfd)))
> > +			goto out;
> > +
> > +		r = kvm_gmem_create(kvm, &guest_memfd);
> > +		break;
> > +	}
> 
> Does it need a new CAP to indicate the support of guest_memfd?

Yeah, I meant to add that to the TODO list and forgot (obviously).

> This is patch series introduces 3 new CAPs and it seems any one of them can
> serve as the indicator of guest_memfd.
> 
> +#define KVM_CAP_USER_MEMORY2 230
> +#define KVM_CAP_MEMORY_ATTRIBUTES 231
> +#define KVM_CAP_VM_TYPES 232

The number of new caps being added is the main why I didn't just add another one.
On the other hand, we have room for a few billion caps, so one more isn't a big
deal.  So yeah, KVM_CAP_GUEST_MEMFD is probably the way to go.
