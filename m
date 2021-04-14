Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB3035FE80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 01:36:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLJld5784z30B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 09:36:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=YhIim8AA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=YhIim8AA; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLJlG139jz2yyP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 09:36:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLJl50pM3z9sRR;
 Thu, 15 Apr 2021 09:36:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1618443377;
 bh=kfv+xc09MV9UVzqaFbOAn65ue91Hf1emN1/qTLwxKdM=;
 h=Date:From:To:Cc:Subject:From;
 b=YhIim8AAlSmF8+j9nPRKATlo2BKNKyfUfX6ZBDbpKPeV4AIC4gcPl/wx9SBLb4Sm0
 qlZH4554zOwQ6dISjGAJw30FAOSfRcZWVcEDnhJVgfv3L8cBJTMf4pxG1x3byXJDri
 oCqfDM8QKcDSkzqQN3s4TyFGkfME3Ys3onLQMi64JPya5ZfHWq0mnLAKpLAuKQng52
 3exst+c3H2ZXSvRZKGCj/dosrATEzPpw2FmrkFs2HWTexUijoscQiBJNJfq13gGSHU
 uOzGlR7h359puDdq5U12yRUleekMrWV9pjIokUD2J8kaBeapfdldWUc8ISR4CPkrlO
 S3GVJBuk2vOqA==
Date: Thu, 15 Apr 2021 09:36:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20210415093616.02468ba4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S0UeJ6AcnQylsDPmEgAB3Vr";
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
Cc: Yu Kuai <yukuai3@huawei.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/S0UeJ6AcnQylsDPmEgAB3Vr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/macintosh/via-pmu.c:190:12: warning: '__fake_sleep' defined but not=
 used [-Wunused-variable]
  190 | static int __fake_sleep;
      |            ^~~~~~~~~~~~

Introduced by commit

  95d143923379 ("macintosh/via-pmu: Make some symbols static")

--=20
Cheers,
Stephen Rothwell

--Sig_/S0UeJ6AcnQylsDPmEgAB3Vr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB3fHAACgkQAVBC80lX
0GwFhggAlMymVViwuP6aw0+tIpMCngJyp8gr9XP/RvT41vVkLWgu4E/kY8r1YZb2
jJN/w/zpvuAUzMzMr3yrCrv6iKyYsMVPBg1rJMo69JKuGoHA8VPNhcsrkpE779rP
N9bw1sufjxVxu6pm6bCoTsGTL0Ah9sRN4BSDBvD4DbSdtBnHqdjWSnBifP6Enna3
GAjW6Jkma5xQGcb4Eqj7JPbFn0JmKUvz59P9ysBOtpjEHaMMjKvqs8es7GGR5V0C
0RIralJRYOTigItYlAWLr9TfwSouUXKCSqToT9Ub9DhicvW2zPnbDXXF9dPnuwKW
9wD9H4HMNCniYKRZ30F3bczIW9mNrQ==
=Zi9X
-----END PGP SIGNATURE-----

--Sig_/S0UeJ6AcnQylsDPmEgAB3Vr--
