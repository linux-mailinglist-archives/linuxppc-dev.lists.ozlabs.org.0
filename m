Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D11E81869B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 12:48:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M10JndKK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M10JndKK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvZhw0cvkz3cR4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 22:48:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M10JndKK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M10JndKK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvZh26hcnz2xb2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 22:48:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702986479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i1d2Ab31Ee77sG0X3X5fnzN3nw+6wvY9AWMLlM5zpLc=;
	b=M10JndKKwmpZ0tLVeKcK9PcGeudaKg6nBtLK742Zud+3SWB8NoekNuA3CgABE4HqWQxgpC
	4H12Vt7EgJpS37blck7CAABl3bVJ6qdiBp4FJYkxCio5IGSQu6NFOfCUyjZ7xgwEiuLhmz
	7YP/bKLCwQDpJGdiIcJLpw46gzHRjwQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702986479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i1d2Ab31Ee77sG0X3X5fnzN3nw+6wvY9AWMLlM5zpLc=;
	b=M10JndKKwmpZ0tLVeKcK9PcGeudaKg6nBtLK742Zud+3SWB8NoekNuA3CgABE4HqWQxgpC
	4H12Vt7EgJpS37blck7CAABl3bVJ6qdiBp4FJYkxCio5IGSQu6NFOfCUyjZ7xgwEiuLhmz
	7YP/bKLCwQDpJGdiIcJLpw46gzHRjwQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-A3ksDlvqNIm_HnoxlH_E-w-1; Tue, 19 Dec 2023 06:47:57 -0500
X-MC-Unique: A3ksDlvqNIm_HnoxlH_E-w-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40c495a9c7cso34278855e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 03:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702986476; x=1703591276;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1d2Ab31Ee77sG0X3X5fnzN3nw+6wvY9AWMLlM5zpLc=;
        b=TpPb+w5sWR7xHhl/m2VbiEb+wWttyTicTJF/cPzmTsr3A4DDFHxP72+UQA+0yDuzL4
         NvslFwgOm7uULa519mU0y3dnEvC6M+cZLY/jnWEGgtkvswBS4x2am7C1LMvVflhE4cX4
         ittthv8C8093xsw+c9nMEzUYKKY2xfbPT8Tao1jjsaIPcofEsRKWFu5TMgO1/hzb5fny
         jpg/nSposJVrgwMSNhS02olkpjcAXG+aZsLNjHMD1g+vOGCZjbK8eXkuQhR7a3anBB/S
         loSKLbcpdRCI8/nF1YcujFFpJK4Du/qt+O3yL9aNwYCSGHPyLhZJVNtmEDV6VCyG95LV
         bjCw==
X-Gm-Message-State: AOJu0YxLEvIz6MxnmgN/H/fTXfJe8zQ2eDLtQ9KSco+Km3rFc6ez8yzA
	l6tcCUZPrjDe7Rl9ppjg6W7tpf9qqTXQ5x2yE5nFmwYJXa67Xec+wOzPK8Cb/iWEi+hWzUGkcIw
	E/RP3WlioAH6Q7CVLsZ2UHjKS8w==
X-Received: by 2002:a05:600c:3502:b0:40c:6a85:e83a with SMTP id h2-20020a05600c350200b0040c6a85e83amr4099246wmq.51.1702986476243;
        Tue, 19 Dec 2023 03:47:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiFVSJIncyXNQiQCK7FzhlOuTeobBj8bJrrGSExzIOLTjus4qqbQKoGc2WH5915vMigDM4Ug==
X-Received: by 2002:a05:600c:3502:b0:40c:6a85:e83a with SMTP id h2-20020a05600c350200b0040c6a85e83amr4099235wmq.51.1702986475920;
        Tue, 19 Dec 2023 03:47:55 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-177-45.web.vodafone.de. [109.43.177.45])
        by smtp.gmail.com with ESMTPSA id jg7-20020a05600ca00700b0040c46719966sm2452815wmb.25.2023.12.19.03.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 03:47:55 -0800 (PST)
Message-ID: <c06b1cec-8a39-41ff-91e6-ad7bb99b3341@redhat.com>
Date: Tue, 19 Dec 2023 12:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v5 12/29] powerpc/sprs: Avoid taking async
 interrupts caused by register fuzzing
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20231216134257.1743345-1-npiggin@gmail.com>
 <20231216134257.1743345-13-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231216134257.1743345-13-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/12/2023 14.42, Nicholas Piggin wrote:
> Storing certain values in some registers can cause asynchronous
> interrupts that can crash the test case, for example decrementer
> or PMU interrupts.
> 
> Change the msleep to mdelay which does not enable MSR[EE] and so
> avoids the problem. This allows removing some of the SPR special
> casing.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/sprs.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/powerpc/sprs.c b/powerpc/sprs.c
> index 01041912..313698e0 100644
> --- a/powerpc/sprs.c
> +++ b/powerpc/sprs.c
> @@ -481,12 +481,7 @@ static void set_sprs(uint64_t val)
>   			continue;
>   		if (sprs[i].type & SPR_HARNESS)
>   			continue;
> -		if (!strcmp(sprs[i].name, "MMCR0")) {
> -			/* XXX: could use a comment or better abstraction! */
> -			__mtspr(i, (val & 0xfffffffffbab3fffULL) | 0xfa0b2070);
> -		} else {
> -			__mtspr(i, val);
> -		}
> +		__mtspr(i, val);
>   	}
>   }
>   
> @@ -536,12 +531,7 @@ int main(int argc, char **argv)
>   	if (pause) {
>   		migrate_once();
>   	} else {
> -		msleep(2000);
> -
> -		/* Taking a dec updates SRR0, SRR1, SPRG1, so don't fail. */
> -		sprs[26].type |= SPR_ASYNC;
> -		sprs[27].type |= SPR_ASYNC;
> -		sprs[273].type |= SPR_ASYNC;
> +		mdelay(2000);
>   	}

IIRC I used the H_CEDE stuff here on purpose to increase the possibility 
that the guest gets rescheduled onto another CPU core on the host, and thus 
that it uncovers sprs that are not saved and restored on the host more 
easily. So I'd rather keep the msleep() here.

  Thomas


