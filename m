Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 201308A62A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 06:55:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MT8NRv7P;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MT8NRv7P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJWv16tGwz3vZ5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 14:55:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MT8NRv7P;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MT8NRv7P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJWtG5LwMz3d2c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 14:54:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713243283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QtYxLkzgtIthEIjNpO3EbnuoUG9HOkNB0zBIkI46gFk=;
	b=MT8NRv7PcCrw/yVqCv7KjSR1/srhFWYludzHLCeVtUujes4W/Tiu+lkchjLkTAbp37FQxF
	xSCYNgFJgmWTOOerIZaPHYbeZyrtc2HdtXXhejbaamA/H42TdzWFJhoH62bSEBgGdR6hdf
	MmlhXBHEyOG6j1czxveZHAn8o+6NGm4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713243283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QtYxLkzgtIthEIjNpO3EbnuoUG9HOkNB0zBIkI46gFk=;
	b=MT8NRv7PcCrw/yVqCv7KjSR1/srhFWYludzHLCeVtUujes4W/Tiu+lkchjLkTAbp37FQxF
	xSCYNgFJgmWTOOerIZaPHYbeZyrtc2HdtXXhejbaamA/H42TdzWFJhoH62bSEBgGdR6hdf
	MmlhXBHEyOG6j1czxveZHAn8o+6NGm4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-A_9d1bFgNrCaaf7W9d7OtQ-1; Tue, 16 Apr 2024 00:54:41 -0400
X-MC-Unique: A_9d1bFgNrCaaf7W9d7OtQ-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-78edb34cf1fso235469785a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 21:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713243281; x=1713848081;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtYxLkzgtIthEIjNpO3EbnuoUG9HOkNB0zBIkI46gFk=;
        b=YR/tsxXoNdQ8hLXsrKGzCi8oIUQ5mAdOS/5JXYnz6SW5OoeK0SFGaqPfONHizhkbzE
         p9F2WDsSbotg4gAMG/KSc4aJJqxYO/6pFGgaR6oIN+WZts/qCk97oxNOpint1mDq9w50
         e+18f7k/H5xjLiBc/+Q5bWu9aKaBu1VLlxTdB4CaL4ALVXkt4fUC9aAPuWCLoQLibbm9
         QiZ/LFEKf8rOlcG6d7lm5YNTMzSuxbYd89cUqJKYHOHthSqt/btbWpdfcS0ReDG8NOwE
         UGTVPoIEp6Hvdn42LVb5CUEdhqm1KERvny33Q5DnOv0XVedgbk0AM3dgFKD9rO0naR8b
         JNsw==
X-Forwarded-Encrypted: i=1; AJvYcCW0L1k3WUmNJ0ibI0kTreXPoVKLsqSN5HqKH+kI21KUoqSAgEusAGfdonUnw5Bik6dVXNdHnBZmKLdTUQQTP1D7NmVFRWBvGn+Nt29+2g==
X-Gm-Message-State: AOJu0YydDvVM0OTAG8c06VVEsDFEVT46lfFr702iA5F6k7/XSUGOodMU
	Y0yZtBQDFBdX+x3h9hfEPquDkyr2Aa1o48nH2bWzz6hNTvB0YbMk9y5hZXLuwGpiUPEcGrPtbmE
	jP2ZRV6mTW2DTMvA77aMBkSsfpc0YYe8JTEzI/3RHxoLZSGu24dwcrvi3NdxR3sw=
X-Received: by 2002:a05:620a:a56:b0:78e:dcb8:b4be with SMTP id j22-20020a05620a0a5600b0078edcb8b4bemr6563494qka.6.1713243281291;
        Mon, 15 Apr 2024 21:54:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGOhtPKeXE17Xrs3CwccnCNEjZptuSRggNk+qbBK/WJhegW0VD1YdUF0pvPxb2tr0TK/2WTw==
X-Received: by 2002:a05:620a:a56:b0:78e:dcb8:b4be with SMTP id j22-20020a05620a0a5600b0078edcb8b4bemr6563481qka.6.1713243280890;
        Mon, 15 Apr 2024 21:54:40 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-50.web.vodafone.de. [109.43.179.50])
        by smtp.gmail.com with ESMTPSA id pw5-20020a05620a63c500b0078a593b54e6sm7248891qkn.96.2024.04.15.21.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 21:54:40 -0700 (PDT)
Message-ID: <a7dfc35f-ff37-47ab-bb8e-c7e32fa605d4@redhat.com>
Date: Tue, 16 Apr 2024 06:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v8 05/35] arch-run: Add a "continuous"
 migration option for tests
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
 <20240405083539.374995-6-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240405083539.374995-6-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/04/2024 10.35, Nicholas Piggin wrote:
> The cooperative migration protocol is very good to control precise
> pre and post conditions for a migration event. However in some cases
> its intrusiveness to the test program, can mask problems and make
> analysis more difficult.
> 
> For example to stress test migration vs concurrent complicated
> memory access, including TLB refill, ram dirtying, etc., then the
> tight spin at getchar() and resumption of the workload after
> migration is unhelpful.
> 
> This adds a continuous migration mode that directs the harness to
> perform migrations continually. This is added to the migration
> selftests, which also sees cooperative migration iterations reduced
> to avoid increasing test time too much.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   common/selftest-migration.c | 16 +++++++++--
>   lib/migrate.c               | 18 ++++++++++++
>   lib/migrate.h               |  3 ++
>   scripts/arch-run.bash       | 55 ++++++++++++++++++++++++++++++++-----
>   4 files changed, 82 insertions(+), 10 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

