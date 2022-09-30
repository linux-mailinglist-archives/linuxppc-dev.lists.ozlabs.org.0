Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4965F0291
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 04:07:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdtsB64kDz3cCV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 12:07:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qgEioKoJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mdtrc1YsHz3bTZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 12:06:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qgEioKoJ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mdtrb5c4gz4xGZ;
	Fri, 30 Sep 2022 12:06:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664503599;
	bh=BcCEH2ZqvQPteBR8dmFAXucBlyV+huMXunD2Nm5OwXw=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=qgEioKoJsDd49/cdUsBJOM56EeBtxw3nSboHCI/aJufk4b3dqgYz+9dJykpwXudMa
	 T48MU3aadK66pWAPw5YRbqRbcJewkQXGHk8KSY+vXTB/aZ/C6T0qx94MUuxHBHrIoC
	 cGEUdwUF0OQ47YqDLWX5YS9OmZbYrKdCJOHQQgxN3vAABkiv7jFv/Q+cB8jDUKvxyp
	 KX2E5o1QHUMtRk+uJAKpW2nLCqza4PU7GHfd7x9AcgrhbDIypkdKCk79AnhG6qg4DE
	 jDKB6TGFyilRG1KM5nEA+lE0yWdEQ6E7dTo2wQad5taS8BJTiC5WFToSK6MpFIbkvC
	 1qOX2ZySse4aQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 6/6] powerpc/pseries: Add firmware details to the
 hardware description
In-Reply-To: <87zgehbznb.fsf@linux.ibm.com>
References: <20220929142251.1987025-1-mpe@ellerman.id.au>
 <20220929142251.1987025-6-mpe@ellerman.id.au>
 <87zgehbznb.fsf@linux.ibm.com>
Date: Fri, 30 Sep 2022 12:06:39 +1000
Message-ID: <87tu4pehu8.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Add firmware version details to the hardware description, which is
>> printed at boot and in case of an oops.
>>
>> Use /hypervisor if we find it, though currently it only exists if we're
>> running under qemu.
>>
>> Look for "ibm,powervm-partition" which is specified in PAPR+ v2.11 and
>> tells us we're running under PowerVM.
>>
>> Failing that look for "ibm,fw-net-version" which is seen on PowerVM
>> going back to at least Power6.
>>
>> eg: Hardware name: ... of:'IBM,FW860.42 (SV860_138)' hv:'phyp'
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/platforms/pseries/setup.c | 30 ++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> v2: Look for "ibm,powervm-partition" as suggested by Nathan.
>>     Use of_property_read_string().
>
> LGTM.
>
> I noticed that we don't get an "of:" report with qemu+vof, because there's no
> /openprom node.
>
> $ qemu-system-ppc64 -nographic -vga none -M pseries,x-vof=off -kernel vmlinux | grep Hardware
> Hardware name: model:'IBM pSeries (emulated by qemu)' cpu:'POWER9 (raw)' pvr:0x4e1200 lpvr:0xf000005 of:'SLOF,HEAD' machine:pSeries
> $ qemu-system-ppc64 -nographic -vga none -M pseries,x-vof=on -kernel vmlinux | grep Hardware
> Hardware name: model:'IBM pSeries (emulated by qemu)' cpu:'POWER9 (raw)' pvr:0x4e1200 lpvr:0xf000005 machine:pSeries
> $ qemu-system-ppc64 --version
> QEMU emulator version 7.0.0 (qemu-7.0.0-6.fc36)
>
> I didn't see anything in the vof device tree that would help though.

OK. We don't boot via prom_init when booting with vof, so in that sense
there is no OF.

I think the combo of seeing qemu but no "of" is sufficient to recognise
that case.

cheers
