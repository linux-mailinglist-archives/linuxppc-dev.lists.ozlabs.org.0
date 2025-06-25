Return-Path: <linuxppc-dev+bounces-9759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 274F2AE857B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 16:02:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3Rb3jkrz3bh6;
	Thu, 26 Jun 2025 00:02:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750855561;
	cv=none; b=PSSbIP6hvXQa+e6yUUPXGdwtfCfuItDONbkjr+NtCX6vljpmyg33zwfiQNFQQbK09+Z1pXi6807OW/f+SrHq+lAm2GZ5ifte2Qcjfvgd+c+D7rvnmzCwo/Cps8RLpyjoobavJm9cJ1Z6TU13PpoDR0rS3z+KYvmuF5F3REco513PKt06xD2iZqfzjNPS2/qZI2YERpANKwpGdQZS5uDBR55jqDlakrzZUh9yUNlX/EwB9Ewhp6baSyxBRObB/xxgjsCCZieZhG5nUJ/NbuchQ/soTnMiYQvpxFhF+j+RSK+XJiNwIOehBEqCSgWzeOBQiT28539CEBbMScREhI7vGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750855561; c=relaxed/relaxed;
	bh=aeUHbst5u6uAyR1ycfeU07wkwThxzbqj2XsMrc/HWnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSKyu2OPffflIARIQ/V73KAZPyHXnJ83/yvfW6YdQav7N/m6bi//eZXNPN5q/bRxLLpzv3sFaAEbQgXLbJmMPfI+IjWFPKoBpIx6S5VaaBoWDDtLaq3Qihkc6JBuzsmFRT2DJitermJNZ56Hjuu+MDIPIqE7jk6B6E9R09zpOoX2EVxaeuq0+WQq9yCTk0t2rE7FzbS+9GIlr47TSLBCMHq1sAAJfTXChHRXJJOwuCr5ZV742SmDO4I8aW784pxbfTkmjVvD1JAqh3D6FpMjjdfYH9105t4TbuaCfbzY4mHXajRpvP5DolwDEzo+i6enLSUh0juL6pOk982zp33rpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CzRX8G4v; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CzRX8G4v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bS1l96nFLz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 22:45:56 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55351af2fc6so6701812e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 05:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750855552; x=1751460352; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeUHbst5u6uAyR1ycfeU07wkwThxzbqj2XsMrc/HWnM=;
        b=CzRX8G4vl8ii6yQEzs38NJbRhEcal/aNm2p5qs0AR8UEgx2MvY9UxHn4bL6U7hIFo0
         D+ibzZQHkvEUZWtg3ZV1tGxchR0+PhY3JVING1IPypvQ5F9Syq+kxWHWzWTQfG6uFaKY
         RhmTcr8HA9re8AhDJM4UOw+y2h7BOnJz+QtevwwjH1TLOasgzNcdsOgsjmLVeO8JBiGN
         +C1qTF8UlrdU2h+jC750m5SBU6OnRe76gew8bi0VE+TR4YZKoo5YC0HcMm8WrUcf7FVF
         6Ye0VUSm39m7RYpisAwFy9JDGK+1IuHiOqyO9Ge3syKvZ4NYy/SM9PhJBqi0ojR5RJB/
         6NYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750855552; x=1751460352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeUHbst5u6uAyR1ycfeU07wkwThxzbqj2XsMrc/HWnM=;
        b=RMKw+T0PV2rlMZ750jSJqtfycW3r4kS30XE+HxsGrZg8yvryd+vXNEb+myoOmKV1wM
         v5f4WCtQnxnlD/gmCcLJllVoNvuw6GmjL2r52A6035JsgE+eksYLD/m8UB5DiPPk7x8A
         6GAP2bRESNxyrFlL1+lOLRxvPPMUmYY8+6YJZZSRtHV7kr8bPNv1W8XyJMJuX/HCSIqw
         X94Ev7AnHZ5VuJhuKtucisyKIR95ePcoMjAu5SVFvlz4wbV1HuMAf6G34mjeSo7TWOnq
         sOyFqfu3ongCa2LOfk/9DJ33svf9ulCyuYTO8EQlWqKVpA2MP8A/vLtICKx9xZBQipuI
         lYBA==
X-Forwarded-Encrypted: i=1; AJvYcCXPpj0A/KSMMgcWAFFFGlaqxF9pj8vaVvs+A+S9sjReUodUowiKJBCpA79s5AJaW2RtGtJ2N6ovfAmCkqY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVQkHUsuOYKY7LFX4MgA+zYR7OslZ3ynThA12y1/bcTsASFt/k
	5a903VSZWnSMj/5ruwS6lMGLok/4nIh6IGkCuhXFdCJgVcuzC3qsPykAmKvUy6ioCdZ/NYA21Zk
	x8lEZIiRMHyVpNEH5V7lbD6ntUnyw5t4=
X-Gm-Gg: ASbGncuAPd+UGqRCH1W4QFCngBsydEzzP+wSk6btb3FlKKWe/c6KUbLCtKS6d2uLK+/
	S0ruF5V92RckMSEiGR1Fl3T2/+YahuAopRTbGNWSlnctn2F/Pjc7YpqFg6rqkMIuN/AhjEyVcEv
	quZSRr8aWO8CH09zcwvymfkuMI8m4D0/OLGUVuVNb0Yw==
X-Google-Smtp-Source: AGHT+IGd+VQCTiJwy9G1ykD/0Nzx0GAzsfPqUCVqghBLVmwOBzPwEbsyyeyH2J2LllM1nMa0CK079KR9Ekpv1ITEkm8=
X-Received: by 2002:a05:6512:1591:b0:553:abe6:e3e7 with SMTP id
 2adb3069b0e04-554fdf5cefbmr869898e87.47.1750855551832; Wed, 25 Jun 2025
 05:45:51 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250625095224.118679-1-snovitoll@gmail.com> <20250625095224.118679-10-snovitoll@gmail.com>
 <4d568111-9615-4fba-884a-f2ae629776fe@csgroup.eu>
In-Reply-To: <4d568111-9615-4fba-884a-f2ae629776fe@csgroup.eu>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Wed, 25 Jun 2025 17:45:34 +0500
X-Gm-Features: Ac12FXyn774raFC9M0P_m_Yp5o7tYNYYaJPlJbUzpj4u5O7z5JIOhc_ux4m2QSg
Message-ID: <CACzwLxgVj3YD5faPj=09Z9e4WSEe-sD7Sqn4jhaT7eiePaUUMw@mail.gmail.com>
Subject: Re: [PATCH 9/9] kasan/powerpc: call kasan_init_generic in kasan_init
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	x86@kernel.org, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, geert@linux-m68k.org, 
	rppt@kernel.org, tiwei.btw@antgroup.com, richard.weiyang@gmail.com, 
	benjamin.berg@intel.com, kevin.brodsky@arm.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 3:33=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 25/06/2025 =C3=A0 11:52, Sabyrzhan Tasbolatov a =C3=A9crit :
> > Call kasan_init_generic() which enables the static flag
> > to mark generic KASAN initialized, otherwise it's an inline stub.
> > Also prints the banner from the single place.
>
> What about:
>
> arch/powerpc/mm/kasan/init_32.c:void __init kasan_init(void)
> arch/powerpc/mm/kasan/init_book3e_64.c:void __init kasan_init(void)

Thanks, I've missed them. Will add in v2.
I've also found out that I've missed:
arch/arm/mm/kasan_init.c
arch/riscv/mm/kasan_init.c

>
> Christophe
>

