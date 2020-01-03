Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E62F12F884
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 13:51:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47q4X437FgzDqD1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 23:51:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inria.fr (client-ip=192.134.164.83;
 helo=mail2-relais-roc.national.inria.fr; envelope-from=julia.lawall@inria.fr;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inria.fr
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47q4Sl4sVJzDq9L
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2020 23:47:58 +1100 (AEDT)
X-IronPort-AV: E=Sophos;i="5.69,390,1571695200"; d="scan'208";a="429787611"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2020 13:47:49 +0100
Date: Fri, 3 Jan 2020 13:47:49 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 0/4] use mmgrab
In-Reply-To: <20200103123059.GI3911@kadam>
Message-ID: <alpine.DEB.2.21.2001031344480.2982@hadrien>
References: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
 <20200103123059.GI3911@kadam>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: kvm@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Fri, 3 Jan 2020, Dan Carpenter wrote:

> On Sun, Dec 29, 2019 at 04:42:54PM +0100, Julia Lawall wrote:
> > Mmgrab was introduced in commit f1f1007644ff ("mm: add new mmgrab()
> > helper") and most of the kernel was updated to use it. Update a few
> > remaining files.
>
> I wonder if there is an automatic way to generate these kind of
> Coccinelle scripts which use inlines instead of open coding.  Like maybe
> make a list of one line functions, and then auto generate a recipe.  Or
> the mmgrab() function could have multiple lines if the first few were
> just sanity checks for NULL or something...

I tried this at one point (10 years ago!):

https://pages.lip6.fr/Julia.Lawall/acp4is09-lawall.pdf

Perhaps it is worth reviving.

julia
