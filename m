Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E13244FBE1B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 16:01:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcVrr0FMXz3bc1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 00:01:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UtcznHp0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcVrD25Qbz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 00:01:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UtcznHp0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KcVr6546cz4xNp;
 Tue, 12 Apr 2022 00:00:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649685654;
 bh=AQva3LGzA/kNJer8xsrTO+6jYvGlSHDw468EqjHaKvQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UtcznHp0sS65a9Ur9UC01Nk4MQcQo/ZpQi0udoGomdYdqQGUsf5RCuYd5PDx79tGa
 oTmerpcKNDOFEHSTun827imEhLZc79vU+KCjkrO9JOlr+htHPCFTHz7HHO/29V0HML
 CBMK+i/bO27sEE+/UzLGGFVZTGafTsoYChCIJhuzRqYN50lHaSbxzeBLKzGQePcHe8
 rycWyZ/0aaab2TTzbjqH6uaem1VoY+baJeBcL0UW3OjPN6Awosr2UZuEV+tvb6ST7q
 AUhFrGckPV5x005fUcd1q3xS8hBTYKUjG2jrEl8ZzzS59lxXVoMvXziP+mYI4feEId
 xz/88MvgvocUw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oscar Salvador <osalvador@suse.de>, Srikar Dronamraju
 <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/numa: Associate numa node to its cpu earlier
In-Reply-To: <YlPznpqqPTI/KFNV@localhost.localdomain>
References: <20220411074934.4632-1-osalvador@suse.de>
 <20220411085808.GH568950@linux.vnet.ibm.com>
 <YlPznpqqPTI/KFNV@localhost.localdomain>
Date: Tue, 12 Apr 2022 00:00:46 +1000
Message-ID: <87v8vf67ox.fsf@mpe.ellerman.id.au>
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
Cc: linux-mm@kvack.org, Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michal Hocko <mhocko@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Oscar Salvador <osalvador@suse.de> writes:
> On Mon, Apr 11, 2022 at 02:28:08PM +0530, Srikar Dronamraju wrote:
>> Given that my patch got accepted into powerpc tree
>> https://git.kernel.org/powerpc/c/e4ff77598a109bd36789ad5e80aba66fc53d0ffb
>> is now part of Linus tree, this line may need a slight tweak.
>
> Right.
>
> @Michael: Will you resolve the conflict, or you would rather want me to send
> v2 with the amendment?

I can resolve the conflict, it should be trivial. If there's any trouble
I'll let you know.

cheers
