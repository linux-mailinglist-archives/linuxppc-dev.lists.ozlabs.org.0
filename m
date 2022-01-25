Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D010D49A78D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 04:04:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjWtG2jtfz3cG5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 14:04:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H1a+Ji8j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=H1a+Ji8j; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjWsb1kw1z2x9W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 14:04:17 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id j16so7269728plx.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 19:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=9NKJBn4Yha0jNSVXic9E3W6HICB1WHnhF4AQkFs3pUA=;
 b=H1a+Ji8jB7AehEQXpREOcDxzeqBPDVnJ5K+Wd+l/FghliSD8Urmo0afH5o1zWRx0JG
 hv8sHBxBrr0i60GNismljm0QNk/0FfD/v+0yBbUuQ1YLK2TewTjmrqfqCSbj2aYhytmk
 D6b8f0K2Nut2MZU96i58mpmje4BmY/Iru2MP9KXVpaqKMPfdIYKi+A0xDeWU7RLi+0mI
 emcYUlfEN46eIblcthnXBJwCJXZ2ifAf7DVI2R6aeAMDKOfcyLiCnMOSwztqGBmvHpHL
 EcgICSX744/6PcLiysKd4yq2k1kJw+skcT7LvMVP+34KyIaeBP7P6+aQwcoeAdnXtZzw
 I0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=9NKJBn4Yha0jNSVXic9E3W6HICB1WHnhF4AQkFs3pUA=;
 b=2YPVQNaFZZ1p/vNyau20mQpW2cX+k3+2KRtn+ALocin8Hvar3YQDti3jtQRpyzkM4g
 hNn8R5N+cUDeBGAf2W4Eu3a5ldZu4uVLTqR15QoGtT3kw5piOGs/vc6ZX5aLs/Krm18M
 xX/fsa9LedQbAPA4K7rXgQVOuc61bXyobyCplXhQ7XwnjcwYbObumqPirCENI3xOVqkM
 IaUhce4Vm63XfgZg5FggmjFIsedOv0G/w9PwXQBBAixizNOVwIf6v7pii2rLywPmt8nW
 u8rzIucaSVN1NxUjEm29pHtjuogEQrN0sXJhRbi2AOxgsW4c+mn40HuTczIYnZ+lLd2E
 iUzQ==
X-Gm-Message-State: AOAM533r00ZIwp4KTrLb8AccN4eGhuAzsG9SfRLHIM7EPUDeqibrdczx
 GYm06ra0oH5EZ47WRlPkXkc=
X-Google-Smtp-Source: ABdhPJz97N1SMqyFcUYiUrPcpeCjyCpGikBrPo4h0+/deFvinQYgQ2UM7n7NMWW4/uxRg8K4aAXdNg==
X-Received: by 2002:a17:902:c40b:b0:14a:e2d5:3b1b with SMTP id
 k11-20020a170902c40b00b0014ae2d53b1bmr17146901plk.45.1643079853937; 
 Mon, 24 Jan 2022 19:04:13 -0800 (PST)
Received: from localhost (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id z9sm17258805pfh.219.2022.01.24.19.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 19:04:13 -0800 (PST)
Date: Tue, 25 Jan 2022 13:04:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Disable syscall emulation and stepping
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220124055741.3686496-1-npiggin@gmail.com>
 <d3ab1142-5f62-6cbc-067c-6a34f4f28ef2@csgroup.eu>
In-Reply-To: <d3ab1142-5f62-6cbc-067c-6a34f4f28ef2@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1643079479.32j7nee5j0.astroid@bobo.none>
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+Naveen (sorry missed cc'ing you at first)

Excerpts from Christophe Leroy's message of January 24, 2022 4:39 pm:
>=20
>=20
> Le 24/01/2022 =C3=A0 06:57, Nicholas Piggin a =C3=A9crit=C2=A0:
>> As discussed previously
>>=20
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/238946.html
>>=20
>> I'm wondering whether PPC32 should be returning -1 for syscall
>> instructions too here? That could be done in another patch anyway.
>>=20
>=20
> The 'Programming Environments Manual for 32-Bit Implementations of the=20
> PowerPC=E2=84=A2 Architecture' says:
>=20
> The following are not traced:
> =E2=80=A2 rfi instruction
> =E2=80=A2 sc and trap instructions that trap
> =E2=80=A2 Other instructions that cause interrupts (other than trace inte=
rrupts)
> =E2=80=A2 The first instruction of any interrupt handler
> =E2=80=A2 Instructions that are emulated by software
>=20
>=20
> So I think PPC32 should return -1 as well.

I agree.

What about the trap instructions? analyse_instr returns 0 for them
which falls through to return 0 for emulate_step, should they
return -1 as well or am I missing something?

Thanks,
Nick
