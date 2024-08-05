Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AFB947D4D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 16:55:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=o9sO/Yu4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wczxc5fc6z3cfB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 00:55:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=o9sO/Yu4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wczwt6JrMz3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 00:54:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 09156CE0B05;
	Mon,  5 Aug 2024 14:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A4DC32782;
	Mon,  5 Aug 2024 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722869658;
	bh=/S+/yz6TSjJppPnh4Kg2Am3hhCXibAq6O1ZPZKpx9Eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9sO/Yu4SGWr8mhPq57qounnCew7ZHIrbvj9S8CAoa4mCyZth0cJzPQEY20G00H/Z
	 pnn5IRMJ/UtN+uxm8nmYDX0tPHKxDBJ21+T2Z2xCfyZ3EA8FGEnlmrNCGya5tPFfWw
	 ZvFNAq7xBfjjFIL8BDlew42lAT+ZovTgzgSKhG9w=
Date: Mon, 5 Aug 2024 10:54:17 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: List change - munging for From addresses
Message-ID: <20240805-honored-weightless-kangaroo-71e79e@lemur>
References: <20240802130347.383a1b49@canb.auug.org.au>
 <20240802-agile-manipulative-dog-df4487@lemur>
 <20240805124204.49ed65df@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240805124204.49ed65df@canb.auug.org.au>
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
Cc: ppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 05, 2024 at 12:42:04PM GMT, Stephen Rothwell wrote:
> > I would generally say that From-munging isn't a great option for any list that
> > receives patches. A much better approach is to just not modify the message
> > headers or message body. This should be possible with mailman.
> 
> Unfortunately, I have not found a way to ensure Mailman (v2, at least)
> will not modify messages in all cases e.g. in some circumstances it
> will modify the To/Cc list.

Right, Mailman-2 is also dependent on Python-2, which is quite obsolete by
this point as well.

> So, an alternative for us (though considerable more work) is to change
> mailing list software.  Mailmanv3 would be an option, but seems overly
> complex.  I see vger.kernel.org is now using mlmmj - is that a
> reasonable option for us (i.e. is it able to not modify messages but
> still have enough features)?  If so any hints about migrating? ;-)

I'd say that mlmmj has a very different approach than mailman -- it exposes
very little to end-users and list admins. Any changes to the list
configuration must be made by server admins, which can be seen as very
limiting by someone used to how mailman does it.

However, it *is* a great option for running mailing lists that process
patches and couples well with public-inbox for archiving. It also requires a
fraction of resources of mailman-3.

If you want to be able to have a more hands-off approach to your mailing list
management, with a fancy UI and lots of list admin tunables, your best option
is Mailman-3. If you want a "mean and lean" option, then mlmmj is the way to
go.

-K
