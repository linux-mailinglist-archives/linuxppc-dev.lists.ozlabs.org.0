Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C973C84AE80
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 07:51:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TZLfeizE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTYmp5Qszz3cLV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 17:51:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TZLfeizE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTYm0730Jz2yk8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 17:50:23 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e055c89dd9so212550b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Feb 2024 22:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707202220; x=1707807020; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kdFePQ6nG6QtYf63LeF1ar0dDM9VOG+LaoM7J5+2Vc=;
        b=TZLfeizEYRBf2Z1gOL2SS9qGLJUOXPLoTjk5uTMUpz5izjEYwaLA+3iXSzahFGAnhH
         bmbruW5H3L9RrGuuiEpowBGp9XeTHBZqrnr4cJuHj974Tfp/0ieuVEx9FXHG9Kvd1c0y
         V5tmbwj0WYhMlLbOay9oUNLrfbUexdiJ17Q3c2p0OyLeKqmzZlwrmgDahytt8XY7opVp
         ae3FZu8fzTkGTxpz1KeOP/VvsGfhWQcff3KxZKLPi0QZKA3mtqcjYRbv+ZywuhF7vPdV
         bEWzNhMdYVTUHSnCGv/ODKENUnvoz90OUOoTpuPIj5dh2WS976bcp+9IZtu1/M+XuMDx
         FsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707202220; x=1707807020;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/kdFePQ6nG6QtYf63LeF1ar0dDM9VOG+LaoM7J5+2Vc=;
        b=i+Eggk9iiPUtjWvJWczfBCyNde7Bo04vuVk0FJlVTNwVnG5Guwc4hgsH8SGWTclitF
         LRCMGW/EMXag8L2Rznj3T/xyJsRJYsDUlK12dgk+6t+h+uWeQ6R/fQ8qTygoY6iGkhkS
         1JW2NAsdQoe9d2GYIsPPZz/mTkMNhgIatHwqNj+TkdNwVv98ROvU9bbVCbBxw8gRaOg/
         3zx1DhBbW9o0V6K2pO25oSrOHAmyDxUpvHx7YBJENbH8CZL4n1Wccu+xqTD8sqAgMg6E
         MQ1Y+SUA1wDHWrcy3JslY5lxlZM9xbQU5+GisnmhQPfXLTfhvOsIuh3EzvA36q4tmGUn
         mvAg==
X-Gm-Message-State: AOJu0Yyf/iprke7od6y3eH10QBaiHAYuh+So2R/Eg7t9vwDteuK/nieu
	iknqcsBmHZlDEWnILnLRWpzUtBg0cdj7jBKtTuOiKaldatEO3jDg
X-Google-Smtp-Source: AGHT+IGvKjwL4W6wJxS1qhH+LUiqHU6y2PSnrtaNe+q1U78MQ6ejPupj7SdHUe8tv5SU8x3TR8Jtww==
X-Received: by 2002:a62:ce0c:0:b0:6e0:44fd:687c with SMTP id y12-20020a62ce0c000000b006e044fd687cmr2639380pfg.6.1707202219680;
        Mon, 05 Feb 2024 22:50:19 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUvLpbZd5PGRt9Lm8N+YxGtxYwm7xHfKI7AfNe4JnD0ZcHDGb4AiM6NCATC6xn8QdWQ7NnNJLWk+kkBwOTxc56IZtQtmY8DKXtgHY1+qeUgs9uAsMQyiZ+X/vqtR2tV2xXah+hz1+oZB6q494nfuF8de38wjFHr0LvBPN4cE0PqFb1isJBeXY0+ZINCzwerxHiffe4gmQ8/5cXyG5x0zefEY564nhd/WYeamEjd6j7LO9LnyY03yySaesDTzrqzJXlg60ITFn3aaZgs55To53DiDkTS87aw5kJdm0gWt3+p7XWYJD2wcv23dZSRQdF4hMVBXOgXhMYh7qauuz7L43+RUiNHxAlCqso7yFLpK22NcpIl6M8oANLjVq6E6a7DDjUzPYHWrB325Ei3onpNjXC2063fiP4bW98HdFOdDRi1wOQiCpBBIgP6As8rsl2aebzRWNh5Rd6Azs95pkeONk7DWagx9+geb8Rp43+j7HU=
Received: from localhost ([1.146.47.2])
        by smtp.gmail.com with ESMTPSA id x23-20020aa784d7000000b006e04f2a438bsm1025925pfn.105.2024.02.05.22.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 22:50:19 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Feb 2024 16:50:08 +1000
Message-Id: <CYXSOBQAP9FF.3GPR99T207WJY@wheely>
Subject: Re: [kvm-unit-tests PATCH v2 4/9] migration: use a more robust way
 to wait for background job
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Marc Hartmayer" <mhartmay@linux.ibm.com>, "Thomas Huth"
 <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240202065740.68643-1-npiggin@gmail.com>
 <20240202065740.68643-5-npiggin@gmail.com> <87y1bzx8ji.fsf@linux.ibm.com>
In-Reply-To: <87y1bzx8ji.fsf@linux.ibm.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin
 Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Feb 6, 2024 at 12:58 AM AEST, Marc Hartmayer wrote:
> On Fri, Feb 02, 2024 at 04:57 PM +1000, Nicholas Piggin <npiggin@gmail.co=
m> wrote:
> > Starting a pipeline of jobs in the background does not seem to have
> > a simple way to reliably find the pid of a particular process in the
> > pipeline (because not all processes are started when the shell
> > continues to execute).
> >
> > The way PID of QEMU is derived can result in a failure waiting on a
> > PID that is not running. This is easier to hit with subsequent
> > multiple-migration support. Changing this to use $! by swapping the
> > pipeline for a fifo is more robust.
> >
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
>
> [=E2=80=A6snip=E2=80=A6]
>
> > =20
> > +	# Wait until the destination has created the incoming and qmp sockets
> > +	while ! [ -S ${migsock} ] ; do sleep 0.1 ; done
> > +	while ! [ -S ${qmp2} ] ; do sleep 0.1 ; done
>
> There should be timeout implemented, otherwise we might end in an
> endless loop in case of a bug. Or is the global timeout good enough to
> handle this situation?

I was going to say it's not worthwhile since we can't recover, but
actually printing where the timeout happens if nothing else would
be pretty helpful to gather and diagnose problems especially ones
we can't reproduce locally. So, yeah good idea.

We have a bunch of potential hangs where we don't do anything already
though. Sadly it doesn't look like $BASH_LINENO can give anything
useful of the interrupted context from a SIGHUP trap. We might be able
to do something like -

    timeout_handler() {
        echo "Timeout $timeout_msg"
	exit
    }

    trap timeout_handler HUP

    timeout_msg=3D"waiting for destination migration socket to be created"
    while ! [ -S ${migsock} ] ; do sleep 0.1 ; done
    timeout_msg=3D"waiting for destination QMP socket to be created"
    while ! [ -S ${qmp2} ] ; do sleep 0.1 ; done
    timeout_msg=3D

Unless you have any better ideas. Not sure if there's some useful
bash debugging options that can be used. Other option is adding timeout
checks in loops and blocking commands... not sure if that's simpler and
less error prone though.

Anyway we have a bunch of potential hangs and timeouts that aren't
handled already though, so I might leave this out for a later pass at
it unless we come up with a really nice easy way to go.

Thanks,
Nick

>
> > +
> >  	qmp ${qmp1} '"migrate", "arguments": { "uri": "unix:'${migsock}'" }' =
> ${qmpout1}
> > =20
> >  	# Wait for the migration to complete
> > --=20
> > 2.42.0
> >
> >

