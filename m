Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1716C6777
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 13:02:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj3qF0ZZCz3f7T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 23:02:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MImzOq3g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cyoMAlm7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MImzOq3g;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cyoMAlm7;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj3pH5KHrz3ccq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 23:01:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679572865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTGFYnjWURCLah9WgWBIHv8w4r2E6oqPT1N4romExjY=;
	b=MImzOq3gG4iYqVdyJtr7+DxKkwNyhoC94AesT3/+byIM9jRrmD356y4+nrWKWngFFnjmdm
	bB2pn8Ea7NbHwDb5UQPaaZK5tfcXha/UidW2IXv751m6tsR7O2/a0DZDLe5WTBoQUrQ6fG
	9INop8CDC8VodkRHrVxhbD+uk5LKDYY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679572866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTGFYnjWURCLah9WgWBIHv8w4r2E6oqPT1N4romExjY=;
	b=cyoMAlm70klR0GW8zT1nMBNsddEtbFo5J9ACn+N9AK8GY3ak/lSQ1DgqETesUL2F8j9gHd
	ixug6XXl0n9/h3tuaXh/GnnTCLBCCXr6YE5B8ExG6iE9LtwZAJRgULO5rfudLKsrIKXbeb
	GtrKAqitjwv9CVSgvDStCJcbqzN6nkA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-0AmAgqtEOB6dwTk25iEBPQ-1; Thu, 23 Mar 2023 08:01:04 -0400
X-MC-Unique: 0AmAgqtEOB6dwTk25iEBPQ-1
Received: by mail-wr1-f71.google.com with SMTP id d5-20020adfa345000000b002d716fc080fso1363869wrb.22
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 05:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679572863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTGFYnjWURCLah9WgWBIHv8w4r2E6oqPT1N4romExjY=;
        b=tE891uF2bdjJK0GB7nCV+J9SLaq7uBGm8dCQd7o3DgV5bjAvWE3Jaj3UZ31XPKNiV+
         x1pMPhbM4i7RSMYEkYs7GiL/ZiWglYy8YziFjO96cT+csIEazOPnQzbxWo8mvXj9M5fH
         Q9UX9TPv3ADi4f5WKYw6b8rnTfNQe9Aqd17PPv2WlBIKkeHHsC+crTFn55V1lfOYRr0f
         tKf5uaSgeFusplZzdkKbFjJKEPBKtuK1xsQLOy27Y3OpulaehlfCAC/4Tkzwjoef7w+1
         at7NoZDe6lRMUglURnKSkUpzvIUZJBeUhRAlLaYeYOoKTazwmwEtbMHHjlov6/igyvQP
         GfRA==
X-Gm-Message-State: AO0yUKVuVowQuFP3A3EQ0BDSaIGjYjjdpTrJ7h4NJgpvSfrKLpA7CDY9
	aJs4QZmNzfYzrNvEL0gIo7ZQIV4Vd6PbpNpk66Z6r5em9Na6oJmS0hJwYtsrdXEKpXY5MovDLl7
	oLjwIAJo3iEuOmUwoAfRNYwJgDA==
X-Received: by 2002:a1c:4b1a:0:b0:3ed:a82d:dfe2 with SMTP id y26-20020a1c4b1a000000b003eda82ddfe2mr2025663wma.29.1679572863040;
        Thu, 23 Mar 2023 05:01:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set9MyJMT/nYCBtz9tt9u0w+Cvx8tCG2gYM0Zl7gZFp2GCTxdj8RQVMZCS7m7wBDqJwRfnkzkqw==
X-Received: by 2002:a1c:4b1a:0:b0:3ed:a82d:dfe2 with SMTP id y26-20020a1c4b1a000000b003eda82ddfe2mr2025649wma.29.1679572862779;
        Thu, 23 Mar 2023 05:01:02 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-146.web.vodafone.de. [109.43.179.146])
        by smtp.gmail.com with ESMTPSA id f20-20020a1c6a14000000b003edcc2223c6sm1682498wmc.28.2023.03.23.05.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 05:01:02 -0700 (PDT)
Message-ID: <82e48016-90d4-0097-67b1-31f2c5668918@redhat.com>
Date: Thu, 23 Mar 2023 13:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests v2 04/10] powerpc: Add ISA v3.1 (POWER10) support
 to SPR test
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-5-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230320070339.915172-5-npiggin@gmail.com>
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

On 20/03/2023 08.03, Nicholas Piggin wrote:
> This is a very basic detection that does not include all new SPRs.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/sprs.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/powerpc/sprs.c b/powerpc/sprs.c
> index ba4ddee..6ee6dba 100644
> --- a/powerpc/sprs.c
> +++ b/powerpc/sprs.c
> @@ -117,6 +117,15 @@ static void set_sprs_book3s_300(uint64_t val)
>   	mtspr(823, val);	/* PSSCR */
>   }
>   
> +/* SPRs from Power ISA Version 3.1B */
> +static void set_sprs_book3s_31(uint64_t val)
> +{
> +	set_sprs_book3s_207(val);
> +	mtspr(48, val);		/* PIDR */
> +	/* 3.1 removes TIDR */
> +	mtspr(823, val);	/* PSSCR */
> +}
> +
>   static void set_sprs(uint64_t val)
>   {
>   	uint32_t pvr = mfspr(287);	/* Processor Version Register */
> @@ -137,6 +146,9 @@ static void set_sprs(uint64_t val)
>   	case 0x4e:			/* POWER9 */
>   		set_sprs_book3s_300(val);
>   		break;
> +	case 0x80:                      /* POWER10 */
> +		set_sprs_book3s_31(val);
> +		break;
>   	default:
>   		puts("Warning: Unknown processor version!\n");
>   	}
> @@ -220,6 +232,13 @@ static void get_sprs_book3s_300(uint64_t *v)
>   	v[823] = mfspr(823);	/* PSSCR */
>   }
>   
> +static void get_sprs_book3s_31(uint64_t *v)
> +{
> +	get_sprs_book3s_207(v);
> +	v[48] = mfspr(48);	/* PIDR */
> +	v[823] = mfspr(823);	/* PSSCR */
> +}
> +
>   static void get_sprs(uint64_t *v)
>   {
>   	uint32_t pvr = mfspr(287);	/* Processor Version Register */
> @@ -240,6 +259,9 @@ static void get_sprs(uint64_t *v)
>   	case 0x4e:			/* POWER9 */
>   		get_sprs_book3s_300(v);
>   		break;
> +	case 0x80:                      /* POWER10 */
> +		get_sprs_book3s_31(v);
> +		break;
>   	}
>   }

Looks like I accidentally replied to v1 a couple of minutes ago... I meant 
to reply here:

Reviewed-by: Thomas Huth <thuth@redhat.com>

