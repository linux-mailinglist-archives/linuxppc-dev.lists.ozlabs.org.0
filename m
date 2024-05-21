Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 362198CADDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 14:06:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkCcM1PzVz3gFT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 21:57:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkCbw4R3vz3fpB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 21:57:32 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 64D505C0FA;
	Tue, 21 May 2024 11:57:22 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D202413A21;
	Tue, 21 May 2024 11:57:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2qi3MCGMTGZncgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 21 May 2024 11:57:21 +0000
Date: Tue, 21 May 2024 13:57:20 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 01/20] mm: Provide pagesize to pmd_populate()
Message-ID: <ZkyMIOs76sZI5GsV@localhost.localdomain>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <91159d49bcbee0526ca6235ff7ef1ee7d378d013.1715971869.git.christophe.leroy@csgroup.eu>
 <ZksRfAXja0fhNePD@localhost.localdomain>
 <dc66eff8-4371-4685-9dd8-3dacd3744e73@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc66eff8-4371-4685-9dd8-3dacd3744e73@csgroup.eu>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 64D505C0FA
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2024 at 04:24:51PM +0000, Christophe Leroy wrote:
> I had a quick look at that document and it seems to provide a good 
> summary of MMU features and principles. However there are some 
> theoritical information which is not fully right in practice. For 
> instance when they say "Segment attributes. These fields define 
> attributes common to all pages in this segment.". This is right in 
> theory if you consider it from Linux page table topology point of view, 
> hence what they call a segment is a PMD entry for Linux. However, in 
> practice each page has its own L1 and L2 attributes and there is not 
> requirement at HW level to have all L1 attributes of all pages of a 
> segment the same.

Thanks for taking the time Christophe, highly appreciated.

 
> rlwimi = Rotate Left Word Immediate then Mask Insert. Here it rotates 
> r10 by 23 bits to the left (or 9 to the right) then masks with 
> _PMD_PAGE_512K and inserts it into r11.
> 
> It means _PAGE_HUGE bit is copied into lower bit of PS attribute.
> 
> PS takes the following values:
> 
> PS = 00 ==> Small page (4k or 16k)
> PS = 01 ==> 512k page
> PS = 10 ==> Undefined
> PS = 11 ==> 8M page

I see, thanks for the explanation.

> That's a RFC, all ideas are welcome, I needed something to replace 
> hugepd_populate()

The only user interested in pmd_populate() having a sz parameter
is 8xx because it will toggle _PMD_PAGE_8M in case of a 8MB mapping.

Would it be possible for 8xx to encode the 'sz' in the *pmd pointer
prior to calling down the chain? (something like as we do for PTR_ERR()).
Then pmd_populate_{kernel_}size() from 8xx, would extract it like:

 unsigned long sz = PTR_SIZE(pmd)

Then we would not need all these 'sz' parameters scattered.

Can that work?


PD: Do you know a way to emulate a 8xx VM? qemu seems to not have
support support.

Thanks


-- 
Oscar Salvador
SUSE Labs
