Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AF03382F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 02:00:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxSDG0R5hz3d7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 12:00:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=W74o9hWG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W74o9hWG; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxSCn4t4Nz3cLN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 12:00:20 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id a24so11099090plm.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 17:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gv+xWsQfcMIOQNOovYei3JCwJn5hpNQ/FSKLCaKdqn8=;
 b=W74o9hWGlvn00KI1/2TNKoG5g2mE1OhPtw8DGPyd5+TQlCXCp+ti1l9C/ehXqBT59S
 W1mEa5HQOsLs182A3l4vd0A+PKB+QD6i5GYQUcHx+ltotWgMklhjs5K1D+WuwEvdFpaW
 WzTFxg+6XRbGSTWAhI61T6/kG8rKSKAIORGCmcs26Id6sQkcQN8lTrhxOmfFaLd3Ryt2
 5iM9NQk35cNoIo6+ai8XNtiz1/AuDtlC9aDaBWED3NPysoRCmhg7Yco0rEAWXI17qFrV
 CFOx6BMe1CzDiACCXErNYh9Um5EHKrbxHdn8Z7f5fVlUfSumsMWUiifYoY84sauU+YL0
 uBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gv+xWsQfcMIOQNOovYei3JCwJn5hpNQ/FSKLCaKdqn8=;
 b=L5fLZZIHyumWOzQtEvnsCQJkem6D/jcBWbx/IO4QxnDGnLGZErzMuVtTtTB5oKSFO0
 OGDTSiWor5pUsHZKHNKVs6yL8wzFH3ZPYEoOMBW0VwUnj9XNCl5LfyuUzjm++P9ncYRA
 0xANmoJSSR0QzBN+0zPR4UuglW06UDBtaZwlN5QY76PmnKJpGfCSNjgYIoir/wuPOctE
 HwiVk9EEnpIh0ufL8/aIEx9x5a6mQ/I1FG8A0qD83gWajOzoFO+KZJif/+6vX56UtDtz
 1FLXHT+nV52lzhhgs0MiX0ifktnw2XvoaIO3fZJGzeGIpJGHqlqqDY0pbp3g6vn1i+Lj
 MU1Q==
X-Gm-Message-State: AOAM530BmW42OpwLqhh0qhe10xCvml4yi6/APsD52H9Dc1EuS3FyQnyh
 lKRSak1AJmrFCxlkk2qtKzU=
X-Google-Smtp-Source: ABdhPJyBjVxYp/bY5ZCLnj5g+/WCwYIiJuGyGicbGZC4UNROy8kbx+b25aWfVFADwBt1Wat7ZPK+nQ==
X-Received: by 2002:a17:90a:e7cc:: with SMTP id
 kb12mr8591004pjb.31.1615510816986; 
 Thu, 11 Mar 2021 17:00:16 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id j10sm255097pjs.11.2021.03.11.17.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 17:00:16 -0800 (PST)
Date: Fri, 12 Mar 2021 11:00:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 36/43] powerpc/32: Set current->thread.regs in C
 interrupt entry
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <8d523f9ecee1de0515cc31d43030c12ab171a670.1615291474.git.christophe.leroy@csgroup.eu>
 <1615339900.vmbtzuirqw.astroid@bobo.none>
 <035298ad-4d0b-5e74-6f5c-e03677580924@csgroup.eu>
 <5a80e05e-27d7-0e95-67c7-0fe3255c4be1@csgroup.eu>
In-Reply-To: <5a80e05e-27d7-0e95-67c7-0fe3255c4be1@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615510691.0vpkz8qib3.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of March 11, 2021 10:38 pm:
>=20
>=20
> Le 11/03/2021 =C3=A0 11:38, Christophe Leroy a =C3=A9crit=C2=A0:
>>=20
>>=20
>> Le 10/03/2021 =C3=A0 02:33, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Excerpts from Christophe Leroy's message of March 9, 2021 10:10 pm:
>>>> No need to do that is assembly, do it in C.
>>>
>>> Hmm. No issues with the patch as such, but why does ppc32 need this but
>>> not 64? AFAIKS 64 sets this when a thread is created.
>>=20
>> Looks like ppc64 was doing the same in function save_remaining_regs() in=
 arch/ppc64/kernel/head.S=20
>> until commit https://github.com/mpe/linux-fullhistory/commit/e5bb080d
>>=20
>> But I can't find what happend to it in that commit.
>>=20
>> Where is it done now ? Maybe that's also already done for ppc32.
>>=20
>=20
> I digged a bit more and found a later bug fix which adds that setting of =
current->thread.regs at=20
> task creation: https://github.com/mpe/linux-fullhistory/commit/3eac1897
>=20
> That was in the ppc64 tree only at that time, and was merged into the com=
mon powerpc tree via commit=20
> https://github.com/mpe/linux-fullhistory/commit/06d67d54

Nice archaeology!

> So we have it for both ppc32 and ppc64 and ppc32 doesn't need to do it at=
 exception entry anymore.=20
> I'll remove it.

Good, that's what I hoped (otherwise ppc64 would have been missing=20
something).

Thanks,
Nick
