Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9F5729432
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 11:08:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcwHX21L2z3fBX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 19:08:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bvcrHG1M;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bvcrHG1M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bvcrHG1M;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bvcrHG1M;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcwGc6pkDz3c71
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 19:08:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686301686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+lS4qtD2LImPdpu4Ozd1FIICWXob78VQWCuBmNpNqeU=;
	b=bvcrHG1MYQheEk3zspb40bXo5mhVKRFPwiTXbQ2yF37EL4JJ5/yUhyyKDsodAs6xQ/acNg
	Im01UL1neLLLfwp1Dk+RufSCBLHTOayyT7iLWQf9oS+c+eEGEsXlB74Faisf0v2Yo0pr1Z
	8r66UCr26YjbouEWaaVAjf7LN8M4nLc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686301686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+lS4qtD2LImPdpu4Ozd1FIICWXob78VQWCuBmNpNqeU=;
	b=bvcrHG1MYQheEk3zspb40bXo5mhVKRFPwiTXbQ2yF37EL4JJ5/yUhyyKDsodAs6xQ/acNg
	Im01UL1neLLLfwp1Dk+RufSCBLHTOayyT7iLWQf9oS+c+eEGEsXlB74Faisf0v2Yo0pr1Z
	8r66UCr26YjbouEWaaVAjf7LN8M4nLc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-8S9ZSiGnN7eJEgKrR3vfNg-1; Fri, 09 Jun 2023 05:08:02 -0400
X-MC-Unique: 8S9ZSiGnN7eJEgKrR3vfNg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a341efd9aso186737766b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 02:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686301681; x=1688893681;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lS4qtD2LImPdpu4Ozd1FIICWXob78VQWCuBmNpNqeU=;
        b=bQ2ieuhQVTdSTGrYue3m/2nA59/14l1rgbQAfChiOI9gB/87UieROess2MSdqPDU42
         qrM/MiPtQOcpr9N7PyAvzhxIDPLea3G5+aSFR8viG05U1eV+r7L9hzKMFYXTYYfHd8ta
         sU9UBHsygvqnf6viCrMfzQerLob2puSDPJKUNVjfW769MrJkwJ0WR+lFWHimWb/Gc+vZ
         nPykJtTvWxRihoZ6G/6WYYyCvLbniw1j2kpOBS4tUXIajutxcoDOJw05PohJftQ7HED2
         E4pZpVYf+I5cQTzIqFoWUtZbAh2RBBEAffGIl+NtcdTedxnikC4NYLUgxBh5lvgtF2XA
         3SQw==
X-Gm-Message-State: AC+VfDyo0kAYxJ9rsg4+0q9IFACBdMpp6HgR8UOBtACYt7hpbxbbwTXu
	YFNfpUoqIIxe/DMWIKzj9O5/PEBbTgOL+wNNa/C8dQg2jeGEJjvOdy/ZiYIKGTN9/oUMNCv+Jrd
	Pcu2Go5m3ZaH6AlGSJQ34Tzzz0g==
X-Received: by 2002:a17:907:94cb:b0:97a:e0c0:2f8f with SMTP id dn11-20020a17090794cb00b0097ae0c02f8fmr315203ejc.65.1686301681485;
        Fri, 09 Jun 2023 02:08:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6fk08I4RsyK9p9wcnjDRbMYLy3XBaoHlqt3xl1DLkFDODgHMHCV4XPzuR/CPTVwoW0y6Qefw==
X-Received: by 2002:a17:907:94cb:b0:97a:e0c0:2f8f with SMTP id dn11-20020a17090794cb00b0097ae0c02f8fmr315171ejc.65.1686301681128;
        Fri, 09 Jun 2023 02:08:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id z8-20020a1709067e4800b00977ecf6942bsm1036209ejr.90.2023.06.09.02.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 02:08:00 -0700 (PDT)
Message-ID: <26cf0b0a-cda5-08a9-a669-6966f9e626b1@redhat.com>
Date: Fri, 9 Jun 2023 11:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Yu Zhao <yuzhao@google.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20230526234435.662652-1-yuzhao@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH mm-unstable v2 00/10] mm/kvm: locklessly clear the
 accessed bit
In-Reply-To: <20230526234435.662652-1-yuzhao@google.com>
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
> TLDR
> ====
> This patchset adds a fast path to clear the accessed bit without
> taking kvm->mmu_lock. It can significantly improve the performance of
> guests when the host is under heavy memory pressure.
> 
> ChromeOS has been using a similar approach [1] since mid 2021 and it
> was proven successful on tens of millions devices.
> 
> This v2 addressed previous requests [2] on refactoring code, removing
> inaccurate/redundant texts, etc.
> 
> [1]https://crrev.com/c/2987928
> [2]https://lore.kernel.org/r/20230217041230.2417228-1-yuzhao@google.com/

 From the KVM point of view the patches look good (though I wouldn't 
mind if Nicholas took a look at the ppc part).  Jason's comment on the 
MMU notifier side are promising as well.  Can you send v3 with Oliver's 
comments addressed?

Thanks,

Paolo

