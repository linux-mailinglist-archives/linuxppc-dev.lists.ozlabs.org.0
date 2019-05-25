Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 057832A360
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 10:16:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459wzv4HlbzDqVN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 18:16:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=joelfernandes.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.b="tVo3uBLc"; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459wyN5KNjzDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 18:14:50 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id p1so5097463plo.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 01:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1c/wOZB7UIcO4fhNsFW8JEtKnsulp1uLNI0yUTmwDCo=;
 b=tVo3uBLcpEIXXZnhVPqSswFuc4q2UlbviAt3R2V2Thcy9J19G8Vh9t8IKakn6eWu7P
 LF+dLcUy8MISmgvZ0VGCcUrlJOi0R9kMHNLpfYwqA4+5Un+SNXosWy9sZwuR5XURngkR
 S1XgD6r2KG9fhVaAYKrKbQt6RqcK7l5hP89YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1c/wOZB7UIcO4fhNsFW8JEtKnsulp1uLNI0yUTmwDCo=;
 b=MOc7eGD3LsFjMcCVZcUPrTDJBHddD/KsXtbVxfsrJ+hw2vQxRd+WQPqr9Cssiu3Uzz
 o6CCOU1PXe9ZQGemoVRfvUfuYpqX2XA6IUrSoX8yHrrYQ9zZR87m+NlW4xfLOcHbPMhS
 SMpyI8IuBAbHR7ZSmKG/sfiAiTitDU4uoCrw4Eo9BpjjeObG4hUPTTy4WJTjuipbTMdr
 /jRCIw45jnqWYU34nyYmln6qurHXRYQGN6GDUly51QseJW24+pR0P1C2d92m+4BGAHA/
 cP8/mEXj6RurOPWt63gOsYemc1l/Dqbdt1OMOVPHzj/pUMSCC850Ps+yeinnWwakf6a2
 /ynQ==
X-Gm-Message-State: APjAAAW+3hrPqJ7DUdM792z/NvDw9Qhk2OF0zHvLOQftAWI0lEbqAjft
 PdW9MHgnBu1nZd+662J/UhD7GQ==
X-Google-Smtp-Source: APXvYqy398cjiqw83nLMzWHb1uka5NbJ8a1bov+JXtig8R0soLxRu+ibdZSFPg0qivDKo96oArfXwQ==
X-Received: by 2002:a17:902:10c:: with SMTP id
 12mr111734693plb.61.1558772087333; 
 Sat, 25 May 2019 01:14:47 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id 25sm4607225pfp.76.2019.05.25.01.14.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 25 May 2019 01:14:46 -0700 (PDT)
Date: Sat, 25 May 2019 04:14:44 -0400
From: Joel Fernandes <joel@joelfernandes.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH RFC 0/5] Remove some notrace RCU APIs
Message-ID: <20190525081444.GC197789@google.com>
References: <20190524234933.5133-1-joel@joelfernandes.org>
 <20190524232458.4bcf4eb4@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524232458.4bcf4eb4@gandalf.local.home>
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

On Fri, May 24, 2019 at 11:24:58PM -0400, Steven Rostedt wrote:
> On Fri, 24 May 2019 19:49:28 -0400
> "Joel Fernandes (Google)" <joel@joelfernandes.org> wrote:
> 
> > The series removes users of the following APIs, and the APIs themselves, since
> > the regular non - _notrace variants don't do any tracing anyway.
> >  * hlist_for_each_entry_rcu_notrace
> >  * rcu_dereference_raw_notrace
> > 
> 
> I guess the difference between the _raw_notrace and just _raw variants
> is that _notrace ones do a rcu_check_sparse(). Don't we want to keep
> that check?

This is true.

Since the users of _raw_notrace are very few, is it worth keeping this API
just for sparse checking? The API naming is also confusing. I was expecting
_raw_notrace to do fewer checks than _raw, instead of more. Honestly, I just
want to nuke _raw_notrace as done in this series and later we can introduce a
sparse checking version of _raw if need-be. The other option could be to
always do sparse checking for _raw however that used to be the case and got
changed in http://lists.infradead.org/pipermail/linux-afs/2016-July/001016.html

thanks a lot,

 - Joel

> 
> -- Steve
