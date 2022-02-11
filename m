Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3974B1F85
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 08:45:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw5Hd0DtDz3bb2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 18:45:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Jw5HC5CrXz301v
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 18:44:39 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 21B7dKQZ012095;
 Fri, 11 Feb 2022 01:39:21 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 21B7dJjv012092;
 Fri, 11 Feb 2022 01:39:19 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 11 Feb 2022 01:39:19 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3 04/12] powerpc: Prepare func_desc_t for refactorisation
Message-ID: <20220211073919.GW614@gate.crashing.org>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
 <86c393ce0a6f603f94e6d2ceca08d535f654bb23.1634457599.git.christophe.leroy@csgroup.eu>
 <202202101653.9128E58B84@keescook>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202202101653.9128E58B84@keescook>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 10, 2022 at 04:54:52PM -0800, Kees Cook wrote:
> On Sun, Oct 17, 2021 at 02:38:17PM +0200, Christophe Leroy wrote:
(edited:)
> > +typedef struct {
> > +	unsigned long addr;
> > +} func_desc_t;
> >  
> >  static func_desc_t func_desc(unsigned long addr)
> >  {
> > +	return (func_desc_t){addr};

> There's only 1 element in the struct, so okay, but it hurt my eyes a
> little. I would have been happier with:
> 
> 	return (func_desc_t){ .addr = addr; };
> 
> But of course that also looks bonkers because it starts with "return".
> So no matter what I do my eyes bug out. ;)

The usual way to avoid convoluted constructs is to name more factors.
So:

static func_desc_t func_desc(unsigned long addr)
{
	func_desc_t desc = {};
	desc.addr = addr;
	return desc;
}


Segher
