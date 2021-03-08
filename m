Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0764D3309B7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 09:48:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvBnF004Xz3cLT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 19:48:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mfgn/E41;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mfgn/E41; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvBmq2z3Cz30Jx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 19:47:38 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so2582566pjc.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 00:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=bKan0MbvNXWRj+HWXY8826SQQxFg7KQ0T970T1h/cKU=;
 b=mfgn/E41neDc4PfgZmzViMn1STcXOagr3u8Z6HPIN/QIJlv6ZGG3yxwFEjuLTLN8hY
 kjvofJ7Q8kG/W3vAxEfJbIQnMH5Ok35nQGOlXoWdeNyKD5QcWBj/ke+xk1y3TURP2TKt
 LVxwXkRz9vNLhLnPM1TRp1n/YVFMg9ACKinUaG/0PZHk99VJaBTeKrdgfW4e6FDZtXIA
 0+zCJZ0WTl8skMntt2OcUw6U38Xh5Ocyp4JGdduUVrPzQKUjqu1SgiwxTw1FZ4D/cMf/
 B0GUdijmRQKn5II/5bzO1RvSWf3jyl22d67pxgbBorMhyzScY7oseDpJlHUxRZhVuNlC
 3Z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=bKan0MbvNXWRj+HWXY8826SQQxFg7KQ0T970T1h/cKU=;
 b=BF6tnX0Ouxj+doWcOJ72yGTd2GS60vZVqdelLDfIjU1Ahur4E2/C+UiQUdEiF0BYmJ
 VaIVrLZHTi3L5LmyT4bVz8RNVFQpQwFxForLTrc2BfM2hMEYmy2eNJSMLpD1PVNHhLzf
 r4pp48blrduq+2cg85oi/U6Wou2+/HQAT8W6+KYXEZioD1ooxnyDzDKX/3Yle1OFgpeh
 2a3/sZpE5PGE8ws04gGkOmyT0dmRzKM6ZhWjhe/hCh5F4be9bvBa17HCzKYtOCsvSRl3
 1Kfagp/Be2Je8R0xJUn/gNGUNNPTLx5tNEElkns26UJgawiqnjnk60w0foCJ7+Znmf5c
 4VEA==
X-Gm-Message-State: AOAM532I2j8hIJrvYv+w5w0m8axkS8C6mlEEaHkBHU4f6sn1iZrd0Bv4
 +cDo0xWScjQVxCv0Za/Dk9s=
X-Google-Smtp-Source: ABdhPJy6Fh2uzNFRAMPVazacmcmCjtcORGUIi0dKs5WsrmwrZ7Mkz2vwL4S8o03vMyCfLzXvv2SB1A==
X-Received: by 2002:a17:90a:3b0e:: with SMTP id
 d14mr24269268pjc.198.1615193256337; 
 Mon, 08 Mar 2021 00:47:36 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id r13sm9446545pfh.159.2021.03.08.00.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 00:47:35 -0800 (PST)
Date: Mon, 08 Mar 2021 18:47:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 05/22] powerpc/irq: Add helper to set regs->softe
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <5f37d1177a751fdbca79df461d283850ca3a34a2.1612796617.git.christophe.leroy@csgroup.eu>
 <1612832745.vhjk6358hf.astroid@bobo.none>
 <5987787e-ee80-ed0e-0c34-9884f6aad3c5@csgroup.eu>
 <1612856863.0x6ebz3hce.astroid@bobo.none>
 <d243672c-ea47-2d0c-bfe4-e6eed5460868@csgroup.eu>
In-Reply-To: <d243672c-ea47-2d0c-bfe4-e6eed5460868@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615193040.e8vkjfd7b9.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of March 5, 2021 6:54 pm:
>=20
>=20
> Le 09/02/2021 =C3=A0 08:49, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of February 9, 2021 4:18 pm:
>>>
>>>
>>> Le 09/02/2021 =C3=A0 02:11, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>>>>> regs->softe doesn't exist on PPC32.
>>>>>
>>>>> Add irq_soft_mask_regs_set_state() helper to set regs->softe.
>>>>> This helper will void on PPC32.
>>>>>
>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>>> ---
>>>>
>>>> You could do the same with the kuap_ functions to change some ifdefs
>>>> to IS_ENABLED.
>>>>
>>>> That's just my preference but if you prefer this way I guess that's
>>>> okay.
>>>>
>>>
>>>
>>> That's also my preference on the long term.
>>>
>>> Here it is ephemeral, I have a follow up series implementing interrupt =
exit/entry in C and getting
>>> rid of all the assembly kuap hence getting rid of those ifdefs.
>>=20
>> I thought it might have been because you hate ifdef more tha most :)
>>  =20
>>> The issue I see when using IS_ENABLED() is that you have to indent to t=
he right, then you interfere
>>> with the file history and 'git blame'
>>=20
>> Valid point if it's just going to indent back the other way in your next
>> series.
>>=20
>>> Thanks for reviewing my series and looking forward to your feedback on =
my series on the interrupt
>>> entry/exit that I will likely release later today.
>>=20
>> Cool, I'm eager to see them.
>>=20
>=20
> Hi Nick, have you been able to look at it ?
>=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/cover/cover.1612864003.=
git.christophe.leroy@csgroup.eu/

Hi Christophe,

I had a look at it, it's mostly ppc32 code which I don't know well but=20
it looks like a very nice cleanup and it's good to be sharing the C
code here. All the common code changes look fine to me.

I'll take a closer look if you can rebase and repost the series I need=20
to create a tree and base 64e conversion on top of yours as they touch
the same common places.

Thanks,
Nick
