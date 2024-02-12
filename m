Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1790D8512E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 13:03:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N3MR5W8I;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N3MR5W8I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYNQs00chz3c2b
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 23:03:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N3MR5W8I;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N3MR5W8I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYNQ6506Vz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 23:03:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707739388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ThRnjc9V1cnI1MuBuadhXyQmboZs+nvqfoLxMt2WsZE=;
	b=N3MR5W8Iio4GWhsnDrrIl4ftMyoUPg212hrrViv94cNTYKY2WCG+P1UlegxYeON9L9/P7f
	cdukl15TXrsoiN7AiyiexEnoVx4WOZpMD2qnxRYP8/dacyytl0Mc6q1t7vGffAggXGtreJ
	axDXukFqxzYDm9djadwwl75lZJt63ss=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707739388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ThRnjc9V1cnI1MuBuadhXyQmboZs+nvqfoLxMt2WsZE=;
	b=N3MR5W8Iio4GWhsnDrrIl4ftMyoUPg212hrrViv94cNTYKY2WCG+P1UlegxYeON9L9/P7f
	cdukl15TXrsoiN7AiyiexEnoVx4WOZpMD2qnxRYP8/dacyytl0Mc6q1t7vGffAggXGtreJ
	axDXukFqxzYDm9djadwwl75lZJt63ss=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-yKQQINGVMUuHH4m08WUIHw-1; Mon, 12 Feb 2024 07:03:06 -0500
X-MC-Unique: yKQQINGVMUuHH4m08WUIHw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40e4478a3afso16058585e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 04:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707739385; x=1708344185;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThRnjc9V1cnI1MuBuadhXyQmboZs+nvqfoLxMt2WsZE=;
        b=aCXRUMDlSKN2aIo0BkzHGLLy6U3+1s/JnFixDJmUy8oMfGmLz4iOHnq2BP0PmQC3x3
         wVZEMpNHkiRgWHQwdJnOE7H6mX3emgK4KMdES4/2NaqHR0S9uy6kI5rOH7VuxGJfl6le
         5nEH/hroPi/hiF+8uBXUFlwA2beG73/KSawLI3C1pxeJ8ucuh02lrTTEP2PO7f4O0t8a
         IP68S971FKs8xjGfL/af9/6rCw3BtDhdIWvXqE28EyWgWx/pa2jL2C9VjBWkQyCsKnwM
         pa37uo4DNFOYBiZ9fjEyk0Yo+cB4stn1n5CNSIVA75O46Sh8xuTtXNXRvjD9akDPI5qA
         iy7A==
X-Forwarded-Encrypted: i=1; AJvYcCWo5xJ2ZI9WD5bl5abiO9JP5CsrL7/Zi/KHJ/KJ2gb8xFIqxOXlcA5nNRISoop/5jVQkQo9NG1NdZIDSPGk8HaABaV8/ECsCVzBzK1/6Q==
X-Gm-Message-State: AOJu0YzRvA2avD2x/IXEQ4Awmib07Jl0sbrxhg5H5hFsGs/X86VhAOYl
	0fE72n5wqqo/AeqdFvE6t/FdqgSbBvUXK99qB0/Q+4FFwt2lD0xG1ZFbu8+5faFdxVQPYY7SfUs
	xDgEp9m4TRbSkhY/Sy/svI9XQFDgsqIxDwnHi9pN88ua2vw2MxnFrPiZsp+BkjNU=
X-Received: by 2002:a05:600c:5127:b0:410:7a66:e95a with SMTP id o39-20020a05600c512700b004107a66e95amr7229883wms.0.1707739385184;
        Mon, 12 Feb 2024 04:03:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFI+E1vT4IrD9Jx5dHLmVjtQgMnruMIAl+D10JMPz6O0V7UwAMitsYs6gAig2CEpXBvW+xmqQ==
