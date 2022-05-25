Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E1853449E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 21:57:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7hfr18YRz307g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 05:57:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Vkuk7I4Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=Vkuk7I4Y; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7hfC4rYWz305S
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 05:56:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89CDB619E8;
 Wed, 25 May 2022 19:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CD6C34117;
 Wed, 25 May 2022 19:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1653508589;
 bh=X7C0hmbhpTB3GvF0P9XEj7WCHI8xPxoJdQtXCB0lpQE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vkuk7I4YJwHwtgvQIjGGD67euU0yYsX+7dtU16FLwEvLwi8PlinTP7bamF/qsXX/R
 IemM4F1pZ/EVFJHycMBf5kl0RU9XRXgUsO0QL9o39JffkmNZtp/VWKGSmqu7oh8ZQC
 UU4QOnoINatpfxKdNgO8djo5bg0LXrduj8PpsVzg=
Date: Wed, 25 May 2022 12:56:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
Message-Id: <20220525125627.acf27b28bb67417a6683a1d9@linux-foundation.org>
In-Reply-To: <877d6g0zxq.fsf@email.froward.int.ebiederm.org>
References: <20220518181828.645877-1-naveen.n.rao@linux.vnet.ibm.com>
 <87ee0q7b92.fsf@email.froward.int.ebiederm.org>
 <YoWySwbszfdZS9LU@MiWiFi-R3L-srv>
 <87bkvt4d56.fsf@email.froward.int.ebiederm.org>
 <20220520104641.GB194232@MiWiFi-R3L-srv>
 <877d6g0zxq.fsf@email.froward.int.ebiederm.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 May 2022 14:25:05 -0500 "Eric W. Biederman" <ebiederm@xmission.com> wrote:

> > I am not strongly against taking off __weak, just wondering if there's
> > chance to fix it in recordmcount, and the cost comparing with kernel fix;
> > except of this issue, any other weakness of __weak. Noticed Andrew has
> > picked this patch, as a witness of this moment, raise a tiny concern.
> 
> I just don't see what else we can realistically do.

I think converting all of the kexec __weaks to use the ifdef approach
makes sense, if only because kexec is now using two different styles.

But for now, I'll send Naveen's v2 patch in to Linus to get us out of
trouble.

I'm thinking that we should add cc:stable to that patch as well, to
reduce the amount of problems which people experience when using newer
binutils on older kernels?

