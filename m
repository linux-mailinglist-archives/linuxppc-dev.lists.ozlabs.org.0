Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D89389FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 09:24:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Mo57lr+R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSBcj352wz3cT7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 17:24:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Mo57lr+R;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSBc163XTz30Vk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 17:24:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1721633057;
	bh=7xYb9iaHHsO53zX4r++CVPw1TcU/Qoda/IxZitAYyes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mo57lr+Rk5tEBPzo+Uh0Sak5AZzOKKbaJhj9ORzW0/FazE6xM0EWBA2oJR49LeSCh
	 q+r0cxX76MlKwT+R0sEsg+fSVS4B3k9G/U7iDTYZGq27GwkQuJ7q7NybR1DBxMA04w
	 ugGEn4j6oEy4xK5CUYjRuNJeIgrUhEA8z0KBD+QqwXdUVa0tHBYi3NY+FolJoA0HZu
	 gGX3FMtWx9flPJtO5aWg7dnqSh+daKFEVD3N/agHqfzGn4v5qhreUFUn3K+MdBZ/Vm
	 Pk0LtjQ+oJtEH5EeRmtZLBU1W9/i5ClHMzEsdYxxdoN7Kme1c+fFa21WrPKfC4TsbH
	 anjTTO/JXdlOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WSBc13ZZ6z4wc1;
	Mon, 22 Jul 2024 17:24:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Dr. David Alan Gilbert" <linux@treblig.org>, Sean Anderson
 <sean.anderson@linux.dev>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] soc/fsl/qbman: remove unused struct 'cgr_comp'
In-Reply-To: <Zp2QtPET9649y9pA@gallifrey>
References: <20240528231123.136664-1-linux@treblig.org>
 <336239e6-4369-44ea-a60c-d300cf6e6f81@linux.dev>
 <Zp2QtPET9649y9pA@gallifrey>
Date: Mon, 22 Jul 2024 17:24:16 +1000
Message-ID: <878qxtx527.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, camelia.groza@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Dr. David Alan Gilbert" <linux@treblig.org> writes:
> * Sean Anderson (sean.anderson@linux.dev) wrote:
>> On 5/28/24 19:11, linux@treblig.org wrote:
>> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
>> > 
>> > 'cgr_comp' has been unused since
>> > commit 96f413f47677 ("soc/fsl/qbman: fix issue in
>> > qman_delete_cgr_safe()").
>> > 
>> > Remove it.
>> > 
>> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>> > ---
>> >  drivers/soc/fsl/qbman/qman.c | 5 -----
>> >  1 file changed, 5 deletions(-)
>> > 
>> > diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
>> > index 7e9074519ad2..4dc8aba33d9b 100644
>> > --- a/drivers/soc/fsl/qbman/qman.c
>> > +++ b/drivers/soc/fsl/qbman/qman.c
>> > @@ -2546,11 +2546,6 @@ int qman_delete_cgr(struct qman_cgr *cgr)
>> >  }
>> >  EXPORT_SYMBOL(qman_delete_cgr);
>> >  
>> > -struct cgr_comp {
>> > -	struct qman_cgr *cgr;
>> > -	struct completion completion;
>> > -};
>> > -
>> >  static void qman_delete_cgr_smp_call(void *p)
>> >  {
>> >  	qman_delete_cgr((struct qman_cgr *)p);
>> 
>> Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
>
> Hi Sean,
>   Do you know who will pick this one up?
>   I got a notification a while ago from a patchwork at
>   linuxppc-dev marked 'Handled elsewhere' - but I'm not
> sure where.

drivers/soc/fsl was orphaned, but Christophe has recently volunteered to
look after it.

This patch looks trivial so I can just pick it up if you like Christophe?

cheers
