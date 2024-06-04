Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 135EA8FB092
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 12:54:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aHUua9eX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aHUua9eX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtnXP1MYnz3cby
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 20:54:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aHUua9eX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aHUua9eX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtnWh6pVqz30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 20:53:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717498414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=khLXT47kqpcrtDLU6hojN1Y8iwI4i0MMg0kRPkLwAKQ=;
	b=aHUua9eX8N7Ti6ScdZQo5GAwcrVIGI2k19BwfDOXI0ABD3pCgAjyXGhOTlWJGKT+Y24DzA
	WvJlG+DVWQiybu+2W4eOrlYyTXkUgpPt2ZLqUUfmWUdCCrhR/aEkufuE8h/Z3xk+6uJwOR
	nwOAWEPXmPyeM5culfshY/NoXmtJK5E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717498414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=khLXT47kqpcrtDLU6hojN1Y8iwI4i0MMg0kRPkLwAKQ=;
	b=aHUua9eX8N7Ti6ScdZQo5GAwcrVIGI2k19BwfDOXI0ABD3pCgAjyXGhOTlWJGKT+Y24DzA
	WvJlG+DVWQiybu+2W4eOrlYyTXkUgpPt2ZLqUUfmWUdCCrhR/aEkufuE8h/Z3xk+6uJwOR
	nwOAWEPXmPyeM5culfshY/NoXmtJK5E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-IaebEvwlNzGcA7JeiUdQwg-1; Tue, 04 Jun 2024 06:53:32 -0400
X-MC-Unique: IaebEvwlNzGcA7JeiUdQwg-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-794affd50bcso709147885a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 03:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717498412; x=1718103212;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khLXT47kqpcrtDLU6hojN1Y8iwI4i0MMg0kRPkLwAKQ=;
        b=MPuQec1PuFHtmQc69NY4ktU8ir2VrQ2Pw9kdUcyKbGQfsraSMPFOn+/f43HfDfUmAV
         cO/ZeVKacYN4PVVrVe7UrXP5folYDfNGTTExuB58KGmJCmDw56zFS3+ASsnxdzYSbwdB
         VbZBB49vdVI+fp/llALgWH6BznTOsd4IWYD1MCK9ldZortBMxyxhg6mBfMuDMAkfMT7u
         h+vIjnXfj2QVtIVT43YibDwOKLPFVPO5PBnhBr+6BDuvTwzCr2nIfG2ZyObP4k9csS6Q
         vfN00TAL8cSMen9QAwlTUt6vjF0WNtGBCYBu9VMulCO3c28wr17GqfKJga4W0ZiPSQe/
         s0tA==
X-Forwarded-Encrypted: i=1; AJvYcCXZOgO4Fr506JZdGvtsuPd+qioFz2QCHwXOnL/OBlUGSs/0ckU3TaLtwGbQd0Q2wCESvKiP0eN98dikzXdYMizygaaFaTobJmNCgfDpKQ==
X-Gm-Message-State: AOJu0YwgMMzhlYsz/fpv6sZHeFYbo3zuCQZlWraAvHaYjdFYodLmkrgF
	FN94901AO73/tDkH1H/aRX4DMhWa5o9/2uOzu4kvcE2YAJoYmE4bgJfFI74HeUMBZnJa2wHpBvI
	WziOJK2X+9AvXJTG4Hgw2iU9hSG+PFAZ48XoDZLTbPkc4o0AW05ei3GWqEluXU58=
X-Received: by 2002:a05:620a:46a6:b0:794:f011:7a30 with SMTP id af79cd13be357-794f5c669c0mr1562812185a.14.1717498411885;
        Tue, 04 Jun 2024 03:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHymc98QpftOUqvFlvr/bYlT6Z8NbMKWzQR6dsIzYHNQdoHJ2RUVlPg2ortFt5CFWmtmRCzbQ==
X-Received: by 2002:a05:620a:46a6:b0:794:f011:7a30 with SMTP id af79cd13be357-794f5c669c0mr1562810185a.14.1717498411452;
        Tue, 04 Jun 2024 03:53:31 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-97.web.vodafone.de. [109.43.178.97])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f2efc653sm352278885a.18.2024.06.04.03.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 03:53:30 -0700 (PDT)
Message-ID: <4938edb7-c057-4f92-b59b-31f0b7ba6f54@redhat.com>
Date: Tue, 4 Jun 2024 12:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 30/31] powerpc: Add facility to query
 TCG or KVM host
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-31-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240504122841.1177683-31-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/05/2024 14.28, Nicholas Piggin wrote:
> Use device tree properties to determine whether KVM or TCG is in
> use.
> 
> Logically these are not the inverse of one another, because KVM can be
> used on top of a TCG processor (if TCG is emulating HV mode, or if it
> provides a nested hypervisor interface with spapr). This can be a
> problem because some issues relate to TCG CPU emulation, and some to
> the spapr hypervisor implementation. At the moment there is no way to
> determine TCG is running a KVM host that is running the tests, but the
> two independent variables are added in case that is able to be
> determined in future. For now that case is just incorrectly considered
> to be kvm && !tcg.
> 
> Use this facility to restrict some of the known test failures to TCG.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/powerpc/asm/processor.h |  3 +++
>   lib/powerpc/setup.c         | 25 +++++++++++++++++++++++++
>   powerpc/atomics.c           |  2 +-
>   powerpc/interrupts.c        |  6 ++++--
>   powerpc/mmu.c               |  2 +-
>   powerpc/pmu.c               |  6 +++---
>   powerpc/sprs.c              |  2 +-
>   powerpc/timebase.c          |  4 ++--
>   powerpc/tm.c                |  2 +-
>   9 files changed, 41 insertions(+), 11 deletions(-)

As mentioned elsewhere, it would be nice to have this earlier in the series 
so you could use the conditions in the earlier patches already (but if it is 
too cumbersome to rework, I don't insist on that).

Reviewed-by: Thomas Huth <thuth@redhat.com>


