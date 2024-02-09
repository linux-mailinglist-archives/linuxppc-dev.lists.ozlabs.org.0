Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA884F0EE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 08:44:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dToVorwG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dToVorwG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWQq03rP6z3cWx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:44:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dToVorwG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dToVorwG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWQpC2MFVz3c12
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:43:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707464623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uGf78GSSLTQpF5Eiu1od52sEG+/7hU+ZiNNhjo8N8WA=;
	b=dToVorwGUta7TBePvOEAE4V5TpJFI8A8vTV9A1EBVDWtEFD/JiFlk1vtoVtR0ZzuNbioLm
	RYEh5lxryR3wIoGmurJ0hCZiZambftfbMPzJ0/Fmq67OeRRJd8FO11P8YUvwhefiNATpUG
	sNPn41yiJEjABODonpYJR5WekN1ncvs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707464623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uGf78GSSLTQpF5Eiu1od52sEG+/7hU+ZiNNhjo8N8WA=;
	b=dToVorwGUta7TBePvOEAE4V5TpJFI8A8vTV9A1EBVDWtEFD/JiFlk1vtoVtR0ZzuNbioLm
	RYEh5lxryR3wIoGmurJ0hCZiZambftfbMPzJ0/Fmq67OeRRJd8FO11P8YUvwhefiNATpUG
	sNPn41yiJEjABODonpYJR5WekN1ncvs=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-14wFLTtFPCOLn7VIK9bOgQ-1; Fri, 09 Feb 2024 02:43:41 -0500
X-MC-Unique: 14wFLTtFPCOLn7VIK9bOgQ-1
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-d9a541b720aso1260510276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 23:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707464621; x=1708069421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGf78GSSLTQpF5Eiu1od52sEG+/7hU+ZiNNhjo8N8WA=;
        b=nK3rPG1K6BMSQOiXNzn8v72FU8505hv4AePY3LhaULyoTjMDUS6sfGj3iXp3JWmom8
         1HFiyiuk3+qJdPnGuAw0oAYrmcZL9/Y6RDBPKz1uHERJjsi8V53BasHgmhk15lx1HL6Z
         eLza3LtxPWSqOG1kLcvBKYtwMAuc5rlRavb/DHZ7nFlKcC6RyZJYA7JOAEYO+5EQJLi6
         bIAtKaG8A4nT38ZeNRfj2MVsgrQpyVnns/Al6ajVadw8YiriGW/F3pOstQt2zAFBI0jU
         5449Ek6X2GAwRoAmqJjnCKap4MMgwFT5tWvUJEPIWrXALsBlfdF/unEPuMAXTkexdxgz
         pJVA==
X-Forwarded-Encrypted: i=1; AJvYcCUhGw6DR5RIUc42MUKyUDapfZDCbroDxcffrf+x4CqrhZqre43t98GweTWg7aGAnqm7L8HpwNxVvg+9HCh9VjpdM6MTx1Gkpkxe/5scdA==
X-Gm-Message-State: AOJu0YzUPFHCQ/tCQh/Vpwb4QDC2alXG/APNlIBHxXAEzWp0cdDwtGoy
	rYDjkEst3/Jo+YO+q8gPY08z+c0ietnw4JEC1KCn9NCWy4zo5MPRT4pzxuMReJiKIyF0AskLMgR
	TvhxcwU2JWuepXBZQGPrtThQgHqel8j/oByAlvTb19cAno/QPNMj9/yO0uQOAcK8=
X-Received: by 2002:a25:aa52:0:b0:dc7:43d3:f8ad with SMTP id s76-20020a25aa52000000b00dc743d3f8admr648601ybi.17.1707464620930;
        Thu, 08 Feb 2024 23:43:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbgR3CX6WL1xJqNIMgL+kDPRru4nEZNqoR3X4gAa+eKU/MkxNMcm314BtV0Lijrngudkcgkw==
