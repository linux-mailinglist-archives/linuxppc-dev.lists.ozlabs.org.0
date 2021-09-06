Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B126B4019C6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 12:29:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H34Pv4QwJz2yn5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 20:29:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JWOOTgL2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JWOOTgL2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JWOOTgL2; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JWOOTgL2; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H34P56pMmz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Sep 2021 20:28:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630924098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REmJl8s2nvMdTdbKRVVIcDfYVEbx2wjp9XTagCASYqs=;
 b=JWOOTgL22CHRL5eRJBr1q74J/CuydgoUvEr0CwRgw7M23jupZhUS5o4dBG8v4O/6/DL9DC
 kIbRNtJ+y2g4j71NZDw6fadqls/G2v2PRK9VbXjislIJ6EzDOtEFoLthZoVfc81+ags1gl
 xIOLU1MZ13uDFOafFbqiqr+xo8jbDmA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630924098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REmJl8s2nvMdTdbKRVVIcDfYVEbx2wjp9XTagCASYqs=;
 b=JWOOTgL22CHRL5eRJBr1q74J/CuydgoUvEr0CwRgw7M23jupZhUS5o4dBG8v4O/6/DL9DC
 kIbRNtJ+y2g4j71NZDw6fadqls/G2v2PRK9VbXjislIJ6EzDOtEFoLthZoVfc81+ags1gl
 xIOLU1MZ13uDFOafFbqiqr+xo8jbDmA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-vJvyy00ANYW3Ydto1KQT4w-1; Mon, 06 Sep 2021 06:28:16 -0400
X-MC-Unique: vJvyy00ANYW3Ydto1KQT4w-1
Received: by mail-ej1-f70.google.com with SMTP id
 cf17-20020a170906b2d100b005d42490f86bso2166770ejb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Sep 2021 03:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=REmJl8s2nvMdTdbKRVVIcDfYVEbx2wjp9XTagCASYqs=;
 b=rLknVhMMAebgOOli3Rt6m30S2KUnrG3IqACQugMFp4Pxwv4xl64IeTaDg1SNzpWQ0K
 XBTbpWlywenVbHyvhn9W4vkUe7EMCppTQprbVpnJOu0PByq3dP63rPO0KNnYvykGAU0o
 G/wUQKIpPESifbn4xbdADZmj3pXNWXhV30R3tCj4tpoyf6j8D/UD2z+AWF03xz9TMqzf
 hqEyAGrY3NojtkntZ5x+jdSXWxx75ZXuaV+ew7Ofo7S7BdZD9RWB7RmvQIjdrwGOBqjU
 Ur2h5LykcaIhJJuIR6DqDufbw4N9eJgwAPAK30yDe57sj9N7bPKYrqR/SfCYPoVPKKFg
 i7yg==
X-Gm-Message-State: AOAM5325mJLMz3HX/wK9lV+hb+djhuM4BVgsB3livszTjagQKxTBHp4g
 ZtO31XtpLvQ6JU4Geh1w+j4XlsbRY1JqvB/YTAqEr+ugEHG64ChE4D5maYN0Q29wUePLE48qQrZ
 WJd9kOoHT2J0ERPKe0evBUxyVkA==
X-Received: by 2002:a17:906:1d19:: with SMTP id
 n25mr13007260ejh.11.1630924095430; 
 Mon, 06 Sep 2021 03:28:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7T8yPC7CUEnqP8Q5KGyfYQsTy7fdIFm0w0WX7OHu/0lN1pf6u81fhziGWQVchhgc+jbFRRA==
X-Received: by 2002:a17:906:1d19:: with SMTP id
 n25mr13007231ejh.11.1630924095200; 
 Mon, 06 Sep 2021 03:28:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h7sm4431526edr.4.2021.09.06.03.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 03:28:14 -0700 (PDT)
Subject: Re: [PATCH 1/5] KVM: rseq: Update rseq when processing NOTIFY_RESUME
 on xfer to KVM guest
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sean Christopherson <seanjc@google.com>
References: <20210818001210.4073390-1-seanjc@google.com>
 <20210818001210.4073390-2-seanjc@google.com>
 <1673583543.19718.1629409152244.JavaMail.zimbra@efficios.com>
 <YR7tzZ98XC6OV2vu@google.com>
 <1872633041.20290.1629485463253.JavaMail.zimbra@efficios.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <425456d3-4772-2a1b-9cf3-a5b750b95c2e@redhat.com>
Date: Mon, 6 Sep 2021 12:28:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1872633041.20290.1629485463253.JavaMail.zimbra@efficios.com>
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
Cc: KVM list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-kselftest <linux-kselftest@vger.kernel.org>,
 Ben Gardon <bgardon@google.com>, shuah <shuah@kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, gor <gor@linux.ibm.com>,
 "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 linux-csky <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-mips <linux-mips@vger.kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 paulmck <paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Foley <pefoley@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-kernel <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/08/21 20:51, Mathieu Desnoyers wrote:
>> Ah, or is it the case that rseq_cs is non-NULL if and only if userspace is in an
>> rseq critical section, and because syscalls in critical sections are illegal, by
>> definition clearing rseq_cs is a nop unless userspace is misbehaving.
> Not quite, as I described above. But we want it to stay set so the CONFIG_DEBUG_RSEQ
> code executed when returning from ioctl to userspace will be able to validate that
> it is not nested within a rseq critical section.
> 
>> If that's true, what about explicitly checking that at NOTIFY_RESUME?  Or is it
>> not worth the extra code to detect an error that will likely be caught anyways?
> The error will indeed already be caught on return from ioctl to userspace, so I
> don't see any added value in duplicating this check.

Sean, can you send a v2 (even for this patch only would be okay)?

Thanks,

Paolo

