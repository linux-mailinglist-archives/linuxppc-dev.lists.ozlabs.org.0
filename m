Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2928703DC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 15:19:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q4XVbJKI;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/E9Ixk3T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpLR81Kj9z3vZR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 01:19:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q4XVbJKI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/E9Ixk3T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpLQN12W6z3dSV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 01:18:20 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709561882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wysMqA0NcoiYhrn6zwI2/1l5OR37mkkdjVbQDIWLhJM=;
	b=Q4XVbJKI0UeZ2ox3dwMrnDmR9kvuSdrVODv8vRY5YxPD4lNIPCjh375lBdUCzRU16Juzmo
	ZQHBL4rL2UIXecTtKvcqG6D9bSjxHvRCHrmbKRW+IFSDBrMrXmbOwlanOwbrNfmTA7W7pi
	egzTkKxTvNPZD5iBdRwbOBaOHBbvZ8w+BNuzbS9KMx3XLO775GRSjwFZAwi7FqgCsEDtaa
	H3+ZzLAxasgDjXOAKM3MRdwACbGVRaZp37iav93FT33FFyXODLMv7kQP/gMdhu95SXfSwQ
	SU72WyXcYsSaUMb9j3GTYQnFZjM/lHmELdZIcGvose1c+0b1G5ikrR36pEqZsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709561882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wysMqA0NcoiYhrn6zwI2/1l5OR37mkkdjVbQDIWLhJM=;
	b=/E9Ixk3TcwCiCBU07OgV3zyAp4HZIgJkO3N2kijNmrs9snwZY7MZaOFkzg7GcOh+iMsA2S
	8jOUaCWik+jq8/Cg==
To: peterx@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] mm/x86: Drop two unnecessary pud_leaf() definitions
In-Reply-To: <20240229084258.599774-5-peterx@redhat.com>
References: <20240229084258.599774-1-peterx@redhat.com>
 <20240229084258.599774-5-peterx@redhat.com>
Date: Mon, 04 Mar 2024 15:18:01 +0100
Message-ID: <8734t6w06e.ffs@tglx>
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A
 . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29 2024 at 16:42, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
>
> pud_leaf() has a fallback macro defined in include/linux/pgtable.h already.
> Drop the extra two for x86.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Signed-off-by: Peter Xu <peterx@redhat.com>

Acked-by: Thomas Gleixner <tglx@linutronix.de>
