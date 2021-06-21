Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 091D13AF05E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 18:46:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7wQv4xBXz3bsy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 02:46:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256 header.s=google header.b=hfhbQW9o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ugedal.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=odin@ugedal.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256
 header.s=google header.b=hfhbQW9o; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7wQK1j0wz2yYH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 02:45:59 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id o19so13891289qtp.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 09:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uged.al; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h1idqoQuvymBsBQAvv2q4seH7J1czRDhztw/KvBhqig=;
 b=hfhbQW9odLh/zR2d8D9OJm5iCfviL/O71DddJSwyHN/G/uo2GDxuQ/WxmL1vZGWsAq
 1eW2B4e+R4yz89hU1c943ySI2tA5hkP3CWZ8Vn5GIgJd2MrGjnIyKCE0JGprpu9xzJEI
 /Qdt9eEia57hC7zqtA/W4jTETaf4NWPZi4QnFe+XJlH/q69j4P+8amSg+DkZ7NI02B2G
 2GhFa/+jrji66IZcOdThxHZIjiHuJcN0q2KxFx4PuXqa/Ie9VVaiQlAm+McpcVFpOAPl
 zEWgltEPaCWjWuLFd0DJGRMwquvO70oNxLDTa38wr394ttQ25Uw+LEm3fovb40wbveru
 DVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h1idqoQuvymBsBQAvv2q4seH7J1czRDhztw/KvBhqig=;
 b=KWU3iNEQrKwuli/ycdOSEzpl6GAiFtra2I3SWYC420P3xbccp2aSr9cp31K4ytrK/w
 rETjvXBuB5m4bKQ8Fne8JHoD6+bLymt8v6JzhyWRB0gK+z1jSUw7dj9OySvssaIZPLY+
 LGUzXBkl1iHjv1EVD16Kgrkcg77crECUmSGxj9KsgkIVsiwr7A5fmx+cuMB99lQMFwtW
 YRI+0X+ji+LPxPH7AWOV0OZJkBnAhd0TtSDYvS89dc80IS9Z3NgXxs4uU9FHOTmAuN/9
 BpyRoFC3mV/ftbhwGjCC0CvTbXrszE5X8bkmRbWMpR9P7QMt4n3X2egLe+P39YEY5PeV
 +YcQ==
X-Gm-Message-State: AOAM532r/+jIhTLhVOkuHV5zG8qhupsTNQvSBjIIAPLl6fB32oDOJy/q
 EuZb8jioEC9OTRyxQCFngYWxCpuhV4J0D6NtoIo90A==
X-Google-Smtp-Source: ABdhPJzfEquR2QO+umOic9DAn0AdD1jVWAYZuPfiKJt/sgNTwqZqw6QblJjx9+vfS5OsjUDZCV6WMfryL7AvY8Kj96c=
X-Received: by 2002:ac8:7412:: with SMTP id p18mr292907qtq.49.1624293954415;
 Mon, 21 Jun 2021 09:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
 <CAFpoUr3g5t3Z0BtW4-jnYomc3cdY=V5=Zt94-C+fHOjGWa107w@mail.gmail.com>
 <CAKfTPtC=aXasuSNvn+A3152-4xoOTWROhJpZAVq6RLh1Hacpng@mail.gmail.com>
 <CAFpoUr2o2PVPOx+AvatjjUvqPTyNKE3C6oXejyU3HVMmtCnzvQ@mail.gmail.com>
 <6D1F875D-58E9-4A55-B0C3-21D5F31EDB76@linux.vnet.ibm.com>
 <CAFpoUr0iWFTq2grtnX_EH6KnZLZQCg1o6_yv1gfDK8WdbHmUCA@mail.gmail.com>
 <CAFpoUr3Wy9raHx+Dc0S8TB_Xi=E+Epsh_pA3DEFZP4eKf7s07A@mail.gmail.com>
 <20210621162243.GA29874@vingu-book>
In-Reply-To: <20210621162243.GA29874@vingu-book>
From: Odin Ugedal <odin@uged.al>
Date: Mon, 21 Jun 2021 18:45:15 +0200
Message-ID: <CAFpoUr1hyAeFSCvyJU4SKjtEKn6Hq1RLuu1eZPhRt1SaAq7=TQ@mail.gmail.com>
Subject: Re: [powerpc][5.13.0-rc7] Kernel warning (kernel/sched/fair.c:401)
 while running LTP tests
To: Vincent Guittot <vincent.guittot@linaro.org>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Peter Zijlstra <peterz@infradead.org>, Odin Ugedal <odin@uged.al>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

man. 21. jun. 2021 kl. 18:22 skrev Vincent Guittot <vincent.guittot@linaro.org>:
> I would prefer that we use the reason of adding the cfs in the list instead.
>
> Something like the below should also fixed the problem. It is based on a
> proposal I made to Rik sometimes ago when he tried to flatten the rq:
> https://lore.kernel.org/lkml/20190906191237.27006-6-riel@surriel.com/
>
> This will ensure that a cfs is added in the list whenever one of its  child
> is still in the list.

Oh, yeah, that is a much more elegant solution! It fixes the issue as well!

Feel free to add this when/if you submit it as a patch:
Acked-by: Odin Ugedal <odin@uged.al>

Odin
