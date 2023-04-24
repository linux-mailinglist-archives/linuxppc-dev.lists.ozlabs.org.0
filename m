Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3BD6ED7A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 00:14:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4zth4q8fz3chy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 08:14:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lgW/07YT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lgW/07YT;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4zsr2Kb4z30Kr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 08:13:18 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-246fd87a124so4469423a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 15:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682374394; x=1684966394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9rvKKuJVj1CnXeKwNCCdeFPzJf6ElUXCptJ/Xncu1o=;
        b=lgW/07YTzPgxutnXZ8yZ9NDI2sbzEYZRwHOtg5AvLIGZaO42Hme6ZIPkRlXSGKXu4L
         tSsp1nw+IYnBdrFXuEqruxS15GqiOnl2olmJwMx1T2EIizWecMs43X5AvjAQFchtsZhX
         Uc3vILp44cAhwxN3xMRwpQPkuMRAxD4/iyKkPDuOJoClMQ6jTM41zvFrpsRbu7CCpq7N
         OhpBgr5rEwrEdi45ul8uj517SM+wEyjtp6Llk6aV5P3GoaSo7caowbk3fDg4JIpqkJig
         J41g5iMu/sp3yTwV3tCJI3ftaUZvtmq2t8zNs+oOr4EIKq5XmlYWq6Vx6FKKAQtPeRYT
         qTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682374394; x=1684966394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9rvKKuJVj1CnXeKwNCCdeFPzJf6ElUXCptJ/Xncu1o=;
        b=hdyMLqlew1H/QrIQz+2CTsdCwNdpEEYZWilZheQdbrs2LJWbgwxXbPd/0OS9besWhV
         9FkV6nut9xAtX8vVhxbL40VppKWWd5oftZVoEvLTfCTsuMelgQ3Ttx7qG75ILQi9+ge/
         9kLZ1LrV7aLDXfvGHEMNNF/ZHfJjN0qrfNEBMAHWA0vtECLOVPWgYc288CL+wblCl8xp
         VRXnUhtyjNCoPesxr7NQG9hxBNbPn2dwGtQd6m1w3zccQ8qfy5VKTHP3yYzZKO1bLcP3
         pEqHG4mL9cdxQI/qpKRfzPgKb3tDfq5QKqknffZ4yLo6DIkp0CnJMRRmCVWPoe0piVGl
         hVeQ==
X-Gm-Message-State: AC+VfDwFmDBIwedrVBsOPxqLIdfAni4LNaNp7x3At+PdTQnw+td0zmtv
	d3jN2JdL7CPmsvgtLDuQ7lbwJbSGSXZyUpLFq+s=
X-Google-Smtp-Source: ACHHUZ7NDc8ftZgKp3D6+xjLBB5r4jOIbLW9ESTjJBqzh7b7RRVFRxjd4F4qyRKzKqNsTXfebgAdu1O2qNo8hfgzOKg=
X-Received: by 2002:a17:90b:a49:b0:24b:d66c:523c with SMTP id
 gw9-20020a17090b0a4900b0024bd66c523cmr1346155pjb.9.1682374394571; Mon, 24 Apr
 2023 15:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <87cz3tylwx.fsf@mail.concordia>
In-Reply-To: <87cz3tylwx.fsf@mail.concordia>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 25 Apr 2023 06:13:03 +0800
Message-ID: <CAABZP2zk2kpgocnGk_on3r3awyQcVyEtBQsby=brW=ciFSCYjA@mail.gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 25, 2023 at 6:07=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> > Dear PowerPC and RCU developers:
> > During the RCU torture test on mainline (on the VM of Opensource Lab
> > of Oregon State University), SRCU-P failed with __stack_chk_fail:
> ...
> > by debugging, I see the r10 is assigned with r13 on c000000000226eb4,
> > but if there is a context-switch before c000000000226edc, a false
> > positive will be reported.
> >
> > [1] http://154.220.3.115/logs/0422/configformainline.txt
>
> Says:
>
> CONFIG_CC_VERSION_TEXT=3D"powerpc64le-linux-gnu-gcc-10 (Ubuntu 10.4.0-4ub=
untu1~22.04) 10.4.0"
>
> Do you see the same issue with a newer GCC?
I would like to try that in the newest GCC ;-), please give me about a
day's time because I am going to compile the gcc ;-)
>
> There's 12.2.0 here:
>   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/12=
.2.0/
>   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc64le/1=
2.2.0/
>
> Or if you can build in a Fedora 38 system or container, it has GCC 13.
OK, I will try it or similar

This is a very learningful process for me, thank you all ;-)

Cheers
>
> cheers
