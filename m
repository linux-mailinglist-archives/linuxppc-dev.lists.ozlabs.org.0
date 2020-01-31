Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A40A14E8F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 07:54:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4887J7322bzDqgw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 17:54:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=o5YxGTLi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=o8YI7DDa; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4887GY5YsszDqVW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 17:53:25 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 17DE77C6;
 Fri, 31 Jan 2020 01:53:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 31 Jan 2020 01:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 PK1pmpuptvT5/MkvhBVcvSK+hqg9sA+88hLtr2Io7nw=; b=o5YxGTLi4sIrJXoo
 ugd2krrWcg64RFmiqJ6tdkiGc+adzeQ5z4ig6QeuAXfutLZu11Bc36G1UXTaOgsw
 McqAYwaYsI3d31F5bgjRfskD3QNOmNqWiQG1R3ZwWRmBJs9HQ6nxHd+Jr7w9rDwT
 TsrXMVIwp5ZowfFbIZuI/ZIAMwSyUTu6Ty3Hk+YQsjFZMyjyykhWXH2QHNFuNwxh
 ESpv/hHIuNWv8FfgrY5OY+iDHNtvScWNLCG1GgKPmNALsiXfqqMf7GaZt8UrwwL/
 0tXc0BlHl7E8Xao68bTmHg61lA9Do2j7OFxy5OnuBif1zPDj10vQrYeui+CfdelB
 DdXdbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=PK1pmpuptvT5/MkvhBVcvSK+hqg9sA+88hLtr2Io7
 nw=; b=o8YI7DDaHYTjKgapJwAjfU8XvzA5klTJrByUtPe78PgrHGM7HTS1QawvQ
 16SAxyiDIIyl0S8pefOn24dXAcLIQmfHVr/0CBXKmeSzkZ6lwCUlm63CIFNLEYcT
 l+OVW2JwxEmXrl04JtL10DqHdt4lHyho8/ADXrmUjmLPYpdIQJoycdswXMM/zV7Z
 C7soOieAJSFDjaobkbgTqmsgn2WPiVeTIzxwl9Tr0ot62gTb8XiOJjN3fH3faalM
 bf9EbN4gx7PPYjL/C6eRJp72AGezAybDKYhpuX07yLRNA7vAGRhoUeXxOtcPrRcR
 gYd7tEpSqRET554+IRCWJLcZiAm3g==
X-ME-Sender: <xms:384zXrtB6FVk4XR6tDllJEfHkNeAuILY-TgyD1XabzkYj4EgD8cbrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeelgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdduhedmnecujfgurhepkffuhffvffgjfhgtfggggfesthekredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepuddvvddr
 leelrdekvddruddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:384zXrUlxgQqC9ICJ43oOpsEyI91u7WM6w9FkPnVlVU1xwcw7uAfJg>
 <xmx:384zXvI3kay4eHerKcbi84FZlTABlOHENxFxZ3GWgeKkZ_piQOvYbg>
 <xmx:384zXvNGdYwgFVHIqecB5b3VfI2jaVAXmh5bNmoMgvlQXQwl682hHw>
 <xmx:4M4zXjwODNLVTRcKnDcaIJS-cKYgUuC6EBHlQfgpbo3gkniM8aiF9A>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 54FA230607B0;
 Fri, 31 Jan 2020 01:53:17 -0500 (EST)
Message-ID: <0b016861756cbe27e66651b5c21229a06558cb57.camel@russell.cc>
Subject: Re: [PATCH] lkdtm: Test KUAP directional user access unlocks on
 powerpc
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@c-s.fr>, keescook@chromium.org, 
 mpe@ellerman.id.au
Date: Fri, 31 Jan 2020 17:53:14 +1100
In-Reply-To: <1b40cea6-0675-731a-58b1-bdc65f1e495e@c-s.fr>
References: <20200131053157.22463-1-ruscur@russell.cc>
 <1b40cea6-0675-731a-58b1-bdc65f1e495e@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kernel-hardening@lists.openwall.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-01-31 at 07:44 +0100, Christophe Leroy wrote:
