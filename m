Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944CD8C187C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 23:36:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kyhux5Ip;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb51317lFz3dVR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 07:36:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kyhux5Ip;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb50J6b9dz3cfT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 07:35:28 +1000 (AEST)
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-7f82c932858so440808241.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 14:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715290524; x=1715895324; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Yo3NJl/+D3HjDzk2u86J+UDtYtrXvOHQjT1qCvhfSw=;
        b=Kyhux5IpLcQSnnMMC0RT6nFnc09Pz70FMA3gH8RHx+r8yy1X/X57qTzWiQJWOqG3lF
         uvJdZQkCzJmoVXUGEZrwhTUE+k2nLN0iOJoow2l9czjukVDlqYU7GwR04vmI6/ZVAqrs
         day9+q2zKYtxE+Tkygow7sGWh6dx3d7QrIFY1lX9PaGkTihhOuZYZPWkhiwLasfudHbM
         NuI9mxm/SvYQpw1xqh4Fh7uK/wd5ptctvKuGFEvQRZ2pvNiV6Tyv5YIvp/hczi9vXXZi
         ZHm/sD3gqRhTaGDMu1w7xdf9fdOR4OXzbyg/JZwD8vxo+1FiY8Sb+3DS56eZtS7YUPmq
         1Tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715290524; x=1715895324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Yo3NJl/+D3HjDzk2u86J+UDtYtrXvOHQjT1qCvhfSw=;
        b=m9lS/h/KKDpPnCOthDWuJAiC7oiQiIQ4FHeeFMtlQWqGwdyrCt9yYZFa3udt4vwDw3
         owX/4RvzS/SOPRwmRUbuBDu5ocdaMu9J9NZgWj9/UrOo1L3flwp9eKmD5njfUPgUYNk1
         1Fv5v2+DK0BdQQhjMxgn+46xws3quLTDTqMclcKPE0q3Lr9hIPZwUxBpK+ibAm+rFEv8
         pQ1bO7kZzq2jYcAH7eNdsCLC9fa2WQMXLK2+10j74Rxpa6d3w3/J1yrvfuL8AlM9xz2k
         Cdbot2ZrWm/7y1GcjOSc/h+hbQGtUeIqlGSRV2yt7Cwt+sNxe7CV/+Z1cngOgwfMVVlK
         JoNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkijkysgi+HCE0OxxCQjQ3YncNp9novmD5SnuZFhstTi9lohvFhlyBkApqnOnl7kdh250WBOof7FC+LLq6uZFxxrXSrlEQ/oS/gLa3UA==
X-Gm-Message-State: AOJu0YxQ2HmJwrauU0VYgwn3/+6+kTr98RZKH7mM2T9Z61qG6+KUFdUe
	sWXb70UTSx7Smx7k6+/7ujVzKl6ZHFp6EGFO3t2XPateLtQdj2ppxIUBzkHhRUOf+H763aJh0Px
	QdaMWe5lH08W59PIRf1oWNkglvyA=
X-Google-Smtp-Source: AGHT+IEDcACUSM80VSR45ArKgZiWP4c9kqdCth3bLU1kbXd1shP57oMwEOz/0YVPrQ6VzKWJJJR4QpRgtprtu6Wem7s=
X-Received: by 2002:a05:6102:3ece:b0:47e:5c2e:5695 with SMTP id
 ada2fe7eead31-48077e45cc6mr1030292137.23.1715290523779; Thu, 09 May 2024
 14:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240507190111.16710-1-apais@linux.microsoft.com>
 <20240507190111.16710-2-apais@linux.microsoft.com> <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
 <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com> <20240508201654.GA2248333@kernel.org>
In-Reply-To: <20240508201654.GA2248333@kernel.org>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 9 May 2024 14:35:12 -0700
Message-ID: <CAOMdWSJ2vV5gYpEQUCpAco3W9ZKKmmj1LXGzk7kTbAaBmsQknQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
To: Simon Horman <horms@kernel.org>
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
Cc: marcin.s.wojtas@gmail.com, kda@linux-powerpc.org, edumazet@google.com, linux-acenic@sunsite.dk, louis.peens@corigine.com, angelogioacchino.delregno@collabora.com, borisp@nvidia.com, cooldavid@cooldavid.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, aneesh.kumar@kernel.org, tlfalcon@linux.ibm.com, naveen.n.rao@linux.ibm.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, jes@trained-monkey.org, nnac123@linux.ibm.com, richardcochran@gmail.com, sean.wang@mediatek.com, npiggin@gmail.com, linux-net-drivers@amd.com, cai.huoqing@linux.dev, matthias.bgg@gmail.com, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, mlindner@marvell.com, netdev@vger.kernel.org, oss-drivers@corigine.com, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, stephen@networkplumber.org, linux-rdma@vger.kernel.org, bryan.whitehead@microchip.com, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
  davem@davemloft.net, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > > On Tue, May 07, 2024 at 07:01:11PM +0000, Allen Pais wrote:
> > > > The only generic interface to execute asynchronously in the BH context is
> > > > tasklet; however, it's marked deprecated and has some design flaws. To
> > > > replace tasklets, BH workqueue support was recently added. A BH workqueue
> > > > behaves similarly to regular workqueues except that the queued work items
> > > > are executed in the BH context.
> > > >
> > > > This patch converts drivers/ethernet/* from tasklet to BH workqueue.
> > >
> > > I doubt you're going to get many comments on this patch, being so large
> > > and spread across all drivers. I'm not going to bother trying to edit
> > > this down to something more sensible, I'll just plonk my comment here.
> > >
> > > For the mvpp2 driver, you're only updating a comment - and looking at
> > > it, the comment no longer reflects the code. It doesn't make use of
> > > tasklets at all. That makes the comment wrong whether or not it's
> > > updated. So I suggest rather than doing a search and replace for
> > > "tasklet" to "BH blahblah" (sorry, I don't remember what you replaced
> > > it with) just get rid of that bit of the comment.
> > >
> >
> >  Thank you Russell.
> >
> >  I will get rid of the comment. If it helps, I can create a patch for each
> > driver. We did that in the past, with this series, I thought it would be
> > easier to apply one patch.
>
> Hi Allen and Russell,
>
> My 2c worth:
>
> * In general non bug-fix patches for networking code should be targeted at
>   net-next. This means that they should include net-next in the subject,
>   and be based on that tree.
>
>   Subject: [PATCH net-next] ...
>
> * This series does not appear to apply to net-next
>
> * This series appears to depend on code which is not present in net-next.
>   f.e. disable_work_sync
>
> * The Infiniband patches should probably be submitted separately
>   to the relevant maintainers
>
> * As this patch seems to involve many non-trivial changes
>   it seems to me that it would be best to break it up somehow.
>   To allow proper review.
>
> * Patch-sets for net-next should be limited to 15 patches,
>   so perhaps multiple sequential batches would be a way forwards.
>
> Link: https://docs.kernel.org/process/maintainer-netdev.html

 Thank you very much for taking the time to write back.
Since the patches that are necessary for this series are not in
net-next, I could not target net-next.

 I will wait for the patches to land in net-next, and the v2 will
be broken into multiple smaller sets(per driver).

Thanks.
 Allen
