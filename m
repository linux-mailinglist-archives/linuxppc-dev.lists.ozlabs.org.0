Return-Path: <linuxppc-dev+bounces-12552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71030B983F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 06:54:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWkzK48vcz302l;
	Wed, 24 Sep 2025 14:54:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758656902;
	cv=none; b=meocNL4I5f1dTUvTaHh5dqDPzX/X/Ogo06CN65mZAhuDBHyM0Mbzy4F81Lcr+7x+iq+n5CYWILOlwZhAQXUzSwb4c88dKy6/LcGoDYp+s5CSjQG3nnXbpyY8afIsBQ1cRIGGJTiWcG8DK9TI4RVh8bKjMyIEjMT3QdXqmNxIeyy+pp5g4Qw2fk5ALbaFYvgWutkofRTgHiwR0p5jXIl8M+CwvDzTCkzYbnqC+kwVa62HjfS8RWxC2QwuT93wrUJXKAQ2o0k6jNI70NzHgBDQskFWlnDn2x1txqCW/LkmTeFR3EqjF8HHQa6j/sYTdOU+uTvDaNJ+Wcb9UL1hIhR5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758656902; c=relaxed/relaxed;
	bh=OA3fe0tMFFuwr3+Qmcu6Uj0NBN2se/UNWBuMaKtHISA=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osqwrUIdlAxaAyViAP8nUmCLQZRC3bd/mtCVwgfASw0D8Tksg3tfc6QFCILSmzmDl9g5EUk1dfDqFNslfC52WTM+z/HOxtH4ZN/UNRvCHRkLD1JMVg9JAt8N/sTkOoVR2WeO4owqdD24uzXkEceJmRa03+a7NeVql+eSMI/APjQTHTLBgxpcYut6061mp1QA392IsUQevmHS1O/gOVmd0QM6ANtkZs8qhuhJ4z0tfyP3u6FIdTVRgykAf3/31NIyxRYBn0nPgkUL4j1Rn+esguyee6jbuFQ2p/iKRESpPxsiGiFTdpy4jgSgb6Nl4BLaqfa1ZP/zQP/7308X5pz4uQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GJPL78q1; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GJPL78q1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWVrz3gxFz2yxN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 05:48:19 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-62fa99bcfcdso8828884a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 12:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758656896; x=1759261696; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OA3fe0tMFFuwr3+Qmcu6Uj0NBN2se/UNWBuMaKtHISA=;
        b=GJPL78q1rM99llBtOkk77qm7rsrQo9VGsjxoTnKZSOJb7bBnfJumDyEQtXPUc45sLo
         tvPamBttoWrNlVwHpOoPec4atyldM1uFa7IsBM3AC5EH14I7cr21ogITRkbXVyilA0rM
         Bf4hZBexHKndiGMD2l4WUbiXfi1ZDzQTTr1GCVOKH+lYGtnBlst9fD1x+9MdAIHBDsEx
         CRZ6ynkl9X5U5WkapcN0KX+LnIEOUN5huOjYboRLScKFNRGEPKE0gHJr/NAxC3FK4mt9
         tD0GgZf9b4H+JFYuCveMYpFn4hqm03H7KYFDELWiB3UgtWEJ+lij4XUB57TyEp33dWMv
         xJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758656896; x=1759261696;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OA3fe0tMFFuwr3+Qmcu6Uj0NBN2se/UNWBuMaKtHISA=;
        b=J/lWnSUS5YTdq/Fk0b9W3BvAVjn8ec6gw2GBc0lmV6RRiWopilcy+CPbsgjP3BsMhi
         tJSEwZ/LmHVAUSr2JWYgjCo/vOY4eY/mtTphsT2j07b9s+5Up99wtAW5dsRJgqs5s1fO
         2NxYRBt89jhPVTV5d8gR3M0Mw1DQUaqoGRRu9C5CQkP60Ot7awTUNPn8PqurHdnQlK/9
         m7I4/j6YP8fGqsn6QJW4BAWjbi9CUl1kfIpTFcRGow1zajO2VHJqIrkNO5lyPA3h3SAJ
         BO33wl8wbin931K+dMp8APTksfNB4IegpLbCde+m4p5a5IeIzZ3rfjqgtJuz/XltoAR4
         skHA==
X-Forwarded-Encrypted: i=1; AJvYcCU8wQEB5nG3ATcUMD8yF/vvSidXnMm2sIjp0mD1aG+hSm8yVDyFGOEb5WhKzrzbALXc1Kb8a4oTDbaD4Cg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyaef7O1AwqFz3m3fU6MMOxVcTudIyiUCmUh6yYKpkrpA8t7Jwo
	uUkWJswq2w6h/zM+vncv7/WUuZ4AUmk1tCWSaLPboa8D0YqjSH6S+e4ciCUHOj5uCoQ+s//PFl3
	McNe3M5IUPw3b8Nft5xxDqZp5q4CKm0Q=
X-Gm-Gg: ASbGncu7WOJNXkwldpxSNat9TGmdq4kSj8hMRjIiCZIKJaqPUK4mjQvk4Dq9kY+9XsZ
	nWLhCqY/QKU8S7J6TZIlDWy8Mk3OzdUIVsLMQgEfNvqdTz5xKVEuZh6GL7NpT+0yWg0u2pzRZlL
	EEUEHtdKxcEx84XvnQrgo/DE8F2JwInw9oUg61/TPkdxVihZo9bw3Ii4osjpeD+vi2us7Qyp8y2
	odWk3Hu7+2szOF0CXdskDhdUFJz2mFbUK53
X-Google-Smtp-Source: AGHT+IGXpDwIXvUmKbTj6KYt9BHVpiL2T/JZJz8wEYNjlaaJjNd/WYGz5fJ6T7BjSyM7jy3aFCx9kU1t+2tr3dQ1DSI=
X-Received: by 2002:a17:906:cecb:b0:b31:e28b:6d61 with SMTP id
 a640c23a62f3a-b31e28b709fmr97695266b.34.1758656895628; Tue, 23 Sep 2025
 12:48:15 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Received: by 2002:a17:906:3e87:b0:b00:9af2:a2ae with HTTP; Tue, 23 Sep 2025
 12:48:14 -0700 (PDT)
In-Reply-To: <ffbf1a04-047d-4787-ac1e-f5362e1ca600@csgroup.eu>
References: <20250913003842.41944-1-safinaskar@gmail.com> <ffbf1a04-047d-4787-ac1e-f5362e1ca600@csgroup.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 23 Sep 2025 22:48:14 +0300
X-Gm-Features: AS18NWDAI0j4Wgt8NdpGV5uMp6Pmkcw2h5dS7BiYZB0E65EEBhC1KkOwRgQ_lbE
Message-ID: <CAHp75VccQRq2gZWfn-Jf+ZKnZiEDofE=z8LOwrhKeadsUqFrzw@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Askar Safin <safinaskar@gmail.com>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Aleksa Sarai <cyphar@cyphar.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, 
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
	"linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, 
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, 
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, 
	"linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"initramfs@vger.kernel.org" <initramfs@vger.kernel.org>, 
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, 
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>, "Theodore Y . Ts'o" <tytso@mit.edu>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Kees Cook <kees@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Heiko Carstens <hca@linux.ibm.com>, "patches@lists.linux.dev" <patches@lists.linux.dev>
Content-Type: multipart/alternative; boundary="0000000000008bbd6b063f7d3734"
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,HTML_MESSAGE,
	HTML_OBFUSCATE_20_30,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [andy.shevchenko(at)gmail.com]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [2a00:1450:4864:20:0:0:0:534 listed in]
	[list.dnswl.org]
	*  2.4 HTML_OBFUSCATE_20_30 BODY: Message is 20% to 30% HTML obfuscation
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  1.0 FREEMAIL_REPLY From and body contain different freemails
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000008bbd6b063f7d3734
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E2=80=9Dcpio=E2=80=9D archive is initramfs and not initrd, isn=E2=80=99t i=
t ?

=D0=B2=D1=96=D0=B2=D1=82=D0=BE=D1=80=D0=BE=D0=BA, 23 =D0=B2=D0=B5=D1=80=D0=
=B5=D1=81=D0=BD=D1=8F 2025=E2=80=AF=D1=80. Christophe Leroy <christophe.ler=
oy@csgroup.eu>
=D0=BF=D0=B8=D1=88=D0=B5:

