Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8974F8584
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 19:06:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ78W5FWBz3bbn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 03:06:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TmpaZ6JI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::136;
 helo=mail-il1-x136.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TmpaZ6JI; dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ77q5hhnz2yZf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 03:06:13 +1000 (AEST)
Received: by mail-il1-x136.google.com with SMTP id t4so4658222ilo.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 10:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2shIerg3ZjkZ+hlnELwnPDYoovZR3rLiNksYdZNlR/w=;
 b=TmpaZ6JIqPGs+Ma4m3GP49IfdLPHB8PEbnHSjkWx9pLDkPlhGSLwemhYzfQ0NlWnno
 Op5Md0NoFP9YmDy3uXvYu20A19fwrJWLvZOXalgpVJT09z7QNwfuPZguUnVtXpwSeOgQ
 WIXdpEaf2WhoEyn9z0S4VpviPGsKfeed7JVMMkoRvI2yAVSAuNFwXCoaO67ft26gZY58
 fLZOHVS3IF7MW7RSAdrPxBlSU+ShDRhBRUKY5vTZrUl9WnSMhYsHSkM8LuYf/846gWAu
 skb7gRlaajdGF3WGab4QCul6QfU2ikDkTESjH3OG/1L3H5QHRQCFHxS4fv/r6E/XXA2U
 feSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2shIerg3ZjkZ+hlnELwnPDYoovZR3rLiNksYdZNlR/w=;
 b=jLmpQRx00QpfNF34yu0/cjH188o3p7HuQsPCEz4eRXSDQh0pMk6XRkKGtNGVobZt8X
 znY+9kWwU415rIfwoWekpsAPRptyHRupTSm//wfBRo+cHkfqMOYeMEDhjQ4dDfsXwsQj
 X8j0SvVehG/N/YxT7QlrBv62aURsY4c5m77wTjKnca1PAmDI/u7uGnMIAViAZl7mnErU
 sxoUKo30XjYmEyP80IG1NJqNBxl4HI9Hw5D0tLWkXcMwciLA65xYmfFI2mUF+EAZ2CUt
 uvz3tCLBTCHllzqgPFujcWGsdrs8hOMACBVjlc0cqmRqcKw6XBIKu3AcRB1UJeVNHt9U
 dQFA==
X-Gm-Message-State: AOAM533666U0/LBoGaBkliuupO025pgzFcamzSMau8zme3lfnMGMGr4O
 m11KmH5NG+5zxgRJ8iSaPCWqdpM5wc0aWMe72+s=
X-Google-Smtp-Source: ABdhPJx4pyWHHkwr3I6PP1ppWaPPVhTkblMHBdqTeyH51o5vidrq6q7KC3VE+MtKa7OCbtjwfTqpxav/vK3S3LB1RxU=
X-Received: by 2002:a92:c908:0:b0:2c1:a287:8868 with SMTP id
 t8-20020a92c908000000b002c1a2878868mr6697149ilp.321.1649351169248; Thu, 07
 Apr 2022 10:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zhZaN0+KqP7oMoyXTSkDhLjZwWvnj7coa1ZVve9M+jsQ@mail.gmail.com>
 <20220406195011.GP4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2x8_783jhEhC3AozH9=xj40UO-rZT2BRJsg5gaLdBz=9w@mail.gmail.com>
 <CANiq72mYXnQo_Y39k23rY-rdJay8GEPJ8MhU-y7-bjkw=zRC+Q@mail.gmail.com>
 <20220407151555.GR4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220407151555.GR4285@paulmck-ThinkPad-P17-Gen-1>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 7 Apr 2022 19:05:58 +0200
Message-ID: <CANiq72k7BWjOU8=-dXD4bYWbK1i+rjDNaAohGrU42yJzcBm7uQ@mail.gmail.com>
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
Cc: rcu <rcu@vger.kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 7, 2022 at 5:15 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> Ah.  So you would instead look for boot to have completed within 10
> seconds?  Either way, reliable automation might well more important than
> reduction in time.

No (although I guess that could be an option), I was only pointing out
that when no stall is produced, the run should be much quicker than 30
seconds (at least it was in my setup), which would be the majority of the runs.

Cheers,
Miguel
