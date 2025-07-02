Return-Path: <linuxppc-dev+bounces-10047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C31AF5A8A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 16:08:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXMDX66msz30LS;
	Thu,  3 Jul 2025 00:07:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751465276;
	cv=none; b=g07O+jUom8JLo4rUQfC1OyQKdaa/NCmNmxtAxBU/sawBnZxcatriZRMbg/lxnvW5BkIG8A35ZdWFZM8MVxNeAW/tsvKPNYA6JcA79lqiUyBL4eHONMWxbWSLjtMQCQniHArCVItJh2+Be4sR3xdUpJJQl2kmLu5RGJ+rcGDDaqsGZISkqka6UkZ3WIIZUIfa6ziHEOZzAWjKzAkAHDBvsLaa/k4gvERDPRlDpaJuMMXJkvWKKyfFCVviKw2QAnS+y2u/sbSwWYasWUoMnw3AhJx+vNOHn2iRdL+C1sFFdpU+zLkIOxRU20hZDROfHwnYGYoqpq8AAvKN5Cf9AGSXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751465276; c=relaxed/relaxed;
	bh=QtugXBwpmof8PtjrVGSF5iQiiRq53WoQXJVBl10e0QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHoAuVB8fyT+ODEyjNG4n/k9rHZT4i5gCQitQxAxxFIwVRfaRIHzo0Ap6XNE6mXrQCGD5tbw2W083ZrhX0BuEPMixqGwbOVEabq2slB+d6FyV24UEXW5FLn+vmwjh0gKylQTQRmLFyKI1iuocHkhl/astvJk9i4jbiIpNZtWTvmh+odjS7EUusHM4ke8ftJvI4TVD6nv9xYzDIc85Pty8cGBTSgo247HyFCs3z1togGABFE/P5exTHPLBT22GRk+zysWVc/pPu+HUlqN8tmoVrWtH1UPBw7NMAaYEes1SUDAT0mqzDr/kDU7j4zr4TpSewsmt67ecdrQ1GMjXF7DNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TOMCJzde; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TOMCJzde; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TOMCJzde;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TOMCJzde;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXMDT68n3z2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 00:07:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751465266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QtugXBwpmof8PtjrVGSF5iQiiRq53WoQXJVBl10e0QY=;
	b=TOMCJzdeTs6knaxCuSnSUVXvuFm/Yj41wQQYc4MIvwGtkb5MBoIQJSdo0XX0AFV0vcfeiQ
	scIDOaZ3gK3plLGl+lelfirlAfb/bokpF9XXvfouMu01RMmgJnf/189AhzJZ2SrAQXavxI
	PzouxnJ5LuZFXuRsqSUgBFCsEAOA+Ug=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751465266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QtugXBwpmof8PtjrVGSF5iQiiRq53WoQXJVBl10e0QY=;
	b=TOMCJzdeTs6knaxCuSnSUVXvuFm/Yj41wQQYc4MIvwGtkb5MBoIQJSdo0XX0AFV0vcfeiQ
	scIDOaZ3gK3plLGl+lelfirlAfb/bokpF9XXvfouMu01RMmgJnf/189AhzJZ2SrAQXavxI
	PzouxnJ5LuZFXuRsqSUgBFCsEAOA+Ug=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-Xa0GPkC6OAysxW_upO2UBg-1; Wed, 02 Jul 2025 10:07:44 -0400
X-MC-Unique: Xa0GPkC6OAysxW_upO2UBg-1
X-Mimecast-MFC-AGG-ID: Xa0GPkC6OAysxW_upO2UBg_1751465263
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so36209395e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 07:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465263; x=1752070063;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QtugXBwpmof8PtjrVGSF5iQiiRq53WoQXJVBl10e0QY=;
        b=VcjjSs7+VtAoOGPH726CGgoAKOC/4s5xZL1xNvKxg7rDvhFvW6fVh75mdRWOlUiU9h
         gN2U1nDLlSaWdCoTViDRLdcqO+b1PxlJvQcEeqqjVqibId/CJtYr9I1RZ0GqbqRjxbnF
         HOJxetwaaIXTADRvq+ppSkcC54rI03TV3dYpmRy6U8qhrpm0c4hIgeuVdhYkntnadgEd
         lNRjK14dFe3za9Py0ijVSS1BxoTJkMyao585lOAfsBn7ncMGL0AOywR7XB3KHa+jj1cT
         deIXSnkuVjS+Bm929PhbhQ0jrx5iLL5U2NVANOs4shXUG1SvWO/9u9Rf7gKvdKfq1Lc8
         AzBw==
