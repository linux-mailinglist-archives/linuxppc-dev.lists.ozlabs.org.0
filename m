Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA7B399A0D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 07:34:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwZN85V3Mz30C6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 15:34:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mZ0vFPja;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mZ0vFPja; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwZMj0sZ7z2yj1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 15:34:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FwZMX07j4z9s5R;
 Thu,  3 Jun 2021 15:34:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622698456;
 bh=Aib70+D2BrDxRnGaaHyKRV5RMnRcn0NuaIP0L1866oA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mZ0vFPjaV3/F+sFn68lJ9rBf+VqXX8LAvwd8sHO2UHsW01yEWS7fZFGxpk7Vnx4We
 013QQ0RfNTq+9c1nSPGu5WOonR/ibufEz83pGCCbsFPkRCE7hQnxN7mt/Qd4gUuWSR
 7O1uTq/pSVbl2KD9ZkSUE/SfH+7tChMuCKMxwK+khZ8FxwsPYJMmFa6OXbbZSK80ts
 bnDz1CpYFWRnUzOhw1CYxihLEqFQth+gj8E/TmYwA21l/uElM2z4sS7qBwNmpzgeP8
 fp6LdZI3nQFwDzDvVBfOvLHI23XQSPk19OnE3Gt4kmBUhi4ZDx3XydXl6FdVOj1hV5
 NO+d7FPbTwb9w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/stacktrace: fix raise_backtrace_ipi() logic
In-Reply-To: <871r9kyrtk.fsf@linux.ibm.com>
References: <20210527011550.235443-1-nathanl@linux.ibm.com>
 <87eedkh6cb.fsf@mpe.ellerman.id.au> <871r9kyrtk.fsf@linux.ibm.com>
Date: Thu, 03 Jun 2021 15:34:11 +1000
Message-ID: <878s3rh5po.fsf@mpe.ellerman.id.au>
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
Cc: npiggin@gmail.com, paulus@samba.org, clg@kaod.org, ldufour@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Hi Michael,
>
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> When smp_send_safe_nmi_ipi() indicates that the target CPU has
>>> responded to the IPI, skip the remote paca inspection
>>> fallback. Otherwise both the sending and target CPUs attempt the
>>> backtrace, usually creating a misleading ("didn't respond to backtrace
>>> IPI" is wrong) and interleaved mess:
>>
>> Thanks for fixing my bugs for me :)
>>
>
> Thanks for your review! I was beginning to think I had missed some
> subtletly here, thanks for illustrating it.
>
> I'll run with your proposed change below for the problem I'm working.

Thanks. I did test it a bit with the test_lockup module, but some real
world testing would be good too.

cheers
