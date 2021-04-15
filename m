Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A673604E2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 10:52:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLY536HWGz3by4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 18:52:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=sPz/Rn+h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=sPz/Rn+h; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLY4g0qfjz30BJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 18:52:17 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLY4c6r5tz9sV5;
 Thu, 15 Apr 2021 18:52:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1618476737;
 bh=QB4BCrjpgU5KIJI4AkeD+l2HmZyaeGojTt9+DV9zCLo=;
 h=Date:From:To:Cc:Subject:From;
 b=sPz/Rn+h//t1rbqV0p7oPnMtgSi30MbEu9LFkiVRK1KgD+aYNJaEMc1C2aN+M3fye
 fes31BRejNNvBZKZUu62VGkuA/CLovh65QZhFnCgxsr42AFUug1K/AzlTUqWMh3kVg
 BPBf5/NaTkuXlwDYbceTPisTBHOVuKRwCXg5V8YF4ETTCXrkfPSQkcXn1oPSNhiXu6
 wJ33Vwqw3Q8CB/m0/2BhAueZl7DD0avibnZvzg7dFX6y4szTuhjd4yske9TQg6BlPW
 aWwZaYs7AhZE6wgSdlsxi9j4K3nTA1al9L0Gqn9j1lgxA0uw0dH568UVvuKpHq9te0
 UP0cX6fCV7U8g==
Date: Thu, 15 Apr 2021 18:52:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20210415185214.01e1e64f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S2nGF_z4WmlMfPGsNq_GhQO";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/S2nGF_z4WmlMfPGsNq_GhQO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

In file included from include/linux/device.h:15,
                 from arch/powerpc/include/asm/io.h:27,
                 from include/linux/io.h:13,
                 from include/linux/irq.h:20,
                 from arch/powerpc/include/asm/hardirq.h:6,
                 from include/linux/hardirq.h:11,
                 from include/linux/highmem.h:10,
                 from include/linux/bio.h:8,
                 from include/linux/libnvdimm.h:14,
                 from arch/powerpc/platforms/pseries/papr_scm.c:12:
arch/powerpc/platforms/pseries/papr_scm.c: In function 'papr_scm_pmem_flush=
':
arch/powerpc/platforms/pseries/papr_scm.c:144:26: warning: format '%lld' ex=
pects argument of type 'long long int', but argument 3 has type 'long int' =
[-Wformat=3D]
  144 |   dev_err(&p->pdev->dev, "flush error: %lld", rc);
      |                          ^~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
arch/powerpc/platforms/pseries/papr_scm.c:144:3: note: in expansion of macr=
o 'dev_err'
  144 |   dev_err(&p->pdev->dev, "flush error: %lld", rc);
      |   ^~~~~~~
arch/powerpc/platforms/pseries/papr_scm.c:144:43: note: format string is de=
fined here
  144 |   dev_err(&p->pdev->dev, "flush error: %lld", rc);
      |                                        ~~~^
      |                                           |
      |                                           long long int
      |                                        %ld

Introduced by commit

  75b7c05ebf90 ("powerpc/papr_scm: Implement support for H_SCM_FLUSH hcall")

--=20
Cheers,
Stephen Rothwell

--Sig_/S2nGF_z4WmlMfPGsNq_GhQO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB3/r4ACgkQAVBC80lX
0GzHTQf/fKx+jXRlPW1AX2OiUn+d7JMj6eTElM/cuCdqNjO8RMmqrbh/MVl7UJ7G
WKy22wVfJp+d8gaJMmosAoNjCC8CPwYBgbjGrzQ8ipBRp9kguHl/er1jMusYAyvQ
dJ3DcV8BDhltacPQ8AFBChzw0tm7WfOQsfdMo00k+OMnQSrYIefEeaxSilpCgL6s
Af2mli1J1MjfnR6uqUpLgQyY6WM/9s+LFKhzrvWkdJhqVR9BUEwPA51XzU+RleLZ
KsrWHQW5mgaoLxzdr0zols3KvT8Rq3rzIZ2u7MsqCLKrng8lC4xDMRPz1wohfVBL
/WjL2J1eG9vys5Ts5vj8pVMmNpyj6g==
=KZQ0
-----END PGP SIGNATURE-----

--Sig_/S2nGF_z4WmlMfPGsNq_GhQO--
