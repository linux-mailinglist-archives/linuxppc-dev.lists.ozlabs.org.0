Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7D9767E58
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 12:55:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FmIxsPNC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RChH26zL0z3cTX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 20:55:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FmIxsPNC;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RChGD1j6Zz2yGd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 20:54:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1690628068;
	bh=qj7XmP75mScDkL7OykesJ/+yL9NoM5v58AOWtEYqqpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FmIxsPNCylPwEcg5zs/4/SiNaqiA+WFEeN+5J5/ijG/A8vRLukQAMdxajxfOy/RnI
	 xblfnZUwwQ1lyddl4lju1+tnxU9b54u3CTUtzVDSi5Mtk+7sfHoKmqd/NhfqnkB7JW
	 e3Z5qaMg2pYyd2HZDKZry+l6u8A8nxc4Ihnq+dgLSuIImqbAQbq783Niry5BOXcN1k
	 CSMQmpcbD9bEDepBDQtxLMH1igGdzLzEJNHf6VDSoMPUAT0HmPDq3nq6CMuYKlKgCw
	 sbBSxJ8lO27j1r64wi85X833ZNbgdQfrZen1g//8+GblOzuQbt0J37IuADUtZ7vcgQ
	 VMeAgxDcwFhyQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RChGD0PSdz4wy4;
	Sat, 29 Jul 2023 20:54:27 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gautam Menghani <Gautam.Menghani@linux.ibm.com>
Subject: Re: [PATCH] arch/powerpc: Remove unnecessary endian conversion code
 in XICS
In-Reply-To: <jcxd7uvooawd3vadvvzmegv27owaqvrxsi66c2ds6hwraqs3zy@3ymyrpyp3q55>
References: <20230630055628.17790-1-gautam@linux.ibm.com>
 <39920b0f-f261-8417-af7a-eef791ad5726@gmail.com>
 <jcxd7uvooawd3vadvvzmegv27owaqvrxsi66c2ds6hwraqs3zy@3ymyrpyp3q55>
Date: Sat, 29 Jul 2023 20:54:26 +1000
Message-ID: <873517dm3h.fsf@mail.lhotse>
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
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautam Menghani <Gautam.Menghani@linux.ibm.com> writes:
> On Thu, Jul 06, 2023 at 05:50:57PM +1000, Jordan Niethe wrote:
>> On 30/6/23 3:56 pm, Gautam Menghani wrote:
>> > Remove an unnecessary piece of code that does an endianness conversion but
>> > does not use the result. The following warning was reported by Clang's
>> > static analyzer:
>> > 
>> > arch/powerpc/sysdev/xics/ics-opal.c:114:2: warning: Value stored to
>> > 'server' is never read [deadcode.DeadStores]
>> >          server = be16_to_cpu(oserver);
>> > 
>> > As the result of endianness conversion is never used, delete the line
>> > and fix the warning.
>> > 
>> > Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
>> 
>> 'server' was used as a parameter to opal_get_xive() in commit 5c7c1e9444d8
>> ("powerpc/powernv: Add OPAL ICS backend") when it was introduced. 'server'
>> was also used in an error message for the call to opal_get_xive().
>> 
>> 'server' was always later set by a call to ics_opal_mangle_server() before
>> being used.
>> 
>> Commit bf8e0f891a32 ("powerpc/powernv: Fix endian issues in OPAL ICS
>> backend") used a new variable 'oserver' as the parameter to opal_get_xive()
>> instead of 'server' for endian correctness. It also removed 'server' from
>> the error message for the call to opal_get_xive().
>> 
>> It was commit bf8e0f891a32 that added the unnecessary conversion and never
>> used the result.
>> 
>> Reviewed-by: Jordan Niethe <jniethe5@gmail.com>
>> 
>
> Hello Michael, 
>
> Do you have any more questions on this patch or is it good to go?

I was expecting you'd send a v2 with the changelog updated to include
all the extra detail Jordan added. I think it should also be tagged as
Fixes: bf8e0f891a32.

cheers
