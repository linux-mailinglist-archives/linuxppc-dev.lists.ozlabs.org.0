Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D20044B6ACA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 12:27:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jyf2k2qqZz3cLN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 22:27:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=M5vUQHwI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jyf230fKbz30Ld
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 22:27:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=M5vUQHwI; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jyf1z0Wlgz4xcY;
 Tue, 15 Feb 2022 22:27:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644924423;
 bh=2bjEo/l1VuKsDDnpXHRYc8XcSJyXSTPJfQq6nV/jw5E=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=M5vUQHwI7ONB8kQMJ2wuRbKHkhWQnv9vfiQPxHQjVjnkycLnHlI60AS+hKyV0yFO9
 a/JDvNI9HrfJb/XGRVYj8rYKZZ/oUnBgy3sDzTxpuFxk2LHP7dReNi0dbOQ06aNMKZ
 BCxeS8wb2bhs3FOz6CvIS2a6TgbRPXtbuHY0YGWsoeWokXouX3GAIOWlUdjse87WrN
 W7EL7hEB14XBpCq8wvmtkT/d7butip3fEdhlj4X3Vsk3nqJSkJUNE95w/FHY3dPKao
 CoJR36nYvgRQGtHj5UaAmRA2bx2lE7yJ1c4QHG54XUPkZwaGTsYgIu0Tvhdc2GbryG
 3YwasqFGBQRuQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH] powerpc/module_64: use module_init_section instead of
 patching names
In-Reply-To: <CAMKQLN+Q3asVqP3MZVFZO66CvZVVfGOZn=pMXmiNqZ7t2i55wg@mail.gmail.com>
References: <20220202055123.2144842-1-wedsonaf@google.com>
 <CAMKQLN+Q3asVqP3MZVFZO66CvZVVfGOZn=pMXmiNqZ7t2i55wg@mail.gmail.com>
Date: Tue, 15 Feb 2022 22:27:02 +1100
Message-ID: <8735kknzeh.fsf@mpe.ellerman.id.au>
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wedson Almeida Filho <wedsonaf@google.com> writes:
> Hi Michael,
>
> On Wed, 2 Feb 2022 at 05:53, Wedson Almeida Filho <wedsonaf@google.com> wrote:
>>
>> Without this patch, module init sections are disabled by patching their
>> names in arch-specific code when they're loaded (which prevents code in
>> layout_sections from finding init sections). This patch uses the new
>> arch-specific module_init_section instead.
>>
>> This allows modules that have .init_array sections to have the
>> initialisers properly called (on load, before init). Without this patch,
>> the initialisers are not called because .init_array is renamed to
>> _init_array, and thus isn't found by code in find_module_sections().
>>
>> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
>> ---
>>  arch/powerpc/kernel/module_64.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
...
>
> Would any additional clarification from my part be helpful here?

Just more patience ;)

> I got an email saying it was under review (and checks passed) but
> nothing appears to have happened since.

I actually put it in next late last week, but the emails got delayed due
to various gremlins.

cheers
