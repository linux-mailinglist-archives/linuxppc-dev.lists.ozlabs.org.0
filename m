Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2545636FDE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 02:30:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHgRQ4s3Fz3cbV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 12:30:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=CmW7wn48;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHgQW3vdjz3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 12:29:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=CmW7wn48;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NHgQS5PfWz4x2c;
	Thu, 24 Nov 2022 12:29:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1669253377;
	bh=JBoFldnbFkQx64zlIrUVvIYpX+G+3s4hlaGLmsO4DLc=;
	h=Date:From:To:Cc:Subject:From;
	b=CmW7wn482iyoUrRheIscrEyn6EGtgKfYyL6ulcErqB3VafsnutmmWgnDZ18WmCqWu
	 HB4R/G7DpoGcZWestJx3AxYrx5+eB1nrbWwxM1EkVy6QgHL41/bH0nHXck8viqvNb6
	 T1rWTUGFu402173F6e5tvwjmAtEUbHRruukTKn8g/3iDQ8jSh4DeVuy+Zcf1tpcQLd
	 LuQpWtvFxkAx3+vQ7zGQPKLwnQs5YfVl6NOTFo7lAv52FpMlET36+P6QHQcBprDz50
	 nuUVB+TXLZAURbB1SAxREtmhUsX8R3CNnXgKq4m1tDz3/aE1gbj4kbela6T5go8v8/
	 ID2qwCrcBPJSA==
Date: Thu, 24 Nov 2022 12:29:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the tip tree with the powerpc-objtool
 tree
Message-ID: <20221124122931.266df8c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=_lk_MtKlnjXeIX3zrvFugy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/=_lk_MtKlnjXeIX3zrvFugy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  tools/objtool/check.c

between commit:

  efb11fdb3e1a ("objtool: Fix SEGFAULT")

from the powerpc-objtool tree and commit:

  dbcdbdfdf137 ("objtool: Rework instruction -> symbol mapping")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/objtool/check.c
index 7580c66ca5c8,4f1a7384426b..000000000000
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@@ -207,7 -204,7 +204,7 @@@ static bool __dead_end_function(struct=20
  		return false;
 =20
  	insn =3D find_insn(file, func->sec, func->offset);
- 	if (!insn || !insn->func)
 -	if (!insn_func(insn))
++	if (!insn || !insn_func(insn))
  		return false;
 =20
  	func_for_each_insn(file, func, insn) {
@@@ -850,11 -861,73 +861,73 @@@ static int create_ibt_endbr_seal_sectio
  	return 0;
  }
 =20
+ static int create_cfi_sections(struct objtool_file *file)
+ {
+ 	struct section *sec, *s;
+ 	struct symbol *sym;
+ 	unsigned int *loc;
+ 	int idx;
+=20
+ 	sec =3D find_section_by_name(file->elf, ".cfi_sites");
+ 	if (sec) {
+ 		INIT_LIST_HEAD(&file->call_list);
+ 		WARN("file already has .cfi_sites section, skipping");
+ 		return 0;
+ 	}
+=20
+ 	idx =3D 0;
+ 	for_each_sec(file, s) {
+ 		if (!s->text)
+ 			continue;
+=20
+ 		list_for_each_entry(sym, &s->symbol_list, list) {
+ 			if (sym->type !=3D STT_FUNC)
+ 				continue;
+=20
+ 			if (strncmp(sym->name, "__cfi_", 6))
+ 				continue;
+=20
+ 			idx++;
+ 		}
+ 	}
+=20
+ 	sec =3D elf_create_section(file->elf, ".cfi_sites", 0, sizeof(unsigned i=
nt), idx);
+ 	if (!sec)
+ 		return -1;
+=20
+ 	idx =3D 0;
+ 	for_each_sec(file, s) {
+ 		if (!s->text)
+ 			continue;
+=20
+ 		list_for_each_entry(sym, &s->symbol_list, list) {
+ 			if (sym->type !=3D STT_FUNC)
+ 				continue;
+=20
+ 			if (strncmp(sym->name, "__cfi_", 6))
+ 				continue;
+=20
+ 			loc =3D (unsigned int *)sec->data->d_buf + idx;
+ 			memset(loc, 0, sizeof(unsigned int));
+=20
+ 			if (elf_add_reloc_to_insn(file->elf, sec,
+ 						  idx * sizeof(unsigned int),
+ 						  R_X86_64_PC32,
+ 						  s, sym->offset))
+ 				return -1;
+=20
+ 			idx++;
+ 		}
+ 	}
+=20
+ 	return 0;
+ }
+=20
  static int create_mcount_loc_sections(struct objtool_file *file)
  {
 -	struct section *sec;
 -	unsigned long *loc;
 +	int addrsize =3D elf_class_addrsize(file->elf);
  	struct instruction *insn;
 +	struct section *sec;
  	int idx;
 =20
  	sec =3D find_section_by_name(file->elf, "__mcount_loc");

--Sig_/=_lk_MtKlnjXeIX3zrvFugy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN+yPsACgkQAVBC80lX
0GxNGwgAka10ZR9jqsjEV10zj0WtinoZKzPS8c78O50jJxhdtkn6bh6sjaGogYjV
ja4yM7EvEyuEsi87F/npale9JxLv1Qo/no35/sil1Q0wQ5thA9qqNI7X78kgbyqX
MS0kC9he2UNCNQXewZMhVaOqi4ifBVd778te5YgXVR5XG9z5a+aRzhYivyp6xSuo
QzPZzefOtFkrqZBprc3cIDW4DQvbGA2GyEb1IBC5lauK2ttmZjOaSkOCwnyCsfxI
NPoGame/aA5MHsUKW7KlDL+0tNlQSnUlo+2jA/yFJS7rIPX+autao7WfjUTMkzXZ
027Tb6m8GcZG9R8XWBKB/Pkv0cN1RA==
=c0cG
-----END PGP SIGNATURE-----

--Sig_/=_lk_MtKlnjXeIX3zrvFugy--
