Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B848818990
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 15:16:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OUO+h3zk;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OUO+h3zk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Svdz501Hpz3cPl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 01:16:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OUO+h3zk;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OUO+h3zk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvdyF04RSz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 01:15:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702995329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v4nROXlAiicNEglvMmsqm8SGfv1Cxad3KieGfFTyFDs=;
	b=OUO+h3zk6vLGyJD7sm6zuoaO1NULB8rk78gBRwZgWof7uThby4C/x02KZAe7XlPmXM/qYD
	YrJM4hXZqxdxesuzjLqYU0D4gPAyv3vYdBtgblWBZ52cCvRLqhnIdDlVLSmuHzPuOH4pN4
	ijdueMBq5DVwlrSJDVtupJk2JE9+3Xo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702995329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v4nROXlAiicNEglvMmsqm8SGfv1Cxad3KieGfFTyFDs=;
	b=OUO+h3zk6vLGyJD7sm6zuoaO1NULB8rk78gBRwZgWof7uThby4C/x02KZAe7XlPmXM/qYD
	YrJM4hXZqxdxesuzjLqYU0D4gPAyv3vYdBtgblWBZ52cCvRLqhnIdDlVLSmuHzPuOH4pN4
	ijdueMBq5DVwlrSJDVtupJk2JE9+3Xo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-c04khnggNlmKnterxpBtjQ-1; Tue, 19 Dec 2023 09:15:27 -0500
X-MC-Unique: c04khnggNlmKnterxpBtjQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-77f2d8199e4so697924085a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 06:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702995327; x=1703600127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4nROXlAiicNEglvMmsqm8SGfv1Cxad3KieGfFTyFDs=;
        b=fZqj8nqLYUSL4B4SthiILCJryepExKg/OWzkKYrraFFShJFPtfizZfDbnx96NdBL6/
         0mSKYjIyhRv9CmzHX2KjedCNt64otcQs+cWKFTZoP2pmO8mIjslqpYP0fopfGRRQtp4u
         RjuEQoyFg7qwCnZ5PpMJlFbG3kP1oFvvRNaYI6cF7Cjq9KY9zLhwPG8OOC3Sfqtda3uw
         xzTicQ1pk072Tb7PBkT7TTGin0WTQOclc6wsHW+rigPe7cxihjWg5pVX8UJRXkvTJZgp
         L/POvgUkfoNJirU1raWxrMYHfwDL9+8QgJHU4+wgCAlNZaNMOPZd0I/5YaK0i4T4/GAV
         65EQ==
X-Gm-Message-State: AOJu0YyCxIJUQQjGJsEGBrNGTYXX/OdjVwXPA1zkvaQJOMYq/Rk60itx
	itvG8AtQdfk5ClMPBcOupUILFh7HK7UefPaayQwF/E7onbHj54PN/FGAcgnSSXwwIpis6uH9n7v
	lam+NAcyLhD/KdWjjpQGf/DKqXg==
X-Received: by 2002:a05:620a:c9a:b0:77e:fba4:3a3d with SMTP id q26-20020a05620a0c9a00b0077efba43a3dmr18067561qki.147.1702995327285;
        Tue, 19 Dec 2023 06:15:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGWM0TMU4CFZY/qCGc8ha7a8BUR09IjdKv9t4jD4pdKSwaCFDzPK7Tp86PUXt3hkeVLTIQxg==
X-Received: by 2002:a05:620a:c9a:b0:77e:fba4:3a3d with SMTP id q26-20020a05620a0c9a00b0077efba43a3dmr18067552qki.147.1702995327085;
        Tue, 19 Dec 2023 06:15:27 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-177-45.web.vodafone.de. [109.43.177.45])
        by smtp.gmail.com with ESMTPSA id br6-20020a05622a1e0600b00425962ee7bdsm7290763qtb.18.2023.12.19.06.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 06:15:26 -0800 (PST)
Message-ID: <4e9e0ce9-8957-4b46-b428-23733fa200ad@redhat.com>
Date: Tue, 19 Dec 2023 15:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v5 25/29] powerpc: Add rtas stop-self
 support
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20231216134257.1743345-1-npiggin@gmail.com>
 <20231216134257.1743345-26-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231216134257.1743345-26-npiggin@gmail.com>
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
> In preparation for improved SMP support, add stop-self support to the
> harness. This is non-trivial because it requires an unlocked rtas
> call: a CPU can't be holding a spin lock when it goes offline or it
> will deadlock other CPUs. rtas permits stop-self to be called without
> serialising all other rtas operations.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/powerpc/asm/rtas.h |  2 ++
>   lib/powerpc/rtas.c     | 78 +++++++++++++++++++++++++++++++++---------
>   2 files changed, 64 insertions(+), 16 deletions(-)
...
> +void rtas_stop_self(void)
> +{
> +	struct rtas_args args;
> +	uint32_t token;
> +	int ret;
> +
> +	ret = rtas_token("stop-self", &token);
> +	if (ret) {
> +		puts("RTAS stop-self not available\n");
> +		return;
> +	}
> +
> +	ret = rtas_call_unlocked(&args, token, 0, 1, NULL);
> +	printf("RTAS stop-self returnd %d\n", ret);

s/returnd/returned/

> +}

With the typo fixed:

Reviewed-by: Thomas Huth <thuth@redhat.com>

