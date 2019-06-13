Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1566D4321C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 03:52:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PRZG2PHNzDr63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 11:52:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PRXT1Nb7zDr1c
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 11:50:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="eey7gZAU"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 45PRXS6nmmz9s4Y;
 Thu, 13 Jun 2019 11:50:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1560390648;
 bh=thn7JK5x3vGEaDygWLKfCJNwPqA7NrPpKmiNsfCzBiA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=eey7gZAU+iIVNwJT6r3Z2OwFCrVtTtPJxvmwWdI0kssjTx8Fa6VZ/kEvJc7/oGENe
 YgJj8ZveeFQlj3df++v9w+nrDeEf6njTUIIr78NYWM21fgcdvrLBA9gkeFzoWlFBFw
 gRONCqAJwp+lNEp64bplPdrVPyb3uy5FsCvDXhv6rnYLdeBgZy1LYPuI1K0Awos0Uu
 nYmTRTq0CjGycSCS+qPseNTBNzTkCLP6rinjEu1KLUwILluX4bvVxQa7BtSr+y9hAG
 hzGn7c86sriq8R8i84uwzjTk21X76H0T/R6rfkY58NzviOI5v4qc2KAY4gxJm42ABk
 PVe30qPSGHmpg==
Received: by neuling.org (Postfix, from userid 1000)
 id DF3A62A0E2F; Thu, 13 Jun 2019 11:50:48 +1000 (AEST)
Message-ID: <688dfb940de8259630f249391c6cfd6e41c3bdee.camel@neuling.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix r3 corruption in h_set_dabr()
From: Michael Neuling <mikey@neuling.org>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>, 
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, mpe@ellerman.id.au
Date: Thu, 13 Jun 2019 11:50:48 +1000
In-Reply-To: <1560386385.1924.2.camel@gmail.com>
References: <20190612072229.15832-1-mikey@neuling.org>
 <c648ec86-8af6-c61f-b430-8e4f7f19225d@kaod.org>
 <605bc6844ebb0ce2bf9dea906b707359500ceb4f.camel@neuling.org>
 <1560386385.1924.2.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Suraj Jitindar Singh <surajjs@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> > > 3:
> > >         /* Emulate H_SET_DABR/X on P8 for the sake of compat mode
> > > guests */
> > >         rlwimi  r5, r4, 5, DAWRX_DR | DAWRX_DW
> > > c00000000010b03c:       74 2e 85 50     rlwimi  r5,r4,5,25,26
> > >         rlwimi  r5, r4, 2, DAWRX_WT
> > > c00000000010b040:       f6 16 85 50     rlwimi  r5,r4,2,27,27
> > >         clrrdi  r4, r4, 3
> > > c00000000010b044:       24 07 84 78     rldicr  r4,r4,0,60
> > >         std     r4, VCPU_DAWR(r3)
> > > c00000000010b048:       c0 13 83 f8     std     r4,5056(r3)
> > >         std     r5, VCPU_DAWRX(r3)
> > > c00000000010b04c:       c8 13 a3 f8     std     r5,5064(r3)
> > >         mtspr   SPRN_DAWR, r4
> > > c00000000010b050:       a6 2b 94 7c     mtspr   180,r4
> > >         mtspr   SPRN_DAWRX, r5
> > > c00000000010b054:       a6 2b bc 7c     mtspr   188,r5
> > >         li      r3, 0
> > > c00000000010b058:       00 00 60 38     li      r3,0
> > >         blr
> > > c00000000010b05c:       20 00 80 4e     blr
> >=20
> > It's the `mtspr   SPRN_DAWR, r4` as you're HV=3D0.  I'm not sure how
> > nested works
> > in that regard. Is the level above suppose to trap and emulate
> > that? =20
> >=20
>=20
> Yeah so as a nested hypervisor we need to avoid that call to mtspr
> SPRN_DAWR since it's HV privileged and we run with HV =3D 0.
>=20
> The fix will be to check kvmhv_on_pseries() before doing the write. In
> fact we should avoid the write any time we call the function from _not_
> real mode.
>=20
> I'll submit a fix for the KVM side. Doesn't look like this is anything
> to do with Mikey's patch, was always broken as far as I can tell.

Thanks Suraj.

Mikey

