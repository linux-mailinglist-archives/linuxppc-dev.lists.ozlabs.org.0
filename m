Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2022D729418
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 11:05:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcwCV6PqKz3fP7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 19:05:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ehUwn+5f;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ehUwn+5f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ehUwn+5f;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ehUwn+5f;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcwBc02pnz3f0L
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 19:04:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686301475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLk6gSKtsM+p9Rtgq5+IZGVTEjc3fvT8GmlHeUGj3wU=;
	b=ehUwn+5fAisgAEtAIMl5EIJdeclqSq8CTML5XxKV3vnBdSoKWM2gHwMxwSDWO0iw5VXJLh
	8SS/MgxwDJJJA3Tt6AO+Slri6c8ud7wu7sku5IGptOdbBlKOktrAg+YkIdnNEDgtpKVACA
	bxrEekcdTsq3Acc+35VY7WKEzTLjEFM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686301475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLk6gSKtsM+p9Rtgq5+IZGVTEjc3fvT8GmlHeUGj3wU=;
	b=ehUwn+5fAisgAEtAIMl5EIJdeclqSq8CTML5XxKV3vnBdSoKWM2gHwMxwSDWO0iw5VXJLh
	8SS/MgxwDJJJA3Tt6AO+Slri6c8ud7wu7sku5IGptOdbBlKOktrAg+YkIdnNEDgtpKVACA
	bxrEekcdTsq3Acc+35VY7WKEzTLjEFM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-ZJcHGuJTPkuFtaj32__Pjg-1; Fri, 09 Jun 2023 05:04:34 -0400
X-MC-Unique: ZJcHGuJTPkuFtaj32__Pjg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-977cc772639so149877366b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 02:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686301473; x=1688893473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLk6gSKtsM+p9Rtgq5+IZGVTEjc3fvT8GmlHeUGj3wU=;
        b=QOxeRmiXj43ITysiE3p9ElU3BfUIFq7A/CU8FIfx++LHafkj1P4z2EEvqDZe7iyggN
         fzMt7I6NGFPhSBtYYdtoBWHAULsxUyAml+R9I1BzLBshA1xKtSCAArpEZCTBc4JCuw8D
         IVmUv2VTvyO8UpcidALJEBSA5kEA9C2hl228QHGo0ruHjbE4O2L/8bKU/S8j/EQ7WKKU
         k6IrKxyuAfqw2wK1C2ri1ZhlMyZxYhMud+8mUhcnKiGsYzADa0Vzt5lFMfE2gcgqPntu
         1xt+iid2BmBZUXujfjU2M++aU0Ynu0XUOYWo99dwQsWy2nv4GriXp2/Q30o+3P4iLrA5
         GMvg==
X-Gm-Message-State: AC+VfDxwPmBcoEYtqJtGFHLglNAaEPW8DN1Pm+F2gInTTctGQDsFpHbT
	cmkXUZGmmL9UvCDdoS5cJq3e5RoTIL8V8QCDyepRgLCmxu6jfz70ucy75qR93VUu9u8WYC6or3h
	KCjPZFmyvKCzvQmrQk4D0LJO+iw==
X-Received: by 2002:a17:907:c15:b0:94e:1764:b09b with SMTP id ga21-20020a1709070c1500b0094e1764b09bmr1027455ejc.45.1686301472969;
        Fri, 09 Jun 2023 02:04:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KrasOi5l6sCNShc9kV8qfG1eq+fRbvkSLL3UxeHKWwdsKczbSQdc/+63BzxHLxAbWxA2H7A==
X-Received: by 2002:a17:907:c15:b0:94e:1764:b09b with SMTP id ga21-20020a1709070c1500b0094e1764b09bmr1027414ejc.45.1686301472616;
        Fri, 09 Jun 2023 02:04:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id v5-20020a170906858500b0096f72424e00sm1013932ejx.131.2023.06.09.02.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 02:04:32 -0700 (PDT)
Message-ID: <e948d02f-cd93-b6e2-72fd-123e483f66fe@redhat.com>
Date: Fri, 9 Jun 2023 11:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH mm-unstable v2 01/10] mm/kvm: add
 mmu_notifier_ops->test_clear_young()
To: Jason Gunthorpe <jgg@ziepe.ca>, Yu Zhao <yuzhao@google.com>
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-2-yuzhao@google.com> <ZHedMX470b7EMwbe@ziepe.ca>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ZHedMX470b7EMwbe@ziepe.ca>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.co
 m>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/31/23 21:17, Jason Gunthorpe wrote:
>> +	int (*test_clear_young)(struct mmu_notifier *mn, struct mm_struct *mm,
>> +				unsigned long start, unsigned long end,
>> +				bool clear, unsigned long *bitmap);
>> +
> Why leave clear_young behind? Just make a NULL bitmap mean
> clear_young?

It goes away in patch 2, together with:

@@ -437,7 +412,7 @@ static inline int mmu_notifier_clear_young(struct mm_struct *mm,
  					   unsigned long end)
  {
  	if (mm_has_notifiers(mm))
-		return __mmu_notifier_clear_young(mm, start, end);
+		return __mmu_notifier_test_clear_young(mm, start, end, true, NULL);
  	return 0;
  }
  
@@ -445,7 +420,7 @@ static inline int mmu_notifier_test_young(struct mm_struct *mm,
  					  unsigned long address)
  {
  	if (mm_has_notifiers(mm))
-		return __mmu_notifier_test_young(mm, address);
+		return __mmu_notifier_test_clear_young(mm, address, address + 1, false, NULL);
  	return 0;
  }
  

Paolo