>
>
> Le 13/09/2025 =C3=A0 02:37, Askar Safin a =C3=A9crit :
>
>> [Vous ne recevez pas souvent de courriers de safinaskar@gmail.com.
>> D=C3=A9couvrez pourquoi ceci est important =C3=A0 https://aka.ms/LearnAb=
outSende
>> rIdentification ]
>>
>> Intro
>> =3D=3D=3D=3D
>> This patchset removes classic initrd (initial RAM disk) support,
>> which was deprecated in 2020.
>> Initramfs still stays, and RAM disk itself (brd) still stays, too.
>> init/do_mounts* and init/*initramfs* are listed in VFS entry in
>> MAINTAINERS, so I think this patchset should go through VFS tree.
>> This patchset touchs every subdirectory in arch/, so I tested it
>> on 8 (!!!) archs in Qemu (see details below).
>> Warning: this patchset renames CONFIG_BLK_DEV_INITRD (!!!) to
>> CONFIG_INITRAMFS
>> and CONFIG_RD_* to CONFIG_INITRAMFS_DECOMPRESS_* (for example,
>> CONFIG_RD_GZIP to CONFIG_INITRAMFS_DECOMPRESS_GZIP).
>> If you still use initrd, see below for workaround.
>>
>
> Apologise if my question looks stupid, but I'm using QEMU for various
> tests, and the way QEMU is started is something like:
>
> qemu-system-ppc -kernel ./vmlinux -cpu g4 -M mac99 -initrd
> ./qemu/rootfs.cpio.gz
>
> I was therefore expecting (and fearing) it to fail with your series
> applied, but surprisingly it still works.
>
> Therefore is it really initrd you are removing or just some corner case ?
> If it is really initrd, then how does QEMU still work with that -initrd
> parameter ?
>
> Thanks
> Christophe
>
>
>> Details
>> =3D=3D=3D=3D
>> I not only removed initrd, I also removed a lot of code, which
>> became dead, including a lot of code in arch/.
>>
>> Still I think the only two architectures I touched in non-trivial
>> way are sh and 32-bit arm.
>>
>> Also I renamed some files, functions and variables (which became
>> misnomers) to proper names,
>> moved some code around, removed a lot of mentions of initrd
>> in code and comments. Also I cleaned up some docs.
>>
>> For example, I renamed the following global variables:
>>
>> __initramfs_start
>> __initramfs_size
>> phys_initrd_start
>> phys_initrd_size
>> initrd_start
>> initrd_end
>>
>> to:
>>
>> __builtin_initramfs_start
>> __builtin_initramfs_size
>> phys_external_initramfs_start
>> phys_external_initramfs_size
>> virt_external_initramfs_start
>> virt_external_initramfs_end
>>
>> New names precisely capture meaning of these variables.
>>
>> Also I renamed CONFIG_BLK_DEV_INITRD (which became total misnomer)
>> to CONFIG_INITRAMFS. And CONFIG_RD_* to CONFIG_INITRAMFS_DECOMPRESS_*.
>> This will break all configs out there (update your configs!).
>> Still I think this is okay,
>> because config names never were part of stable API.
>> Still, I don't have strong opinion here, so I can drop these renamings
>> if needed.
>>
>> Other user-visible changes:
>>
>> - Removed kernel command line parameters "load_ramdisk" and
>> "prompt_ramdisk", which did nothing and were deprecated
>> - Removed kernel command line parameter "ramdisk_start",
>> which was used for initrd only (not for initramfs)
>> - Removed kernel command line parameter "noinitrd",
>> which was inconsistent: it controlled initrd only
>> (not initramfs), except for EFI boot, where it
>> controlled both initramfs and initrd. EFI users
>> still can disable initramfs simply by not passing it
>> - Removed kernel command line parameter "ramdisk_size",
>> which used for controlling ramdisk (brd), but only
>> in non-modular mode. Use brd.rd_size instead, it
>> always works
>> - Removed /proc/sys/kernel/real-root-dev . It was used
>> for initrd only
>>
>> This patchset is based on v6.17-rc5.
>>
>> Testing
>> =3D=3D=3D=3D
>> I tested my patchset on many architectures in Qemu using my Rust
>> program, heavily based on mkroot [1].
>>
>> I used the following cross-compilers:
>>
>> aarch64-linux-musleabi
>> armv4l-linux-musleabihf
>> armv5l-linux-musleabihf
>> armv7l-linux-musleabihf
>> i486-linux-musl
>> i686-linux-musl
>> mips-linux-musl
>> mips64-linux-musl
>> mipsel-linux-musl
>> powerpc-linux-musl
>> powerpc64-linux-musl
>> powerpc64le-linux-musl
>> riscv32-linux-musl
>> riscv64-linux-musl
>> s390x-linux-musl
>> sh4-linux-musl
>> sh4eb-linux-musl
>> x86_64-linux-musl
>>
>> taken from this directory [2].
>>
>> So, as you can see, there are 18 triplets, which correspond to 8 subdirs
>> in arch/.
>>
>> And note that this list contains two archs (arm and sh) touched in
>> non-trivial way.
>>
>> For every triplet I tested that:
>> - Initramfs still works (both builtin and external)
>> - Direct boot from disk still works
>>
>> Workaround
>> =3D=3D=3D=3D
>> If "retain_initrd" is passed to kernel, then initramfs/initrd,
>> passed by bootloader, is retained and becomes available after boot
>> as read-only magic file /sys/firmware/initrd [3].
>>
>> No copies are involved. I. e. /sys/firmware/initrd is simply
>> a reference to original blob passed by bootloader.
>>
>> This works even if initrd/initramfs is not recognized by kernel
>> in any way, i. e. even if it is not valid cpio archive, nor
>> a fs image supported by classic initrd.
>>
>> This works both with my patchset and without it.
>>
>> This means that you can emulate classic initrd so:
>> link builtin initramfs to kernel. In /init in this initramfs
>> copy /sys/firmware/initrd to some file in / and loop-mount it.
>>
>> This is even better than classic initrd, because:
>> - You can use fs not supported by classic initrd, for example erofs
>> - One copy is involved (from /sys/firmware/initrd to some file in /)
>> as opposed to two when using classic initrd
>>
>> Still, I don't recommend using this workaround, because
>> I want everyone to migrate to proper modern initramfs.
>> But still you can use this workaround if you want.
>>
>> Also: it is not possible to directly loop-mount
>> /sys/firmware/initrd . Theoretically kernel can be changed
>> to allow this (and/or to make it writable), but I think nobody needs thi=
s.
>> And I don't want to implement this.
>>
>> P. S. When I sent this patchset first time, zoho mail banned me for
>> too much email. So I resend this using gmail. The only change is
>> email change, there are no other changes
>>
>> [1] https://github.com/landley/toybox/tree/master/mkroot
>> [2] https://landley.net/toybox/downloads/binaries/toolchains/latest
>> [3] https://lore.kernel.org/all/20231207235654.16622-1-graf@amazon.com/
>>
>> Askar Safin (62):
>>    init: remove deprecated "load_ramdisk" command line parameter, which
>>      does nothing
>>    init: remove deprecated "prompt_ramdisk" command line parameter, whic=
h
>>      does nothing
>>    init: sh, sparc, x86: remove unused constants RAMDISK_PROMPT_FLAG and
>>      RAMDISK_LOAD_FLAG
>>    init: x86, arm, sh, sparc: remove variable rd_image_start, which
>>      controls starting block number of initrd
>>    init: remove "ramdisk_start" command line parameter, which controls
>>      starting block number of initrd
>>    arm: init: remove special logic for setting brd.rd_size
>>    arm: init: remove ATAG_RAMDISK
>>    arm: init: remove FLAG_RDLOAD and FLAG_RDPROMPT
>>    arm: init: document rd_start (in param_struct) as obsolete
>>    initrd: remove initrd (initial RAM disk) support
>>    init, efi: remove "noinitrd" command line parameter
>>    init: remove /proc/sys/kernel/real-root-dev
>>    ext2: remove ext2_image_size and associated code
>>    init: m68k, mips, powerpc, s390, sh: remove Root_RAM0
>>    doc: modernize Documentation/admin-guide/blockdev/ramdisk.rst
>>    brd: remove "ramdisk_size" command line parameter
>>    doc: modernize Documentation/filesystems/ramfs-rootfs-initramfs.rst
>>    doc: modernize
>>      Documentation/driver-api/early-userspace/early_userspace_support.rs=
t
>>    init: remove mentions of "ramdisk=3D" command line parameter
>>    doc: remove Documentation/power/swsusp-dmcrypt.rst
>>    init: remove all mentions of root=3D/dev/ram*
>>    doc: remove obsolete mentions of pivot_root
>>    init: rename __initramfs_{start,size} to
>>      __builtin_initramfs_{start,size}
>>    init: remove wrong comment
>>    init: rename phys_initrd_{start,size} to
>>      phys_external_initramfs_{start,size}
>>    init: move phys_external_initramfs_{start,size} to init/initramfs.c
>>    init: alpha: remove "extern unsigned long initrd_start, initrd_end"
>>    init: alpha, arc, arm, arm64, csky, m68k, microblaze, mips, nios2,
>>      openrisc, parisc, powerpc, s390, sh, sparc, um, x86, xtensa: rename
>>      initrd_{start,end} to virt_external_initramfs_{start,end}
>>    init: move virt_external_initramfs_{start,end} to init/initramfs.c
>>    doc: remove documentation for block device 4 0
>>    init: rename initrd_below_start_ok to initramfs_below_start_ok
>>    init: move initramfs_below_start_ok to init/initramfs.c
>>    init: remove init/do_mounts_initrd.c
>>    init: inline create_dev into the only caller
>>    init: make mount_root_generic static
>>    init: make mount_root static
>>    init: remove root_mountflags from init/do_mounts.h
>>    init: remove most headers from init/do_mounts.h
>>    init: make console_on_rootfs static
>>    init: rename free_initrd_mem to free_initramfs_mem
>>    init: rename reserve_initrd_mem to reserve_initramfs_mem
>>    init: rename <linux/initrd.h> to <linux/initramfs.h>
>>    setsid: inline ksys_setsid into the only caller
>>    doc: kernel-parameters: remove [RAM] from reserve_mem=3D
>>    doc: kernel-parameters: replace [RAM] with [INITRAMFS]
>>    init: edit docs for initramfs-related configs
>>    init: fix typo: virtul =3D> virtual
>>    init: fix comment
>>    init: rename ramdisk_execute_command to initramfs_execute_command
>>    init: rename ramdisk_command_access to initramfs_command_access
>>    init: rename get_boot_config_from_initrd to
>>      get_boot_config_from_initramfs
>>    init: rename do_retain_initrd to retain_initramfs
>>    init: rename kexec_free_initrd to kexec_free_initramfs
>>    init: arm, x86: deal with some references to initrd
>>    init: rename CONFIG_BLK_DEV_INITRD to CONFIG_INITRAMFS
>>    init: rename CONFIG_RD_GZIP to CONFIG_INITRAMFS_DECOMPRESS_GZIP
>>    init: rename CONFIG_RD_BZIP2 to CONFIG_INITRAMFS_DECOMPRESS_BZIP2
>>    init: rename CONFIG_RD_LZMA to CONFIG_INITRAMFS_DECOMPRESS_LZMA
>>    init: rename CONFIG_RD_XZ to CONFIG_INITRAMFS_DECOMPRESS_XZ
>>    init: rename CONFIG_RD_LZO to CONFIG_INITRAMFS_DECOMPRESS_LZO
>>    init: rename CONFIG_RD_LZ4 to CONFIG_INITRAMFS_DECOMPRESS_LZ4
>>    init: rename CONFIG_RD_ZSTD to CONFIG_INITRAMFS_DECOMPRESS_ZSTD
>>
>>   .../admin-guide/blockdev/ramdisk.rst          | 104 +----
>>   .../admin-guide/device-mapper/dm-init.rst     |   4 +-
>>   Documentation/admin-guide/devices.txt         |  12 -
>>   Documentation/admin-guide/index.rst           |   1 -
>>   Documentation/admin-guide/initrd.rst          | 383 ------------------
>>   .../admin-guide/kernel-parameters.rst         |   4 +-
>>   .../admin-guide/kernel-parameters.txt         |  38 +-
>>   Documentation/admin-guide/nfs/nfsroot.rst     |   4 +-
>>   Documentation/admin-guide/sysctl/kernel.rst   |   6 -
>>   Documentation/arch/arm/ixp4xx.rst             |   4 +-
>>   Documentation/arch/arm/setup.rst              |   6 +-
>>   Documentation/arch/m68k/kernel-options.rst    |  29 +-
>>   Documentation/arch/x86/boot.rst               |   4 +-
>>   .../early_userspace_support.rst               |  18 +-
>>   .../filesystems/ramfs-rootfs-initramfs.rst    |  20 +-
>>   Documentation/power/index.rst                 |   1 -
>>   Documentation/power/swsusp-dmcrypt.rst        | 140 -------
>>   Documentation/security/ipe.rst                |   2 +-
>>   .../translations/zh_CN/power/index.rst        |   1 -
>>   arch/alpha/kernel/core_irongate.c             |  12 +-
>>   arch/alpha/kernel/proto.h                     |   2 +-
>>   arch/alpha/kernel/setup.c                     |  32 +-
>>   arch/arc/configs/axs101_defconfig             |   2 +-
>>   arch/arc/configs/axs103_defconfig             |   2 +-
>>   arch/arc/configs/axs103_smp_defconfig         |   2 +-
>>   arch/arc/configs/haps_hs_defconfig            |   2 +-
>>   arch/arc/configs/haps_hs_smp_defconfig        |   2 +-
>>   arch/arc/configs/hsdk_defconfig               |   2 +-
>>   arch/arc/configs/nsim_700_defconfig           |   2 +-
>>   arch/arc/configs/nsimosci_defconfig           |   2 +-
>>   arch/arc/configs/nsimosci_hs_defconfig        |   2 +-
>>   arch/arc/configs/nsimosci_hs_smp_defconfig    |   2 +-
>>   arch/arc/configs/tb10x_defconfig              |   4 +-
>>   arch/arc/configs/vdk_hs38_defconfig           |   2 +-
>>   arch/arc/configs/vdk_hs38_smp_defconfig       |   2 +-
>>   arch/arc/mm/init.c                            |  14 +-
>>   arch/arm/Kconfig                              |   2 +-
>>   arch/arm/boot/dts/arm/integratorap.dts        |   2 +-
>>   arch/arm/boot/dts/arm/integratorcp.dts        |   2 +-
>>   .../dts/aspeed/aspeed-bmc-facebook-cmm.dts    |   2 +-
>>   .../aspeed/aspeed-bmc-facebook-galaxy100.dts  |   2 +-
>>   .../aspeed/aspeed-bmc-facebook-minipack.dts   |   2 +-
>>   .../aspeed/aspeed-bmc-facebook-wedge100.dts   |   2 +-
>>   .../aspeed/aspeed-bmc-facebook-wedge40.dts    |   2 +-
>>   .../dts/aspeed/aspeed-bmc-facebook-yamp.dts   |   2 +-
>>   .../ast2600-facebook-netbmc-common.dtsi       |   2 +-
>>   arch/arm/boot/dts/hisilicon/hi3620-hi4511.dts |   2 +-
>>   .../ixp/intel-ixp42x-welltech-epbx100.dts     |   2 +-
>>   arch/arm/boot/dts/nspire/nspire-classic.dtsi  |   2 +-
>>   arch/arm/boot/dts/nspire/nspire-cx.dts        |   2 +-
>>   .../boot/dts/samsung/exynos4210-origen.dts    |   2 +-
>>   .../boot/dts/samsung/exynos4210-smdkv310.dts  |   2 +-
>>   .../boot/dts/samsung/exynos4412-smdk4412.dts  |   2 +-
>>   .../boot/dts/samsung/exynos5250-smdk5250.dts  |   2 +-
>>   arch/arm/boot/dts/st/ste-nomadik-nhk15.dts    |   2 +-
>>   arch/arm/boot/dts/st/ste-nomadik-s8815.dts    |   2 +-
>>   arch/arm/boot/dts/st/stm32429i-eval.dts       |   2 +-
>>   arch/arm/boot/dts/st/stm32746g-eval.dts       |   2 +-
>>   arch/arm/boot/dts/st/stm32f429-disco.dts      |   2 +-
>>   arch/arm/boot/dts/st/stm32f469-disco.dts      |   2 +-
>>   arch/arm/boot/dts/st/stm32f746-disco.dts      |   2 +-
>>   arch/arm/boot/dts/st/stm32f769-disco.dts      |   2 +-
>>   arch/arm/boot/dts/st/stm32h743i-disco.dts     |   2 +-
>>   arch/arm/boot/dts/st/stm32h743i-eval.dts      |   2 +-
>>   arch/arm/boot/dts/st/stm32h747i-disco.dts     |   2 +-
>>   arch/arm/boot/dts/st/stm32h750i-art-pi.dts    |   2 +-
>>   arch/arm/configs/aspeed_g4_defconfig          |   8 +-
>>   arch/arm/configs/aspeed_g5_defconfig          |   8 +-
>>   arch/arm/configs/assabet_defconfig            |   4 +-
>>   arch/arm/configs/at91_dt_defconfig            |   4 +-
>>   arch/arm/configs/axm55xx_defconfig            |   2 +-
>>   arch/arm/configs/bcm2835_defconfig            |   2 +-
>>   arch/arm/configs/clps711x_defconfig           |   4 +-
>>   arch/arm/configs/collie_defconfig             |   4 +-
>>   arch/arm/configs/davinci_all_defconfig        |   2 +-
>>   arch/arm/configs/exynos_defconfig             |   4 +-
>>   arch/arm/configs/footbridge_defconfig         |   2 +-
>>   arch/arm/configs/gemini_defconfig             |   2 +-
>>   arch/arm/configs/h3600_defconfig              |   2 +-
>>   arch/arm/configs/hisi_defconfig               |   4 +-
>>   arch/arm/configs/imx_v4_v5_defconfig          |   2 +-
>>   arch/arm/configs/imx_v6_v7_defconfig          |   4 +-
>>   arch/arm/configs/integrator_defconfig         |   2 +-
>>   arch/arm/configs/ixp4xx_defconfig             |   2 +-
>>   arch/arm/configs/keystone_defconfig           |   2 +-
>>   arch/arm/configs/lpc18xx_defconfig            |  12 +-
>>   arch/arm/configs/lpc32xx_defconfig            |   4 +-
>>   arch/arm/configs/milbeaut_m10v_defconfig      |   2 +-
>>   arch/arm/configs/multi_v4t_defconfig          |   2 +-
>>   arch/arm/configs/multi_v5_defconfig           |   2 +-
>>   arch/arm/configs/multi_v7_defconfig           |   2 +-
>>   arch/arm/configs/mvebu_v7_defconfig           |   2 +-
>>   arch/arm/configs/mxs_defconfig                |   2 +-
>>   arch/arm/configs/neponset_defconfig           |   4 +-
>>   arch/arm/configs/nhk8815_defconfig            |   2 +-
>>   arch/arm/configs/omap1_defconfig              |   2 +-
>>   arch/arm/configs/omap2plus_defconfig          |   2 +-
>>   arch/arm/configs/pxa910_defconfig             |   2 +-
>>   arch/arm/configs/pxa_defconfig                |   4 +-
>>   arch/arm/configs/qcom_defconfig               |   2 +-
>>   arch/arm/configs/rpc_defconfig                |   2 +-
>>   arch/arm/configs/s3c6400_defconfig            |   4 +-
>>   arch/arm/configs/s5pv210_defconfig            |   4 +-
>>   arch/arm/configs/sama5_defconfig              |   4 +-
>>   arch/arm/configs/sama7_defconfig              |   2 +-
>>   arch/arm/configs/shmobile_defconfig           |   2 +-
>>   arch/arm/configs/socfpga_defconfig            |   2 +-
>>   arch/arm/configs/sp7021_defconfig             |  12 +-
>>   arch/arm/configs/spear13xx_defconfig          |   2 +-
>>   arch/arm/configs/spear3xx_defconfig           |   2 +-
>>   arch/arm/configs/spear6xx_defconfig           |   2 +-
>>   arch/arm/configs/spitz_defconfig              |   2 +-
>>   arch/arm/configs/stm32_defconfig              |   2 +-
>>   arch/arm/configs/sunxi_defconfig              |   2 +-
>>   arch/arm/configs/tegra_defconfig              |   2 +-
>>   arch/arm/configs/u8500_defconfig              |   4 +-
>>   arch/arm/configs/versatile_defconfig          |   2 +-
>>   arch/arm/configs/vexpress_defconfig           |   2 +-
>>   arch/arm/configs/vf610m4_defconfig            |  10 +-
>>   arch/arm/configs/vt8500_v6_v7_defconfig       |   2 +-
>>   arch/arm/configs/wpcm450_defconfig            |   2 +-
>>   arch/arm/include/uapi/asm/setup.h             |  10 -
>>   arch/arm/kernel/atags_compat.c                |  10 -
>>   arch/arm/kernel/atags_parse.c                 |  16 +-
>>   arch/arm/kernel/setup.c                       |   2 +-
>>   arch/arm/mm/init.c                            |  24 +-
>>   arch/arm64/configs/defconfig                  |   2 +-
>>   arch/arm64/kernel/setup.c                     |   2 +-
>>   arch/arm64/mm/init.c                          |  17 +-
>>   arch/csky/kernel/setup.c                      |  24 +-
>>   arch/csky/mm/init.c                           |   2 +-
>>   arch/hexagon/configs/comet_defconfig          |   2 +-
>>   arch/loongarch/configs/loongson3_defconfig    |   2 +-
>>   arch/loongarch/kernel/mem.c                   |   2 +-
>>   arch/loongarch/kernel/setup.c                 |   4 +-
>>   arch/m68k/configs/amiga_defconfig             |   2 +-
>>   arch/m68k/configs/apollo_defconfig            |   2 +-
>>   arch/m68k/configs/atari_defconfig             |   2 +-
>>   arch/m68k/configs/bvme6000_defconfig          |   2 +-
>>   arch/m68k/configs/hp300_defconfig             |   2 +-
>>   arch/m68k/configs/mac_defconfig               |   2 +-
>>   arch/m68k/configs/multi_defconfig             |   2 +-
>>   arch/m68k/configs/mvme147_defconfig           |   2 +-
>>   arch/m68k/configs/mvme16x_defconfig           |   2 +-
>>   arch/m68k/configs/q40_defconfig               |   2 +-
>>   arch/m68k/configs/stmark2_defconfig           |   2 +-
>>   arch/m68k/configs/sun3_defconfig              |   2 +-
>>   arch/m68k/configs/sun3x_defconfig             |   2 +-
>>   arch/m68k/kernel/setup_mm.c                   |  12 +-
>>   arch/m68k/kernel/setup_no.c                   |  12 +-
>>   arch/m68k/kernel/uboot.c                      |  17 +-
>>   arch/microblaze/kernel/cpu/mb.c               |   2 +-
>>   arch/microblaze/kernel/setup.c                |   2 +-
>>   arch/microblaze/mm/init.c                     |  12 +-
>>   arch/mips/ath79/prom.c                        |  12 +-
>>   arch/mips/configs/ath25_defconfig             |  12 +-
>>   arch/mips/configs/ath79_defconfig             |   4 +-
>>   arch/mips/configs/bcm47xx_defconfig           |   2 +-
>>   arch/mips/configs/bigsur_defconfig            |   2 +-
>>   arch/mips/configs/bmips_be_defconfig          |   2 +-
>>   arch/mips/configs/bmips_stb_defconfig         |  14 +-
>>   arch/mips/configs/cavium_octeon_defconfig     |   2 +-
>>   arch/mips/configs/eyeq5_defconfig             |   2 +-
>>   arch/mips/configs/eyeq6_defconfig             |   2 +-
>>   arch/mips/configs/generic_defconfig           |   2 +-
>>   arch/mips/configs/gpr_defconfig               |   2 +-
>>   arch/mips/configs/lemote2f_defconfig          |   2 +-
>>   arch/mips/configs/loongson2k_defconfig        |   2 +-
>>   arch/mips/configs/loongson3_defconfig         |   2 +-
>>   arch/mips/configs/malta_defconfig             |   2 +-
>>   arch/mips/configs/mtx1_defconfig              |   2 +-
>>   arch/mips/configs/rb532_defconfig             |   2 +-
>>   arch/mips/configs/rbtx49xx_defconfig          |   2 +-
>>   arch/mips/configs/rt305x_defconfig            |   4 +-
>>   arch/mips/configs/sb1250_swarm_defconfig      |   2 +-
>>   arch/mips/configs/xway_defconfig              |   4 +-
>>   arch/mips/kernel/setup.c                      |  53 ++-
>>   arch/mips/mm/init.c                           |   2 +-
>>   arch/mips/sibyte/common/cfe.c                 |  36 +-
>>   arch/mips/sibyte/swarm/setup.c                |   2 +-
>>   arch/nios2/kernel/setup.c                     |  20 +-
>>   arch/openrisc/configs/or1klitex_defconfig     |   2 +-
>>   arch/openrisc/configs/or1ksim_defconfig       |   4 +-
>>   arch/openrisc/configs/simple_smp_defconfig    |  14 +-
>>   arch/openrisc/configs/virt_defconfig          |   2 +-
>>   arch/openrisc/kernel/setup.c                  |  24 +-
>>   arch/openrisc/kernel/vmlinux.h                |   2 +-
>>   arch/parisc/boot/compressed/misc.c            |   2 +-
>>   arch/parisc/configs/generic-32bit_defconfig   |   2 +-
>>   arch/parisc/configs/generic-64bit_defconfig   |   2 +-
>>   arch/parisc/defpalo.conf                      |   2 +-
>>   arch/parisc/kernel/pdt.c                      |   6 +-
>>   arch/parisc/kernel/setup.c                    |   8 +-
>>   arch/parisc/mm/init.c                         |  32 +-
>>   arch/powerpc/configs/44x/akebono_defconfig    |   2 +-
>>   arch/powerpc/configs/44x/arches_defconfig     |   2 +-
>>   arch/powerpc/configs/44x/bamboo_defconfig     |   2 +-
>>   arch/powerpc/configs/44x/bluestone_defconfig  |   2 +-
>>   .../powerpc/configs/44x/canyonlands_defconfig |   2 +-
>>   arch/powerpc/configs/44x/ebony_defconfig      |   2 +-
>>   arch/powerpc/configs/44x/eiger_defconfig      |   2 +-
>>   arch/powerpc/configs/44x/fsp2_defconfig       |  10 +-
>>   arch/powerpc/configs/44x/icon_defconfig       |   2 +-
>>   arch/powerpc/configs/44x/iss476-smp_defconfig |   2 +-
>>   arch/powerpc/configs/44x/katmai_defconfig     |   2 +-
>>   arch/powerpc/configs/44x/rainier_defconfig    |   2 +-
>>   arch/powerpc/configs/44x/redwood_defconfig    |   2 +-
>>   arch/powerpc/configs/44x/sam440ep_defconfig   |   2 +-
>>   arch/powerpc/configs/44x/sequoia_defconfig    |   2 +-
>>   arch/powerpc/configs/44x/taishan_defconfig    |   2 +-
>>   arch/powerpc/configs/44x/warp_defconfig       |   2 +-
>>   arch/powerpc/configs/52xx/cm5200_defconfig    |   2 +-
>>   arch/powerpc/configs/52xx/lite5200b_defconfig |   2 +-
>>   arch/powerpc/configs/52xx/motionpro_defconfig |   2 +-
>>   arch/powerpc/configs/52xx/tqm5200_defconfig   |   2 +-
>>   arch/powerpc/configs/83xx/asp8347_defconfig   |   2 +-
>>   .../configs/83xx/mpc8313_rdb_defconfig        |   2 +-
>>   .../configs/83xx/mpc8315_rdb_defconfig        |   2 +-
>>   .../configs/83xx/mpc832x_rdb_defconfig        |   2 +-
>>   .../configs/83xx/mpc834x_itx_defconfig        |   2 +-
>>   .../configs/83xx/mpc834x_itxgp_defconfig      |   2 +-
>>   .../configs/83xx/mpc836x_rdk_defconfig        |   2 +-
>>   .../configs/83xx/mpc837x_rdb_defconfig        |   2 +-
>>   arch/powerpc/configs/85xx/ge_imp3a_defconfig  |   2 +-
>>   arch/powerpc/configs/85xx/ksi8560_defconfig   |   2 +-
>>   arch/powerpc/configs/85xx/socrates_defconfig  |   2 +-
>>   arch/powerpc/configs/85xx/stx_gp3_defconfig   |   2 +-
>>   arch/powerpc/configs/85xx/tqm8540_defconfig   |   2 +-
>>   arch/powerpc/configs/85xx/tqm8541_defconfig   |   2 +-
>>   arch/powerpc/configs/85xx/tqm8548_defconfig   |   2 +-
>>   arch/powerpc/configs/85xx/tqm8555_defconfig   |   2 +-
>>   arch/powerpc/configs/85xx/tqm8560_defconfig   |   2 +-
>>   .../configs/85xx/xes_mpc85xx_defconfig        |   2 +-
>>   arch/powerpc/configs/amigaone_defconfig       |   2 +-
>>   arch/powerpc/configs/cell_defconfig           |   2 +-
>>   arch/powerpc/configs/chrp32_defconfig         |   2 +-
>>   arch/powerpc/configs/fsl-emb-nonhw.config     |   2 +-
>>   arch/powerpc/configs/g5_defconfig             |   2 +-
>>   arch/powerpc/configs/gamecube_defconfig       |   2 +-
>>   arch/powerpc/configs/holly_defconfig          |   2 +-
>>   arch/powerpc/configs/linkstation_defconfig    |   2 +-
>>   arch/powerpc/configs/mgcoge_defconfig         |   4 +-
>>   arch/powerpc/configs/microwatt_defconfig      |   2 +-
>>   arch/powerpc/configs/mpc512x_defconfig        |   2 +-
>>   arch/powerpc/configs/mpc5200_defconfig        |   2 +-
>>   arch/powerpc/configs/mpc83xx_defconfig        |   2 +-
>>   arch/powerpc/configs/pasemi_defconfig         |   2 +-
>>   arch/powerpc/configs/pmac32_defconfig         |   2 +-
>>   arch/powerpc/configs/powernv_defconfig        |   2 +-
>>   arch/powerpc/configs/ppc44x_defconfig         |   2 +-
>>   arch/powerpc/configs/ppc64_defconfig          |   2 +-
>>   arch/powerpc/configs/ppc64e_defconfig         |   2 +-
>>   arch/powerpc/configs/ppc6xx_defconfig         |   2 +-
>>   arch/powerpc/configs/ps3_defconfig            |   2 +-
>>   arch/powerpc/configs/skiroot_defconfig        |  12 +-
>>   arch/powerpc/configs/wii_defconfig            |   2 +-
>>   arch/powerpc/kernel/prom.c                    |  22 +-
>>   arch/powerpc/kernel/prom_init.c               |   6 +-
>>   arch/powerpc/kernel/setup-common.c            |  25 +-
>>   arch/powerpc/kernel/setup_32.c                |   2 +-
>>   arch/powerpc/kernel/setup_64.c                |   2 +-
>>   arch/powerpc/mm/init_32.c                     |   2 +-
>>   arch/powerpc/platforms/52xx/lite5200.c        |   2 +-
>>   arch/powerpc/platforms/83xx/km83xx.c          |   2 +-
>>   arch/powerpc/platforms/85xx/mpc85xx_mds.c     |   2 +-
>>   arch/powerpc/platforms/chrp/setup.c           |   2 +-
>>   .../platforms/embedded6xx/linkstation.c       |   2 +-
>>   .../platforms/embedded6xx/storcenter.c        |   2 +-
>>   arch/powerpc/platforms/powermac/setup.c       |   8 +-
>>   arch/riscv/configs/defconfig                  |   2 +-
>>   arch/riscv/configs/nommu_k210_defconfig       |  16 +-
>>   arch/riscv/configs/nommu_virt_defconfig       |  12 +-
>>   arch/riscv/mm/init.c                          |   4 +-
>>   arch/s390/boot/ipl_parm.c                     |   2 +-
>>   arch/s390/boot/startup.c                      |   4 +-
>>   arch/s390/configs/zfcpdump_defconfig          |   2 +-
>>   arch/s390/kernel/setup.c                      |  10 +-
>>   arch/s390/mm/init.c                           |   2 +-
>>   arch/sh/configs/apsh4a3a_defconfig            |   2 +-
>>   arch/sh/configs/apsh4ad0a_defconfig           |   2 +-
>>   arch/sh/configs/ecovec24-romimage_defconfig   |   2 +-
>>   arch/sh/configs/edosk7760_defconfig           |   2 +-
>>   arch/sh/configs/kfr2r09-romimage_defconfig    |   2 +-
>>   arch/sh/configs/kfr2r09_defconfig             |   2 +-
>>   arch/sh/configs/magicpanelr2_defconfig        |   2 +-
>>   arch/sh/configs/migor_defconfig               |   2 +-
>>   arch/sh/configs/rsk7201_defconfig             |   2 +-
>>   arch/sh/configs/rsk7203_defconfig             |   2 +-
>>   arch/sh/configs/sdk7786_defconfig             |   8 +-
>>   arch/sh/configs/se7206_defconfig              |   2 +-
>>   arch/sh/configs/se7705_defconfig              |   2 +-
>>   arch/sh/configs/se7722_defconfig              |   2 +-
>>   arch/sh/configs/se7751_defconfig              |   2 +-
>>   arch/sh/configs/secureedge5410_defconfig      |   2 +-
>>   arch/sh/configs/sh03_defconfig                |   2 +-
>>   arch/sh/configs/sh7757lcr_defconfig           |   2 +-
>>   arch/sh/configs/titan_defconfig               |   2 +-
>>   arch/sh/configs/ul2_defconfig                 |   2 +-
>>   arch/sh/configs/urquell_defconfig             |   2 +-
>>   arch/sh/include/asm/setup.h                   |   1 -
>>   arch/sh/kernel/head_32.S                      |   2 +-
>>   arch/sh/kernel/setup.c                        |  27 +-
>>   arch/sparc/boot/piggyback.c                   |   4 +-
>>   arch/sparc/configs/sparc32_defconfig          |   2 +-
>>   arch/sparc/configs/sparc64_defconfig          |   2 +-
>>   arch/sparc/kernel/head_32.S                   |   4 +-
>>   arch/sparc/kernel/head_64.S                   |   6 +-
>>   arch/sparc/kernel/setup_32.c                  |   9 +-
>>   arch/sparc/kernel/setup_64.c                  |   9 +-
>>   arch/sparc/mm/init_32.c                       |  22 +-
>>   arch/sparc/mm/init_64.c                       |  20 +-
>>   arch/um/kernel/Makefile                       |   2 +-
>>   arch/um/kernel/initrd.c                       |   6 +-
>>   arch/x86/Kconfig                              |   2 +-
>>   arch/x86/boot/header.S                        |   2 +-
>>   arch/x86/boot/startup/sme.c                   |   2 +-
>>   arch/x86/configs/i386_defconfig               |   2 +-
>>   arch/x86/configs/x86_64_defconfig             |   2 +-
>>   arch/x86/include/uapi/asm/bootparam.h         |   7 +-
>>   arch/x86/kernel/cpu/microcode/amd.c           |   2 +-
>>   arch/x86/kernel/cpu/microcode/core.c          |  12 +-
>>   arch/x86/kernel/cpu/microcode/intel.c         |   2 +-
>>   arch/x86/kernel/cpu/microcode/internal.h      |   2 +-
>>   arch/x86/kernel/devicetree.c                  |   2 +-
>>   arch/x86/kernel/setup.c                       |  39 +-
>>   arch/x86/mm/init.c                            |   8 +-
>>   arch/x86/mm/init_32.c                         |   2 +-
>>   arch/x86/mm/init_64.c                         |   2 +-
>>   arch/x86/tools/relocs.c                       |   2 +-
>>   arch/xtensa/Kconfig                           |   2 +-
>>   arch/xtensa/boot/dts/csp.dts                  |   2 +-
>>   arch/xtensa/configs/audio_kc705_defconfig     |   2 +-
>>   arch/xtensa/configs/cadence_csp_defconfig     |  12 +-
>>   arch/xtensa/configs/generic_kc705_defconfig   |   2 +-
>>   arch/xtensa/configs/nommu_kc705_defconfig     |  12 +-
>>   arch/xtensa/configs/smp_lx200_defconfig       |   2 +-
>>   arch/xtensa/configs/virt_defconfig            |   2 +-
>>   arch/xtensa/configs/xip_kc705_defconfig       |   2 +-
>>   arch/xtensa/kernel/setup.c                    |  26 +-
>>   drivers/acpi/Kconfig                          |   2 +-
>>   drivers/acpi/tables.c                         |  10 +-
>>   drivers/base/firmware_loader/main.c           |   2 +-
>>   drivers/block/Kconfig                         |   8 +-
>>   drivers/block/brd.c                           |  20 +-
>>   drivers/firmware/efi/efi.c                    |  10 +-
>>   .../firmware/efi/libstub/efi-stub-helper.c    |   5 +-
>>   drivers/gpu/drm/ci/arm.config                 |   2 +-
>>   drivers/gpu/drm/ci/arm64.config               |   2 +-
>>   drivers/gpu/drm/ci/x86_64.config              |   2 +-
>>   drivers/of/fdt.c                              |  18 +-
>>   fs/ext2/ext2.h                                |   9 -
>>   fs/init.c                                     |  14 -
>>   include/asm-generic/vmlinux.lds.h             |   8 +-
>>   include/linux/ext2_fs.h                       |  13 -
>>   include/linux/init_syscalls.h                 |   1 -
>>   include/linux/initramfs.h                     |  26 ++
>>   include/linux/initrd.h                        |  37 --
>>   include/linux/root_dev.h                      |   1 -
>>   include/linux/syscalls.h                      |   1 -
>>   include/uapi/linux/sysctl.h                   |   1 -
>>   init/.kunitconfig                             |   2 +-
>>   init/Kconfig                                  |  28 +-
>>   init/Makefile                                 |   6 +-
>>   init/do_mounts.c                              |  28 +-
>>   init/do_mounts.h                              |  42 --
>>   init/do_mounts_initrd.c                       | 154 -------
>>   init/do_mounts_rd.c                           | 334 ---------------
>>   init/initramfs.c                              | 152 ++++---
>>   init/main.c                                   |  66 +--
>>   kernel/sys.c                                  |   7 +-
>>   kernel/sysctl.c                               |   2 +-
>>   kernel/umh.c                                  |   2 +-
>>   scripts/package/builddeb                      |   2 +-
>>   .../ktest/examples/bootconfigs/tracing.bconf  |   3 -
>>   tools/testing/selftests/bpf/config.aarch64    |   2 +-
>>   tools/testing/selftests/bpf/config.ppc64el    |   2 +-
>>   tools/testing/selftests/bpf/config.riscv64    |   2 +-
>>   tools/testing/selftests/bpf/config.s390x      |   2 +-
>>   tools/testing/selftests/kho/vmtest.sh         |   2 +-
>>   .../testing/selftests/nolibc/Makefile.nolibc  |   4 +-
>>   tools/testing/selftests/vsock/config          |   2 +-
>>   .../selftests/wireguard/qemu/kernel.config    |   2 +-
>>   usr/Kconfig                                   |  70 ++--
>>   usr/Makefile                                  |   2 +-
>>   usr/initramfs_data.S                          |   4 +-
>>   385 files changed, 969 insertions(+), 2346 deletions(-)
>>   delete mode 100644 Documentation/admin-guide/initrd.rst
>>   delete mode 100644 Documentation/power/swsusp-dmcrypt.rst
>>   create mode 100644 include/linux/initramfs.h
>>   delete mode 100644 include/linux/initrd.h
>>   delete mode 100644 init/do_mounts_initrd.c
>>   delete mode 100644 init/do_mounts_rd.c
>>
>>
>> base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
>> --
>> 2.47.2
>>
>>
>>
>

--0000000000008bbd6b063f7d3734
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E2=80=9Dcpio=E2=80=9D archive is initramfs and not initrd, isn=E2=80=99t i=
t ?<br><br>=D0=B2=D1=96=D0=B2=D1=82=D0=BE=D1=80=D0=BE=D0=BA, 23 =D0=B2=D0=
=B5=D1=80=D0=B5=D1=81=D0=BD=D1=8F 2025=E2=80=AF=D1=80. Christophe Leroy &lt=
;<a href=3D"mailto:christophe.leroy@csgroup.eu">christophe.leroy@csgroup.eu=
</a>&gt; =D0=BF=D0=B8=D1=88=D0=B5:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Le 13/09/2025 =C3=A0 02:37, Askar Safin a =C3=A9crit=C2=A0:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
[Vous ne recevez pas souvent de courriers de <a href=3D"mailto:safinaskar@g=
mail.com" target=3D"_blank">safinaskar@gmail.com</a>. D=C3=A9couvrez pourqu=
oi ceci est important =C3=A0 <a href=3D"https://aka.ms/LearnAboutSenderIden=
tification" target=3D"_blank">https://aka.ms/LearnAboutSende<wbr>rIdentific=
ation</a> ]<br>
<br>
Intro<br>
=3D=3D=3D=3D<br>
This patchset removes classic initrd (initial RAM disk) support,<br>
which was deprecated in 2020.<br>
Initramfs still stays, and RAM disk itself (brd) still stays, too.<br>
init/do_mounts* and init/*initramfs* are listed in VFS entry in<br>
MAINTAINERS, so I think this patchset should go through VFS tree.<br>
This patchset touchs every subdirectory in arch/, so I tested it<br>
on 8 (!!!) archs in Qemu (see details below).<br>
Warning: this patchset renames CONFIG_BLK_DEV_INITRD (!!!) to CONFIG_INITRA=
MFS<br>
and CONFIG_RD_* to CONFIG_INITRAMFS_DECOMPRESS_* (for example,<br>
CONFIG_RD_GZIP to CONFIG_INITRAMFS_DECOMPRESS_GZ<wbr>IP).<br>
If you still use initrd, see below for workaround.<br>
</blockquote>
<br>
Apologise if my question looks stupid, but I&#39;m using QEMU for various t=
ests, and the way QEMU is started is something like:<br>
<br>
qemu-system-ppc -kernel ./vmlinux -cpu g4 -M mac99 -initrd ./qemu/rootfs.cp=
io.gz<br>
<br>
I was therefore expecting (and fearing) it to fail with your series applied=
, but surprisingly it still works.<br>
<br>
Therefore is it really initrd you are removing or just some corner case ? I=
f it is really initrd, then how does QEMU still work with that -initrd para=
meter ?<br>
<br>
Thanks<br>
Christophe<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Details<br>
=3D=3D=3D=3D<br>
I not only removed initrd, I also removed a lot of code, which<br>
became dead, including a lot of code in arch/.<br>
<br>
Still I think the only two architectures I touched in non-trivial<br>
way are sh and 32-bit arm.<br>
<br>
Also I renamed some files, functions and variables (which became misnomers)=
 to proper names,<br>
moved some code around, removed a lot of mentions of initrd<br>
in code and comments. Also I cleaned up some docs.<br>
<br>
For example, I renamed the following global variables:<br>
<br>
__initramfs_start<br>
__initramfs_size<br>
phys_initrd_start<br>
phys_initrd_size<br>
initrd_start<br>
initrd_end<br>
<br>
to:<br>
<br>
__builtin_initramfs_start<br>
__builtin_initramfs_size<br>
phys_external_initramfs_start<br>
phys_external_initramfs_size<br>
virt_external_initramfs_start<br>
virt_external_initramfs_end<br>
<br>
New names precisely capture meaning of these variables.<br>
<br>
Also I renamed CONFIG_BLK_DEV_INITRD (which became total misnomer)<br>
to CONFIG_INITRAMFS. And CONFIG_RD_* to CONFIG_INITRAMFS_DECOMPRESS_*.<br>
This will break all configs out there (update your configs!).<br>
Still I think this is okay,<br>
because config names never were part of stable API.<br>
Still, I don&#39;t have strong opinion here, so I can drop these renamings<=
br>
if needed.<br>
<br>
Other user-visible changes:<br>
<br>
- Removed kernel command line parameters &quot;load_ramdisk&quot; and<br>
&quot;prompt_ramdisk&quot;, which did nothing and were deprecated<br>
- Removed kernel command line parameter &quot;ramdisk_start&quot;,<br>
which was used for initrd only (not for initramfs)<br>
- Removed kernel command line parameter &quot;noinitrd&quot;,<br>
which was inconsistent: it controlled initrd only<br>
(not initramfs), except for EFI boot, where it<br>
controlled both initramfs and initrd. EFI users<br>
still can disable initramfs simply by not passing it<br>
- Removed kernel command line parameter &quot;ramdisk_size&quot;,<br>
which used for controlling ramdisk (brd), but only<br>
in non-modular mode. Use brd.rd_size instead, it<br>
always works<br>
- Removed /proc/sys/kernel/real-root-dev . It was used<br>
for initrd only<br>
<br>
This patchset is based on v6.17-rc5.<br>
<br>
Testing<br>
=3D=3D=3D=3D<br>
I tested my patchset on many architectures in Qemu using my Rust<br>
program, heavily based on mkroot [1].<br>
<br>
I used the following cross-compilers:<br>
<br>
aarch64-linux-musleabi<br>
armv4l-linux-musleabihf<br>
armv5l-linux-musleabihf<br>
armv7l-linux-musleabihf<br>
i486-linux-musl<br>
i686-linux-musl<br>
mips-linux-musl<br>
mips64-linux-musl<br>
mipsel-linux-musl<br>
powerpc-linux-musl<br>
powerpc64-linux-musl<br>
powerpc64le-linux-musl<br>
riscv32-linux-musl<br>
riscv64-linux-musl<br>
s390x-linux-musl<br>
sh4-linux-musl<br>
sh4eb-linux-musl<br>
x86_64-linux-musl<br>
<br>
taken from this directory [2].<br>
<br>
So, as you can see, there are 18 triplets, which correspond to 8 subdirs in=
 arch/.<br>
<br>
And note that this list contains two archs (arm and sh) touched in non-triv=
ial way.<br>
<br>
For every triplet I tested that:<br>
- Initramfs still works (both builtin and external)<br>
- Direct boot from disk still works<br>
<br>
Workaround<br>
=3D=3D=3D=3D<br>
If &quot;retain_initrd&quot; is passed to kernel, then initramfs/initrd,<br=
>
passed by bootloader, is retained and becomes available after boot<br>
as read-only magic file /sys/firmware/initrd [3].<br>
<br>
No copies are involved. I. e. /sys/firmware/initrd is simply<br>
a reference to original blob passed by bootloader.<br>
<br>
This works even if initrd/initramfs is not recognized by kernel<br>
in any way, i. e. even if it is not valid cpio archive, nor<br>
a fs image supported by classic initrd.<br>
<br>
This works both with my patchset and without it.<br>
<br>
This means that you can emulate classic initrd so:<br>
link builtin initramfs to kernel. In /init in this initramfs<br>
copy /sys/firmware/initrd to some file in / and loop-mount it.<br>
<br>
This is even better than classic initrd, because:<br>
- You can use fs not supported by classic initrd, for example erofs<br>
- One copy is involved (from /sys/firmware/initrd to some file in /)<br>
as opposed to two when using classic initrd<br>
<br>
Still, I don&#39;t recommend using this workaround, because<br>
I want everyone to migrate to proper modern initramfs.<br>
But still you can use this workaround if you want.<br>
<br>
Also: it is not possible to directly loop-mount<br>
/sys/firmware/initrd . Theoretically kernel can be changed<br>
to allow this (and/or to make it writable), but I think nobody needs this.<=
br>
And I don&#39;t want to implement this.<br>
<br>
P. S. When I sent this patchset first time, zoho mail banned me for<br>
too much email. So I resend this using gmail. The only change is<br>
email change, there are no other changes<br>
<br>
[1] <a href=3D"https://github.com/landley/toybox/tree/master/mkroot" target=
=3D"_blank">https://github.com/landley/toy<wbr>box/tree/master/mkroot</a><b=
r>
[2] <a href=3D"https://landley.net/toybox/downloads/binaries/toolchains/lat=
est" target=3D"_blank">https://landley.net/toybox/dow<wbr>nloads/binaries/t=
oolchains/lat<wbr>est</a><br>
[3] <a href=3D"https://lore.kernel.org/all/20231207235654.16622-1-graf@amaz=
on.com/" target=3D"_blank">https://lore.kernel.org/all/20<wbr>231207235654.=
16622-1-graf@amaz<wbr>on.com/</a><br>
<br>
Askar Safin (62):<br>
=C2=A0 =C2=A0init: remove deprecated &quot;load_ramdisk&quot; command line =
parameter, which<br>
=C2=A0 =C2=A0 =C2=A0does nothing<br>
=C2=A0 =C2=A0init: remove deprecated &quot;prompt_ramdisk&quot; command lin=
e parameter, which<br>
=C2=A0 =C2=A0 =C2=A0does nothing<br>
=C2=A0 =C2=A0init: sh, sparc, x86: remove unused constants RAMDISK_PROMPT_F=
LAG and<br>
=C2=A0 =C2=A0 =C2=A0RAMDISK_LOAD_FLAG<br>
=C2=A0 =C2=A0init: x86, arm, sh, sparc: remove variable rd_image_start, whi=
ch<br>
=C2=A0 =C2=A0 =C2=A0controls starting block number of initrd<br>
=C2=A0 =C2=A0init: remove &quot;ramdisk_start&quot; command line parameter,=
 which controls<br>
=C2=A0 =C2=A0 =C2=A0starting block number of initrd<br>
=C2=A0 =C2=A0arm: init: remove special logic for setting brd.rd_size<br>
=C2=A0 =C2=A0arm: init: remove ATAG_RAMDISK<br>
=C2=A0 =C2=A0arm: init: remove FLAG_RDLOAD and FLAG_RDPROMPT<br>
=C2=A0 =C2=A0arm: init: document rd_start (in param_struct) as obsolete<br>
=C2=A0 =C2=A0initrd: remove initrd (initial RAM disk) support<br>
=C2=A0 =C2=A0init, efi: remove &quot;noinitrd&quot; command line parameter<=
br>
=C2=A0 =C2=A0init: remove /proc/sys/kernel/real-root-dev<br>
=C2=A0 =C2=A0ext2: remove ext2_image_size and associated code<br>
=C2=A0 =C2=A0init: m68k, mips, powerpc, s390, sh: remove Root_RAM0<br>
=C2=A0 =C2=A0doc: modernize Documentation/admin-guide/bloc<wbr>kdev/ramdisk=
.rst<br>
=C2=A0 =C2=A0brd: remove &quot;ramdisk_size&quot; command line parameter<br=
>
=C2=A0 =C2=A0doc: modernize Documentation/filesystems/ramf<wbr>s-rootfs-ini=
tramfs.rst<br>
=C2=A0 =C2=A0doc: modernize<br>
=C2=A0 =C2=A0 =C2=A0Documentation/driver-api/earl<wbr>y-userspace/early_use=
rspace_<wbr>support.rst<br>
=C2=A0 =C2=A0init: remove mentions of &quot;ramdisk=3D&quot; command line p=
arameter<br>
=C2=A0 =C2=A0doc: remove Documentation/power/swsusp-dmc<wbr>rypt.rst<br>
=C2=A0 =C2=A0init: remove all mentions of root=3D/dev/ram*<br>
=C2=A0 =C2=A0doc: remove obsolete mentions of pivot_root<br>
=C2=A0 =C2=A0init: rename __initramfs_{start,size} to<br>
=C2=A0 =C2=A0 =C2=A0__builtin_initramfs_{start,si<wbr>ze}<br>
=C2=A0 =C2=A0init: remove wrong comment<br>
=C2=A0 =C2=A0init: rename phys_initrd_{start,size} to<br>
=C2=A0 =C2=A0 =C2=A0phys_external_initramfs_{star<wbr>t,size}<br>
=C2=A0 =C2=A0init: move phys_external_initramfs_{start<wbr>,size} to init/i=
nitramfs.c<br>
=C2=A0 =C2=A0init: alpha: remove &quot;extern unsigned long initrd_start, i=
nitrd_end&quot;<br>
=C2=A0 =C2=A0init: alpha, arc, arm, arm64, csky, m68k, microblaze, mips, ni=
os2,<br>
=C2=A0 =C2=A0 =C2=A0openrisc, parisc, powerpc, s390, sh, sparc, um, x86, xt=
ensa: rename<br>
=C2=A0 =C2=A0 =C2=A0initrd_{start,end} to virt_external_initramfs_{start<wb=
r>,end}<br>
=C2=A0 =C2=A0init: move virt_external_initramfs_{start<wbr>,end} to init/in=
itramfs.c<br>
=C2=A0 =C2=A0doc: remove documentation for block device 4 0<br>
=C2=A0 =C2=A0init: rename initrd_below_start_ok to initramfs_below_start_ok=
<br>
=C2=A0 =C2=A0init: move initramfs_below_start_ok to init/initramfs.c<br>
=C2=A0 =C2=A0init: remove init/do_mounts_initrd.c<br>
=C2=A0 =C2=A0init: inline create_dev into the only caller<br>
=C2=A0 =C2=A0init: make mount_root_generic static<br>
=C2=A0 =C2=A0init: make mount_root static<br>
=C2=A0 =C2=A0init: remove root_mountflags from init/do_mounts.h<br>
=C2=A0 =C2=A0init: remove most headers from init/do_mounts.h<br>
=C2=A0 =C2=A0init: make console_on_rootfs static<br>
=C2=A0 =C2=A0init: rename free_initrd_mem to free_initramfs_mem<br>
=C2=A0 =C2=A0init: rename reserve_initrd_mem to reserve_initramfs_mem<br>
=C2=A0 =C2=A0init: rename &lt;linux/initrd.h&gt; to &lt;linux/initramfs.h&g=
t;<br>
=C2=A0 =C2=A0setsid: inline ksys_setsid into the only caller<br>
=C2=A0 =C2=A0doc: kernel-parameters: remove [RAM] from reserve_mem=3D<br>
=C2=A0 =C2=A0doc: kernel-parameters: replace [RAM] with [INITRAMFS]<br>
=C2=A0 =C2=A0init: edit docs for initramfs-related configs<br>
=C2=A0 =C2=A0init: fix typo: virtul =3D&gt; virtual<br>
=C2=A0 =C2=A0init: fix comment<br>
=C2=A0 =C2=A0init: rename ramdisk_execute_command to initramfs_execute_comm=
and<br>
=C2=A0 =C2=A0init: rename ramdisk_command_access to initramfs_command_acces=
s<br>
=C2=A0 =C2=A0init: rename get_boot_config_from_initrd to<br>
=C2=A0 =C2=A0 =C2=A0get_boot_config_from_<wbr>initramfs<br>
=C2=A0 =C2=A0init: rename do_retain_initrd to retain_initramfs<br>
=C2=A0 =C2=A0init: rename kexec_free_initrd to kexec_free_initramfs<br>
=C2=A0 =C2=A0init: arm, x86: deal with some references to initrd<br>
=C2=A0 =C2=A0init: rename CONFIG_BLK_DEV_INITRD to CONFIG_INITRAMFS<br>
=C2=A0 =C2=A0init: rename CONFIG_RD_GZIP to CONFIG_INITRAMFS_DECOMPRESS_GZ<=
wbr>IP<br>
=C2=A0 =C2=A0init: rename CONFIG_RD_BZIP2 to CONFIG_INITRAMFS_DECOMPRESS_BZ=
<wbr>IP2<br>
=C2=A0 =C2=A0init: rename CONFIG_RD_LZMA to CONFIG_INITRAMFS_DECOMPRESS_LZ<=
wbr>MA<br>
=C2=A0 =C2=A0init: rename CONFIG_RD_XZ to CONFIG_INITRAMFS_DECOMPRESS_XZ<br=
>
=C2=A0 =C2=A0init: rename CONFIG_RD_LZO to CONFIG_INITRAMFS_DECOMPRESS_LZ<w=
br>O<br>
=C2=A0 =C2=A0init: rename CONFIG_RD_LZ4 to CONFIG_INITRAMFS_DECOMPRESS_LZ<w=
br>4<br>
=C2=A0 =C2=A0init: rename CONFIG_RD_ZSTD to CONFIG_INITRAMFS_DECOMPRESS_ZS<=
wbr>TD<br>
<br>
=C2=A0 .../admin-guide/blockdev/ramdi<wbr>sk.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 104 +----<br>
=C2=A0 .../admin-guide/device-mapper/<wbr>dm-init.rst=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
=C2=A0 Documentation/admin-guide/devi<wbr>ces.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 12 -<br>
=C2=A0 Documentation/admin-guide/inde<wbr>x.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0 Documentation/admin-guide/init<wbr>rd.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 383 ------------------<br>
=C2=A0 .../admin-guide/kernel-paramet<wbr>ers.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 .../admin-guide/kernel-paramet<wbr>ers.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 38 +-<br>
=C2=A0 Documentation/admin-guide/nfs/<wbr>nfsroot.rst=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
=C2=A0 Documentation/admin-guide/sysc<wbr>tl/kernel.rst=C2=A0 =C2=A0|=C2=A0=
 =C2=A06 -<br>
=C2=A0 Documentation/arch/arm/ixp4xx.<wbr>rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 Documentation/arch/arm/setup.r<wbr>st=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0 Documentation/arch/m68k/kernel<wbr>-options.rst=C2=A0 =C2=A0 |=C2=A0=
 29 +-<br>
=C2=A0 Documentation/arch/x86/<a href=3D"http://boot.rs">boot.rs</a><wbr>t=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<b=
r>
=C2=A0 .../<a href=3D"http://early_userspace_support.rs">early_userspace_su=
pport.rs</a><wbr>t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 18 +-<br>
=C2=A0 .../filesystems/ramfs-rootfs-i<wbr>nitramfs.rst=C2=A0 =C2=A0 |=C2=A0=
 20 +-<br>
=C2=A0 Documentation/power/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0 Documentation/power/swsusp-dmc<wbr>rypt.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 140 -------<br>
=C2=A0 Documentation/security/ipe.<wbr>rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 .../translations/zh_CN/power/i<wbr>ndex.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 -<br>
=C2=A0 arch/alpha/kernel/core_irongat<wbr>e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
=C2=A0 arch/alpha/kernel/proto.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/alpha/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 32 +-<br>
=C2=A0 arch/arc/configs/axs101_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arc/configs/axs103_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arc/configs/axs103_smp_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arc/configs/haps_hs_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arc/configs/haps_hs_smp_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arc/configs/hsdk_defconfi<wbr>g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arc/configs/nsim_700_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arc/configs/nsimosci_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arc/configs/nsimosci_hs_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arc/configs/nsimosci_hs_s<wbr>mp_defconfig=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/arc/configs/tb10x_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arc/configs/vdk_hs38_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arc/configs/vdk_hs38_smp_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arc/mm/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0 arch/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/arm/integrat<wbr>orap.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/arm/integrat<wbr>orcp.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 .../dts/aspeed/aspeed-bmc-face<wbr>book-cmm.dts=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 .../aspeed/aspeed-bmc-facebook<wbr>-galaxy100.dts=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0 .../aspeed/aspeed-bmc-facebook<wbr>-minipack.dts=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 .../aspeed/aspeed-bmc-facebook<wbr>-wedge100.dts=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 .../aspeed/aspeed-bmc-facebook<wbr>-wedge40.dts=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 .../dts/aspeed/aspeed-bmc-face<wbr>book-yamp.dts=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 .../ast2600-facebook-netbmc-co<wbr>mmon.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/hisilicon/hi<wbr>3620-hi4511.dts |=C2=A0 =C2=A02 +=
-<br>
=C2=A0 .../ixp/intel-ixp42x-welltech-<wbr>epbx100.dts=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/nspire/nspir<wbr>e-classic.dtsi=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0 arch/arm/boot/dts/nspire/nspir<wbr>e-cx.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 .../boot/dts/samsung/exynos421<wbr>0-origen.dts=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 .../boot/dts/samsung/exynos421<wbr>0-smdkv310.dts=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0 .../boot/dts/samsung/exynos441<wbr>2-smdk4412.dts=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0 .../boot/dts/samsung/exynos525<wbr>0-smdk5250.dts=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/ste-nomad<wbr>ik-nhk15.dts=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/ste-nomad<wbr>ik-s8815.dts=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/stm32429i<wbr>-eval.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/stm32746g<wbr>-eval.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/stm32f429<wbr>-disco.dts=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/stm32f469<wbr>-disco.dts=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/stm32f746<wbr>-disco.dts=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/stm32f769<wbr>-disco.dts=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/stm32h743<wbr>i-disco.dts=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/stm32h743<wbr>i-eval.dts=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/stm32h747<wbr>i-disco.dts=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/boot/dts/st/stm32h750<wbr>i-art-pi.dts=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/aspeed_g4_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0 arch/arm/configs/aspeed_g5_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0 arch/arm/configs/assabet_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/at91_dt_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/axm55xx_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/bcm2835_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/clps711x_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/collie_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/davinci_all_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/exynos_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/footbridge_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/gemini_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/h3600_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/hisi_defconfi<wbr>g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/imx_v4_v5_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/imx_v6_v7_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/integrator_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/ixp4xx_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/keystone_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/lpc18xx_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 12 +-<br>
=C2=A0 arch/arm/configs/lpc32xx_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/milbeaut_m10v<wbr>_defconfig=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/multi_v4t_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/multi_v5_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/multi_v7_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/mvebu_v7_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/mxs_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/neponset_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/nhk8815_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/omap1_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/omap2plus_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/pxa910_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/pxa_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/qcom_defconfi<wbr>g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/rpc_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/s3c6400_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/s5pv210_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/sama5_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/sama7_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/shmobile_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/socfpga_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/sp7021_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
=C2=A0 arch/arm/configs/spear13xx_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/spear3xx_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/spear6xx_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/spitz_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/stm32_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/sunxi_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/tegra_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/u8500_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/arm/configs/versatile_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/vexpress_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/vf610m4_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0 arch/arm/configs/vt8500_v6_v7_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/configs/wpcm450_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/include/uapi/asm/setu<wbr>p.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 10 -<br>
=C2=A0 arch/arm/kernel/atags_compat.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 -<br>
=C2=A0 arch/arm/kernel/atags_parse.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 +-<br>
=C2=A0 arch/arm/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm/mm/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 +-<br>
=C2=A0 arch/arm64/configs/defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm64/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/arm64/mm/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 +-<br>
=C2=A0 arch/csky/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 +-<br>
=C2=A0 arch/csky/mm/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/hexagon/configs/comet_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/loongarch/configs/loongso<wbr>n3_defconfig=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/loongarch/kernel/mem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/loongarch/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/m68k/configs/amiga_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/apollo_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/atari_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/bvme6000_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/hp300_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/mac_defconfi<wbr>g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/multi_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/mvme147_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/mvme16x_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/q40_defconfi<wbr>g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/stmark2_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/sun3_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/configs/sun3x_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/m68k/kernel/setup_mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
=C2=A0 arch/m68k/kernel/setup_no.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
=C2=A0 arch/m68k/kernel/uboot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 +-<br>
=C2=A0 arch/microblaze/kernel/cpu/mb.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/microblaze/kernel/setup.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/microblaze/mm/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
=C2=A0 arch/mips/ath79/prom.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
=C2=A0 arch/mips/configs/ath25_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-<br>
=C2=A0 arch/mips/configs/ath79_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/mips/configs/bcm47xx_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/bigsur_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/bmips_be_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/bmips_stb_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 14 +-<br>
=C2=A0 arch/mips/configs/cavium_octeo<wbr>n_defconfig=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/eyeq5_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/eyeq6_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/generic_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/gpr_defconfi<wbr>g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/lemote2f_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/loongson2k_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/loongson3_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/malta_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/mtx1_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/rb532_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/rbtx49xx_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/rt305x_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/mips/configs/sb1250_swarm<wbr>_defconfig=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/configs/xway_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/mips/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 53 ++-<br>
=C2=A0 arch/mips/mm/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/mips/sibyte/common/cfe.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 36 +-<br>
=C2=A0 arch/mips/sibyte/swarm/setup.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/nios2/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +-<br>
=C2=A0 arch/openrisc/configs/or1klite<wbr>x_defconfig=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/openrisc/configs/or1ksim_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/openrisc/configs/simple_s<wbr>mp_defconfig=C2=A0 =C2=A0 |=C2=A0=
 14 +-<br>
=C2=A0 arch/openrisc/configs/virt_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/openrisc/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 +-<br>
=C2=A0 arch/openrisc/kernel/vmlinux.<wbr>h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/parisc/boot/compressed/mi<wbr>sc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/parisc/configs/generic-32<wbr>bit_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/parisc/configs/generic-64<wbr>bit_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/parisc/defpalo.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/parisc/kernel/pdt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0 arch/parisc/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0 arch/parisc/mm/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 32 +-<br>
=C2=A0 arch/powerpc/configs/44x/akebo<wbr>no_defconfig=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/arche<wbr>s_defconfig=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/bambo<wbr>o_defconfig=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/blues<wbr>tone_defconfig=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0 .../powerpc/configs/44x/canyon<wbr>lands_defconfig |=C2=A0 =C2=A02 +=
-<br>
=C2=A0 arch/powerpc/configs/44x/ebony<wbr>_defconfig=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/eiger<wbr>_defconfig=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/fsp2_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 10 +-<br>
=C2=A0 arch/powerpc/configs/44x/icon_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/iss47<wbr>6-smp_defconfig |=C2=A0 =C2=A02 +=
-<br>
=C2=A0 arch/powerpc/configs/44x/katma<wbr>i_defconfig=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/raini<wbr>er_defconfig=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/redwo<wbr>od_defconfig=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/sam44<wbr>0ep_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/sequo<wbr>ia_defconfig=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/taish<wbr>an_defconfig=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/44x/warp_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/52xx/cm52<wbr>00_defconfig=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/52xx/lite<wbr>5200b_defconfig |=C2=A0 =C2=A02 +=
-<br>
=C2=A0 arch/powerpc/configs/52xx/moti<wbr>onpro_defconfig |=C2=A0 =C2=A02 +=
-<br>
=C2=A0 arch/powerpc/configs/52xx/tqm5<wbr>200_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/83xx/asp8<wbr>347_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 .../configs/83xx/mpc8313_rdb_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 .../configs/83xx/mpc8315_rdb_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 .../configs/83xx/mpc832x_rdb_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 .../configs/83xx/mpc834x_itx_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 .../configs/83xx/mpc834x_itxgp<wbr>_defconfig=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 .../configs/83xx/mpc836x_rdk_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 .../configs/83xx/mpc837x_rdb_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/85xx/ge_i<wbr>mp3a_defconfig=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0 arch/powerpc/configs/85xx/ksi8<wbr>560_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/85xx/socr<wbr>ates_defconfig=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0 arch/powerpc/configs/85xx/stx_<wbr>gp3_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/85xx/tqm8<wbr>540_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/85xx/tqm8<wbr>541_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/85xx/tqm8<wbr>548_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/85xx/tqm8<wbr>555_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/85xx/tqm8<wbr>560_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 .../configs/85xx/xes_mpc85xx_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/amigaone_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/cell_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/chrp32_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/fsl-emb-n<wbr>onhw.config=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/g5_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/gamecube_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/holly_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/linkstati<wbr>on_defconfig=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/mgcoge_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/powerpc/configs/microwatt<wbr>_defconfig=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/mpc512x_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/mpc5200_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/mpc83xx_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/pasemi_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/pmac32_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/powernv_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/ppc44x_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/ppc64_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/ppc64e_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/ppc6xx_de<wbr>fconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/ps3_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/configs/skiroot_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 12 +-<br>
=C2=A0 arch/powerpc/configs/wii_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/kernel/prom.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +-<br>
=C2=A0 arch/powerpc/kernel/prom_init.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0 arch/powerpc/kernel/setup-comm<wbr>on.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 25 +-<br>
=C2=A0 arch/powerpc/kernel/setup_32.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/kernel/setup_64.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/mm/init_32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/platforms/52xx/li<wbr>te5200.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/platforms/83xx/km<wbr>83xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/platforms/85xx/mp<wbr>c85xx_mds.c=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/platforms/chrp/se<wbr>tup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 .../platforms/embedded6xx/link<wbr>station.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 .../platforms/embedded6xx/stor<wbr>center.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/powerpc/platforms/powerma<wbr>c/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0 arch/riscv/configs/defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/riscv/configs/nommu_k210_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 16 +-<br>
=C2=A0 arch/riscv/configs/nommu_virt_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 12 +-<br>
=C2=A0 arch/riscv/mm/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/s390/boot/ipl_parm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/s390/boot/startup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/s390/configs/zfcpdump_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/s390/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0 arch/s390/mm/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/apsh4a3a_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/apsh4ad0a_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/ecovec24-romim<wbr>age_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/edosk7760_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/kfr2r09-romima<wbr>ge_defconfig=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/kfr2r09_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/magicpanelr2_d<wbr>efconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/migor_defconfi<wbr>g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/rsk7201_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/rsk7203_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/sdk7786_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0 arch/sh/configs/se7206_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/se7705_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/se7722_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/se7751_defconf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/secureedge5410<wbr>_defconfig=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/sh03_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/sh7757lcr_defc<wbr>onfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/titan_defconfi<wbr>g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/ul2_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/configs/urquell_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/include/asm/setup.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0 arch/sh/kernel/head_32.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sh/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 27 +-<br>
=C2=A0 arch/sparc/boot/piggyback.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/sparc/configs/sparc32_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sparc/configs/sparc64_def<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/sparc/kernel/head_32.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 arch/sparc/kernel/head_64.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0 arch/sparc/kernel/setup_32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A0 arch/sparc/kernel/setup_64.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A0 arch/sparc/mm/init_32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 +-<br>
=C2=A0 arch/sparc/mm/init_64.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +-<br>
=C2=A0 arch/um/kernel/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/um/kernel/initrd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0 arch/x86/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/x86/boot/header.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/x86/boot/startup/sme.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/x86/configs/i386_defconfi<wbr>g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/x86/configs/x86_64_defcon<wbr>fig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/x86/include/uapi/asm/boot<wbr>param.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0 arch/x86/kernel/cpu/microcode/<wbr>amd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/x86/kernel/cpu/microcode/<wbr>core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 12 +-<br>
=C2=A0 arch/x86/kernel/cpu/microcode/<wbr>intel.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/x86/kernel/cpu/microcode/<wbr>internal.h=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/x86/kernel/devicetree.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/x86/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 39 +-<br>
=C2=A0 arch/x86/mm/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0 arch/x86/mm/init_32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/x86/mm/init_64.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/x86/tools/relocs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/xtensa/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/xtensa/boot/dts/csp.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/xtensa/configs/audio_kc70<wbr>5_defconfig=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/xtensa/configs/cadence_cs<wbr>p_defconfig=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 12 +-<br>
=C2=A0 arch/xtensa/configs/generic_kc<wbr>705_defconfig=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0 arch/xtensa/configs/nommu_kc70<wbr>5_defconfig=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 12 +-<br>
=C2=A0 arch/xtensa/configs/smp_lx200_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/xtensa/configs/virt_defco<wbr>nfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/xtensa/configs/xip_kc705_<wbr>defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 arch/xtensa/kernel/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 26 +-<br>
=C2=A0 drivers/acpi/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 drivers/acpi/tables.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0 drivers/base/firmware_loader/m<wbr>ain.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 drivers/block/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0 drivers/block/brd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +-<br>
=C2=A0 drivers/firmware/efi/efi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0 .../firmware/efi/libstub/efi-s<wbr>tub-helper.c=C2=A0 =C2=A0 |=C2=A0=
 =C2=A05 +-<br>
=C2=A0 drivers/gpu/drm/ci/arm.config=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 drivers/gpu/drm/ci/arm64.confi<wbr>g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 drivers/gpu/drm/ci/x86_64.conf<wbr>ig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 drivers/of/fdt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 +-<br>
=C2=A0 fs/ext2/ext2.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09=
 -<br>
=C2=A0 fs/init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 14 -<br>
=C2=A0 include/asm-generic/vmlinux.ld<wbr>s.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0 include/linux/ext2_fs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 -<br>
=C2=A0 include/linux/init_syscalls.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0 include/linux/initramfs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 26 ++<br>
=C2=A0 include/linux/initrd.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 37 --<br>
=C2=A0 include/linux/root_dev.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
=C2=A0 include/linux/syscalls.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
=C2=A0 include/uapi/linux/sysctl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0 init/.kunitconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<b=
r>
=C2=A0 init/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 +=
-<br>
=C2=A0 init/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +-<br>
=C2=A0 init/do_mounts.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 +-<br>
=C2=A0 init/do_mounts.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 42 --<br>
=C2=A0 init/do_mounts_initrd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 154 -------<br>
=C2=A0 init/do_mounts_rd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 334 ---------------<br>
=C2=A0 init/initramfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 152 ++++---<br>
=C2=A0 init/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 66 +--<br>
=C2=A0 kernel/sys.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A07 +-<br>
=C2=A0 kernel/sysctl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 =
+-<br>
=C2=A0 kernel/umh.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0 scripts/package/builddeb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 .../ktest/examples/bootconfigs<wbr>/tracing.bconf=C2=A0 |=C2=A0 =C2=
=A03 -<br>
=C2=A0 tools/testing/selftests/bpf/co<wbr>nfig.aarch64=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 tools/testing/selftests/bpf/co<wbr>nfig.ppc64el=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 tools/testing/selftests/bpf/co<wbr>nfig.riscv64=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 tools/testing/selftests/bpf/co<wbr>nfig.s390x=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0 tools/testing/selftests/kho/vm<wbr>test.sh=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 .../testing/selftests/nolibc/M<wbr>akefile.nolibc=C2=A0 |=C2=A0 =C2=
=A04 +-<br>
=C2=A0 tools/testing/selftests/vsock/<wbr>config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 .../selftests/wireguard/qemu/k<wbr>ernel.config=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0 usr/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 70 ++--<br>
=C2=A0 usr/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0 usr/initramfs_data.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0 385 files changed, 969 insertions(+), 2346 deletions(-)<br>
=C2=A0 delete mode 100644 Documentation/admin-guide/init<wbr>rd.rst<br>
=C2=A0 delete mode 100644 Documentation/power/swsusp-dmc<wbr>rypt.rst<br>
=C2=A0 create mode 100644 include/linux/initramfs.h<br>
=C2=A0 delete mode 100644 include/linux/initrd.h<br>
=C2=A0 delete mode 100644 init/do_mounts_initrd.c<br>
=C2=A0 delete mode 100644 init/do_mounts_rd.c<br>
<br>
<br>
base-commit: 76eeb9b8de9880ca38696b2fb56ac4<wbr>5ac0a25c6c<br>
--<br>
2.47.2<br>
<br>
<br>
</blockquote>
<br>
</blockquote>

--0000000000008bbd6b063f7d3734--

