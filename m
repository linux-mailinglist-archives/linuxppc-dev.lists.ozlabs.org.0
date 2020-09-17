Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7672926E90B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 00:40:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BssNq2l1ZzDqgs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 08:40:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=IKgCm7fp; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BssKf0Yk6zDqg8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 08:37:22 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id k8so2155687pfk.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 15:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rajz9PikgG3gC9n3hSwih8axQBgiqMcr2MSEy5EC2hE=;
 b=IKgCm7fprYE6guOBHaJ8b25mZYLlrvPk/VPKlASuNTsk3thWY4WBG1wbQ0I4h4kqt8
 n5lD/FeK/AD1anZIuSvxXr4jBDpDRzPXi5mBvjvtLegI/Nn8IIAub08KWyFywx3KhhO8
 5gvh2rLj0oWFfxECWCQCIOKizX9I7hK+h3BB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rajz9PikgG3gC9n3hSwih8axQBgiqMcr2MSEy5EC2hE=;
 b=IgwcOJVQA0NsZBg3Md3lfMoFN4kkOs9CwM5SEcwppWYTaKWhJj/NqJUO4K5DQqBx6S
 M5vUM0uvR55/Ndr2y1wwgTJZMX+IJQk7MFL6CtA7bdq4eztPvQjRKOnbG1XteFiwYsJR
 pvJ66IDhP6IkTaWJLYNSlnw8NAu9+ZDOxQ8gDIHYICs53tnbTbG8HBEqpLPI3QPfYrGs
 Ja/DM0znn0BOa4Fmsi7QLn1+7v5hUPWYG8344Xa09OnpgXuW6aOu65mEBrhiRZ5ZUpIy
 wqyzFMU37VepxTCzGAm5H9bvw6sw1fh3e+cwBWMY+I3vi8JOgDW/Zs7ECQJRDy2f+zvz
 D4bg==
X-Gm-Message-State: AOAM530r8ieF3DiUCQt/iH1in0bAvMpv/MRZAPZ1qBcDj5vaCMlKrwDD
 cXNw1nbA/f7I3Orwgg+QfiDa2Q==
X-Google-Smtp-Source: ABdhPJwzlNUESDRWjOLfnSZtOQ0cDxcX2YDZYAgm6TunzxQqiCRXbQqtcdHWkb5mLwZFRGGL0Tbp9g==
X-Received: by 2002:a63:3856:: with SMTP id h22mr4241223pgn.451.1600382238308; 
 Thu, 17 Sep 2020 15:37:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id fs24sm652250pjb.8.2020.09.17.15.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 15:37:17 -0700 (PDT)
Date: Thu, 17 Sep 2020 15:37:16 -0700
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/seccomp: fix ptrace tests on powerpc
Message-ID: <202009171536.7FACD19@keescook>
References: <20200630164739.1268222-1-cascardo@canonical.com>
 <202009081505.D9FE52510B@keescook>
 <20200911180637.GI4002@mussarela>
 <875z8hrh2o.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875z8hrh2o.fsf@mpe.ellerman.id.au>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 linuxppc-dev@lists.ozlabs.org, Shuah Khan <shuah@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 13, 2020 at 10:34:23PM +1000, Michael Ellerman wrote:
> Thadeu Lima de Souza Cascardo <cascardo@canonical.com> writes:
> > On Tue, Sep 08, 2020 at 04:18:17PM -0700, Kees Cook wrote:
> >> On Tue, Jun 30, 2020 at 01:47:39PM -0300, Thadeu Lima de Souza Cascardo wrote:
> ...
> >> > @@ -1809,10 +1818,15 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
> >> >  	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
> >> >  			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
> >> >  
> >> > -	if (!entry)
> >> > +	if (!entry && !syscall_nr)
> >> >  		return;
> >> >  
> >> > -	nr = get_syscall(_metadata, tracee);
> >> > +	if (entry)
> >> > +		nr = get_syscall(_metadata, tracee);
> >> > +	else
> >> > +		nr = *syscall_nr;
> >> 
> >> This is weird? Shouldn't get_syscall() be modified to do the right thing
> >> here instead of depending on the extra arg?
> >> 
> >
> > R0 might be clobered. Same documentation mentions it as volatile. So, during
> > syscall exit, we can't tell for sure that R0 will have the original syscall
> > number. So, we need to grab it during syscall enter, save it somewhere and
> > reuse it. I used the test context/args for that.
> 
> The user r0 (in regs->gpr[0]) shouldn't be clobbered.
> 
> But it is modified if the tracer skips the syscall, by setting the
> syscall number to -1. Or if the tracer changes the syscall number.
> 
> So if you need the original syscall number in the exit path then I think
> you do need to save it at entry.

... the selftest code wants to test the updated syscall (-1 or
whatever), so this sounds correct. Was this test actually failing on
powerpc? (I'd really rather not split entry/exit if I don't have to.)

-- 
Kees Cook
