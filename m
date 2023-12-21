Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5C781B4C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 12:18:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k2uXQFgd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swnwx2wbSz3cb6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 22:18:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k2uXQFgd;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swnw85470z2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 22:17:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703157460;
	bh=YxjfRSNBaMALp9Lh5Ulu0ysS95vrj3PnbvwXRd/1pqw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k2uXQFgdp/Yj3ya414ssdKPRQQvzwJuMFnZ5qBJrf355HEkUjlNAr/A8J0Sh9Cljc
	 uvzUbr3DE63gpw+MpD0xcSMmGNEhcK6FeWmea8zYyllNgTiKOJQG3KqpN3OEhWMAEu
	 zw9j70T4+I5eziR7yT6gJvwAZL7CX+jkXhssrTShtakQQYmqpDKSQOHLhn//Y+UDix
	 oi7KQvuVbMvrEIJaHZHqfIoYlHsnJ8T2uLGQm7j4A7+bdL0gHL4P9UWk7ZO0/Gl154
	 Vy5avZFCQxG3Maj2GYoRsufXDDVx3R7y2877gXXLvGC63cU4Jb3wkVIGV8/pjixbT5
	 z6KzkVY+Rd86A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Swnw36MwWz4xhK;
	Thu, 21 Dec 2023 22:17:39 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geoff Levand <geoff@infradead.org>, Kevin Hao <haokexin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc: ps3: Add missing set_freezable() for
 ps3_probe_thread()
In-Reply-To: <d9ffe8a9-667b-4d73-a9f3-e06ccd627dfe@infradead.org>
References: <20231221044510.1802429-1-haokexin@gmail.com>
 <20231221044510.1802429-4-haokexin@gmail.com>
 <d9ffe8a9-667b-4d73-a9f3-e06ccd627dfe@infradead.org>
Date: Thu, 21 Dec 2023 22:17:39 +1100
Message-ID: <87le9nls8c.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Pavel Machek <pavel@ucw.cz>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geoff Levand <geoff@infradead.org> writes:
> Hi Kevin,
>
> On 12/21/23 13:45, Kevin Hao wrote:
>> The kernel thread function ps3_probe_thread() invokes the try_to_freeze()
>> in its loop. But all the kernel threads are non-freezable by default.
>> So if we want to make a kernel thread to be freezable, we have to invoke
>> set_freezable() explicitly.
>> 
>> Signed-off-by: Kevin Hao <haokexin@gmail.com>
>> ---
>>  arch/powerpc/platforms/ps3/device-init.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
>> index e87360a0fb40..878bc160246e 100644
>> --- a/arch/powerpc/platforms/ps3/device-init.c
>> +++ b/arch/powerpc/platforms/ps3/device-init.c
>> @@ -827,6 +827,7 @@ static int ps3_probe_thread(void *data)
>>  	if (res)
>>  		goto fail_free_irq;
>>  
>> +	set_freezable();
>>  	/* Loop here processing the requested notification events. */
>>  	do {
>>  		try_to_freeze();
>
> Seems like a reasonable addition.
>
> Signed-off-by: Geoff Levand <geoff@infradead.org>

I turned that into an Acked-by, which I think is what you meant :)

cheers
