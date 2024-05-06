Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE7C8BC7F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 09:04:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2UinNCx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eElLFyrh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXspF4pKwz3by2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 17:04:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2UinNCx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eElLFyrh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXsnT3F0Rz2yvp
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 17:03:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714978999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QnO7jBPKKqZ6Z81KpQ6b8hLP1pvwmRM1V0g0UAtBOn0=;
	b=D2UinNCxZ+AjhWY0DDTKeFC4R6v1eW8m9kQvqKMV5pewViiC9eDozPlMujxwuXKruywfBi
	I8ztEhwLIyW/II/cpKe7EXSMWPBLU9epCuL+ZJTvZS5SPI5BMgqc35NNJXRG/6XLNrSdyE
	baPiwxuFtbGHNaBJ8rw2XzZ40yIvA1s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714979000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QnO7jBPKKqZ6Z81KpQ6b8hLP1pvwmRM1V0g0UAtBOn0=;
	b=eElLFyrhQiQfsjHMr+wZZvvIle1kpP14d17NkCUgomlLyU97mLZedBATGg9UAd3RzHNtCl
	Zqzo4WNrjvC8EjPtifZSe0C5EXfB9WPz4viPEEBSdITyuPN0qP1WTwjJ5roP3TM9GC13y8
	zAvWo4sKRKioGtVN5XZYAkCvf3Y2qow=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-sC62n-uCNACSTMu4fEkJ9Q-1; Mon, 06 May 2024 03:03:17 -0400
X-MC-Unique: sC62n-uCNACSTMu4fEkJ9Q-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6f04345122eso555630a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2024 00:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714978997; x=1715583797;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnO7jBPKKqZ6Z81KpQ6b8hLP1pvwmRM1V0g0UAtBOn0=;
        b=AJvGyCXUXu7BIsxHoJqnsM2iF9/bt3m6s+q+A72qzd+S+QuHn32q6OvnqP7Sex5/1p
         NmDKOcgO9sQdJZGeRvYj8GpF8WRPei9lkHqSiztCrch7wjQpbK5apY4xQ9AQCKnRiWGx
         4dsAKEbeS/XtSBGVek5ke+IUYYzW65DcO1Z4+4d8rJBPzERnNhZe9yY4vGV+FYnOVOnl
         E+2/QFyLe4KgpKLPbiqrQEewJ9BytD3QgQlxTQX37vyZgvv8ue1tcKbiKkmEtJu4YGBz
         y5uWFLVdeZDIstTODfdKkWLWAx/PyX4Us79DUE0JDM/9i5/SJzkk1N3HYnRWYaZzGGj5
         kFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaS6LLwFCrqyECDB5Qg0lFjbQkvRSYeSQ9wRWXB2lmbXFj+9yjwOne44uZXPvNE5C4sFZD6xa1Y5SQVnFMliD7H3wd+v4IkOj9VHWCUw==
X-Gm-Message-State: AOJu0YxiFMRGyveDvBhhM4S7tSzsYWvMhi/f8Ca9vzzNOhZ7hG53EY3T
	ss08iR3h1qDN4SUeEJSZkfndjqOpFuncbbZtwFbcQKJlbtXMIeJPGD7CguE/K+G2BEbCKIxWZqS
	s+Lr6iO866LrXurPIgXYJKbRGPaOXR0y1SmQT7cHXf1kX/BtYHWoFmaKLgEmOp0F2+wIMFSs=
X-Received: by 2002:a05:6830:2683:b0:6f0:718c:f6fa with SMTP id l3-20020a056830268300b006f0718cf6famr524944otu.33.1714978996795;
        Mon, 06 May 2024 00:03:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnIMeW46pwEBSzJeXMBA/+Nsm8YphXdw2r5+GmnzvWpZ+zuQSah5TAiHaKmMzbSqoylTMJvQ==
X-Received: by 2002:a05:6830:2683:b0:6f0:718c:f6fa with SMTP id l3-20020a056830268300b006f0718cf6famr524930otu.33.1714978996423;
        Mon, 06 May 2024 00:03:16 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de. [109.43.179.34])
        by smtp.gmail.com with ESMTPSA id de27-20020a05620a371b00b0078ed5316f96sm3603704qkb.6.2024.05.06.00.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 00:03:16 -0700 (PDT)
Message-ID: <5cde6ee7-eabc-414b-a409-24a6ed141b39@redhat.com>
Date: Mon, 6 May 2024 09:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 01/31] doc: update unittests doc
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-2-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240504122841.1177683-2-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/05/2024 14.28, Nicholas Piggin wrote:
> This adds a few minor fixes.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   docs/unittests.txt | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index 3192a60ec..7cf2c55ad 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -15,8 +15,8 @@ unittests.cfg format
>   
>   # is the comment symbol, all following contents of the line is ignored.
>   
> -Each unit test is defined with a [unit-test-name] line, followed by
> -a set of parameters that control how the test case is run. The name is
> +Each unit test is defined with a [unit-test-name] line, followed by a
> +set of parameters that control how the test case is run. The name is
>   arbitrary and appears in the status reporting output.
>   
>   Parameters appear on their own lines under the test name, and have a
> @@ -62,8 +62,8 @@ groups
>   groups = <group_name1> <group_name2> ...
>   
>   Used to group the test cases for the `run_tests.sh -g ...` run group
> -option. Adding a test to the nodefault group will cause it to not be
> -run by default.
> +option. The group name is arbitrary, aside from the nodefault group
> +which makes the test to not be run by default.
>   
>   accel
>   -----
> @@ -82,8 +82,10 @@ Optional timeout in seconds, after which the test will be killed and fail.
>   
>   check
>   -----
> -check = <path>=<<value>
> +check = <path>=<value>
>   
>   Check a file for a particular value before running a test. The check line
>   can contain multiple files to check separated by a space, but each check
>   parameter needs to be of the form <path>=<value>
> +
> +The path and value can not contain space, =, or shell wildcard characters.

Could you comment on my feedback here, please:

  https://lore.kernel.org/kvm/951ccd88-0e39-4379-8d86-718e72594dd9@redhat.com/

  Thanks,
   Thomas

