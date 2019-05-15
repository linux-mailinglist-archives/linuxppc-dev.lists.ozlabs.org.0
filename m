Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5281FAD8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 21:31:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4544RQ4BjtzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 05:31:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=opteya.com
 (client-ip=2001:bc8:3541:100::1; helo=ou.quest-ce.net;
 envelope-from=ydroneaud@opteya.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=opteya.com
Received: from ou.quest-ce.net (unknown [IPv6:2001:bc8:3541:100::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4544PK0bLmzDqWF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 05:29:24 +1000 (AEST)
Received: from [2a01:e35:39f2:1220:2452:dd6c:fe2f:be2c] (helo=opteyam2)
 by ou.quest-ce.net with esmtpsa (TLS1.1:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.80) (envelope-from <ydroneaud@opteya.com>)
 id 1hQvqH-0005C0-ER; Wed, 15 May 2019 17:29:17 +0200
Message-ID: <7afb23699142a3a15f06afde43506458a58614a6.camel@opteya.com>
From: Yann Droneaud <ydroneaud@opteya.com>
To: Christian Brauner <christian@brauner.io>
Date: Wed, 15 May 2019 17:29:16 +0200
In-Reply-To: <20190515141634.lrc5ynllcmjr64mn@brauner.io>
References: <20190515100400.3450-1-christian@brauner.io>
 <4c5ae46657e1931a832def5645db61eb0bf1accd.camel@opteya.com>
 <20190515141634.lrc5ynllcmjr64mn@brauner.io>
Organization: OPTEYA
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a01:e35:39f2:1220:2452:dd6c:fe2f:be2c
X-SA-Exim-Mail-From: ydroneaud@opteya.com
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on ou.quest-ce.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.2
Subject: Re: [PATCH 1/2] pid: add pidfd_open()
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on ou.quest-ce.net)
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-api@vger.kernel.org, elena.reshetova@intel.com,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, keescook@chromium.org, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk,
 luto@kernel.org, oleg@redhat.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 cyphar@cyphar.com, torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
 luto@amacapital.net, ebiederm@xmission.com, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le mercredi 15 mai 2019 à 16:16 +0200, Christian Brauner a écrit :
> On Wed, May 15, 2019 at 04:00:20PM +0200, Yann Droneaud wrote:
> > Le mercredi 15 mai 2019 à 12:03 +0200, Christian Brauner a écrit :
> > > diff --git a/kernel/pid.c b/kernel/pid.c
> > > index 20881598bdfa..237d18d6ecb8 100644
> > > --- a/kernel/pid.c
> > > +++ b/kernel/pid.c
> > > @@ -451,6 +452,53 @@ struct pid *find_ge_pid(int nr, struct
> > > pid_namespace *ns)
> > >  	return idr_get_next(&ns->idr, &nr);
> > >  }
> > >  
> > > +/**
> > > + * pidfd_open() - Open new pid file descriptor.
> > > + *
> > > + * @pid:   pid for which to retrieve a pidfd
> > > + * @flags: flags to pass
> > > + *
> > > + * This creates a new pid file descriptor with the O_CLOEXEC flag set for
> > > + * the process identified by @pid. Currently, the process identified by
> > > + * @pid must be a thread-group leader. This restriction currently exists
> > > + * for all aspects of pidfds including pidfd creation (CLONE_PIDFD cannot
> > > + * be used with CLONE_THREAD) and pidfd polling (only supports thread group
> > > + * leaders).
> > > + *
> > 
> > Would it be possible to create file descriptor with "restricted"
> > operation ?
> > 
> > - O_RDONLY: waiting for process completion allowed (for example)
> > - O_WRONLY: sending process signal allowed
> 
> Yes, something like this is likely going to be possible in the future.
> We had discussion around this. But mapping this to O_RDONLY and O_WRONLY
> is not the right model. It makes more sense to have specialized flags
> that restrict actions.

Yes, dedicated flags are the way to go. I've used the old open() flags
here as examples as an echo of the O_CLOEXEC flag used in the comment.

> > For example, a process could send over a Unix socket a process a pidfd,
> > allowing this to only wait for completion, but not sending signal ?
> > 
> > I see the permission check is not done in pidfd_open(), so what prevent
> > a user from sending a signal to another user owned process ?
> 
> That's supposed to be possible. You can do the same right now already
> with pids. Tools like LMK need this probably very much.
> Permission checking for signals is done at send time right now.
> And if you can't signal via a pid you can't signal via a pidfd as
> they're both subject to the same permissions checks.
> 

I would have expect it to behave like most other file descriptor,
permission check done at opening time, which allow more privileged
process to open the file descriptor, then pass it to a less privileged
process, or change its own privileged with setuid() and such. Then the
less privileged process can act on behalf of the privileged process
through the file descriptor.

> > If it's in pidfd_send_signal(), then, passing the socket through
> > SCM_RIGHT won't be useful if the target process is not owned by the
> > same user, or root.
> > 

If the permission check is done at sending time, the scenario above
case cannot be implemented.

Sending a pidfd through SCM_RIGHT is only useful if the receiver
process is equally or more privileged than the sender then.

For isolation purpose, I would have expect to be able to give a right
to send a signal to a highly privileged process a specific less
privileged process though Unix socket.

But I can't come up with a specific use case. So I dunno.

Regards.

-- 
Yann Droneaud
OPTEYA


