Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2341214B1F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 10:43:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486MBK3MgvzDqKs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 20:43:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486M7W6JJ0zDqC4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 20:41:11 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D2E1DB146;
 Tue, 28 Jan 2020 09:41:06 +0000 (UTC)
Date: Tue, 28 Jan 2020 10:41:05 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: system call implement the bulk of the logic
 in C fix
Message-ID: <20200128094105.GY4113@kitsune.suse.cz>
References: <20200127141712.96738-1-npiggin@gmail.com>
 <20200127180832.GX4113@kitsune.suse.cz>
 <1580171821.hhr2i98lkm.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1580171821.hhr2i98lkm.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 28, 2020 at 10:41:02AM +1000, Nicholas Piggin wrote:
> Michal Suchánek's on January 28, 2020 4:08 am:
> > On Tue, Jan 28, 2020 at 12:17:12AM +1000, Nicholas Piggin wrote:
> >> This incremental patch fixes several soft-mask debug and unsafe
> >> smp_processor_id messages due to tracing and false positives in
> >> "unreconciled" code.
> >> 
> >> It also fixes a bug with syscall tracing functions that set registers
> >> (e.g., PTRACE_SETREG) not setting GPRs properly.
> >> 
> >> There was a bug reported with the TM selftests, I haven't been able
> >> to reproduce that one.
> >> 
> >> I can squash this into the main patch and resend the series if it
> >> helps but the incremental helps to see the bug fixes.
> > 
> > There are some whitespace differences between this and the series I have
> > applied locally. What does it apply to?
> > 
> > Is there some revision of the patchset I missed?
> 
> No I may have just missed some of your whitespace cleanups, or maybe I got
> some that Michael made which you don't have in his next-test branch.

Looks like the latter. I will pick patches from next-test.

Thanks

Michal
