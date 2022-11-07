Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B518C61F37E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 13:39:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5W4n4gxFz3cJQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 23:39:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fDaxMp/f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fDaxMp/f;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5W3q0gKcz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 23:38:14 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso14426059pjg.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 04:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RafuIk7/aRO254sO5kaFn2eaoukNCiocFq8V/csBLds=;
        b=fDaxMp/f71ZRpbedeyBEnv7t9dZTh+Bqfj5jjvCBHEqpmNj9W3DK4n8Jdn4PbLSea/
         9vJYHS8giWDhWG0Yr0fRbmlXDqWsgG1xVRRS1j+uj/pYFu9d7gSccaBBL/Ek/Yc7AE5q
         /Ybvq2QY+aYa3imrPiyw3qnx04VaBDTf380oHXCtjdahKATee9ko6t7G+0uTozephZQM
         HlUx0HOnXwSgAAtBDeBuUz86rq1KIAhucbhRhP03V+52nw1aSVCkRlN82GdrYVuppupl
         icSP+qQFseuOUA+910AQUqEDaI4hkR5W1VO/7dNuVGuwuUMoxKMeCckkfPMPGks4Bnct
         GDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RafuIk7/aRO254sO5kaFn2eaoukNCiocFq8V/csBLds=;
        b=Kzy3BmjJAPm6Be5Vs/hd3aw4iI1JRF4/iu1fRHY2zSsEY12E6ZqrqOsfZviguiKhOl
         EsH3auna+175qIMS+oXD55PpdS9lcY0IeHpjnlKYF45mHOLy01kRaVlQ34agvIUfjnxx
         yxHalhwC/AWm4lLSJ0dzmf6BectSgJdtjP/+kF9Ne8YYYJFOi527ghUsqZDkTfSZ2Jag
         j+xGf2GGZMY2eWtbcmMd7gUDvg2IcaobF3cyH+C2dBOOjLK6ve8IlgqFeAN0CCr1qK9a
         VQ8FeJkZiijxssG7cOBir4xSrhCudLm1c+FWx8eQvSSXbzOaHCDr1HKgiq3nEpDt9EEE
         OADg==
X-Gm-Message-State: ACrzQf0/qu9a6dNcpLvV+/ozrJczOonXyRV59Uljw09vCQmKDg+M1Csu
	EAkLWgBOOiDBD2dSJEsUW1A=
X-Google-Smtp-Source: AMsMyM4E1nYQg9Q52dFHfMNwRqKSCd8PT00BBHN0VkZYDe6iWB88CLg5no3nTzgKo/EOO08tgfvpYw==
X-Received: by 2002:a17:902:9b8e:b0:187:30ec:67dd with SMTP id y14-20020a1709029b8e00b0018730ec67ddmr36070211plp.79.1667824691164;
        Mon, 07 Nov 2022 04:38:11 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id pi2-20020a17090b1e4200b0020bfd6586c6sm4234991pjb.7.2022.11.07.04.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:38:10 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 22:38:06 +1000
Message-Id: <CO62IBK4D7K1.1USN6WO3YDZPY@bobo>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Andrew Donnellan"
 <ajd@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 2/6] powerpc/64s: Helpers to switch between linear
 and vmapped stack pointers
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20221104172737.391978-1-ajd@linux.ibm.com>
 <20221104172737.391978-3-ajd@linux.ibm.com>
 <20c79a09-0b95-bb52-2495-999d2365308d@csgroup.eu>
In-Reply-To: <20c79a09-0b95-bb52-2495-999d2365308d@csgroup.eu>
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
Cc: "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "cmr@bluescreens.de" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Nov 5, 2022 at 6:00 PM AEST, Christophe Leroy wrote:
>
>
> Le 04/11/2022 =C3=A0 18:27, Andrew Donnellan a =C3=A9crit=C2=A0:
> > powerpc unfortunately has too many places where we run stuff in real mo=
de.
> >=20
> > With CONFIG_VMAP_STACK enabled, this means we need to be able to swap t=
he
> > stack pointer to use the linear mapping when we enter a real mode secti=
on,
> > and back afterwards.
> >=20
> > Store the top bits of the stack pointer in both the linear map and the
> > vmalloc space in the PACA, and add some helper macros/functions to swap
> > between them.
>
> That may work when pagesize is 64k because stack is on a single page,=20
> but I doubt is works with 4k pages, because vmalloc may allocate non=20
> contiguous pages.

Yeah. This could be a first-stage though, and depend on 64k page size
and stack size, or !KVM or whatever. When the real-mode code is solved,
that could be relaxed.

Thanks,
Nick
