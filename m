Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B96908D1D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 16:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W11X85j1Xz3cyc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 00:15:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W11Wl4MnBz3c1w
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 00:15:14 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5270720599;
	Fri, 14 Jun 2024 14:15:03 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBC3213AAF;
	Fri, 14 Jun 2024 14:15:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7r8vL2ZQbGYhTAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 14 Jun 2024 14:15:02 +0000
Date: Fri, 14 Jun 2024 16:14:57 +0200
From: Oscar Salvador <osalvador@suse.de>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Subject: Re: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Message-ID: <ZmxQYTEOqtxuEthT@localhost.localdomain>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
 <ZmgaHyS0izhtKbx6@localhost.localdomain>
 <ZmhcepJrkDpJ7mSC@x1n>
 <ZmhofWIiMC3I0aMF@localhost.localdomain>
 <ZmhrIdh3PLzvZU07@x1n>
 <Zmh282yJjxc7zqbL@localhost.localdomain>
 <e9583aa5-4ad7-4bcf-b3ff-f42b983231f5@cs-soprasteria.com>
 <Zmqdl1aqmU9BgYzo@localhost.localdomain>
 <0b52260d-28b2-4b33-b73e-88c5e5bfce66@cs-soprasteria.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b52260d-28b2-4b33-b73e-88c5e5bfce66@cs-soprasteria.com>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 5270720599
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
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

On Thu, Jun 13, 2024 at 04:43:57PM +0000, LEROY Christophe wrote:
> I can test whatever you want on my 8xx boards.
> 
> I have two types of board:
> - One with MPC866 microcontroller and 32Mbytes memory
> - One with MPC885 microcontroller and 128Mbytes memory

That is great.
I will code up some tests, and once you have the pmd_* stuff on 8xx we
can give it a shot.

Thanks!


-- 
Oscar Salvador
SUSE Labs
