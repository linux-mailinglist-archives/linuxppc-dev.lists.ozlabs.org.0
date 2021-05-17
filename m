Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A99393823E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 07:58:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk7jC2PlZz308t
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 15:58:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GDCBgC/D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GDCBgC/D; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk7hk5sWfz2xvT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 15:57:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fk7hc0mXSz9sV5;
 Mon, 17 May 2021 15:57:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621231073;
 bh=23IxQnM2rd7cPGZcKn0tcckrg/JRDK/oIHWajK2PHyI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GDCBgC/Dg+s41CCHmGYd+4n2TML+KIXYY2kyYsBVxK1131LyXmhlErOx6xeYg2C8y
 Ul1yT3LuFEmFNLtn1XO0PfDM47geet4+mfJLLv1Aidqmhrs3VNoiXjUKwkYHZNYfWR
 qb90ygKHiqs0wkwSXFPjOvC+fi0e8BCCOCv5j7y9goAhbXm1mYV7I8BDUhk6FnP1Fs
 h9ujBu1ezavkfdOPYnEIWWOO8t8fF1PWNKwSxfhllkJvH9F6xpGm+YrthwgCBZ+giA
 nbhgIyXtgOy4Hof8EBfqaivhYgNPImd8SBiMkU0YD8MwGISrKJLtAdYJy/Hno9eO9g
 Q+NvyZeQuuCNg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Wan Jiabing <wanjiabing@vivo.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Shuah Khan
 <shuah@kernel.org>, Jordan Niethe <jniethe5@gmail.com>, Michael Neuling
 <mikey@neuling.org>, Wan Jiabing <wanjiabing@vivo.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] selftests: powerpc: Remove unneeded variables
In-Reply-To: <20210412125746.2766-1-wanjiabing@vivo.com>
References: <20210412125746.2766-1-wanjiabing@vivo.com>
Date: Mon, 17 May 2021 15:57:48 +1000
Message-ID: <87r1i5kilf.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wan Jiabing <wanjiabing@vivo.com> writes:
> Fix coccicheck warning:
>
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:539:5-7:
> Unneeded variable: "rc". Return "0" on line 562
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:567:5-7:
> Unneeded variable: "rc". Return "0" on line 580
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:585:5-7:
> Unneeded variable: "rc". Return "0" on line 594
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:600:5-7:
> Unneeded variable: "rc". Return "0" on line 611
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:416:5-7:
> Unneeded variable: "rc". Return "0" on line 470
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:475:5-7:
> Unneeded variable: "rc". Return "0" on line 485
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:490:5-7:
> Unneeded variable: "rc". Return "0" on line 506
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:511:5-7:
> Unneeded variable: "rc". Return "0" on line 534
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:331:5-7:
> Unneeded variable: "rc". Return "0" on line 344
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:349:5-7:
> Unneeded variable: "rc". Return "0" on line 360
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:365:5-7:
> Unneeded variable: "rc". Return "0" on line 392
> ./tools/testing/selftests/powerpc/alignment/alignment_handler.c:397:5-7:
> Unneeded variable: "rc". Return "0" on line 411
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
> Changelog:
> v2:
> - Modify the subject line.
> ---
>  .../powerpc/alignment/alignment_handler.c     | 48 +++++--------------
>  1 file changed, 12 insertions(+), 36 deletions(-)

This breaks the build. Please don't send selftest patches you haven't
even build tested.

cheers


powerpc64le-linux-gnu-gcc -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"v5.13-rc2-30-g0510571fcf78"' -I/linux/tools/testing/selftests/powerpc/include     alignment_handler.c ../harness.c ../utils.c  -o /output/kselftest/powerpc/alignment/alignment_handler
alignment_handler.c: In function 'test_alignment_handler_vsx_206':
alignment_handler.c:93:2: error: 'rc' undeclared (first use in this function)
   93 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:106:33: note: in expansion of macro 'TEST'
  106 | #define LOAD_VSX_XFORM_TEST(op) TEST(op, op, stxvd2x, XFORM, 32, 32)
      |                                 ^~~~
