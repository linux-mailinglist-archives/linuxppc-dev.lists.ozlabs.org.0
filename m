Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90816102B32
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 18:55:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HYPv3Nk0zDqgr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 04:55:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HYKL1ZtvzDqft
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 04:51:18 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47HYKF0Rqyz9tysr;
 Tue, 19 Nov 2019 18:51:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GucKk23fozaz; Tue, 19 Nov 2019 18:51:13 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47HYKD6plKz9ttCN;
 Tue, 19 Nov 2019 18:51:12 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 033208B9; Tue, 19 Nov 2019 18:51:13 +0100 (CET)
Received: from 37-173-93-145.coucou-networks.fr
 (37-173-93-145.coucou-networks.fr [37.173.93.145]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Tue, 19 Nov 2019 18:51:13 +0100
Date: Tue, 19 Nov 2019 18:51:13 +0100
Message-ID: <20191119185113.Horde.6OywM5Gmhq3LRZDTsd-7HA1@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 2/2] powerpc/kexec: move kexec files into a dedicated
 subdir.
References: <e235973a1198195763afd3b6baffa548a83f4611.1572351221.git.christophe.leroy@c-s.fr>
 <afbef97ec6a978574a5cf91a4441000e0a9da42a.1572351221.git.christophe.leroy@c-s.fr>
 <87pnhpctrn.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pnhpctrn.fsf@mpe.ellerman.id.au>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:

> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> arch/powerpc/kernel/ contains 8 files dedicated to kexec.
>>
>> Move them into a dedicated subdirectory.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>
>> ---
>> v2: moved crash.c as well as it's part of kexec suite.
>> v3: renamed files to remove 'kexec' keyword from names.
>> v4: removed a ifdef in kexec/Makefile
>> ---
>>  arch/powerpc/kernel/Makefile                       | 19 +--------------=
-
>>  arch/powerpc/kernel/kexec/Makefile                 | 25=20=20
>>=20++++++++++++++++++++++
>>  arch/powerpc/kernel/{ =3D> kexec}/crash.c            |  0
>>  .../kernel/{kexec_elf_64.c =3D> kexec/elf_64.c}      |  0
>>  arch/powerpc/kernel/{ima_kexec.c =3D> kexec/ima.c}   |  0
>>  .../kernel/{machine_kexec.c =3D> kexec/machine.c}    |  0
>>  .../{machine_kexec_32.c =3D> kexec/machine_32.c}     |  0
>>  .../{machine_kexec_64.c =3D> kexec/machine_64.c}     |  0
>>  .../machine_file_64.c}                             |  0
>>  .../{kexec_relocate_32.S =3D> kexec/relocate_32.S}   |  2 +-
>>  10 files changed, 27 insertions(+), 19 deletions(-)
>>  create mode 100644 arch/powerpc/kernel/kexec/Makefile
>>  rename arch/powerpc/kernel/{ =3D> kexec}/crash.c (100%)
>>  rename arch/powerpc/kernel/{kexec_elf_64.c =3D> kexec/elf_64.c} (100%)
>>  rename arch/powerpc/kernel/{ima_kexec.c =3D> kexec/ima.c} (100%)
>>  rename arch/powerpc/kernel/{machine_kexec.c =3D> kexec/machine.c} (100%=
)
>>  rename arch/powerpc/kernel/{machine_kexec_32.c =3D>=20=20
>>=20kexec/machine_32.c} (100%)
>>  rename arch/powerpc/kernel/{machine_kexec_64.c =3D>=20=20
>>=20kexec/machine_64.c} (100%)
>>  rename arch/powerpc/kernel/{machine_kexec_file_64.c =3D>=20=20
>>=20kexec/machine_file_64.c} (100%)
>>  rename arch/powerpc/kernel/{kexec_relocate_32.S =3D>=20=20
>>=20kexec/relocate_32.S} (99%)
>
> I'm inclined to move the directory out of kernel, ie. up a level with mm
> and so on.
>
> And I also don't think the "machine" naming is useful anymore. It comes
> from the naming of the arch functions, eg. machine_kexec(), which was
> named to be analogous to machine_restart().
>
> So how about:
>
>   arch/powerpc/{kernel/machine_kexec.c =3D> kexec/core.c}
>   arch/powerpc/{kernel/machine_kexec_32.c =3D> kexec/core_32.c}
>   arch/powerpc/{kernel/machine_kexec_64.c =3D> kexec/core_64.c}
>   arch/powerpc/{kernel =3D> kexec}/crash.c
>   arch/powerpc/{kernel/kexec_elf_64.c =3D> kexec/elf_64.c}
>   arch/powerpc/{kernel/machine_kexec_file_64.c =3D> kexec/file_load.c}
>   arch/powerpc/{kernel/ima_kexec.c =3D> kexec/ima.c}
>   arch/powerpc/{kernel/kexec_relocate_32.S =3D> kexec/relocate_32.S}
>
> And we end up with:
>
>   $ find arch/powerpc/kexec
>   arch/powerpc/kexec/
>   arch/powerpc/kexec/file_load.c
>   arch/powerpc/kexec/relocate_32.S
>   arch/powerpc/kexec/core_64.c
>   arch/powerpc/kexec/ima.c
>   arch/powerpc/kexec/core.c
>   arch/powerpc/kexec/core_32.c
>   arch/powerpc/kexec/Makefile
>   arch/powerpc/kexec/crash.c
>   arch/powerpc/kexec/elf_64.c

That looks good

Christophe



