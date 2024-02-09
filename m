Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF66284F136
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 09:04:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdAmVzbs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdAmVzbs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWRGL55zSz3cX4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 19:04:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdAmVzbs;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdAmVzbs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWRFd4JsNz30fp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 19:04:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707465841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=faE/LK4IJAeEyH7ZjqMtZX/ViQ+jKg9nw9ZeSbxZmiM=;
	b=HdAmVzbsg6yYXylBJhxf+Nm+ksz/HSyTqP2n3yGuhvwj7fV8mWuv4i3a86ztP8Rl96S59k
	95bAFXrltGKZvofnQjrxUSCB6V/fC93SpFnnRXXZXDBE+odWP8W28oIdmhZHW41Hq4wD/Y
	Yr1+bB1QWw6Ido5vSmCRw4976xr/uOY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707465841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=faE/LK4IJAeEyH7ZjqMtZX/ViQ+jKg9nw9ZeSbxZmiM=;
	b=HdAmVzbsg6yYXylBJhxf+Nm+ksz/HSyTqP2n3yGuhvwj7fV8mWuv4i3a86ztP8Rl96S59k
	95bAFXrltGKZvofnQjrxUSCB6V/fC93SpFnnRXXZXDBE+odWP8W28oIdmhZHW41Hq4wD/Y
	Yr1+bB1QWw6Ido5vSmCRw4976xr/uOY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-XQ6SOXGQNO2JLZ9cKLhmWA-1; Fri, 09 Feb 2024 03:03:59 -0500
X-MC-Unique: XQ6SOXGQNO2JLZ9cKLhmWA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-68cacbd7d73so11598306d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 00:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707465839; x=1708070639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faE/LK4IJAeEyH7ZjqMtZX/ViQ+jKg9nw9ZeSbxZmiM=;
        b=j1QlT1UvRmQWFlscL+lVEJufDR+5CquwmD0hCD6uTETVCK24JMzOtGsx+Alx3AT7De
         7GUCEQephNKbe0yad6XZR3nUSgA0eIIGVxdqjC8LiM+d8HdOhduakM4PDp4tdUbeH3xh
         mPUGt82dork/ZghJeETb6cYcgC2lDqOd1Qg9AR8B1nkBqliqfIfMfL7eMRXPZvtR1+HQ
         TSpcw9WVNDN3hCtpr7DUj9G50at5tzWq6A6vHG21sqkPUl6PP6DLNVk3Rys78KrFi8nf
         vuqE9oqdTY+dOjSb7S28R3+QpEGgLMelbVm9R655VllTJkvnRqYxeKSKVwh1FBFrDVRP
         Qd2A==
X-Forwarded-Encrypted: i=1; AJvYcCWUD/M01H+fu/Y8qFg0i9BvA7/EXa8Tm0v0K48DULPnzU3kHy3m5u/d55I5/mpnL8R0+7Av5MHZ2/zLwTO7gIE35Mth7qSNNM7U2d6V2Q==
X-Gm-Message-State: AOJu0YzkYVUibRbQTvhwA6OO+V/mKlQVBHqmnllM5hYjiReJbE9msfW5
	cFD7YMplC+PiGjAYufwOPYNbEPALb848yIozixAS22XAXmc5WM7ZmFejUiRHTrXmD5gcJfeTduU
	kZzkoL1U2nRf5QV51fH8D33VWHXv8jX66kOSCSzK0Bnefa9bTw0+vvETzWpVE7zc=
X-Received: by 2002:a0c:f2c3:0:b0:68c:814e:5410 with SMTP id c3-20020a0cf2c3000000b0068c814e5410mr976889qvm.19.1707465839103;
        Fri, 09 Feb 2024 00:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH51X/CXuNxC3+hHzK8rvC/V3cxp3u9GUxeTMq/lAXErqJ+Tp2T2bQwIpIRQYR9MxuF6npl0g==
