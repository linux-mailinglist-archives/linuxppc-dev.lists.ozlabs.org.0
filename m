Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D003668A0CA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 18:49:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7jpg4yYMz3fBw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 04:49:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YUGCo4Zb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YUGCo4Zb;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7jnl0112z2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 04:48:57 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so5020185pjp.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 09:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1t48P/jVd6+3dhw3pck4JM1odaqwThYt8bjKIe9FySY=;
        b=YUGCo4ZbvxduWRBHH9xOGxUv8LoaXyN+VOL8K8Kve/u16uDaalEXH+kBO1C3PAOZdM
         U2FdeDmTEYvv/Khm9Hp1pGOcZfLi1gl8qmki4SmGN3WfKIsCemaDy6HsGXS8a2DwuvSq
         p7nNVpP/rnqBe+1jiPBY7eVjGaGnTjSVk5H8VHlpO4DlQHD7k1TC35BcdqTcy2ZQRaSF
         4md/KQ7IeYFOS2FYZ+qMRDUx2NMJplrAtBdVvGxGX0DbpsM7eAfg2iIiZtKPhF8ngclz
         nFNAH/NrZwg3lKNjgzMI4QsgFt81DdqqGb/JrZPeZ3VqGuwxbqlyijT98K4d4Jb58ATa
         yKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t48P/jVd6+3dhw3pck4JM1odaqwThYt8bjKIe9FySY=;
        b=VRkuiKY5Lf6QyJp8HzNxNTvQ2VafnSZuQMIqoY3wZVQ5I7wTbY0a7jVkMOrdLtVhLL
         JAEGKkWySoQs9OrD6v5oku8EalEQpWsndY1bfv13du3+D9xGcyZ6rndK314/fgvL1fi1
         8JMocCZFytRIg8FVZRQWl6xT9MRZN21isdy45CZc4LUUwaw5uFwQ19+vRhxijX28JpVU
         xBR7j+JpWxBoEENAzP3pWQ5DSPaM6bUPXumOHJIIlUqUKmG4PT5DPbtbhqqjLDWwK3mz
         wOrHoPLcmbkDSVN482pJI5MDJofNP7rDwfiBT31jZwGuG5iFuY38oiTm+zoTlcPn0hyd
         FQ3w==
X-Gm-Message-State: AO0yUKVfX+6A3ISH6EVRmnJ3Fmjevx0XabkChcXtVriEq023CnUxrHJf
	6SWIEYZbCXOV+Y2ps0ISQ4C40Q==
X-Google-Smtp-Source: AK7set8NtYpsGJ6byRewhpDzAYHCL4kVnwYOuRswQz6j6iO+lQNMoz+KA+gf7NkDr7m6tVMm7U3Fmg==
X-Received: by 2002:a17:902:d1d5:b0:198:d5cc:44a8 with SMTP id g21-20020a170902d1d500b00198d5cc44a8mr260726plb.19.1675446534414;
        Fri, 03 Feb 2023 09:48:54 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709027e0200b00194b3a7853esm1865998plm.181.2023.02.03.09.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:48:53 -0800 (PST)
Date: Fri, 3 Feb 2023 17:48:49 +0000
From: Sean Christopherson <seanjc@google.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/7] KVM: x86: Improve return type handling in
 kvm_vm_ioctl_get_nr_mmu_pages()
Message-ID: <Y91JAb0kKBYQjO8a@google.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203094230.266952-3-thuth@redhat.com>
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

On Fri, Feb 03, 2023, Thomas Huth wrote:
> kvm_vm_ioctl_get_nr_mmu_pages() tries to return a "unsigned long" value,
> but its caller only stores ther return value in an "int" - which is also
> what all the other kvm_vm_ioctl_*() functions are returning. So returning
> values that do not fit into a 32-bit integer anymore does not work here.
> It's better to adjust the return type, add a sanity check and return an
> error instead if the value is too big.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  arch/x86/kvm/x86.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index da4bbd043a7b..caa2541833dd 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -6007,8 +6007,11 @@ static int kvm_vm_ioctl_set_nr_mmu_pages(struct kvm *kvm,
>  	return 0;
>  }
>  
> -static unsigned long kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
> +static int kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
>  {
> +	if (kvm->arch.n_max_mmu_pages > INT_MAX)
> +		return -EOVERFLOW;
> +
>  	return kvm->arch.n_max_mmu_pages;
>  }

My vote is to skip this patch, skip deprecation, and go straight to deleting
KVM_GET_NR_MMU_PAGES.  The ioctl() has never worked[*], and none of the VMMs I
checked use it (QEMU, Google's internal VMM, kvmtool, CrosVM).

[*] https://lore.kernel.org/all/YpZu6%2Fk+8EydfBKf@google.com
