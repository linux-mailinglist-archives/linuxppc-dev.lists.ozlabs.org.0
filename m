Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 388E66C08C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 03:00:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pfycq0SqVz3cct
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 13:00:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SNcJ+0V8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SNcJ+0V8;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pfybs4s83z30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 12:59:51 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id s8so12796176lfr.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Mar 2023 18:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679277585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veHR4OeBVdmMM7ZoMMD2LEaF+ZQb01kUcsthEQZ+G8o=;
        b=SNcJ+0V8W1TJ4MntzJ+tWV7MHo4J3GQzdu8n70Frwh9hfIq8QJeAepOPu8iQN8X+PI
         718jEIJg59mxJDYCZRplEWtR5a0GmEVRh4EPAtJkC6Hq5jJlDEALE1binS+iGalKfCmv
         EGPciyy8uyBqEs3OImQsnGjVKl5PsCY2jrNl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679277585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veHR4OeBVdmMM7ZoMMD2LEaF+ZQb01kUcsthEQZ+G8o=;
        b=o2NHgpv4rcW5BCatKLYhphlbltC8bKeqySBir2U5akyY3eCATZrnGWX1PxrbVd4M90
         cFA69l2+7VioD7JDM+eotIPvYBvmaIwV5Keq9eGc7mrdni2Q2UULzBwUJNW0paT+UrZQ
         hyP8VDDMtfkafj+3kYvoqsB8ObqaTktqGvmzHVoXD9BE8lEppAKS/L1mUE5/LsujAduG
         7Zz1dCJ9IAO53dSeU//OnIeWDVD13oz5FZgtf1+JafbfQPj9zpPO5NPdxH8e/b+/NSwb
         g5H7ytKmlxmfQNe+TVi9CM0VWMoMJ5YWuKPusEPxlOrOUdsq55JxEuLX84kunJ3jQDDi
         SLrw==
X-Gm-Message-State: AO0yUKWMUQa3OjaBjcUMpU59QOPRrPzl7JCK2nGjzbE4dH7Sz4PzzJou
	0fOkjGTFBT1pp2Hw/jTkoeceG70EfKLCoo6xPtIKlg==
X-Google-Smtp-Source: AK7set9NoIcL0WdBeRjjWi+Eemr31s2Ux2qoNV0NglRZoPAScBMI6RdBJzw3qUfBEDf++kagSdEhLg==
X-Received: by 2002:ac2:5628:0:b0:4de:8588:b57c with SMTP id b8-20020ac25628000000b004de8588b57cmr5670511lff.28.1679277585393;
        Sun, 19 Mar 2023 18:59:45 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id w7-20020ac24427000000b004db4f2f08f7sm1483825lfl.28.2023.03.19.18.59.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 18:59:45 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id f18so13085622lfa.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Mar 2023 18:59:45 -0700 (PDT)
X-Received: by 2002:a17:906:2294:b0:927:912:6baf with SMTP id
 p20-20020a170906229400b0092709126bafmr2817236eja.15.1679277564111; Sun, 19
 Mar 2023 18:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230320005258.1428043-1-sashal@kernel.org> <20230320005258.1428043-9-sashal@kernel.org>
In-Reply-To: <20230320005258.1428043-9-sashal@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 19 Mar 2023 18:59:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgpK-Gm-nOybRKs1LTD5yb7rPHQ4+=PCDvq61mUpBskYw@mail.gmail.com>
Message-ID: <CAHk-=wgpK-Gm-nOybRKs1LTD5yb7rPHQ4+=PCDvq61mUpBskYw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.2 09/30] cpumask: fix incorrect cpumask scanning
 result checks
To: Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Vernon Yang <vernon2gm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Jason A . Donenfeld" <Jason@zx2c4.com>, gustavoars@kernel.org, edumazet@google.com, linux-scsi@vger.kernel.org, james.smart@broadcom.com, joel@jms.id.au, dmitry.osipenko@collabora.com, kuba@kernel.org, naveen.n.rao@linux.vnet.ibm.com, pabeni@redhat.com, Guenter Roeck <linux@roeck-us.net>, nathanl@linux.ibm.com, dick.kennedy@broadcom.com, Yury Norov <yury.norov@gmail.com>, jejb@linux.ibm.com, npiggin@gmail.com, tytso@mit.edu, martin.petersen@oracle.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 19, 2023 at 5:53=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> [ Upstream commit 8ca09d5fa3549d142c2080a72a4c70ce389163cd ]

These are technically real fixes, but they are really just "documented
behavior" fixes, and don't actually matter unless you also have
596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
optimizations"), which doesn't look like stable material.

And if somebody *does* decide to backport commit 596ff4a09b89, you
should then backport all of

  6015b1aca1a2 sched_getaffinity: don't assume 'cpumask_size()' is
fully initialized
  e7304080e0e5 cpumask: relax sanity checking constraints
  63355b9884b3 cpumask: be more careful with 'cpumask_setall()'
  8ca09d5fa354 cpumask: fix incorrect cpumask scanning result checks

but again, none of these matter as long as the constant-sized cpumask
optimized case doesn't exist.

(Technically, FORCE_NR_CPUS also does the constant-size optimizations
even before, but that will complain loudly if that constant size then
doesn't match nr_cpu_ids, so ..).

                   Linus
