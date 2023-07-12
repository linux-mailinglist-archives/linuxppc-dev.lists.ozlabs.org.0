Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06756750872
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 14:35:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hvmfEYYl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1HJy6T2fz3c5f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 22:35:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hvmfEYYl;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1HJ356w8z3bVS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 22:34:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1689165294;
	bh=l35p0TcEUmDUj/vXsObL62vUHe1+adoudEDWvF7VoK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hvmfEYYloo9+IRmXyrs4Arl/1kGU/paHNLUvie0T/nS6bRdMeeoB4WC7r+jeOIev9
	 IayCUcVlviVodp3t3DV7/StkH94zI7nQDkG2FwVHeewYTleMnXbbkGBxGTdrRYROij
	 LzBUNSxJTqRxFR1Ha25q55R5S6VKLCC19BLMcDRI3kpJLtqbm8511rPSMs+c6Ir3oI
	 IS3gGq8K1J0acwa4JjPmQ0YMOcxVcgMAU3MjD1/gR2OBjfTngZjAjE1jHJeqnQZ8YD
	 OQjJCotWDyb08kBL6MMPltKIlGmU0b1drzbQy6fyJJgUw6mjn920EQnDJz29ybLOS+
	 L/xWDipukI61Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R1HHx21V2z4wxW;
	Wed, 12 Jul 2023 22:34:53 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stefan Berger <stefanb@linux.ibm.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] powerpc/tpm: Create linux,sml-base/size as big
 endian
In-Reply-To: <0fb26243-0d63-118b-2737-05391ba0c69a@linux.ibm.com>
References: <20230615123703.4028156-1-mpe@ellerman.id.au>
 <4d378d53225fc8b8cdc99dde900388d2eefaad4e.camel@kernel.org>
 <0fb26243-0d63-118b-2737-05391ba0c69a@linux.ibm.com>
Date: Wed, 12 Jul 2023 22:34:47 +1000
Message-ID: <87ttu9e2ag.fsf@mail.lhotse>
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
Cc: jgg@ziepe.ca, linux-integrity@vger.kernel.org, eajames@linux.ibm.com, peterhuewe@gmx.de, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stefan Berger <stefanb@linux.ibm.com> writes:
> On 7/10/23 17:23, Jarkko Sakkinen wrote:
>> On Thu, 2023-06-15 at 22:37 +1000, Michael Ellerman wrote:
>>> There's code in prom_instantiate_sml() to do a "SML handover" (Stored
>>> Measurement Log) from OF to Linux, before Linux shuts down Open
>>> Firmware.
>>>
>>> This involves creating a buffer to hold the SML, and creating two device
>>> tree properties to record its base address and size. The kernel then
>>> later reads those properties from the device tree to find the SML.
>>>
>>> When the code was initially added in commit 4a727429abec ("PPC64: Add
>>> support for instantiating SML from Open Firmware") the powerpc kernel
>>> was always built big endian, so the properties were created big endian
>>> by default.
>>>
>>> However since then little endian support was added to powerpc, and now
>>> the code lacks conversions to big endian when creating the properties.
>>>
>>> This means on little endian kernels the device tree properties are
>>> little endian, which is contrary to the device tree spec, and in
>>> contrast to all other device tree properties.
>>>
>>> To cope with that a workaround was added in tpm_read_log_of() to skip
>>> the endian conversion if the properties were created via the SML
>>> handover.
>>>
>>> A better solution is to encode the properties as big endian as they
>>> should be, and remove the workaround.
>>>
>>> Typically changing the encoding of a property like this would present
>>> problems for kexec. However the SML is not propagated across kexec, so
>>> changing the encoding of the properties is a non-issue.
>>>
>>> Fixes: e46e22f12b19 ("tpm: enhance read_log_of() to support Physical TPM event log")
>>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>>> ---
>>>   arch/powerpc/kernel/prom_init.c |  8 ++++++--
>>>   drivers/char/tpm/eventlog/of.c  | 23 ++++-------------------
>>>   2 files changed, 10 insertions(+), 21 deletions(-)
>> 
>> Split into two patches (producer and consumer).
>
> I think this wouldn't be right since it would break the system when
> only one patch is applied since it would be reading the fields in the
> wrong endianess.

Yes that's right.

Typically we would split the patch by subsystem, but in this case it
will just create a known-broken point in the git history, which helps no
one.

cheers
