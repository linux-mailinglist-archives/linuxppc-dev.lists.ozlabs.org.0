Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4208D2A4DC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 16:22:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45B562321tzDq9R
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2019 00:22:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=joelfernandes.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.b="NX/KmtDC"; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45B53m0mMMzDqQL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2019 00:20:01 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id p15so5319367pll.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oA6FcJ72zNid4SwAO5Y6rnUXHdUQj0L4tCh0ZCLJSFI=;
 b=NX/KmtDCs4EGb9mO5SMMkYszAarGd0UZP0S8vAwwQjy5ElvPnArSQCM79p6zDDG599
 0Nrwt8GmeJlUpxdahkhFUQgjljvJWEl8W0oRgaWVvzii8pMGxtDBNNez3szb6V5hR7Sl
 /oVTbrXCcQaK/wd3nTy2BIpckmRhnlhqmFMt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oA6FcJ72zNid4SwAO5Y6rnUXHdUQj0L4tCh0ZCLJSFI=;
 b=YnXZjmuW0Mc0o0jfIjRswXzVu6zte+PCTnjhxLfeSQSoyOqrrxRcD1VXn2I35fhtaF
 4yfbKYzcCz8Ci94RkgZFzYutkYFcSk8kB4TfK4z4DywIuSKn4IS9lZl7DKos+fY/dJey
 KRcUaiBkWJfQ+AQ/410AtY4I0J70K2Ey1dCRGxlKUBqK9HFAgViu/UUOW+uRPVXNKJL2
 Y6M7HYymnPI2kzVYH+HHFgj35xgERu7p+kH/I1y2b0oUUxb/krIcp5itzXMPMPCNWPc7
 DTCts/0u7krNSk2qRuBFqtFSjwlO3qe0Ac/1w12VknGGqI27pfe/oRYSQWY48Di83nq3
 DiPw==
X-Gm-Message-State: APjAAAWkVf5Zy192mVda/cSh+vQGvN+DMJzogzYuAkKQlB0XSwfcPrYg
 +U3gF94M/8UiBXu23Ag9ONq0yA==
X-Google-Smtp-Source: APXvYqz1DtDvRXpDvMqOaGFx8+a+/FEFbXY2Ry7LB+HHkerKQ+Avr2mpCrR118QII1Whv7IzQ6nqfw==
X-Received: by 2002:a17:902:6bcb:: with SMTP id
 m11mr42398103plt.318.1558793996314; 
 Sat, 25 May 2019 07:19:56 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id p63sm6795234pfb.70.2019.05.25.07.19.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 25 May 2019 07:19:55 -0700 (PDT)
Date: Sat, 25 May 2019 10:19:54 -0400
From: Joel Fernandes <joel@joelfernandes.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH RFC 0/5] Remove some notrace RCU APIs
Message-ID: <20190525141954.GA176647@google.com>
References: <20190524234933.5133-1-joel@joelfernandes.org>
 <20190524232458.4bcf4eb4@gandalf.local.home>
 <20190525081444.GC197789@google.com>
 <20190525070826.16f76ee7@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190525070826.16f76ee7@gandalf.local.home>
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
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Josh Triplett <josh@joshtriplett.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 25, 2019 at 07:08:26AM -0400, Steven Rostedt wrote:
> On Sat, 25 May 2019 04:14:44 -0400
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> > > I guess the difference between the _raw_notrace and just _raw variants
> > > is that _notrace ones do a rcu_check_sparse(). Don't we want to keep
> > > that check?  
> > 
> > This is true.
> > 
> > Since the users of _raw_notrace are very few, is it worth keeping this API
> > just for sparse checking? The API naming is also confusing. I was expecting
> > _raw_notrace to do fewer checks than _raw, instead of more. Honestly, I just
> > want to nuke _raw_notrace as done in this series and later we can introduce a
> > sparse checking version of _raw if need-be. The other option could be to
> > always do sparse checking for _raw however that used to be the case and got
> > changed in http://lists.infradead.org/pipermail/linux-afs/2016-July/001016.html
> 
> What if we just rename _raw to _raw_nocheck, and _raw_notrace to _raw ?

That would also mean changing 160 usages of _raw to _raw_nocheck in the
kernel :-/.

The tracing usage of _raw_notrace is only like 2 or 3 users. Can we just call
rcu_check_sparse directly in the calling code for those and eliminate the APIs?

I wonder what Paul thinks about the matter as well.

thanks, Steven!
