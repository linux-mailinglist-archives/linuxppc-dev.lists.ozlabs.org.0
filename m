Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA92867331
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 12:34:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PN0ic6+N;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QpsGPLQ3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjz6z564Gz3fFT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 22:34:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PN0ic6+N;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QpsGPLQ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjz6C0PHwz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 22:34:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708947245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZOaJdE8PeYEjIrCUWsmLxfgMZZ6msDvRYam8ZbRXslw=;
	b=PN0ic6+Nm/Y+rivjEwF4sPvbImC0T7Ysnp+of9BJnY7slvhO3T5wefyqnzQWujKFdfaX2V
	hwTl5CdxpzdkP+9Xae4PTjoBouFAHf1gnpMubMLNfTlHNkOwDbKO3SqJSUi/LqlYUOdn7l
	HLctU/u16rGYY7/o5hmU9Q/JJrqBVzw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708947246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZOaJdE8PeYEjIrCUWsmLxfgMZZ6msDvRYam8ZbRXslw=;
	b=QpsGPLQ3XiGGwqPVBcePT53/kr+tP+TiOg+paAeXA1nCxRTyR5l82Okgw3qr8axLF4S4yA
	DCMtuNDZ0o/5SCjqOR5/rEj+gKTufGOZLKYKBFp+v4TdZXdVFLejIMRwg5IPeU9IJGAtcj
	995yePRGdyi/JrAfoAAF8bAfAk//KKc=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-8683f82YPZys7-SFbwV1iQ-1; Mon, 26 Feb 2024 06:34:03 -0500
X-MC-Unique: 8683f82YPZys7-SFbwV1iQ-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-608cf88048eso32873957b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 03:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947243; x=1709552043;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOaJdE8PeYEjIrCUWsmLxfgMZZ6msDvRYam8ZbRXslw=;
        b=FLav8nfOcREn/G1PHmzL0jRcNwJUcKyrG8883wyYnwUC+rr/ug5eNq1TwWHOewxiLr
         Apmb25IJe2sdC/u1TBXB4Zj8DnVqdnM559sDbxPmWuDP+1USvBuDB7QPfGGOQcWXrAsj
         CbcDmEsr7Jd208qYGG74Vf0sNtKLOZaLG6ybL+tsEcuIkekkf5dPjc5bZ3REzN7K5J01
         PBoEvqec5Ty0aOb8rV37IRC+kptR/HJ8TSrTPeWG6wwKuRQmoDQ4MhFfGQ9uy/6mLuEt
         gMhZpXa/6nXAxe/m9cta/dBGLGCGUFLdPSEW9ElUFfPEIHrCG7FkHrJ6ur57AgQh6b9E
         4cEw==
X-Forwarded-Encrypted: i=1; AJvYcCX79aik+EDHuXeTe3SlC62WsW946JlvX7b0tiBYEDYPwOBwXhj9LvyNEa3Z6czBcOmLfztVVlFXdMmOgmrXg36/a94RB5t5Wd20WXx7BQ==
X-Gm-Message-State: AOJu0YzRYfBP56QjJzlUUkyTPvY4HbcK7eR2zUa8CGlHj2JLqW4xkN1z
	bJc6wjCVwDzJSlXj7Fg1cP3/jtXA5VhWQHsB+EemYH24uS1S7e2YjU0kpAgZDjncCkainhhcVe4
	QWmeuuBJMl7XaU52iZXj50hZ1NXA/kpEXiEKBxBT0UqowRGa5KHku9KOQvwdom7s=
X-Received: by 2002:a25:f306:0:b0:dcc:693e:b396 with SMTP id c6-20020a25f306000000b00dcc693eb396mr4104824ybs.2.1708947243391;
        Mon, 26 Feb 2024 03:34:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVfqVKS4F7BNE8Uq25y4OH59TTel/eaKivzXTgKLUGXdDfhzOnbhVGquOdGmRVkT2ExNTCUQ==
X-Received: by 2002:a25:f306:0:b0:dcc:693e:b396 with SMTP id c6-20020a25f306000000b00dcc693eb396mr4104813ybs.2.1708947243129;
        Mon, 26 Feb 2024 03:34:03 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-215.web.vodafone.de. [109.43.176.215])
        by smtp.gmail.com with ESMTPSA id a13-20020a05622a02cd00b0042dac47e9b4sm2344880qtx.5.2024.02.26.03.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 03:34:02 -0800 (PST)
Message-ID: <c05354c4-4130-4a55-8725-86fe9b676d75@redhat.com>
Date: Mon, 26 Feb 2024 12:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 01/32] powerpc: Fix KVM caps on POWER9
 hosts
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-2-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240226101218.1472843-2-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/02/2024 11.11, Nicholas Piggin wrote:
> KVM does not like to run on POWER9 hosts without cap-ccf-assist=off.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/run | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/powerpc/run b/powerpc/run
> index e469f1eb3..5cdb94194 100755
> --- a/powerpc/run
> +++ b/powerpc/run
> @@ -24,6 +24,8 @@ M+=",accel=$ACCEL$ACCEL_PROPS"
>   
>   if [[ "$ACCEL" == "tcg" ]] ; then
>   	M+=",cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off"
> +elif [[ "$ACCEL" == "kvm" ]] ; then
> +	M+=",cap-ccf-assist=off"
>   fi

Since it is needed in both cases, you could also move it out of the 
if-statement and remove it from the tcg part.

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>

