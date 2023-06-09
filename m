Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3BC729B09
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 15:07:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd1ZF0V46z3fdw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 23:07:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YeKUQ/Bd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd1YL3vMtz3f0s
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 23:06:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YeKUQ/Bd;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qd1YJ2s0Tz4x3x;
	Fri,  9 Jun 2023 23:06:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686315972;
	bh=ZwdtArgZhBZiJXxJG3SFap/Lyw4wRqeEqOCi/Ko2N+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YeKUQ/BdMwGKCIH52MSQgeU3oixBIPV7DZy10o0jJ53/1rG/1MRuBgwM1Z44S+xBL
	 Hpny86yM/+VKCjyhjRtoCvCN8XbKkh4woU+s1GrHJbVm8RNh9vmGFJVQUGSHVN6FkD
	 TuV8uf5I5iZw/9dayZcbBc+d8P86iJ/Hlv5NAHgNYjjNBDbOeFBXvqEcr7JFmbtLmE
	 uoGd0EkNuEf2kOJUlRKs5TA4N2LVvhf1W4rzSeLlFgC/fjRj/mBe8EApzxq/0KeHwo
	 KGbJ5GvV3gFTf/74JWgMdw/C52Ke48rmrygu4J53JliPgsiEULWPDkvSgQ3nxg+up3
	 sruFt3Z+AzBqg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/signal32: Force inlining of
 __unsafe_save_user_regs() and save_tm_user_regs_unsafe()
In-Reply-To: <CT5FZBY14ZM4.OYXBJNXQU9A2@wheely>
References: <7e469c8f01860a69c1ada3ca6a5e2aa65f0f74b2.1685955220.git.christophe.leroy@csgroup.eu>
 <CT5FZBY14ZM4.OYXBJNXQU9A2@wheely>
Date: Fri, 09 Jun 2023 23:06:11 +1000
Message-ID: <874jnghjjw.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Mon Jun 5, 2023 at 6:58 PM AEST, Christophe Leroy wrote:
>> Looking at generated code for handle_signal32() shows calls to a
>> function called __unsafe_save_user_regs.constprop.0 while user access
>> is open.
>>
>> And that __unsafe_save_user_regs.constprop.0 function has two nops at
>> the begining, allowing it to be traced, which is unexpected during
>> user access open window.
>>
>> The solution could be to mark __unsafe_save_user_regs() no trace, but
>> to be on the safe side the most efficient is to flag it __always_inline
>> as already done for function __unsafe_restore_general_regs(). The
>> function is relatively small and only called twice, so the size
>> increase will remain in the noise.
>>
>> Do the same with save_tm_user_regs_unsafe() as it may suffer the
>> same issue.
>
> Could you put a comment so someone doesn't uninline it later?

I think the "unsafe" in the name is probably sufficient to warn people
off, but you never know. Still I'd happily take a patch to add comments :)

> Marking it notrace as well would be sufficient for a comment, if that works.

I nearly did that when applying, but I'm not sure it won't change the
code generation, so I left it as-is.

cheers
