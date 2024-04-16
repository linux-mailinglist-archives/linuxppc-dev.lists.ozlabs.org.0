Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D3F8A6BA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 14:58:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=aNM5L+Vc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJkcn4Hd9z3vXx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 22:58:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=aNM5L+Vc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inria.fr (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Tue, 16 Apr 2024 22:58:08 AEST
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJkc00MKkz3dTB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 22:58:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=H21fvQtQ7WtagqXZixGpBpqK/Mf2KBTn3BMn7sI6Xwo=;
  b=aNM5L+VcxO66+rnB0hrRLAaQ7ltle4u+tjVsgiIcGM/6+KSsIiVloa8h
   6T5/bjbuUhkdmon2C/f4fRUxnH/0MxnwhPqEEHqJrqp5Pz9sASMNsGN47
   eaViXdS0DYtY1iFSc2drIjE5rWOAbjxAEf3P5NybCbo0e6bzoSQz4uMLB
   c=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,206,1708383600"; 
   d="scan'208";a="84954712"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 14:56:51 +0200
Date: Tue, 16 Apr 2024 14:56:50 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [0/2] powerpc/powernv/vas: Adjustments for two function
 implementations
In-Reply-To: <3711cad3-a627-4a6e-8769-ce916c1919ee@csgroup.eu>
Message-ID: <3f22920-9543-efd1-a32a-477ae18a2b2a@inria.fr>
References: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de> <ee6022b8-3aeb-4e6e-99f5-2668dd344e0a@web.de> <87plupbm0c.fsf@mail.lhotse> <795ca003-4231-45c0-8bb6-178597950fa5@csgroup.eu> <33a38d7e-26da-46e0-90d4-7137f9ec0c90@web.de>
 <3711cad3-a627-4a6e-8769-ce916c1919ee@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-563611295-1713272210=:3643"
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "cocci@inria.fr" <cocci@inria.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-563611295-1713272210=:3643
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Tue, 16 Apr 2024, Christophe Leroy wrote:

>
>
> Le 16/04/2024 à 14:14, Markus Elfring a écrit :
> >> This is explicit in Kernel documentation:
> >>
> >> /**
> >>    * kfree - free previously allocated memory
> >>    * @object: pointer returned by kmalloc() or kmem_cache_alloc()
> >>    *
> >>    * If @object is NULL, no operation is performed.
> >>    */
> >>
> >> That's exactly the same behaviour as free() in libc.
> >>
> >> So Coccinelle should be fixed if it reports an error for that.
> >
> > Redundant function calls can occasionally be avoided accordingly,
> > can't they?
>
> Sure they can, but is that worth it here ?

Coccinelle does what the developer of the semantic patch tells it to do.
It doesn't spontaneously report errors for anything.

julia
--8323329-563611295-1713272210=:3643--
