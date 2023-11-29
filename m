Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C69B7FD428
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 11:31:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XFbldcw8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgFxQ5vF2z3d8N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 21:31:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XFbldcw8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=salvatore.bonaccorso@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgFwZ655Rz3c4s
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 21:31:09 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-549070a04baso8765587a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 02:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701253859; x=1701858659; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lAncjJSOOjZiNADXqbSSNgxD1Kx8XP10IMElfbL+LY=;
        b=XFbldcw8eKW5WumanE2iIpxa5X+kxoHh8AV+iLg2SonxhV93Lx59H7lCOaSH04CQox
         VPZ3bJDZEHUZ8CJZOvw7wGkileLNhMPHmdpQws+5pXkaUAy+Twh2Ozh3f4+3n2+TlQad
         ioej9EofrS17rSHPuaFrkUDLJrMelp8YkGV6R1HWSO7SQ7UyS8lyKp6JbjLVGORKXoan
         NZmpNO+e4SvT0QEwCABK5FjYOzZ2Vx1HX2BDm1UUm2yXmZcnkkzwNJXRgDi4tXiaJki8
         DGqGiawbw+FZcHF/kAyHCjCU75DW0B1MVZ4VPaqwN+yv8Gn9drnA1JzVcbN7wIIrqheU
         UP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701253859; x=1701858659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lAncjJSOOjZiNADXqbSSNgxD1Kx8XP10IMElfbL+LY=;
        b=k8jl6EPgMYs7YB7lHo/DdO44T6+bIvS/n+ka1H2nMdtzZeZCPpEvW+oaIMuc8KXSzV
         cssuUpO3HSw1hWnx+gEaVu9shtrDrUQ8kXNr7PhRiTLJQODd+uZSYW/LVZ5BSjSdneYH
         0U2XmWvtEQdx8E8cfoss4FGY0BeZWMkORdL8Eyid2QHK1Ph6HzHYSBlmQsKZ4waBOv3x
         nBn9eF22uGgRWPmb/pjxssSDXEgoDcphOO9yY/lUWi8AswO5t/0XV0sgAcoJVPlMxecr
         5GB5yfqgBuD9F0dNLV5qGY7D4mO4c9yWzzbupqUjosF9kPqfxnpcOVfMiAZkWlsmmSNE
         9WGQ==
X-Gm-Message-State: AOJu0YzBcAbfHmNl6HMe7u5U26hjlM7u9KysEs/2Yt15KmSs7R4gAm8m
	421am0xncB2rGSObE9hpGeY=
X-Google-Smtp-Source: AGHT+IGptUIWmZYcaDGodMJ/aJUrATc3/axoxHWWr7FC5K0fVtF61tB+rOJdv9N5WVOF8xPpsKYW6A==
X-Received: by 2002:a05:6402:220d:b0:54a:f8d9:8023 with SMTP id cq13-20020a056402220d00b0054af8d98023mr11645670edb.37.1701253859154;
        Wed, 29 Nov 2023 02:30:59 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id h14-20020aa7c94e000000b00548a57d4f7bsm7241144edt.36.2023.11.29.02.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 02:30:58 -0800 (PST)
Received: by eldamar.lan (Postfix, from userid 1000)
	id 1BE49BE2DE0; Wed, 29 Nov 2023 11:30:58 +0100 (CET)
Date: Wed, 29 Nov 2023 11:30:58 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register save
Message-ID: <ZWcS4uBOUefxZAQY@eldamar.lan>
References: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
 <42b9fdd7-2939-4ffc-8e18-4996948b19f7@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42b9fdd7-2939-4ffc-8e18-4996948b19f7@kernel.dk>
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
Cc: regressions <regressions@lists.linux.dev>, Timothy Pearson <tpearson@raptorengineering.com>, npiggin <npiggin@gmail.com>, stable@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Sun, Nov 19, 2023 at 06:14:50AM -0700, Jens Axboe wrote:
> On 11/18/23 4:45 PM, Timothy Pearson wrote:
> > During floating point and vector save to thread data fr0/vs0 are clobbered
> > by the FPSCR/VSCR store routine.  This leads to userspace register corruption
> > and application data corruption / crash under the following rare condition:
> > 
> >  * A userspace thread is executing with VSX/FP mode enabled
> >  * The userspace thread is making active use of fr0 and/or vs0
> >  * An IPI is taken in kernel mode, forcing the userspace thread to reschedule
> >  * The userspace thread is interrupted by the IPI before accessing data it
> >    previously stored in fr0/vs0
> >  * The thread being switched in by the IPI has a pending signal
> > 
> > If these exact criteria are met, then the following sequence happens:
> > 
> >  * The existing thread FP storage is still valid before the IPI, due to a
> >    prior call to save_fpu() or store_fp_state().  Note that the current
> >    fr0/vs0 registers have been clobbered, so the FP/VSX state in registers
> >    is now invalid pending a call to restore_fp()/restore_altivec().
> >  * IPI -- FP/VSX register state remains invalid
> >  * interrupt_exit_user_prepare_main() calls do_notify_resume(),
> >    due to the pending signal
> >  * do_notify_resume() eventually calls save_fpu() via giveup_fpu(), which
> >    merrily reads and saves the invalid FP/VSX state to thread local storage.
> >  * interrupt_exit_user_prepare_main() calls restore_math(), writing the invalid
> >    FP/VSX state back to registers.
> >  * Execution is released to userspace, and the application crashes or corrupts
> >    data.
> 
> What an epic bug hunt! Hats off to you for seeing it through and getting
> to the bottom of it. Particularly difficult as the commit that made it
> easier to trigger was in no way related to where the actual bug was.
> 
> I ran this on the vm I have access to, and it survived 2x500 iterations.
> Happy to call that good:
> 
> Tested-by: Jens Axboe <axboe@kernel.dk>

Thanks to all involved!

Is this going to land soon in mainline so it can be picked as well for
the affected stable trees?

Regards,
Salvatore
