Return-Path: <linuxppc-dev+bounces-9298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 196E5AD66FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 06:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHqyD0vkkz2xHT;
	Thu, 12 Jun 2025 14:57:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749704228;
	cv=none; b=V/2KLHlwZRVEUwToQCnwjtWAAYNn8fMJYbteIcpyCQ1GEMqkYQCEjIUV4iCj3ui/Jt17RojLh5S5kyr+1T78GzxTr0+U4PPpVthrbEC8cBzSO8isZl65LbVdQ4l7I+mo2V2uOKS2qb6QFcj+SnU+IpVO6xHGC0W5JObiDhOKUYfWfQvOFikI/kgEYtbTiga2kt+uOUy5TgIlGrthEF7MyNYPspQxe57erjK+J+StlOxSQckqVG8wfKyqgHgApvT7fQYqrpVWS7Vjz33EsEoJYUvCDbJMdYJVVIxLmYUWK92KnbdHZDpOfYrBb1W03upKDRuL3AfY/U4QMDWgFfE+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749704228; c=relaxed/relaxed;
	bh=fRcG0KcLrgIKRqjpg+vBPCK7hgCWz7pFJk3ogI8plXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlznETZZd6rXfrQLUnMl0rlom6FSwKkgLHbTyX4gxlE5vlYqpBwLJq6ZaAKK6iqpCiYvXC/zZ6vnrqQx10h95TQbu8kD6cVFMsC0mHc29VbobLVzksNqKgsx+CtIw4Mloz61o1vmdLIBUbNQAbzOa6NXkBHAf9ugDKnCVOKegEDFjZE3cmtkz0LrC2WK7Qm6oMmtRYogqfsD5zSOry8rh6QSDE6nJFIsDU536+19zPTHIIbr/P8bN2KfOPJ+QIx6WsLyuME4jJ/K53OCZhGUWjHJQ0gfNLyopmdSLXMBNnl8yH8KafkzMszcfMpQdRyFu/I24N3hDiQzg0zwtddi+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V7ViIpFG; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V7ViIpFG; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V7ViIpFG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V7ViIpFG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHqyB5ssVz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 14:57:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749704220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fRcG0KcLrgIKRqjpg+vBPCK7hgCWz7pFJk3ogI8plXs=;
	b=V7ViIpFGMYX+7qtQcZVT1L30yJrDdMsbo0MS/W0rG1HJgrGuQmK1Wzc7N+CACXL9b94jzB
	Ugkd9kdzw/tMbl4assG+NYAsvUp7baILbXE5iSTctJMXqh1PEsuxlev0Dcgp61J9KrMt41
	vy7QXY+dlboUIjiekVbjmF7WqlPdd8g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749704220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fRcG0KcLrgIKRqjpg+vBPCK7hgCWz7pFJk3ogI8plXs=;
	b=V7ViIpFGMYX+7qtQcZVT1L30yJrDdMsbo0MS/W0rG1HJgrGuQmK1Wzc7N+CACXL9b94jzB
	Ugkd9kdzw/tMbl4assG+NYAsvUp7baILbXE5iSTctJMXqh1PEsuxlev0Dcgp61J9KrMt41
	vy7QXY+dlboUIjiekVbjmF7WqlPdd8g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-14BoxYNWMw2PYv-EgcOwZQ-1; Thu, 12 Jun 2025 00:56:58 -0400
X-MC-Unique: 14BoxYNWMw2PYv-EgcOwZQ-1
X-Mimecast-MFC-AGG-ID: 14BoxYNWMw2PYv-EgcOwZQ_1749704218
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43eed325461so2323175e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 21:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749704217; x=1750309017;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRcG0KcLrgIKRqjpg+vBPCK7hgCWz7pFJk3ogI8plXs=;
        b=UdYPuX//nmmuJjU2JUSH4wIceC/gqVePWjZpL86HUkJ/7Kq5AxmMlIa9HJ0XFYzqZN
         pUzUIVnAu7aUA4nvErMTbhy9GirrWb8C0SX1mw25YjrrqpZZ1ZGxCSrJ/to1jgHjnfu5
         P6rCzblIrOzbNGZqwbx27TDeKa+zWN08RDF6TXBaekzeqC4SCazJLCgKDRuhsXN+7r/l
         sWCztqo85NmscPtsXj9+/mc7UESSXWhcIPxHYOiwlVn1Tv41B2I5ur9MbjB3QRcmNqr0
         dbBhgiqUOgLp9cRfjoUBKes4xDaac4s1jJo1X+DtdcRgOUkOZhPf0kee3krRFnx7Yb2m
         mdvA==
