Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBA918C45
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 16:49:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450GTD0XZ6zDq9V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 00:49:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450GPc62WyzDqQn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 00:46:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 450GPb74T4z9s4Y;
 Fri, 10 May 2019 00:46:27 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH] powerpc: Fix compile issue with force DAWR
In-Reply-To: <0e2e24dc-4533-4439-3dc1-97ec64fbf49b@c-s.fr>
References: <20190508013047.12850-1-mikey@neuling.org>
 <0e2e24dc-4533-4439-3dc1-97ec64fbf49b@c-s.fr>
Date: Fri, 10 May 2019 00:46:26 +1000
Message-ID: <87tve3vg71.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 08/05/2019 =C3=A0 03:30, Michael Neuling a =C3=A9crit=C2=A0:
>> If you compile with KVM but without CONFIG_HAVE_HW_BREAKPOINT you fail
>> at linking with:
>>    arch/powerpc/kvm/book3s_hv_rmhandlers.o:(.text+0x708): undefined refe=
rence to `dawr_force_enable'
>>=20
>> This was caused by this recent patch:
>>     commit c1fe190c06723322f2dfac31d3b982c581e434ef
>>     Author: Michael Neuling <mikey@neuling.org>
>>     powerpc: Add force enable of DAWR on P9 option
>
> I think you should use the standard commit format, checkpatch will tell y=
ou.
>
>>=20
>> This builds dawr_force_enable in always via a new file.
>
> Do we really need a new file just for that ?

I told him to make a new file, rather than drop it in some other file
that's already full of unrealted junk :)

I did mean for him to put all the dawr_force_enable code in the file
though, not just the variable.

> As far as I understand, it is always compiled in, so can't we use=20
> another file like traps.o or setup-common.o or somewhere else ?
>
> Or just put an ifdef in arch/powerpc/kvm/book3s_hv_rmhandlers.S ?
> Because your fix will put dawr_force_enable on every build even the ones=
=20
> who don't need it at all.

We don't want to use an ifdef in the KVM code, because that would break
the case where you want to enable the DAWR for use by guests but the
host kernel doesn't have PERF support.

It shouldn't be in obj-y, it should at least be 64-bit only.

But it should be pretty trivial to create a config symbol for it, with
something like:

config DAWR_FORCE_ENABLE
	def_bool y
        depends on PERF || KVM

cheers