X-Forwarded-Encrypted: i=1; AJvYcCVTaO59MLfFNcMBoe/S9vSmv/ubEPkVlkbs7fJbyjLtKcriulEc+QiChYaV3peVkeRjvJrE7yby1SROSqs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzd65d68h44R/EELpxLco1MHBp/Fc19dqFPVUugaJ/Z2Je/HOjG
	5KdpcqBd6Nsosh8j2iJP6fG7WoP9eOfBo0khmRjBweycW/eGsQxZ1ZWvVg/EL4vtcd32ZNVrzwu
	QmOC01QfypVK/3R7H27nZ+6OgisvHBCJULr5Qh8+IEOn5yY1xGuzQFLJvHF7XElZKNws=
X-Gm-Gg: ASbGncuQP4285F5gy0UGcV+xPuClE+0PoS8I5/EdmNq2icSANGjmGJF9GNj5a3hOBkr
	2r2FTceGmShjqZKuJBcdbEXR/naboEahzM2SHS/3pbiQa6ucKy7/zDvDoh9WFrRzF/R8iSae0/i
	ZhDBt2mpnl3uaFqQVfZqcTXHSuiPZR5RWDCmkCboUAMUvjimRtBZLkaDOI3Ztp34Ux7orms52/m
	ZrIi1ZGeXPahqqi7E+lGhQZaH57DfVybZ7r9w27Lkbh0cNffjveyI3ARfIZQJqP7dfb7QCgA5ty
	L+eKseu9Q/Ua9wFY5yY4oedSAsAOSzJnsW4Vpoyn/AqGi8Kf+IoNv0dyyW0h7w==
X-Received: by 2002:a05:600c:3b01:b0:453:99f:b1b0 with SMTP id 5b1f17b1804b1-454a3706e45mr28815155e9.20.1751465263161;
        Wed, 02 Jul 2025 07:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5YuCq5rpUy6RMv0jfgdQbgLyOb/XAUKuoXtz40yFdPi0MgOsaJG33C7l4K2KM2eHAFCoDsQ==
X-Received: by 2002:a05:600c:3b01:b0:453:99f:b1b0 with SMTP id 5b1f17b1804b1-454a3706e45mr28812865e9.20.1751465261164;
        Wed, 02 Jul 2025 07:07:41 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-114-041.pools.arcor-ip.net. [47.64.114.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453a85b3d44sm36303505e9.0.2025.07.02.07.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:07:40 -0700 (PDT)
Message-ID: <69c1b5df-2b49-4a3c-811c-ad6141a22dbe@redhat.com>
Date: Wed, 2 Jul 2025 16:07:39 +0200
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
Subject: Re: [kvm-unit-tests PATCH 1/2] scripts: unittests.cfg: Rename
 'extra_params' to 'qemu_params'
To: Alexandru Elisei <alexandru.elisei@arm.com>, kvm@vger.kernel.org,
 andrew.jones@linux.dev, lvivier@redhat.com, frankja@linux.ibm.com,
 imbrenda@linux.ibm.com, nrb@linux.ibm.com, pbonzini@redhat.com,
 eric.auger@redhat.com, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 david@redhat.com, linux-s390@vger.kernel.org
Cc: Shaoqin Huang <shahuang@redhat.com>
References: <20250625154354.27015-1-alexandru.elisei@arm.com>
 <20250625154354.27015-2-alexandru.elisei@arm.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250625154354.27015-2-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: twuyoCsR68fk595MElt5mOxLBGbYg50cOgfovqJffQM_1751465263
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 25/06/2025 17.43, Alexandru Elisei wrote:
> The arm and arm64 architectures can also be run with kvmtool, and work is
> under way to have it supported by the run_tests.sh test runner. Not
> suprisingly, kvmtool's syntax for running a virtual machine is different to
> qemu's.
> 
> Add a new unittest parameter, 'qemu_params', with the goal to add a similar
> parameter for kvmtool, when that's supported.
> 
> 'extra_params' has been kept in the scripts as an alias for 'qemu_params'
> to preserve compatibility with custom test definition, but it is expected
> that going forward new tests will use 'qemu_params'.
> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
...
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index c4269f6230c8..3d19fd70953f 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -24,9 +24,9 @@ param = value format.
>   
>   Available parameters
>   ====================
> -Note! Some parameters like smp and extra_params modify how a test is run,
> -while others like arch and accel restrict the configurations in which the
> -test is run.
> +Note! Some parameters like smp and qemu_params/extra_params modify how a
> +test is run, while others like arch and accel restrict the configurations
> +in which the test is run.
>   
>   file
>   ----
> @@ -56,13 +56,18 @@ smp = <number>
>  Optional, the number of processors created in the machine to run the test.
>  Defaults to 1. $MAX_SMP can be used to specify the maximum supported.
>   
> -extra_params
> +qemu_params
>  ------------

Please adjust the length of the "---" line now, too.

With that nit fixed:
Acked-by: Thomas Huth <thuth@redhat.com>


