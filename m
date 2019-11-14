Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE92FC3D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 11:17:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DHVB6R2BzF4bN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 21:17:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFyD3FkSzF5jm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:08:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFy90198z9sSZ; Thu, 14 Nov 2019 20:08:16 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7d8212747435c534c8d564fbef4541a463c976ff
In-Reply-To: <20191031142933.10779-2-david@redhat.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v1 01/12] powerpc/pseries: CMM: Implement release()
 function for sysfs device
Message-Id: <47DFy90198z9sSZ@ozlabs.org>
Date: Thu, 14 Nov 2019 20:08:16 +1100 (AEDT)
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
Cc: David Hildenbrand <david@redhat.com>,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Vlastimil Babka <vbabka@suse.cz>,
 Arun KS <arunks@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-10-31 at 14:29:22 UTC, David Hildenbrand wrote:
> When unloading the module, one gets
> [  548.188594] ------------[ cut here ]------------
> [  548.188596] Device 'cmm0' does not have a release() function, it is brok=
> en and must be fixed. See Documentation/kobject.txt.
> [  548.188622] WARNING: CPU: 0 PID: 19308 at drivers/base/core.c:1244 .devi=
> ce_release+0xcc/0xf0
> ...
> 
> We only have on static fake device. There is nothing to do when
> releasing the device (via cmm_exit).
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> Cc: Allison Randal <allison@lohutok.net>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arun KS <arunks@codeaurora.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Patches 1-10 applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/7d8212747435c534c8d564fbef4541a463c976ff

cheers
