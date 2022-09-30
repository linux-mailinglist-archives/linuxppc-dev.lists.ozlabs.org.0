Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B84575F0394
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 06:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mdy1K4ZhZz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 14:29:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gcxowIOd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mdy0j6fncz3bln
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 14:28:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gcxowIOd;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mdy0b2PCtz4xGT;
	Fri, 30 Sep 2022 14:28:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664512127;
	bh=wykyjk1vRB+wmm4zz+5y1/6bWmQOokwGfLJ10piwdwM=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=gcxowIOdM3KDskfNkQfnpJl2rFLH9fFbM1sHzGtx/B/WhCMp1W0wIP1dF1pS1pPxR
	 NbiyfTDzvLb7J/Yt7zu1S/a/fDQMPrsBEqy5FKMZbYo4oQ+DDT2PuWKO7ZkmnlxqTW
	 wHW/aXa5BVXqUBxlc7Nst/USiOW3NNWvukUY5rxQUZUn6F658NIxBJqx1iwZH6mqTR
	 9nOuUryVEhsuG8gpeugSSrvdaFEp0df2sVIrBAnp5qNXfbiRSEI/5ZVeB2pdtD/FbC
	 HmnOTf9E7QzxiHPYDuawIZQMAyoObEH44cK132INzeg7xyL8a2tR/PYh7Gbz0F4o3W
	 +0JbAfAtFsnDg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/pseries: Add firmware details to dump stack
 arch description
In-Reply-To: <87tu4rp885.fsf@linux.ibm.com>
References: <20220928134025.1739909-1-mpe@ellerman.id.au>
 <20220928134025.1739909-6-mpe@ellerman.id.au>
 <87tu4rp885.fsf@linux.ibm.com>
Date: Fri, 30 Sep 2022 14:28:46 +1000
Message-ID: <87pmfdeb9d.fsf@mpe.ellerman.id.au>
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
>
>> Add firmware version details to the dump stack arch description, which
>> is printed in case of an oops.
>>
>> Currently /hypervisor only exists on KVM, so if we don't find that
>> look for something that suggests we're on phyp and if so that's
>> probably a good guess. The actual content of the ibm,fw-net-version
>> seems to be a full path so is too long to add to the description.
>
> My only reservation is that ibm,fw-net-version seems to be unspecified
> and could disappear in future firmware versions.

Yeah good point.

> /ibm,powervm-partition would be the best PAPR-specified property for
> this purpose, but I don't see it on a P8/860 partition I checked,
> unfortunately. I do see it on a P9. Presumably it's present in device
> trees on PowerVM P9 systems and later, but it's probably too new to use
> for this.

I'll look for both, it's easy enough.

> /ibm,lpar-capable "indicates that the platform is capable of supporting
> logical partitioning and is only present on such systems." This one is
> present on the P8.

But conceivably qemu/KVM could provide that property, which would defeat
the purpose here which is to differentiate which actual hypervisor we're
under.

>> eg: Hardware name: ... of:'IBM,FW860.42 (SV860_138)' hv:phyp
>
> Will this info get printed during boot as well? There are many times it
> would have been useful to me when looking at logs from non-oopsed
> kernels.

No it's not. But you're right that would often be useful.

I think we can print it at the end of probe_machine().

I'll send a v2.

cheers
