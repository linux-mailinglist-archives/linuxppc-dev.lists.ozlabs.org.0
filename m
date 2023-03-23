Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8296C668B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 12:28:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj3460Kbtz3fBH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 22:28:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ld+HNi2C;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ld+HNi2C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ld+HNi2C;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ld+HNi2C;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj32G6SN5z3f4C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 22:26:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679570786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8KUbQxs8kI66eH9ZThh/ululwM7KepG2IoJ0H/h7J2I=;
	b=Ld+HNi2CT4cuxa/wLIVzg/aZ3wfXofr6TJjlNFa5wQ3eW4oM0HNvxzvi5LG+5bEtJa9NgR
	q4BFUd2gR/YiXN782URVQ3bbJ9m6BABxzAigYyKbRMzPO1yPjXoYFjwHgKeOiYdAz0bHgN
	Mrm6LtGpPXI4X4wEAfG+zerjZJsC7VA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679570786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8KUbQxs8kI66eH9ZThh/ululwM7KepG2IoJ0H/h7J2I=;
	b=Ld+HNi2CT4cuxa/wLIVzg/aZ3wfXofr6TJjlNFa5wQ3eW4oM0HNvxzvi5LG+5bEtJa9NgR
	q4BFUd2gR/YiXN782URVQ3bbJ9m6BABxzAigYyKbRMzPO1yPjXoYFjwHgKeOiYdAz0bHgN
	Mrm6LtGpPXI4X4wEAfG+zerjZJsC7VA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-0oVi8Ro3OPir89yZKmlIhg-1; Thu, 23 Mar 2023 07:26:24 -0400
X-MC-Unique: 0oVi8Ro3OPir89yZKmlIhg-1
Received: by mail-ed1-f72.google.com with SMTP id r19-20020a50aad3000000b005002e950cd3so32176974edc.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 04:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679570784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KUbQxs8kI66eH9ZThh/ululwM7KepG2IoJ0H/h7J2I=;
        b=pXrjFHm7h05LwjNLsrSWtrx1u12u0BCXfo/fAp/cgSLRT+qGFYdRW74C38ldSE19Mi
         yv4psBKQXYGtRYvVUQ+fMIcK38rtGP1KA4C1k0onYzWHw31nuyVFifooAX36Y2+F5ZL2
         TUAuxLT1DArii3WNF/7heHD32yIOygiBQZFDAv6OM7p/2vLaAEzYzgSPiCyveVARZrgZ
         oWLlzCgHcq5vveMxtYZKXZKgxB7QgDkoCCaPDlBtwBdqCStLhrlSAllSBlnFc7IW44/N
         AOhYOM18ppNAWKbo7KaWEY1zs9hwplbEH3yjTSE94t+CKE91y9hc1U8bmmWZlwlsLa8f
         8d1w==
X-Gm-Message-State: AO0yUKX/JKbC3MgklQ1B7U99rnLWMsA85GkbDRWnH0wuRGGCtqIFphn1
	lVfNrAb71Q5irKWWhRDHmq7dmJ4NTvWTlib9hKRi5gcIx1xwn/5JLWnSMb9LrRwafmcqUfo+R+w
	Gk+1FbNWTN3xO1+gEroAC+jolxg==
X-Received: by 2002:a17:906:46ce:b0:931:ad32:79ed with SMTP id k14-20020a17090646ce00b00931ad3279edmr10870306ejs.12.1679570783953;
        Thu, 23 Mar 2023 04:26:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set+ZVhfJ2B9nEDKBwWSRNArm/QDK/E4mI2IbTuDLm2MI0YhFfX6ov54O1VjaGE43kuNwtTLf2Q==
X-Received: by 2002:a17:906:46ce:b0:931:ad32:79ed with SMTP id k14-20020a17090646ce00b00931ad3279edmr10870285ejs.12.1679570783640;
        Thu, 23 Mar 2023 04:26:23 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-146.web.vodafone.de. [109.43.179.146])
        by smtp.gmail.com with ESMTPSA id t21-20020a50d715000000b004af7191fe35sm8987398edi.22.2023.03.23.04.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 04:26:23 -0700 (PDT)
Message-ID: <ec852041-dc53-f50c-534c-a0f5c1dd153b@redhat.com>
Date: Thu, 23 Mar 2023 12:26:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests v2 02/10] powerpc: add local variant of SPR test
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-3-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230320070339.915172-3-npiggin@gmail.com>
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
> This adds the non-migration variant of the SPR test to the matrix,
> which can be simpler to run and debug.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/unittests.cfg | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
> index 1e74948..3e41598 100644
> --- a/powerpc/unittests.cfg
> +++ b/powerpc/unittests.cfg
> @@ -68,5 +68,9 @@ groups = h_cede_tm
>   
>   [sprs]
>   file = sprs.elf
> +groups = sprs

Looking at this again, I think you don't really need a "groups =" entry here 
... I'd suggest to drop that line.

  Thomas


> +[sprs-migration]
> +file = sprs.elf
>   extra_params = -append '-w'
>   groups = migration

