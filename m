Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE095CEC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 13:08:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CShW4bMdzDqsK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 21:08:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=vbabka@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CSfN6yH0zDqjh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 21:06:29 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD029AE9A;
 Tue, 20 Aug 2019 11:06:25 +0000 (UTC)
Subject: Re: [PATCH] btrfs: fix allocation of bitmap pages.
To: Christoph Hellwig <hch@infradead.org>, dsterba@suse.cz,
 Christophe Leroy <christophe.leroy@c-s.fr>, erhard_f@mailbox.org,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
References: <20190817074439.84C6C1056A3@localhost.localdomain>
 <20190819174600.GN24086@twin.jikos.cz> <20190820023031.GC9594@infradead.org>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <6f99b73c-db8f-8135-b827-0a135734d7da@suse.cz>
Date: Tue, 20 Aug 2019 13:06:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820023031.GC9594@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/20/19 4:30 AM, Christoph Hellwig wrote:
> On Mon, Aug 19, 2019 at 07:46:00PM +0200, David Sterba wrote:
>> Another thing that is lost is the slub debugging support for all
>> architectures, because get_zeroed_pages lacking the red zones and sanity
>> checks.
>> 
>> I find working with raw pages in this code a bit inconsistent with the
>> rest of btrfs code, but that's rather minor compared to the above.
>> 
>> Summing it up, I think that the proper fix should go to copy_page
>> implementation on architectures that require it or make it clear what
>> are the copy_page constraints.
> 
> The whole point of copy_page is to copy exactly one page and it makes
> sense to assume that is aligned.  A sane memcpy would use the same
> underlying primitives as well after checking they fit.  So I think the
> prime issue here is btrfs' use of copy_page instead of memcpy.  The
> secondary issue is slub fucking up alignments for no good reason.  We
> just got bitten by that crap again in XFS as well :(

Meh, I should finally get back to https://lwn.net/Articles/787740/ right


