Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38716154F4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 22:37:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yZLH48t0zDqKT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 06:37:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yZJd0lQXzDqGx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 06:36:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="NAzwDe1P"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44yZJb1RGzz9s6w;
 Tue,  7 May 2019 06:36:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1557174975;
 bh=yRboxG6cZAjeUj189gOH45xKEr3blFB/J/AR8hpVvHc=;
 h=Date:From:To:Cc:Subject:From;
 b=NAzwDe1PT944tDLSw4XPcGtn1GQM2Qeit+2VFWb3heqvpDHXB6s/sHshb3WqZv1Q9
 5rxjm4pivsm3e0ccQwrYErYRJbswIWcSdMS++XnVBv+2lIgDGPl6NLTZ1qtjhXBA//
 hi5knqrTWkjdWRFin4nFbH1Z+abpGXZdkkbLtEY0qVo4oTg+7FBlcWqeGIfqq3fGLb
 1TIC97ra3Wk5ZMEXiW8ZHNiCtKGq61ir/rfDJosbg5RnJ/O9+nteTd5ggHgAwKom/O
 fkMwkiDtbi6ardu2of3j8vHiVfze1YeKzl2goflqdtumYu2PcePD7nQA8j8dZLbrCk
 IDPRCcvVOxGHw==
Date: Tue, 7 May 2019 06:35:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: Signed-off-by missing for commit in the powerpc tree
Message-ID: <20190507063559.4922971c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vzW+/dFCG.78gfMV2QMIxFu"; protocol="application/pgp-signature"
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/vzW+/dFCG.78gfMV2QMIxFu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  04a1942933ce ("powerpc/mm: Fix hugetlb page initialization")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/vzW+/dFCG.78gfMV2QMIxFu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzQmq8ACgkQAVBC80lX
0GwBxAf9Hi/CMUKMMo2Kt71IgUgPJ33Fa67pr2leR6MdL4qYbBfo4oXcSlO2AI+m
GJBmhBEz0ozzZpDwLpHc4eIm62P7COZ1bAUQZ/Q2GAm04UUU/3hHeoQbBaRj1DYE
FzPnaW1bx0mBkS5f5mgJq8zGEO5DFoBinXpy/r514jZ4THJjo81GSB3wnhJf2ZU8
BaxbIXmCit+aHrcRQTfn6qBrcTUJ8XqLdjyG4WkEineIXtoRzU9TLocaPNGbM89O
fQ2H81T+yIM5LFC9ITBzNUm6ZfwpeG79hKNoTxHRlCa4PaP72URTbUaeYO5MflXU
MMvGD07VdnDRFWoGaTy4CANhH1LQJg==
=K3O/
-----END PGP SIGNATURE-----

--Sig_/vzW+/dFCG.78gfMV2QMIxFu--
