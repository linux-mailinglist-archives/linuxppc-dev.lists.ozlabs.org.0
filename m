Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B771B88D4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 21:19:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498gnZ3JxfzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 05:18:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 498gkM4pmbzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 05:16:11 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 03PJFpQN000983;
 Sat, 25 Apr 2020 14:15:51 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 03PJFndY000981;
 Sat, 25 Apr 2020 14:15:49 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sat, 25 Apr 2020 14:15:49 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] x86: Fix early boot crash on gcc-10, next try
Message-ID: <20200425191549.GF17645@gate.crashing.org>
References: <20200422212605.GI26846@zn.tnic>
 <CAKwvOd=exxhfb8N6=1Q=wBUaYcRDEq3L1+TiHDLz+pxWg8OuwQ@mail.gmail.com>
 <20200423125300.GC26021@zn.tnic> <20200423161126.GD26021@zn.tnic>
 <20200425014657.GA2191784@rani.riverdale.lan>
 <20200425085759.GA24294@zn.tnic> <20200425150440.GA470719@rani.riverdale.lan>
 <20200425173140.GB24294@zn.tnic> <20200425183701.GE17645@gate.crashing.org>
 <20200425185313.GD24294@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200425185313.GD24294@zn.tnic>
User-Agent: Mutt/1.4.2.3i
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
Cc: Jakub Jelinek <jakub@redhat.com>, jgross@suse.com,
 Michael Matz <matz@suse.de>, Kees Cook <keescook@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Martin =?utf-8?B?TGnFoWth?= <mliska@suse.cz>, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Sergei Trofimovich <slyfox@gentoo.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 =?iso-8859-1?Q?Fr=E9d=E9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, boris.ostrovsky@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 25, 2020 at 08:53:13PM +0200, Borislav Petkov wrote:
> On Sat, Apr 25, 2020 at 01:37:01PM -0500, Segher Boessenkool wrote:
> > That is a lot more typing then
> > 	asm("");
> 
> That's why a macro with a hopefully more descriptive name would be
> telling more than a mere asm("").

My point is that you should explain at *every use* of this why you cannot
have tail calls *there*.  This is very unusual, after all.

There are *very* few places where you want to prevent tail calls, that's
why there is no attribute for it.


Segher