> 
> Le 31/01/2020 à 06:31, Russell Currey a écrit :
> > Kernel Userspace Access Prevention (KUAP) on powerpc supports
> > allowing only one access direction (Read or Write) when allowing
> > access
> > to or from user memory.
> > 
> > A bug was recently found that showed that these one-way unlocks
> > never
> > worked, and allowing Read *or* Write would actually unlock Read
> > *and*
> > Write.  We should have a test case for this so we can make sure
> > this
> > doesn't happen again.
> > 
> > Like ACCESS_USERSPACE, the correct result is for the test to fault.
> > 
> > At the time of writing this, the upstream kernel still has this bug
> > present, so the test will allow both accesses whereas
> > ACCESS_USERSPACE
> > will correctly fault.
> > 
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > ---
> >   drivers/misc/lkdtm/core.c  |  3 +++
> >   drivers/misc/lkdtm/lkdtm.h |  3 +++
> >   drivers/misc/lkdtm/perms.c | 43
> > ++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 49 insertions(+)
> > 
> > diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> > index ee0d6e721441..baef3c6f48d6 100644
> > --- a/drivers/misc/lkdtm/core.c
> > +++ b/drivers/misc/lkdtm/core.c
> > @@ -137,6 +137,9 @@ static const struct crashtype crashtypes[] = {
> >   	CRASHTYPE(EXEC_USERSPACE),
> >   	CRASHTYPE(EXEC_NULL),
> >   	CRASHTYPE(ACCESS_USERSPACE),
> > +#ifdef CONFIG_PPC_KUAP
> > +	CRASHTYPE(ACCESS_USERSPACE_KUAP),
> > +#endif
> 
> I'm not sure it is a good idea to build this test as a specific test
> for 
> powerpc, more comments below.
> 
> >   	CRASHTYPE(ACCESS_NULL),
> >   	CRASHTYPE(WRITE_RO),
> >   	CRASHTYPE(WRITE_RO_AFTER_INIT),
> > diff --git a/drivers/misc/lkdtm/lkdtm.h
> > b/drivers/misc/lkdtm/lkdtm.h
> > index c56d23e37643..406a3fb32e6f 100644
> > --- a/drivers/misc/lkdtm/lkdtm.h
> > +++ b/drivers/misc/lkdtm/lkdtm.h
> > @@ -57,6 +57,9 @@ void lkdtm_EXEC_RODATA(void);
> >   void lkdtm_EXEC_USERSPACE(void);
> >   void lkdtm_EXEC_NULL(void);
> >   void lkdtm_ACCESS_USERSPACE(void);
> > +#ifdef CONFIG_PPC_KUAP
> > +void lkdtm_ACCESS_USERSPACE_KUAP(void);
> > +#endif
> >   void lkdtm_ACCESS_NULL(void);
> >   
> >   /* lkdtm_refcount.c */
> > diff --git a/drivers/misc/lkdtm/perms.c
> > b/drivers/misc/lkdtm/perms.c
> > index 62f76d506f04..2c9aa0114333 100644
> > --- a/drivers/misc/lkdtm/perms.c
> > +++ b/drivers/misc/lkdtm/perms.c
> > @@ -10,6 +10,9 @@
> >   #include <linux/mman.h>
> >   #include <linux/uaccess.h>
> >   #include <asm/cacheflush.h>
> > +#ifdef CONFIG_PPC_KUAP
> > +#include <asm/uaccess.h>
> > +#endif
> 
> asm/uaccess.h is already included by linux/uaccess.h

I should have actually read the other includes rather than assuming I
needed this, pretty silly

> 
> >   
> >   /* Whether or not to fill the target memory area with
> > do_nothing(). */
> >   #define CODE_WRITE	true
> > @@ -200,6 +203,46 @@ void lkdtm_ACCESS_USERSPACE(void)
> >   	vm_munmap(user_addr, PAGE_SIZE);
> >   }
> >   
> > +/* Test that KUAP's directional user access unlocks work as
> > intended */
> > +#ifdef CONFIG_PPC_KUAP
> > +void lkdtm_ACCESS_USERSPACE_KUAP(void)
> > +{
> > +	unsigned long user_addr, tmp = 0;
> > +	unsigned long *ptr;
> 
> Should be a __user ptr because allow_write_to_user() and friends
> takes 
> __user pointers.
> 
> > +
> > +	user_addr = vm_mmap(NULL, 0, PAGE_SIZE,
> > +			    PROT_READ | PROT_WRITE | PROT_EXEC,
> > +			    MAP_ANONYMOUS | MAP_PRIVATE, 0);
> > +	if (user_addr >= TASK_SIZE) {
> 
> Should use IS_ERR_VALUE() here.
> 
> > +		pr_warn("Failed to allocate user memory\n");
> > +		return;
> > +	}
> > +
> > +	if (copy_to_user((void __user *)user_addr, &tmp, sizeof(tmp)))
> > {
> 
> Should use ptr instead of casted user_addr.
> 
> Why using copy_to_user() for writing an unsigned long ? put_user() 
> should be enough.
> 
> > +		pr_warn("copy_to_user failed\n");
> > +		vm_munmap(user_addr, PAGE_SIZE);
> > +		return;
> > +	}
> > +
> > +	ptr = (unsigned long *)user_addr;
> 
> move before copy_to_user() and use there.

All of the above is from the original ACCESS_USERSPACE test, not to
imply that it's perfect, but I'm not sure it's worth changing in one
place only

> 
> > +
> > +	/* Allowing "write to" should not allow "read from" */
> > +	allow_write_to_user(ptr, sizeof(unsigned long));
> 
> This is powerpc specific. I think we should build this around the 
> user_access_begin()/user_access_end() generic fonctions.
> 
> I'm about to propose an enhancement to this in order to allow
> unlocking 
> only read or write. See discussion at 
> https://patchwork.ozlabs.org/patch/1227926/.
> 
> My plan is to propose my enhancement once powerpc implementation of 
> user_access_begin stuff is merged. I don't know if Michael is still 
> planning to merge the series for 5.6 
> (https://patchwork.ozlabs.org/patch/1228801/ - patch 1 of the series
> has 
> already been merged by Linus in 5.5)

You're correct, making generic user_access_begin() calls aware of
direction solves the arch-specific problem, so unless your series
somehow ends up being unviable (or taking a very long time to get
merged) we can drop this idea and have a generic implementation
instead.

> 
> 
> > +	pr_info("attempting bad read at %px with write allowed\n",
> > ptr);
> > +	tmp = *ptr;
> > +	tmp += 0xc0dec0de;
> > +	prevent_write_to_user(ptr, sizeof(unsigned long));
> 
> Does it work ? I would have thought that if the read fails the
> process 
> will die and the following test won't be performed.

Correct, the ACCESS_USERSPACE test does the same thing.  Splitting this
into separate R and W tests makes sense, even if it is unlikely that
one would be broken without the other.

- Russell

> 
> > +
> > +	/* Allowing "read from" should not allow "write to" */
> > +	allow_read_from_user(ptr, sizeof(unsigned long));
> > +	pr_info("attempting bad write at %px with read allowed\n",
> > ptr);
> > +	*ptr = tmp;
> > +	prevent_read_from_user(ptr, sizeof(unsigned long));
> > +
> > +	vm_munmap(user_addr, PAGE_SIZE);
> > +}
> > +#endif
> > +
> >   void lkdtm_ACCESS_NULL(void)
> >   {
> >   	unsigned long tmp;
> > 
> 
> Christophe

