Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC8B18C527
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 03:04:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k6XC5hKjzDrSL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 13:04:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WIrbZ26Z; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k6V81Z3QzDrRP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 13:02:23 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id u68so2434340pfb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 19:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=pS16UFS9Sd5MXf2yyt3PZHIxkrIfRhj0n2t480rTsMc=;
 b=WIrbZ26Z2gO4M3k0kvN+LLnMgMZPb8KoHYDUWv8Wa2/u+9nJYomE/fpBXRhP/tmd63
 OGeJ3u5a56rZIchfmEeDuJ9CCR8EMvmPmaGUThsJABiktavUb3Q12WwOFKwiZ3rDvf6Y
 +WKorPXRMi33jjV4BjMD00yItLxBKLLkrEtSIkMMRTU41HTkTBkShUwqpjNsD25kafpm
 aO1o8qsWrOADONR8bBiBW214nJyvcT+78b5QBbQs/c01cKcmwWkG+Qgpat2Ud0YEkYYj
 dHUTee0ILsU6A9IXB9kbhurxGs+DItvkLipneW4nroK+YyImQbsOFKN09TCFuBi+XKBb
 THZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=pS16UFS9Sd5MXf2yyt3PZHIxkrIfRhj0n2t480rTsMc=;
 b=YmQp9bkM9nam/0MVM9vFncPTeXpub5etFxZnfIVudnRbM6d8WREt+rS4CGyZ28ahuJ
 1dtn5fZk3Km0R6NMByZMbmHcZXHD9pH8kzDa1WhNjsgaRbbmEn7dxUr5UZdl00K7ypJd
 W9qFbd+9Jt0IxR1IKr+feEuaXvRfhUgKJYeDEkFIheDyIH3EGu6omF+yJopsmds9i04z
 wO1f+6mldYuy80iaqneLAlRi5b3FAvzhhC7qXqfIMw4EOKGeeTytnqrFaOpJCUMvMEDa
 +6OZu3r8WeNFsgGbIjb+E3BCjIh0jdOggQPDPgFTuNa0BoU+VEl9tp8adlX4sPGLilFP
 jX1w==
X-Gm-Message-State: ANhLgQ0v1nCbUOaOokbZksDQzeHJNTlGKYneW4JLVOPImxK3VbDU2YkS
 mGj4TlPxKHhxg0oi0XCRoKqUtYGh
X-Google-Smtp-Source: ADFU+vtMJuJkdLvfvaAuuvSiWmJvsLt+CkZd/XlpKLfzjR9etQZ4WZLDvgX7NNfgnxKuSrPRVsoBYQ==
X-Received: by 2002:a62:f205:: with SMTP id m5mr7304115pfh.3.1584669741459;
 Thu, 19 Mar 2020 19:02:21 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id o11sm3241399pgh.78.2020.03.19.19.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 19:02:20 -0700 (PDT)
Date: Fri, 20 Mar 2020 12:00:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc/64s: CONFIG_PPC_HASH_MMU
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20200302044902.3418935-1-npiggin@gmail.com>
 <878sjxdlpa.fsf@mpe.ellerman.id.au>
In-Reply-To: <878sjxdlpa.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584667943.t0isihrd3v.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman's on March 19, 2020 2:15 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> This allows the 64s hash MMU code to be compiled out if radix is
>> selected. This saves about 128kB kernel image size (90kB text) on
>> powernv_defconfig minus KVM, 40kB on a tiny config.
>=20
> TBH my feelings are:
>  - the size savings don't excite me much, given our kernels can be ~32MB
>    in size.
>  - it's unlikely a major (or any) distro would ever enable this, so it
>    would not be well tested.

Yeah, it would only really be used for firmware or certain embedded=20
things. We'd want some actual user before it's merged.

>  - it adds a *lot* of #ifdefs.

Yeah I started to get lazy, we can improve those quite a bit I think.

> So if we want to get this merged I'd want a good amount of refactoring
> done to avoid the bulk of the #ifdefs in the code. ie. lots of wrapper
> inlines etc. to hide the #ifdefs.
>=20
> And someone to put up their hand to maintain it, ie. ensure it keeps
> building and fix any issues that come up when it breaks.

Yeah, I'll keep tinkering on it, it might come in useful.

Thanks,
Nick
=
