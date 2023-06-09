Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD45729430
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 11:07:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcwFG1SVTz3f4W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 19:06:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EpEzYbuF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EpEzYbuF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EpEzYbuF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EpEzYbuF;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcwDL0kLwz3dwg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 19:06:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686301567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyj9qAaMTXhV0BDBMXgw3bkhoC43Djt8OMEq06UECOo=;
	b=EpEzYbuFJzJ16t3cdUerq6nBDlvoivWJ3MML+Iyfnbd9IV1J+lbRAWAGTC/WE/nnuDkpl6
	tmgga0QiW/vgwKCuBiGxXIdelZsc6ZbDhUQFR4otrSRuKhUIV059Ykvp0/WPBjZhMP/X8X
	lxRNrnwMOi2/nlWxG1ZLVtp2G0u1jZM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686301567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyj9qAaMTXhV0BDBMXgw3bkhoC43Djt8OMEq06UECOo=;
	b=EpEzYbuFJzJ16t3cdUerq6nBDlvoivWJ3MML+Iyfnbd9IV1J+lbRAWAGTC/WE/nnuDkpl6
	tmgga0QiW/vgwKCuBiGxXIdelZsc6ZbDhUQFR4otrSRuKhUIV059Ykvp0/WPBjZhMP/X8X
	lxRNrnwMOi2/nlWxG1ZLVtp2G0u1jZM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-umj4nF91PuyG77lMX5ZfPQ-1; Fri, 09 Jun 2023 05:06:06 -0400
X-MC-Unique: umj4nF91PuyG77lMX5ZfPQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-514abe67064so1519858a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 02:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686301565; x=1688893565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyj9qAaMTXhV0BDBMXgw3bkhoC43Djt8OMEq06UECOo=;
        b=Dt0uQ3DiorHar3ZqM3fjvwtkWmHNFSHA77SezG5xHDNb3nyJJR2l2xxPh7mAFIok/T
         /s8C/EbOD2rfHnwWGDDR5N4adZ0el0YJ2gv3mYzsKZHLU/tx9cw6aISt8KxIjfywIMkC
         HOF2/KvkWzEUCe63CQB0SBjS8sV4wQza48eXv6uwuvJPxLvOwp/C60dW5M83JwOsNfKy
         WwFMg5UW7Cv3JWfnl1JvlaiV89ndQHRVqnmFUBxvoMbyS6+2BE4wXq54oFSB1RaCsq8L
         yFE1qYDGDX2jlwSx2F3MuGIleDVAr2tqu0yXpUjyOHy7neV74bE+XsyX/RPMjWGsa7i0
         8/9g==
X-Gm-Message-State: AC+VfDzQnpXfBsg698XlUizp6YzVFyXgdpZZB+xeDxkaQagYAWIf3tPt
	LEbdI9bosc5p3MxtJ6ge0OVAImn3fweyCW97gihaK7zyAIfOsguY9whv51yV7C5LwHBK27L7v4z
	xZcAIfEEYkEOybzM+akbW8wV7VA==
X-Received: by 2002:a05:6402:643:b0:510:82b4:844d with SMTP id u3-20020a056402064300b0051082b4844dmr902460edx.2.1686301565419;
        Fri, 09 Jun 2023 02:06:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Eo2fL8sg8ZAFF9ExDb1hoz+RWsXilNiiceAqQ1jh6YF+h+q2Lb+V5P8mQdJn5E/+DPP6p2g==
X-Received: by 2002:a05:6402:643:b0:510:82b4:844d with SMTP id u3-20020a056402064300b0051082b4844dmr902445edx.2.1686301565157;
        Fri, 09 Jun 2023 02:06:05 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id f9-20020a056402068900b0051495ce23absm1517006edy.10.2023.06.09.02.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 02:06:04 -0700 (PDT)
Message-ID: <f0fc6e43-ffe3-dc38-03c1-77b2105cd0fb@redhat.com>
Date: Fri, 9 Jun 2023 11:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH mm-unstable v2 09/10] kvm/x86: add
 kvm_arch_test_clear_young()
To: Yu Zhao <yuzhao@google.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-10-yuzhao@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230526234435.662652-10-yuzhao@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fab
 iano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/27/23 01:44, Yu Zhao wrote:
> +#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
> +static inline bool kvm_arch_has_test_clear_young(void)
> +{
> +	return IS_ENABLED(CONFIG_X86_64) &&
> +	       (!IS_REACHABLE(CONFIG_KVM) || (tdp_mmu_enabled && shadow_accessed_mask));
> +}

I don't think you need IS_REACHABLE(CONFIG_KVM) here, it would be a bug 
if this is called from outside KVM code.

Maybe make it a BUILD_BUG_ON?

Paolo

