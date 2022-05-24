Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFE15330B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 20:55:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L73L92QYHz3bk7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 04:55:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L73Kj0mDTz3bdY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 04:55:04 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24OIqnf7028066;
 Tue, 24 May 2022 13:52:49 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 24OIqmBx028065;
 Tue, 24 May 2022 13:52:48 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 24 May 2022 13:52:47 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220524185247.GK25951@gate.crashing.org>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220524175955.GI25951@gate.crashing.org>
 <20220524181255.bmszzxmbwzv7zed7@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524181255.bmszzxmbwzv7zed7@pali>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 08:12:55PM +0200, Pali Rohár wrote:
> On Tuesday 24 May 2022 12:59:55 Segher Boessenkool wrote:
> > On Tue, May 24, 2022 at 11:39:39AM +0200, Pali Rohár wrote:
> > > gcc e500 compiler does not support -mcpu=powerpc option. When it is
> > > specified then gcc throws compile error:
> > > 
> > >   gcc: error: unrecognized argument in option ‘-mcpu=powerpc’
> > >   gcc: note: valid arguments to ‘-mcpu=’ are: 8540 8548 native
> > 
> > What?  Are you using some modified version of GCC, perhaps?
> 
> Hello! I'm using official gcc version, no special modification.
> 
> > No version of GCC that isn't hamstrung can have this output.
> 
> gcc for e500 cores has really this output when you pass -mcpu=powerpc.
> 
> Upstream gcc dropped support for e500 cores during development of
> version 9.

This isn't true.  The SPE instruction extension is no longer supported
(because it wasn't maintained).  Everything else still works.

> But you can still compile and install gcc 8.5.0 (last version
> of gcc 8) which has this full e500 support.
> 
> Really, you can easily try it. Debian 10 (Buster) has gcc 8.3.0 in its
> default installation and also provides packages with cross compilers.
> Just run 'sudo apt install gcc-powerpc-linux-gnuspe' on desktop amd64
> version of Debian 10, it will install e500 cross compiler.
> 
> -mcpu=8540 specify e500v1 and -mcpu=8548 specify e500v2

Aha.  Right, because this config forces -mspe it requires one of these
CPUs.

You can use a powerpc-linux compiler instead, and everything will just
work.  These CPUs are still supported, in all of GCC 9 .. GCC 12 :-)


Segher
