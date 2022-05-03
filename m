Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4CA517B4C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 02:55:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KshN819V4z3bqK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 10:55:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O1zdwOEJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KshMY60tmz2x9W
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 10:55:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=O1zdwOEJ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KshMW1ynWz4ySt;
 Tue,  3 May 2022 10:55:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651539320;
 bh=p29tNGaP4EpEILmiRu4Z4n0ltWEjC3d9MdCzRfu+mUM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=O1zdwOEJ0FCCnukcj0ltjSls6Dw3oADinwE6kFFB0ja2+mnx4tTldekPz6Qk7aj9o
 H6kErInPyGtN8sONG45HXjGuGSIdEtgq5fxqhTyySVIstUMnU3rWYgL1ly8NOi0tIF
 3/dW2jyHvIDNIPTAk4/HLKMqIT1RVnIKBkELtAT2hVoy/KCKguB5vRhKwhaUggee6L
 5fraVac4QOzPHZYIxe55TCVHrbkPGqKJfSYHCK5nNKbf9LgFS2gHw1smvu+EdSS2re
 h8GJn0cTpolTGJ9BfyxB7vkNeZmtWPv3Zg00b2UPjleYYD+2K10MN6KAhCJIe9NZHa
 YlJlqa7uYoG+A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] POWERPC: idle: fix return value of __setup handler
In-Reply-To: <a3cb014d-96e0-c681-7347-a5c1d185d9fc@infradead.org>
References: <20220313065848.2150-1-rdunlap@infradead.org>
 <87r15c8439.fsf@mpe.ellerman.id.au>
 <a3cb014d-96e0-c681-7347-a5c1d185d9fc@infradead.org>
Date: Tue, 03 May 2022 10:55:15 +1000
Message-ID: <87zgjzv3ik.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, patches@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> On 5/2/22 06:19, Michael Ellerman wrote:
>> Randy Dunlap <rdunlap@infradead.org> writes:
>>> __setup() handlers should return 1 to obsolete_checksetup() in
>>> init/main.c to indicate that the boot option has been handled.
>>> A return of 0 causes the boot option/value to be listed as an Unknown
>>> kernel parameter and added to init's (limited) argument or environment
>>> strings. Also, error return codes don't mean anything to
>>> obsolete_checksetup() -- only non-zero (usually 1) or zero.
>>> So return 1 from powersave_off().
>>>
>>> Fixes: 302eca184fb8 ("[POWERPC] cell: use ppc_md->power_save instead of cbe_idle_loop")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> From: Igor Zhbanov <i.zhbanov@omprussia.ru>
>> 
>> What happened here? Is the patch actually from Igor? If so he should be
>> the author, and it should include his SoB shouldn't it?
>
> I don't know what happened. I did the patches.
> I'll resend them.

Thanks.

cheers
