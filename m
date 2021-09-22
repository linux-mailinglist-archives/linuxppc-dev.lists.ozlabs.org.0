Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94084414B8C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:14:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF0ff3SNHz3057
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:14:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BZuED+Mb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BZuED+Mb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BZuED+Mb; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BZuED+Mb; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF0dv72fcz2xYS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:13:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632320032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZMdBUFCcEro44m/VYQjrdo8tgcAaj3vpqrRJk30Xe4=;
 b=BZuED+MbudZn+lf3cDV48hg4LPlGm/B9Ghhcoi4K8IBC2PAQJTHVdkxh1dbMeQmpImKwB8
 7D508gZwwrvKASL2UcG59nRDrvYftCjhTpSa50jEk9wAj9wzuZGmr1DM/S1Tk50Nbh+URZ
 B8t++2N6h1C2fLOvjhEPP9o77lBlbMg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632320032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZMdBUFCcEro44m/VYQjrdo8tgcAaj3vpqrRJk30Xe4=;
 b=BZuED+MbudZn+lf3cDV48hg4LPlGm/B9Ghhcoi4K8IBC2PAQJTHVdkxh1dbMeQmpImKwB8
 7D508gZwwrvKASL2UcG59nRDrvYftCjhTpSa50jEk9wAj9wzuZGmr1DM/S1Tk50Nbh+URZ
 B8t++2N6h1C2fLOvjhEPP9o77lBlbMg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-BPTO1pr_OtCGJc_A4V3twg-1; Wed, 22 Sep 2021 10:12:43 -0400
X-MC-Unique: BPTO1pr_OtCGJc_A4V3twg-1
Received: by mail-ed1-f71.google.com with SMTP id
 w24-20020a056402071800b003cfc05329f8so3193326edx.19
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rZMdBUFCcEro44m/VYQjrdo8tgcAaj3vpqrRJk30Xe4=;
 b=PQJP+5r0m/r/+j1wuCvc4OIHRRV9tj223BLFuj59kJKXIb9I5JKReb3JBBgRztZ1DF
 onBzTzECMk0JdKD1elwZSNjcXxT13mt75MNVSBlFeWO/Zz6Mz0XUoFkifAsafpuqQcT7
 JnLrrvq5KpMVqNw4YXPjeCXDXenJc8p303K9ZtnBeWUVuVmhecHK0iw27KP7LBI3x2hV
 xq9M4PXtYgRLpFMMKrRdO2TjCSJ4IUqSq8onSTuM36D2x2OCPMxbUSKjk9FYbI6XFbT9
 6XMvCWdzUqRJPrUhUi3Os/XBA1V4FJiHiqb8Qs+a/XB8hTcVHKHtIi7cSjTozQ+xCGgz
 qKeA==
X-Gm-Message-State: AOAM530zXsiGEsempV4AU5Qwhr6KaIyEeIjr6tJ2+IJoNa95u9txLk5t
 YhFqvHl5sRH/CB1nLiMgfAIFKg+VwYIpCq8Bm8Fc+IeS85/5Ka1MkKfPSaNSlubHqlFRHUFjObf
 TRqS1qnIV29Rk9wT17zuX3Tli4Q==
X-Received: by 2002:a17:906:b183:: with SMTP id
 w3mr41217053ejy.394.1632319961897; 
 Wed, 22 Sep 2021 07:12:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDM/LAO92AMI8uC+ZsdL5tg3HWsAwfnbY471GXtr9Lv9ROvDMZHXi9azcQssuJ/zXZcmQ7Nw==
X-Received: by 2002:a17:906:b183:: with SMTP id
 w3mr41217031ejy.394.1632319961680; 
 Wed, 22 Sep 2021 07:12:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n23sm393858edw.75.2021.09.22.07.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 07:12:41 -0700 (PDT)
Subject: Re: [PATCH 0/5] KVM: rseq: Fix and a test for a KVM+rseq bug
To: Sean Christopherson <seanjc@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Shuah Khan <shuah@kernel.org>
References: <20210818001210.4073390-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <430684f9-1b35-b6f1-f243-6298e892bc7a@redhat.com>
Date: Wed, 22 Sep 2021 16:12:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818001210.4073390-1-seanjc@google.com>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, Peter Foley <pefoley@google.com>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, Shakeel Butt <shakeelb@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18/08/21 02:12, Sean Christopherson wrote:
> Patch 1 fixes a KVM+rseq bug where KVM's handling of TIF_NOTIFY_RESUME,
> e.g. for task migration, clears the flag without informing rseq and leads
> to stale data in userspace's rseq struct.
> 
> Patch 2 is a cleanup to try and make future bugs less likely.  It's also
> a baby step towards moving and renaming tracehook_notify_resume() since
> it has nothing to do with tracing.  It kills me to not do the move/rename
> as part of this series, but having a dedicated series/discussion seems
> more appropriate given the sheer number of architectures that call
> tracehook_notify_resume() and the lack of an obvious home for the code.
> 
> Patch 3 is a fix/cleanup to stop overriding x86's unistd_{32,64}.h when
> the include path (intentionally) omits tools' uapi headers.  KVM's
> selftests do exactly that so that they can pick up the uapi headers from
> the installed kernel headers, and still use various tools/ headers that
> mirror kernel code, e.g. linux/types.h.  This allows the new test in
> patch 4 to reference __NR_rseq without having to manually define it.
> 
> Patch 4 is a regression test for the KVM+rseq bug.
> 
> Patch 5 is a cleanup made possible by patch 3.
> 
> 
> Sean Christopherson (5):
>    KVM: rseq: Update rseq when processing NOTIFY_RESUME on xfer to KVM
>      guest
>    entry: rseq: Call rseq_handle_notify_resume() in
>      tracehook_notify_resume()
>    tools: Move x86 syscall number fallbacks to .../uapi/
>    KVM: selftests: Add a test for KVM_RUN+rseq to detect task migration
>      bugs
>    KVM: selftests: Remove __NR_userfaultfd syscall fallback
> 
>   arch/arm/kernel/signal.c                      |   1 -
>   arch/arm64/kernel/signal.c                    |   1 -
>   arch/csky/kernel/signal.c                     |   4 +-
>   arch/mips/kernel/signal.c                     |   4 +-
>   arch/powerpc/kernel/signal.c                  |   4 +-
>   arch/s390/kernel/signal.c                     |   1 -
>   include/linux/tracehook.h                     |   2 +
>   kernel/entry/common.c                         |   4 +-
>   kernel/rseq.c                                 |   4 +-
>   .../x86/include/{ => uapi}/asm/unistd_32.h    |   0
>   .../x86/include/{ => uapi}/asm/unistd_64.h    |   3 -
>   tools/testing/selftests/kvm/.gitignore        |   1 +
>   tools/testing/selftests/kvm/Makefile          |   3 +
>   tools/testing/selftests/kvm/rseq_test.c       | 131 ++++++++++++++++++
>   14 files changed, 143 insertions(+), 20 deletions(-)
>   rename tools/arch/x86/include/{ => uapi}/asm/unistd_32.h (100%)
>   rename tools/arch/x86/include/{ => uapi}/asm/unistd_64.h (83%)
>   create mode 100644 tools/testing/selftests/kvm/rseq_test.c
> 

Queued v3, thanks.  I'll send it in a separate pull request to Linus 
since it touches stuff outside my usual turf.

Thanks,

Paolo

