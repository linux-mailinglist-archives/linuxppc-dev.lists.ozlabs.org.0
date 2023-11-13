Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 170997E98B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 10:17:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VE1ywpqf;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=E9i74Fc4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STP343QHzz3cZC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 20:17:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VE1ywpqf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=E9i74Fc4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STP2C2hMWz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 20:16:51 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id A8BC11F6E6;
	Mon, 13 Nov 2023 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1699866996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KX11XEiwW6eiDI12ss+sRNdlDTmAVAT1+uU/mRCBZP4=;
	b=VE1ywpqfj+UkQ5z6Rcnk5W7/0I7tOSdB+JiELKgaToL7vBDNEAbqc7Oq84YPVwHOa2hLsm
	7EDjFJNn6aRQc3uhAu7CsOVtJRHZ60vizck4NmMuAnLoHCgVbgUjPSB1THeipz0+L8ZOoy
	Bj/xAQUe0oKsiI/fA/fktZ6KJMqykUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699866996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KX11XEiwW6eiDI12ss+sRNdlDTmAVAT1+uU/mRCBZP4=;
	b=E9i74Fc4V7n4mpLJYVIBxNHG+0utyiNr3zL9p1wcrDuaJZ5lSFXec2fe27hSd1HiqYwi8J
	t4PW60eBEHQYmJAw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 2F1502C169;
	Mon, 13 Nov 2023 09:16:35 +0000 (UTC)
Date: Mon, 13 Nov 2023 10:16:34 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v3 00/10] powerpc/pseries: New character devices for
 system parameters and VPD
Message-ID: <20231113091634.GZ6241@kitsune.suse.cz>
References: <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
 <87v8at2b0r.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8at2b0r.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
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
Cc: tyreld@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Oct 26, 2023 at 06:56:36PM -0500, Nathan Lynch wrote:
> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
> writes:
> > I have made changes to librtas to prefer the new interfaces and
> > verified that existing clients work correctly with the new code.
> 
> Unfortunately I made a mistake in testing this time and introduced a
> boot-time oops:
> 
> BUG: Kernel NULL pointer dereference on read at 0x00000018
> Faulting instruction address: 0xc00000000004223c
> Oops: Kernel access of bad area, sig: 7 [#1]
> LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6.6.0-rc2+ #129
> NIP:  c00000000004223c LR: c000000000042238 CTR: 0000000000000000
> REGS: c000000002c579d0 TRAP: 0300   Tainted: G        W           (6.6.0-rc2+)
> MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE>  CR: 28000284  XER: 00000000
> CFAR: c000000000042008 DAR: 0000000000000018 DSISR: 00080000 IRQMASK: 3 
> GPR00: c000000000042238 c000000002c57c70 c000000001f5eb00 0000000000000000 
> GPR04: c00000000294cd08 0000000000000002 c000000002c579b4 0000000000000000 
> GPR08: 0000000000000000 0000000000000002 c000000002c0da80 0000000000000000 
> GPR12: 0000000000000000 c000000005e40000 0000000000000000 0000000002097728 
> GPR16: 0000000000001111 0000000000000001 0000000002097b80 00000000020975b8 
> GPR20: 00000000020976f0 00000000020974e8 00000000030feb00 00000000030feb00 
> GPR24: 0000000000002008 0000000000000000 0000000000000001 c0000000028f3d70 
> GPR28: 0000000002d31020 c000000002cac268 c000000002d31020 0000000000000000 
> NIP [c00000000004223c] do_enter_rtas+0xcc/0x460
> LR [c000000000042238] do_enter_rtas+0xc8/0x460
> Call Trace:
> [c000000002c57c70] [c000000000042238] do_enter_rtas+0xc8/0x460 (unreliable)
> [c000000002c57cc0] [c000000000042e34] rtas_call+0x434/0x490
> [c000000002c57d20] [c0000000000fd584] papr_sysparm_get+0xe4/0x230
> [c000000002c57db0] [c0000000020267d0] pSeries_probe+0x2f0/0x5fc
> [c000000002c57e80] [c00000000200a318] setup_arch+0x11c/0x524
> [c000000002c57f10] [c00000000200418c] start_kernel+0xcc/0xc1c
> [c000000002c57fe0] [c00000000000e788] start_here_common+0x1c/0x20
> 
> This was introduced by patch #4 "powerpc/rtas: Warn if per-function lock
> isn't held": __do_enter_rtas() is now attempting token -> descriptor
> lookups unconditionally, before the xarray for that has been initialized.
> 
> With that change reverted, the series tests OK.

What's the status here?

Can this move on with the 4th patch skipped, or is new revision
expected?

Thanks

Michal
