Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8322845891D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 06:44:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyGRn0RFTz3bht
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 16:44:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O7qEx+nL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyGR438SFz2yMq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 16:43:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=O7qEx+nL; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HyGR213fVz4xbw;
 Mon, 22 Nov 2021 16:43:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637559823;
 bh=UCNCwUWVyyLhjFIpiDc0PavICxKjZDvBSXN4abRrYfk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=O7qEx+nL6V5nWOLcdA6PYMjxiiJNZqKsjbhTeX+h9yjGhFjFo8alAh3pzH+5FE67R
 RjNleoNHhsSxnvxOZHnFY9bXoikFyVVMDiBiJbrPiqWFbBKRDsb8vyjTKBecTcNHWp
 wJLDp+GZMh+RGb1LAKudMjr8u7Lb4ZkQ72Yi4QfZoavh/2TIAkOH2dxNfLgSP1J64G
 Vv4m0AXzENGOxsGtubLora73+zWztHDoDmiTBJmzbBKGI7/6C1d2IhfoZyf08T2fBv
 aAQn8yl3KqxvKzho2NS2xvd9qKg7je2CYfbhiSOMxilV2/NwW9LxMswAUHMBz6y9kw
 Gk6QUOZWql06Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: LEROY Christophe <christophe.leroy@csgroup.eu>, Kees Cook
 <keescook@chromium.org>
Subject: Re: [PATCH] powerpc/signal32: Use struct_group() to zero spe regs
In-Reply-To: <1e312cbd-cd52-ddce-f839-db765173c526@csgroup.eu>
References: <20211118203604.1288379-1-keescook@chromium.org>
 <1e312cbd-cd52-ddce-f839-db765173c526@csgroup.eu>
Date: Mon, 22 Nov 2021 16:43:36 +1100
Message-ID: <87ilwkrbhz.fsf@mpe.ellerman.id.au>
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
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LEROY Christophe <christophe.leroy@csgroup.eu> writes:
> Le 18/11/2021 =C3=A0 21:36, Kees Cook a =C3=A9crit=C2=A0:
>> In preparation for FORTIFY_SOURCE performing compile-time and run-time
>> field bounds checking for memset(), avoid intentionally writing across
>> neighboring fields.
>>=20
>> Add a struct_group() for the spe registers so that memset() can correctl=
y reason
>> about the size:
>>=20
>>     In function 'fortify_memset_chk',
>>         inlined from 'restore_user_regs.part.0' at arch/powerpc/kernel/s=
ignal_32.c:539:3:
>>     >> include/linux/fortify-string.h:195:4: error: call to '__write_ove=
rflow_field' declared with attribute warning: detected write beyond size of=
 field (1st parameter); maybe use struct_group()? [-Werror=3Dattribute-warn=
ing]
>>       195 |    __write_overflow_field();
>>           |    ^~~~~~~~~~~~~~~~~~~~~~~~
>>=20
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

> However, is it really worth adding that grouping ? Wouldn't it be=20
> cleaner to handle evr[] and acc separately ? Now that we are using=20
> unsafe variants of get/put user performance wouldn't be impacted.

Yeah I agree we should be able to do less of these multi-field copies
now that we have unsafe get/put user.

But I think that's an issue for another patch, Kees' patch is an
improvement, even if the code could be improved further in future.

Though TBH I'm not sure what the future of SPE support is. Both GCC and
glibc have dropped support for it, more than 2 years ago, so it's not
clear to me if we should continue to support it in the kernel much
longer.

cheers
