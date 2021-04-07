Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B213565AA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 09:45:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFbzC1sGVz30C3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 17:45:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fb/P4hkT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fb/P4hkT; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFbyj0gxyz300C
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 17:45:00 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id w10so6900769pgh.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 00:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=5Kphp8J3Yhi8mWW3z/UUIbkkrK9S0cYnMnP/5h5hC9o=;
 b=fb/P4hkTtXrWm0Zy01LAxM9nUEmCJ/7loqvlzxKdKW8aqNO/dwJ6lQSmyrZ1BGQdub
 1KhDjiBJRQjo7yEe8CaZl3Ao2VeZFvzxq9uJtrwuPeMTZW+GSLjyB0OmMhJenyxZ8OXw
 9Nw0AbP6DjjA+QwhYVbSLuhMWdrBkZ3UufXisnfkkmG+nXjD+2JauLvGMAFrrGfF5jSE
 9WkRqr6heeqWzOdRbPcPXkoAH19P7++Vj7RgWn+MwS66MnXQ/NfIKoOSIRzNHOJ2AP7f
 XWLLp4aBZhPPCqNe1rrRUExTUfuKU6vMNDMukOkzxJ0idzyJLT3Sh9UyADqgg/EPRvy8
 yrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5Kphp8J3Yhi8mWW3z/UUIbkkrK9S0cYnMnP/5h5hC9o=;
 b=kYgFkXE//RafozZXkpALuBy3tBO+wUGTlD+TYk65yRu51ZR4aMzLjHmdfBxJHSdAc6
 3iUA6E4TEuA6CCYUUDXB/tSC+CLkzzowxxe2veFGj/bwHCHT3lruvka1OeAKBezHqNxM
 HYBVvGGrPs9DPJDxt815CSTm67UfiJPnzboBKFmpDC4z8H8DN/QjCt9t/v78BAKnMWnH
 vrgUOm9gMU+NqiBo5mb95ONBhwUNHCCYn+hu6mP354QrB5fP7fID5tTIQ1TSZigYluSI
 RPEOxeGuCF/PiLCT7pEKXwAekwwBi0in0m42gSRVlK+dqitSIW82s35XdImevZyMgO7p
 B7Nw==
X-Gm-Message-State: AOAM53284uKuXZLIkSrX0u9tNyi3xqr7c5bvuNesRlaCXyA73khhfWHY
 zXAB+/u4npiiTlP3Rqm7LK8=
X-Google-Smtp-Source: ABdhPJy9egQT77T6TcXp2e569RzNQaOwCsIksfN/29TRdDDt/tsJeWl0t6x+j99EqaMxnhscFN/HRA==
X-Received: by 2002:a65:5cc2:: with SMTP id b2mr2060462pgt.280.1617781496843; 
 Wed, 07 Apr 2021 00:44:56 -0700 (PDT)
Received: from localhost ([144.130.156.129])
 by smtp.gmail.com with ESMTPSA id j3sm20460295pfi.74.2021.04.07.00.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 00:44:56 -0700 (PDT)
Date: Wed, 07 Apr 2021 17:44:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 38/48] KVM: PPC: Book3S HV: Remove support for
 dependent threads mode on P9
To: Paul Mackerras <paulus@ozlabs.org>
References: <20210405011948.675354-1-npiggin@gmail.com>
 <20210405011948.675354-39-npiggin@gmail.com>
 <YG1WcjXTbGtsqHgY@thinks.paulus.ozlabs.org>
In-Reply-To: <YG1WcjXTbGtsqHgY@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1617779718.vvrcxrnvnp.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of April 7, 2021 4:51 pm:
> On Mon, Apr 05, 2021 at 11:19:38AM +1000, Nicholas Piggin wrote:
>> Radix guest support will be removed from the P7/8 path, so disallow
>> dependent threads mode on P9.
>=20
> Dependent threads mode on P9 was added in order to support the mode
> where for security reasons you want to restrict the vcpus that run on
> a core to all be from the same VM, without requiring all guests to run
> single-threaded.  This was (at least at one stage) thought to be a
> useful mode for users that are worried about side-channel data leaks.

Right.

>=20
> Now it's possible that that mode is not practically useful for some
> reason, or that no-one actually wants it, but its removal should be
> discussed.  Also, the fact that we are losing that mode should be
> explicit in the commit message.

Let's discuss. Did / does anyone really use it or ask for it that you
know of? What do other archs do? Compared with using standard options
that would achive this kind of security (disable SMT, I guess?) how
much is this worth keeping?

It was pretty simple to support when the P8 dependent theads code had
to support P9 anyway. After this series, now all that code is only for
that one feature, so it would be pretty nice to be able to remove it.
How do we reach a point where you'd be okay to remove this and tell=20
people to just turn off SMT?

Thanks,
Nick