X-Forwarded-Encrypted: i=1; AJvYcCVCwOWa3vncKv3V5WgQJcHQ+qAJgsXaDJZVOoxvcSoNJ8TM68SznoABAed2Zsp6K4HCHsZLBf46QAtrZjQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMqfWwkHf4M/7gFLma2O0nflOtPWaomVpH2jQcc0pfiJG0R4Aj
	dcR8FQx82m0eDMgytxDLJygFvAuRQz5HjL03TWouahe1UymV/bvuTjKNTSzY0gP1uqvXNpXOMKL
	UzqfuoBydeglsFlpwyW4cgsIU7ak12bEPf45R0U76Qu1nkrso+kIKdcti1Pmkw9dh7Ac=
X-Gm-Gg: ASbGncsyCZTRdODKSUy+ZG5tD1UtkLEQkraFuMLPY7G9jzAXDAsmZqKKVW7z04moR1x
	XohdZik8kASJAX8bTFjZRsDD5g1rBxGZf1AtAkUeBK2Pmp6D2P5vSq8GSRxd3wn1tq8GGwoWE+M
	sDxrMjMmMkGcIC1+AwVTm6wkPVdcvOVrvcq/9FJx5i/yMFs51OZZa2GJl80aaGEWFl1sy3QqeFk
	FYPPk0pDxtWrYBwpvt2kbqgaaL/0PUvus7eUtjyh4kzHh2dt1w1IBMqQgnYUAkAG5+EA87QNMK5
	OrMuBz0O863ba/P3aF1I7MoF
X-Received: by 2002:a05:600c:4f55:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-4532b915f13mr24022705e9.17.1749704217617;
        Wed, 11 Jun 2025 21:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMnYNz9h25utVqlZtqMz+bJcwU577Begx0eWXz015Y6jivdb/FnjiEwBApKkKMSt+HJpyllg==
X-Received: by 2002:a05:600c:4f55:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-4532b915f13mr24022465e9.17.1749704217256;
        Wed, 11 Jun 2025 21:56:57 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a56198a3b4sm816727f8f.21.2025.06.11.21.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 21:56:56 -0700 (PDT)
Message-ID: <125bfa5b-4727-4998-a0da-fb50feec6df6@redhat.com>
Date: Thu, 12 Jun 2025 06:56:53 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] KVM: Remove include/kvm, standardize includes
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>,
 Thomas Huth <thuth@redhat.com>
References: <20250611001042.170501-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HsmBeONQu9hO0tJTn7G8aCuHr__3nQ53sMR8HDcjao8_1749704218
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 6/11/25 02:10, Sean Christopherson wrote:
> Kill off include/kvm (through file moves/renames), and standardize the set of
> KVM includes across all architectures.
> 
> This conflicts with Colton's partioned PMU series[1], but this should work as
> a nice prepatory cleanup for the partitioned PMU work (and hopefully can land
> sooner).
> 
> Note, these patches were originally posted as part of a much larger and more
> agressive RFC[1].  We've effectively abandoned upstreaming the multi-KVM idea,
> but I'm trying to (slowly) upstream the bits and pieces that I think/hope are
> generally beneficial.
> 
> [1] https://lore.kernel.org/all/20250602192702.2125115-1-coltonlewis@google.com
> [2] https://lore.kernel.org/all/20230916003118.2540661-1-seanjc@google.com

Marc, Oliver, I'd like to commit this to kvm/next sometime soon; I'll 
wait for your ack since most of the meat here is in arch/arm64.

Thanks,

Paolo


