Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A21A4162F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 18:22:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFgRv3pVpz30hw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 02:22:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F2xQ2SP6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F2xQ2SP6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=F2xQ2SP6; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=F2xQ2SP6; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFgR94NH2z2xX1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 02:21:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632414110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6pqfNeOt8tL2GBP0sFXaQoAOnZO3+YJ2VkaCjJ0uXk=;
 b=F2xQ2SP6V3MYVjNQtZqYohaQDQnTFzj0pSCnzVXKpBxqIgHjaFe/b3ajp2EUAfXTmB5dh3
 uW15PdNae+nRNDIyy3m1Ivd7AogVtN5kBpbHXb3cmpQRjnakwy5AcZP6BLpWxE7/XpxicT
 uybXjH9iC3EEtjJec7SLq3LZUctfZv0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632414110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6pqfNeOt8tL2GBP0sFXaQoAOnZO3+YJ2VkaCjJ0uXk=;
 b=F2xQ2SP6V3MYVjNQtZqYohaQDQnTFzj0pSCnzVXKpBxqIgHjaFe/b3ajp2EUAfXTmB5dh3
 uW15PdNae+nRNDIyy3m1Ivd7AogVtN5kBpbHXb3cmpQRjnakwy5AcZP6BLpWxE7/XpxicT
 uybXjH9iC3EEtjJec7SLq3LZUctfZv0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-NnQN5-DOPiODKNHeePSe7w-1; Thu, 23 Sep 2021 12:21:47 -0400
X-MC-Unique: NnQN5-DOPiODKNHeePSe7w-1
Received: by mail-ed1-f69.google.com with SMTP id
 r23-20020a50d697000000b003d824845066so7303925edi.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 09:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u6pqfNeOt8tL2GBP0sFXaQoAOnZO3+YJ2VkaCjJ0uXk=;
 b=FLkOKm0Mx8ERQTnqXBnSipMH98mCxi3PX68+vISZELLRt+wGd2LMEfBLfEG2tCkjAy
 9wnxcU2P1P4vcgwJqThqHTSspht43qHrNqNh9ZD/8Z7RhyP1prvet1nmAW7CY5NnUcME
 eR0VqMElck52HLKWDgjFPlFhShgu8t74kZk4K7ZfEEAq1TNYThGPZ0fcSoOdtHqsX3nc
 92hdY8ueJvPumVreooFYy3IrHSVxpP1nCbgF5LPgmFGsfTB57XY368LnuFHiVCpOgUnm
 o4fbZa1VUkh20XI6zCMGZ5V1BoZsmkBsqHFh9ueEJ+0I84CjjIbNaz0PQZwr1Dn4l+fw
 +K3w==
X-Gm-Message-State: AOAM530iWJldVCnhyFvRcEn4YCCDDeL942E1tUqZbt7xfPeUwx4NpUiS
 tE8cZWrS+IJC8CFR17jYyGmaT8LO4X3iCds7MrvPysv8SR8jtazx98GfazGAVKM5PyGsJ8OYJSl
 Gh3QqTDpVaQUKJAXfT9+07Xk9Dg==
X-Received: by 2002:a50:fb06:: with SMTP id d6mr6462177edq.31.1632414106417;
 Thu, 23 Sep 2021 09:21:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrEzjHXWR+VYrKJT7i95j45MgVWMJnN/dFXr62alQzAy8bfphi2nG6GFcipGwzTPlE6aJKZg==
X-Received: by 2002:a50:fb06:: with SMTP id d6mr6462153edq.31.1632414106210;
 Thu, 23 Sep 2021 09:21:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e13sm3352440eje.95.2021.09.23.09.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 09:21:45 -0700 (PDT)
Subject: Re: [PATCH 0/2] kvm: fix KVM_MAX_VCPU_ID handling
To: Juergen Gross <jgross@suse.com>, kvm@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
References: <20210913135745.13944-1-jgross@suse.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <75959861-6644-aa9a-5e81-a25f864d74ab@redhat.com>
Date: Thu, 23 Sep 2021 18:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913135745.13944-1-jgross@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Wanpeng Li <wanpengli@tencent.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/09/21 15:57, Juergen Gross wrote:
> Revert commit 76b4f357d0e7d8f6f00 which was based on wrong reasoning
> and rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS in order to avoid the
> same issue in future.
> 
> Juergen Gross (2):
>    x86/kvm: revert commit 76b4f357d0e7d8f6f00
>    kvm: rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS
> 
>   Documentation/virt/kvm/devices/xics.rst            | 2 +-
>   Documentation/virt/kvm/devices/xive.rst            | 2 +-
>   arch/mips/kvm/mips.c                               | 2 +-
>   arch/powerpc/include/asm/kvm_book3s.h              | 2 +-
>   arch/powerpc/include/asm/kvm_host.h                | 4 ++--
>   arch/powerpc/kvm/book3s_xive.c                     | 2 +-
>   arch/powerpc/kvm/powerpc.c                         | 2 +-
>   arch/x86/include/asm/kvm_host.h                    | 2 +-
>   arch/x86/kvm/ioapic.c                              | 2 +-
>   arch/x86/kvm/ioapic.h                              | 4 ++--
>   arch/x86/kvm/x86.c                                 | 2 +-
>   include/linux/kvm_host.h                           | 4 ++--
>   tools/testing/selftests/kvm/kvm_create_max_vcpus.c | 2 +-
>   virt/kvm/kvm_main.c                                | 2 +-
>   14 files changed, 17 insertions(+), 17 deletions(-)
> 

Queued, thanks.

Paolo

