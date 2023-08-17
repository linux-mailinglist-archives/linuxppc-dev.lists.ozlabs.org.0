Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 547CE77F660
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 14:24:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iU0oIbJC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRPMf18R9z3cK4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 22:24:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iU0oIbJC;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRPLn1JQPz2xVV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 22:24:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692275038;
	bh=SmZfuOazkBB/9dXy3IBokg28/S6ezc+fJp9fFOBO+DA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iU0oIbJClbAQK+vJDjruv2frDEjEvd7BY/NGDYLww2yn/V4WTIMv9AIALw69MrehL
	 TrFPUzQWfvV4LylDDcZpmTdU4Y1oazvcP4r/0QTxMQkqvuRo8VbeYWMN3ZP50fTeaX
	 EzRG1v3xFmzOAa1aW60X5gb0MKyRA51RL/dF/h3X4v+RitVn/KIqCSCFgSlGJQtuGF
	 MNZ7wwtNNyY8DT0SQ34FeLuPvfhgY4RPqgZVPGklg0VIG+Zuk2t4DnFa3TsFYW4aU6
	 YZ9E9VACmbAdlLVE33xLV16gxfD4fm7GnEolu5VLiaS/IUsZVmOmygyLoS8fTq9Kys
	 eBfaPVESahD9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRPLk3vzWz4wZx;
	Thu, 17 Aug 2023 22:23:58 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 5/6] KVM: PPC: Add support for nestedv2 guests
In-Reply-To: <20230807014553.1168699-6-jniethe5@gmail.com>
References: <20230807014553.1168699-1-jniethe5@gmail.com>
 <20230807014553.1168699-6-jniethe5@gmail.com>
Date: Thu, 17 Aug 2023 22:23:58 +1000
Message-ID: <877cpteu1t.fsf@mail.lhotse>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> A series of hcalls have been added to the PAPR which allow a regular
> guest partition to create and manage guest partitions of its own. KVM
> already had an interface that allowed this on powernv platforms. This
> existing interface will now be called "nestedv1". The newly added PAPR
> interface will be called "nestedv2".  PHYP will support the nestedv2
> interface. At this time the host side of the nestedv2 interface has not
> been implemented on powernv but there is no technical reason why it
> could not be added.

Some build errors with powernv_defconfig, I haven't dug into them but
presumably some ifdefs needed.

  ../arch/powerpc/kvm/book3s_hv_nestedv2.c: In function =E2=80=98kvmhv_nest=
edv2_vcpu_create=E2=80=99:
  ../arch/powerpc/kvm/book3s_hv_nestedv2.c:954:14: error: implicit declarat=
ion of function =E2=80=98plpar_guest_create_vcpu=E2=80=99 [-Werror=3Dimplic=
it-function-declaration]
    954 |         rc =3D plpar_guest_create_vcpu(0, vcpu->kvm->arch.lpid, v=
cpu->vcpu_id);
        |              ^~~~~~~~~~~~~~~~~~~~~~~
  ../arch/powerpc/kvm/guest-state-buffer.c: In function =E2=80=98kvmppc_gsb=
_send=E2=80=99:
  ../arch/powerpc/kvm/guest-state-buffer.c:592:14: error: implicit declarat=
ion of function =E2=80=98plpar_guest_set_state=E2=80=99 [-Werror=3Dimplicit=
-function-declaration]
    592 |         rc =3D plpar_guest_set_state(hflags, gsb->guest_id, gsb->=
vcpu_id,
        |              ^~~~~~~~~~~~~~~~~~~~~
  ../arch/powerpc/kvm/guest-state-buffer.c: In function =E2=80=98kvmppc_gsb=
_recv=E2=80=99:
  ../arch/powerpc/kvm/guest-state-buffer.c:617:14: error: implicit declarat=
ion of function =E2=80=98plpar_guest_get_state=E2=80=99 [-Werror=3Dimplicit=
-function-declaration]
    617 |         rc =3D plpar_guest_get_state(hflags, gsb->guest_id, gsb->=
vcpu_id,


cheers
