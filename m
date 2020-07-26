Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8022E36A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 01:54:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFKXx2shLzDqbh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:54:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFKW51ql1zDrfL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 09:52:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UN2ye0Jf; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFKW26sjVz9sPf;
 Mon, 27 Jul 2020 09:52:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595807567;
 bh=L3FrdqrfMnrXhYTMcd7BexhcWG0EvYoKRz9hDNG6rVI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UN2ye0Jf0n18emMA7+kSp+LWqVW79yByxgkKGqAMuFwmnV7XoRx1emjnW765QaqSl
 YmZJY+Lrf5jtBJRYP7TULXQR+Be6DiBiXe154BNearwT+uZZOtKMLyS81ZXkJEgtjD
 tr9GBocaWR4HPor1tLm5EUFnhOC3yy2csH3BAki5kg2zRI6UgIiXN99fs7ZUNXeW2j
 URB0DEGSjFYn+WY+XGvKTgDJEBVz1xCj/iWZzY6hKtMRMsjNawnNG7gI558V3EDXA5
 PHBoXVCRzN2nT2IL2x97AkmrOIgmRUv1AssBWylsmJprfbgV1+7iz1ob7lIBOiYqJO
 W81yfgga8Wdcg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 5/5] selftests/powerpc: Add test for pkey siginfo
 verification
In-Reply-To: <20200726164009.Horde.J2bKDAPkYDkRMsx2Qnk8OQ8@messagerie.si.c-s.fr>
References: <cover.1594897099.git.sandipan@linux.ibm.com>
 <af137a935684955a60f13de2eb4ca358284f3d7c.1594897099.git.sandipan@linux.ibm.com>
 <87365egymc.fsf@mpe.ellerman.id.au>
 <20200726164009.Horde.J2bKDAPkYDkRMsx2Qnk8OQ8@messagerie.si.c-s.fr>
Date: Mon, 27 Jul 2020 09:52:42 +1000
Message-ID: <87zh7lg7g5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: fweimer@redhat.com, aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com,
 Sandipan Das <sandipan@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:
>> Sandipan Das <sandipan@linux.ibm.com> writes:
>>> diff --git a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c=20=20
>>> b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
>>> new file mode 100644
>>> index 0000000000000..58605c53d495d
>>> --- /dev/null
>>> +++ b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
>>> @@ -0,0 +1,332 @@
>> ...
>>> +
>>> +static void *protect(void *p)
>>> +{
>>> +	unsigned long rights;
>>> +	unsigned int *base;
>>> +	size_t size;
>>> +	int tid, i;
>>> +
>>> +	tid =3D gettid();
>>
>> pkey_siginfo.c: In function 'protect':
>> pkey_siginfo.c:103:8: error: implicit declaration of function=20=20
>> 'gettid' [-Werror=3Dimplicit-function-declaration]
>>   tid =3D gettid();
>>         ^
>>
>>
>> On Ubuntu 18.04 at least.
>
> See https://man7.org/linux/man-pages/man2/gettid.2.html
>
> Added in glibc 2.30

Thanks, this seems to work:

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testin=
g/selftests/powerpc/include/utils.h
index 69d16875802d..71d2924f5b8b 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -42,6 +42,16 @@ int perf_event_enable(int fd);
 int perf_event_disable(int fd);
 int perf_event_reset(int fd);
=20
+#if !defined(__GLIBC_PREREQ) || !__GLIBC_PREREQ(2, 30)
+#include <unistd.h>
+#include <sys/syscall.h>
+
+static inline pid_t gettid(void)
+{
+	return syscall(SYS_gettid);
+}
+#endif
+
 static inline bool have_hwcap(unsigned long ftr)
 {
 	return ((unsigned long)get_auxv_entry(AT_HWCAP) & ftr) =3D=3D ftr;


cheers
