Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2D37AEB3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 20:51:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffn7Z3YL2z3097
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 04:51:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PMWoLHRK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PMWoLHRK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=rgb@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PMWoLHRK; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PMWoLHRK; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ffn7061qdz2xxt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 04:50:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620759030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3sGuDkwY1rpAMVCQJVmhxPq9zjMod4hGpJJ6eXBTmJw=;
 b=PMWoLHRK/uq3ae2wG3xTAHtRTS/nwPsmx+LcaWrSaKbdUoe9OAp9bvp0cXrwDcEnAQ39Qs
 eXYfE/nO9U/NkfQiwZI30FDtlPwpBPsaSIW46pEoWsPqJdcPgFGFiT84Y1DQKIkkh1wrdL
 +H2OHYB/VWpBZq+WoH3JVr1w4YzYW80=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620759030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3sGuDkwY1rpAMVCQJVmhxPq9zjMod4hGpJJ6eXBTmJw=;
 b=PMWoLHRK/uq3ae2wG3xTAHtRTS/nwPsmx+LcaWrSaKbdUoe9OAp9bvp0cXrwDcEnAQ39Qs
 eXYfE/nO9U/NkfQiwZI30FDtlPwpBPsaSIW46pEoWsPqJdcPgFGFiT84Y1DQKIkkh1wrdL
 +H2OHYB/VWpBZq+WoH3JVr1w4YzYW80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-wJc_w8FvMFOfP0IN4Jn3vw-1; Tue, 11 May 2021 14:50:26 -0400
X-MC-Unique: wJc_w8FvMFOfP0IN4Jn3vw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BF5B8015DB;
 Tue, 11 May 2021 18:50:24 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.3.128.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 525D42C14A;
 Tue, 11 May 2021 18:50:13 +0000 (UTC)
Date: Tue, 11 May 2021 14:50:11 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v3 1/3] audit: replace magic audit syscall class numbers
 with macros
Message-ID: <20210511185011.GP3141668@madcap2.tricolour.ca>
References: <cover.1619811762.git.rgb@redhat.com>
 <bda073f2a8b11000ef40cf8b965305409ee88f44.1619811762.git.rgb@redhat.com>
 <CAHC9VhShi4u26h5OsahveQDNxO_uZ+KgzGOYEp5W7w6foA-uKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHC9VhShi4u26h5OsahveQDNxO_uZ+KgzGOYEp5W7w6foA-uKg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@redhat.com>,
 sparclinux@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>,
 Steve Grubb <sgrubb@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-05-10 21:23, Paul Moore wrote:
> On Fri, Apr 30, 2021 at 4:36 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Replace audit syscall class magic numbers with macros.
> >
> > This required putting the macros into new header file
> > include/linux/auditscm.h since the syscall macros were included for both 64
> > bit and 32 bit in any compat code, causing redefinition warnings.
> 
> The ifndef/define didn't protect against redeclaration?  Huh.  Maybe
> I'm not thinking about this correctly, or the arch specific code is
> doing something wonky ...

I had a chat with Arnd about it in IRC upstream and started digging
deeper and it got quite messy.  As seen from the cover letter, audit.h
pulled in a chain of things which weren't entirely unreasonable given it
was compiling compat support in with native support by default.  I
suppose I could have defined _ASM_X86_UNISTD_64_H to prevent it from
being added, but that would be ugly on a generated file, have caused a
failure elsewhere and would need to be done for each compat file.  I
thought of defining CONFIG_X86_32 in arch/x86/ia32/audit.c but that
would cause other problems.  This was the cleanest solution.  Otherwise
I leave them as magic numbers like in V1.

> Regardless, assuming that it is necessary, I would prefer if we called
> it auditsc.h instead of auditscm.h; the latter makes me think of
> sockets and not syscalls.
> 
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  MAINTAINERS                        |  1 +
> >  arch/alpha/kernel/audit.c          |  8 ++++----
> >  arch/ia64/kernel/audit.c           |  8 ++++----
> >  arch/parisc/kernel/audit.c         |  8 ++++----
> >  arch/parisc/kernel/compat_audit.c  |  9 +++++----
> >  arch/powerpc/kernel/audit.c        | 10 +++++-----
> >  arch/powerpc/kernel/compat_audit.c | 11 ++++++-----
> >  arch/s390/kernel/audit.c           | 10 +++++-----
> >  arch/s390/kernel/compat_audit.c    | 11 ++++++-----
> >  arch/sparc/kernel/audit.c          | 10 +++++-----
> >  arch/sparc/kernel/compat_audit.c   | 11 ++++++-----
> >  arch/x86/ia32/audit.c              | 11 ++++++-----
> >  arch/x86/kernel/audit_64.c         |  8 ++++----
> >  include/linux/audit.h              |  1 +
> >  include/linux/auditscm.h           | 23 +++++++++++++++++++++++
> >  kernel/auditsc.c                   | 12 ++++++------
> >  lib/audit.c                        | 10 +++++-----
> >  lib/compat_audit.c                 | 11 ++++++-----
> >  18 files changed, 102 insertions(+), 71 deletions(-)
> >  create mode 100644 include/linux/auditscm.h
> 
> ...
> 
> > diff --git a/include/linux/auditscm.h b/include/linux/auditscm.h
> > new file mode 100644
> > index 000000000000..1c4f0ead5931
> > --- /dev/null
> > +++ b/include/linux/auditscm.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/* auditscm.h -- Auditing support syscall macros
> > + *
> > + * Copyright 2021 Red Hat Inc., Durham, North Carolina.
> > + * All Rights Reserved.
> > + *
> > + * Author: Richard Guy Briggs <rgb@redhat.com>
> > + */
> > +#ifndef _LINUX_AUDITSCM_H_
> > +#define _LINUX_AUDITSCM_H_
> > +
> > +enum auditsc_class_t {
> > +       AUDITSC_NATIVE = 0,
> > +       AUDITSC_COMPAT,
> > +       AUDITSC_OPEN,
> > +       AUDITSC_OPENAT,
> > +       AUDITSC_SOCKETCALL,
> > +       AUDITSC_EXECVE,
> > +
> > +       AUDITSC_NVALS /* count */
> > +};
> > +
> > +#endif
> 
> -- 
> paul moore
> www.paul-moore.com
> 

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

