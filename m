Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C128545B08F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 01:09:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzLw048bdz3058
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 11:09:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n2vjb7SM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzLvN2yRTz2xrm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 11:08:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=n2vjb7SM; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzLvJ1tJgz4xcK;
 Wed, 24 Nov 2021 11:08:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637712511;
 bh=b+NrS7PSaK12qZPeCb8kmME984XWQTgUeWmP6maiS1U=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=n2vjb7SM5nHA0GSsrLq9HxPEACt5ncS6LaVn5+urRDVD2kHVMG7T1iGcCTTt+//3b
 D6Q1R2KsmGqmyjgyngpQ+bzqC6eR8SYTGM3YnYchp1ZBKt0hQUSbyrKOzGjUmb6+cz
 Pu2OnyuxREQ7omDKIB8ExvyipPAl21W63E7cxSgLNnYxD2xZiZG69FX8LjQN8cMI3s
 eY1HRsKOhRYddptzHjctNEx92inw14ObI8OjNQKiZqozjQKZrD5l6UQTjf35+OsedJ
 QZoFlcTMOzNuPtXZDnk5ZvK+p1YiK7EdQNwq3TWu9NFExVAjuzkRCqrmUE3gtMTAUO
 i9Bnllv5IiW3A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] powerpc/signal32: Use struct_group() to zero spe regs
In-Reply-To: <202111221247.B385EA2A8@keescook>
References: <20211118203604.1288379-1-keescook@chromium.org>
 <1e312cbd-cd52-ddce-f839-db765173c526@csgroup.eu>
 <87ilwkrbhz.fsf@mpe.ellerman.id.au> <202111221247.B385EA2A8@keescook>
Date: Wed, 24 Nov 2021 11:08:25 +1100
Message-ID: <8735nmquti.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> On Mon, Nov 22, 2021 at 04:43:36PM +1100, Michael Ellerman wrote:
>> LEROY Christophe <christophe.leroy@csgroup.eu> writes:
>> > Le 18/11/2021 =C3=A0 21:36, Kees Cook a =C3=A9crit=C2=A0:
>> >> In preparation for FORTIFY_SOURCE performing compile-time and run-time
>> >> field bounds checking for memset(), avoid intentionally writing across
>> >> neighboring fields.
>> >>=20
>> >> Add a struct_group() for the spe registers so that memset() can corre=
ctly reason
>> >> about the size:
>> >>=20
>> >>     In function 'fortify_memset_chk',
>> >>         inlined from 'restore_user_regs.part.0' at arch/powerpc/kerne=
l/signal_32.c:539:3:
>> >>     >> include/linux/fortify-string.h:195:4: error: call to '__write_=
overflow_field' declared with attribute warning: detected write beyond size=
 of field (1st parameter); maybe use struct_group()? [-Werror=3Dattribute-w=
arning]
>> >>       195 |    __write_overflow_field();
>> >>           |    ^~~~~~~~~~~~~~~~~~~~~~~~
>> >>=20
>> >> Reported-by: kernel test robot <lkp@intel.com>
>> >> Signed-off-by: Kees Cook <keescook@chromium.org>
>> >
>> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>=20
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Thanks! Should I take this via my tree, or do you want to take it via
> ppc?

I don't mind. If it's easier for you to take it as part of an existing
series then do that, otherwise I can pick it up.

cheers
