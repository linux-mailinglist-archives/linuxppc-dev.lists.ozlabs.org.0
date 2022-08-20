Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 650A559A9EE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 02:18:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8fNS3kSgz3dtJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 10:18:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=S0deJmQd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8fMr122vz3c1Q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 10:17:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=S0deJmQd;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M8fMp1mlCz4x3w;
	Sat, 20 Aug 2022 10:17:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660954662;
	bh=kHVpFxNkAULLG/pO0/v3ut6GYDG7On9e5n4rpFzSUAg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=S0deJmQd/llsvH5JnY3g+IafpCPjD8RRnFM8ErA2E3AZVNf11s0JAyHEb4iqWGkQd
	 j+Md5h8Qd9Wlt5XPgIGXjLuruBHK2X7dG9iYEw2OQ3T1SCTaqYxqvqrWPoX42hZ3LP
	 VbUch3sAaSkEUzFAwgRw0eTcpQFTIIl7/81GWHNHhMzy2wlYRNbR1UwZSHrJN46jZH
	 hvtbjRa+PaGEioEg6BttK2ufKz7lSgQJe4b7Mc0U3KozZt9qwj6V9exMyDnQNh3PWr
	 wa3C7d/KpS4S8bctwj1ORhA05kYe2HGU02ax/RKfG80bJOkL/7mygsYBpLd09GB8jr
	 pkFDOk1vLMzmQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bjorn Helgaas <helgaas@kernel.org>, Russell Currey <ruscur@russell.cc>
Subject: Re: [PATCH] MAINTAINERS: Remove myself as EEH maintainer
In-Reply-To: <20220819201955.GA2503063@bhelgaas>
References: <20220819201955.GA2503063@bhelgaas>
Date: Sat, 20 Aug 2022 10:17:41 +1000
Message-ID: <8735drn4yi.fsf@mpe.ellerman.id.au>
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
Cc: oohall@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bjorn Helgaas <helgaas@kernel.org> writes:
> On Sat, Aug 06, 2022 at 06:53:01PM +1000, Russell Currey wrote:
>> I haven't touched EEH in a long time I don't have much knowledge of the
>> subsystem at this point either, so it's misleading to have me as a
>> maintainer.
>> 
>> I remain grateful to Oliver for picking up my slack over the years.
>> 
>> Signed-off-by: Russell Currey <ruscur@russell.cc>
>> ---
>>  MAINTAINERS | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a9f77648c107..dfe6081fa0b3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15639,7 +15639,6 @@ F:	drivers/pci/endpoint/
>>  F:	tools/pci/
>>  
>>  PCI ENHANCED ERROR HANDLING (EEH) FOR POWERPC
>> -M:	Russell Currey <ruscur@russell.cc>
>>  M:	Oliver O'Halloran <oohall@gmail.com>
>>  L:	linuxppc-dev@lists.ozlabs.org
>>  S:	Supported
>
> I was thinking along these lines, but if you want to take this,
> Michael, I'll drop it:

Hi Bjorn,

I was hoping one of the protagonists would send a patch :), but that
looks perfect.

You may as well merge it given you've gone to the trouble to make a
proper patch out of the discussion.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> commit 92ea781689d1 ("MAINTAINERS: Add Mahesh J Salgaonkar as EEH maintainer")
> Author: Russell Currey <ruscur@russell.cc>
> Date:   Sat Aug 6 18:53:01 2022 +1000
>
>     MAINTAINERS: Add Mahesh J Salgaonkar as EEH maintainer
>     
>     Update EEH entry:
>     
>       - Russell: lacks time to maintain EEH.
>     
>       - Oliver: lacks time & hardware to do actual maintenance, but happy to
>         field questions and review things.
>     
>       - Mahesh: glad to take over EEH maintenance.
>     
>     [bhelgaas: commit log, add Mahesh, make Oliver reviewer]
>     Link: https://lore.kernel.org/r/20220806085301.25142-1-ruscur@russell.cc
>     Signed-off-by: Russell Currey <ruscur@russell.cc>
>     Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f60dfac7661c..51def5ac9462 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15696,8 +15696,8 @@ F:	drivers/pci/endpoint/
>  F:	tools/pci/
>  
>  PCI ENHANCED ERROR HANDLING (EEH) FOR POWERPC
> -M:	Russell Currey <ruscur@russell.cc>
> -M:	Oliver O'Halloran <oohall@gmail.com>
> +M:	Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> +R:	Oliver O'Halloran <oohall@gmail.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  S:	Supported
>  F:	Documentation/PCI/pci-error-recovery.rst
