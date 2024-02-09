Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B974C84F8CE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 16:45:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WNlaf5Km;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WNlaf5Km;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWdV74y0gz3cYg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 02:45:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WNlaf5Km;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WNlaf5Km;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWdTH0mjRz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 02:44:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707493487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ediGnj2ZBdloK8ZzNwd0EGtkRfdSZ9P+sTwiRFCXJZQ=;
	b=WNlaf5KmsX/8xSclxstNvjHve7yNGNNtEsToQFNefHNcAM+0oUJUJSkCtQV0WYdqdpUm6Q
	4G1rhdBky0LF/P0MyplxCaEw8IRBR20l23Rwg3dp/KPXElBfKYXwBZOfqf6ziG/pK99t4p
	U3tDIRRZZxS8iMgaT5Bg8vLAXqhGIWw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707493487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ediGnj2ZBdloK8ZzNwd0EGtkRfdSZ9P+sTwiRFCXJZQ=;
	b=WNlaf5KmsX/8xSclxstNvjHve7yNGNNtEsToQFNefHNcAM+0oUJUJSkCtQV0WYdqdpUm6Q
	4G1rhdBky0LF/P0MyplxCaEw8IRBR20l23Rwg3dp/KPXElBfKYXwBZOfqf6ziG/pK99t4p
	U3tDIRRZZxS8iMgaT5Bg8vLAXqhGIWw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-byx3rxhOMTy5jpyeekYXdg-1; Fri, 09 Feb 2024 10:44:45 -0500
X-MC-Unique: byx3rxhOMTy5jpyeekYXdg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-68cacbd7d73so18739866d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 07:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707493484; x=1708098284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ediGnj2ZBdloK8ZzNwd0EGtkRfdSZ9P+sTwiRFCXJZQ=;
        b=qJpTesG0Q3atBKhasodQLvhVJ5X1NiUfibauxHrw8TzICXEgQJkVxWVZ1E2XA2QFYI
         vmtiybkPEFl7H1MFAygbWFs4fDDUkwi9enLjEF19FL7TX7DFGIZVLJpAIO30GwJRvBbA
         gzS9edAuN7Ey8owh4ECHMjDAN1SC8CqwhHtGQeXJtZo2gHfjZ0VJGUucbFKcLLzcubu+
         OoUKD1sx4bgBN5+SgU4RKygu7c8gppHkSxy8S6H1W3SE5lMAyPEchOKeFOGgQgv5/qSf
         fXR0irs7cwtlDUo7yZvegJvt0lPbfMmm5+vN97Nfy+4vnxEe168A7NDRkXBRfax2KDpY
         RWLw==
X-Forwarded-Encrypted: i=1; AJvYcCVe/19goFERhvNVHHilQO2MYD2+bj4gVDelz+5j5/+8oEuc++N0eF5cAwMaI73SBDH6ceu0F4SHfXoMccW6J8uW+FAAd93sBYHDkfFDRA==
X-Gm-Message-State: AOJu0Yy/VNQ8ZDVPFEx9FjQDrxq8SOe25nTiGgUMgBh+RDq4VspewOAH
	71E5UO0lkN3GT44DwVBu4HnvkeDSXoT7wsx7kFixgCHJPnzvjxLdy0crXntZ3zAAXvgQwc48VFV
	M4a5dFJOVtW90f+fFYZhu8+IBMaU+0ywisj6giDl7KAYTqYmeLx/1T/P669uXauA=
X-Received: by 2002:a0c:f385:0:b0:68c:aa0e:95bc with SMTP id i5-20020a0cf385000000b0068caa0e95bcmr1591370qvk.45.1707493484670;
        Fri, 09 Feb 2024 07:44:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg79+jcqpSwgnkDkg3V3d9JlqrGMAswNmZvWa9SxjPcRC0irrIkrkKB3kwbNK/19LlwrDing==
X-Received: by 2002:a0c:f385:0:b0:68c:aa0e:95bc with SMTP id i5-20020a0cf385000000b0068caa0e95bcmr1591353qvk.45.1707493484381;
        Fri, 09 Feb 2024 07:44:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXuNVdoX7LMFIKQAl/CiHbhwLn1hHYUATMz6lAXi7+QGrIXlB1BwD+w5eewfZJO9nemOMZKrVNX36XyPcwklIxo3Gr4SSR/hxDKaep3r1M7OH19vayuA5hstJDU6PF6u1AYeixG7ja//l1ynR1t0CkwJlUboR8kg/qzns4OKkZOz2RbIg+fHxp7LGjCC+++A+LJym6m3PEqtXDrcuumZW0q9PqoLkgrLvm1DG/xELEPYcu+qKluqgaxIblU6gOhQLjPJt2v4VJwL6EdRpehFSUHuCjPkepEbKsfY8BYqDnSazzmivrHd3bpmtUMNXSFY4tOU3DiVF8RFpHT5EGa9iEfzj1exwaGg7Vk23lQXm9VY4lWEPGrzkX23lZZWo8BR6uTQpD9Tig2O/8OCsTKGhEuG4gb/0hAsjK32+zwwJ0YRBPbXPKBqPWwyQgb+L2nijZYCsMFD2gpl2fiM5YwrLoFyBDxvHnrHNHKaOPYBcHlrkHUml21O9U+Rr9qrpp1q2QHsPes6lmXqOGABSjcyYzli+MN
Received: from [192.168.0.9] (ip-109-43-177-145.web.vodafone.de. [109.43.177.145])
        by smtp.gmail.com with ESMTPSA id r4-20020a0cf804000000b0068c7664112bsm932002qvn.52.2024.02.09.07.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 07:44:44 -0800 (PST)
Message-ID: <05d86794-0c1e-4395-bcde-15177469e1c4@redhat.com>
Date: Fri, 9 Feb 2024 16:44:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v4 2/8] arch-run: Clean up initrd cleanup
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-3-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240209091134.600228-3-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/02/2024 10.11, Nicholas Piggin wrote:
> Rather than put a big script into the trap handler, have it call
> a function.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   scripts/arch-run.bash | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 11d47a85..c1dd67ab 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -269,10 +269,21 @@ search_qemu_binary ()
>   	export PATH=$save_path
>   }
>   
> +initrd_cleanup ()
> +{
> +	rm -f $KVM_UNIT_TESTS_ENV
> +	if [ "$KVM_UNIT_TESTS_ENV_OLD" ]; then
> +		export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD"
> +	else
> +		unset KVM_UNIT_TESTS_ENV
> +	fi
> +	unset KVM_UNIT_TESTS_ENV_OLD
> +}
> +
>   initrd_create ()
>   {
>   	if [ "$ENVIRON_DEFAULT" = "yes" ]; then
> -		trap_exit_push 'rm -f $KVM_UNIT_TESTS_ENV; [ "$KVM_UNIT_TESTS_ENV_OLD" ] && export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD" || unset KVM_UNIT_TESTS_ENV; unset KVM_UNIT_TESTS_ENV_OLD'
> +		trap_exit_push 'initrd_cleanup'
>   		[ -f "$KVM_UNIT_TESTS_ENV" ] && export KVM_UNIT_TESTS_ENV_OLD="$KVM_UNIT_TESTS_ENV"
>   		export KVM_UNIT_TESTS_ENV=$(mktemp)
>   		env_params

Reviewed-by: Thomas Huth <thuth@redhat.com>

