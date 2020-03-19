Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B013F18B3AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 13:45:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jmph6MC4zDrMJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 23:45:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jmFx03M9zDqTw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 23:20:37 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9FE71B1C2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 12:20:33 +0000 (UTC)
Date: Thu, 19 Mar 2020 13:20:32 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v11 0/8] Disable compat cruft on ppc64le v11
Message-ID: <20200319122032.GH25468@kitsune.suse.cz>
References: <cover.1584613649.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1584613649.git.msuchanek@suse.de>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lost some headers so will resend.

On Thu, Mar 19, 2020 at 12:52:20PM +0100, Michal Suchanek wrote:
> Less code means less bugs so add a knob to skip the compat stuff.
> 
> Changes in v2: saner CONFIG_COMPAT ifdefs
> Changes in v3:
>  - change llseek to 32bit instead of builing it unconditionally in fs
>  - clanup the makefile conditionals
>  - remove some ifdefs or convert to IS_DEFINED where possible
> Changes in v4:
>  - cleanup is_32bit_task and current_is_64bit
>  - more makefile cleanup
> Changes in v5:
>  - more current_is_64bit cleanup
>  - split off callchain.c 32bit and 64bit parts
> Changes in v6:
>  - cleanup makefile after split
>  - consolidate read_user_stack_32
>  - fix some checkpatch warnings
> Changes in v7:
>  - add back __ARCH_WANT_SYS_LLSEEK to fix build with llseek
>  - remove leftover hunk
>  - add review tags
> Changes in v8:
>  - consolidate valid_user_sp to fix it in the split callchain.c
>  - fix build errors/warnings with PPC64 !COMPAT and PPC32
> Changes in v9:
>  - remove current_is_64bit()
> Chanegs in v10:
>  - rebase, sent together with the syscall cleanup
> Changes in v11:
>  - rebase
>  - add MAINTAINERS pattern for ppc perf
> 
> Michal Suchanek (8):
>   powerpc: Add back __ARCH_WANT_SYS_LLSEEK macro
>   powerpc: move common register copy functions from signal_32.c to
>     signal.c
>   powerpc/perf: consolidate read_user_stack_32
>   powerpc/perf: consolidate valid_user_sp
>   powerpc/64: make buildable without CONFIG_COMPAT
>   powerpc/64: Make COMPAT user-selectable disabled on littleendian by
>     default.
>   powerpc/perf: split callchain.c by bitness
>   MAINTAINERS: perf: Add pattern that matches ppc perf to the perf
>     entry.
> 
>  MAINTAINERS                            |   2 +
>  arch/powerpc/Kconfig                   |   5 +-
>  arch/powerpc/include/asm/thread_info.h |   4 +-
>  arch/powerpc/include/asm/unistd.h      |   1 +
>  arch/powerpc/kernel/Makefile           |   6 +-
>  arch/powerpc/kernel/entry_64.S         |   2 +
>  arch/powerpc/kernel/signal.c           | 144 +++++++++-
>  arch/powerpc/kernel/signal_32.c        | 140 ----------
>  arch/powerpc/kernel/syscall_64.c       |   6 +-
>  arch/powerpc/kernel/vdso.c             |   3 +-
>  arch/powerpc/perf/Makefile             |   5 +-
>  arch/powerpc/perf/callchain.c          | 356 +------------------------
>  arch/powerpc/perf/callchain.h          |  20 ++
>  arch/powerpc/perf/callchain_32.c       | 196 ++++++++++++++
>  arch/powerpc/perf/callchain_64.c       | 174 ++++++++++++
>  fs/read_write.c                        |   3 +-
>  16 files changed, 556 insertions(+), 511 deletions(-)
>  create mode 100644 arch/powerpc/perf/callchain.h
>  create mode 100644 arch/powerpc/perf/callchain_32.c
>  create mode 100644 arch/powerpc/perf/callchain_64.c
> 
> -- 
> 2.23.0
> 
