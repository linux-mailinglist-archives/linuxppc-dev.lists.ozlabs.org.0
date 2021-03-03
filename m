Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0277832B7F7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 14:19:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrF2J0SJLz3cT9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 00:19:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=OG2D8K0+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=OG2D8K0+; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrF1s5VR8z30My
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 00:18:40 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614777516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTjwCAs8NFhD6G8Me32PjCtQRtajdWLNU8hPxq2kLwY=;
 b=OG2D8K0+PfCuA5USdfd+Vx6vvOPTyS3EUyRmE7sqZ415QTN8GcaX9NJMw0mxPVVFu1pGLR
 m/nhsBzCaOzVYjLB8Jp0BgoRT32O09qY+clnqr6yXiqa/1CU+6464zYukujhq7ChdCD79P
 71x09r4i/F0vei3pckPBC7HbLpQl/ms=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 531B1AD29;
 Wed,  3 Mar 2021 13:18:36 +0000 (UTC)
Date: Wed, 3 Mar 2021 14:18:29 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: lkml delivery: was: Re: [PATCH next v4 00/15] printk: remove
 logbuf_lock
Message-ID: <YD+MpccJp4gX6bOP@alley>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210303101528.29901-1-john.ogness@linutronix.de>
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
Cc: linux-hyperv@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 Jordan Niethe <jniethe5@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Nicholas Piggin <npiggin@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Sumit Garg <sumit.garg@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi John,

On Wed 2021-03-03 11:15:13, John Ogness wrote:
> Hello,
> 
> Here is v4 of a series to remove @logbuf_lock, exposing the
> ringbuffer locklessly to both readers and writers. v3 is
> here [0].

Have you got some reply from lkml that it has not delivered there,
please?

I am not able to get the patchset using b4 tool:

$> b4 am -o test 20210303101528.29901-1-john.ogness@linutronix.de
Looking up https://lore.kernel.org/r/20210303101528.29901-1-john.ogness%40linutronix.de
Grabbing thread from lore.kernel.org/linux-hyperv
Analyzing 2 messages in the thread
---
Thread incomplete, attempting to backfill
Grabbing thread from lore.kernel.org/lkml
Server returned an error: 404
Grabbing thread from lore.kernel.org/linux-mtd
Server returned an error: 404
Grabbing thread from lore.kernel.org/linuxppc-dev
Loaded 2 messages from https://lore.kernel.org/linuxppc-dev/
---
Writing test/v4_20210303_john_ogness_printk_remove_logbuf_lock.mbx
  ERROR: missing [1/15]!
  ERROR: missing [2/15]!
  ERROR: missing [3/15]!
  ERROR: missing [4/15]!
  ERROR: missing [5/15]!
  ERROR: missing [6/15]!
  ERROR: missing [7/15]!
  ERROR: missing [8/15]!
  ERROR: missing [9/15]!
  ERROR: missing [10/15]!
  [PATCH next v4 11/15] printk: kmsg_dumper: remove @active field
  ✓ [PATCH next v4 12/15] printk: introduce a kmsg_dump iterator
  ERROR: missing [13/15]!
  [PATCH next v4 14/15] printk: kmsg_dump: remove _nolock() variants
  ERROR: missing [15/15]!
---
Total patches: 3
---
WARNING: Thread incomplete!
Cover: test/v4_20210303_john_ogness_printk_remove_logbuf_lock.cover
 Link: https://lore.kernel.org/r/20210303101528.29901-1-john.ogness@linutronix.de
 Base: not found
       git am test/v4_20210303_john_ogness_printk_remove_logbuf_lock.mbx


and I do not see it at lore. It has only found copies in linux-hyperv
and linux-ppcdev mailing lists,
see https://lore.kernel.org/lkml/20210303101528.29901-2-john.ogness@linutronix.de/

Best Regards,
Petr
