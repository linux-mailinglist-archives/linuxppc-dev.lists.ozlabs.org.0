Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D9E8BC84F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 09:26:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OkC5bcJ2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OkC5bcJ2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXtJ55hP1z3cDT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 17:26:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OkC5bcJ2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OkC5bcJ2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXtHL29V0z30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 17:25:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714980346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SZ0Aala6XBf0FrBD9ExE2XGN+wlQ/S9jAS2cHopSo0Q=;
	b=OkC5bcJ22TYqYwYbrGB72Bu91Gj2HaX9SFeP0Y5Y/K1vqQb8aO4OM/Uw4R2r/XTknwAoGB
	/ivwO2fHzCwD2GUV3/vI0rQ9ty8jc5SQzK1ATKLcHUHgojkJjy0O6wCLkKPDoYfNg0kybS
	6ogyBe49EmxvNRXzWQ5RUSzQlS8FEaI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714980346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SZ0Aala6XBf0FrBD9ExE2XGN+wlQ/S9jAS2cHopSo0Q=;
	b=OkC5bcJ22TYqYwYbrGB72Bu91Gj2HaX9SFeP0Y5Y/K1vqQb8aO4OM/Uw4R2r/XTknwAoGB
	/ivwO2fHzCwD2GUV3/vI0rQ9ty8jc5SQzK1ATKLcHUHgojkJjy0O6wCLkKPDoYfNg0kybS
	6ogyBe49EmxvNRXzWQ5RUSzQlS8FEaI=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-4Cb9uLdJO3K0bXGRj6M1qg-1; Mon, 06 May 2024 03:25:42 -0400
X-MC-Unique: 4Cb9uLdJO3K0bXGRj6M1qg-1
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-7f46ba3d89bso1605719241.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2024 00:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714980342; x=1715585142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZ0Aala6XBf0FrBD9ExE2XGN+wlQ/S9jAS2cHopSo0Q=;
        b=VrG3Z51JHxgPrIJ9rHSveARHL24uMWnhAvka4C2DiL1Uni7kPTURrOr8mF6qM8w4aV
         NwkR6r5D7f0Hxj0Mc6TJcT4LJMa2UMFKRacR1ebSLJNbQnZT3eNPSpU2h3BFGGbvtvEp
         6KLMZzkAywsesnghQrFC+RJeH2JgeODMQUzev8LnOOUy32ugT+1URH43VaCfiKR7Llio
         fQfDE0X1mAGvn7XdiCQhDKlBznMLGHxzsUeLzHlgAgJV73ohcm/nvLGAziYQOnHNfwe2
         hV/dCtuO5kA5iKFtA3hJyeLfXms4rKhguPf043HbnQSFkvecSWnGmxo9ilBayLfcd37Y
         T/zA==
X-Forwarded-Encrypted: i=1; AJvYcCXeyHRfeFR9gdXilZGR/C1M4mUmQ9GBBmksaPqGN25HMrWbrkT7dQrW7RDY7VrBmiQjH0oPyEKYfb13h6jU5ylzta3JdYet0NDOdCJ/EA==
X-Gm-Message-State: AOJu0Yyu3nocrQGREIdyG5aS7SsMgfZi+/X7n4dTeNKQK1UQLEd7fyGt
	iC61cqvWsiV1wFGa9FnahR1IHaOHBOny+lepow4JikpJvSImuVqEwgjnJ2xFdSZhxppkIfj12bJ
	J81bHDZh8Uhj+oqUGhSn4/Us7bn+yvJg8pNz9EJZA6M3hx9+p4lt3ccgBD3GDEXI=
X-Received: by 2002:a67:cd18:0:b0:47b:9ca3:e03d with SMTP id u24-20020a67cd18000000b0047b9ca3e03dmr11321214vsl.11.1714980342001;
        Mon, 06 May 2024 00:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbis0k2mVzbZ3JQqHmVCBLlJpUtAr0VgRaIB561EqwI92qR6A55x98Pi75o2ge8HOHAPFEmg==
X-Received: by 2002:a67:cd18:0:b0:47b:9ca3:e03d with SMTP id u24-20020a67cd18000000b0047b9ca3e03dmr11321203vsl.11.1714980341669;
        Mon, 06 May 2024 00:25:41 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de. [109.43.179.34])
        by smtp.gmail.com with ESMTPSA id p17-20020a0cf691000000b006a0cc19f870sm3528402qvn.9.2024.05.06.00.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 00:25:41 -0700 (PDT)
Message-ID: <aed85321-7e8e-4202-9f91-791229ef9455@redhat.com>
Date: Mon, 6 May 2024 09:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 02/31] report: Add known failure
 reporting option
To: Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-3-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240504122841.1177683-3-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/05/2024 14.28, Nicholas Piggin wrote:
> There are times we would like to test a function that is known to fail
> in some conditions due to a bug in implementation (QEMU, KVM, or even
> hardware). It would be nice to count these as known failures and not
> report a summary failure.
> 
> xfail is not the same thing, xfail means failure is required and a pass
> causes the test to fail. So add kfail for known failures.

Actually, I wonder whether that's not rather a bug in report_xfail() 
instead. Currently, when you call report_xfail(true, ...), the result is 
*always* counted as a failure, either as an expected failure (if the test 
really failed), or as a normal failure (if the test succeeded). What's the 
point of counting a successful test as a failure??

Andrew, you've originally introduced report_xfail in commit a5af7b8a67e, 
could you please comment on this?

IMHO we should rather do something like this instead:

diff --git a/lib/report.c b/lib/report.c
--- a/lib/report.c
+++ b/lib/report.c
@@ -98,7 +98,7 @@ static void va_report(const char *msg_fmt,
                 skipped++;
         else if (xfail && !pass)
                 xfailures++;
-       else if (xfail || !pass)
+       else if (!xfail && !pass)
                 failures++;

         spin_unlock(&lock);

  Thomas

