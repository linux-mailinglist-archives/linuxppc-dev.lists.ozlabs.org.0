Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB644FA7F5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 15:04:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbFhG3Mvbz3bq9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 23:04:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Arr5apvY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbFgh2M2hz2xdN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 23:04:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Arr5apvY; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KbFgh1Rjtz4xYM;
 Sat,  9 Apr 2022 23:04:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649509456;
 bh=NhWZMSd+6RLR9q6SGpS1J+pxUouXZseVNuDfx7YCGx8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Arr5apvYIZ5nB2AhtgTa/lzJwZnjtWh9w3saGQUw6nHr/9aFPSksdo0II/iIGd0Lh
 9tj7NNR6Zz96//x5G1JkU668KsXCMhx00IWbzVGgLzz4jyk0tD4U4O5SIXg6o0t44N
 az+4GKELdnOmJRajUcpxsf2Ggh7gH3vYJB1865XYgIB04jP8KLLdBlx5ef122SVXsk
 MSRvXvWfarpnDnXhH5E5lBSi2DsfVX6igouVVkrCT6vJllyiXgfpx3/vAF/HckhSCX
 wp8uYp8Hs4I086VpgUfR6i1z34M+ogbNJByk8g7xorJ6dmZj/G3pMT3EefApIl2dWB
 BzEI0CtlNTUcA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Mark arch_get_ima_policy() and
 is_ppc_trustedboot_enabled() as __init
In-Reply-To: <c97b7032d777853c2f4b8d2e7f9fc7a522ff891c.camel@linux.ibm.com>
References: <20220407141520.733735-1-mpe@ellerman.id.au>
 <ebfa96c9cdcd48b28c524af0fb4e10bcb5a7acb9.camel@linux.ibm.com>
 <05e8ec5c0f471b17eeec417285a0691a61377d51.camel@linux.ibm.com>
 <c97b7032d777853c2f4b8d2e7f9fc7a522ff891c.camel@linux.ibm.com>
Date: Sat, 09 Apr 2022 23:04:15 +1000
Message-ID: <87bkxa76i8.fsf@mpe.ellerman.id.au>
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
Cc: nayna@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mimi Zohar <zohar@linux.ibm.com> writes:
> On Fri, 2022-04-08 at 13:31 -0400, Mimi Zohar wrote:
>> On Fri, 2022-04-08 at 12:05 -0400, Mimi Zohar wrote:
>> > On Fri, 2022-04-08 at 00:15 +1000, Michael Ellerman wrote:
>> > > We can mark arch_get_ima_policy() as __init because it's only caller
>> > > ima_init_arch_policy() is __init. We can then mark
>> > > is_ppc_trustedboot_enabled() __init because its only caller is
>> > > arch_get_ima_policy().
>> > > 
>> > > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> > 
>> > I assume you want to upstream this via power,
>> > 
>> >     Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>> 
>> Sorry, I just noticed that is_ppc_trustedboot_enabled() is also called
>> by arch_ima_get_secureboot().
>
> Never mind, arch_ima_get_secureboot() calls
> is_ppc_secureboot_enabled(), not is_ppc_trustedboot_enabled().

Yeah despite the long names they are still easy to confuse :)

cheers
