Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A766D5919
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 09:03:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrJdL0hNyz3chK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 17:03:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QBLjGc9v;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QBLjGc9v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QBLjGc9v;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QBLjGc9v;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrJcQ03h9z3bTH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 17:02:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680591760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I3MVmNjjTrzkV62oECuu2nmnGPuxnQPyCsf8ynhsugY=;
	b=QBLjGc9vLCZ6qOGib/Uc/R6S5XNhDVrBEmZ9IXstRJVPHWp9GlqH5uqmuAWy2MYP1b7LS0
	8c9QkQ+mgpkzaIiTuEWD+dD72+/PEbqjA0nQpMG4u8eVC3T1S1+dgIAULXOXj/QwvI+wU0
	3wVrJ9ZITlDjOcjq+6/KBmO3Kd5SUdc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680591760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I3MVmNjjTrzkV62oECuu2nmnGPuxnQPyCsf8ynhsugY=;
	b=QBLjGc9vLCZ6qOGib/Uc/R6S5XNhDVrBEmZ9IXstRJVPHWp9GlqH5uqmuAWy2MYP1b7LS0
	8c9QkQ+mgpkzaIiTuEWD+dD72+/PEbqjA0nQpMG4u8eVC3T1S1+dgIAULXOXj/QwvI+wU0
	3wVrJ9ZITlDjOcjq+6/KBmO3Kd5SUdc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-aIPuv0SVPnC35igq-DRjtA-1; Tue, 04 Apr 2023 03:02:38 -0400
X-MC-Unique: aIPuv0SVPnC35igq-DRjtA-1
Received: by mail-qt1-f200.google.com with SMTP id f36-20020a05622a1a2400b003deb2fa544bso21570903qtb.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Apr 2023 00:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680591758;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3MVmNjjTrzkV62oECuu2nmnGPuxnQPyCsf8ynhsugY=;
        b=2Nw4QXbVw8wgbipC6ox5xc36zOJmd8X8P9LL9mC5Dd5d4HP3WQMt4CvNvcukuIYmiu
         h0tiRzWLDes/O6/yBhfGv/HOjjzA29F5uxnBkFJFoB4mQmkwuBg20aAJiI6N4pNtrshO
         NJshatRpb1O2UizIy0v4o790IoZ8jOB8q8aiL5ulr/B59Xw/oNO0qaxLZeQgF/5md+ng
         Be1kM3nouOokJR60wxKvxL3Cd16RFMOi72x/pTWiE8kfyhvoB7846rFzMUNDqxpxAyfM
         KlKYOoJYePYLbNbPaPaFtJ2uXqe1s45dsuQYCIHIsSNhrKHE0oDVbcZVYZ2GHVqSz4nd
         F27A==
X-Gm-Message-State: AAQBX9cjH3N9dZoI90kXbiigTQ0XYc8mauJ1pndA01gS5LP76OxjZDap
	UvIDRf4PAr39hyw28vrd4QRPr95pXOcgZ7UuBxAxWVRr4ayvLm/7xmcWd9xtWPHCD4ap3QeDR6D
	QK90Z7J7D9MWZ71ApWjpkZPnRjA==
X-Received: by 2002:a05:622a:1014:b0:3bd:db4:b967 with SMTP id d20-20020a05622a101400b003bd0db4b967mr1605094qte.58.1680591758573;
        Tue, 04 Apr 2023 00:02:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZeBly8guyCmoO5xOctGAQXU6DItAkqiG1Wa+dT9GI6WOjdnqjMxk2CNPmIGaB4Rl1jZDmaUw==
X-Received: by 2002:a05:622a:1014:b0:3bd:db4:b967 with SMTP id d20-20020a05622a101400b003bd0db4b967mr1605062qte.58.1680591758243;
        Tue, 04 Apr 2023 00:02:38 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-74.web.vodafone.de. [109.43.178.74])
        by smtp.gmail.com with ESMTPSA id t20-20020ac85314000000b003e3870008c8sm3045284qtn.23.2023.04.04.00.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 00:02:36 -0700 (PDT)
Message-ID: <1a2de9e8-3536-17d8-e6b3-7312c7ca7f46@redhat.com>
Date: Tue, 4 Apr 2023 09:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests v3 07/13] powerpc/sprs: Specify SPRs with data
 rather than code
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230327124520.2707537-1-npiggin@gmail.com>
 <20230327124520.2707537-8-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230327124520.2707537-8-npiggin@gmail.com>
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
> A significant rework that builds an array of 'struct spr', where each
> element describes an SPR. This makes various metadata about the SPR
> like name and access type easier to carry and use.
> 
> Hypervisor privileged registers are described despite not being used
> at the moment for completeness, but also the code might one day be
> reused for a hypervisor-privileged test.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> 
> This ended up a little over-engineered perhaps, but there are lots of
> SPRs, lots of access types, lots of changes between processor and ISA
> versions, and lots of places they are implemented and used, so lots of
> room for mistakes. There is not a good system in place to easily
> see that userspace, supervisor, etc., switches perform all the right
> SPR context switching so this is a nice test case to have. The sprs test
> quickly caught a few QEMU TCG SPR bugs which really motivated me to
> improve the SPR coverage.
> ---
> Since v2:
> - Merged with "Indirect SPR accessor functions" patch.
> 
>   powerpc/sprs.c | 643 ++++++++++++++++++++++++++++++++++---------------
>   1 file changed, 450 insertions(+), 193 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>

