Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38119191915
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 19:27:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48n09H1ThRzDqjc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 05:27:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel@joelfernandes.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.a=rsa-sha256 header.s=google header.b=XviXDdgR; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48n07K51MxzDqhn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 05:26:05 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id j4so20271804qkc.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 11:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iEmpsAyt9B1Qcdkh4hlRJzHYHPiVdMatdhGGO+kX6u0=;
 b=XviXDdgRMR3A1ee54Wowb70vIsLpggnUxurOugFzJ+rMRbEWy19ZdXhIQG8po0nuoq
 +zQF77o09zsBvEAMrLmPfUbOj/iB/K7nHwJmK5u3waH0Ns6p9BDbathMFtZ6NE3rNO/a
 eUJzkjun1iZzOBflcQHA8PWiD8khlP9p5A0R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iEmpsAyt9B1Qcdkh4hlRJzHYHPiVdMatdhGGO+kX6u0=;
 b=hNh0Daxrt+2LpvV734DRM91oIEi6iV/LIA4/fAa8q2NXHjKlU38HGFHrsCMc4iYLCN
 CdNGRzOhTtAwD/kXWQS4iKrMgAKV3/x3aynuFLlAmaY1eW00w1apUdxKfDt5sDes0qr3
 wWpv8tmMkQmyXQriUcloQVjSmUfm57PJwOJ2Kg4zI9NCKwkoGWwtRIJpVbdXF5VapbR9
 IvCjnhnxcYa8gglKn9Ib1HtIhlfonugOPBweDDjWVJ8d5m75zf5owSgU0ueCJiauhbY9
 9ReVE6AE7OuMVDQl5GmouwtRHZHyD4xnFEmG+JGi9fPEE5BaJv6wZtcpmFTnRS69VCn/
 ykbw==
X-Gm-Message-State: ANhLgQ1PJVT5n2nHkAKPdcy0ElucjItzBRNzURdO7WDdGRak0TSEwN/y
 hTLuE0x2Y4MqIMlc5pvksQDd2A==
X-Google-Smtp-Source: ADFU+vsDFgrzlLzo7PWHXfC4Na59e1GjR7LhLOqmWSGaiqojVW66Z6eiEsCwPhPF2x51Legtscepqg==
X-Received: by 2002:a05:620a:1250:: with SMTP id
 a16mr12752127qkl.497.1585074361932; 
 Tue, 24 Mar 2020 11:26:01 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id y5sm14014261qkb.123.2020.03.24.11.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 11:26:01 -0700 (PDT)
Date: Tue, 24 Mar 2020 14:26:01 -0400
From: Joel Fernandes <joel@joelfernandes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] Documentation: Clarify better about the rwsem non-owner
 release issue
Message-ID: <20200324182601.GC257597@google.com>
References: <20200322021938.175736-1-joel@joelfernandes.org>
 <87a748khlo.fsf@kamboji.qca.qualcomm.com>
 <20200323182349.GA203600@google.com>
 <20200324081538.GA8696@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324081538.GA8696@willie-the-truck>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>,
 "linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>, netdev@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 24, 2020 at 08:15:39AM +0000, Will Deacon wrote:
> On Mon, Mar 23, 2020 at 02:23:49PM -0400, Joel Fernandes wrote:
> > On Sun, Mar 22, 2020 at 08:51:15AM +0200, Kalle Valo wrote:
> > > "Joel Fernandes (Google)" <joel@joelfernandes.org> writes:
> > > 
> > > > Reword and clarify better about the rwsem non-owner release issue.
> > > >
> > > > Link: https://lore.kernel.org/linux-pci/20200321212144.GA6475@google.com/
> > > >
> > > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > 
> > > There's something wrong with your linux-pci and linux-usb addresses:
> > > 
> > > 	"linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>,
> > > 
> > > 
> > > 	"linux-usb@vger.kernel.org Kalle Valo" <kvalo@codeaurora.org>,
> > 
> > Not sure. It appears fine in the archive.
> 
> Hmm, I don't think it does. Here's the copy from LKML:
> 
> https://lore.kernel.org/lkml/20200322021938.175736-1-joel@joelfernandes.org/
> 
> Which works because it's in the To: correctly. But both linux-pci and
> linux-usb were *not* CC'd:
> 
> "linux-usb@vger.kernel.org Kalle Valo" <kvalo@codeaurora.org>
> "linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>
> 
> and searching for the message in the linux-pci archives doesn't find it:
> 
> https://lore.kernel.org/linux-pci/?q=Reword+and+clarify+better+about+the+rwsem+non-owner+release+issue
> 
> So it looks like there is an issue with your mail setup.

Hi Will and Kalle,
Thank you for confirming it. You are right, the archive shows the issue. I
will double check my client and see what's going on.

thanks,

 - Joel

