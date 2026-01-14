Return-Path: <linuxppc-dev+bounces-15706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD42D1D923
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 10:35:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drgvB41xHz2xPB;
	Wed, 14 Jan 2026 20:35:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768383302;
	cv=none; b=kXXUsmk/qhSCyFsLAifK4387MotIeawihdx3THTjfBLx8DWXpdu7ktnXkIiNO0ImjH9hU59+FRp6es1zZIY/wD192kewRWN7n73XEN9hCZT15Lun7b5cAWw8SUrHsifNnD3znzIFAJ7Yyxd5rWXKBSzm6CNEsojqCdb/0yavvA758AA/lnHpPXcxolfIjCPaOiO/sgiK3jdScOd0lV9T9Pe2oSDL1ftScw6DMNTPLkCL7JnYUtBlzfkLz5ZhIKnajyE3lHMsllkzAs+WuXEhPuW2TStou4lrnyes9scjixgAfD6wAilm0J9zni9TN/m5veGTHW2pVH5RWOD3G/wvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768383302; c=relaxed/relaxed;
	bh=RiDCyIt20CzxUvCCc7yr/C6hAGxEwAzu+F3NvxFHJzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mx9OfgBsWuZ123gJqO0TwEgiOuu4BCsKgrU8NMU5/GzrWEC3MuuVXTnVPweBtSJW7GCzsWiHXbbJLLhf7r4YsO2haOHLIbK0cBoEtYLTi51EpUMTC3zXzOeTA2eWQlhRJZ21h/VXr8X8YHS13tBbgjuLT5ww0zg4BzGBQBJKvc3Ahyxtm0WDgIxatxWPEHj1eTu1UP66KjDq/JjUm5EgCTxaUj6IBt86PYicUiQ54LCMQA5cXzT6Es69va4I10y3PvK3bjrq/JPKDlAFYzvQ/997cPPEZxXgFqNJy1XL3hYlTJwWFvPJCecxupkV/6RT/qzuy70ye8DVsTpriawzEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dCAcobZU; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dCAcobZU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drgv92l2Fz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 20:35:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA5FE60051;
	Wed, 14 Jan 2026 09:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6688DC16AAE;
	Wed, 14 Jan 2026 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768383267;
	bh=QCqYpWqKWHECS6LyWQkRM/br5oR6fqyVbwR9TGBPsQQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dCAcobZU3its6pMbxAKLPlKnf/wW0ogAAk03gUzk3dw8FRsPXZFpmmIy7+o9BGUqD
	 J+ceWtm4YMlCe/qaxRhCRyHBnnAOmA/7+Gl3a8m2JY+a7jlbNtc2RTGbZEB74eJTUM
	 vrGuVLxUsxv/M7iH+cN8YOBwrGC+QdMGu/P5PKHt2QpgIIMlY/lFfHwECZWtY5xdO4
	 lKXaDrfvePUhs9pDAT4K54pWT3LSyfER9DAAzq2k9hZaymAZODYzMq3VJCwcOltetO
	 A1nX0qkMR5rZ7cTmg/kDcKnkJmYZuHNfJLLzTPQ8Z2oqNbAGs7nmoNYu1+xLpTSnO2
	 Y74paLEWIYJFQ==
Message-ID: <b6c39059-faed-41a8-80b2-addaa229c143@kernel.org>
Date: Wed, 14 Jan 2026 10:34:22 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
To: Andrew Donnellan <ajd@linux.ibm.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>,
 Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>,
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
 Andrew Donnellan <andrew+kernel@donnellan.id.au>,
 Srish Srinivasan <ssrish@linux.ibm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
 <CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
 <bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/01/2026 à 06:00, Andrew Donnellan a écrit :
> On Thu, 2025-12-18 at 12:55 -0500, Pasha Tatashin wrote:
>> Thank you. This series looks good to me.
> 
> Thanks for the review!
> 
> Maddy, Christophe: any further comments from the PPC side?

