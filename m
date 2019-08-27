Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE1D9DB6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 03:57:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HX6z5DtdzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 11:56:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HX4g5VYlzDqDt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 11:54:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46HX4f0vmjz9s00;
 Tue, 27 Aug 2019 11:54:58 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Sterba <dsterba@suse.cz>, Nikolay Borisov <nborisov@suse.com>
Subject: Re: [PATCH v2] btrfs: fix allocation of bitmap pages.
In-Reply-To: <20190826164646.GX2752@twin.jikos.cz>
References: <c3157c8e8e0e7588312b40c853f65c02fe6c957a.1566399731.git.christophe.leroy@c-s.fr>
 <20190826153757.GW2752@twin.jikos.cz>
 <a096d653-8b64-be15-3e81-581536a88e8a@suse.com>
 <20190826164646.GX2752@twin.jikos.cz>
Date: Tue, 27 Aug 2019 11:54:57 +1000
Message-ID: <871rx74bke.fsf@concordia.ellerman.id.au>
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
Cc: erhard_f@mailbox.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org, dsterba@suse.cz,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Sterba <dsterba@suse.cz> writes:
> On Mon, Aug 26, 2019 at 06:40:24PM +0300, Nikolay Borisov wrote:
>> >> Link: https://bugzilla.kernel.org/show_bug.cgi?id=204371
>> >> Fixes: 69d2480456d1 ("btrfs: use copy_page for copying pages instead of memcpy")
>> >> Cc: stable@vger.kernel.org
>> >> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> >> ---
>> >> v2: Using kmem_cache instead of get_zeroed_page() in order to benefit from SLAB debugging features like redzone.
>> > 
>> > I'll take this version, thanks. Though I'm not happy about the allocator
>> > behaviour. The kmem cache based fix can be backported independently to
>> > 4.19 regardless of the SL*B fixes.
>> > 
>> >> +extern struct kmem_cache *btrfs_bitmap_cachep;
>> > 
>> > I've renamed the cache to btrfs_free_space_bitmap_cachep
>> > 
>> > Reviewed-by: David Sterba <dsterba@suse.com>
>> 
>> Isn't this obsoleted by
>> 
>> '[PATCH v2 0/2] guarantee natural alignment for kmalloc()' ?
>
> Yeah, but this would add maybe another whole dev cycle to merge and
> release. The reporters of the bug seem to care enough to identify the
> problem and propose the fix so I feel like adding the btrfs-specific fix
> now is a little favor we can afford.
>
> The bug is reproduced on an architecture that's not widely tested so
> from practical POV I think this adds more coverage which is desirable.

Thanks.

cheers
