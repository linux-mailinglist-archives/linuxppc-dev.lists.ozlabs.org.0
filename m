Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4652194098
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 14:58:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p65F5SLVzDqjW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 00:58:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=195.92.253.2;
 helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p5xz4h1pzDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 00:51:48 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jHSsv-003Jcf-BF; Thu, 26 Mar 2020 13:49:25 +0000
Date: Thu, 26 Mar 2020 13:49:25 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [powerpc] Intermittent crashes ( link_path_walk) with linux-next
Message-ID: <20200326134925.GP23230@ZenIV.linux.org.uk>
References: <1CB4E533-FD97-4C39-87ED-4857F3AB9097@linux.vnet.ibm.com>
 <87h7ybwdih.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7ybwdih.fsf@mpe.ellerman.id.au>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-fsdevel@vger.kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 26, 2020 at 10:40:06PM +1100, Michael Ellerman wrote:

> > The code in question (link_path_walk() in fs/namei.c ) was recently changed by
> > following commit:
> >
> > commit 881386f7e46a: 
> >   link_path_walk(): sample parent's i_uid and i_mode for the last component
> 
> That and about 10 other commits.
> 
> Unless Al can give us a clue we'll need to bisect.

	Already fixed yesterday.  It's not link_path_walk(), it's handle_dots()
ignoring an error returned by step_into().

commit 5e3c3570ec97 is the broken one; commit 20971012f63e is its variant with the
fix folded in.  So next-20200325 has the bug and next-20200326 should have it
fixed.  Could you check the current -next and see if you still observe that crap?
