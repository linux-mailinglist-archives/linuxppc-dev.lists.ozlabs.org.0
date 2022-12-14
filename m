Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E864CFDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 20:06:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXPwP6vPPz3cKj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 06:06:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXPvp5X9rz3bbB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 06:05:41 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2BEJ1LWU014253;
	Wed, 14 Dec 2022 13:01:21 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 2BEJ1JSw014250;
	Wed, 14 Dec 2022 13:01:19 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 14 Dec 2022 13:01:19 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] [BACKPORT FOR 4.14] libtraceevent: Fix build with binutils 2.35
Message-ID: <20221214190119.GO25951@gate.crashing.org>
References: <c4629a12d4a2a21ff131624d3ef1d9f8b5fd64ad.1670954579.git.christophe.leroy@csgroup.eu> <20221213202535.GL25951@gate.crashing.org> <8d1c27fe-bac5-8007-a852-f9c15a49a6ba@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d1c27fe-bac5-8007-a852-f9c15a49a6ba@csgroup.eu>
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Steven Rostedt <rostedt@goodmis.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, "linux-trace-devel@vger.kernel.org" <linux-trace-devel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Ben Hutchings <ben@decadent.org.uk>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 14, 2022 at 03:33:24PM +0000, Christophe Leroy wrote:
> Le 13/12/2022 à 21:25, Segher Boessenkool a écrit :
> > On Tue, Dec 13, 2022 at 07:03:07PM +0100, Christophe Leroy wrote:
> >> In binutils 2.35, 'nm -D' changed to show symbol versions along with
> >> symbol names, with the usual @@ separator.
> > 
> > 2.37 instead?  And --without-symbol-versions is there to restore the
> > old behaviour.  The script is parsing the output already so this patch
> > is simpler maybe, but :-)
> 
> Do you mean that the original commit from Ben should have done it 
> differently ?

Probably.

> My patch is only a backport of original commit 39efdd94e314 
> ("libtraceevent: Fix build with binutils 2.35") due to Makefile being at 
> a different place in 4.14.

<shrug>.  It's not such a great idea to spread misinformation further,
imo.  Maybe the mailing list archives will help dampen that already now.

Thanks,


Segher
