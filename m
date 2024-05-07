Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F938BD863
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 02:05:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=lCjvESUs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYJSl6yqHz3bmy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 10:05:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=lCjvESUs;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYJS00wxdz30VT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 10:04:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715040286;
	bh=hB9NaGtn0Ed1umyavuftHblA0GfvfFPA+kBeEH5epLU=;
	h=Date:From:To:Cc:Subject:From;
	b=lCjvESUslbl9iBCnNsSNcaLyjlsbvxsWCdrgnh75Pncsy+UD/sToVEVgPqWdGmrNV
	 KuoIIMpDe0hWidof8pElUq999Vvwoc6wq3EVfNgGLSFkeRfj6ETuDUS3XCGWU9a6oS
	 ZA1d/zjikqDehZkqCjv1/5oF9bq8oJu+v4XpMop5Kkd8NWimKCPE1PK1C1OWqbBIdE
	 sK4Wut3vGjs31724JN+ModQf2lZ2TghlO5hCDyBRgwIlxZPVXD3oGQUE/0mmNsfOwP
	 dqcF+bUPA2Qx2YWCvp0gWGSHe4fznP3C2PXGgL6VoByEepoV52hrq7aa91zKnLHPZL
	 qkwqTmL+kfFAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYJRx716pz4x11;
	Tue,  7 May 2024 10:04:45 +1000 (AEST)
Date: Tue, 7 May 2024 10:04:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the risc-v tree with the powerpc tree
Message-ID: <20240507100441.0ffefbd9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3T=VzYrZQdMsHplSnkWYqcq";
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
Cc: Charlie Jenkins <charlie@rivosinc.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Benjamin Gray <bgray@linux.ibm.com>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/3T=VzYrZQdMsHplSnkWYqcq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got conflicts in:

  include/uapi/linux/prctl.h
  kernel/sys.c

between commit:

  628d701f2de5 ("powerpc/dexcr: Add DEXCR prctl interface")

from the powerpc tree and commit:

  6b9391b581fd ("riscv: Include riscv_set_icache_flush_ctx prctl")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/prctl.h
index 713d28788df7,524d546d697b..000000000000
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@@ -306,20 -306,10 +306,26 @@@ struct prctl_mm_map=20
  # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
  # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 =20
+ #define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
+ # define PR_RISCV_CTX_SW_FENCEI_ON	0
+ # define PR_RISCV_CTX_SW_FENCEI_OFF	1
+ # define PR_RISCV_SCOPE_PER_PROCESS	0
+ # define PR_RISCV_SCOPE_PER_THREAD	1
+=20
 +/* PowerPC Dynamic Execution Control Register (DEXCR) controls */
 +#define PR_PPC_GET_DEXCR		72
 +#define PR_PPC_SET_DEXCR		73
 +/* DEXCR aspect to act on */
 +# define PR_PPC_DEXCR_SBHE		0 /* Speculative branch hint enable */
 +# define PR_PPC_DEXCR_IBRTPD		1 /* Indirect branch recurrent target predi=
ction disable */
 +# define PR_PPC_DEXCR_SRAPD		2 /* Subroutine return address prediction di=
sable */
 +# define PR_PPC_DEXCR_NPHIE		3 /* Non-privileged hash instruction enable =
*/
 +/* Action to apply / return */
 +# define PR_PPC_DEXCR_CTRL_EDITABLE	 0x1 /* Aspect can be modified with P=
R_PPC_SET_DEXCR */
 +# define PR_PPC_DEXCR_CTRL_SET		 0x2 /* Set the aspect for this process */
 +# define PR_PPC_DEXCR_CTRL_CLEAR	 0x4 /* Clear the aspect for this proces=
s */
 +# define PR_PPC_DEXCR_CTRL_SET_ONEXEC	 0x8 /* Set the aspect on exec */
 +# define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec =
*/
 +# define PR_PPC_DEXCR_CTRL_MASK		0x1f
 +
  #endif /* _LINUX_PRCTL_H */
diff --cc kernel/sys.c
index f9c95410278c,1b7bda0722ca..000000000000
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@@ -146,12 -146,9 +146,15 @@@
  #ifndef RISCV_V_GET_CONTROL
  # define RISCV_V_GET_CONTROL()		(-EINVAL)
  #endif
+ #ifndef RISCV_SET_ICACHE_FLUSH_CTX
+ # define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
+ #endif
 +#ifndef PPC_GET_DEXCR_ASPECT
 +# define PPC_GET_DEXCR_ASPECT(a, b)	(-EINVAL)
 +#endif
 +#ifndef PPC_SET_DEXCR_ASPECT
 +# define PPC_SET_DEXCR_ASPECT(a, b, c)	(-EINVAL)
 +#endif
 =20
  /*
   * this is where the system-wide overflow UID and GID are defined, for

--Sig_/3T=VzYrZQdMsHplSnkWYqcq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY5cBkACgkQAVBC80lX
0Gz+pwgAhkAnVZU+luoCbsYirXDx3Xxlo6uOJV6u+H4LLUJPErrmeLvOl0cbkiQg
BV4Z5+g8N28etB+MhVXLQ5RzzMz3QvP5cH2kK3VVHgvLo/VmaO/Z/Z7ky/O0rvrU
+Kss/3sekJ4rHWTrysg7/9HkJu3X2KM4rPEx+kNcQAMZ2+PxLI26ek7VUhj56NKh
3koT56fiNT0SG/hJfufIx/EKdKdFRHdZYHCWnT0mO0b+90E9/kr4b7mTqVz6Hp4H
DEj15/19dydr5G7ZcmCsBhAmwbzsuKtxSE+tUD/yKAYr3NFvOiJyFsDAr5GrBwk5
WfV9mi1r0hd25KdgyJz2MI29TLc1oA==
=ACh2
-----END PGP SIGNATURE-----

--Sig_/3T=VzYrZQdMsHplSnkWYqcq--
