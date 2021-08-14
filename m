Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7703EC2C2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 15:02:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gn0vw17p0z3cXx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 23:02:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Gn0vR06sZz30B2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 23:02:26 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17ECwEDi013900;
 Sat, 14 Aug 2021 07:58:14 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17ECwCY0013899;
 Sat, 14 Aug 2021 07:58:12 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sat, 14 Aug 2021 07:58:12 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Fangrui Song <maskray@google.com>
Subject: Re: [PATCH] ppc: add "-z notext" flag to disable diagnostic
Message-ID: <20210814125812.GC1583@gate.crashing.org>
References: <20210812204951.1551782-1-morbo@google.com>
 <87sfzde8lk.fsf@linkitivity.dja.id.au>
 <20210813200508.7bqehxgd6ruerds5@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813200508.7bqehxgd6ruerds5@google.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, Bill Wendling <morbo@google.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 13, 2021 at 01:05:08PM -0700, Fangrui Song wrote:
> Text relocations are considered very awful by linker developers.

By very few linker developers.

> binutils 2.35 added --enable-textrel-check={no,warn,error}
> https://sourceware.org/bugzilla/show_bug.cgi?id=20824

Yes, some people wanted the default to be configurable.  So now we have
a default default that is sane, so most people get to reap the benefits
of having defaults at all, but we also allow other people to shoot
themselves (and people who have to deal with them) in the foot.
"Progress".  Changing the defaults should be a one-time event, only done
when the benefits strongly outweigh the costs.  Defaults should never be
configurable (by the user).

> I can imagine that in the future some Linux distributions (especially those
> focusing on security) will default their binutils to use
> --enable-textrel-check={no,warn,error}.

How would this be a benefit to security?

> In -no-pie links, R_PPC64_ADDR64 relocations are link-time constants.

Where "link" includes dynamic links as well.  There are no constants.

> There are no text relocations, therefore no need for -z notext.

This is a choice by the compiler, nothing more.  It saves some process
startup time, and allows slightly more maps to be shared by processes
that run the same images.  But it is a tradeoff, so it might change; and
of course it is not an ABI requirement.


Segher
