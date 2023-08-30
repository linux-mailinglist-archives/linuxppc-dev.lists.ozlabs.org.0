Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0809078E195
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 23:48:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bw2EU0ot;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bw2EU0ot;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbdG96nYLz3c2y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 07:48:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bw2EU0ot;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bw2EU0ot;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbdFF6RSCz2y1c
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 07:47:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693432059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUcwBG4nsZ2S/sQ42rRb0yMsRkdTvD9Tq37GYF9pDHA=;
	b=bw2EU0otHAaRQK+f0kfP49+ltQcc1GddoP33QTn8zVitl8W/xxAYx+BwPwl7xrO1tJFzPn
	nDsv4iCoj57TgXPL3y1SAUDDLBd64kkQciTMKwASOh3cgknsP4ioGS+jlZjFfq9T0ar4oX
	KrwYv9q1Reqrtm+/PkE+vblxXpdXjUE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693432059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUcwBG4nsZ2S/sQ42rRb0yMsRkdTvD9Tq37GYF9pDHA=;
	b=bw2EU0otHAaRQK+f0kfP49+ltQcc1GddoP33QTn8zVitl8W/xxAYx+BwPwl7xrO1tJFzPn
	nDsv4iCoj57TgXPL3y1SAUDDLBd64kkQciTMKwASOh3cgknsP4ioGS+jlZjFfq9T0ar4oX
	KrwYv9q1Reqrtm+/PkE+vblxXpdXjUE=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-I_s7QhQzNXKr15xFaounnA-1; Wed, 30 Aug 2023 17:47:37 -0400
X-MC-Unique: I_s7QhQzNXKr15xFaounnA-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6bc7afd0498so344724a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 14:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693432057; x=1694036857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUcwBG4nsZ2S/sQ42rRb0yMsRkdTvD9Tq37GYF9pDHA=;
        b=dZ3uYekcFGxZr5Dp5w4y/yckSO8LIhcvxBFhJopOk8ITLAziqDhIeUXgm9x6DuyHbD
         2TAA3nd1kMPD++HnJrAljlXKpyVP+mGq3Ac67lY7P0HH56Qn3k7ct20++l2C7arBXxOp
         D7MxWL0rBAIgJGW9Out/VLSZrIgAKBZ71O4qL2eTC/oaIQJSydNkVikwkwT7/iTjVyR7
         Mu0d6DspvPxNCF/f0KmA2Ibe8fL2uRMHb4Q/9i/0yWh2xstwLGH6gYn8jFER6ljxWsYD
         kRcY7c24byWItgGjygOobzImPmyqAog08Kn8PrAVwg9vgRU2Hvy+s8s5SmRmZC7bfs+p
         dbKA==
X-Gm-Message-State: AOJu0YxrB3f26MwDBBzztQrAq5lkHAXSyXAeBVa6vBMBtg/bQZ/gUGu7
	ijvlYiSvK2oH5O48unRMto3U8hgAFAMHJHwXSH+i5cqt8pgwuIboFCNIHTxZI4gOcvrQxKkq8F4
	gucX6ujdBtqO5cgq+RLe2om+LmQ==
X-Received: by 2002:a05:6830:2017:b0:6bd:b10:c321 with SMTP id e23-20020a056830201700b006bd0b10c321mr3792135otp.10.1693432057048;
        Wed, 30 Aug 2023 14:47:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGixZZGfNZpc2TcsPswTDuhkrzYsm6YEBuIj13Oq30Mc6BUMAb9Y3bxVcPusJxHvaZdZGkI/A==
X-Received: by 2002:a05:6830:2017:b0:6bd:b10:c321 with SMTP id e23-20020a056830201700b006bd0b10c321mr3792128otp.10.1693432056807;
        Wed, 30 Aug 2023 14:47:36 -0700 (PDT)
Received: from [192.168.1.17] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id s29-20020a05620a031d00b007671cfe8a18sm43892qkm.13.2023.08.30.14.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 14:47:36 -0700 (PDT)
Message-ID: <cca0770c-1510-3a02-d0ba-82ee5a0ae4f2@redhat.com>
Date: Wed, 30 Aug 2023 17:47:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Recent Power changes and stack_trace_save_tsk_reliable?
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <ZO4K6hflM/arMjse@redhat.com> <87o7ipxtdc.fsf@mail.lhotse>
 <87il8xxcg7.fsf@mail.lhotse>
From: Joe Lawrence <joe.lawrence@redhat.com>
In-Reply-To: <87il8xxcg7.fsf@mail.lhotse>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: live-patching@vger.kernel.org, Ryan Sullivan <rysulliv@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/30/23 02:37, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Joe Lawrence <joe.lawrence@redhat.com> writes:
>>> Hi ppc-dev list,
>>>
>>> We noticed that our kpatch integration tests started failing on ppc64le
>>> when targeting the upstream v6.4 kernel, and then confirmed that the
>>> in-tree livepatching kselftests similarly fail, too.  From the kselftest
>>> results, it appears that livepatch transitions are no longer completing.
>>
>> Hi Joe,
>>
>> Thanks for the report.
>>
>> I thought I was running the livepatch tests, but looks like somewhere
>> along the line my kernel .config lost CONFIG_TEST_LIVEPATCH=m, so I have
>> been running the test but it just skips. :/
>>

That config option is easy to drop if you use `make localmodconfig` to
try and expedite the builds :D  Been there, done that too many times.

>> I can reproduce the failure, and will see if I can bisect it more
>> successfully.
> 
> It's caused by:
> 
>   eed7c420aac7 ("powerpc: copy_thread differentiate kthreads and user mode threads")
> 
> Which is obvious in hindsight :)
> 
> The diff below fixes it for me, can you test that on your setup?
> 

Thanks for the fast triage of this one.  The proposed fix works well on
our setup.  I have yet to try the kpatch integration tests with this,
but I can verify that all of the kernel livepatching kselftests now
happily run.

--
Joe

> A proper fix will need to be a bit bigger because the comments in there
> are all slightly wrong now since the above commit.
> 
> Possibly we can also rework that code more substantially now that
> copy_thread() is more careful about setting things up, but that would be
> a follow-up.
> 
> diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
> index 5de8597eaab8..d0b3509f13ee 100644
> --- a/arch/powerpc/kernel/stacktrace.c
> +++ b/arch/powerpc/kernel/stacktrace.c
> @@ -73,7 +73,7 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
>  	bool firstframe;
>  
>  	stack_end = stack_page + THREAD_SIZE;
> -	if (!is_idle_task(task)) {
> +	if (!(task->flags & PF_KTHREAD)) {
>  		/*
>  		 * For user tasks, this is the SP value loaded on
>  		 * kernel entry, see "PACAKSAVE(r13)" in _switch() and
> 
> 
> cheers
> 

