Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAEF18BDDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 18:21:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jtxF0d1jzDrP7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 04:21:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=ho5WkQIp; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jtvQ0fjjzDrKd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:20:01 +1100 (AEDT)
Received: by mail-ed1-x542.google.com with SMTP id h5so3690912edn.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mGnzjLPuiF5jh+YmVcnbPs/rygoBzTtr0yQpmvu1C/U=;
 b=ho5WkQIp7FBmmWnNEs8qarjlXHQ/bMpYIjVlz5diN+cFqHjIA9Cfpaie2yvrq56MzY
 6TnA04IH3cBRxYREMcsiPUpLCig/QPzuawQ7+ZDABjg2D7iZ5uNSWio6VnyJC48k22lp
 9sUOw53EsymdqqmachpMBK4cZKv94z+KiqobI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mGnzjLPuiF5jh+YmVcnbPs/rygoBzTtr0yQpmvu1C/U=;
 b=GYBXKcwtmVHRcwaLnW85UOoe/sI32uiP0W1YWESdK3dtDoAvYhQ8oc3TJE3zRYd6i8
 nRKJ2Bik9JA1qciXyHdVD3luq6B/zFY2baun59mRbzoZxRwJplZbM+0YD1S0gKL7iSiI
 ISXUvIpLP56NX3OhlueUuGrfq/cqUxy03+AeWg95wD39s40RMGth7TLRN1f4p/i7q/3v
 bRwiQSkieirfJElAD87uq9EUdF8D40MrcEVzkSXIm/8O5yRRJQv7UW/FUI5K+FWHpvYd
 RXYJrC5Jib1ln/hcs+y5kh6MjCZNnCMEX593AxUlUWnSDXIMaXWl0GEoJ5Z/6prTfnkb
 kqrg==
X-Gm-Message-State: ANhLgQ3g7txbjANKg595IE+TVNqyb6YW/dMYYtQNHuwV4X/TWhG3nApE
 3xM3hfFJhd0NesglTlmwbgLWe9OY0HA=
X-Google-Smtp-Source: ADFU+vvreJ9jIEyr3U0fij5Z27tZKM4szJbg96netW/zu5588JIBLw9Gr7h5BEsV5RQWYloZp6fE3g==
X-Received: by 2002:a05:6402:17cf:: with SMTP id
 s15mr3829561edy.260.1584638397406; 
 Thu, 19 Mar 2020 10:19:57 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48])
 by smtp.gmail.com with ESMTPSA id l2sm191228edk.70.2020.03.19.10.19.57
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 10:19:57 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id a43so3692025edf.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 10:19:57 -0700 (PDT)
X-Received: by 2002:a19:c7:: with SMTP id 190mr2779646lfa.30.1584637965843;
 Thu, 19 Mar 2020 10:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.521507446@linutronix.de>
In-Reply-To: <20200318204408.521507446@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Mar 2020 10:12:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3bwUD9=y4Wd6=Dh1Xwib+N3nYuKA=hd3-y+0OUeLcOQ@mail.gmail.com>
Message-ID: <CAHk-=wj3bwUD9=y4Wd6=Dh1Xwib+N3nYuKA=hd3-y+0OUeLcOQ@mail.gmail.com>
Subject: Re: [patch V2 11/15] completion: Use simple wait queues
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oleg Nesterov <oleg@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, "Paul E . McKenney" <paulmck@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 18, 2020 at 1:47 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> There is no semantical or functional change:

Ack, with just the explanation, I'm no longer objecting to this.

Plus you fixed and cleaned up the odd usb gadget code separately
(well, most of it).

              Linus
