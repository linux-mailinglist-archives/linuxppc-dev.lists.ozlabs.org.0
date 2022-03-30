Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE694EBFE4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 13:37:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT4Cm1kvRz3bbP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 22:37:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hiwZ/rnv;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RFrnMZzz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hiwZ/rnv; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RFrnMZzz; 
 dkim-atps=neutral
X-Greylist: delayed 528 seconds by postgrey-1.36 at boromir;
 Wed, 30 Mar 2022 22:36:30 AEDT
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT4C24sC6z2x98
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 22:36:30 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 9CD351F38C;
 Wed, 30 Mar 2022 11:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648639657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SEh9q825X4XJd27vocQTJ0Ah1yjY4ISz2lUFtaIbslU=;
 b=hiwZ/rnvHAmRUVLDkeV0iDDn9/HCy6oQYGW6bL56T6trX/3UQvFHGHqqxoka2uz3zs8/wb
 r/VkjjjMzfK23RBhwMlEeTMfIK5G9jl5HjCp3aZG/XPLMdAn67JiQHUEtykG1MbG6miwNc
 zlLIXqKQeOTzFgoVXbrfWlURUsIiH6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648639657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SEh9q825X4XJd27vocQTJ0Ah1yjY4ISz2lUFtaIbslU=;
 b=RFrnMZzzPrRfgPVjY76VRPQm6Ut2g6BailUUqf2UDnkBtTaTTv7Da+SS6IBUe/XEfaINgD
 MGotLDXCyBbVx8DQ==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A5927A3B88;
 Wed, 30 Mar 2022 11:27:34 +0000 (UTC)
Date: Wed, 30 Mar 2022 13:27:33 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-1 tag
Message-ID: <20220330112733.GG163591@kunlun.suse.cz>
References: <87zglefhxd.fsf@mpe.ellerman.id.au>
 <CAHk-=whk4jihDM+zkhZPYRyNO0-YA1_-K9_NyC3EDsX+gkxC-w@mail.gmail.com>
 <87wngefnsu.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wngefnsu.fsf@mpe.ellerman.id.au>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 jniethe5@gmail.com, ganeshgr@linux.ibm.com, wangborong@cdjrlc.com,
 bigunclemax@gmail.com, Miroslav Benes <mbenes@suse.cz>, hbh25y@gmail.com,
 mikey@neuling.org, Joe Lawrence <joe.lawrence@redhat.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 danielhb413@gmail.com, haren@linux.ibm.com, mamatha4@linux.vnet.ibm.com,
 Corentin Labbe <clabbe@baylibre.com>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Thierry Reding <treding@nvidia.com>, kernel.noureddine@gmail.com,
 nathanl@linux.ibm.com, Petr Mladek <pmladek@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, guozhengkui@vivo.com, kjain@linux.ibm.com,
 chenjingwen6@huawei.com, Nick Piggin <npiggin@gmail.com>, oss@buserror.net,
 rmclure@linux.ibm.com, maddy@linux.ibm.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, psampat@linux.ibm.com,
 sachinp@linux.ibm.com, Anders Roxell <anders.roxell@linaro.org>,
 ldufour@linux.ibm.com, hbathini@linux.ibm.com,
 Athira Jajeev <atrajeev@linux.vnet.ibm.com>, farosas@linux.ibm.com,
 Geoff Levand <geoff@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sourabhjain@linux.ibm.com, Julia Lawall <Julia.Lawall@inria.fr>,
 Ritesh Harjani <riteshh@linux.ibm.com>, cgel.zte@gmail.com,
 Vaibhav Jain <vaibhav@linux.ibm.com>, tobias@waldekranz.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jakob Koschel <jakobkoschel@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 28, 2022 at 08:07:13PM +1100, Michael Ellerman wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
> > On Fri, Mar 25, 2022 at 3:25 AM Michael Ellerman <mpe@ellerman.id.au> wrote:

> 
> > That said:
> >
> >> There's a series of commits cleaning up function descriptor handling,
> >
> > For some reason I also thought that powerpc had actually moved away
> > from function descriptors, so I'm clearly not keeping up with the
> > times.
> 
> No you're right, we have moved away from them, but not entirely.
> 
> Functions descriptors are still used for 64-bit big endian, but they're
> not used for 64-bit little endian, or 32-bit.

There was a patch to use ABIv2 for ppc64 big endian. I suppose that
would rid usof the gunction descriptors for good.

Somehow the discussion of that change tralied off without any results.

Maybe it's worth resurrecting?

Thanks

Michal