alignment_handler.c:326:2: note: in expansion of macro 'LOAD_VSX_XFORM_TEST'
  326 |  LOAD_VSX_XFORM_TEST(lxvd2x);
      |  ^~~~~~~~~~~~~~~~~~~
alignment_handler.c:93:2: note: each undeclared identifier is reported only once for each function it appears in
   93 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:106:33: note: in expansion of macro 'TEST'
  106 | #define LOAD_VSX_XFORM_TEST(op) TEST(op, op, stxvd2x, XFORM, 32, 32)
      |                                 ^~~~
alignment_handler.c:326:2: note: in expansion of macro 'LOAD_VSX_XFORM_TEST'
  326 |  LOAD_VSX_XFORM_TEST(lxvd2x);
      |  ^~~~~~~~~~~~~~~~~~~
alignment_handler.c: In function 'test_alignment_handler_vsx_207':
alignment_handler.c:93:2: error: 'rc' undeclared (first use in this function)
   93 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:106:33: note: in expansion of macro 'TEST'
  106 | #define LOAD_VSX_XFORM_TEST(op) TEST(op, op, stxvd2x, XFORM, 32, 32)
      |                                 ^~~~
alignment_handler.c:342:2: note: in expansion of macro 'LOAD_VSX_XFORM_TEST'
  342 |  LOAD_VSX_XFORM_TEST(lxsspx);
      |  ^~~~~~~~~~~~~~~~~~~
alignment_handler.c: In function 'test_alignment_handler_vsx_300':
alignment_handler.c:93:2: error: 'rc' undeclared (first use in this function)
   93 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:112:33: note: in expansion of macro 'TEST'
  112 | #define LOAD_VMX_DFORM_TEST(op) TEST(op, op, stxv, DFORM, 0, 32)
      |                                 ^~~~
alignment_handler.c:356:2: note: in expansion of macro 'LOAD_VMX_DFORM_TEST'
  356 |  LOAD_VMX_DFORM_TEST(lxsd);
      |  ^~~~~~~~~~~~~~~~~~~
alignment_handler.c: In function 'test_alignment_handler_vsx_prefix':
alignment_handler.c:104:2: error: 'rc' undeclared (first use in this function)
  104 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:134:44: note: in expansion of macro 'TESTP'
  134 | #define LOAD_VSX_8LS_PREFIX_TEST(op, tail) TESTP(op, op, PSTXV ## tail, 0, 32)
      |                                            ^~~~~
alignment_handler.c:386:2: note: in expansion of macro 'LOAD_VSX_8LS_PREFIX_TEST'
  386 |  LOAD_VSX_8LS_PREFIX_TEST(PLXSD, 0);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
alignment_handler.c: In function 'test_alignment_handler_integer':
alignment_handler.c:93:2: error: 'rc' undeclared (first use in this function)
   93 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:117:29: note: in expansion of macro 'TEST'
  117 | #define LOAD_DFORM_TEST(op) TEST(op, op, std, DFORM, 31, 31)
      |                             ^~~~
alignment_handler.c:402:2: note: in expansion of macro 'LOAD_DFORM_TEST'
  402 |  LOAD_DFORM_TEST(lbz);
      |  ^~~~~~~~~~~~~~~
alignment_handler.c: In function 'test_alignment_handler_integer_206':
alignment_handler.c:93:2: error: 'rc' undeclared (first use in this function)
   93 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:115:29: note: in expansion of macro 'TEST'
  115 | #define LOAD_XFORM_TEST(op) TEST(op, op, stdx, XFORM, 31, 31)
      |                             ^~~~
alignment_handler.c:461:2: note: in expansion of macro 'LOAD_XFORM_TEST'
  461 |  LOAD_XFORM_TEST(ldbrx);
      |  ^~~~~~~~~~~~~~~
alignment_handler.c: In function 'test_alignment_handler_integer_prefix':
alignment_handler.c:104:2: error: 'rc' undeclared (first use in this function)
  104 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:125:34: note: in expansion of macro 'TESTP'
  125 | #define LOAD_MLS_PREFIX_TEST(op) TESTP(op, op, PSTD, 31, 31)
      |                                  ^~~~~
