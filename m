Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2684D2A65C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 20:15:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45BBHD1KtRzDqSZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2019 04:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=joelfernandes.org
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.b="X0CnhJKS"; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45BBFy0glDzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2019 04:14:13 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id u17so7203351pfn.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 11:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WMR94oFTY+OqH2rjdVLemgAhQSEwpDtMoTvHog5j0sQ=;
 b=X0CnhJKSN5RJR4iBBE0j8IyN20bJySbgLRYLCC51oQloSv5szaUMYCNZpmOF7YbrDu
 djpT8FbnXBj3XQkIAMR6RR9RpzFcWEVC3LhAMyeOqLUzZjvP8fjtU34iUpZcXld1un1M
 b02atJSdTlxwLlu/aDOH5x6Q5ekm4aDR1+1vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WMR94oFTY+OqH2rjdVLemgAhQSEwpDtMoTvHog5j0sQ=;
 b=hMDmg1WDRZJaXRFLAbYnmNN3waZMRcKfNBoaE/xZilxYamvfT5Wdq0bUA0RXhbUScS
 qeQExqGvS2BZEi3xxUzDNev+U0DNCOgaXqiJed3U/+TbUsdqkV/gF9ECe+3znf0ugfC7
 Hjdixz6B+Xgfagd+M6HkMUjerPXzqXM2/Y20RMJ5HCaG3f34xKzJUeIqgPbnGbBQDWaR
 s8/S7w2sv8ixWIZ9IFFKwj2P+EIsNo4jCCuVMLhh8djEP0vEoBQR8J+i64Wnzn8eMQGr
 h94YRCeelYnReglmHQS6j82pM8rNfBdRMpC9XnxxpPCpupquhWB+VyqSkH1zrIBw843r
 4nxw==
X-Gm-Message-State: APjAAAXAyYAb+QItggJNyHtjEiyO6wApCMmlaNiskamYyfZSqjxW60aq
 jCQ9Koi8vEqDn/iv4fpwWuFfug==
X-Google-Smtp-Source: APXvYqyQRiZeJdnv8NV0jJQ1QNMV+NOKlT6Luw5GwD0AE0gpx9GAm4B91udlCkCjw5QI0crgiiIVzA==
X-Received: by 2002:a63:4710:: with SMTP id u16mr11132086pga.447.1558808050038; 
 Sat, 25 May 2019 11:14:10 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id y13sm8409814pfb.143.2019.05.25.11.14.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 25 May 2019 11:14:08 -0700 (PDT)
Date: Sat, 25 May 2019 14:14:07 -0400
From: Joel Fernandes <joel@joelfernandes.org>
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH RFC 0/5] Remove some notrace RCU APIs
Message-ID: <20190525181407.GA220326@google.com>
References: <20190524234933.5133-1-joel@joelfernandes.org>
 <20190524232458.4bcf4eb4@gandalf.local.home>
 <20190525081444.GC197789@google.com>
 <20190525070826.16f76ee7@gandalf.local.home>
 <20190525141954.GA176647@google.com>
 <20190525155035.GE28207@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190525155035.GE28207@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: rcu@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Ingo Molnar <mingo@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 25, 2019 at 08:50:35AM -0700, Paul E. McKenney wrote:
> On Sat, May 25, 2019 at 10:19:54AM -0400, Joel Fernandes wrote:
> > On Sat, May 25, 2019 at 07:08:26AM -0400, Steven Rostedt wrote:
> > > On Sat, 25 May 2019 04:14:44 -0400
> > > Joel Fernandes <joel@joelfernandes.org> wrote:
> > > 
> > > > > I guess the difference between the _raw_notrace and just _raw variants
> > > > > is that _notrace ones do a rcu_check_sparse(). Don't we want to keep
> > > > > that check?  
> > > > 
> > > > This is true.
> > > > 
> > > > Since the users of _raw_notrace are very few, is it worth keeping this API
> > > > just for sparse checking? The API naming is also confusing. I was expecting
> > > > _raw_notrace to do fewer checks than _raw, instead of more. Honestly, I just
> > > > want to nuke _raw_notrace as done in this series and later we can introduce a
> > > > sparse checking version of _raw if need-be. The other option could be to
> > > > always do sparse checking for _raw however that used to be the case and got
> > > > changed in http://lists.infradead.org/pipermail/linux-afs/2016-July/001016.html
> > > 
> > > What if we just rename _raw to _raw_nocheck, and _raw_notrace to _raw ?
> > 
> > That would also mean changing 160 usages of _raw to _raw_nocheck in the
> > kernel :-/.
> > 
> > The tracing usage of _raw_notrace is only like 2 or 3 users. Can we just call
> > rcu_check_sparse directly in the calling code for those and eliminate the APIs?
> > 
> > I wonder what Paul thinks about the matter as well.
> 
> My thought is that it is likely that a goodly number of the current uses
> of _raw should really be some form of _check, with lockdep expressions
> spelled out.  Not that working out what exactly those lockdep expressions
> should be is necessarily a trivial undertaking.  ;-)

Yes, currently where I am a bit stuck is the rcu_dereference_raw()
cannot possibly know what SRCU domain it is under, so lockdep cannot check if
an SRCU lock is held without the user also passing along the SRCU domain. I
am trying to change lockdep to see if it can check if *any* srcu domain lock
is held (regardless of which one) and complain if none are. This is at least
better than no check at all.

However, I think it gets tricky for mutexes. If you have something like:
mutex_lock(some_mutex);
p = rcu_dereference_raw(gp);
mutex_unlock(some_mutex);

This might be a perfectly valid invocation of _raw, however my checks (patch
is still cooking) trigger a lockdep warning becase _raw cannot know that this
is Ok. lockdep thinks it is not in a reader section. This then gets into the
territory of a new rcu_derference_raw_protected(gp, assert_held(some_mutex))
which sucks because its yet another API. To circumvent this issue, can we
just have callers of rcu_dereference_raw ensure that they call
rcu_read_lock() if they are protecting dereferences by a mutex? That would
make things a lot easier and also may be Ok since rcu_read_lock is quite
cheap.

> That aside, if we are going to change the name of an API that is
> used 160 places throughout the tree, we would need to have a pretty
> good justification.  Without such a justification, it will just look
> like pointless churn to the various developers and maintainers on the
> receiving end of the patches.

Actually, the API name change is not something I want to do, it is Steven
suggestion. My suggestion is let us just delete _raw_notrace and just use the
_raw API for tracing, since _raw doesn't do any tracing anyway. Steve pointed
that _raw_notrace does sparse checking unlike _raw, but I think that isn't an
issue since _raw doesn't do such checking at the moment anyway.. (if possible
check my cover letter again for details/motivation of this series).

thanks!

 - Joel

> 							Thanx, Paul
> 
> > thanks, Steven!
> > 
> 
