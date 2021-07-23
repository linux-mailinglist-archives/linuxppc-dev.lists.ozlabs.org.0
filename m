Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BB03D39EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 14:04:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWSg35VdPz3bVf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 22:04:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VunPNjPI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VunPNjPI; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWSfb0yCKz302M
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 22:04:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GWSfR5Vqtz9sXM;
 Fri, 23 Jul 2021 22:04:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1627041861;
 bh=WEE70A1SmlcnlIsv9nVnRGPp1lz7FMXEUMxrnsgf+IU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VunPNjPI5UTxmlZmtF6HnK+D0Dif1lwUaNWcXlVbCnOy3zlfgpBXZRcdGvCjeSpTD
 9GtJzMFZAjmswf1Hvf+Shhuu3DtNGBXMNTQoMka2kFXjYcF/zGbOVaCZOBpwbNaHMV
 epX/8JSDuS2F3jGKGPdB1wvzULNj0TkI4wo+Z5qZ8TF2KuuqLjMk0XTObjG1udah19
 U1CpdO9KIVSiwPBast1gIEWa3fuADmNkO9j6lepWMRmuG+MHxyeWmwMTljc1HY+qcN
 iPuTprU1H6rO2uX1bsNbdVNf6qs+BaSKB5njML9F9aEsaaPNMQrnX9vJgFwZ5rtJUH
 0p1oAfMTFZbgA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Will Deacon <will@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] Revert "mm/pgtable: add stubs for
 {pmd/pub}_{set/clear}_huge"
In-Reply-To: <162686329170.980657.905966885675716231.b4-ty@kernel.org>
References: <20210720202627.Horde.vlszNhxkKrLIg0-3Sn2ucw5@messagerie.c-s.fr>
 <87r1fs1762.fsf@mpe.ellerman.id.au>
 <162686329170.980657.905966885675716231.b4-ty@kernel.org>
Date: Fri, 23 Jul 2021 22:04:10 +1000
Message-ID: <87o8at1bk5.fsf@mpe.ellerman.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Will Deacon <will@kernel.org> writes:
> On Wed, 21 Jul 2021 17:02:13 +1000, Michael Ellerman wrote:
>> This reverts commit c742199a014de23ee92055c2473d91fe5561ffdf.
>> 
>> c742199a014d ("mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge")
>> breaks arm64 in at least two ways for configurations where PUD or PMD
>> folding occur:
>> 
>>   1. We no longer install huge-vmap mappings and silently fall back to
>>      page-granular entries, despite being able to install block entries
>>      at what is effectively the PGD level.
>> 
>> [...]
>
> Thank you Michael! I owe you a beer next time I see you, if we don't go
> extinct before then.

No worries, thanks to Christophe for identifying the solution while on
vacation!

Beers seem a long way off, but hopefully one day :)

cheers