alignment_handler.c:473:2: note: in expansion of macro 'LOAD_MLS_PREFIX_TEST'
  473 |  LOAD_MLS_PREFIX_TEST(PLBZ);
      |  ^~~~~~~~~~~~~~~~~~~~
alignment_handler.c: In function 'test_alignment_handler_vmx':
alignment_handler.c:93:2: error: 'rc' undeclared (first use in this function)
   93 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:110:33: note: in expansion of macro 'TEST'
  110 | #define LOAD_VMX_XFORM_TEST(op) TEST(op, op, stxvd2x, XFORM, 0, 32)
      |                                 ^~~~
alignment_handler.c:492:2: note: in expansion of macro 'LOAD_VMX_XFORM_TEST'
  492 |  LOAD_VMX_XFORM_TEST(lvx);
      |  ^~~~~~~~~~~~~~~~~~~
alignment_handler.c: In function 'test_alignment_handler_fp':
alignment_handler.c:93:2: error: 'rc' undeclared (first use in this function)
   93 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:120:36: note: in expansion of macro 'TEST'
  120 | #define LOAD_FLOAT_DFORM_TEST(op)  TEST(op, op, stfd, DFORM, 0, 0)
      |                                    ^~~~
alignment_handler.c:517:2: note: in expansion of macro 'LOAD_FLOAT_DFORM_TEST'
  517 |  LOAD_FLOAT_DFORM_TEST(lfd);
      |  ^~~~~~~~~~~~~~~~~~~~~
alignment_handler.c: In function 'test_alignment_handler_fp_205':
alignment_handler.c:93:2: error: 'rc' undeclared (first use in this function)
   93 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:120:36: note: in expansion of macro 'TEST'
  120 | #define LOAD_FLOAT_DFORM_TEST(op)  TEST(op, op, stfd, DFORM, 0, 0)
      |                                    ^~~~
alignment_handler.c:545:2: note: in expansion of macro 'LOAD_FLOAT_DFORM_TEST'
  545 |  LOAD_FLOAT_DFORM_TEST(lfdp);
      |  ^~~~~~~~~~~~~~~~~~~~~
alignment_handler.c: In function 'test_alignment_handler_fp_206':
alignment_handler.c:93:2: error: 'rc' undeclared (first use in this function)
   93 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:122:36: note: in expansion of macro 'TEST'
  122 | #define LOAD_FLOAT_XFORM_TEST(op)  TEST(op, op, stfdx, XFORM, 0, 0)
      |                                    ^~~~
alignment_handler.c:561:2: note: in expansion of macro 'LOAD_FLOAT_XFORM_TEST'
  561 |  LOAD_FLOAT_XFORM_TEST(lfiwzx);
      |  ^~~~~~~~~~~~~~~~~~~~~
alignment_handler.c: In function 'test_alignment_handler_fp_prefix':
alignment_handler.c:93:2: error: 'rc' undeclared (first use in this function)
   93 |  rc |= do_test(#name, test_##name)
      |  ^~
alignment_handler.c:120:36: note: in expansion of macro 'TEST'
  120 | #define LOAD_FLOAT_DFORM_TEST(op)  TEST(op, op, stfd, DFORM, 0, 0)
      |                                    ^~~~
alignment_handler.c:573:2: note: in expansion of macro 'LOAD_FLOAT_DFORM_TEST'
  573 |  LOAD_FLOAT_DFORM_TEST(lfs);
      |  ^~~~~~~~~~~~~~~~~~~~~
make[2]: *** [../../lib.mk:144: /output/kselftest/powerpc/alignment/alignment_handler] Error 1
make[2]: Target 'all' not remade because of errors.
make[2]: Leaving directory '/linux/tools/testing/selftests/powerpc/alignment'
make[1]: *** [Makefile:41: alignment] Error 2
make[1]: Leaving directory '/linux/tools/testing/selftests/powerpc'
make: *** [Makefile:159: all] Error 2
