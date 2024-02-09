Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D9084F0C7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 08:29:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V9CFALgE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V9CFALgE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWQVC0bPsz3cVy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:29:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V9CFALgE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V9CFALgE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWQTR6VsGz3bt2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:29:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707463752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/kCQkh1KyEVD4cmjxJdTLiN9QRnCpv4ZYb6SgTC6zQo=;
	b=V9CFALgE9hp/66AHUspo4sCR6PEQysF2V8fIVIkc3wTHXd5ouDU+AXCzFCIRzezU85BCJw
	C+CwM98elL/WI1hBnqeRKNzGDGJmMG8wxHDoDUdKxGSozCBCDWi+CTmq65YNfZQGaMC5F3
	Hqu6svgMzzLvBpZqGR60pdMZYCqkEDM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707463752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/kCQkh1KyEVD4cmjxJdTLiN9QRnCpv4ZYb6SgTC6zQo=;
	b=V9CFALgE9hp/66AHUspo4sCR6PEQysF2V8fIVIkc3wTHXd5ouDU+AXCzFCIRzezU85BCJw
	C+CwM98elL/WI1hBnqeRKNzGDGJmMG8wxHDoDUdKxGSozCBCDWi+CTmq65YNfZQGaMC5F3
	Hqu6svgMzzLvBpZqGR60pdMZYCqkEDM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-15rA51xfMFSddL4u5Yan8Q-1; Fri, 09 Feb 2024 02:29:10 -0500
X-MC-Unique: 15rA51xfMFSddL4u5Yan8Q-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-42c516d5324so5522491cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 23:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707463750; x=1708068550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kCQkh1KyEVD4cmjxJdTLiN9QRnCpv4ZYb6SgTC6zQo=;
        b=aD/K5Rky5bYZrLKXHEY6aUdGR1/g22oyuaZzq6BQDxyhOOozuiZBdvJfZdnwN1WJ1+
         uWqkC1icUbVQhDWLCnV4ebaWfco9d2D65XNiJkPoslsePCBxKp6XRtToUjqYAUZQSrpM
         GvAS1LBDTqiJqaVa1zbHt7XZlvmD5W5YEK398iHTw4HiObrWO4SWui+XNwpUkOJ4riZQ
         RNBdWfXug6CaUKH0p3L6cs6BZmaQ3ptX5hCRHHBP7BGnzruXInQLWIB1GgcZLvpddj7I
         zMpPal+quYnmIvNx2BIZkmAgaPUutDOgJsrsscARjHyZsoeIqoU411O4oPkoxGmZMgkB
         npcw==
X-Gm-Message-State: AOJu0YwDIMStwRZ6ZNBEHLASK5CIterKR6864BZwlfl4Rl08/fq2Lrnw
	nur6JzWOSYnGubt0v7GYoelPoWOdkoRJJwHmcYvZRNFtQt1wMxJdbEF8RPZ+c7AhNT8lVqlZcZ8
	fc30870F1zGlrfQ/Ah5/ziCDQLoy0UrX5P16q0GBB164fshQuNz3xvR8A60fjDf8=
X-Received: by 2002:a05:622a:1893:b0:42b:eba5:ddfa with SMTP id v19-20020a05622a189300b0042beba5ddfamr1059542qtc.45.1707463749918;
        Thu, 08 Feb 2024 23:29:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMxjVKgUnE4ZnmcUKcBrw8kAOVCQv/Rc0MeOA1nppU8LiVZdGnfF07uBuSMXuz36m7DpRJVA==
X-Received: by 2002:a05:622a:1893:b0:42b:eba5:ddfa with SMTP id v19-20020a05622a189300b0042beba5ddfamr1059535qtc.45.1707463749665;
        Thu, 08 Feb 2024 23:29:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUx7B+ytx1jxJQX4+UCEaD6tXqKT6ucApPaiWJaZykn+w/0+a9uoX07+JiQbkbUn2PocH3WgLLSAwUWCRqHLGHfWw2RM4gftDO26hfG00892hDH/nJBHtY35xRnxec4jWrutSej2X3k58etZWZejKzojLkXvBJ7hvnLpXN0AoJ2560dbm7gHPx7EJppgxU63rFF0u8DPA+3VHkOqpci+TKf9Wp5TIhYbCCaygZuy+m1DQ5pbTM1MKkDYTdZB9UnU9lQPdwTJoEvO97tO2IdFk9FiKPj9ddRMld7j1xZPqY547vGm/HC+tp1mEl/USbhRvbnQ72Ad5RgfOARa2559A6Vt+yf24Q/bOtJmEGg3B6CWBY7L0Rg8RDCDi+fi04SNLskUP7nJczW7S7vwmU2WPv2EqZ+9Y53w1KMMTYX0YLPc/MGl6CV0YUBpPrD4O1KSAwTn7NQhEycInPV/3oHrbqfF7HYyqpqWNB9zMeyggz1/irjDv7QjtE1NmSqRVyQwe64oC6pBEOXKjOMY9TXeo57xpo
Received: from [192.168.0.9] (ip-109-43-177-145.web.vodafone.de. [109.43.177.145])
        by smtp.gmail.com with ESMTPSA id c19-20020a05622a025300b00427fb1d6b44sm480566qtx.5.2024.02.08.23.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 23:29:09 -0800 (PST)
Message-ID: <4203f6dc-ad8c-4bcd-a366-f50f866c55ec@redhat.com>
Date: Fri, 9 Feb 2024 08:29:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 1/8] arch-run: Fix TRAP handler
 recursion to remove temporary files properly
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-2-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240209070141.421569-2-npiggin@gmail.com>
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
> Migration files were not being removed when the QEMU process is
> interrupted (e.g., with ^C). This is becaus the SIGINT propagates to the
> bash TRAP handler, which recursively TRAPs due to the 'kill 0' in the
> handler. This eventually crashes bash.
> 
> This can be observed by interrupting a long-running test program that is
> run with MIGRATION=yes, /tmp/mig-helper-* files remain afterwards.
> 
> Removing TRAP recursion solves this problem and allows the EXIT handler
> to run and clean up the files.
> 
> This also moves the trap handler before temp file creation, and expands
> the name variables at trap-time rather than install-time, which closes
> the small race between creation trap handler install.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   scripts/arch-run.bash | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index d0864360..11d47a85 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -129,6 +129,9 @@ run_migration ()
>   		return 77
>   	fi
>   
> +	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
> +	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
> +
>   	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
>   	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
>   	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
> @@ -137,9 +140,6 @@ run_migration ()
>   	qmpout1=/dev/null
>   	qmpout2=/dev/null
>   
> -	trap 'kill 0; exit 2' INT TERM
> -	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
> -
>   	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
>   		-mon chardev=mon1,mode=control | tee ${migout1} &
>   	live_pid=`jobs -l %+ | grep "eval" | awk '{print$2}'`
> @@ -209,11 +209,11 @@ run_panic ()
>   		return 77
>   	fi
>   
> -	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
> -
> -	trap 'kill 0; exit 2' INT TERM
> +	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
>   	trap 'rm -f ${qmp}' RETURN EXIT
>   
> +	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
> +
>   	# start VM stopped so we don't miss any events
>   	eval "$@" -chardev socket,id=mon1,path=${qmp},server=on,wait=off \
>   		-mon chardev=mon1,mode=control -S &

Reviewed-by: Thomas Huth <thuth@redhat.com>

