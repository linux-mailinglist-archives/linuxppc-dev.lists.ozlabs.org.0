Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E2E2D9304
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 06:55:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvVwt4PTfzDqSf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 16:55:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OU2rJ+vK; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvVv52QVtzDqBX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 16:53:50 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id b5so5966132pjl.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 21:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=NqlRmCcPn1hL++OXjNViT5mh7QFqv3t1WGYe29FT4N0=;
 b=OU2rJ+vKQqYkt0zKH+mic4jtuIu5GNnbiOiORyCT+A09h9fwQVJL2rUCwqMLf/iuvX
 9ZevRGt+gw00mt8IToXd9T4cMAxsajKDwuMJ3rHqXjunXGxeic1yFQN6+BViqPc3jG7q
 EHj/gFwO3qj7id91+Aj8fVSteXlSH1WbD3B2ObgpDbyX8867Mu/Zc/nZkwqf3u3MeTWQ
 GUeAIzmYgifLuP+jbiHnVevOjjad1G3brEZa0Wsx/7D97e94816uenMsagjZ4YzhON5a
 kRKy8l2UgGjX8qjPTJPf7BQTJmLavUTfJA2Wx7MZfep/q6BF6KkbSj6Q3l16mESODtcO
 iBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NqlRmCcPn1hL++OXjNViT5mh7QFqv3t1WGYe29FT4N0=;
 b=owOxPyydl5BAX+5kwZkN1lhd8Fb/vc3ETRNG78cU7cCN1WFdiaP85AtM9BZJ6V7lU5
 7dbb1wb8h77vOajoF+XRed7Hz7GjNHP6iNXtsY4kZIeiDa0qHdzEDmz7UpWhisr/HePc
 cqOIzd+AYP7h1aRQ+jC+9zVjrs63pttb4kkBAso6Mj6uOrwW5QCPFQo1NmkW1h83iE2M
 J774rFeyiUo+pKjrFbHZWiizVTtr9yN4VadiYO6fFQ257fe9sAmEp8+9pmnj+owzX8NJ
 U6yqZVk7uA/w+RCTYlRaI7nR1teTYeRCH7t3mx812ZLC2/dR49IxUHZBSDF4cgJ3xzLt
 MN+g==
X-Gm-Message-State: AOAM531Vv1/usy0PTJP38pwlqcxECKSm1Qk0R5xOoTGdw9XtG1hO4wvz
 S7MIuIWzRQgePqy2BTMzSPs=
X-Google-Smtp-Source: ABdhPJwf3b9TbWiNhAad5JT/pHJRZTvkOiZpc3S6PMZHL+xFsjBjgGypaMaAxP447A+pDMg1mPexiA==
X-Received: by 2002:a17:90a:fb92:: with SMTP id
 cp18mr23372071pjb.203.1607925226593; 
 Sun, 13 Dec 2020 21:53:46 -0800 (PST)
Received: from localhost ([220.240.228.148])
 by smtp.gmail.com with ESMTPSA id v126sm17639802pfb.137.2020.12.13.21.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 21:53:45 -0800 (PST)
Date: Mon, 14 Dec 2020 15:53:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/8] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: Andy Lutomirski <luto@kernel.org>
References: <1607152918.fkgmomgfw9.astroid@bobo.none>
 <116A6B40-C77B-4B6A-897B-18342CD62CEC@amacapital.net>
 <1607209402.fogfsh8ov4.astroid@bobo.none>
 <CALCETrWFjOXAd5=ctX3tzgUbyfwM+bT-f8WY_QWOeuDdFxhWbg@mail.gmail.com>
 <1607224014.8xeujbleij.astroid@bobo.none>
 <CALCETrV5BzXuUYm5YAoEKPZZPfLrbHckvwBHzWKrxZS8hqzHEg@mail.gmail.com>
 <1607918323.6muyu2l982.astroid@bobo.none>
In-Reply-To: <1607918323.6muyu2l982.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1607924970.hd6nln4qe5.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of December 14, 2020 2:07 pm:
> Excerpts from Andy Lutomirski's message of December 11, 2020 10:11 am:
>>> On Dec 5, 2020, at 7:59 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>>
>>=20
>>> I'm still going to persue shoot-lazies for the merge window. As you
>>> see it's about a dozen lines and a if (IS_ENABLED(... in core code.
>>> Your change is common code, but a significant complexity (which
>>> affects all archs) so needs a lot more review and testing at this
>>> point.
>>=20
>> I don't think it's ready for this merge window.
>=20
> Yes next one I meant (aka this one for development perspective :)).
>=20
>> I read the early
>> patches again, and I think they make the membarrier code worse, not
>> better.
>=20
> Mathieu and I disagree, so we are at an impasse.

Well actually not really, I went and cut out the exit_lazy_tlb stuff
from the patch series, those are better to be untangled anyway. I think=20
an earlier version had something in exit_lazy_tlb for the mm refcounting=20
change but it's not required now anyway.

I'll split them out and just work on the shoot lazies series for now, I
might revisit exit_lazy_tlb after the dust settles from that and the
current membarrier changes. I'll test and repost shortly.

Thanks,
Nick