X-Received: by 2002:a25:aa52:0:b0:dc7:43d3:f8ad with SMTP id s76-20020a25aa52000000b00dc743d3f8admr648593ybi.17.1707464620627;
        Thu, 08 Feb 2024 23:43:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6g1EbNCn917cZPsbp5MO+NEUukYuQnS3RNDprf6cv3wTiBU7QEhHd5yUZYW9Qce6Q+uakpHlHL1ABMIZ9RuQn1oBW6Q67mSmjG/UXwZmwtGMs0JRvaEH6P18YWtmtxeAea1dbNFyEaI8WAfO44dYhNup8uFIOO0URyCcd/ycR5HrJEy/cNshtDkcDkPGrhLAyPT7YY8Ka9YyJIV20mCUc6lRn/GEfeRIiZAk0oceCZ21NlVwg/6kioJWPDVhdrLLgV3g7MjnG/D8CzCGSi3ry6GqqvfoYCHFkzCduzGYGL2vaYSe80DnIN+kCFZJK4V2m/fhPoqBa8JUwRHtjkOrtoOXi7mH4rSLfHdDOmRvjrN62uTaObl1mr48aJygF1P8FMihQ3JlHls4abX05/9ArPJ6IHXSJ4lcYeOCiqDQe4R1AMG1mIJ5i/ZpPqZ40p84vU0FPXrQHVXNzd/MsypENUB2Q5ZU41KmD8+o14mcjgfaKdYeNXcKV7gsyIxhGk+S0Zs7uktfVhxyDvqXIeRsSxNvK
Received: from [192.168.0.9] (ip-109-43-177-145.web.vodafone.de. [109.43.177.145])
        by smtp.gmail.com with ESMTPSA id i12-20020ac85c0c000000b0042bf5ec20f0sm481421qti.30.2024.02.08.23.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 23:43:40 -0800 (PST)
Message-ID: <9b041258-e412-4745-a213-6798e682ea62@redhat.com>
Date: Fri, 9 Feb 2024 08:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 3/8] migration: use a more robust way to
 wait for background job
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-4-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240209070141.421569-4-npiggin@gmail.com>
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
> Starting a pipeline of jobs in the background does not seem to have
> a simple way to reliably find the pid of a particular process in the
> pipeline (because not all processes are started when the shell
> continues to execute).
> 
> The way PID of QEMU is derived can result in a failure waiting on a
> PID that is not running. This is easier to hit with subsequent
> multiple-migration support. Changing this to use $! by swapping the
> pipeline for a fifo is more robust.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   scripts/arch-run.bash | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 1e903e83..3689d7c2 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -130,19 +130,22 @@ run_migration ()
>   	fi
>   
>   	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
> -	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
> +	trap 'rm -f ${migout1} ${migout_fifo1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
>   
>   	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
>   	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
> +	migout_fifo1=$(mktemp -u -t mig-helper-fifo-stdout1.XXXXXXXXXX)
>   	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
>   	qmp2=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
>   	fifo=$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
>   	qmpout1=/dev/null
>   	qmpout2=/dev/null
>   
> +	mkfifo ${migout_fifo1}
>   	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
> -		-mon chardev=mon1,mode=control | tee ${migout1} &
> -	live_pid=`jobs -l %+ | grep "eval" | awk '{print$2}'`
> +		-mon chardev=mon1,mode=control > ${migout_fifo1} &
> +	live_pid=$!
> +	cat ${migout_fifo1} | tee ${migout1} &
>   
>   	# We have to use cat to open the named FIFO, because named FIFO's, unlike
>   	# pipes, will block on open() until the other end is also opened, and that
> @@ -150,7 +153,7 @@ run_migration ()
>   	mkfifo ${fifo}
>   	eval "$@" -chardev socket,id=mon2,path=${qmp2},server=on,wait=off \
>   		-mon chardev=mon2,mode=control -incoming unix:${migsock} < <(cat ${fifo}) &
> -	incoming_pid=`jobs -l %+ | awk '{print$2}'`
> +	incoming_pid=$!
>   
>   	# The test must prompt the user to migrate, so wait for the "migrate" keyword
>   	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
> @@ -164,6 +167,10 @@ run_migration ()
>   		sleep 1
>   	done
>   
> +	# Wait until the destination has created the incoming and qmp sockets
> +	while ! [ -S ${migsock} ] ; do sleep 0.1 ; done
> +	while ! [ -S ${qmp2} ] ; do sleep 0.1 ; done
> +
>   	qmp ${qmp1} '"migrate", "arguments": { "uri": "unix:'${migsock}'" }' > ${qmpout1}
>   
>   	# Wait for the migration to complete

Reviewed-by: Thomas Huth <thuth@redhat.com>

