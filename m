Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 684F42A46C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 14:47:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQWLr43jVzDqkP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 00:47:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQVms5ZdQzDqDq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 00:21:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QsyOdLU8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQVmq12kQz9sVK;
 Wed,  4 Nov 2020 00:21:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604409707;
 bh=MYU/GYY7WjVexPVFkQjnwSJPt6lSEwILNYT0f9czXic=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QsyOdLU8adwVcT8UXmok40+HZGKDVAJxNBuEZyOMHRguFeBnxFXHjqdOHTKaffzfS
 wdeFcw9uRV+38twP0uAPQLraN5Zp6zBx2hCo9GY68ewshFt3+2KqbPlDO/mDE0Kaqa
 EWI8MYDfDuNxBRAAGYFa8JAJd2AHRTqdmEwIyv0LsoB0LDNmS1MhMfqa9t1DXbt9Wh
 oKS/hzSsPavOyqGB+RqJN4UXzDHa28vADzT3beGbYUO66JOwCwB6oYLyYKMwcBu/Bz
 ZeChRJ2wt/RymbPo471jHnfIQplSkHegyyBoijeIvl24k21fMgeediCcNj/HrBT+rn
 z9PnukoBH6xtQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH 1/3] powerpc/uaccess: Switch __put_user_size_allowed() to
 __put_user_asm_goto()
In-Reply-To: <871rhgwzcg.fsf@igel.home>
References: <94ba5a5138f99522e1562dbcdb38d31aa790dc89.1599216721.git.christophe.leroy__44535.5968013004$1599217383$gmane$org@csgroup.eu>
 <87mu079ron.fsf@igel.home> <87imav9r64.fsf@igel.home>
 <87pn53vsep.fsf@mpe.ellerman.id.au> <871rhgwzcg.fsf@igel.home>
Date: Wed, 04 Nov 2020 00:21:44 +1100
Message-ID: <875z6mvamv.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andreas Schwab <schwab@linux-m68k.org> writes:
> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/powerpc 5.10.0-rc1 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT="gcc-4.9 (SUSE Linux) 4.9.3"

So it seems to be a combination of GCC 4.9 and ...

> # CONFIG_PPC_RADIX_MMU is not set

That ^, which specifically causes PPC_KUAP=n.

When PPC_KUAP=y allow_user_access() inlines an isync and mtspr, both of
which contain a memory clobber, and that seems to hide the bug.

I think for now we just have to stop using asm goto for put_user() on
GCC 4.9.

I'll send a patch for that.

cheers
