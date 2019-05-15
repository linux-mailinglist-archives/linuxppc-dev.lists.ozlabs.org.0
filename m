Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D02E1E825
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:10:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453kfv6xkMzDqQl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:09:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="S3JEB/k6"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453kdV34r9zDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 16:08:46 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89A7520862;
 Wed, 15 May 2019 06:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557900524;
 bh=fowhqUALRBQJMtB9RP4MkFlNPWDsccQyjzeGhlKuCvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S3JEB/k6ehXBDa0Ge4cnoCfn+lfnmWYGeTJyP9wx80uZH2VZ1MbNbNxPhPZYGK7t0
 qSlhFGkN2bmRauu23kyife8LNk4tv/y4LbHF2eRzQn+KscuO9adU+zIsyPd2fQLPvb
 r3xi81urldOMBcutENz6dJ2Q2FTfMjNtdXh/mT/U=
Date: Wed, 15 May 2019 08:08:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] powerpc/security: Fix build break
Message-ID: <20190515060841.GB18988@kroah.com>
References: <20190515045206.10610-1-joel@jms.id.au>
 <20190515051830.GA18166@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190515051830.GA18166@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2019 at 07:18:30AM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 15, 2019 at 02:22:06PM +0930, Joel Stanley wrote:
> > This fixes a build break introduced in with the recent round of CPU
> > bug patches.
> > 
> >   arch/powerpc/kernel/security.c: In function ‘setup_barrier_nospec’:
> >   arch/powerpc/kernel/security.c:59:21: error: implicit declaration of
> >   function ‘cpu_mitigations_off’ [-Werror=implicit-function-declaration]
> >     if (!no_nospec && !cpu_mitigations_off())
> >                        ^~~~~~~~~~~~~~~~~~~
> > 
> > Fixes: 782e69efb3df ("powerpc/speculation: Support 'mitigations=' cmdline option")
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> > This should be applied to the 4.14 and 4.19 trees. There is no issue
> > with 5.1. The commit message contains a fixes line for the commit in
> > Linus tree.
> > ---
> >  arch/powerpc/kernel/security.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Isn't this just commit 42e2acde1237 ("powerpc/64s: Include cpu header")?

Which I have now queued up.
