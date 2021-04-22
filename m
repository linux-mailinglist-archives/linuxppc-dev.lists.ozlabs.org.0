Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB44367917
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 07:07:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQlm02wKtz300P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 15:07:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lIUnbdHw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lIUnbdHw; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQllX5nH5z2xZQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 15:07:02 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so2398512wmh.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 22:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2utWr3+IQN3QpqWssM7F+nO9xmc0OqxrHggaNQZ7us=;
 b=lIUnbdHwwuntyi+ReeYq+8aNiJWSsVh1y4WFaKGMU/DMP4XMArYxCcX/eIjT4Xm1tS
 1mkEHOos7zAIy6ovx3VwsA0+h5RlW3spLLguiJ1iMp6zu3M3Yew4aj2W4RMsV2cV04du
 6q78KIO8a/roJqUtqJxN/hKU/KruFrjacHVtkcLJh84Ps1wLK+u79uTN7NGmQlrvT37Q
 ol8lwTyA9W2ldf4zOIQ3YtOUIFLfKD1iGK4mZ0w7MR0TniiXyh45uBiO0ax3gJaH81UV
 O1LnBthOAWYKAATgLscr8fdIylaV0Lzp7O8damogWKRU1sM4tgq5Rex/eibGbMJky5at
 q1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2utWr3+IQN3QpqWssM7F+nO9xmc0OqxrHggaNQZ7us=;
 b=BQHrSsdLMwXrxDRKZHGnRVEZd93Vq8QXir0HR4dU7/BLZwPyAx24VQ74LHM2fGTJqw
 VYli3/m7NzYn9bwo67oJua/VIXxw0lQma2YqYRMvwHOhA9uCxeBlug1FlP6fDsF/A9Go
 aZUtkVNkHNTq+x9olWydU+SSP3dyahBrk5t/u26wZ+X7pVIewJ6D+5oORFg66VfRzqIf
 C8GWZ+moj1KVN+PiMevcPRQOdctIhzGw7QOhZrHsvlSDyqZYitMuHrp85Kaqowvl9Usu
 x6/wDn9L7/o1DbWu5sxRFVBdLup1k+uToqg2L+4GdtOHNy/Om4G2voiR/AJRs59IvsI+
 5Drw==
X-Gm-Message-State: AOAM532C0NK9iC5Iw85Kgx9Kis1oO/d4qOP60uJLqvPVQh8G6aQVHhZn
 QEqrqG7Jz253+a68Y6iQNdRJ/ErsTMWqVQFQa1c=
X-Google-Smtp-Source: ABdhPJxuOwYxYzZ3qoWv+o1PRE91V/WBO5YHiCJW9Y0aNDDRKjJcKaucK+qKcQR5GDIcdljGVmCwAQNI0/GaQ9ZXG/c=
X-Received: by 2002:a1c:b342:: with SMTP id c63mr1678390wmf.162.1619068015922; 
 Wed, 21 Apr 2021 22:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210420213517.24171-1-drt@linux.ibm.com>
 <60C99F56-617D-455B-9ACF-8CE1EED64D92@linux.vnet.ibm.com>
 <20210421064527.GA2648262@us.ibm.com>
In-Reply-To: <20210421064527.GA2648262@us.ibm.com>
From: Lijun Pan <lijunp213@gmail.com>
Date: Thu, 22 Apr 2021 00:06:45 -0500
Message-ID: <CAOhMmr4ckVFTZtSeHFHNgGPUA12xYO8WcUoakx7WdwQfSKBJhA@mail.gmail.com>
Subject: Re: [PATCH V2 net] ibmvnic: Continue with reset if set link down
 failed
To: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: netdev@vger.kernel.org, Lijun Pan <ljp@linux.vnet.ibm.com>,
 Tom Falcon <tlfalcon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Dany Madden <drt@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 21, 2021 at 2:25 AM Sukadev Bhattiprolu
<sukadev@linux.ibm.com> wrote:
>
> Lijun Pan [ljp@linux.vnet.ibm.com] wrote:
> >
> >
> > > On Apr 20, 2021, at 4:35 PM, Dany Madden <drt@linux.ibm.com> wrote:
> > >
> > > When ibmvnic gets a FATAL error message from the vnicserver, it marks
> > > the Command Respond Queue (CRQ) inactive and resets the adapter. If this
> > > FATAL reset fails and a transmission timeout reset follows, the CRQ is
> > > still inactive, ibmvnic's attempt to set link down will also fail. If
> > > ibmvnic abandons the reset because of this failed set link down and this
> > > is the last reset in the workqueue, then this adapter will be left in an
> > > inoperable state.
> > >
> > > Instead, make the driver ignore this link down failure and continue to
> > > free and re-register CRQ so that the adapter has an opportunity to
> > > recover.
> >
> > This v2 does not adddress the concerns mentioned in v1.
> > And I think it is better to exit with error from do_reset, and schedule a thorough
> > do_hard_reset if the the adapter is already in unstable state.
>
> We had a FATAL error and when handling it, we failed to send a
> link-down message to the VIOS. So what we need to try next is to
> reset the connection with the VIOS. For this we must talk to the
> firmware using the H_FREE_CRQ and H_REG_CRQ hcalls. do_reset()
> does just that in ibmvnic_reset_crq().
>
> Now, sure we can attempt a "thorough hard reset" which also does
> the same hcalls to reestablish the connection. Is there any
> other magic in do_hard_reset()? But in addition, it also frees lot
> more Linux kernel buffers and reallocates them for instance.

Working around everything in do_reset will make the code very difficult
to manage. Ultimately do_reset can do anything I am afraid, and do_hard_reset
can be removed completely or merged into do_reset.

>
> If we are having a communication problem with the VIOS, what is
> the point of freeing and reallocating Linux kernel buffers? Beside
> being inefficient, it would expose us to even more errors during
> reset under heavy workloads?

No real customer runs the system under that heavy load created by
HTX stress test, which can tear down any working system.

>
> From what I understand so far, do_reset() is complicated because
> it is attempting some optimizations.  If we are going to fall back
> to hard reset for every error we might as well drop the do_reset()
> and just do the "thorough hard reset" every time right?

I think such optimizations are catered for passing HTX tests. Whether
the optimization benefits the adapter, say making the adapter more stable,
I doubt it. I think there should be a trade off between optimization
and stability.
