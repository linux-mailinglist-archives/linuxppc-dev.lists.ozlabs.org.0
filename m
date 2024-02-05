Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4CF84998A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 13:05:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=azN/bIGF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dzX5Pk+N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT4nm3pv5z3cB2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 23:05:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=azN/bIGF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dzX5Pk+N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT4mz26lKz3bWn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 23:04:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707134670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cgWqZ/ywcH/fgEspFo/6QfPQCVxD3Q8p3yiG7wvUpz8=;
	b=azN/bIGFqsbpMh8Q8ycGMBhoRqvSqXaGlHPyBScfA46dEtB4hNxAwAIdtnRYuMEGOsernc
	dbRrSeY8b/iK6GzuJv2Fhd1UtdmKpBnRRbPfqK9I4PVNpgZbJBpk53JpSapyz37p2ik+r/
	t8oz0bE2igE3z6GDhkxwGwoFqb4USqI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707134671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cgWqZ/ywcH/fgEspFo/6QfPQCVxD3Q8p3yiG7wvUpz8=;
	b=dzX5Pk+NmY4Ekn5fo3brDn/cW/RoYNxX8eBRAA/khDLsTzMBxVd+fvI2xmZXeJ/630ZwnJ
	VChDxh3romUjSoww87bVd/CGY3oZKcl3fWifC06/ajHmbQDJXH2oUJ9XMnQmo8e6EeGSks
	XPKsKYZS58xVTnGFOV3zyJ+MotTmgy0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-17CIX4d8NjK13eJa2iPIoA-1; Mon, 05 Feb 2024 07:04:29 -0500
X-MC-Unique: 17CIX4d8NjK13eJa2iPIoA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-68c7c5f300eso37894626d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Feb 2024 04:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707134669; x=1707739469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgWqZ/ywcH/fgEspFo/6QfPQCVxD3Q8p3yiG7wvUpz8=;
        b=LrTwiqqirh0NXND6q6NfEefTRwZX4zI1j3bwtDTq64C31+tSIfaA50HOCdj4yZVq/O
         hfuedlhcST5UWB8TCo/xr3tkNuLw/l4s787jpv6F04LBFMRMxXXj//nS2f5IdyZXI9L7
         y7L433zEM5+9SxGfHr9eJkb3rjXl68tUcP4c7lyqmC+WIRO1ivvv9DFs35eQNA9GtVaj
         OoRD7rW+RuquKjS01IWqRfCfdMFDc9GaodeMvIZPNBML0KtABnHvYiOZSWLQgw4yPWJD
         qRzoBg3hzqBKhxvmVkCD8Ahj/vftdQXhB++9gcW+uP4/WODxJuCT9ORSuHAvlSAvUU06
         DWeQ==
X-Gm-Message-State: AOJu0YxKHbLK1JVrTSLQqLenJdfNPrrdPGxvNjRY80ynB6W76m4+BS54
	nVT0QB+q1Q9hPnqs65zrjLN4i8lmfov3JCJ/rS6bniq8HyMLSvlodtz6vPsJL7IkU/RuBVx8V5s
	d1s9VHyxXLXlib2cBdFqxZOwO2hpWT//1OHaLKlppRFB7t/2eOO0wA69AphmDOVg=
X-Received: by 2002:a05:6214:5b0a:b0:68c:a02f:6079 with SMTP id ma10-20020a0562145b0a00b0068ca02f6079mr3441767qvb.29.1707134669268;
        Mon, 05 Feb 2024 04:04:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPoF8GgytGAV7N3xAL+dT9T6XQARIMDQXTEMpFPk8uuMyJ8vK0fkwLF4enOo9ZVfzxOqwKoQ==
X-Received: by 2002:a05:6214:5b0a:b0:68c:a02f:6079 with SMTP id ma10-20020a0562145b0a00b0068ca02f6079mr3441756qvb.29.1707134669050;
        Mon, 05 Feb 2024 04:04:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXmNidbUr0VtZ+6lzieCSIr/XlWKYGObahx4H5SEyWGq0u3Bb88mwSofTvDj6AAJNq+L4A7/2+Q2jCyGj/5T4McG2F7oHatZV/4mqxMUOl+55b0IXAnwYNCFHiZQIJaoOx4UB/5Tr+GbUq28A9lZCKKanKIfLyGg226L7Vbk2c4OlYqA3ClH79NbeHj3m+5qHyTIlX9eQIOoXWH9+7zjHYDI4EHL7Wqrn4vJM0KUfnYpZwJg2vdncFMOtTVhOr8YgxdP5G1wHWg2hGa0yJZt5HMXbkpga8BEsIUfIiF+PqEO/u89tBgFAETOL+nLrBmuu/9fUTjYCociI0dyVtaHl/PCl3lbpiI4f9nUj3zlYhNpDg06e5dXpdPKmE+q4Y45sFSdvBwMsl2g5XAoxVD86cgRaMY9BzZGZRQi8tsoIEVLi1s0JvlwR2hY9oE0NDiiG5nnPRwIBTUEeHvN7FvYl5Ex4NK4u0eoUm24JVSj6pixjtYR74=
Received: from [192.168.0.9] (ip-109-43-177-196.web.vodafone.de. [109.43.177.196])
        by smtp.gmail.com with ESMTPSA id ql4-20020a056214540400b0068c95ebd14csm2194205qvb.2.2024.02.05.04.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 04:04:28 -0800 (PST)
Message-ID: <cc1b4733-9a6f-4bb6-b8e6-1a6a8807b317@redhat.com>
Date: Mon, 5 Feb 2024 13:04:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 3/9] arch-run: Clean up initrd cleanup
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240202065740.68643-1-npiggin@gmail.com>
 <20240202065740.68643-4-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240202065740.68643-4-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/02/2024 07.57, Nicholas Piggin wrote:
> Rather than put a big script into the trap handler, have it call
> a function.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   scripts/arch-run.bash | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index f22ead6f..cc7da7c5 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -271,10 +271,20 @@ search_qemu_binary ()
>   	export PATH=$save_path
>   }
>   
> +initrd_cleanup ()
> +{
> +	if [ "$KVM_UNIT_TESTS_ENV_OLD" ]; then
> +		export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD"
> +	else
> +		unset KVM_UNIT_TESTS_ENV
> +		unset KVM_UNIT_TESTS_ENV_OLD
> +	fi
> +}
> +
>   initrd_create ()
>   {
>   	if [ "$ENVIRON_DEFAULT" = "yes" ]; then
> -		trap_exit_push 'rm -f $KVM_UNIT_TESTS_ENV; [ "$KVM_UNIT_TESTS_ENV_OLD" ] && export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD" || unset KVM_UNIT_TESTS_ENV; unset KVM_UNIT_TESTS_ENV_OLD'
> +		trap_exit_push 'rm -f $KVM_UNIT_TESTS_ENV; initrd_cleanup'
>

Why don't you move the 'rm -f $KVM_UNIT_TESTS_ENV' into the initrd_cleanup() 
function, too? ... that would IMHO make more sense for a function that is 
called *_cleanup() ?

  Thomas


