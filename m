Return-Path: <linuxppc-dev+bounces-6523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF430A4714E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 02:38:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3DWB4VGmz307q;
	Thu, 27 Feb 2025 12:38:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740620294;
	cv=none; b=Cx+VmnbKUbhoJiUPeVsVuvzaAwImI2EaGRPTcb72VnQxPo6nTjsxs60LBzCaGQBhXejlNdLeis8NXcDSNXeCZiXFExybm0UWqekAoS96IGHlF3i8GDJMNwgkL8Kww+F5FLk5GgkcXEJ2RtUu4yUe1dsG6nTxaHsq/a0hrvjhwW7Fj+hAYMwQ7x5pYEvXIXuMPHBJ08elQOx8XTKL3/bd/vS7G995ZHdGFIlcQ9RJ7Y3CmbtNlGcyLwwtBEOxYaishRUFn/i1/BvAcfzIsXf0cFZlnf5KeojRjUsAW8NBCEf/Q7SspgLQXDv1ADxvLpgIS9+pyvcTweb+EusUqsnE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740620294; c=relaxed/relaxed;
	bh=z9DAWos27Q06IuDaa4M0Viia0I6M9BgZYbFd4xPj7os=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ABF61EquCm6I9lqMchSDGAi7P/LMaAuSY8FWeLjrDYZqq/sb5tENFzquC9YIT8kZFUMBgvPwrru9ELx9Nd83CG16RD6w/e4vqxolJqySZG9n19jt3lFh9zZABy1lcSbGVvQtFh868jI1nmBm7aE6+NjGHwtCYCw8tTYBu1lt9Mz4oxewMaguiS/MJhWoNTNKie70XVXn1Qu69QhcqhG+5wOdmdxDh7Z3ifbGYsi96JnWDxvxIcd4jbRnOq2Eq27VCzjMcp172is4oQFJEA1XtsjxEhcd5YgRvu8CFSG4Y4udnFG52XkZW4favXA/D8GFBSA/xsIzRvHtyln3+D21+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=hmrDqXOH; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=hmrDqXOH;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3DW72Tncz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 12:38:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740620286;
	bh=z9DAWos27Q06IuDaa4M0Viia0I6M9BgZYbFd4xPj7os=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hmrDqXOHkgsssj53WYqWoYqxhlLc10soLYugSfq+dyj3ngu3g3a823IYRsgrjFGTi
	 O2NNkQZBxsHNyr/i4hu14+ePucnIDTje1XzBcqDsoW16X666Pvu7DaKsBRH25vpkFm
	 anDgBDxc24RSrMW/z7CmgtvworqIztAQrEGAdniPqxI6JyZzTbldd1/9+7pg0IgbDE
	 OtGAG99zzX/zs7BHFczCfl6yrBzlShYUHy3CYfq3XBzbwuY2Z3tLF6Bb8F4Un/o8/P
	 IKa7ESDHpAgrRfakKIY2Zpj/GGGDlzyoRu6dNB/o/n05cpog4SDXh+q5g6rb+XWjFl
	 u/wmW3z9ihwVg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3DW21qqvz4x1V;
	Thu, 27 Feb 2025 12:38:06 +1100 (AEDT)
Date: Thu, 27 Feb 2025 12:38:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Kees Cook
 <kees@kernel.org>
Subject: Re: [next-20250226]Build Failure
Message-ID: <20250227123804.5dd71cef@canb.auug.org.au>
In-Reply-To: <adbe8dd1-a725-4811-ae7e-76fe770cf096@linux.vnet.ibm.com>
References: <adbe8dd1-a725-4811-ae7e-76fe770cf096@linux.vnet.ibm.com>
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
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7puLdNAfr4chsrb23DmAgsy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/7puLdNAfr4chsrb23DmAgsy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Venkat,

