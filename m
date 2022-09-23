Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B065E74A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYjzZ5ZX7z3cBt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:13:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ctLGeQJF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYjz05Hpnz30Ly
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:12:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ctLGeQJF;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYjz03jXvz4x3w;
	Fri, 23 Sep 2022 17:12:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663917164;
	bh=kxWYcawWkDsL3TwlfeLJQOQEaNorwtdowRSsbnTQqLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ctLGeQJFpKJv/zX3tcVU0BqtR/Dr3hq17VSASc+ICLxpUstLEV9Xl1YWv3U1cPcEy
	 nUX+7kZUG4sSGFJgFOqqZ3PO5+sjoE7lLLCfQYaFaDxRhWYlobLitJXo831s2zTkvF
	 ZJtM/RQQt194V3otmlCzJqnOZzwkOAvsOX/Y5tZ3Ukr4IBGVpv0pWWubIlLZtrwoc4
	 0YWYjIeRSB3iRgD6UhJkT4MMJxDdfcrO8pp4D8yn2fHl3GZc1sXiVn0Crvy4eFfyaH
	 YsYitlmXS9842JGtyGyMVBWW+FKaPdYy/aqnufp1Hd53rbUeOIeX8l1+LQqoHHsuvh
	 o4OTbsOwhVQZw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Moore <paul@paul-moore.com>, Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/rtas: block error injection when locked down
In-Reply-To: <CAHC9VhTWMFbCxQFAEJZzS3Kd5cSFigmvHac5y5ypVU7TqRqpTA@mail.gmail.com>
References: <20220922193817.106041-1-nathanl@linux.ibm.com>
 <20220922193817.106041-3-nathanl@linux.ibm.com>
 <CAHC9VhTWMFbCxQFAEJZzS3Kd5cSFigmvHac5y5ypVU7TqRqpTA@mail.gmail.com>
Date: Fri, 23 Sep 2022 17:12:44 +1000
Message-ID: <87wn9uzhqr.fsf@mpe.ellerman.id.au>
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
Cc: ajd@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, jmorris@namei.org, linux-security-module@vger.kernel.org, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, serge@hallyn.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Moore <paul@paul-moore.com> writes:
> On Thu, Sep 22, 2022 at 3:38 PM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>>
>> The error injection facility on pseries VMs allows corruption of
>> arbitrary guest memory, potentially enabling a sufficiently privileged
>> user to disable lockdown or perform other modifications of the running
>> kernel via the rtas syscall.
>>
>> Block the PAPR error injection facility from being opened or called
>> when locked down.
>>
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> ---
>>  arch/powerpc/kernel/rtas.c | 25 ++++++++++++++++++++++++-
>>  include/linux/security.h   |  1 +
>>  security/security.c        |  1 +
>>  3 files changed, 26 insertions(+), 1 deletion(-)
>
> ...
>
>> diff --git a/include/linux/security.h b/include/linux/security.h
>> index 1ca8dbacd3cc..b5d5138ae66a 100644
>> --- a/include/linux/security.h
>> +++ b/include/linux/security.h
>> @@ -123,6 +123,7 @@ enum lockdown_reason {
>>         LOCKDOWN_BPF_WRITE_USER,
>>         LOCKDOWN_DBG_WRITE_KERNEL,
>>         LOCKDOWN_DEVICE_TREE,
>> +       LOCKDOWN_RTAS_ERROR_INJECTION,
>
> With the understanding that I've never heard of RTAS until now, are
> there any other RTAS events that would require a lockdown reason?  As
> a follow up, is it important to distinguish between different RTAS
> lockdown reasons?
>
> I'm trying to determine if we can just call it LOCKDOWN_RTAS.

Yes I think we should.

Currently it only locks down the error injection calls, not all of RTAS.

But firmware can/will add new RTAS calls in future, so it's always
possible something will need to be added to the list of things that need
to be blocked during lockdown.

So I think calling it LOCKDOWN_RTAS would be more general and future
proof, and can be read to mean "lockdown the parts of RTAS that need
to be locked down".

Similarly we have LOCKDOWN_ACPI_TABLES which locks down modification to
ACPI data, but doesn't disable ACPI use entirely AIUI.

cheers
