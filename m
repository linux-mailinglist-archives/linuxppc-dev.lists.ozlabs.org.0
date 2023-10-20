Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A29417D0DC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 12:45:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ifl/oYvh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBh7741j5z3dDq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 21:45:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ifl/oYvh;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBh6G2glwz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 21:44:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697798659;
	bh=BOQy2S+gkRQ6GqEG1l3wx7Pc1XFdYna8OiPHPqKzES4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ifl/oYvh+TRsSqRgEPMixGOqr4MoU0N6idL02NbzyNh9SF3hMbCT+41P1QDWt9mVo
	 r0TnbRSCGpHxnFA9gfGRPjgqC0x+mJUC+G5G3bjzrS2ECDmKQriQsQBsa5eSkJrlLT
	 nIqcKEqedWmBVS5HNXbL1uOSBHiHHvVSm1LE7Kg0f1/pSXNmJVbpWAnvbch0WWD0+u
	 Z0dVWmEId377e1yEOsZALaWYmd8CxmAeINvjgQIdioHEWLBHybz/2wsXn2p1O86dEd
	 SGlFy6Qr3r8lxy7s+ZxRnYq6QqQnhT34XhJPgr0BVQ0hdxxZZmMskpbccxYulBee/c
	 Cwb6zW0meP0UQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SBh6B6KH4z4xdP;
	Fri, 20 Oct 2023 21:44:18 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/6] powerpc/smp: Move shared_processor static key to
 smp.h
In-Reply-To: <20231019130843.GI2194132@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-4-srikar@linux.vnet.ibm.com>
 <87sf675im3.fsf@mail.lhotse> <20231019130843.GI2194132@linux.vnet.ibm.com>
Date: Fri, 20 Oct 2023 21:44:14 +1100
Message-ID: <877cnh60ap.fsf@mail.lhotse>
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
Cc: Valentin Schneider <vschneid@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, x86@kernel.org, Ajay Kaher <akaher@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Rohan McLure <rmclure@linux.ibm.com>, Alexey Makhalov <amakhalov@vmware.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Michael Ellerman <mpe@ellerman.id.au> [2023-10-19 15:41:40]:
>
>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>> > The ability to detect if the system is running in a shared processor
>> > mode is helpful in few more generic cases not just in
>> > paravirtualization.
>> > For example: At boot time, different scheduler/ topology flags may be
>> > set based on the processor mode. Hence move it to a more generic file.
>> 
>> I'd rather you just included paravirt.h in the few files where you need it.
>
> I thought, detecting if a Processor was shared or not was more a
> smp/processor related than a paravirt related.

It's both really :)

It's definitely paravirt related though, because if we weren't
*para*virt then we wouldn't know there was a hypervisor at all :)

But having smaller more focused headers is preferable in general just
for mechanical reasons.

cheers
