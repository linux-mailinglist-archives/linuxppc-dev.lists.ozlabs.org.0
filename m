Return-Path: <linuxppc-dev+bounces-13226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F4AC03360
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 21:41:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csxGr3fD7z3bjb;
	Fri, 24 Oct 2025 06:41:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761248468;
	cv=none; b=mu1wmxF2JHb2D1m7BhvQP2C9rcOmyds/CRoOy2efTF3VMX2OZD6vyseUMMXz9O0upimXOblEghkJaFmFbhiD8eEx+Z5wgBacbmb1HQHg4DUWjuuXoi9STgq7Jc2kXt1auDhmLDB60G2192RoOTO7relMzkX47eDGLdQSewVT6aPwsgcu0rqfRHFXpARvy0ovJYdDBZlg/L4OQev+Zr63SPAWt8lXLHv3hnZOsCj9jum88P+Gjmy/jz9rtcviRt+Geshsvke6OZ6J/+YZ8bIFq8WS7I3t1/u7LRATW6CL82zEy+8Cw1vi+gSs2Xj2iHdXuT+gDx7PW0inM/eZNJSJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761248468; c=relaxed/relaxed;
	bh=g66irbQwH0jxqDv3DTl+NXhVVIHgeOwi6mA7R89diG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSQI3+ZWn31QxlZFZwQxH3EVe5bLzorWtYQfxFZFYyu3qGg8+A2DVMRlDXPwU6pEVckmL7xZqTbQjBoqhe5NgHM3Boh4Tcn4tWSduFuinMSx0AzG/qkEueeIjUOquIX4cTmV9rEMKVAXZeupvT3dNrT1ReiUcfKfGfyOSEpMpXEOXM5QGX3vOoqPpHUf9JdEYQZv6/SbW1n7unhjdiNFBbvC2UuKNSaZ3ul/Y0P+KIjURVh3NkohaGQr4u1Ute0kC+iVJV3XXO6uWzNPzeyuTXfkcBELrTGoSAGZw4ayJbkWPmbpPAJI9x0HvEYLUrDtp/MaTeXIMjNhUBoDf8pBAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=neQVTAeR; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=neQVTAeR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csxGm6lQ1z3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 06:41:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761248465; x=1792784465;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EZvSIuYJ3b/lrMN/a187wOL5XBrJRwc0mlFfLxSRTNs=;
  b=neQVTAeRmAolqITGwf7aA1335AzmPKWeTPyLCGXJpYYg3o5FxUu1D7Li
   z+KuC8HXZLYm+ZEwFtndMs5bWveLc+MuPXFwqseXNdCuPYdes8RnAmM00
   RH5D9mRgS/WkaDuWU31SezHBaNTguggI///OGCH/m9tYNOxfiLcr3ZSBL
   XPZDV6+/BESyjNsHefEUWtnIuEIH3WpriAJOie0R+YJIaAbUgY5S2Zzba
   aA48goxfMSJtnvyDAhocRnwEGacfEU4kpzb6QJQuA4DQYIR3REf6mBLqe
   o+zmc2IZyEv+ZV7GiVcK/T/k6HaZDcLw79U5kMFU1cznkX+w8bN4ZbWhM
   w==;
X-CSE-ConnectionGUID: I3oWyhcSQxG+NG2UflKQEg==
X-CSE-MsgGUID: sFUDgntdRxGJR0OGMSIa4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63336124"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="63336124"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 12:41:01 -0700
X-CSE-ConnectionGUID: xhJ4pgrURdGtIG7TipTo9Q==
X-CSE-MsgGUID: 9Hg2U50JR468NFeVk2g90Q==
X-ExtLoop1: 1
Received: from tfalcon-desk.amr.corp.intel.com (HELO [10.125.108.251]) ([10.125.108.251])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 12:41:00 -0700
Message-ID: <0bfa4895-727b-407b-90d2-7d54b9bd4910@intel.com>
Date: Thu, 23 Oct 2025 12:40:59 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
To: Kuniyuki Iwashima <kuniyu@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexandre Ghiti <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>,
 Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023000535.2897002-1-kuniyu@google.com>
 <20251023000535.2897002-3-kuniyu@google.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20251023000535.2897002-3-kuniyu@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/22/25 17:04, Kuniyuki Iwashima wrote:
> --- a/include/linux/eventpoll.h
> +++ b/include/linux/eventpoll.h
> @@ -82,11 +82,14 @@ static inline struct epoll_event __user *
>  epoll_put_uevent(__poll_t revents, __u64 data,
>  		 struct epoll_event __user *uevent)
>  {
> -	if (__put_user(revents, &uevent->events) ||
> -	    __put_user(data, &uevent->data))
> -		return NULL;
> -
> -	return uevent+1;
> +	__user_write_access_begin(uevent, sizeof(*uevent));
> +	unsafe_put_user(revents, &uevent->events, efault);
> +	unsafe_put_user(data, &uevent->data, efault);
> +	user_access_end();
> +	return uevent + 1;
> +efault:
> +	user_access_end();
> +	return NULL;
>  }
>  #endif

This makes me nervous. The access_ok() check is quite a distance away.
I'd kinda want to see some performance numbers before doing this. Is
removing a single access_ok() even measurable?

Also, even if we go do this, shouldn't __user_write_access_begin() be
called something more like unsafe_user_write_access_begin()?

