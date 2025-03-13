Return-Path: <linuxppc-dev+bounces-6946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DA6A5ED4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 08:50:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD06F4CtMz2ygY;
	Thu, 13 Mar 2025 18:50:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741852229;
	cv=none; b=PCKOgK6o6FBakfT+EpE9HTPBSt03khyhmiUYYTELMCkRcG4m9XRRBs2sd5k6o5/ZoW+0NuHEYFEkqnpiP4L6+mlL7/8MKKeEpFOjoIq95pruLTWam39C6DYFLx0MP2Hy0ipZwPp5LLnrUoztqtCXCNZibQbrvTwBrR5eANN0B6njhnKW1uOJHQOq6SkpTFCa5rLqAwEFBgy6Hcbppj2m6TUW1+AqbU0vymqpWSklzNFLrFDFS1HdYtZRKjq94aCxnaVsavbxJ/7KL5fkadetRwEP4a9heS/ZeTkGtyzRoarhSxznizr6dRoMHetob9kVUPOY53pf81RGofKTm5hdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741852229; c=relaxed/relaxed;
	bh=MK8zU8BVCYnjzSS/b6+zVESpZfkVHFlkYo1MXlvFt+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0rI1hSYiHOJSZCS5c1Kjc3YOKXbNnhodZLVlpQ8UZyJhQ6GFsLDsiZavZtlX2MqX/G0bg3Z+R5dGqTSLWbA8mMK6owHV22HRkvCmcmn8zo0TPMQ/pen2QasNX8B6d20y1u8cbD67wePErYdj2NwZsXM70BsxZ1lPfVRGckVXgrk6yBdSZAstV1PXTD/DPSKmJAvP+GsPWtXVWQ2J0tlObNUQ1oC1n/ETcDjFPE3lqLuj2Al6h6ZBfjZvxpKQiGSsI7AaJWHWDywO+kf1ab93UEbx1EBkdGVw+FQnOfOl+MiSHqDM2KFg3rVIcLLexuM6lnxVTmtHrWA9faC/ymLGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A04Qh3/H; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LFpg+n6D; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A04Qh3/H;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LFpg+n6D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD06D1GN0z2ygS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 18:50:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741852220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MK8zU8BVCYnjzSS/b6+zVESpZfkVHFlkYo1MXlvFt+w=;
	b=A04Qh3/HLgBJHrzBVPzFMwv+Li5nJW+jeJyvNxVbR/sEye0tgm/5+XNMAGADHJoH5Bm9q3
	W0BjVEbyh7QsQfa3jTCQPVL47S/2h7mQY0py24maYtx0duq9VhcNFoIzBp+VJlX8FPNP4q
	YKi019/7z55hj8u7Syu2Tuj/DAHo0VE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741852221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MK8zU8BVCYnjzSS/b6+zVESpZfkVHFlkYo1MXlvFt+w=;
	b=LFpg+n6D177Gq9j/z2lYqo3S+9caRl2AxXUArqsrFgxRHpQ3tHa0EqJHJeipIzwznMvRrD
	zvIkZZ5khlK36qdRFY9vJPE/OD6qzehnzR6xRltTaQRQloyrj0ALO6ZqIFnSRgRREDiqs/
	PoE9qhuBzwxH/EdGSi+A9sWKEcT74h4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-DZ0enshDOlGQ4oqnsWyf5w-1; Thu, 13 Mar 2025 03:50:18 -0400
X-MC-Unique: DZ0enshDOlGQ4oqnsWyf5w-1
X-Mimecast-MFC-AGG-ID: DZ0enshDOlGQ4oqnsWyf5w_1741852217
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43bc97e6360so2956455e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 00:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741852217; x=1742457017;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MK8zU8BVCYnjzSS/b6+zVESpZfkVHFlkYo1MXlvFt+w=;
        b=iCAki9flZP24d0J/o8F8QXSYsyUxlvIy9tLHjT8PB3+UGkmPjKv3odXZh2OPN67O0j
         w7s6Bg5fGF1BcXAIp4Shng2hPNl/ZxDQNE1zendqsHz8MHts1wTuv12u7ejUS2UjyQye
         OCl8nsSv4mprYfwxMdFWZ9v8iR1okqtn+ADuTkEP/3xMjHdLwFS41UpvT7kUoHHNI1Jn
         BpRwMnT64H81X3MWPiB2FAA3L+WXnBqP+TALFLEkg37dWW7fAFtBZ3bLoBmN1lQ+13Zy
         raHrDEYHHezYCH164Pdwqo4jpkTAd8l6sfDTdvW5ZBhzFTnjCz28I1ocXqiBtZJdWAQh
         HDYw==
