Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ED522DFBA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 16:42:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BF5HY2NDKzDrQ4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 00:42:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BF5D04dQRzDr7g
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 00:38:54 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BF5Cp1Ybsz9v1q9;
 Sun, 26 Jul 2020 16:38:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nwslpPgJ7u18; Sun, 26 Jul 2020 16:38:46 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BF5Cn6sbxz9v1pp;
 Sun, 26 Jul 2020 16:38:45 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 63A225D; Sun, 26 Jul 2020 16:40:09 +0200 (CEST)
Received: from 37-166-97-133.coucou-networks.fr
 (37-166-97-133.coucou-networks.fr [37.166.97.133]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Sun, 26 Jul 2020 16:40:09 +0200
Date: Sun, 26 Jul 2020 16:40:09 +0200
Message-ID: <20200726164009.Horde.J2bKDAPkYDkRMsx2Qnk8OQ8@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 5/5] selftests/powerpc: Add test for pkey siginfo
 verification
References: <cover.1594897099.git.sandipan@linux.ibm.com>
 <af137a935684955a60f13de2eb4ca358284f3d7c.1594897099.git.sandipan@linux.ibm.com>
 <87365egymc.fsf@mpe.ellerman.id.au>
In-Reply-To: <87365egymc.fsf@mpe.ellerman.id.au>
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
Cc: fweimer@redhat.com, aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com,
 Sandipan Das <sandipan@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:

> Sandipan Das <sandipan@linux.ibm.com> writes:
>> diff --git a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c=20=20
>>=20b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
>> new file mode 100644
>> index 0000000000000..58605c53d495d
>> --- /dev/null
>> +++ b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
>> @@ -0,0 +1,332 @@
> ...
>> +
>> +static void *protect(void *p)
>> +{
>> +	unsigned long rights;
>> +	unsigned int *base;
>> +	size_t size;
>> +	int tid, i;
>> +
>> +	tid =3D gettid();
>
> pkey_siginfo.c: In function 'protect':
> pkey_siginfo.c:103:8: error: implicit declaration of function=20=20
>=20'gettid' [-Werror=3Dimplicit-function-declaration]
>   tid =3D gettid();
>         ^
>
>
> On Ubuntu 18.04 at least.

See https://man7.org/linux/man-pages/man2/gettid.2.html

Added in glibc 2.30

Christophe
