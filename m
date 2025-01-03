Return-Path: <linuxppc-dev+bounces-4626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E16A006FB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 10:31:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPdd92zn8z30TH;
	Fri,  3 Jan 2025 20:31:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735896717;
	cv=none; b=nmG4VQb0kaSHhI1DHKxYFtqjYIFebTOwVFcoypWOrYBQdwKkGSjXfCkuBATLNaNqBsMSi9z/y4eb6nRCO9z/i4Z35ex3OmHpMfcVBjEZpk/PzLSLXrlYw9F+LibOVXPiowx7hT/2l16PV8MFusmJ7TLUOJG41tfbrXTsRrW9OqLCcu9Kse0IESWcUQdKJDZTsGt7zLlT63m698Ple3GSha5DS6qLPgTlbR8vzXDvXsMpSo+9rvUQPIjDXqqTRZF6j87iTGSOI5e27Coan/F9/A9JG4tzXpXQ+H4QaxAA3i/Okjpmv+43vU45ba9vaG+4GpNeE1VoGesHxqGfuGQ0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735896717; c=relaxed/relaxed;
	bh=bhvKQFYrEHAPSyOkSeOFfnhuFEMUFCuy5EuswH6w1MU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7hMQumGRVYXrkiFvn7JUOdJ/Pfu2dOpOSDChXwycpSdcbCUa4IBn6DSyoO+sMTEwFQIlHGRLxQI/WqLrCQTz49WWfT/cyyVlw5j7GCGThHjt6SwUA3ai2VyJgIAQPCYOBgJ0TjyAsVJ9kdXapVVx6xdmqiPpAV3HAHfERTOzYYB9XipBnnyQKsHwStmNP/gL7PPTFWhaG1AXilxdFOKagrxxCEc4Dahyd+cSkDooQglp6rJIr9STs/YbZTPtZaC8KMTQQgaQ793Kb9n2ZEV2evYugIaZBiq8ytsQ+zOF9zJdMwgG+CA5/rRb7sCkDSueMeTGidTDL0Bnct1RcUeww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.208.42; helo=mail-ed1-f42.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.42; helo=mail-ed1-f42.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPdd71Vzsz30PH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 20:31:53 +1100 (AEDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so19440848a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 01:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896707; x=1736501507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhvKQFYrEHAPSyOkSeOFfnhuFEMUFCuy5EuswH6w1MU=;
        b=lsIhAmFUVcl7fKaqUwDc9aQmG8eKUBglcnq+DI0QJZmJ7meh9o/eZY0yHAi5ShGI6a
         XDua/yzC6IglyOhpM+oipdJYAkEQzZwc7g3daeW+Mh1B/kD3FdzG1KOjx5iyclnN3LEX
         1EEGTVl/CiOaOL2RcFfOsqWl6vzhsj4EbnI4yMnfLVM6IzJXnaJFt/M07LGR0tsaVnse
         kKBWSUIqvpcv+RZPhz4p8XoJB2XCXFnnIwJKsl5Is7GPDlUw9eEmebee2DYJc7xXuB1z
         KIbyNsgnlc8q+EbJYlDJLvKMgi6n58ti2FY+BNojY1wiJZm3Dqciw7/XyNG5qKEAwWNM
         aLyw==
X-Forwarded-Encrypted: i=1; AJvYcCVlSA0V9sth50F6fqCl3517BtMhNAmj7DQvUcdLxoq+3ifAn9gmdWQP4Mw7yj0NAoavlb1nTUzHLrCsKUw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzbTRE1jUKtpX4Rz+2ogLtFp6GWiSPrZuDyAhySgOT1QHU1gVCs
	K9xm80FY6BwEw+ZvjWZsL+PzeB/lerKf1aoV8BmxSuZ5973+B9sHAqVyyJQ5kwI=
X-Gm-Gg: ASbGncs8Li4Yf+TrLZIVs/tF0m//ET0GY24sKmHU+BY7zoyPzMbMS8UQgLh6FZ3WTbT
	6nmo+R37uQxX3gbGX9Vfl5GdbvC72VEMfSeD3aYzkXEg9PV4mlzwTSzA3mWhTReYsd/mXsfxHCb
	lu5OtqgklY0FPN7NamVcAZ76fMthxz6te/itkeAjhKKDJEY0tLid/Yh6MOrPsSg0Ke3KmedPoig
	XKlFVHaG8radMQVRQin2Z3KtNNkH9PPEYcxknyeAhaPtCC/7XjurT7NX9oEDZAdpGEsW0ulkCA9
	9K/VwKxYP4zLJIydvUI=
X-Google-Smtp-Source: AGHT+IFbbChqSnNrxmWP7Cpb8gRYjsuAA6PSAHLk72a7pTzg/5bapNZMXeAUoYCw5gE8kM9AscdKSQ==
X-Received: by 2002:a05:6402:270a:b0:5d3:f6cb:73e7 with SMTP id 4fb4d7f45d1cf-5d81dd908edmr38012754a12.13.1735896706714;
        Fri, 03 Jan 2025 01:31:46 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fede4csm19893848a12.63.2025.01.03.01.31.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:31:45 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so19440637a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 01:31:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXns9m1WmhZeuA7uXWjmkdTCoIqn9D5jvdyhG8yrikI57bsIExAl5mw5Q0pZ/i4fAmRqWVcfQkR4OBID9I=@lists.ozlabs.org
X-Received: by 2002:a17:907:7f2a:b0:aab:cdbd:595a with SMTP id
 a640c23a62f3a-aac2702986emr4003780166b.3.1735896704686; Fri, 03 Jan 2025
 01:31:44 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <06988f959ea6885b8bd7fb3b9059dd54bc6bbad7.1735894216.git.geert+renesas@glider.be>
 <20250103085652.GA31691@lst.de>
In-Reply-To: <20250103085652.GA31691@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 10:31:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUw23VNeO44dPzwbzMnCBws+twM2JVm7mQ745Ey1Cq4FQ@mail.gmail.com>
Message-ID: <CAMuHMdUw23VNeO44dPzwbzMnCBws+twM2JVm7mQ745Ey1Cq4FQ@mail.gmail.com>
Subject: Re: [PATCH] ps3disk: Do not use dev->bounce_size before it is set
To: Christoph Hellwig <hch@lst.de>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>, Geoff Levand <geoff@infradead.org>, 
	Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Christoph,

On Fri, Jan 3, 2025 at 9:56=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrote=
:
> On Fri, Jan 03, 2025 at 09:51:25AM +0100, Geert Uytterhoeven wrote:
> > dev->bounce_size is only initialized after it is used to set the queue
> > limits.  Fix this by using BOUNCE_SIZE instead.
> >
> > Fixes: a7f18b74dbe17162 ("ps3disk: pass queue_limits to blk_mq_alloc_di=
sk")
> > Reported-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> > Closes: https://lore.kernel.org/39256db9-3d73-4e86-a49b-300dfd670212@gm=
ail.com
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Looks fine:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks!

> But looking at the report it seems like no one cares about ps3 upstream,
> and in fact the only person caring at all rather rants on youtube than
> helping upstream, so maybe we should just remove the ps3 support entirely=
?

I am a bit surprised Geoff Levand didn't catch this in his regular testing.=
..
Hmm, looks like his last Tested-by tag predates v6.9.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

