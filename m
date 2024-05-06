Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 095478BCBD3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 12:20:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HgZEJGb6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HgZEJGb6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXy8p4hnLz3bwX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 20:20:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HgZEJGb6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HgZEJGb6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXy81497mz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 20:19:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714990781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0sPgr7rIGm3GF1IeKtp2SSmXKhdtxAaZNYrfmvKosIU=;
	b=HgZEJGb6ZtXvZLOsZVxdAEcpCHB0FFo0krRfULT9AKRHIwGDGNqegIUfn6BhKkX6gmkOcV
	cI0L+nvhXpjlGg1Rq/J1Rcab8BV+ADMF59yM9AX9TOK4ijZmDz4zuOl11kJo0/0jVU16fg
	tpaFYEBM/4xtZVdZE70K5LbNFPuzBWM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714990781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0sPgr7rIGm3GF1IeKtp2SSmXKhdtxAaZNYrfmvKosIU=;
	b=HgZEJGb6ZtXvZLOsZVxdAEcpCHB0FFo0krRfULT9AKRHIwGDGNqegIUfn6BhKkX6gmkOcV
	cI0L+nvhXpjlGg1Rq/J1Rcab8BV+ADMF59yM9AX9TOK4ijZmDz4zuOl11kJo0/0jVU16fg
	tpaFYEBM/4xtZVdZE70K5LbNFPuzBWM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-XV2ey1haPpKxFV7JxE4NzQ-1; Mon, 06 May 2024 06:19:39 -0400
X-MC-Unique: XV2ey1haPpKxFV7JxE4NzQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-346c08df987so1086790f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2024 03:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990778; x=1715595578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sPgr7rIGm3GF1IeKtp2SSmXKhdtxAaZNYrfmvKosIU=;
        b=Jb4nv8fzj/6K1TxQaA4Nq36WNgkQaPrJ5OJ6JAnX/gBAlj3whwyI51CTTngl+JYceF
         Da4ewmvqvIwTfXm8euG9gS36+6fGshfHcNr+Vzu4Dk8xnlOL1UH22LrwptwLnXH3EWej
         vvFPzbWqa+flA3M5Zmucoxl04eLZhrczQzul2y3xqCs02KAYYwC0f5DYZlcLGe9qbCyv
         P4ZV6zva/LbKbGkJugoZjt3AcpDWFehy48Yf5qbqW2QY6JaHtspNBV2+gVl9Ir0U45D9
         w5B8IHymiWgmaEjSt9sCCfJ8+bbW2KkE1k2DH74hAXjnoesVqWOp9QKbHvpMPks5tanJ
         /piQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt8h7PxkNLMOkNtNuRkomMpkeYJproER8IDWtHLXj64VX+yx24zoViXP2xCIl5/kb2Qh7FUfMyOEEE2BA4E4O3ZIPgJ64jqDqDAUcbwg==
X-Gm-Message-State: AOJu0Yzq1SJsChwtHHO+C9Lx4AhgXOrQHoaQJEqJcuk36mW2zo4CtHgR
	muY9WibyCij5PGbGR7U4IwbbiNfiLFODqyIqjuNpYTF5Bp43IUr6b/mATRgKuS5cHIzE3OjrlcM
	smKBPdJpmkH0DVDMU2etptnrHOxmVPSg3KDEowUQg2pK5qxPAviaTE2tf53XbJ9o=
X-Received: by 2002:a5d:64c5:0:b0:34e:81ab:463f with SMTP id f5-20020a5d64c5000000b0034e81ab463fmr9309452wri.20.1714990778676;
        Mon, 06 May 2024 03:19:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJoVYhVgw0SCl6RgwQLX4MlGb+XzHRdR3kuP2h7ZZhGfmzEfOSp4AvUZi8i4zasbj5tIBDOg==
X-Received: by 2002:a5d:64c5:0:b0:34e:81ab:463f with SMTP id f5-20020a5d64c5000000b0034e81ab463fmr9309433wri.20.1714990778267;
        Mon, 06 May 2024 03:19:38 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de. [109.43.179.34])
        by smtp.gmail.com with ESMTPSA id m18-20020adfa3d2000000b0034dfede0071sm10400189wrb.46.2024.05.06.03.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 03:19:37 -0700 (PDT)
Message-ID: <5d9cb456-7d03-4d6c-b5fa-14efadec5722@redhat.com>
Date: Mon, 6 May 2024 12:19:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 02/31] report: Add known failure
 reporting option
To: Andrew Jones <andrew.jones@linux.dev>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-3-npiggin@gmail.com>
 <aed85321-7e8e-4202-9f91-791229ef9455@redhat.com>
 <20240506-c712c1cc4467cd154bbc7ee8@orel>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240506-c712c1cc4467cd154bbc7ee8@orel>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/05/2024 10.01, Andrew Jones wrote:
> On Mon, May 06, 2024 at 09:25:37AM GMT, Thomas Huth wrote:
>> On 04/05/2024 14.28, Nicholas Piggin wrote:
>>> There are times we would like to test a function that is known to fail
>>> in some conditions due to a bug in implementation (QEMU, KVM, or even
>>> hardware). It would be nice to count these as known failures and not
>>> report a summary failure.
>>>
>>> xfail is not the same thing, xfail means failure is required and a pass
>>> causes the test to fail. So add kfail for known failures.
>>
>> Actually, I wonder whether that's not rather a bug in report_xfail()
>> instead. Currently, when you call report_xfail(true, ...), the result is
>> *always* counted as a failure, either as an expected failure (if the test
>> really failed), or as a normal failure (if the test succeeded). What's the
>> point of counting a successful test as a failure??
>>
>> Andrew, you've originally introduced report_xfail in commit a5af7b8a67e,
>> could you please comment on this?
>>
> 
> An expected failure passes when the test fails and fails when the test
> passes, i.e.
> 
>    XFAIL == PASS (but separately accounted with 'xfailures')
>    XPASS == FAIL
> 
> If we expect something to fail and it passes then this may be due to the
> thing being fixed, so we should change the test to expect success, or
> due to the test being written incorrectly for our expectations. Either
> way, when an expected failure doesn't fail, it means our expectations are
> wrong and we need to be alerted to that, hence a FAIL is reported.

Ok, so this was on purpose, indeed. Maybe we should add this information in 
a comment right in front of the function, so that others don't scratch their 
head, too?

Anyway, this patch here is fine then:
Reviewed-by: Thomas Huth <thuth@redhat.com>


