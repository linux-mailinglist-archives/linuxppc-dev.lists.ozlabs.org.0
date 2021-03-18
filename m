Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA85933FD33
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 03:27:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F19sS4xPVz3bvG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 13:27:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SXK8ydgQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SXK8ydgQ; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F19s261TRz300V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 13:27:01 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F19rt2cr9z9sW1;
 Thu, 18 Mar 2021 13:26:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616034415;
 bh=n7jbAoL3R+9HiLhJbEg9m55h22lar+wmmLU1ms4QAFE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SXK8ydgQAX3qbq58RUaD0IWoICWrGDDwcNc1/vYOAfR9EibmMAfUFUaqngBXOaC7A
 JqVj7B+LvtP/M4cGOYe0Deg9DgEUMSLo4F2AsxDb6bCblhAWm5QcvTjFpnDP3Jf3tO
 MXI5rK2pH7dqv0P7BytwqtHbEGlV7wqHw9L2+/6oFMtHN3WcdGfKsgihD4/R3qNdOd
 s+5cqAhWFxF5m8Hrd5TLl8Qts87RmL4+YiEIdRgkGSJPQusL4uPAz7/VmFPCQuCnxB
 XBk46m+OUwrcd8EW1ISlLebuFbdiM4vlyP/NLha3+RjpyjT8OBjoQ8pRGN127PV+uR
 evKtaJpFAgmUw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/numa: Fix topology_physical_package_id() on
 pSeries
In-Reply-To: <20210312143154.3181109-1-clg@kaod.org>
References: <20210312143154.3181109-1-clg@kaod.org>
Date: Thu, 18 Mar 2021 13:26:52 +1100
Message-ID: <871rcdp577.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> Initial commit 15863ff3b8da ("powerpc: Make chip-id information
> available to userspace") introduce a cpu_to_chip_id() routine for the
> PowerNV platform using the "ibm,chip-id" property to query the chip id
> of a CPU. But PAPR does not specify such a property and the node id
> query is broken.
>
> Use cpu_to_node() instead which guarantees to have a correct value on
> all platforms, PowerNV an pSeries.

I'm not convinced this is correct on any platforms :)

The node (nid) is just a number made up by Linux, so it's not a
"physical package id".

It might correspond to a "physical package" (whatever that means), on
existing skiboot, but it's not guaranteed.

The PAPR text around associativity and so on is incredibly dense, but I
think one thing that is clear is that firmware is allowed to present to
us whatever boundaries it thinks are most meaningful.

ie. if two things on one "physical package" have a meaningful distance
between them, then they might be presented to us as two nodes.

Having said that, if you look at the documentation in the kernel we
have:

	physical_package_id: physical package id of cpu#. Typically
	corresponds to a physical socket number, but the actual value
	is architecture and platform dependent.

Which is nicely vague.

But then:

	core_siblings: internal kernel map of cpu#'s hardware threads
	within the same physical_package_id.

Which is not true for us already on bare metal. And is just wrong on
modern CPUs where there's multiple non-siblings in a single
core/chip/package.

So a patch to update the documentation would be good :)

As far as what we should do in our topology code, I think we should use
the chip-id when we have it - ie. on bare metal.

It may not be exactly correct, but it's at least not filtered through
any indirection about NUMA-ness, ie. the associativity properties.

Also we've been using it for several years and I don't think we should
risk breaking anything by changing the value now.

As far as pseries, I'm still a bit dubious, but maybe using nid is
better than providing nothing, even if it is a lie.

cheers
