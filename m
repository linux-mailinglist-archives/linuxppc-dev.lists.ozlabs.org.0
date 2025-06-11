Return-Path: <linuxppc-dev+bounces-9277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3835DAD4A8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 07:49:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHF8w4YNnz307V;
	Wed, 11 Jun 2025 15:49:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749620960;
	cv=none; b=G+sw37gzWlR0jclOAxC8iMdbYUX13vL5lfmiPthwCzcwejim1fjskh44pEicoVZQvttByU0LLmK2/fd6ziUVghGTafn0etGnS3Ty5cJNI109mFpgCBWaxawRvtLjgY8S+LIAp0f/vZ9CakuBJzA3Z3UY9nwiT8tqbQ67bVFwEFVrRTxkdwe8Ce9UZqZi4UBgHUeucFHhABJVs76HDIwqRxjZL7ElvqH/Y9AI7vEW5jzZeD+ITIvr0FlSm91TYgo+ij2YoBc+SEs+cNLBvDIETtYlfnK5tp/ycy+m7bwVq2o0YRjbjOQumK9Hi6qjQl/kHF9fdsIybwfzcHeegDyFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749620960; c=relaxed/relaxed;
	bh=2IQQi5msU8bl9rRll9LflLOSz4HCxVSHS0uQ2iKnuxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTut24kyguA7QD8ulGjTWXLcrjLqtT01COmHMmuGqQckcObCvV1aVif4EU37uo+kKSydLJa9nFdtfAmyEXcEXhL5jIAMJ/tcWm/ZgWvcYu0OhlrOiF085tbTWnhp8pvewBH+oRnDFIdyIPv6PIoTuG62oNU+swEBhvp47ENlpyNmPmO5uw1dA7NpOPnN8o+010paR+44maFhANeU8YhfgY96p+N9Zm4f5bFlGmEHt044hdRro/+TmN5LVXEYvaYJqXw2Qwp+cFAGI4vFDTLZ0HqqJ5sUsS7E97PzquhF2QqP1og/LHZzb4R8SjF67JAh4iWZ6vTZwGmXmE4Aew/Pwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DJoA0yfh; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DJoA0yfh; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DJoA0yfh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DJoA0yfh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHF8t57mvz2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 15:49:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749620952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2IQQi5msU8bl9rRll9LflLOSz4HCxVSHS0uQ2iKnuxU=;
	b=DJoA0yfhctqAWovgI/e51WrgePp1XFJl+SegLYWA77Zdfk3gr98Ie5lOc9DLGij7+1dDxN
	9VFXZjtZ3CxWclOm1Qk+kzvKDEFR8hTmgTDfNhWuOZ4Sw2vc6EHxaXa91y80krTGcFQRvy
	xIjpor77BnEEI7HIS1gOnMdKM6bD+Hc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749620952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2IQQi5msU8bl9rRll9LflLOSz4HCxVSHS0uQ2iKnuxU=;
	b=DJoA0yfhctqAWovgI/e51WrgePp1XFJl+SegLYWA77Zdfk3gr98Ie5lOc9DLGij7+1dDxN
	9VFXZjtZ3CxWclOm1Qk+kzvKDEFR8hTmgTDfNhWuOZ4Sw2vc6EHxaXa91y80krTGcFQRvy
	xIjpor77BnEEI7HIS1gOnMdKM6bD+Hc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-8kloy4pQMMaHun2v1XA7OA-1; Wed, 11 Jun 2025 01:49:00 -0400
X-MC-Unique: 8kloy4pQMMaHun2v1XA7OA-1
X-Mimecast-MFC-AGG-ID: 8kloy4pQMMaHun2v1XA7OA_1749620939
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso4476871f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 22:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749620939; x=1750225739;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IQQi5msU8bl9rRll9LflLOSz4HCxVSHS0uQ2iKnuxU=;
        b=QSm5uWtqx3Ejp/aiYJLp2SfC1VE3LdFpuRsOvNqLTUMZnu6pbJtmDo3d6Cck70Ymc9
         ot+5Ku1a0Aqm8wXwO6rSuRHrHHVxyGH1pOmN3V0PLGnhHjeyY6rVGz5ky+KTy2+0XVwp
         eu/cBRa0TfR3QWrQOv0XIq7LVmsiADWFotnZO2YmnIlcGuNMGZUkuOYbUmkwn8qLOf3u
         VywcnmFJ1GnqBql8EOrw7Ara2kxgDbhCMNL+4z3ose8JmBWXeplYuqdl9aPTOzksoP/J
         x+cj/lKMbBEHRNeb/uaKkommVsof2nup8uVefRedQGOj+DaFTWk2ZGms4pEUFD+34Vpz
         5lbg==
