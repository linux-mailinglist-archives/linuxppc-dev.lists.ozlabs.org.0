Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18DD7FCE47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 06:29:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VHRce5Yd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg7Dt2JFFz3d9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 16:29:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VHRce5Yd;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg7D00Wk9z30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 16:29:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701235743;
	bh=GFT7EAkVpEquWEJU6kXdzQ2WWWjUfAfDnDgiMdjjeQ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VHRce5Yd2nHOqIegCPxwoQ5yPwiG4xdQX1p7X5l43N9KxbNOnaesBwvs5SIN2D5Qq
	 xUQm1SRPSqpEKXwQ1WyogPbdNZ4UWX4A4I+b5Kdqf8TLgAvS3Fx3xf5lKvFq3cvMay
	 kXHv1FaMOnSv8RmXb/GbQVMrKhqsZx/RkMUmRZViv7K/gEco/cWA4lldpyaD5U0ZoV
	 X4yk3Z1cMsmGYULy42scb/DriRqDNhgG6ef5ZzChaQ1BT4iv1zHmxA+oGSDVAIsVEC
	 Nrn307lKTkGIDfzwG1L/SSPPzJAtFD3x1Qt1XOm13iFsJ20rxHL0pg57rTC+/VEGzL
	 TMmRu80pHLdGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sg7Cx6LhMz4xQZ;
	Wed, 29 Nov 2023 16:29:01 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Zhao Ke =?utf-8?B?6LW1IOWPrw==?= <ke.zhao@shingroup.cn>,
 npiggin@gmail.com,
 christophe.leroy@csgroup.eu, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH] powerpc: Add PVN support for HeXin C2000 processor
In-Reply-To: <52743BC52E07B486+dcb66331-0993-462b-ac03-6de69a3e1fac@shingroup.cn>
References: <20231117075215.647-1-ke.zhao@shingroup.cn>
 <87sf4yk19w.fsf@mail.lhotse>
 <52743BC52E07B486+dcb66331-0993-462b-ac03-6de69a3e1fac@shingroup.cn>
Date: Wed, 29 Nov 2023 16:28:56 +1100
Message-ID: <878r6h2kmf.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: luming.yu@shingroup.cn, kvm@vger.kernel.org, dawei.li@shingroup.cn, linux-kernel@vger.kernel.org, shenghui.qu@shingroup.cn, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zhao Ke =E8=B5=B5 =E5=8F=AF <ke.zhao@shingroup.cn> writes:
> On 2023/11/22 9:46, Michael Ellerman wrote:
>> Zhao Ke <ke.zhao@shingroup.cn> writes:
>>> HeXin Tech Co. has applied for a new PVN from the OpenPower Community
>>> for its new processor C2000. The OpenPower has assigned a new PVN
>>> and this newly assigned PVN is 0x0066, add pvr register related
>>> support for this PVN.
>>>
>>> Signed-off-by: Zhao Ke <ke.zhao@shingroup.cn>
>>> Link: https://discuss.openpower.foundation/t/how-to-get-a-new-pvr-for-p=
rocessors-follow-power-isa/477/10
>>=20=20=20
>> Hi Zhao Ke,
>>
>> Thanks for the patch. Just a few questions.
>>
>> Are you able to provide any further detail on the processor?
>>
>> Your cputable entry claims that it's identical to the original Power8
>> core, can you comment at all on how true that is in practice?
>
> Basically, we made lots of design change for the new processor.
>
> For example:
>
>  =C2=A0=C2=A0=C2=A0 1. redesign the interconnect of the fabric, from cros=
sbar to mesh
>
>  =C2=A0=C2=A0=C2=A0 2. redesign the memory subsystem, including the modif=
ication of L2=20
> and L3 architecture
>
>  =C2=A0=C2=A0=C2=A0 3. redesign the SMP bus
>
>  =C2=A0=C2=A0=C2=A0 4. upgrade PCIe to gen5 and increase the number of la=
nes
>
>  =C2=A0=C2=A0=C2=A0 5. upgrade ddr to DDR5, dimm direct connected, and th=
e number of=20
> channels
>
>  =C2=A0=C2=A0=C2=A0 6. redesign the pervasive architecture, including deb=
ug/trace,=20
> clock&power management, etc.

OK thanks for the detail.

Given all those changes I think you should not use "Power8" as the CPU
name. Whatever the lineage of the core design is, it's no longer a
literal "Power8", not even the same design using a different process
node.

So I think you should call it "HeXin C2000" or similar.

cheers
