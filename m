Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13C6CA7DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 16:40:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Plb7l4Y9yz3fV5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 01:40:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCG2+TMM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCG2+TMM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCG2+TMM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCG2+TMM;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Plb6p2kNCz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 01:39:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679927947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XoDLXhYZX6z7BtIjLUpiIi7lTU4JmFeBrYERY2LWfk0=;
	b=XCG2+TMMN2LhBLL9AJ+6dAXCmUKgWVcsN06sM1lSqVEzqHo+07h9b+k9xGkifrrea8/XFN
	68eP2nzEyzjx1agg2lIzwXWFaTIHJluIJgGVX3h/hzmK1Omga2oIbFet4Id925zABOfU+S
	b4CYPrdUHMYBb3jCu/dNcu/+oV67k1A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679927947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XoDLXhYZX6z7BtIjLUpiIi7lTU4JmFeBrYERY2LWfk0=;
	b=XCG2+TMMN2LhBLL9AJ+6dAXCmUKgWVcsN06sM1lSqVEzqHo+07h9b+k9xGkifrrea8/XFN
	68eP2nzEyzjx1agg2lIzwXWFaTIHJluIJgGVX3h/hzmK1Omga2oIbFet4Id925zABOfU+S
	b4CYPrdUHMYBb3jCu/dNcu/+oV67k1A=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-lJeewVUbPNuXWIiAcmr30Q-1; Mon, 27 Mar 2023 10:39:05 -0400
X-MC-Unique: lJeewVUbPNuXWIiAcmr30Q-1
Received: by mail-qt1-f197.google.com with SMTP id c14-20020ac87d8e000000b003e38726ec8bso6119530qtd.23
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 07:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679927944;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XoDLXhYZX6z7BtIjLUpiIi7lTU4JmFeBrYERY2LWfk0=;
        b=2LDQCkCH/MGidfhdOyctNlHulv6S9LDvIXKsB+0dxt2iLqmPHedy+ib+8SY5QI90aA
         SwXr0wtH93R4ZYuHDJ6OjocpeJArlCOm/grVplMl8FzPvFN9bHgsxjU/41L3PQu/0QTc
         vbDk8wmuks9stTX2+ZKUPHiaYyUmjj4ECnUZfsgPlAzN0qVAcl7v6IYzp7WNlh6JNnSa
         WLEQqGRFyQcNu35C37Jrgv8JXYu/MUDT//ZgKKnWlgyuA+xF5gFf9oGz+20r8GCNovBl
         BrHb6bk2FuP2T2IOe56CaHmm106ichKf2H6KwlAtKBMuvANYrSjz0PeWgfTJmd6eGDkv
         RQEQ==
X-Gm-Message-State: AO0yUKXLdVsgfJty5956VgSKnc2f0hwsV1VDGCtfU9cqIZ8KfkyWvaTs
	7pUGZQKeyOzqz8+bpiZADrz85ChQdPOEwAEvCD+ZAA1z6B677Of1p7IiGS4F/gkElMHk1ZC3E9L
	VepBPZKGrzMpUVcymWcpsPVnK1g==
X-Received: by 2002:a05:622a:1648:b0:3b8:6ae9:b10d with SMTP id y8-20020a05622a164800b003b86ae9b10dmr20414133qtj.2.1679927944793;
        Mon, 27 Mar 2023 07:39:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set+AIVfKyZ43ZdQzZE7WjGbMC2MuGN2mWA2dKyIEH1RqiiXs9Z6es282UQxXRqnv8qSeMs3zsw==
X-Received: by 2002:a05:622a:1648:b0:3b8:6ae9:b10d with SMTP id y8-20020a05622a164800b003b86ae9b10dmr20414102qtj.2.1679927944544;
        Mon, 27 Mar 2023 07:39:04 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-5.web.vodafone.de. [109.43.177.5])
        by smtp.gmail.com with ESMTPSA id y3-20020a37f603000000b0074382b756c2sm16747347qkj.14.2023.03.27.07.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 07:39:03 -0700 (PDT)
Message-ID: <229dd5e2-b757-d28b-b9db-0d9efce4c5d1@redhat.com>
Date: Mon, 27 Mar 2023 16:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests v3 03/13] powerpc: Add some checking to exception
 handler install
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230327124520.2707537-1-npiggin@gmail.com>
 <20230327124520.2707537-4-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230327124520.2707537-4-npiggin@gmail.com>
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

On 27/03/2023 14.45, Nicholas Piggin wrote:
> Check to ensure exception handlers are not being overwritten or
> invalid exception numbers are used.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Since v2:
> - New patch
> 
>   lib/powerpc/processor.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> index ec85b9d..70391aa 100644
> --- a/lib/powerpc/processor.c
> +++ b/lib/powerpc/processor.c
> @@ -19,11 +19,23 @@ static struct {
>   void handle_exception(int trap, void (*func)(struct pt_regs *, void *),
>   		      void * data)
>   {
> +	if (trap & 0xff) {

You could check for the other "invalid exception handler" condition here 
already, i.e. if (trap & ~0xf00) ...

I'd maybe simply do an "assert(!(trap & ~0xf00))" here.

> +		printf("invalid exception handler %#x\n", trap);
> +		abort();
> +	}
> +
>   	trap >>= 8;
>   
>   	if (trap < 16) {

... then you could get rid of the if-statement here and remove one level of 
indentation in the code below.

> +		if (func && handlers[trap].func) {
> +			printf("exception handler installed twice %#x\n", trap);
> +			abort();
> +		}
>   		handlers[trap].func = func;
>   		handlers[trap].data = data;
> +	} else {
> +		printf("invalid exception handler %#x\n", trap);
> +		abort();
>   	}
>   }
>   

  Thomas

