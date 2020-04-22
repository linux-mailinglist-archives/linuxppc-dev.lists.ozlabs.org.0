Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2621B3966
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 09:51:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496Xh80hBvzDr1j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 17:51:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W3Cliahb; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496Xbr5m8czDqyc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 17:48:06 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id v63so655215pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 00:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=fkHafghrwTH69QABDa7HOzAi+OOBPXW15p/HuB4SG4Y=;
 b=W3CliahbaoJyZ9KuwM58l1sJavK2vyEt7BUcBb49KCVw7AV0UWQQCozmeyAadR+1K2
 MlP7akJnMuSRLEDrAC5HFBGwIevoPLh2/RyW3BMaSMGrLQKC9f9LnXjQi1AsGHOuQg7U
 tkYWycXW1kHSAQsLXCGNqhrg5X8eM2O8kCV2OYf+nBRbHVGw8V4ZzNSSrkMc3SF6QyhS
 aWDBC2UzkNz0YPL1BLWjUoD+s1PV9/QZrWCwGMnrhIHlmiLBKabDNYRsEcZLpgVneLXb
 YV1G/k/l6UIbbX7zxxBDHga19alMACxQtDyAAfeBdqJ6BQqmWlNxE/wPhZiprfraDZlo
 PIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=fkHafghrwTH69QABDa7HOzAi+OOBPXW15p/HuB4SG4Y=;
 b=KngPmrvO/A7oNgqxgtinMnyaS/4spWRY0zRVGzbuQ5e8fuvspgBxtJ1AErfEVyvs+U
 nSX/mz8pu0gYK89IWnfKvM9ad8b4gaZEnw4lxNfGV67LQ8LXfP8fwavEhZPP86yWqXXF
 4yyyOU0vyPyg2xZUWxXclFMlQF1p2Y/wXcj0r8cjVD4i+5ofumEwEvzlZjvP0J2mXuXS
 xMHlqU+JjaOlQkYVLgDfpfvyRCcL7Le7sMQr34RTAcpydygXNpSajejx5W6JKO0Mssky
 NKneoUy65F68UCgUkRRQkWHpx3yu4/4/CXPStFBzNeqzEk+6J4DTWrhyh4W9WTWsVF8n
 cEPQ==
X-Gm-Message-State: AGi0PubYKrX7Bx02Yyw9Wt6l+YDadUV/qh3i8Es1ZayyyekaQ/rNajh6
 LCnCc8BdG+paWqWcyar9E/ENMpcJ
X-Google-Smtp-Source: APiQypJkwim7sUfowtNQlJR0B4/tdOEnXTysW+HxOziZvqi+ghG1+bX4PD10LdfN9b7KDX4NlnJ45w==
X-Received: by 2002:a63:67c7:: with SMTP id
 b190mr25766385pgc.289.1587541684920; 
 Wed, 22 Apr 2020 00:48:04 -0700 (PDT)
Received: from localhost ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id n23sm4533387pjq.18.2020.04.22.00.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 00:48:04 -0700 (PDT)
Date: Wed, 22 Apr 2020 17:45:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/book3s64/kuap: SPRN_AMR modification need CSI
 instructions before and after
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20200419135359.731325-1-aneesh.kumar@linux.ibm.com>
 <1587341611.capj46kr99.astroid@bobo.none>
 <1587345091.ewst0wvt61.astroid@bobo.none>
 <87y2qqhc2w.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y2qqhc2w.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1587541260.w3jfzesvph.astroid@bobo.none>
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

Excerpts from Michael Ellerman's message of April 20, 2020 5:04 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Nicholas Piggin's message of April 20, 2020 10:17 am:
>>> Excerpts from Aneesh Kumar K.V's message of April 19, 2020 11:53 pm:
>>>> As per the ISA, context synchronizing instructions is needed before an=
d after
>>>> SPRN_AMR update. Use isync before and the CSI after is implied by the =
rfid
>>>> that we will use to switch to a new context.
>>>=20
>>> Not entirely sure if we need this. This will restore AMR to more=20
>>> permissive, so if it executes ahead of a stray load from this
>>> context, it won't make it fault.
>=20
> I thought we'd convinced ourselves it didn't matter in practice due to
> the proximity of the entry/exit.

I don't remember exactly. We can always drop the isync from the side=20
that pairs with an entry or exit.

If we drop it from the other side, what it means in theory is it could=20
float past some of the accesses we're doing in the interrupt context=20
that we thought were protected. So we won't take faults, but it's=20
possible we would let through a user access.

I think it's likey that we'd end up executing the mtspr before anything=20
much can take advantage of it, but you never know, and I guess the=20
problem is it becomes impossile to audit and be sure.

Thanks,
Nick
