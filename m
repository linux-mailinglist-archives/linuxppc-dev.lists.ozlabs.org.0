Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E778F228291
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 16:44:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB1Zq1gKHzDqJS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 00:44:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bTDq8VUZ; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB1R5411FzDqVl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 00:37:53 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id f18so21499608wrs.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=JnIy8b7JnpzdmcIgpVJbxKihlNWQMt2nBTi33743rcg=;
 b=bTDq8VUZtFWvxWOVMetsDQottRZ3MaBIBDpdXMfsWrkEkfrqYrv7w/Wz/9G4K2dzSj
 79XkgyDB1QYTWDlBuG0l+2vSwvBSOzdfT/xm8vzUgbNYA87FVfJPd+y9NrA+YZY84aMF
 9BygtaBEFWSFRwfVY1s5REOlJOqXdpU9Z1qhKeGjClj0I7W3qkVehelAv4XgS+J59y8d
 OYtxGEGJOsSdvqrpNHM/CVrKiJ6byt1+AMACJE/ptxqq5m09jmAcNRP9YTFCCw3J835f
 fnzi7cSAgDvuj7Pfy2qin5tq9Z8k5Y3EOEIOzb9kJvqo/8U6nVWusi8uoH/ydYxocbgU
 O/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=JnIy8b7JnpzdmcIgpVJbxKihlNWQMt2nBTi33743rcg=;
 b=pQVmMoVPKkG4A9fSVKjVv9ZGMZ/pwyVcagyiV6zOLaL7VxsXN2Kgy78fPy8/QwCA8a
 3e/eHkJw24MLrT35bSNoy5zeouAGSC3CkVoZuI5v4WnFvEU6GxtgInHT1A8jrO+4hwAi
 +E8PiEcyJZMSxv5dejmXw2IfbdCePl1XPRBPtmnHzpJBKibTt93OfcKmVw9NQMVYRW+0
 YGx6ppXd6pDXaZjLIOSL1WBch+AYfd4KqvKEzwtHsKGcflaD8gwvgMBfO/kxA5bLJaa6
 kFTpPHzWmMRKBZwXz3rqujJ7cCFUZW4oSZvnalXRsa0xtIa98oNBHbXsgfyHRW9YiV54
 BgWQ==
X-Gm-Message-State: AOAM530pYZDmN71bz7FZcjhtnfYK3kSk/2t1YtWW/ztJEKwVrXfLRMbb
 4neYYDHOu6E/t8nka+0xnEE=
X-Google-Smtp-Source: ABdhPJwEM2zAzSrBnxsLfc+qZxea4pNgOzpy7g+iFwxaW8xtzhmq24DMxaWi8GMjy9mSPUT6P61Www==
X-Received: by 2002:a5d:56c5:: with SMTP id m5mr539260wrw.356.1595342268872;
 Tue, 21 Jul 2020 07:37:48 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id l8sm37128263wrq.15.2020.07.21.07.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 07:37:48 -0700 (PDT)
Date: Wed, 22 Jul 2020 00:37:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 2/3] powerpc/powernv/idle: Rename
 pnv_first_spr_loss_level variable
To: benh@kernel.crashing.org, ego@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mikey@neuling.org, mpe@ellerman.id.au, paulus@samba.org,
 pratik.r.sampat@gmail.com, Pratik Sampat <psampat@linux.ibm.com>,
 svaidy@linux.ibm.com
References: <20200717185306.60607-1-psampat@linux.ibm.com>
 <20200717185306.60607-3-psampat@linux.ibm.com>
 <1595202681.bt4670u7q7.astroid@bobo.none>
 <81dcf34e-870d-b3a1-7876-a6a2f0b37d1f@linux.ibm.com>
In-Reply-To: <81dcf34e-870d-b3a1-7876-a6a2f0b37d1f@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1595341835.8ad8mjl9hm.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Pratik Sampat's message of July 21, 2020 8:29 pm:
>=20
>=20
> On 20/07/20 5:27 am, Nicholas Piggin wrote:
>> Excerpts from Pratik Rajesh Sampat's message of July 18, 2020 4:53 am:
>>> Replace the variable name from using "pnv_first_spr_loss_level" to
>>> "pnv_first_fullstate_loss_level".
>>>
>>> As pnv_first_spr_loss_level is supposed to be the earliest state that
>>> has OPAL_PM_LOSE_FULL_CONTEXT set, however as shallow states too loose
>>> SPR values, render an incorrect terminology.
>> It also doesn't lose "full" state at this loss level though. From the
>> architecture it could be called "hv state loss level", but in POWER10
>> even that is not strictly true.
>>
> Right. Just discovered that deep stop states won't loose full state
> P10 onwards.
> Would it better if we rename it as "pnv_all_spr_loss_state" instead
> so that it stays generic enough while being semantically coherent?

It doesn't lose all SPRs. It does physically, but for Linux it appears=20
at least timebase SPRs are retained and that's mostly how it's=20
documented.

Maybe there's no really good name for it, but we do call it "deep" stop=20
in other places, you could call it deep_spr_loss maybe. I don't mind too=20
much though, whatever Gautham is happy with.

Thanks,
Nick