CC Kees Cook for advice.  This is a result of the tests added in commit

  bbeb38b8487a ("string.h: Validate memtostr*()/strtomem*() arguments more =
carefully")

from the kspp tree.

I note that the comment about memtostr() says "Copy a possibly
non-NUL-term string".

On Thu, 27 Feb 2025 06:30:12 +0530 Venkat Rao Bagalkote <venkat88@linux.vne=
t.ibm.com> wrote:
>
> I am seeing build failures with kernel next-20250226, on IBM Power8 syste=
ms.
>=20
> Failures:
>=20
> In file included from ./include/asm-generic/div64.h:27,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./arch/powerpc/include/generated/asm/div64.h:=
1,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/math.h:6,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/math64.h:6,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/time.h:6,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from fs/ext4/file.c:22:
> fs/ext4/file.c: In function 'ext4_sample_last_mounted':
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:418:6: note: in expansion of macro '__must_be_no=
ncstr'
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __must_be_noncstr(dest) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~
> fs/ext4/file.c:869:2: note: in expansion of macro 'strtomem_pad'
>  =C2=A0 strtomem_pad(sbi->s_es->s_last_mounted, cp, 0);
>  =C2=A0 ^~~~~~~~~~~~
> In file included from ./include/linux/build_bug.h:5,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/container_of.h:5,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/list.h:5,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/module.h:12,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from drivers/message/fusion/mptsas.c:46:
> drivers/message/fusion/mptsas.c: In function 'mptsas_exp_repmanufacture_i=
nfo':
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:468:26: note: in expansion of macro '__must_be_n=
oncstr'
>  =C2=A0 const size_t _src_len =3D __must_be_noncstr(src) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~~~~~~~~
> drivers/message/fusion/mptsas.c:2968:3: note: in expansion of macro 'memt=
ostr'
>  =C2=A0=C2=A0 memtostr(edev->vendor_id, manufacture_reply->vendor_id);
>  =C2=A0=C2=A0 ^~~~~~~~
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:468:26: note: in expansion of macro '__must_be_n=
oncstr'
>  =C2=A0 const size_t _src_len =3D __must_be_noncstr(src) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~~~~~~~~
> drivers/message/fusion/mptsas.c:2969:3: note: in expansion of macro 'memt=
ostr'
>  =C2=A0=C2=A0 memtostr(edev->product_id, manufacture_reply->product_id);
>  =C2=A0=C2=A0 ^~~~~~~~
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:468:26: note: in expansion of macro '__must_be_n=
oncstr'
>  =C2=A0 const size_t _src_len =3D __must_be_noncstr(src) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~~~~~~~~
> drivers/message/fusion/mptsas.c:2970:3: note: in expansion of macro 'memt=
ostr'
>  =C2=A0=C2=A0 memtostr(edev->product_rev, manufacture_reply->product_rev);
>  =C2=A0=C2=A0 ^~~~~~~~
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:468:26: note: in expansion of macro '__must_be_n=
oncstr'
>  =C2=A0 const size_t _src_len =3D __must_be_noncstr(src) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~~~~~~~~
> drivers/message/fusion/mptsas.c:2973:4: note: in expansion of macro 'memt=
ostr'
>  =C2=A0=C2=A0=C2=A0 memtostr(edev->component_vendor_id,
>  =C2=A0=C2=A0=C2=A0 ^~~~~~~~
> make[4]: *** [scripts/Makefile.build:203: fs/ext4/file.o] Error 1
> make[3]: *** [scripts/Makefile.build:461: fs/ext4] Error 2
> make[3]: *** Waiting for unfinished jobs....
> In file included from ./include/linux/array_size.h:5,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/kernel.h:16,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from drivers/scsi/mpt3sas/mpt3sas_base.c:46:
> drivers/scsi/mpt3sas/mpt3sas_base.c: In function '_base_display_ioc_capab=
ilities':
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:468:26: note: in expansion of macro '__must_be_n=
oncstr'
>  =C2=A0 const size_t _src_len =3D __must_be_noncstr(src) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~~~~~~~~
> drivers/scsi/mpt3sas/mpt3sas_base.c:4798:2: note: in expansion of macro '=
memtostr'
>  =C2=A0 memtostr(desc, ioc->manu_pg0.ChipName);
>  =C2=A0 ^~~~~~~~
> In file included from ./include/linux/build_bug.h:5,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/container_of.h:5,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/list.h:5,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/module.h:12,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from drivers/scsi/mpt3sas/mpt3sas_transport.c:45:
> drivers/scsi/mpt3sas/mpt3sas_transport.c: In function '_transport_expande=
r_report_manufacture':
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:468:26: note: in expansion of macro '__must_be_n=
oncstr'
>  =C2=A0 const size_t _src_len =3D __must_be_noncstr(src) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~~~~~~~~
> drivers/scsi/mpt3sas/mpt3sas_transport.c:461:3: note: in expansion of mac=
ro 'memtostr'
>  =C2=A0=C2=A0 memtostr(edev->vendor_id, manufacture_reply->vendor_id);
>  =C2=A0=C2=A0 ^~~~~~~~
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:468:26: note: in expansion of macro '__must_be_n=
oncstr'
>  =C2=A0 const size_t _src_len =3D __must_be_noncstr(src) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~~~~~~~~
> drivers/scsi/mpt3sas/mpt3sas_transport.c:462:3: note: in expansion of mac=
ro 'memtostr'
>  =C2=A0=C2=A0 memtostr(edev->product_id, manufacture_reply->product_id);
>  =C2=A0=C2=A0 ^~~~~~~~
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:468:26: note: in expansion of macro '__must_be_n=
oncstr'
>  =C2=A0 const size_t _src_len =3D __must_be_noncstr(src) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~~~~~~~~
> drivers/scsi/mpt3sas/mpt3sas_transport.c:463:3: note: in expansion of mac=
ro 'memtostr'
>  =C2=A0=C2=A0 memtostr(edev->product_rev, manufacture_reply->product_rev);
>  =C2=A0=C2=A0 ^~~~~~~~
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:468:26: note: in expansion of macro '__must_be_n=
oncstr'
>  =C2=A0 const size_t _src_len =3D __must_be_noncstr(src) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~~~~~~~~
> drivers/scsi/mpt3sas/mpt3sas_transport.c:466:4: note: in expansion of mac=
ro 'memtostr'
>  =C2=A0=C2=A0=C2=A0 memtostr(edev->component_vendor_id,
>  =C2=A0=C2=A0=C2=A0 ^~~~~~~~
> make[5]: *** [scripts/Makefile.build:203: drivers/scsi/mpt3sas/mpt3sas_tr=
ansport.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> make[5]: *** [scripts/Makefile.build:203: drivers/message/fusion/mptsas.o=
] Error 1
> make[4]: *** [scripts/Makefile.build:461: drivers/message/fusion] Error 2
> make[3]: *** [scripts/Makefile.build:461: drivers/message] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[5]: *** [scripts/Makefile.build:203: drivers/scsi/mpt3sas/mpt3sas_ba=
se.o] Error 1
> In file included from ./include/linux/array_size.h:5,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/linux/kernel.h:16,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from drivers/scsi/qla2xxx/qla_def.h:9,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from drivers/scsi/qla2xxx/qla_mr.c:6:
> drivers/scsi/qla2xxx/qla_mr.c: In function 'qlafx00_fx_disc':
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:468:26: note: in expansion of macro '__must_be_n=
oncstr'
>  =C2=A0 const size_t _src_len =3D __must_be_noncstr(src) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~~~~~~~~
> drivers/scsi/qla2xxx/qla_mr.c:1912:3: note: in expansion of macro 'memtos=
tr'
>  =C2=A0=C2=A0 memtostr(vha->hw->model_number, pinfo->model_num);
>  =C2=A0=C2=A0 ^~~~~~~~
> ./include/linux/compiler.h:197:62: error: static assertion failed: "must =
be non-C-string (not NUL-terminated)"
>  =C2=A0#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Stat=
ic_assert(!(e), msg);}))
> ^~~~~~~~~~~~~~
> ./include/linux/compiler.h:226:2: note: in expansion of macro '__BUILD_BU=
G_ON_ZERO_MSG'
>  =C2=A0 __BUILD_BUG_ON_ZERO_MSG(!__is_noncstr(p), \
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/string.h:468:26: note: in expansion of macro '__must_be_n=
oncstr'
>  =C2=A0 const size_t _src_len =3D __must_be_noncstr(src) +=C2=A0 \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~~~~~~~~
> drivers/scsi/qla2xxx/qla_mr.c:1913:3: note: in expansion of macro 'memtos=
tr'
>  =C2=A0=C2=A0 memtostr(vha->hw->model_desc, pinfo->model_description);
>  =C2=A0=C2=A0 ^~~~~~~~
> make[5]: *** [scripts/Makefile.build:203: drivers/scsi/qla2xxx/qla_mr.o] =
Error 1
> make[5]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:461: fs] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[4]: *** [scripts/Makefile.build:461: drivers/scsi/mpt3sas] Error 2
> make[4]: *** Waiting for unfinished jobs....
> make[4]: *** [scripts/Makefile.build:461: drivers/scsi/qla2xxx] Error 2
> make[3]: *** [scripts/Makefile.build:461: drivers/scsi] Error 2
> make[2]: *** [scripts/Makefile.build:461: drivers] Error 2
> make[1]: *** [/root/linux-next/Makefile:1989: .] Error 2
> make: *** [Makefile:251: __sub-make] Error 2

--=20
Cheers,
Stephen Rothwell

--Sig_/7puLdNAfr4chsrb23DmAgsy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme/wfwACgkQAVBC80lX
0GzL9Af/U/CJEELhbzkzdLWIY0plJ0XZ+R+ww2HwFW1pLUVcllV4PGRIf9kz9yzY
0RR19gqcx07Fo4j5FvZdRJJ39necHqyKtla3ErO1IQsc1KQ/fTUejQuNPhtjWQY+
m0W3B20+Y+vDy3XuWk59drD2BvDO2g9j5C9lO+6DQueS3eaDzIruLZUBp41HqLzV
hN69eC8b4lBsBnhOv2lWV+fFOIDweJmu8i4BMEHZx1VqXxybnGdek+vwrW33/XZc
qdGZSJMKjfaOu3XfOWxfVXRCYar7l+Oy5SVH0Duf+UzbIgmMk4hO5t4fXOxMBPLI
raROl9gOI4ZjhpxopeduWSYuYDsBjQ==
=dZN8
-----END PGP SIGNATURE-----

--Sig_/7puLdNAfr4chsrb23DmAgsy--

