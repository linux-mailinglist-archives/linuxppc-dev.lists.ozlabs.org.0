Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6027584F0D3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 08:33:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnGwtj//;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnGwtj//;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWQZS2F3cz3cRR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:33:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnGwtj//;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnGwtj//;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWQYj1B9cz309c
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:32:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707463973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yY5P44hxC1Z4PKZ/FATMU8IHl7NhMLgeWkQFsYKZ1O8=;
	b=dnGwtj//+9Y8DgJh/5Uxl8OEv0TXcguCq8QM5FeOA/bkjUPVe8BJ9OwsmvAbSdtjGXvvH+
	z6g41/Ou9zTSfy+oSX3RcdT0a4CSx/EspkB6EssXG2q9koA2WCOkJ+a4F9DtcboKr4sMvs
	kGl9JUJX1IuFQz1QRrBl6mWtgi6YQAc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707463973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yY5P44hxC1Z4PKZ/FATMU8IHl7NhMLgeWkQFsYKZ1O8=;
	b=dnGwtj//+9Y8DgJh/5Uxl8OEv0TXcguCq8QM5FeOA/bkjUPVe8BJ9OwsmvAbSdtjGXvvH+
	z6g41/Ou9zTSfy+oSX3RcdT0a4CSx/EspkB6EssXG2q9koA2WCOkJ+a4F9DtcboKr4sMvs
	kGl9JUJX1IuFQz1QRrBl6mWtgi6YQAc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587--pNMU4d8M1ysK9r0puxC1g-1; Fri, 09 Feb 2024 02:32:51 -0500
X-MC-Unique: -pNMU4d8M1ysK9r0puxC1g-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-78319f64126so84783785a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 23:32:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707463971; x=1708068771;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yY5P44hxC1Z4PKZ/FATMU8IHl7NhMLgeWkQFsYKZ1O8=;
        b=G7nwzae1drbLRm7YKmXFg7hqjXjoCleSfM/02CbOujvWnutjZEhmZbXQEig0oS3+hZ
         zvUhoMeNamB/o8OdDvD6GFAQ5yAAkfFoOHK8bWLBW3T/JOfNfE/PvhTLq5L21SwUL/ID
         MPmnk6OjHIOEpzPkQV5oAoJbYGTW8SEcZFOH0Uwqn4eTqa0X19Yak62MWYo4YOkTAJn7
         CoO/XlWa8Du+BIEPK5tyF6LxG73Uou7eC2zds2gdICEBsUy7dH/APfb410Y5sO2hDLP2
         oAbbQFjNNSz+d7aKb5wAEph+tw5K0nS1YENpKozlalc0kEH6wuflikhwcnBuRNE8/xEE
         AS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVR9h+vYolSRrBIMkAQ+/BxFmXSqDNAZ2PqHsRbeLT8vP1362DPDtKhh/bq7ivJ9mirz9jKiw1dOKgy8YBq4yGJj1jT3pugUjLHwnGuJg==
X-Gm-Message-State: AOJu0YyaxWpMO/zXmAmnGD5BKg6Waw0jnzmEEv5GSGAZBat7Z8qv8Mz3
	u2L6wU/N7DVT+4ZSe+Y5FoQBwd4Zwx5npF/oBxGVRjWV2hMIIAxQK7aVCdN5fGeEovpCiNSOrz6
	+3Cp5KtcXK/xiEsw6glwlMticF4kskIEsSBTVG3Gz28FWgLP9ROnGYaMg5QF0Je0=
X-Received: by 2002:a05:620a:4511:b0:785:4de5:e0cf with SMTP id t17-20020a05620a451100b007854de5e0cfmr839623qkp.13.1707463971214;
        Thu, 08 Feb 2024 23:32:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4tY5Tcj89/zw20tYT8a6Jj/CYnx9p7WyOp3A/Ob697w4U92gMwrcyM4oLMZ/oN/aG7asvNQ==
X-Received: by 2002:a05:620a:4511:b0:785:4de5:e0cf with SMTP id t17-20020a05620a451100b007854de5e0cfmr839609qkp.13.1707463970921;
        Thu, 08 Feb 2024 23:32:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViAPNQIorc1kcwO9Rgc7RZTcKOU+uPz9myAgQRlco7n9MJu4+j2FyLRzCrI7EgnJc23AYjLTYW6JcxjAVZZzSUmcpZ8ZpKJxYIgvjz1QWTyq5LskBqsyYI0YzOnEryES2gygi9HP/Y4XD8F9zH7lzArTKcDiQ2mC8jERMIM7x2eDHad8G88x3XEdWcCtcN0OfqdzRFADac6Pyv6cISSEArBzIr6EBL6VHAfeV2rQAa1Je36FomE+MGCVXsYwf0ZeiMZafcy3S8m3oPhOBH91GFtpdTSN2o17dxaQ6I6ZIDliqB+kVl1Wo1ZlDeooyJ3eTFUOj00GAxNMvoPkiPU08uvqFLelS4ozgy9YqifaRBfukJSg8deIo+plDKu2G8vUdhWXhbh6bJ05/9E37SFwWQgei5LKmRulsNS1bHe+OahtONEUuOKGiEwbGXzz6l+n/lphYZukXvHhuD1A9lkc/GYAkRMJ9GyFShJTby9cECwc3g+UnAnxLQXV/TYh1fNVL80nqZE4ydMi8Xzf0Yb0/fXriF
Received: from [192.168.0.9] (ip-109-43-177-145.web.vodafone.de. [109.43.177.145])
        by smtp.gmail.com with ESMTPSA id d25-20020a05620a159900b007840a08a097sm505152qkk.76.2024.02.08.23.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 23:32:50 -0800 (PST)
Message-ID: <9fb2f113-db36-41a6-a6f2-0499f28ace0a@redhat.com>
Date: Fri, 9 Feb 2024 08:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 2/8] arch-run: Clean up initrd cleanup
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-3-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240209070141.421569-3-npiggin@gmail.com>
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

On 09/02/2024 08.01, Nicholas Piggin wrote:
> Rather than put a big script into the trap handler, have it call
> a function.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   scripts/arch-run.bash | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 11d47a85..1e903e83 100644
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
> +		unset KVM_UNIT_TESTS_ENV_OLD
> +	fi
> +}

Looking at the original code below, shouldn't this rather unset 
KVM_UNIT_TESTS_ENV_OLD after the "fi" statement?

  Thomas


>   initrd_create ()
>   {
>   	if [ "$ENVIRON_DEFAULT" = "yes" ]; then
> -		trap_exit_push 'rm -f $KVM_UNIT_TESTS_ENV; [ "$KVM_UNIT_TESTS_ENV_OLD" ] && export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD" || unset KVM_UNIT_TESTS_ENV; unset KVM_UNIT_TESTS_ENV_OLD'
> +		trap_exit_push 'initrd_cleanup'
>   		[ -f "$KVM_UNIT_TESTS_ENV" ] && export KVM_UNIT_TESTS_ENV_OLD="$KVM_UNIT_TESTS_ENV"
>   		export KVM_UNIT_TESTS_ENV=$(mktemp)
>   		env_params

