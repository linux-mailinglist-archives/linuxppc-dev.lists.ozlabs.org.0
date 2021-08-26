Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6EF3F80F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 05:28:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw7c04MFgz2ywn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 13:28:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y8APyynH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Y8APyynH; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw7Zt0c0Mz2yWR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 13:27:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gw7Zm1Qf3z9sRN;
 Thu, 26 Aug 2021 13:27:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629948464;
 bh=Vmo5HRNHllLuMY9Fv7btMoRpgpgfuoG9v3gSvD0znE0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Y8APyynHG+F5RXJM5yAbKOhWfaX9RT6swrQPaajuEVL8EzHiYjy807lnvme+Ur//W
 0xsBNVZ5/RZE45gMWlPhVI+ERkvn+EIsg9UsH2sVqJRUucy45Mnk04+Rr8XjJsG4MN
 b5Y4qFyx+HUVvMc2jVhJGkNb1crcwgGPcCl25fqW30Y+ED6t6zcHpq4slf8Rz74BS2
 iBxPir6G1HN7OyO7fttRt2S49hZ/7+Np0WYj/YywnLT5YQm4zdaq269rA5ND90gtp/
 Zk106Vc6kZ9MenTNOFdFEhgQUa9IgCm0oEjKP9ijCSwuVb46kNZDLUPaPi75IsRlxS
 poeCOlAwviIjw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/3] selftests/powerpc: Add test for real address
 error handling
In-Reply-To: <8edb13f5-f036-2f9d-4c89-55c51c4cdbc0@linux.ibm.com>
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
 <20210805092025.272871-2-ganeshgr@linux.ibm.com>
 <87a6l7c8ku.fsf@mpe.ellerman.id.au>
 <8edb13f5-f036-2f9d-4c89-55c51c4cdbc0@linux.ibm.com>
Date: Thu, 26 Aug 2021 13:27:42 +1000
Message-ID: <87eeagc2c1.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh <ganeshgr@linux.ibm.com> writes:
> On 8/24/21 6:18 PM, Michael Ellerman wrote:
>
>> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>>> Add test for real address or control memory address access
>>> error handling, using NX-GZIP engine.
>>>
>>> The error is injected by accessing the control memory address
>>> using illegal instruction, on successful handling the process
>>> attempting to access control memory address using illegal
>>> instruction receives SIGBUS.
>> ...
>>
>>> diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.sh b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
>>> new file mode 100755
>>> index 000000000000..3633cdc651a1
>>> --- /dev/null
>>> +++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
>>> @@ -0,0 +1,18 @@
>>> +#!/bin/bash
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +if [[ ! -w /dev/crypto/nx-gzip ]]; then
>>> +	echo "WARN: Can't access /dev/crypto/nx-gzip, skipping"
>>> +	exit 0
>>> +fi
>>> +
>>> +timeout 5 ./inject-ra-err
>>> +
>>> +# 128 + 7 (SIGBUS) = 135, 128 is a exit code with special meaning.
>>> +if [ $? -ne 135 ]; then
>>> +	echo "FAILED: Real address or Control memory access error not handled"
>>> +	exit $?
>>> +fi
>>> +
>>> +echo "OK: Real address or Control memory access error is handled"
>>> +exit 0
>> I don't think we really need the shell script, we should be able to do
>> all that in the C code.
>>
>> Can you try this?
>
> it works!, We need to set timeout, with 120 sec timeout we may flood the dmesg.

Hmm. Does it keep faulting? The regs->nip += 4 is meant to avoid that.

cheers