X-Gm-Message-State: AOJu0YxXnGYNEl3JQlxgmqCRt2bhexFrxqTfHxa59+CvIxUK+j3Ujlc1
	nbxvuklw86aHHV0c0enqtkWuRCdZL2ssc1zvSVUTVlHrX9zKlPKQScYezhD+9x0/NpRZo7APNsV
	Sz/BcFTPuRtHHlfLElLePwy6bFcPRYB/Xl00jK0lxWU8KMVefo2BnRyoEgCXgF1xYozg=
X-Gm-Gg: ASbGnctJK5Dhr6YkJp3jtGSYbJnjMUkcYb90w5bqSN2dhyDV9Jd1ChD9BjmNmYRjTTe
	0009Uq8JF1xWo8w0XgcexGhYveOOdjqJpd9j5PQ1CIoawdFvZBfzlLFsjlkpUscwfsQGvP+9idF
	2pha1yKFAgAXCVvNUgJqY5/nijMe0GuzxfwNOZluHufHhM/7wGAH+s62Blab5JdqwMw9HjZYZNN
	+A4NR4tcPHHh1PMMHgHGlCxrogly4YlyRPS3yyq97yJycTXPMdmzNmKVeJYilorPPjpc4NTmjdK
	kWh1RvOkY/zByuuhCNhrSiKLWXO93j65P/2NZ164QobC9mIqTyg7y74Ig3zdZac=
X-Received: by 2002:a05:6000:220e:b0:3a5:34ea:851e with SMTP id ffacd0b85a97d-3a5586dba2emr1229643f8f.25.1749620938890;
        Tue, 10 Jun 2025 22:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0kAp44nSFq4sY+QLXk+hBJLmqlsbpKCohb1suQ88NoVUKYavdCZyebIm8cU3djDIeBwXoMQ==
X-Received: by 2002:a05:6000:220e:b0:3a5:34ea:851e with SMTP id ffacd0b85a97d-3a5586dba2emr1229627f8f.25.1749620938504;
        Tue, 10 Jun 2025 22:48:58 -0700 (PDT)
Received: from [192.168.0.4] (ltea-047-064-115-122.pools.arcor-ip.net. [47.64.115.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b4e2fsm14151574f8f.36.2025.06.10.22.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 22:48:58 -0700 (PDT)
Message-ID: <2f5021db-2d3c-4294-a8c5-830a45db6b68@redhat.com>
Date: Wed, 11 Jun 2025 07:48:56 +0200
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
Subject: Re: [PATCH v2 1/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__
 in uapi headers
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Geoff Levand <geoff@infradead.org>, Naveen N Rao <naveen@kernel.org>
References: <20250610160128.69033-1-thuth@redhat.com>
 <20250610160128.69033-2-thuth@redhat.com>
 <20250610201244.GF30295@gate.crashing.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250610201244.GF30295@gate.crashing.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wMMhr2WvPc7i1U4a4412ZW_-kc_OERFhYIsbsL4srpA_1749620939
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/06/2025 22.12, Segher Boessenkool wrote:
> On Tue, Jun 10, 2025 at 06:01:27PM +0200, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> __ASSEMBLY__ is only defined by the Makefile of the kernel, so
>> this is not really useful for uapi headers (unless the userspace
>> Makefile defines it, too). Let's switch to __ASSEMBLER__ which
>> gets set automatically by the compiler when compiling assembly
>> code.
> 
> Assembl*er* code, yeah :-)  (What is "assembly"?  The dictionary says
> "An assembly is a group of people gathered together for a particular
> purpose.", but that is probably not what you mean :-) )

I'm not a native speaker, but the web seems to be full of "assembly code", 
even the Wikipedia article uses it (see 
https://en.wikipedia.org/wiki/Assembly_language). Anyway, I can change it if 
that's preferred.

> Acked-by: Segher Boessenkool <segher@kernel.crashing.org>

Thanks for your review!

  Thomas