X-Received: by 2002:a05:600c:5127:b0:410:7a66:e95a with SMTP id o39-20020a05600c512700b004107a66e95amr7229846wms.0.1707739384794;
        Mon, 12 Feb 2024 04:03:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhx1LPeaJcTP8l85ZqIkkvg7qw4zhLq6323PDgGsPccLeK28oR1BqpofVkH5cEh2WVk/gw6NuIiZ7epIY/ixrcBOifkRtgAWqVENo6fA9/+3yVXtcZHu1faKkJFaDQYYZV7G7Jxa323nz3qux3irKJjyZiBWm5SgkDyzC+DbaPw3FSD7zCKIfS1VFXSfXNCINA4QCzUI19ocwgWCawhOJpAjs2bR//m3dWhtS/mSHi93bH2o2ardo41V1nF9weH1bhEbHY87aCpc4xiS2ZfsHhFd0OBCMaf6/RLoYBhH8BPMArn5Z5ZYN+doyagegu80SWgQlm6+fWN4wJkLBif7MyMqU4srbzWxZJFvXWTmch82apLYG3GTX0DMJiKnHgYiEEnlgdcCPQdR3O91WDq5MSSkVsKEO096+YWsOFk0C7KmQPs1X1Wiv6+7zepSkiANdc5JgGbpi8H5KgcFknpBf5EFl9A9kQ6b7Tyk6Y7hSp1qIbmQ2VuG2rnjAckcgV2ubLIvu7kK1bxwx38h6sSckOmcLSkq/teNqUzS+LIZWfCxgnWsMzvuwqFcJr/hf9Xu7tDlXUOHdHbZ4ynw6QeMxyo95l5b2sksuiW8uxSmQ6CoNLdtEO/W0HBmY8JfTaKWXlpL6+g/+AL0b4p9ovBNFDmUV6h6i61pX+v2AJJccxDZX8sKD8A31n/VUqC4JfMnyJc/tx0NtO7x38rs8kpvTs1EP1CkkbKu1+RdcsUvTy6lsKA9A2O9s22HzgWG44BOGhj9ZJKKUOVJTdcweWvRTpyWZKNGfhX8g0xo2EitPDcg4gtVlwEGWl+6e259ABqWH7asc66WjnMb/JXBuqRqnkcGDlBhz//8p3d/HcKaOq
Received: from ?IPV6:2003:cb:c730:2200:7229:83b1:524e:283a? (p200300cbc7302200722983b1524e283a.dip0.t-ipconnect.de. [2003:cb:c730:2200:7229:83b1:524e:283a])
        by smtp.gmail.com with ESMTPSA id g17-20020a7bc4d1000000b00410add3af79sm4826304wmk.23.2024.02.12.04.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 04:03:04 -0800 (PST)
Message-ID: <739e29cd-a0a7-4e76-826e-6fd4968ba4e0@redhat.com>
Date: Mon, 12 Feb 2024 13:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/25] mm: Clarify the spec for set_ptes()
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, John Hubbard
 <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Barry Song <21cnbao@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Yang Shi <shy828301@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-2-ryan.roberts@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240202080756.1453939-2-ryan.roberts@arm.com>
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
Cc: linux-mm@kvack.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02.02.24 09:07, Ryan Roberts wrote:
> set_ptes() spec implies that it can only be used to set a present pte
> because it interprets the PFN field to increment it. However,
> set_pte_at() has been implemented on top of set_ptes() since set_ptes()
> was introduced, and set_pte_at() allows setting a pte to a not-present
> state. So clarify the spec to state that when nr==1, new state of pte
> may be present or not present. When nr>1, new state of all ptes must be
> present.
> 
> While we are at it, tighten the spec to set requirements around the
> initial state of ptes; when nr==1 it may be either present or
> not-present. But when nr>1 all ptes must initially be not-present. All
> set_ptes() callsites already conform to this requirement. Stating it
> explicitly is useful because it allows for a simplification to the
> upcoming arm64 contpte implementation.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>   include/linux/pgtable.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index f0feae7f89fb..5e7eaf8f2b97 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -229,6 +229,10 @@ static inline pte_t pte_next_pfn(pte_t pte)
>    * @pte: Page table entry for the first page.
>    * @nr: Number of pages to map.
>    *
> + * When nr==1, initial state of pte may be present or not present, and new state
> + * may be present or not present. When nr>1, initial state of all ptes must be
> + * not present, and new state must be present.
> + *
>    * May be overridden by the architecture, or the architecture can define
>    * set_pte() and PFN_PTE_SHIFT.
>    *

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

