Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCB52B3D07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 07:22:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZJsH4hndzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 17:22:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZJqD6nkzzDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 17:20:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JdxmTmym; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZJq95Fvyz9sRR;
 Mon, 16 Nov 2020 17:20:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1605507656;
 bh=mJiJ2dD46rXsWvmGaqBk9GBKy8gbF/FCLB/jibKcKH0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JdxmTmym1+HkpZRq3FDqd+1FXyX90Lsc/DNpqUMCyEaFPll7wKxeQBNXaKEt1/2H3
 pxgPq4nhYtk1E24eiJq/QVl2xDJMZr7sv5VMngYc4dSMo4+dPYR1v0MMQ4E8IEtQF7
 lEpTcdzqubWi0vbkUasiJM1vglh32VK8RIRArDy9nG3FfvqqjyWZDSXwXzIqDvsqP2
 MHIbHbtPC6DPc54eeWteX1yFOs+f/eObHU134OjXmncKgA5u2xOgtP8vpjbVaiNaHu
 ZRrS1VwuhODeBCqSEA6ouIwdq1a7LjTdt9TUnhgKeizDCrDbvIGRtfV/M+qTmi1sd/
 AHD+NHnp/giHQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Andrew Donnellan <ajd@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] vfio_pci_nvlink2: Do not attempt NPU2 setup on old
 P8's NPU
In-Reply-To: <1f2be6b0-d53a-aa58-9c4f-d55a6a5b1c79@ozlabs.ru>
References: <20201113050632.74124-1-aik@ozlabs.ru>
 <0b8ceab2-e304-809f-be3c-512b28b25852@linux.ibm.com>
 <1f2be6b0-d53a-aa58-9c4f-d55a6a5b1c79@ozlabs.ru>
Date: Mon, 16 Nov 2020 17:20:53 +1100
Message-ID: <87eekt4ybe.fsf@mpe.ellerman.id.au>
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
Cc: Leonardo Augusto Guimaraes Garcia <lagarcia@br.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> On 13/11/2020 16:30, Andrew Donnellan wrote:
>> On 13/11/20 4:06 pm, Alexey Kardashevskiy wrote:
>>> We execute certain NPU2 setup code (such as mapping an LPID to a device
>>> in NPU2) unconditionally if an Nvlink bridge is detected. However this
>>> cannot succeed on P8+ machines as the init helpers return an error other
>>> than ENODEV which means the device is there is and setup failed so
>>> vfio_pci_enable() fails and pass through is not possible.
>>>
>>> This changes the two NPU2 related init helpers to return -ENODEV if
>>> there is no "memory-region" device tree property as this is
>>> the distinction between NPU and NPU2.
>>>
>>> Fixes: 7f92891778df ("vfio_pci: Add NVIDIA GV100GL [Tesla V100 SXM2] 
>>> subdriver")
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> 
>> Should this be Cc: stable?
>
> This depends on whether P8+ + NVLink was ever a  product (hi Leonardo) 
> and had actual customers who still rely on upstream kernels to work as 
> after many years only the last week I heard form some Redhat test 
> engineer that it does not work. May be cc: stable...

I don't think it really matters if it was a product or not. Upstream is
never a product anyway.

If the fix is simple and unlikely to introduce a regression, and would
potentially save someone having to debug the problem again, then it
should get backported to stable.

You should also clarify what you mean by "P8+", it won't be clear to
most readers if you mean "Power 8 and/or later" or specifically Naples /
Power8 NVL.

cheers
