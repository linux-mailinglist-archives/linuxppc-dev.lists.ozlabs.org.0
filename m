Return-Path: <linuxppc-dev+bounces-2504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 692CE9ACAA3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 14:58:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYTd50kKZz2xVq;
	Wed, 23 Oct 2024 23:58:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729688329;
	cv=none; b=ab3x1oRFks+a5SlHGxQUZjpDNP2CpuGU5dI3H5OCEV9lvSMIYfozBRCHQU5q1HBRtHSZGmRX/fh/yaVppTGwTX3kCneG4I49lsyDkYl/pzCQHu47H6Z5H0vLbW7X6CLz+/lxchhenFpwk1ODcsM45NNXMX97iiIAY7BH0TkTz/KFPCl/HC+rbThTpOj9Ly/tZetL0xn7HFYdsI1qIS56JhH3a8homqPoIwU2FwicplzD8NzKvxG091sdqDeYfl6UDCHTd/fdlMopGa1HBiEp2iIRWWPrZj9cunitQAOg9D1RRXOKIbLsjLUnTnExIxhL3vXVuHmpohKhezHjfkaw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729688329; c=relaxed/relaxed;
	bh=cmc0ZXr9HAxJy8JyfDlIHzfWmtCzYV/tdIH6aM6k9ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TO/Vq+f5PRilimEiAh11ptq0NZEZU0xk2cBQmg62ByMl/oTqCQMLh+LFhDsDZKsfhXXjYBMSJJdYj/giy/YMJMnK6TBrUUxFZEarRONAkyKIqQcqbnK3MJbqzGYZtC3R4ML63VacsUG9Hngs1KXxB9S/JT4nyRl5rBMXkhd3optxVYtjLZb0+mLi9wPiiZBpC8LfDI4vYVM2qtWjeRJZW5f/mfcde4YiACouImcqjuXK5neakW7spiIY19dvSUZz8ccwszCrKwKa9wbBVE4uF8fh8RDieIHcAilTr4NgQko8tsKzcHKnIgA9IRIwgGlzvCkAGj23m5mbsdhFADMLCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DH6x5Zr3; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DH6x5Zr3; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DH6x5Zr3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DH6x5Zr3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYTd3469xz2xGr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 23:58:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729688320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cmc0ZXr9HAxJy8JyfDlIHzfWmtCzYV/tdIH6aM6k9ag=;
	b=DH6x5Zr3EYuQHcruwMAs74iw1DEQ6Zq+sRl2dGaPG+sCq9WCTdSwLmZz7jnubjdNt1NuI2
	rlEYN6ZF53ciFQ9VYMiFxQx2+V5Cfa9NuKMGm51P4wzV42SmOIOQc9DmbJcSeU7z75EZxa
	AVjAOCORyWOF6EgjlqC42AUDbup6L94=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729688320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cmc0ZXr9HAxJy8JyfDlIHzfWmtCzYV/tdIH6aM6k9ag=;
	b=DH6x5Zr3EYuQHcruwMAs74iw1DEQ6Zq+sRl2dGaPG+sCq9WCTdSwLmZz7jnubjdNt1NuI2
	rlEYN6ZF53ciFQ9VYMiFxQx2+V5Cfa9NuKMGm51P4wzV42SmOIOQc9DmbJcSeU7z75EZxa
	AVjAOCORyWOF6EgjlqC42AUDbup6L94=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-1KesGyrGNkGCg-3ZTB1gMQ-1; Wed, 23 Oct 2024 08:58:38 -0400
