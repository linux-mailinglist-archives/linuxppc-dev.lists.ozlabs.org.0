Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A638CF60
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 22:52:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmzM21d2Fz3bs4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 06:52:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=altlinux.org (client-ip=194.107.17.57;
 helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org;
 receiver=<UNKNOWN>)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FmzLf3Qppz306s
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 May 2021 06:52:08 +1000 (AEST)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id C67DC72C8B8;
 Fri, 21 May 2021 23:52:04 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id B4B687CC8A6; Fri, 21 May 2021 23:52:04 +0300 (MSK)
Date: Fri, 21 May 2021 23:52:04 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Matheus Castanho <msc@linux.ibm.com>
Subject: Re: Linux powerpc new system call instruction and ABI
Message-ID: <20210521205204.GA24309@altlinux.org>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <1621385544.nttlk5qugb.astroid@bobo.none>
 <1621400263.gf0mbqhkrf.astroid@bobo.none>
 <87a6oo4312.fsf@linux.ibm.com>
 <87k0nr6ezw.fsf@oldenburg.str.redhat.com>
 <87eedz3li3.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eedz3li3.fsf@linux.ibm.com>
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Matheus Castanho via Libc-alpha <libc-alpha@sourceware.org>,
 linux-api@vger.kernel.org, musl@lists.openwall.com,
 Nicholas Piggin <npiggin@gmail.com>, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 21, 2021 at 05:00:36PM -0300, Matheus Castanho wrote:
> Florian Weimer <fweimer@redhat.com> writes:
> > * Matheus Castanho via Libc-alpha:
> >> From: Nicholas Piggin <npiggin@gmail.com>
> >> Subject: [PATCH 1/1] powerpc: Fix handling of scv return error codes
> >>
> >> When using scv on templated ASM syscalls, current code interprets any
> >> negative return value as error, but the only valid error codes are in
> >> the range -4095..-1 according to the ABI.
> >>
> >> Reviewed-by: Matheus Castanho <msc@linux.ibm.com>
> >
> > Please reference bug 27892 in the commit message.  I'd also appreciate a
> > backport to the 2.33 release branch (where you need to add NEWS manually
> > to add the bug reference).
> 
> No problem. [BZ #27892] appended to the commit title. I'll make sure to
> backport to 2.33 as well.

Could you also mention in the commit message that the change fixes
'signal.gen.test' strace test where it was observed initially?


-- 
ldv
