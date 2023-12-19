Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8371681875E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 13:23:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dKReT4V8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dKReT4V8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvbTB1T1mz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 23:23:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dKReT4V8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dKReT4V8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvbSL0J5nz2xch
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 23:22:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702988574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ScmodmRY1DhWwRsVePjC0/jEg/0Gnr/zqZH69W9QYvo=;
	b=dKReT4V8sLdiM6zQbn1Dtg1NmwY0BB0Hud4Sp4unjdblHx3NZJhO+jvTku47LgsgBVqaXg
	Kz6Z22ItTSOZL4u0qg/0ww1yPMSRfObY5mF+Y50GseYn3qca1DMnIUj4VzGQ9cHAWMS8pZ
	HWzK5FjdUus+jefWfDBGLsp11/fymyA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702988574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ScmodmRY1DhWwRsVePjC0/jEg/0Gnr/zqZH69W9QYvo=;
	b=dKReT4V8sLdiM6zQbn1Dtg1NmwY0BB0Hud4Sp4unjdblHx3NZJhO+jvTku47LgsgBVqaXg
	Kz6Z22ItTSOZL4u0qg/0ww1yPMSRfObY5mF+Y50GseYn3qca1DMnIUj4VzGQ9cHAWMS8pZ
	HWzK5FjdUus+jefWfDBGLsp11/fymyA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-iODH1VWxMzOdvQuieOvi6w-1; Tue, 19 Dec 2023 07:22:53 -0500
X-MC-Unique: iODH1VWxMzOdvQuieOvi6w-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-332ee20a3f0so3388072f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 04:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702988572; x=1703593372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ScmodmRY1DhWwRsVePjC0/jEg/0Gnr/zqZH69W9QYvo=;
        b=kBqHwStklJ16o264LaV7smkbGYW+PzKE+uLx88jE8jRG6DMPCPgkKmPY2TYPGwis+N
         qQVnZN7bGUV+X3YpJKikvlN3xVffpP0Dx+v4ZySZjTtI8LAZZji/PvVtSNSO3vHUW2hq
         HMDfdaArrJhSMGiCzzteKtItCoqXW9I7Mxfip2f0HkNTt+wUqC6nA/G60XOJnsVOG62R
         HAvxx75xdGKhTqmybVdRhIbvt0dytq1wqvYzrGbiG7HZIoWMyNUITA41rfswub9efNIX
         /RASyopLkpMpL0UtoQ76G7Kgy9gl9bwVxc5njenpkdomSCRgKs2eHv/6AlGuk5G+R8ZS
         sUTQ==
X-Gm-Message-State: AOJu0YxjLRrK+PN/4r7quuCyN676wzQ+JTs5AwStQRUTRMisLRmezk9F
	feP+LRv5ONrWrxIYQMdAcYCUHhJ5iGS65y0bTtiQ9cxsXM3qt0KFKHVlI7hPmsnV+h0UdSEcxEv
	y6agOn7Fxo0TZ1L+FVAQ/RJDrIQ==
X-Received: by 2002:adf:f652:0:b0:336:6d00:8bf8 with SMTP id x18-20020adff652000000b003366d008bf8mr628537wrp.286.1702988571948;
        Tue, 19 Dec 2023 04:22:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUUrGMNUDo5rUN3K5C3MerqRS07x5oLALxlgd/DLTTqO9GjZx+ekKpkLeF/li84wAv3gFW3w==
X-Received: by 2002:adf:f652:0:b0:336:6d00:8bf8 with SMTP id x18-20020adff652000000b003366d008bf8mr628531wrp.286.1702988571645;
        Tue, 19 Dec 2023 04:22:51 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-177-45.web.vodafone.de. [109.43.177.45])
        by smtp.gmail.com with ESMTPSA id k15-20020a5d628f000000b0033656783e76sm11211070wru.111.2023.12.19.04.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 04:22:51 -0800 (PST)
Message-ID: <464fccfc-b375-4458-b718-de606e50c61c@redhat.com>
Date: Tue, 19 Dec 2023 13:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v5 18/29] powerpc: Fix stack backtrace
 termination
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20231216134257.1743345-1-npiggin@gmail.com>
 <20231216134257.1743345-19-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231216134257.1743345-19-npiggin@gmail.com>
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
> The backtrace handler terminates when it sees a NULL caller address,
> but the powerpc stack setup does not keep such a NULL caller frame
> at the start of the stack.
> 
> This happens to work on pseries because the memory at 0 is mapped and
> it contains 0 at the location of the return address pointer if it
> were a stack frame. But this is fragile, and does not work with powernv
> where address 0 contains firmware instructions.
> 
> Use the existing dummy frame on stack as the NULL caller, and create a
> new frame on stack for the entry code.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/cstart64.S | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
> index e18ae9a2..14ab0c6c 100644
> --- a/powerpc/cstart64.S
> +++ b/powerpc/cstart64.S
> @@ -46,8 +46,16 @@ start:
>   	add	r1, r1, r31
>   	add	r2, r2, r31
>   
> +	/* Zero backpointers in initial stack frame so backtrace() stops */
> +	li	r0,0
> +	std	r0,0(r1)
> +	std	r0,16(r1)
> +
> +	/* Create entry frame */
> +	stdu	r1,-INT_FRAME_SIZE(r1)

Shouldn't that rather be STACK_FRAME_OVERHEAD instead of INT_FRAME_SIZE...

>   	/* save DTB pointer */
> -	std	r3, 56(r1)
> +	SAVE_GPR(3,r1)

... since SAVE_GPR uses STACK_FRAME_OVERHEAD (via GPR0), too?

  Thomas