X-Forwarded-Encrypted: i=1; AJvYcCUiRWzdmRRFBjJ8zNpD5yPtURIVMVCm6Hu4MBuwyrrTE7RsdTpSET78UpZ4vNkk4kHxlDR6q/Jyf80TIWw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwiPxKNC7jxuyaciXfvEk8c/Vdd2fiVVllDXht9LKJmqazDLJk5
	HbM+XCz+tx0uN21Ww4QfUDf99LMZ/UE4zPH7WoXlqJ610PIXJroz+Ov7vKaLUnQ8E+6bbHMZPc5
	RMkYlfNjD0hdJAnB4smt9pPbpsuVujSowfPYG+IZvTeaQrei/TRZSnHfYVJGKuRA=
X-Gm-Gg: ASbGncteXWSuDYjZZm6/kxelq9YkalsD4tja7WdnqZB6/YIPjEmJ2pHqZ7/LfKzGkJq
	uXwwLdcCvYNIdHrfy+GZg49mXNrUSXwyOY3e6XgargPiaczGD2dQrOfgOvVFjNzGLhHK3VjC0oZ
	DFx55gcTi2oTMZBvbO2jymW5vDqAtsHbiK68ycIJgqdTFRl6iYi5WSC117UdR4SCS43ZeYcwIa7
	fekeIvesSvi498ncUPnB8UIuJ4KMwoAMePP2l0+2KKGdolUIrL357ef81mMUNJ+MaY54OK14Qox
	HKSboA3dVA4sFkHuiMLejaapoAAiOJgDvgTSJOEZfbRo2rU=
X-Received: by 2002:a05:600c:1d09:b0:43c:efed:732b with SMTP id 5b1f17b1804b1-43cefed78bcmr155422055e9.5.1741852217430;
        Thu, 13 Mar 2025 00:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwegUed+fQ9ljIYT2+ReraOGwFw7qJPttYdCzfqNHOxAXgAxI15SBvV5/+7QXKHcBvWKjG5A==
X-Received: by 2002:a05:600c:1d09:b0:43c:efed:732b with SMTP id 5b1f17b1804b1-43cefed78bcmr155421735e9.5.1741852217063;
        Thu, 13 Mar 2025 00:50:17 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-51-207.web.vodafone.de. [109.42.51.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8e43244sm1218116f8f.60.2025.03.13.00.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 00:50:16 -0700 (PDT)
Message-ID: <0019ac7e-b190-4b1d-9c8d-f5f039cd53ba@redhat.com>
Date: Thu, 13 Mar 2025 08:50:14 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2] Makefile: Use CFLAGS in cc-option
To: Andrew Jones <andrew.jones@linux.dev>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com, alexandru.elisei@arm.com, eric.auger@redhat.com,
 lvivier@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com,
 nrb@linux.ibm.com
References: <20250307091828.57933-2-andrew.jones@linux.dev>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250307091828.57933-2-andrew.jones@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gHotZPGGNQJtwpYFW9PSdTaWqEMvN1RqUKHTHgdeCz4_1741852217
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 07/03/2025 10.18, Andrew Jones wrote:
> When cross compiling with clang we need to specify the target in
> CFLAGS and cc-option will fail to recognize target-specific options
> without it. Add CFLAGS to the CC invocation in cc-option.
> 
> The introduction of the realmode_bits variable is necessary to
> avoid make failing to build x86 due to CFLAGS referencing itself.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
> v2:
>   - Fixed x86 builds with the realmode_bits variable
> 
>   Makefile            | 2 +-
>   x86/Makefile.common | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 78352fced9d4..9dc5d2234e2a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -21,7 +21,7 @@ DESTDIR := $(PREFIX)/share/kvm-unit-tests/
>   
>   # cc-option
>   # Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
> -cc-option = $(shell if $(CC) -Werror $(1) -S -o /dev/null -xc /dev/null \
> +cc-option = $(shell if $(CC) $(CFLAGS) -Werror $(1) -S -o /dev/null -xc /dev/null \
>                 > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
>   
>   libcflat := lib/libcflat.a
> diff --git a/x86/Makefile.common b/x86/Makefile.common
> index 0b7f35c8de85..e97464912e28 100644
> --- a/x86/Makefile.common
> +++ b/x86/Makefile.common
> @@ -98,6 +98,7 @@ tests-common = $(TEST_DIR)/vmexit.$(exe) $(TEST_DIR)/tsc.$(exe) \
>   ifneq ($(CONFIG_EFI),y)
>   tests-common += $(TEST_DIR)/realmode.$(exe) \
>   		$(TEST_DIR)/la57.$(exe)
> +realmode_bits := $(if $(call cc-option,-m16,""),16,32)
>   endif
>   
>   test_cases: $(tests-common) $(tests)
> @@ -108,7 +109,7 @@ $(TEST_DIR)/realmode.elf: $(TEST_DIR)/realmode.o
>   	$(LD) -m elf_i386 -nostdlib -o $@ \
>   	      -T $(SRCDIR)/$(TEST_DIR)/realmode.lds $^
>   
> -$(TEST_DIR)/realmode.o: bits = $(if $(call cc-option,-m16,""),16,32)
> +$(TEST_DIR)/realmode.o: bits = $(realmode_bits)
>   
>   $(TEST_DIR)/access_test.$(bin): $(TEST_DIR)/access.o
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


