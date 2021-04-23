Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A6D36940E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 15:51:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRbKt49jmz30BG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 23:51:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bzjegyk9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bzjegyk9; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRbKT48VSz2xZH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 23:50:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FRbKR0kq4z9sRR;
 Fri, 23 Apr 2021 23:50:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1619185851;
 bh=NBR0doxevZcspE7GMPniJrjcztr5jXz2a0JCNWCT7jw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bzjegyk9DXvu/3ti2c56HI7OdoN+5+TWGLWWSvKQ052n4AcUgH0UDudeNu8zHVdkX
 GUpiiO25ILL3aXaVpitzkEtKShm/l0Zq+FAo1x5yvQNUADIx5Pn1hpxEqjv/wY9RAT
 aEMNwYdu7TMK5kU2x6EpEmElHNWjwdXo2xm+zDcgnyRFQ9qZzhulj5tMEmqi4hHYV9
 NINnxG2dHpdpoBiP+MI3OQe4b8cRfqZMIWHcJoRVyTpaXR4GyPa7QRJpf1zPPhe5Ns
 Cqi0PE1gKDaPt+NQH25TZM97GhV/PMe4pLuRiTrbEkJ8+r6DQWMKlxUky8djYGeYIZ
 nSQcxHYLPUHAw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, Lakshmi Ramasubramanian
 <nramas@linux.microsoft.com>, robh@kernel.org, dan.carpenter@oracle.com
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
In-Reply-To: <87r1j3ys8i.fsf@dja-thinkpad.axtens.net>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au>
 <87r1j3ys8i.fsf@dja-thinkpad.axtens.net>
Date: Fri, 23 Apr 2021 23:50:49 +1000
Message-ID: <875z0daz46.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 kbuild-all@lists.01.org, bauerman@linux.ibm.com, lkp@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Daniel Axtens <dja@axtens.net> writes:
>
>> Hi Lakshmi,
>>
>>> On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
>>>
>>> Sorry - missed copying device-tree and powerpc mailing lists.
>>>
>>>> There are a few "goto out;" statements before the local variable "fdt"
>>>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
>>>> elf64_load(). This will result in an uninitialized "fdt" being passed
>>>> to kvfree() in this function if there is an error before the call to
>>>> of_kexec_alloc_and_setup_fdt().
>>>> 
>>>> Initialize the local variable "fdt" to NULL.
>>>>
>> I'm a huge fan of initialising local variables! But I'm struggling to
>> find the code path that will lead to an uninit fdt being returned...
>
> OK, so perhaps this was putting it too strongly. I have been bitten
> by uninitialised things enough in C that I may have taken a slightly
> overly-agressive view of fixing them in the source rather than the
> compiler. I do think compiler-level mitigations are better, and I take
> the point that we don't want to defeat compiler checking.
>
> (Does anyone - and by anyone I mean any large distro - compile with
> local variables inited by the compiler?)

This is where I say, "yes, Android" and you say "ugh no I meant a real
distro", and I say "well ...".

But yeah doesn't help us much.

cheers
