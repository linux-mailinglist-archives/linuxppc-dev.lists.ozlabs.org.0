Return-Path: <linuxppc-dev+bounces-15093-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D063ACE8276
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 21:42:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dg7SD2XSpz2xqj;
	Tue, 30 Dec 2025 07:42:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767040924;
	cv=none; b=VEIK/UHSMqUPF1+0HzFYkMhs4ZQxzA7alcBE+e/cVMAsF6a8mlS9DaOJKuY1WYp9V7TE8ijDENXDHcaiAsny0RMM+hGB7LqCTet6Kdpwaj4KYDyHndxqOxmkkDkJF6+IBqI6M1iEF6Ai0BodbJHNbnROWNGBsdkU3vf+EYOCy7EfCyuyJ/dQAPbb4jL7+URu8A/I0ssN+uNKvTHyKNw5yMX2MghJ1HXsOnfsRbl0JsG8l+m4U6Ya+prmW3NBEgLWyNLfAPZuJ9r6FOcgrlMHkgrNK7V/RWmyUz/Zr8FI3FByp67ABizDOX5oRlBBLwiIGahuGTuVFaEGI/kdtg5xVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767040924; c=relaxed/relaxed;
	bh=ZmZssKPM+S2HJhyKQHBY9PFi7F/yMdlrGGqCoMigMsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmCqJG1RgsMDsNS6mxI+ghC2wBUVhLqrcFYhCVfY21GDJ/FBA3W7c0SvxjG6RB4/M/bGYpn2aBPDt5+Zak0BXfqYj9kPt19OFORbQR+C1cjSwH20spX9sJAiW3b8wOrdCKsXJjsoXgsgGoawA4pdBT+OJkhKMOG33q/Pg0Ya782B+c90HgTc6f/2ndj/MlaDB6rRJ02HzABvjCSmC+xFWyG/DIIb70Y/9IRhi2HvRS/YnnSLkcSKKjV/Fkb0px+F8ufjuwmPpaZm4GorTQ3ordFvecQH7Kw1ecwitB+w6jfzwzdL7R6GW+qRTx3DNng7Fb2ZpXy0caDqzHbEsjz1Zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QSRG7hvx; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QSRG7hvx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dg7SC3pr6z2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Dec 2025 07:42:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAA664183E;
	Mon, 29 Dec 2025 20:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9322EC4CEF7;
	Mon, 29 Dec 2025 20:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767040890;
	bh=GZ+1KKfaWUAEcxuxIpgqLNo0r9p6egS5f7P9gKbzco0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSRG7hvxBwQ796IfjClt8gqnHeEg9FV3z8mjQpYJOHPTnhcOUr+/cnAT4eS+xWhcw
	 Ry/Yz2NJZ5DA5UhE7xlqILcigyZGgJoMpuIuB0HMrcb7Ey7m1vgaCm9xAfhtLSz4bn
	 sbTYmz31UIAeLJcFVaXN7OOZdttuepR+uxZUfFaBQo541btafW7mlmwhzqU1GM58MY
	 M1UJdK4hRPnph8apO7+VSUObxlZC5iMC2GiurW2KC0C0UTBxkCWb1C8TBghjVP78ye
	 lD82sIfiiyao8xdsYvHQc2rwHPPIbHwa6sC1CjLJJW0iqFCco3pfM0oBcDvtUsNP3Z
	 l3grsjsZqTnwg==
Date: Mon, 29 Dec 2025 15:41:29 -0500
From: Sasha Levin <sashal@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v7] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-ID: <aVLneaA6gaGUaBJS@laps>
References: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
 <20251228143533.33e2be2d6282d036f55e12cb@linux-foundation.org>
 <398ca47d-19d4-4b26-98db-2bf283b6b0cb@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <398ca47d-19d4-4b26-98db-2bf283b6b0cb@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 29, 2025 at 07:35:18PM +0100, Christophe Leroy (CS GROUP) wrote:
>
>
>Le 28/12/2025 à 23:35, Andrew Morton a écrit :
>>On Wed, 24 Dec 2025 17:25:24 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
>>
>>>Note for backporting: This fix is a partial retrieval of the commit
>>>mentioned in the Fixes tag. It is only valid once the change referenced
>>>by the Depends-on tag is present. When backporting this patch, the
>>>commit mentioned in the Depends-on tag must be included first.
>>>
>>>Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20250121150419.1342794-1-sourabhjain%40linux.ibm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C93a8f925fc024ff9c3fe08de46616c3b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639025581404027066%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3iVUdaMBWhExKkDiV%2BBfYufPTKva1dVikhyQShOq7mc%3D&reserved=0 [1]
>>>Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20250128043358.163372-1-sourabhjain%40linux.ibm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C93a8f925fc024ff9c3fe08de46616c3b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639025581404053206%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=GamDe2R87SdpFurnj9Cmt9wOQtkGLgIO1z7nl5QPxgY%3D&reserved=0 [2]
>>>Fixes: c2833a5bf75b ("hugetlbfs: fix changes to command line processing")
>>>Depends-on: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early")
>>
>>This will be the first "Depends-on:" in history.  Which is a hint that
>>we're doing something wrong.  This innovation will surely fool any
>>downstream automation.  Let's use existing tools if possible.
>
>What do you mean by "first in history" ? Do you mean it's never been 
>used before ? As far as I can see it has been used several times 
>already. First one was in 2014 with commit a0855054e59b ("iwlwifi: 
>dvm: drop non VO frames when flushing")
>
>Sasha, do tools use it ?

The standard way to annotate dependencies is outlined in the docs:

   To send additional instructions to the stable team, use a shell-style inline comment to pass arbitrary or predefined notes:

   Specify any additional patch prerequisites for cherry picking:

   Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
   Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
   Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
   Cc: <stable@vger.kernel.org> # 3.3.x
   Signed-off-by: Ingo Molnar <mingo@elte.hu>

   The tag sequence has the meaning of:

   git cherry-pick a1f84a3
   git cherry-pick 1b9508f
   git cherry-pick fd21073
   git cherry-pick <this commit>

My tools don't look at Depends-on: and I don't think that Greg's tools do that
either.

-- 
Thanks,
Sasha

