Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F832D7746
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 15:18:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46swwd6YC8zDr3h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 00:18:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mit.edu
 (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mit.edu
X-Greylist: delayed 258 seconds by postgrey-1.36 at bilbo;
 Wed, 16 Oct 2019 00:14:46 AEDT
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46swrQ2ZggzDr3X
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 00:14:44 +1100 (AEDT)
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com
 [104.133.0.98] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9FDA5N0018119
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Oct 2019 09:10:06 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id CA393420287; Tue, 15 Oct 2019 09:10:04 -0400 (EDT)
Date: Tue, 15 Oct 2019 09:10:04 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] xfs: introduce "metasync" api to sync metadata to fsblock
Message-ID: <20191015131004.GA7456@mit.edu>
References: <1570977420-3944-1-git-send-email-kernelfans@gmail.com>
 <20191013163417.GQ13108@magnolia> <20191014083315.GA10091@mypc>
 <20191014094311.GD5939@quack2.suse.cz>
 <d3ffa114-8b73-90dc-8ba6-3f44f47135d7@sandeen.net>
 <20191014200303.GF5939@quack2.suse.cz>
 <5796090e-6206-1bd7-174e-58798c9af052@sandeen.net>
 <20191015080102.GB3055@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015080102.GB3055@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jan Kara <jack@suse.cz>, Eric Sandeen <esandeen@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jan Kara <jack@suse.com>,
 Eric Sandeen <sandeen@sandeen.net>, Pingfan Liu <kernelfans@gmail.com>,
 linux-xfs@vger.kernel.org, Dave Chinner <dchinner@redhat.com>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 15, 2019 at 01:01:02AM -0700, Christoph Hellwig wrote:
> On Mon, Oct 14, 2019 at 03:09:48PM -0500, Eric Sandeen wrote:
> > We're in agreement here.  ;)  I only worry about implementing things like this
> > which sound like guarantees, but aren't, and end up encouraging bad behavior
> > or promoting misconceptions.
> > 
> > More and more, I think we should reconsider Darrick's "bootfs" (ext2 by another
> > name, but with extra-sync-iness) proposal...
> 
> Having a separate simple file system for the boot loader makes a lot of
> sense.  Note that vfat of EFI is the best choice, but at least it is
> something.  SysV Unix from the 90s actually had a special file system just
> for that, and fs/bfs/ in Linux supports that.  So this isn't really a new
> thing either.

Did you mean to say "vfaat of EFI isn't the best choice"?

If we were going to be doing something like "bootfs", what sort of
semantics would be sufficient?  Is doing an implied fsync() on every
close(2) enough, or do we need to do something even more conservative?

	 	       	       	     - Ted
