Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE54F8A6F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 01:15:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZHKV29R2z3bgR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 09:15:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GrG2qMP7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e;
 helo=mail-ej1-x62e.google.com; envelope-from=zhouzhouyi@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GrG2qMP7; dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZHJr5ltSz2yHB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 09:14:34 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id qh7so13822714ejb.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 16:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hCyVboVUMPZRo6TCLUWM5ite4XgyvgGmMlQpKKqCowA=;
 b=GrG2qMP7peJK3yh7+RDthSYJ//So1IVDy9vGbZMtlQFpxCmwpcOKLT14mMaqvCS6c8
 pezqIjuxHzZWIWU3siGlmijZpUfQ+Dy8DElqN9hElT4anUAl59t77HSjafgUBAhS8FD6
 m8mtbLejgIab93m+4ta3CFenMUsh/9GP32voxnMvmmyJ+/GDlnxcZge0vO8X/rZ0X/4y
 j6K6RaVe2VFyZpjAGJv3W2rxTC8WER+9XNRvE41rC50VroN7EiHthsMuu7p+KzpdqzVo
 db2Ti/gJhCIqi3/CbvkE8lnQpV1NQk/OtdCY4YULljzJOQjjDKMAZRqJoy9QzXed8p6n
 7mYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hCyVboVUMPZRo6TCLUWM5ite4XgyvgGmMlQpKKqCowA=;
 b=woKZtM64pivw5Pzyh0vBb6VLI7lZlZZV2L7/637VQkA5injlmEpT2qtZXOXNB6peNe
 gmomk7hugpVmTtJUUVpt2QcG8/+EJ8AQtxM1oxlIX9fRFsay8L/QWbT8D/x28jWoJILi
 OMMNCVPa7V/lMmmZbLW1lrGydi7GY0iHeokHZ92W5hsQtjTKOu0wIytgNdwrY23ckgCe
 9sXuZdCEfCZ9cXe9VIbm1g9WUJXxwgb/7w4DC94XtXZihHBrBAkmn5SG2pY1q9u8p0vT
 IJ03DWl3nq7Xhg89BpecEACmmf9wF/I9hqI42iTCN4XlaYISWNG3X9hwGN50/ye+dH1O
 +w7g==
X-Gm-Message-State: AOAM533FjeBJSHyAbXhVwTN/w8IWtMqC7iX4uhv0N5PVQdYT2xA+EjNb
 jCILmrz22IOYy8sliO3AJw8Jne7Hgl2uJ7rOooE=
X-Google-Smtp-Source: ABdhPJx5uiKTVZj1SoMAR7GkPqFXPjtVnFlop1C4TgW0U9VAY3y3a03KwRCCZhzWJ1jeAPhX3Pa6hDNtJFuPZQ3NNoE=
X-Received: by 2002:a17:907:6d07:b0:6e7:979e:9c0a with SMTP id
 sa7-20020a1709076d0700b006e7979e9c0amr15502794ejc.614.1649373271786; Thu, 07
 Apr 2022 16:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zhZaN0+KqP7oMoyXTSkDhLjZwWvnj7coa1ZVve9M+jsQ@mail.gmail.com>
 <20220406195011.GP4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2x8_783jhEhC3AozH9=xj40UO-rZT2BRJsg5gaLdBz=9w@mail.gmail.com>
 <CANiq72mYXnQo_Y39k23rY-rdJay8GEPJ8MhU-y7-bjkw=zRC+Q@mail.gmail.com>
 <20220407151555.GR4285@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72k7BWjOU8=-dXD4bYWbK1i+rjDNaAohGrU42yJzcBm7uQ@mail.gmail.com>
 <20220407175500.GV4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220407175500.GV4285@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Fri, 8 Apr 2022 07:14:20 +0800
Message-ID: <CAABZP2yDe3dU0DtigvAE4CQLAipvT81Bw4LrF5WjLSiP5nq1UA@mail.gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
To: "Paul E. McKenney" <paulmck@kernel.org>
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
Cc: rcu <rcu@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Paul and Miguel

On Fri, Apr 8, 2022 at 1:55 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Thu, Apr 07, 2022 at 07:05:58PM +0200, Miguel Ojeda wrote:
> > On Thu, Apr 7, 2022 at 5:15 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > Ah.  So you would instead look for boot to have completed within 10
> > > seconds?  Either way, reliable automation might well more important than
> > > reduction in time.
> >
> > No (although I guess that could be an option), I was only pointing out
> > that when no stall is produced, the run should be much quicker than 30
> > seconds (at least it was in my setup), which would be the majority of the runs.
>
> Ah, thank you for the clarification!
Thank both of you for the information. In my setup (PPC cloud VM), the
majority of the runs complete at least for 50 seconds. From last
evening to this morning (Beijing Time), following experiments have
been done:
1) torture mainline: the test quickly finished by hitting "rcu_sched
self-detected stall" after 12 runs
2) torture v5.17: the test last 10 hours plus 14 minutes, 702 runs
have been done without trigger the bug

Conclusion:
There must be a commit that causes the bug as Paul has pointed out.
I am going to do the bisect, and estimate to locate the bug within a
week (at most).
This is a good learning experience, thanks for the guidance ;-)

Kind Regards
Zhouyi
>
>                                                         Thanx, Paul
