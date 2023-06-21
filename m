Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A3173880B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 16:55:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I5D7ZIum;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I5D7ZIum;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmRQ24Gdbz3bkm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 00:55:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I5D7ZIum;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I5D7ZIum;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Thu, 22 Jun 2023 00:54:49 AEST
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmRP52LRGz2yJT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 00:54:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687359286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GeZs+jwlXBX1tLofoVAWxWqbasSnP0VwG7VyNj9+EHg=;
	b=I5D7ZIumEOw1lLJYp1JvvFSEZoJ9OIZD+VoqtTS8exWc3RUpWBbSbA06PmwTEmrjWV3498
	2hh65Sjbj2p+2KFZf3VO89C8Cps9qBT7NerR7m2ua0E2FdEQEc/0R4qyru+qQvaMSjxfFp
	/0r4YPyI5j4KYsba4dqjru/tUCtMhBc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687359286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GeZs+jwlXBX1tLofoVAWxWqbasSnP0VwG7VyNj9+EHg=;
	b=I5D7ZIumEOw1lLJYp1JvvFSEZoJ9OIZD+VoqtTS8exWc3RUpWBbSbA06PmwTEmrjWV3498
	2hh65Sjbj2p+2KFZf3VO89C8Cps9qBT7NerR7m2ua0E2FdEQEc/0R4qyru+qQvaMSjxfFp
	/0r4YPyI5j4KYsba4dqjru/tUCtMhBc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-erG5otr7O9qiyJjCSuRO0A-1; Wed, 21 Jun 2023 10:53:36 -0400
X-MC-Unique: erG5otr7O9qiyJjCSuRO0A-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f904171f68so19612325e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 07:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687359215; x=1689951215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GeZs+jwlXBX1tLofoVAWxWqbasSnP0VwG7VyNj9+EHg=;
        b=DYiaIKlkm0iNQWG84iOKZehFySi6PWRNc0yWoWlA0r7xHIPhn6AiP9SOdg8zjpBu1j
         8Eet0yzcmggQHVV7GqJ998oJ3sbn8dscx2c8ywHeA9uZo7FFOEDWPM2WnBF73zGni58F
         9ylLQo6DzFz/LVeBuGAnRN3fyYOAjwFm6NVGpu4uiW4IDXCpNCIGbAfKVUN933c7PMTp
         4WTt6Veiq/f9vGH09vhERoBm8xRzQJdLE1A+QbT9hdBJ0sO/VGp8w8dpCKoTpo/akQ7o
         2Xjx3r66blfQH8+Q8GiAE/ohQ6oFOuyyuwWPZcl4YhSQ/05tHndA7j7W06oFFpCrQ76y
         3kHg==
X-Gm-Message-State: AC+VfDw+Uxyz8YS8vP5KhJbKeCZNyiLIipX1c4t/aG8uQ7WzOIXiGtnF
	EUqBV0ucYTorXw0AaBsyoSE1wzMKLP2+n0r4gT8RnhXgEYP/yi5pqea3k4e4jrm7WhlrEBCzLNQ
	CEJNDNOgHWfHpe80a6r8z1+/R6Q==
X-Received: by 2002:a7b:c449:0:b0:3f4:a09f:1877 with SMTP id l9-20020a7bc449000000b003f4a09f1877mr10594897wmi.23.1687359215250;
        Wed, 21 Jun 2023 07:53:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7kRklZYhudrDIRDRvq8YcUS+UQyVgGseZ4iznRyerpUi+anoSLkz9E7sW+j+pZOTiyYd9AAA==
X-Received: by 2002:a7b:c449:0:b0:3f4:a09f:1877 with SMTP id l9-20020a7bc449000000b003f4a09f1877mr10594885wmi.23.1687359214959;
        Wed, 21 Jun 2023 07:53:34 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-207.web.vodafone.de. [109.43.177.207])
        by smtp.gmail.com with ESMTPSA id t20-20020a1c7714000000b003f900678815sm5174357wmi.39.2023.06.21.07.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 07:53:34 -0700 (PDT)
Message-ID: <f9164de8-e358-089c-00b3-35ba669aedcb@redhat.com>
Date: Wed, 21 Jun 2023 16:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [kvm-unit-tests v4 01/12] powerpc: Report instruction address and
 MSR in unhandled exception error
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230608075826.86217-1-npiggin@gmail.com>
 <20230608075826.86217-2-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230608075826.86217-2-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/06/2023 09.58, Nicholas Piggin wrote:
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Since v3:
> - New patch
> 
>   lib/powerpc/processor.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> index ec85b9d8..05b4b04f 100644
> --- a/lib/powerpc/processor.c
> +++ b/lib/powerpc/processor.c
> @@ -38,7 +38,7 @@ void do_handle_exception(struct pt_regs *regs)
>   		return;
>   	}
>   
> -	printf("unhandled cpu exception %#lx\n", regs->trap);
> +	printf("unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n", regs->trap, regs->nip, regs->msr);

<bikeshedding> Why NIA and not NIP ? </bikeshedding>

  Thomas