X-Received: by 2002:a0c:f2c3:0:b0:68c:814e:5410 with SMTP id c3-20020a0cf2c3000000b0068c814e5410mr976874qvm.19.1707465838862;
        Fri, 09 Feb 2024 00:03:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX20yFKEBRU1/oWDnU56mOKPVncgFDMKdfTosM/Yk+KIPkh78vhB1odUpVY/O4m6KLPfevoSLDiaOXv9XjHmD7MJMIRrvUPDiOZ5QYenFRecrs462DGWYC8hYOpqZddy999hbO7m+TUk8YNRXuFqFptAkHP3ED95yi5GJrhhbHR7LyYDiQXyqA5tzA3XZLQeo7zmQZtSkgEe2L4k2C1NE2T8xgS8VulTEE0kgeR6FA/kNr5wwjGduFG0xIuuvG1zPV1serdqneGovnMPSEgt2OxzNKEFMWGSKlNHiC3gERL+MycLx/d72un9mpTU7EHNHsouKwdDCj4Wy6Q255JwJ8/4IYNO8in88gUqjvuwTTy1aAU+7rK8KnMoVTihCgoc4x40gdROmEhKE2HAE2V7OLqW/XQrPv0gY/8hQBe5dlj9zOqu2Mpxwm3sLYOPkNP0f4ar0Tw44XyDYitI5tYSbNZw79AQneAOCJMZ5e4NhZsMemf2RV/MBQjDQb5KYZrufHkcCyRBUdKS2bVx5PxtmSfdRPA
Received: from [192.168.0.9] (ip-109-43-177-145.web.vodafone.de. [109.43.177.145])
        by smtp.gmail.com with ESMTPSA id pc8-20020a056214488800b0068c6d56d4f7sm595736qvb.92.2024.02.09.00.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 00:03:58 -0800 (PST)
Message-ID: <c143430d-482e-43bb-9c94-b6977c6482e5@redhat.com>
Date: Fri, 9 Feb 2024 09:03:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 6/8] migration: Add quiet migration
 support
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-7-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240209070141.421569-7-npiggin@gmail.com>
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
> Console output required to support migration becomes quite noisy
> when doing lots of migrations. Provide a migrate_quiet() call that
> suppresses console output and doesn't log a message.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/migrate.c         | 12 ++++++++++++
>   lib/migrate.h         |  1 +
>   scripts/arch-run.bash |  4 ++--
>   3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/migrate.c b/lib/migrate.c
> index b7721659..4e0ab516 100644
> --- a/lib/migrate.c
> +++ b/lib/migrate.c
> @@ -18,6 +18,18 @@ void migrate(void)
>   	report_info("Migration complete");
>   }
>   
> +/*
> + * Like migrate() but supporess output and logs, useful for intensive

s/supporess/suppress/

> + * migration stress testing without polluting logs. Test cases should
> + * provide relevant information about migration in failure reports.
> + */
> +void migrate_quiet(void)
> +{
> +	puts("Now migrate the VM (quiet)\n");
> +	(void)getchar();
> +}
> +
> +

Remove one empty line, please!

>   /*
>    * Initiate migration and wait for it to complete.
>    * If this function is called more than once, it is a no-op.
> diff --git a/lib/migrate.h b/lib/migrate.h
> index 2af06a72..95b9102b 100644
> --- a/lib/migrate.h
> +++ b/lib/migrate.h
> @@ -7,4 +7,5 @@
>    */
>   
>   void migrate(void);
> +void migrate_quiet(void);
>   void migrate_once(void);
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 0b45eb61..29cf9b0c 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -152,7 +152,7 @@ run_migration ()
>   		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
>   		-mon chardev=mon,mode=control > ${src_outfifo} &
>   	live_pid=$!
> -	cat ${src_outfifo} | tee ${src_out} &
> +	cat ${src_outfifo} | tee ${src_out} | grep -v "Now migrate the VM (quiet)" &
>   
>   	# The test must prompt the user to migrate, so wait for the "migrate"
>   	# keyword
> @@ -200,7 +200,7 @@ do_migration ()
>   		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
>   		< <(cat ${dst_infifo}) > ${dst_outfifo} &
>   	incoming_pid=$!
> -	cat ${dst_outfifo} | tee ${dst_out} &
> +	cat ${dst_outfifo} | tee ${dst_out} | grep -v "Now migrate the VM (quiet)" &
>   
>   	# The test must prompt the user to migrate, so wait for the "migrate" keyword
>   	while ! grep -q -i "Now migrate the VM" < ${src_out} ; do

  Thomas

