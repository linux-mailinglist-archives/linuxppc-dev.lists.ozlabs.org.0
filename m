Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 999A78794D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 14:11:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvDYP3cTsz3vZW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 00:11:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.43; helo=mail-ed1-f43.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvDXy0nVwz3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 00:10:56 +1100 (AEDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5687e7662a5so12589a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 06:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710249053; x=1710853853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4ja3iog88j2Hss/XwP/DdI3V35vXAswKW3ib9vo7Qs=;
        b=D68ODfiJRL1pcmTrY/ONgX8FB3m+Jrb/SBD0oh07rgzrdQc+rSMAGlUd2B1g0Q/5fx
         ULYyETM2VmmfevYaGSrWZk+7++Kr8glgqXiRK/421y+1bR1+6+Kivp+OiTTf7WKw4mAZ
         J45U1UGs+IzSkqQPbEluCYCjhuC31D5aGnZJy912a8N6NGoQ3a+0lWZU6K/vclSqSUhS
         QOZefBarWIwPxjdL8BeWM8RFKUs4Gfjbtkf7ydc3TS3crMNAfDW2shAdWRMxqNdmzVHl
         b1VQtFCWe0BMyaZAj3MXn5I1kZeYvbAEf1kDd142m3Y67iU+R+ogADyWfiHqc6xOd7qD
         yAIg==
X-Forwarded-Encrypted: i=1; AJvYcCU1uwr37Nj1Dwylf/gp86rFJHnrJraWt681yUbv8AacnXOPWjp+joC3JqWaT0IjRBRpoj4IS6EGgb+gOEy4U/DZ5CfKRIWWubrTY9gfyw==
X-Gm-Message-State: AOJu0YxqMn+et9TfBE/2rBi745pyx8Xfxs+fa93VRQhko3oTRtP9j9gN
	I55O4yhHCLkpKaM6JVUlDH2MnP9GwUlI7vOqEeRqU5gQ/q3lHD4l
X-Google-Smtp-Source: AGHT+IHuceyyYHkUOaAljfBqAEl5bvAI/Gcnis4eZ65TWmFN53iBonYcNeZX1LkTV4hoCmCy8zlEzQ==
X-Received: by 2002:a50:d483:0:b0:566:ef9:30ce with SMTP id s3-20020a50d483000000b005660ef930cemr1233447edi.3.1710249052547;
        Tue, 12 Mar 2024 06:10:52 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-002.fbsv.net. [2a03:2880:30ff:2::face:b00c])
        by smtp.gmail.com with ESMTPSA id n23-20020a5099d7000000b005682f47aea7sm4124428edb.94.2024.03.12.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 06:10:52 -0700 (PDT)
Date: Tue, 12 Mar 2024 06:10:50 -0700
From: Breno Leitao <leitao@debian.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kernel: Fix potential spectre v1 in syscall
Message-ID: <ZfBUWqSArbGvZpLn@gmail.com>
References: <1534876926-21849-1-git-send-email-leitao@debian.org>
 <baf6af2b-d6e1-4df8-9466-98d19f8c765f@csgroup.eu>
 <ZfAa59Z8njiGUnRW@gmail.com>
 <874jdb4sj9.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874jdb4sj9.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 12, 2024 at 10:07:54PM +1100, Michael Ellerman wrote:
> Breno Leitao <leitao@debian.org> writes:
> > On Tue, Mar 12, 2024 at 08:17:42AM +0000, Christophe Leroy wrote:
> >> +Nathan as this is RTAS related.
> >> 
> >> Le 21/08/2018 à 20:42, Breno Leitao a écrit :
> >> > The rtas syscall reads a value from a user-provided structure and uses it
> >> > to index an array, being a possible area for a potential spectre v1 attack.
> >> > This is the code that exposes this problem.
> >> > 
> >> > 	args.rets = &args.args[nargs];
> >> > 
> >> > The nargs is an user provided value, and the below code is an example where
> >> > the 'nargs' value would be set to XX.
> >> > 
> >> > 	struct rtas_args ra;
> >> > 	ra.nargs = htobe32(XX);
> >> > 	syscall(__NR_rtas, &ra);
> >> 
> >> 
> >> This patch has been hanging around in patchwork since 2018 and doesn't 
> >> apply anymore. Is it still relevant ? If so, can you rebase et resubmit ?
> >
> > This seems to be important, since nargs is a user-provided value. I can
> > submit it if the maintainers are willing to accept. I do not want to
> > spend my time if no one is willing to review it.
> 
> My memory is that I didn't think it was actually a problem, because all
> we do is memset args.rets to zero. I thought I'd talked to you on Slack
> about it, but maybe I didn't.
> 
> Anyway we should probably just fix it to be safe and keep the static
> checkers happy.
> 
> I'll rebase it and apply it, I'm sure you've got better things to do :)

Awesome. Thanks Michael!