X-MC-Unique: 1KesGyrGNkGCg-3ZTB1gMQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43157e3521dso48901325e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 05:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729688318; x=1730293118;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmc0ZXr9HAxJy8JyfDlIHzfWmtCzYV/tdIH6aM6k9ag=;
        b=xFjhcRaRNx2IRQ5is6KGg4sdEHYystgv2GDqJ05wWSF1/bKgrqiGSQCRaU2hNxTFnQ
         ZzG3gc8ZUsfKu7Hft5Iv63mFyQzfOUML09YXSzl5V1IWj+U8thiPzS3NFBLRpbzbmp+m
         iGZRjU6YbMUml+gDfK1f8Cym9tmnC4SZBASdPoIc1aPFI5876AqHs9IAQUltOh5sVA3q
         QKQC2/20jLaMgRcbh0wsICjgGXCExALkCxhHM5Yzeuh+WgJqf2mKu5WT3bEQs6mZ2wRx
         fv0Yv334NdBcxHhuAf5zTLCC+eq+Vc8Ism7du7DW+4dlJ4j1hVqe8unz9wOmG5OQQKH3
         abCg==
X-Forwarded-Encrypted: i=1; AJvYcCWSv0o4AumpfitZDd1ry6AOqL9ho07PoGW6aPD/sBV4SSBhEqVwmxMTZxp1/71hVA0C4nh0kqkiNI4vdzM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw3HbbUc2zpNmi4Wht2D4M5e0pr79v38e+S0vN/8qfeDlrxvs19
	N/1xom5zlXSWAvH3HaWbPXE2rqaJhntqYEx0C75cyrv/L3qEk2EqKnvwF706jZNMhUMTKAkY5Lw
	ML1cO30zA1+ppSw9KMG8qPhUEdfvVpKghB2uWtJECE0ljhWAraB1uWoCrXN6dxVk=
X-Received: by 2002:a05:600c:4e48:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-4318421150amr22824705e9.13.1729688317720;
        Wed, 23 Oct 2024 05:58:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRqhovKJglA+voaQrphSfrRMVD0g6zoIKMkSl73MqSyuppwrsC7R63Gw4JXp3527O9cedgiw==
X-Received: by 2002:a05:600c:4e48:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-4318421150amr22824475e9.13.1729688317286;
        Wed, 23 Oct 2024 05:58:37 -0700 (PDT)
Received: from [192.168.10.3] ([151.95.144.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4317d03b8b4sm44004325e9.0.2024.10.23.05.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 05:58:36 -0700 (PDT)
Message-ID: <cd69f611-6478-4df6-907e-433ac559a20a@redhat.com>
Date: Wed, 23 Oct 2024 14:58:34 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: Array access out of bounds
To: Liu Jing <liujing@cmss.chinamobile.com>, mpe@ellerman.id.au
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241023120111.3973-1-liujing@cmss.chinamobile.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20241023120111.3973-1-liujing@cmss.chinamobile.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 10/23/24 14:01, Liu Jing wrote:
> In the kvmppc_mmu_book3s_64_xlate function,
> r = be64_to_cpu(pteg[i+1]); i used is 16 after the last loop and adding 1 will cross the line.
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> 
> diff --git a/arch/powerpc/kvm/book3s_64_mmu.c b/arch/powerpc/kvm/book3s_64_mmu.c
> index 61290282fd9e..75d2b284c4b4 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu.c
> @@ -284,11 +284,16 @@ static int kvmppc_mmu_book3s_64_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
>   		second = true;
>   		goto do_second;
>   	}
> +	if (i < 14) {

This should be i <= 14 (not "<").  And in fact, if you get here you must 
have found == true, and therefore i is indeed <= 14.  The code right 
above is this:

         if (!found) {
                 if (second)
                         goto no_page_found;
                 v_val |= HPTE_V_SECONDARY;
                 second = true;
                 goto do_second;
         }

and  "found = true" is set just before a break statement.

Paolo

> +		r = be64_to_cpu(pteg[i+1]);
> +		pp = (r & HPTE_R_PP) | key;
> +		if (r & HPTE_R_PP0)
> +			pp |= 8;
> +	} else {
> +		dprintk("KVM: Index out of bounds!\n");
> +		goto no_page_found;
> +	}
>   
> -	r = be64_to_cpu(pteg[i+1]);
> -	pp = (r & HPTE_R_PP) | key;
> -	if (r & HPTE_R_PP0)
> -		pp |= 8;
>   
>   	gpte->eaddr = eaddr;
>   	gpte->vpage = kvmppc_mmu_book3s_64_ea_to_vp(vcpu, eaddr, data);


