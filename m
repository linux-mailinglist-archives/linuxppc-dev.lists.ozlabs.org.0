Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F15747DEF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 09:09:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tKdIALsR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwrQ66Y0Kz3bkM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 17:09:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tKdIALsR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwrPG102Zz300t
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 17:09:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 405A961453;
	Wed,  5 Jul 2023 07:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57875C433C7;
	Wed,  5 Jul 2023 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688540940;
	bh=KNHJu+0CLU4ZCQdLgEFri5D+Z9BwIrdluwuvuUeNttE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKdIALsR0dMkHa9DJuKzvIPN6d8h9dFfEniOOt9bWgEKNcQIdf7any+sOkoPLEKea
	 +95s2KQ452fHNF4mzK3LiP0iF8hrCJ186zokGs38t/pxGUAu4cT3Fhxu8f4UEm1j6P
	 LCmtLDw3WijgFusqsM7zA87m4MVC7ID+D/hmFgPI=
Date: Wed, 5 Jul 2023 08:08:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
Message-ID: <2023070509-undertow-pulverize-5adc@gregkh>
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
 <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh>
 <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh>
 <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 04, 2023 at 01:22:54PM -0700, Suren Baghdasaryan wrote:
> On Tue, Jul 4, 2023 at 9:18 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Tue, 4 Jul 2023 09:00:19 +0100 Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > > > > > > Thanks! I'll investigate this later today. After discussing with
> > > > > > > Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
> > > > > > > the issue is fixed. I'll post a patch shortly.
> > > > > >
> > > > > > Posted at: https://lore.kernel.org/all/20230703182150.2193578-1-surenb@google.com/
> > > > >
> > > > > As that change fixes something in 6.4, why not cc: stable on it as well?
> > > >
> > > > Sorry, I thought since per-VMA locks were introduced in 6.4 and this
> > > > patch is fixing 6.4 I didn't need to send it to stable for older
> > > > versions. Did I miss something?
> > >
> > > 6.4.y is a stable kernel tree right now, so yes, it needs to be included
> > > there :)
> >
> > I'm in wait-a-few-days-mode on this.  To see if we have a backportable
> > fix rather than disabling the feature in -stable.
> 
> Ok, I think we have a fix posted at [2]  and it's cleanly applies to
> 6.4.y stable branch as well. However fork() performance might slightly
> regress, therefore disabling per-VMA locks by default for now seems to
> be preferable even with this fix (see discussion at
> https://lore.kernel.org/all/54cd9ffb-8f4b-003f-c2d6-3b6b0d2cb7d9@google.com/).
> IOW, both [1] and [2] should be applied to 6.4.y stable. Both apply
> cleanly and I CC'ed stable on [2]. Greg, should I send [1] separately
> to stable@vger?

We can't do anything for stable until it lands in Linus's tree, so if
you didn't happen to have the stable@ tag in the patch, just email us
the git SHA1 and I can pick it up that way.

thanks,

greg k-h
