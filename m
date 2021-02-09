Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1393149B9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 08:51:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZZpY4qlPzDsc3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 18:51:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=by/+gUaQ; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZZmf1BvXzDr0k
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 18:49:53 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id my11so1102711pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 23:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6b+/hQj0it6g8F6bTJeurencxJxcBJHtadbYzgx+xnE=;
 b=by/+gUaQ+eg/pn6zkZeCenRotSr/+0zlz89VffWJuNaVZm9c/xRuRS2Sxl5IjDXM8i
 vpua9sxlbofuvH3dFKL6iM/UUBMcANrZJaMwOz1oCFSu5vHhqQgsjxeAJ4snRiWGptgh
 5a748XI9aPlOcq78XjVCJfUgnt6jpXa+VX4FPDM3BB3L4gaJLsTVvqn1ac5EcakM2khs
 vLMt9ulYhR0LJi555fh9e0QnZLP0ycG8nU724dtDMeyb3PpHoTc/cLjySMnW1K7eR6LS
 ZhMbKAOfVrNOKWL0P218ALx78Qk3v6ovk3i75WkRmIpCr1cFeuGXTsSEAvzRw4K+C6GO
 18mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6b+/hQj0it6g8F6bTJeurencxJxcBJHtadbYzgx+xnE=;
 b=tILuJGPEEJZ9NFPugI4jiTTOiooiO3ZuuoOHHP+e3ERoMKniEh3I1KHJSwp5wwhApA
 kNRWoXz4Zi089173/KYtgf1h+0Dg97gsSmtOw3idXCBwEaAl/zF+vk8ZIBuczOwDrWdB
 FHG02iTujK+qZ6id0xJjse6W+ne7IBucHn3EEu1FuUpMdo6GcicHyq5OfgX4YqGQawPO
 geKv0Gwrzvfy99njHLYmzWiBNJSdT8CnB9B2KAx8nwlDuH/HB3TnEtETHfxwq0J8fGkl
 C9OGjoGfMYMrrE0Y/P0l2Pqbb7ovJ8I8/TgMP9BG+e/fvGppeMMeKFJsYbXAYpnpXZ8k
 JEiA==
X-Gm-Message-State: AOAM533o4h7fSWMWEYTHETeDDfX+pxD8qGdgHUWV0pHbbJPjq+FOHQNq
 M0eUQP+DLsLDcS0A19UCcVc=
X-Google-Smtp-Source: ABdhPJz2eu+sBmByunrt7c4+X8GZAthouJ6qZ0B2xe6a/IDMiOE324Bn35/zJ3hc09l/KehHSpSdlw==
X-Received: by 2002:a17:902:8306:b029:e2:d561:9ba9 with SMTP id
 bd6-20020a1709028306b02900e2d5619ba9mr8944276plb.5.1612856991840; 
 Mon, 08 Feb 2021 23:49:51 -0800 (PST)
Received: from localhost ([1.132.145.225])
 by smtp.gmail.com with ESMTPSA id y26sm21385293pgk.42.2021.02.08.23.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 23:49:51 -0800 (PST)
Date: Tue, 09 Feb 2021 17:49:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 05/22] powerpc/irq: Add helper to set regs->softe
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <5f37d1177a751fdbca79df461d283850ca3a34a2.1612796617.git.christophe.leroy@csgroup.eu>
 <1612832745.vhjk6358hf.astroid@bobo.none>
 <5987787e-ee80-ed0e-0c34-9884f6aad3c5@csgroup.eu>
In-Reply-To: <5987787e-ee80-ed0e-0c34-9884f6aad3c5@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612856863.0x6ebz3hce.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of February 9, 2021 4:18 pm:
>=20
>=20
> Le 09/02/2021 =C3=A0 02:11, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>>> regs->softe doesn't exist on PPC32.
>>>
>>> Add irq_soft_mask_regs_set_state() helper to set regs->softe.
>>> This helper will void on PPC32.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>=20
>> You could do the same with the kuap_ functions to change some ifdefs
>> to IS_ENABLED.
>>=20
>> That's just my preference but if you prefer this way I guess that's
>> okay.
>>=20
>=20
>=20
> That's also my preference on the long term.
>=20
> Here it is ephemeral, I have a follow up series implementing interrupt ex=
it/entry in C and getting=20
> rid of all the assembly kuap hence getting rid of those ifdefs.

I thought it might have been because you hate ifdef more tha most :)
=20
> The issue I see when using IS_ENABLED() is that you have to indent to the=
 right, then you interfere=20
> with the file history and 'git blame'

Valid point if it's just going to indent back the other way in your next=20
series.

> Thanks for reviewing my series and looking forward to your feedback on my=
 series on the interrupt=20
> entry/exit that I will likely release later today.

Cool, I'm eager to see them.

Thanks,
Nick
