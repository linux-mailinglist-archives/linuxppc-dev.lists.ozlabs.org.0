Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDF91CA877
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 12:42:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JRjB2sb4zDqpk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 20:42:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JRgK0djCzDqnZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 20:40:20 +1000 (AEST)
X-IronPort-AV: E=Sophos;i="5.73,367,1583190000"; d="scan'208";a="448810012"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2020 12:40:08 +0200
Date: Fri, 8 May 2020 12:40:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH] powerpc/spufs: adjust list element pointer type
In-Reply-To: <4c9cc9184213ded65489cb95050046c8904ddad8.camel@ozlabs.org>
Message-ID: <alpine.DEB.2.21.2005081237210.5307@hadrien>
References: <1588929176-28527-1-git-send-email-Julia.Lawall@inria.fr>
 <4c9cc9184213ded65489cb95050046c8904ddad8.camel@ozlabs.org>
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
Cc: Nic Volanschi <eugene.volanschi@inria.fr>, Arnd Bergmann <arnd@arndb.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Fri, 8 May 2020, Jeremy Kerr wrote:

> Hi Julia,
>
> > Other uses of &gang->aff_list_head, eg in spufs_assert_affinity, indicate
> > that the list elements have type spu_context, not spu as used here.  Change
> > the type of tmp accordingly.
>
> Looks good to me; we could even use ctx there, rather than the separate
> tmp variable.

I thought about that, but it seemed a little bit abusive, since ctx is
used in an iteration over another list.  But if you prefer that I can
change it.

julia

>
> Reviewed-by: Jeremy Kerr <jk@ozlabs.org>
>
> Cheers,
>
>
> Jeremy
>
>
