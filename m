Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD427A1291
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 02:51:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GB0JMoZJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmwc26L8Hz3cPh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 10:51:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GB0JMoZJ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmwb90DyXz30h5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 10:50:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694739028;
	bh=nad9A/VbKdrfPZunawFnPzLWs8iZM5+zMuaqAp2Hnrg=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=GB0JMoZJMVmdf+EG39aOaj0qRSqX2rMiFxtPMzpdQqOzqowiBYyCBBXMNMD/9BuWT
	 hTFErFF4BaLXcjc4qRQ/7PQBFd38/jrn2PyHXUhetRzyigML/7pASAGwTwnwCv8Cj+
	 uNXOX3YfCfRl+qNN9oU4ExH4XDEUkHnrWVt1Xay8tHoAZXf515bNBjZ5XUtAsBOXjN
	 1aJOVoIASQbmF1EOf40TtKIntpwkXEPTPONRgX9xjvS7GCrDO8nmVLOnlNZ+7QoE0o
	 zOeG7Nhmec3QTAe7n0FMc7aCDnlIKzSrD2QPVpSXXMlO2Xw4EW1t6YztjAhKzt2Lcg
	 DHsksg7ag605A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rmwb83wdgz4x2b;
	Fri, 15 Sep 2023 10:50:28 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, Yuanjun Gong
 <ruc_gongyuanjun@163.com>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] powerpc: fix a memory leak
In-Reply-To: <54bf92e8-f884-1567-2149-caf638ff8f68@linux.ibm.com>
References: <20230914094620.3379729-1-ruc_gongyuanjun@163.com>
 <54bf92e8-f884-1567-2149-caf638ff8f68@linux.ibm.com>
Date: Fri, 15 Sep 2023 10:50:28 +1000
Message-ID: <87il8c6yzv.fsf@mail.lhotse>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 9/14/23 02:46, Yuanjun Gong wrote:
>> When one of the methods xive_native_alloc_irq_on_chip, irq_create_mapping
>> or irq_get_handler_data fails, the function will directly return without
>> disposing vinst->name and vinst. Fix it.
>> 
>> Fixes: c20e1e299d93 ("powerpc/vas: Alloc and setup IRQ and trigger port address")
>> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
>> ---
>>  arch/powerpc/platforms/powernv/vas.c | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
>> index b65256a63e87..780740b478f0 100644
>> --- a/arch/powerpc/platforms/powernv/vas.c
>> +++ b/arch/powerpc/platforms/powernv/vas.c
>> @@ -54,7 +54,7 @@ static int init_vas_instance(struct platform_device *pdev)
>>  	struct xive_irq_data *xd;
>>  	uint32_t chipid, hwirq;
>>  	struct resource *res;
>> -	int rc, cpu, vasid;
>> +	int rc, cpu, vasid, ret;
>
> You can you reuse rc for the return value in the error path instead of
> introducing a new ret variable.

Yep, please send a v2.

cheers
