Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A3A7480CF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 11:28:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eoo0Bvrw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwvVD1wmgz3bmj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 19:28:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eoo0Bvrw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwvTL6hDyz2y3Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 19:27:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4ABA61380;
	Wed,  5 Jul 2023 09:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB110C433C7;
	Wed,  5 Jul 2023 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688549268;
	bh=8Fx9fMjO8G9ugWAbuWMet+cg6+Joz5k8QhqzwC12qsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoo0Bvrw1UFedSuQIXZXLVU+9eSykKnlLCGNhX6WKDHSjWKzHs45W6Sc5+LEp8Yn2
	 /DNzBXf9tV7vuTj14UGRu+D/lPt07gtCii7fqIBtyh8Z2HAouCMzNmVKrvzTL3yT/s
	 lpXJcXQKTCcazzOuTFZLURKsfcEGQZNtF3QMf8uc=
Date: Wed, 5 Jul 2023 10:27:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
Message-ID: <2023070544-porous-prenatal-406a@gregkh>
References: <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
 <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh>
 <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh>
 <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh>
 <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 05, 2023 at 10:51:57AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 05.07.23 09:08, Greg KH wrote:
> > On Tue, Jul 04, 2023 at 01:22:54PM -0700, Suren Baghdasaryan wrote:
> >> On Tue, Jul 4, 2023 at 9:18 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> >>> On Tue, 4 Jul 2023 09:00:19 +0100 Greg KH <gregkh@linuxfoundation.org> wrote:
> >>>>>>>> Thanks! I'll investigate this later today. After discussing with
> >>>>>>>> Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
> >>>>>>>> the issue is fixed. I'll post a patch shortly.
> >>>>>>>
> >>>>>>> Posted at: https://lore.kernel.org/all/20230703182150.2193578-1-surenb@google.com/
> >>>>>>
> >>>>>> As that change fixes something in 6.4, why not cc: stable on it as well?
> >>>>>
> >>>>> Sorry, I thought since per-VMA locks were introduced in 6.4 and this
> >>>>> patch is fixing 6.4 I didn't need to send it to stable for older
> >>>>> versions. Did I miss something?
> >>>>
> >>>> 6.4.y is a stable kernel tree right now, so yes, it needs to be included
> >>>> there :)
> >>>
> >>> I'm in wait-a-few-days-mode on this.  To see if we have a backportable
> >>> fix rather than disabling the feature in -stable.
> 
> Andrew, how long will you remain in "wait-a-few-days-mode"? Given what
> Greg said below and that we already had three reports I know of I'd
> prefer if we could fix this rather sooner than later in mainline --
> especially as Arch Linux and openSUSE Tumbleweed likely have switched to
> 6.4.y already or will do so soon.

Ick, yeah, and Fedora should be switching soon too, and I want to drop
support for 6.3.y "any day now".  Is there just a revert we can do now
first to resolve the regression and then work on fixing this up "better"
for 6.6-rc1?

thanks,

greg k-h
