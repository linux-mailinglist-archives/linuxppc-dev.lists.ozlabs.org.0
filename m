Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DC63A7C7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 12:53:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G44sn1jqrz3c2q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 20:53:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=207.211.30.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G44sL0Mnwz308f
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 20:52:10 +1000 (AEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-KcEw6pD2P5Ws-WiZrgDqYA-1; Tue, 15 Jun 2021 06:51:57 -0400
X-MC-Unique: KcEw6pD2P5Ws-WiZrgDqYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 729151926DB8;
 Tue, 15 Jun 2021 10:51:56 +0000 (UTC)
Received: from bahia.lan (ovpn-112-248.ams2.redhat.com [10.36.112.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5D3860C0F;
 Tue, 15 Jun 2021 10:51:54 +0000 (UTC)
Date: Tue, 15 Jun 2021 12:51:51 +0200
From: Greg Kurz <groug@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Fix initrd corruption with relative jump labels
Message-ID: <20210615125151.6a27646c@bahia.lan>
In-Reply-To: <20210614175740.6721fe0a@bahia.lan>
References: <20210614131440.312360-1-mpe@ellerman.id.au>
 <20210614175740.6721fe0a@bahia.lan>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: linuxppc-dev@lists.ozlabs.org, r.bolshakov@yadro.com, a.kovaleva@yadro.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 14 Jun 2021 17:57:40 +0200
Greg Kurz <groug@kaod.org> wrote:

> On Mon, 14 Jun 2021 23:14:40 +1000
> Michael Ellerman <mpe@ellerman.id.au> wrote:
>=20
> > Commit b0b3b2c78ec0 ("powerpc: Switch to relative jump labels") switche=
d
> > us to using relative jump labels. That involves changing the code,
> > target and key members in struct jump_entry to be relative to the
> > address of the jump_entry, rather than absolute addresses.
> >=20
> > We have two static inlines that create a struct jump_entry,
> > arch_static_branch() and arch_static_branch_jump(), as well as an asm
> > macro ARCH_STATIC_BRANCH, which is used by the pseries-only hypervisor
> > tracing code.
> >=20
> > Unfortunately we missed updating the key to be a relative reference in
> > ARCH_STATIC_BRANCH.
> >=20
> > That causes a pseries kernel to have a handful of jump_entry structs
> > with bad key values. Instead of being a relative reference they instead
> > hold the full address of the key.
> >=20
> > However the code doesn't expect that, it still adds the key value to th=
e
> > address of the jump_entry (see jump_entry_key()) expecting to get a
> > pointer to a key somewhere in kernel data.
> >=20
> > The table of jump_entry structs sits in rodata, which comes after the
> > kernel text. In a typical build this will be somewhere around 15MB. The
> > address of the key will be somewhere in data, typically around 20MB.
> > Adding the two values together gets us a pointer somewhere around 45MB.
> >=20
> > We then call static_key_set_entries() with that bad pointer and modify
> > some members of the struct static_key we think we are pointing at.
> >=20
> > A pseries kernel is typically ~30MB in size, so writing to ~45MB won't
> > corrupt the kernel itself. However if we're booting with an initrd,
> > depending on the size and exact location of the initrd, we can corrupt
> > the initrd. Depending on how exactly we corrupt the initrd it can eithe=
r
> > cause the system to not boot, or just corrupt one of the files in the
> > initrd.
> >=20
> > The fix is simply to make the key value relative to the jump_entry
> > struct in the ARCH_STATIC_BRANCH macro.
> >=20
> > Fixes: b0b3b2c78ec0 ("powerpc: Switch to relative jump labels")
> > Reported-by: Anastasia Kovaleva <a.kovaleva@yadro.com>
> > Reported-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > Reported-by: Greg Kurz <groug@kaod.org>
> > Reported-by: Daniel Axtens <dja@axtens.net>
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > ---
>=20
> Great thanks for debugging this issue ! I'll try it out tomorrow morning.
>=20

This fixes the issue. Great thanks again :)

Tested-by: Greg Kurz <groug@kaod.org>

> Cheers,
>=20
> --
> Greg
>=20
> >  arch/powerpc/include/asm/jump_label.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/inclu=
de/asm/jump_label.h
> > index 2d5c6bec2b4f..93ce3ec25387 100644
> > --- a/arch/powerpc/include/asm/jump_label.h
> > +++ b/arch/powerpc/include/asm/jump_label.h
> > @@ -50,7 +50,7 @@ static __always_inline bool arch_static_branch_jump(s=
truct static_key *key, bool
> >  1098:=09nop;=09=09=09=09=09\
> >  =09.pushsection __jump_table, "aw";=09\
> >  =09.long 1098b - ., LABEL - .;=09=09\
> > -=09FTR_ENTRY_LONG KEY;=09=09=09\
> > +=09FTR_ENTRY_LONG KEY - .;=09=09=09\
> >  =09.popsection
> >  #endif
> > =20
>=20

