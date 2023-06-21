Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A06738821
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 16:56:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=isdibHY3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AjGYnRev;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmRR96C5Cz3bV3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 00:56:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=isdibHY3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AjGYnRev;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmRPP5qJfz3bXM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 00:55:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687359302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcvlcGOsdz8xmfczPODHKTAf1QOSvNikn1NEKXY6yqQ=;
	b=isdibHY3wQHmHPsdlBWr5r0KZgWsBA794GF0NDmowUgXeUMS+bDBM2xzHQyu82kjUvxMMj
	PFs69ohFUicjVDF53T0wB5UsiubzjA5GKdLTU9zgXQgxwg9lOYgp1GnIH+qPcjcQWRYOAc
	gQitZw0mX5y4fvRiU7rhBIsxhGT4ZxM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687359303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcvlcGOsdz8xmfczPODHKTAf1QOSvNikn1NEKXY6yqQ=;
	b=AjGYnRevslW19J+cRzzcOfWbOZMXVPTVPh1QU/Z2tbGVhHTIR2rQCVY93g3Xy1jHNyETE0
	D+WWgTrrfJ4kzwx8OadsX58uqs0yFp8212oyE84tFR653ij8qehkWLPirrt4Ru6mQpltAy
	OwmkG2PYgrElnM3k9CWGbOcL3c94wIA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-vff3avH-Ngy_pBbzUqyKlQ-1; Wed, 21 Jun 2023 10:55:01 -0400
X-MC-Unique: vff3avH-Ngy_pBbzUqyKlQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4f618172ed6so4437923e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 07:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687359299; x=1689951299;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VcvlcGOsdz8xmfczPODHKTAf1QOSvNikn1NEKXY6yqQ=;
        b=TXn6lXpKJdtLK12j/QmF0/B+44chQTHcpZ1JunhgrMbt5fH5UMLsQSHiYtEDUi8R2T
         U1BsAJyH4luz4v1CVbDMx4Vqsnycim3JeYJPprVIWR6HQaVHkNOFJC6LVHMnCDxLW4dM
         drffwl71zEQbat3uh3P2v2XIBAE9XTG0IdAvM1nWsSdnW0NAlBUs5bbXsmCB33GU5wpB
         4jJS6JL/4YPqgJ/UBlDPVs6Zykg980uRAeFNAcvMdN51amORvKxc3off1LmqLi6uIBg+
         9fRjdFc8JdcIrpSsiK4AN+eEtesgdStBqg56cvaO0qsRG8YNgPUoD2XQwiPlGY/cFmMn
         +Avg==
X-Gm-Message-State: AC+VfDxF6TDdRDuWM0Q1RS3gPE47REjdKmiq46vHIby31RgYpJTU6GGn
	2ZsTdoFSxVa+kETmM3Jh37qwAzVB5ugGiaK9krPp1CaKBqyq16Hs7ofg777gLDsdUbOrDsauHC0
	8CDUJxyKTEEP9eK1j3XFlIi/5qA==
X-Received: by 2002:a19:da12:0:b0:4f9:5622:4795 with SMTP id r18-20020a19da12000000b004f956224795mr2204138lfg.42.1687359299631;
        Wed, 21 Jun 2023 07:54:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5lKj8j3ZctUkIWEOuFj4T6DLcuWbUypmaju9CtFGHgHhgm9afUQ54tnfDfia7uz8bcTsc8ZA==
X-Received: by 2002:a19:da12:0:b0:4f9:5622:4795 with SMTP id r18-20020a19da12000000b004f956224795mr2204127lfg.42.1687359299272;
        Wed, 21 Jun 2023 07:54:59 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-207.web.vodafone.de. [109.43.177.207])
        by smtp.gmail.com with ESMTPSA id p20-20020a05600c205400b003f9a6f3f240sm9249173wmg.14.2023.06.21.07.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 07:54:58 -0700 (PDT)
Message-ID: <daa0bae9-38ec-e3ab-5ed7-de214091d2e8@redhat.com>
Date: Wed, 21 Jun 2023 16:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [kvm-unit-tests v4 02/12] powerpc: Add some checking to exception
 handler install
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230608075826.86217-1-npiggin@gmail.com>
 <20230608075826.86217-3-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230608075826.86217-3-npiggin@gmail.com>
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
> Check to ensure exception handlers are not being overwritten or
> invalid exception numbers are used.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Since v3:
> - Simplified code as suggested by Thomas.
> 
>   lib/powerpc/processor.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> index 05b4b04f..0550e4fc 100644
> --- a/lib/powerpc/processor.c
> +++ b/lib/powerpc/processor.c
> @@ -19,12 +19,16 @@ static struct {
>   void handle_exception(int trap, void (*func)(struct pt_regs *, void *),
>   		      void * data)
>   {
> +	assert(!(trap & ~0xf00));
> +
>   	trap >>= 8;
>   
> -	if (trap < 16) {
> -		handlers[trap].func = func;
> -		handlers[trap].data = data;
> +	if (func && handlers[trap].func) {
> +		printf("exception handler installed twice %#x\n", trap);
> +		abort();
>   	}
> +	handlers[trap].func = func;
> +	handlers[trap].data = data;
>   }
>   
>   void do_handle_exception(struct pt_regs *regs)

Reviewed-by: Thomas Huth <thuth@redhat.com>

