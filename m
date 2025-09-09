Return-Path: <linuxppc-dev+bounces-11898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF1EB49F0A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 04:16:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLS9Q6Cz4z302g;
	Tue,  9 Sep 2025 12:16:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757384170;
	cv=none; b=W/1Ojvlv2a1wQqG1TEsTgM6jMOOdLOTvyzuyXJ/tfwP15WNRMnGR9dhuszhriCCfZJNFQHqNBuMQXXN/8pNXPAZsAliC6ORiWirINCm6qWnA3BPNWZDZDy1+GHOx7T2V1vuzqyUPwYa4qTT0enxjloT8tapIHQ0J8XFPgiJgeOoerpQbv3HnGgv5p+HzI8nY2ERfMEWJHQKEbFioCH6eNuLJuDboHe2oFRYbbVner8ojaClFfB/gOim/uMroBGz7MG2bhARBYWxooa/Ulbt0x5MA8BNOXlv7Y7G03WCKDuJdiyfQoQaUFydDPsueEo7KLz76aY6GipXri1+NrRIURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757384170; c=relaxed/relaxed;
	bh=2TKV760fRnnRQ3DBjX3Iximd/yUD+u3aPBxTUgdAocc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VhpowQb7kftaPSCrnbugEosyKXNWe3Xwj+tBrVFuvjqhnNO08m3E11E6OqKWJsG11lkR2gukwUjfi/NrV1PoS9tov6uN3H45gpsHJLuGWp9CW0b83eMGMWSfEts9tRwtkJtyXi2fXN92SYHp6H3mKWLXL+TURRFQYNqzQV36sXGKtXrFY7tSfs5US7BEQBFpXmcbsKQ/8BtpBwc22hyQiWzsKZQpKVxxzxtEdjySQpLpDSo/tDjvjcS7ux90Yx434iDLyxTKqK/XarW1nhMc2mppXZ9kpig0lWkDdoExebZfFifhqKGcgYMA9xe5wLqSVEiuWSRld9DJ4bmn+yLKEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Ji+MvIMJ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Ji+MvIMJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLS9M5yZ2z2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 12:16:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26F3543E29;
	Tue,  9 Sep 2025 02:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D67C4CEF1;
	Tue,  9 Sep 2025 02:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757384164;
	bh=xKkpvDQWGBF1SNQMUrwQak6dbS7+Kaawp2n8VZWz+M4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ji+MvIMJjnCzrm7JJouZjdcrryC08RI/Y6GwKlm7FmWFFjuLZhlIDnztPmdSccd+S
	 XVAieks/t16/1DrhnW8YjQQ5RGHB69prkFM4EIJDH7kM1ar3vtf0c34VBvQ5OpxJXk
	 jgytnzkbwbD6aEm0RBJgjRvCRYzqKtlr879Qt3uE=
Date: Mon, 8 Sep 2025 19:16:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Alexander Gordeev
 <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar
 <mingo@redhat.com>, Jann Horn <jannh@google.com>, Juergen Gross
 <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko
 <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will
 Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/7] Nesting support for lazy MMU mode
Message-Id: <20250908191602.61160a7990b9ea418de758c7@linux-foundation.org>
In-Reply-To: <20250908073931.4159362-1-kevin.brodsky@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon,  8 Sep 2025 08:39:24 +0100 Kevin Brodsky <kevin.brodsky@arm.com> wrote:

> The main change enabling nesting is patch 2, following the approach
> suggested by Catalin Marinas [4]: have enter() return some state and
> the matching leave() take that state. 

This is so totally the correct way.  Thanks.

