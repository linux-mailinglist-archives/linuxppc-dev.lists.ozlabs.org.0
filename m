Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4851F5F449A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:45:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhf9B0d8jz3fbl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:45:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1T1lGqz3cd2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1R664Kz4xH2;
	Wed,  5 Oct 2022 00:38:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20220920122302.99195-1-david@redhat.com>
References: <20220920122302.99195-1-david@redhat.com>
Subject: Re: (subset) [PATCH v1 0/3] coding-style.rst: document BUG() and WARN() rules
Message-Id: <166488986181.779920.10714540040506715558.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:21 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Joe Perches <joe@perches.com>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Dave Young <dyoung@redhat.com>, linux-doc@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, Linus Torvalds <torvalds@linux-foundation.org>, David Laight <David.Laight@ACULAB.COM>, Nicholas Piggin <npiggin@gmail.com>, Andy Whitcroft <apw@canonical.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Sep 2022 14:22:59 +0200, David Hildenbrand wrote:
> As it seems to be rather unclear if/when to use BUG(), BUG_ON(),
> VM_BUG_ON(), WARN_ON_ONCE(), ... let's try to document the result of a
> recent discussion.
> 
> Details can be found in patch #1.
> 
> RFC -> v1:
> * "coding-style.rst: document BUG() and WARN() rules ("do not crash the
>    kernel")"
>  -> Rephrase/extend according to John
>  -> Add some details regarding the use of panic()
> * powerpc/prom_init: drop PROM_BUG()
>  -> Added
> * "checkpatch: warn on usage of VM_BUG_ON() and other BUG variants"
>  -> Warn on more variants
> 
> [...]

Patch 2 applied to powerpc/next.

[2/3] powerpc/prom_init: drop PROM_BUG()
      https://git.kernel.org/powerpc/c/c4167aec98524fa4511b3222303a758b532b6009

cheers
