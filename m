Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D490B857B58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 12:16:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ie4NRcpw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ie4NRcpw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbqBQ4tpKz3vYF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 22:16:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ie4NRcpw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ie4NRcpw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbq9c0ZGcz3dSv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 22:15:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708082143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/s3C1cUAyzspO2KamjiBckwGQ/BxXA5BPUSfaBDl1Bw=;
	b=ie4NRcpw2cey7zAHhO2sizO3cayauf/cpkq50H//hNgX7epo+QwypeViwq1MWukcrxouOf
	tewifr4kox4V5rC1dV2nMRoIuqBWSaKNi4VIkeY71swMqqiLgAl3w9d0ZzsVYQ3jfK27ks
	fHFjqvyTmxvEHVY5FiwcYVLtC+5k1m8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708082143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/s3C1cUAyzspO2KamjiBckwGQ/BxXA5BPUSfaBDl1Bw=;
	b=ie4NRcpw2cey7zAHhO2sizO3cayauf/cpkq50H//hNgX7epo+QwypeViwq1MWukcrxouOf
	tewifr4kox4V5rC1dV2nMRoIuqBWSaKNi4VIkeY71swMqqiLgAl3w9d0ZzsVYQ3jfK27ks
	fHFjqvyTmxvEHVY5FiwcYVLtC+5k1m8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-NDoVfIm_NrmL-f-zv2Ulhg-1; Fri, 16 Feb 2024 06:15:40 -0500
X-MC-Unique: NDoVfIm_NrmL-f-zv2Ulhg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-787407587easo46753785a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 03:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708082140; x=1708686940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/s3C1cUAyzspO2KamjiBckwGQ/BxXA5BPUSfaBDl1Bw=;
        b=pB6/00UxHmJraSRcUnXzOjswv347tY1Z8pwHuFlNHA0Ys361YEA1HMO5ycE5wnXxIl
         GoNEBkPP2HCC0MNiEpXl3D5YF0tLWi2Y6ZClgjvH9ukpwICdkFxJdJ+0wVKxIiHYc4w9
         k3ByV27RePtIF+L00LLPaHbVmQDLoOWjHHG0AYIlid7vwu7XEzOimDdmh8Wb+qlPWGyR
         X4lu5sWQ739wE6qrTKcIsQeUZXIHDuXldYjPwI2IPBftUnnVIiR/g9qLsCLEaDf/2pMc
         U1+LG7PA1XH4CnRQN8vDnpTC9HNogTAbAXvF0dqgguZEJSqCiaVE6qBO4idgVlyrThpt
         BRZg==
X-Forwarded-Encrypted: i=1; AJvYcCXPwVIeOkghre36gKpP8bAuZ+Iprs8oJFSl9DDFxoCpC/5QS9L4UtoVjbFjLkzPNBcvwvrol/Lv0heMuLxtXqyXYmWig1ejOdAWdryGyg==
X-Gm-Message-State: AOJu0Yypg07LbYOwZ6Bv3ugSvD/Mzj0CthbDvA64JpQjv+dXveCnY2VJ
	P6GC/+6J7N9lLMS9H1UleC3VevfOGVhYzl98fpT5vLeOy6qIsMnHr5Jj+76hkH4/nHXiUKnK7Ih
	EkZSSekJXl67srcfgamPckq+i1US8hfFTuc3jVuDzHu6nkHfVCff5jEhWtQcwN9o=
X-Received: by 2002:a05:620a:4105:b0:787:3fb9:462c with SMTP id j5-20020a05620a410500b007873fb9462cmr2374689qko.3.1708082140173;
        Fri, 16 Feb 2024 03:15:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMTE1ejp91icRMQM02RGExipp6FfGbxObIK6+nAErQiLKH+DVYHZjOJjFd3rVCWeeaeMQMOg==
X-Received: by 2002:a05:620a:4105:b0:787:3fb9:462c with SMTP id j5-20020a05620a410500b007873fb9462cmr2374665qko.3.1708082139916;
        Fri, 16 Feb 2024 03:15:39 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-178.web.vodafone.de. [109.43.177.178])
        by smtp.gmail.com with ESMTPSA id oq27-20020a05620a611b00b007873ee07d53sm662235qkn.3.2024.02.16.03.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:15:39 -0800 (PST)
Message-ID: <abbcbb47-1ae7-4793-a918-dede8dcaf07f@redhat.com>
Date: Fri, 16 Feb 2024 12:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v4 8/8] migration: add a migration selftest
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-9-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240209091134.600228-9-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/02/2024 10.11, Nicholas Piggin wrote:
> Add a selftest for migration support in  guest library and test harness
> code. It performs migrations in a tight loop to irritate races and bugs
> in the test harness code.
> 
> Include the test in arm, s390, powerpc.
> 
> Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arm/Makefile.common          |  1 +
>   arm/selftest-migration.c     |  1 +
>   arm/unittests.cfg            |  6 ++++++

  Hi Nicholas,

I just gave the patches a try, but the arm test seems to fail for me: Only 
the first getchar() seems to wait for a character, all the subsequent ones 
don't wait anymore and just continue immediately ... is this working for 
you? Or do I need another patch on top?

  Thanks,
   Thomas


