Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3581FC240
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 01:22:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mkks1R49zDr1c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 09:22:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mkj75jq1zDqsj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 09:21:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TjLBhP6F; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49mkj62czzz9sRR;
 Wed, 17 Jun 2020 09:21:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592349675;
 bh=YglC3d1qIVwIT/vjXu+XckyVGaLr6tr684jtKcQd7wA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TjLBhP6F5nvAq3REnn28vPAfAN4v2wNRC3IswZSOd3M1v2oMLUr3ZaarOk/kGkbNe
 l2bXoy7UF17GYKU2mlwqnp3A3sJGbG69OHzkz9w4kk9DKZrGXU3iRShzRVFHnw36Kc
 mlXGwtKpTsiUvUPcXeTZ/OH288mn4G1fwqul/FaDegm2WRnMaxF58Hs4pWGuM53BCx
 kbDgoRiGGj0QirPmEdKWaFCoYE+6QuWoHcp++BilPwisIW/Ss3Hqh9cmqu1R88H2Ne
 UHpEVFkkOZbaao2+YIa/+rvxgw7yOfB+lMNLRib3Za/8phJL6Y13Y8EbdWImFgTtit
 c//M/lvPC+WIQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] powerpc/8xx: use pmd_off() to access a PMD entry in
 pte_update()
In-Reply-To: <20200616124304.bbe36933fcd48c5f467f4be9@linux-foundation.org>
References: <20200615092229.23142-1-rppt@kernel.org>
 <20200616124304.bbe36933fcd48c5f467f4be9@linux-foundation.org>
Date: Wed, 17 Jun 2020 09:21:42 +1000
Message-ID: <87o8piegvt.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Morton <akpm@linux-foundation.org> writes:
> On Mon, 15 Jun 2020 12:22:29 +0300 Mike Rapoport <rppt@kernel.org> wrote:
>
>> From: Mike Rapoport <rppt@linux.ibm.com>
>> 
>> The pte_update() implementation for PPC_8xx unfolds page table from the PGD
>> level to access a PMD entry. Since 8xx has only 2-level page table this can
>> be simplified with pmd_off() shortcut.
>> 
>> Replace explicit unfolding with pmd_off() and drop defines of pgd_index()
>> and pgd_offset() that are no longer needed.
>> 
>> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>> ---
>> 
>> I think it's powerpc material, but I won't mind if Andrew picks it up :)
>
> Via the powerpc tree would be better, please.

I'll take it into next for v5.9, unless there's a reason it needs to go
into v5.8.

cheers
