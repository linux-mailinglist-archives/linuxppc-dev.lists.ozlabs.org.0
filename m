Return-Path: <linuxppc-dev+bounces-1365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE7D978C3F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 02:43:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5C8z0G6Qz2yhM;
	Sat, 14 Sep 2024 10:43:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726274627;
	cv=none; b=BMzcQ4a8+/SCONPwm66akwJF2VQIxydWRqA9LQncN8N4ax91nQ0G7/NnbCNOui/JiqSljYK2cadvNt2vfHHcFq+muVIpNJUwnnpLN6O5g5nNG+my8VlRtjahEggrZfzJzHunxP5bopNp+X2pvGL7JCILU7F495+SgKZOCbGaN6oGpGGryxwUjgFrsHJewCuIuw8n+GOwiZvDLtZb8XGbazfIjuDCgGXN+DF+CJOoZ6iKU0E+AZki6LwrHdg9thjwrSq0QitXuCVxPKVmWSKCooz0gt9mFT5KViBCIVtbGfLSFQJuNUk/hzAs9eXkhDEScnmpVLQLL9twpU35iJdNBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726274627; c=relaxed/relaxed;
	bh=TUrY80ehNCka8U/7IMHBt62KZb3yd9vuXPbLAb87cq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4LwIGE9dBiUfIHlgaoIScotXDqq2GNGXjJpnaqzbLWR2PuG/leHwwB+jIp74eLaFjsGlPAzOkEF9+4W1BIrJJzPPtCm4ylx1gsYONTKqcToVzzgoTW9atmFSs+F1ig7E0PtuVy6KJDW7ftMnl8XyqqIIrG2p8FBsPMggkQhfTmSsxoXwarLh2+aDhNgMkoaxVnb9LDRateOlxGwOeP3KRt1ArO93VKljQ26zQQmurxpoJbt5DE+f3vb9Y37D7D+rQgH8dBdD9QDYfWO83/BOvjuVgnzt2FM6h3pr4fjWMSCXPnghiWTEAjGjAQ/IN/GdONxMjU9Lom/Xf9NxMG3pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DZDCBeyG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DZDCBeyG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5C8x6dWLz2yDw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 10:43:45 +1000 (AEST)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-39d2a107aebso112255ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 17:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726274621; x=1726879421; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUrY80ehNCka8U/7IMHBt62KZb3yd9vuXPbLAb87cq8=;
        b=DZDCBeyG+zv+KsKANzfuYXdyYBO/8AmRMEpoTCJ1pcs7OorAFzrXY1/dcyLBIUNwip
         VUHynamUhj5dCovUmFjAd6t9MUe6K1fo7WgnBKuIVzZYxDx02N8s21EzCG3YlkivdHAC
         In7Mbggx80wjDjgA7kSqsjuNxjLXpOYYL5+dfijBEaKwNph0/GFhPQilxtYSa5BhNZeL
         pEA7K3rKW842SxQRpFPBRkv3uTgqN+/Om13BiL5GM+cvEmwZj6mdpziLTpQRJGS7JhGX
         vfX/BBtyqWUz2oOIF33oXEmaOtWWtG+XRexeqO05Ym01fWd2uYgBhdoC3QRzSYVSmArl
         nYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726274621; x=1726879421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUrY80ehNCka8U/7IMHBt62KZb3yd9vuXPbLAb87cq8=;
        b=hWw5mq8m6EIAQ3m+BsePMmkt+eaVkr5YBVL/SsbzA16Hnt+tNkToq0fowTxOk2Egpn
         iU5umHtzaKruWD80rdxQfORY3taB3UACzpk5zf4Yc3Nr/kjZNZfMFIBKJlcP4C1he9sm
         c1SBbHOIifYTvFJ7t+aeYmYqlTmnZdSMaMdbTVtp6DM+PQ+TX3biI7SQlwOGvh6C4KPR
         6fS9yn4kyE2rt2l8XaME3m6IrXBQ67KhZ8IdFiVCeCvQYqlHIr9GIQIqNh44CnuRIlAI
         oZTt5P1a3EMrPvUjHaBpGpVpN41mzMFbsakAWlBh3TFvXL/l6ZWTTpJ8b8W1P9Y8smWD
         29xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw9ImJvT9b3V12JsYzJ0ZfzQFQRdgnJm2AEdf9paDRT/hQs+HRpSL+3QdSillwYSa4JDsbwTR2MPzGdSk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUqH7o+wq1ZWKugr1iBrzigDpOORQz6uFUmt+6+FtosP7uEEBp
	tf63IVQYsSyhejj6csKtOs3O0/g+iL68QQ8LnDivWFOONRRKPOKdSIu1Cz2vsG08wscePfz1L5n
	KhKnNjFN6auXYuSHP/aLPjOWGPHdriozHHlwM
X-Google-Smtp-Source: AGHT+IHSaLglF5wz9mRniAwttRxI65kTwctZxzJQBTwNtA0gsvJL1chvFzwE6pyoct9NSOfvWET8xaMujC2vxvEZXKc=
X-Received: by 2002:a05:6e02:1c41:b0:39f:3778:c896 with SMTP id
 e9e14a558f8ab-3a0856908e3mr10731525ab.5.1726274621421; Fri, 13 Sep 2024
 17:43:41 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240913213351.3537411-1-almasrymina@google.com>
 <ZuS0wKBUTSWvD_FZ@casper.infradead.org> <CAHS8izMwQDQ9-JNBpvVeN+yFMzmG+UB-hJWVtz_-ty+NHUdyGA@mail.gmail.com>
 <20240913171729.6bf3de40@kernel.org>
In-Reply-To: <20240913171729.6bf3de40@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 17:43:29 -0700
Message-ID: <CAHS8izO+AgUQwMXQ_17bRvLetcgSUJCXhOeQre2Z49XDd8kdrQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
To: Jakub Kicinski <kuba@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 5:17=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 13 Sep 2024 15:20:13 -0700 Mina Almasry wrote:
> > I have not reported the issue to GCC yet. From the build break thread
> > it seemed a fix was urgent, so I posted the fix and was planning to
> > report the issue after. If not, no problem, I'll report the issue and
> > repost the fix with a GCC bugzilla link, waiting 24hr before reposts
> > this time.
>
> I should have clarified, the "please post ASAP" applies
> to all devmem build fixes, ignore the cool down period :)
>
> > I just need to go through the steps in https://gcc.gnu.org/bugs/,
> > shouldn't be an issue.
>
> Just post the link here, I'll add it to the commit msg when applying.

Ah, I need a GCC bugzilla account before I can file bugs there. I
don't currently have one and creating an account involves emailing
them and waiting 24hr. I've done that and am waiting for an account.
I'll file the issue as soon as I get access and post the link here.
I'm also poking to see if anyone around already has an account and can
file the issue on my behalf.

--
Thanks,
Mina

