Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 629372A62DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 12:06:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR3k13bcxzDqYn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 22:06:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR3gs3HTyzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 22:04:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=P120VnX3; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CR3gr4vkTz9sTL; Wed,  4 Nov 2020 22:04:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CR3gr39kVz9sTK;
 Wed,  4 Nov 2020 22:04:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604487864;
 bh=phfnyClVnFM/Mn8K1hyCeEY+8JtX8MY3JTdk7X3KCLw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=P120VnX3osPQxkjNVADsew6SzuCrgPLJB8YiOXaXOHF7uHqcBw72zDvJNRoA+W4Hl
 RpEj15tDcE8dcF7DEk+LXhFjQ0ogakddloBxGD5WPMQO3TwBKuN56hJyEI3p+wXU58
 +a0OeSaYreTs8JRKMYV1SKN7HybDm371pSggva57bNgtqTZmgZo5DRcZmvhPNpA1Nr
 hFb5BIsExXQIVyRt9+E5wrikMnD5VniP87pxo08R+zyqbozVyVhWeoceNidPzN/L9V
 dKTn5u+8CDHPP4os99tIxvyRf2O9T3WLWSnkcDKRESLvUrk25Zv2lqCsQn9p3Y8euQ
 qrKKG51RujKBA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc: Don't use asm goto for put_user() with GCC 4.9
In-Reply-To: <4fe837f8-ecae-f009-c193-8da386a70705@csgroup.eu>
References: <20201103132915.529337-1-mpe@ellerman.id.au>
 <4fe837f8-ecae-f009-c193-8da386a70705@csgroup.eu>
Date: Wed, 04 Nov 2020 22:04:23 +1100
Message-ID: <87tuu5tmbs.fsf@mpe.ellerman.id.au>
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
Cc: schwab@linux-m68k.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 03/11/2020 =C3=A0 14:29, Michael Ellerman a =C3=A9crit=C2=A0:
>> Andreas reported that commit ee0a49a6870e ("powerpc/uaccess: Switch
>> __put_user_size_allowed() to __put_user_asm_goto()") broke
>> CLONE_CHILD_SETTID.
>>=20
>> Further inspection showed that the put_user() in schedule_tail() was
>> missing entirely, the store not emitted by the compiler.
>>=20
>> Notice there are no stores other than to the stack. There should be a
>> stw in there for the store to current->set_child_tid.
>>=20
>> This is only seen with GCC 4.9 era compilers (tested with 4.9.3 and
>> 4.9.4), and only when CONFIG_PPC_KUAP is disabled.
>>=20
>> When CONFIG_PPC_KUAP=3Dy, the memory clobber that's part of the isync()
>> and mtspr() inlined via allow_user_access() seems to be enough to
>> avoid the bug.
>>=20
>> For now though let's just not use asm goto with GCC 4.9, to avoid this
>> bug and any other issues we haven't noticed yet. Possibly in future we
>> can find a smaller workaround.
>
> Is that https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D58670 ?
>
> Should we use asm_volatile_goto() defined in include/linux/compiler-gcc.h=
 ?

Ugh. I knew of that work around, but thought we'd dropped it when we
moved up to GCC 4.9. I should have looked more closely.

I'll send a patch to switch to it.

cheers
