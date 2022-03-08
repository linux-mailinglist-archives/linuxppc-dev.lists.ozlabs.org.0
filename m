Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2A4D15EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 12:12:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCXjD5pbwz3bcc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 22:12:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EEwodP8V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCXhd4Jv7z2xXd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 22:11:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EEwodP8V; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCXhf24X2z4xvN;
 Tue,  8 Mar 2022 22:11:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646737906;
 bh=iOnNOIqgLPTazq0S8O+41ZSz/Qp62x8qyJNjvWgvGLc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EEwodP8VRsJMZ4ffsI9EmVSQOs8C3WFFNy4JpJ6ZToIS0d6cxIC1Czn6mE6bo0br8
 arsIVqYL/xPOLwfAB7vNYXmexnJdv8b/68+doGciVv8nwb/zURT2fuW4gP3SP0Vee+
 Vpc4xOU9bKu9WdHhvT9gCzs2sj96SOVW3FPUfoGoBu6nYn8NpmL2D+tJxD7gysi8of
 NVzPZaNTWijzxT5IYegCP7NxggqUHAQ6IvOb4HPbNbieTHP6eExQsFmWMwfvmZf/Jz
 CaT1h8vA4elOL7fHFbFd771g/6/6oqC9JzXXrjx3Wv7Cu5gjDxu1MfGqB7gHggdUqI
 u6c4eutuIm0tA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v1 1/4] powerpc: Cleanup asm-prototypes.c
In-Reply-To: <d8a91ad9-328f-d0cb-1112-7ddccd8873d4@csgroup.eu>
References: <3ed660a585df2080ea8412ec20fbf652f5bf013a.1646413435.git.christophe.leroy@csgroup.eu>
 <d8a91ad9-328f-d0cb-1112-7ddccd8873d4@csgroup.eu>
Date: Tue, 08 Mar 2022 22:11:45 +1100
Message-ID: <87y21kn1fy.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 04/03/2022 =C3=A0 18:04, Christophe Leroy a =C3=A9crit=C2=A0:
>> Last call to sys_swapcontext() from ASM was removed by
>> commit fbcee2ebe8ed ("powerpc/32: Always save non volatile GPRs at
>> syscall entry")
>>=20
>> sys_debug_setcontext() prototype not needed anymore since
>> commit f3675644e172 ("powerpc/syscalls: signal_{32, 64} - switch
>> to SYSCALL_DEFINE")
>>=20
>> sys_switch_endian() prototype not needed anymore since
>> commit 81dac8177862 ("powerpc/64: Make sys_switch_endian() traceable")
>>=20
>> _mount() prototype is already in asm/ftrace.h
>>=20
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>
> I see this series in next-test branch.
>
> Can you #include <asm/ftrace.h> in asm/asm-prototypes.h so that=20
> _mcount() still gets versionned.

I just left the existing _mcount() prototype in asm-prototypes.h.

I've run that through some build tests, and want to push it for
tomorrow's next, so I'd rather not change it now.

Send me a follow-up patch to add the include of ftrace.h and drop the
_mcount() prototype.

cheers
