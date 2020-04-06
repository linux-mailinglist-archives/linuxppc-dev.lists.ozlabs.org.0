Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9574519F67C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 15:12:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wrXw26JWzDqCV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:12:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrMd3XpkzDqNg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 23:03:56 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 933A768BEB; Mon,  6 Apr 2020 15:03:51 +0200 (CEST)
Date: Mon, 6 Apr 2020 15:03:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 3/6] binfmt_elf: remove the set_fs(KERNEL_DS) in
 elf_core_dump
Message-ID: <20200406130351.GA16479@lst.de>
References: <20200406120312.1150405-1-hch@lst.de>
 <20200406120312.1150405-4-hch@lst.de>
 <20200406130238.GT23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406130238.GT23230@ZenIV.linux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 06, 2020 at 02:02:38PM +0100, Al Viro wrote:
> On Mon, Apr 06, 2020 at 02:03:09PM +0200, Christoph Hellwig wrote:
> > There is no logic in elf_core_dump itself that uses uaccess routines
> > on kernel pointers, the file writes are nicely encapsulated in dump_emit
> > which does its own set_fs.
> 
> ... assuming you've checked the asm/elf.h to see that nobody is playing
> silly buggers in these forests of macros and the stuff called from those.
> Which is a feat that ought to be mentioned in commit message...

None of the calls should go into asm/elf.h headers, but some go to
various out of line arch callouts.  And I did look through those - spufs
was the only funky one.
