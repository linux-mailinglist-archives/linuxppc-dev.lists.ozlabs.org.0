Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0999139E4BB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 19:05:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzKWG3rk0z3btw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 03:05:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=207.211.30.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Tue, 08 Jun 2021 03:05:07 AEST
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzKVq55m8z2yWP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 03:05:07 +1000 (AEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-WzaWuj7fOoKjQTeYoi4vtQ-1; Mon, 07 Jun 2021 13:03:49 -0400
X-MC-Unique: WzaWuj7fOoKjQTeYoi4vtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3BC58030CF;
 Mon,  7 Jun 2021 17:03:47 +0000 (UTC)
Received: from bahia.lan (ovpn-112-112.ams2.redhat.com [10.36.112.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC5485D6D3;
 Mon,  7 Jun 2021 17:03:45 +0000 (UTC)
Date: Mon, 7 Jun 2021 19:03:43 +0200
From: Greg Kurz <groug@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] Revert "powerpc: Switch to relative jump labels"
Message-ID: <20210607190343.49a44750@bahia.lan>
In-Reply-To: <87h7iighow.fsf@mpe.ellerman.id.au>
References: <20210528012943.23192-1-r.bolshakov@yadro.com>
 <87pmxah1h6.fsf@mpe.ellerman.id.au>
 <YLOcG55/gCNuMsBU@SPB-NB-133.local>
 <87h7iighow.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Anastasia Kovaleva <a.kovaleva@yadro.com>, linux@yadro.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 01 Jun 2021 17:36:15 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Roman Bolshakov <r.bolshakov@yadro.com> writes:
> > On Sat, May 29, 2021 at 09:39:49AM +1000, Michael Ellerman wrote:
> >> Roman Bolshakov <r.bolshakov@yadro.com> writes:
> >> > This reverts commit b0b3b2c78ec075cec4721986a95abbbac8c3da4f.
> >> >
> >> > Otherwise, direct kernel boot with initramfs no longer works in QEMU=
.
> >> > It's broken in some bizarre way because a valid initramfs is not
> >> > recognized anymore:
> >> >
> >> >   Found initrd at 0xc000000001f70000:0xc000000003d61d64
> >> >   rootfs image is not initramfs (XZ-compressed data is corrupt); loo=
ks like an initrd
> >> >
> >> > The issue is observed on v5.13-rc3 if the kernel is built with
> >> > defconfig, GCC 7.5.0 and GNU ld 2.32.0.
> >>=20
> >> Are you able to try a different compiler?
> >
> > Hi Michael,
> >
> > I've just tried GCC 9.3.1 and the result is the same.
> >
> > The offending patch has assembly inlines, they typically go through
> > binutils/GAS and it might also be a case when older binutils doesn't
> > implement something properly (i've seen this on x86 and arm).
>=20
> Jump labels use asm goto, which is a compiler feature, but you're right
> that the binutils version could also be important.
>=20
> What ld versions have you tried?
>=20
> And are those the toolchains from kernel.org or somewhere else?
>=20
> >> I test booting qemu constantly, but I don't use GCC 7.5.
> >>
> >> And what qemu version are you using?
> >>=20
> >
> > QEMU 3.1.1, but I've also tried 6.0.50 (QEMU master, 62c0ac5041e913) an=
d
> > it fails the same way.
>=20
> OK.
>=20
> >> I assume your initramfs is compressed with XZ? How large is it
> >> compressed?
> >>=20
> >
> > Yes, XZ. initramfs size is 30 MB (around 100 MB cpio size).
> >
> > It's interesting that the issue doesn't happen if I pass initramfs from
> > host (11MB), then the initramfs can be recognized. It might be related
> > to initramfs size then and bigger initramfs that used to work no longer
> > work with v5.13-rc3.
>=20
> Are you using qemu's -initrd option to pass the initramfs, or are you
> building the initramfs into the kernel?
>=20

Hi Michael,

I'm hitting the same issue while trying to boot a RHEL9 guest with
the distro's default kernel/initramfs and grub.

Interestingly this doesn't happen with older QEMU, e.g. 4.2.0 that
is shipped with RHEL8. I've bissected to this commit from the
QEMU 5.0 era :


commit 8897ea5a9fc0aafa5ed7eee1e0c49893b91a2d87
Author: David Gibson <david@gibson.dropbear.id.au>
Date:   Thu Nov 28 16:37:04 2019 +1100

    spapr: Don't attempt to clamp RMA to VRMA constraint


This mostly changes how memory is presented in the FDT.

Before 8897ea5a9fc, for a VM with 1 gig of RAM, we had several nodes,
first one being the VRMA (limited to 256 megs).

        memory@20000000 {
                ibm,associativity =3D <0x04 0x00 0x00 0x00 0x00>;
                reg =3D <0x00 0x20000000 0x00 0x20000000>;
                device_type =3D "memory";
        };

        memory@10000000 {
                ibm,associativity =3D <0x04 0x00 0x00 0x00 0x00>;
                reg =3D <0x00 0x10000000 0x00 0x10000000>;
                device_type =3D "memory";
        };

        memory@0 {
                ibm,associativity =3D <0x04 0x00 0x00 0x00 0x00>;
                reg =3D <0x00 0x00 0x00 0x10000000>;
                device_type =3D "memory";
        };


Now we have a single node for all RAM:

        memory@0 {
                ibm,associativity =3D <0x04 0x00 0x00 0x00 0x00>;
                reg =3D <0x00 0x00 0x00 0x40000000>;
                device_type =3D "memory";
        };

If I set an arbitrary constraint again on the VRMA, I get the
multiple memory nodes back and, depending on the value, the
boot succeeds. In my 1 gig RHEL9 guest case, I need to set
a VRMA size <=3D 0x32000000.

Not sure how this can relate to the initramfs though. I just see
that grub doens't map it at the same place:

0x0000000003100000 when boot fails

0x000000000f000000 when boot succeeds

In case this rings a bell...

> > So, I've created a small initramfs using only static busybox (2.7M
> > uncompressed, 960K compressed with xz). No error is produced and it
> > boots fine.
> >
> > If I add a dummy file (11M off /dev/urandom) to the small busybox
> > initramfs, it boots and the init is started but I'm seeing the error:
> >
> >   rootfs image is not initramfs (XZ-compressed data is corrupt); looks =
like an initrd
> >
> > sha1sum of the file inside initramfs doesn't match sha1sum on the host.
> >
> >   guest # sha1sum dummy
> >   407c347e671ddd00f69df12b3368048bad0ebf0c  dummy
> >   # QEMU: Terminated
> >   host $ sha1sum dummy
> >   ed8494b3eecab804960ceba2c497270eed0b0cd1  dummy
> >
> > sha1sum is the same in the guest and on the host for 10M dummy file:
> >
> >   guest # sha1sum dummy
> >   43855f7a772a28cce91da9eb8f86f53bc807631f  dummy
> >   # QEMU: Terminated
> >   host $ sha1sum dummy
> >   43855f7a772a28cce91da9eb8f86f53bc807631f  dummy
> >
> > That might explain why bigger initramfs (or initramfs with bigger files=
)
> > doesn't boot - because some files might appear corrupted inside the gue=
st.
> >
> > Here're the sources of the initrd along with 11M dummy file:
> >   https://drive.yadro.com/s/W8HdbPnaKmPPwK4
> >
> > I've compressed it with:
> >   $ find . 2>/dev/null | cpio -ocR 0:0 | xz  --check=3Dcrc32 > ../initr=
d-dummy.xz
> >
> > Hope this helps,
>=20
> I haven't been able to reproduce any corruption, with various initramfs
> sizes.
>=20
> Can you send us your kernel .config & qemu command line.
>=20
> And can you try the patch below?
>=20
> cheers
>=20
>=20
> diff --git a/arch/powerpc/kernel/jump_label.c b/arch/powerpc/kernel/jump_=
label.c
> index ce87dc5ea23c..3d9878124cde 100644
> --- a/arch/powerpc/kernel/jump_label.c
> +++ b/arch/powerpc/kernel/jump_label.c
> @@ -13,6 +13,9 @@ void arch_jump_label_transform(struct jump_entry *entry=
,
>  {
>  =09struct ppc_inst *addr =3D (struct ppc_inst *)jump_entry_code(entry);
> =20
> +=09if (!is_kernel_text((unsigned long)addr) && !is_kernel_inittext((unsi=
gned long)addr))
> +=09=09printk("%s: addr %px %pS is not kernel text?\n", __func__, addr, a=
ddr);
> +

I've applied this too. It doesn't produce any output in the crashing case.
On the contrary I get tons of them when I run with the hacked VRMA size,
but they show up much later, after we've already freed the initrd memory.

Cheers,

--
Greg

>  =09if (type =3D=3D JUMP_LABEL_JMP)
>  =09=09patch_branch(addr, jump_entry_target(entry), 0);
>  =09else