No further comments from my side.

> 
> Do we think we can get this in in the current cycle? My last day at IBM is this
> Friday, if a further respin is needed then Srish will need to handle it as I
> don't have any access to powerpc hardware outside of work (happy to provide what
> help I can from the outside though).
> 

What is the merge plan ? I see all powerpc commits are acked by Maddy, 
will the series be merged by Andrew into the mm tree ?

By the way it doesn't apply on top of powerpc/merge branch:

$ b4 shazam bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com
Grabbing thread from 
lore.kernel.org/all/bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 17 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 86 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v18 1/12] arm64/mm: Add addr parameter to __set_ptes_anysz()
     + Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> (✗ 
DKIM/soleen.com)
   ✓ [PATCH v18 2/12] arm64/mm: Add addr parameter to 
__ptep_get_and_clear_anysz()
     + Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> (✗ 
DKIM/soleen.com)
   ✓ [PATCH v18 3/12] mm/page_table_check: Reinstate address parameter 
in [__]page_table_check_pud[s]_set()
   ✓ [PATCH v18 4/12] mm/page_table_check: Reinstate address parameter 
in [__]page_table_check_pmd[s]_set()
   ✓ [PATCH v18 5/12] mm/page_table_check: Provide addr parameter to 
page_table_check_ptes_set()
   ✓ [PATCH v18 6/12] mm/page_table_check: Reinstate address parameter 
in [__]page_table_check_pud_clear()
   ✓ [PATCH v18 7/12] mm/page_table_check: Reinstate address parameter 
in [__]page_table_check_pmd_clear()
   ✓ [PATCH v18 8/12] mm/page_table_check: Reinstate address parameter 
in [__]page_table_check_pte_clear()
   ✓ [PATCH v18 9/12] mm: Provide address parameter to 
p{te,md,ud}_user_accessible_page()
   ✓ [PATCH v18 10/12] powerpc/mm: Implement *_user_accessible_page() 
for ptes
   ✓ [PATCH v18 11/12] powerpc/mm: Use set_pte_at_unchecked() for 
internal usages
   ✓ [PATCH v18 12/12] powerpc/mm: Support page table check
   ---
   ✓ Signed: DKIM/ibm.com (From: ajd@linux.ibm.com)
---
Total patches: 12
---
  Base: base-commit c224625ec6f8a0476ffffc09807f4d717ba9cc93 not known, 
ignoring
Application de  arm64/mm: Add addr parameter to __set_ptes_anysz()
Application de  arm64/mm: Add addr parameter to __ptep_get_and_clear_anysz()
Application de  mm/page_table_check: Reinstate address parameter in 
[__]page_table_check_pud[s]_set()
Application de  mm/page_table_check: Reinstate address parameter in 
[__]page_table_check_pmd[s]_set()
Application de  mm/page_table_check: Provide addr parameter to 
page_table_check_ptes_set()
Application de  mm/page_table_check: Reinstate address parameter in 
[__]page_table_check_pud_clear()
Application de  mm/page_table_check: Reinstate address parameter in 
[__]page_table_check_pmd_clear()
l'application de la rustine a échoué à 0007 mm/page_table_check: 
Reinstate address parameter in [__]page_table_check_pmd_clear()
erreur : l'application de la rustine a échoué : 
arch/riscv/include/asm/pgtable.h:999
erreur : arch/riscv/include/asm/pgtable.h : la rustine ne s'applique pas
astuce : Utilisez 'git am --show-current-patch=diff' pour visualiser la 
rustine en échec
astuce : Quand vous avez résolu ce problème, lancez "git am --continue".
astuce : Si vous préférez plutôt sauter cette rustine, lancez "git am 
--skip".
astuce : Pour restaurer la branche originale et arrêter d'appliquer des 
rustines, lancez "git am --abort".
astuce : Disable this message with "git config set advice.mergeConflict 
false"

Christophe

