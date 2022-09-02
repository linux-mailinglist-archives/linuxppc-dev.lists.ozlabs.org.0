Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D70BA5AA43A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 02:20:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJdq26FyCz3bWM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 10:20:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=gMOrmjtW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=gMOrmjtW;
	dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJdpN037rz2y6K
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 10:19:53 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id x14so334426qvr.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 17:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=atEpBCb4u8NO3VMxJpYT+lnx/ulS1odRpgpuUSjIvog=;
        b=gMOrmjtW7ZbZRn0iiwDSenm0DGXFRNu9JQHNSOs7+DZrxgUY1t/dbFGKxynBm4ugYe
         98yqyGpYFQ1nj6NzO3H1E8ao9p4Bk6acJjegPM4Ryb9q2zYXc/JOD7HGCEFk+50IGo3o
         1yzE8Z5fRVQG8FzfKu3ajs22JZHdvQ7Bx0hh4yVNCaww4RVsK96HiB3urA5L5jUr3OEF
         xzuVuVhdbcuIufMm4uAjsV/au2hrkhl0VdH+DrrIAlGpgsi/9SboajieV9RoGzna83TX
         9YuYnA6ShNbxQVVT7VRSf48LcllccwsUMQaGLUc0kCX3PII/q+s2rKkLMkap5cpqwyex
         eiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=atEpBCb4u8NO3VMxJpYT+lnx/ulS1odRpgpuUSjIvog=;
        b=AArO6SvtGmq2o7RmH52gKYGXoFNS2a68lFe2oYcGhyOpfQmWxBFLbtfTa6+AQYWJ0H
         daZi+qvaGRRPRyniC9zyH2GulAdxlhCKEgEGi114VKO3qnRSPFQow4/RYgaqzcno86vI
         pyT2U3z0Rkp7aOdpVrlJ8ihg9ne+JcjavmCjYSVsOFu08Ol5OejrX2sFM+9xe/v5k60/
         kk6MFc0eGZaS3OEWLNvPH6KESE3MHFQMnY8r4lrDRKoTFZVxgN6/uFlEG4vMCiONa7Di
         rzlcPlRjBUwsQv0xQV7sTWRZo/apLSOM2cDzbELm/GAp/GFII9Zwdmd8qevPAFOFcxuw
         9GWQ==
X-Gm-Message-State: ACgBeo0JEyVe274pht1RyyIMB8Unztcf2wib+MYiTK+LNlGP/NaOtmt2
	snO1QokepvMsEbZUMyabsn/ogg==
X-Google-Smtp-Source: AA6agR7PAxdnUPZaTZeVmffnb4SRaSsngoJYX+1jgkvM3/VYxBjJ2IDNAiM/TUI1lbXDX4FL7JjnYA==
X-Received: by 2002:ad4:5c88:0:b0:499:154f:e4a with SMTP id o8-20020ad45c88000000b00499154f0e4amr12674659qvh.7.1662077990315;
        Thu, 01 Sep 2022 17:19:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id w18-20020a05620a0e9200b006ba9b2167a2sm332043qkm.16.2022.09.01.17.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 17:19:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1oTuPU-005LWJ-LG;
	Thu, 01 Sep 2022 21:19:48 -0300
Date: Thu, 1 Sep 2022 21:19:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
Subject: Re: [RFC 0/3] Asynchronous EEH recovery
Message-ID: <YxFMJEWSfSBkcwyq@ziepe.ca>
References: <20220816032716.108297-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816032716.108297-1-ganeshgr@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 16, 2022 at 08:57:13AM +0530, Ganesh Goudar wrote:
> Hi,
> 
> EEH reocvery is currently serialized and these patches shorten
> the time taken for EEH recovery by making the recovery to run
> in parallel. The original author of these patches is Sam Bobroff,
> I have rebased and tested these patches.

How did you test this?

I understand that VFIO on 6.0 does not work at all on power?

I am waiting for power maintainers to pick up this series to fix it:

https://lore.kernel.org/kvm/20220714081822.3717693-1-aik@ozlabs.ru/

Jason
