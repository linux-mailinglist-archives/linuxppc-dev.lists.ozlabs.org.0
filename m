Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C03888CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 09:56:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlQDG0SH0z30DG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 17:56:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NyS2LXGA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NyS2LXGA; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlQCm5CJ6z2xZN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 17:55:47 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 b9-20020a17090a9909b029015cf9effaeaso3038952pjp.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 00:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=GmmNZdO9FoNP+URm8CVNoqZEAE+6NAUH5yKD/2Xach0=;
 b=NyS2LXGAiHslbRFa3JaBrL6GdYzEAePCOhxgssi2OqhPB9zLNDzxhhdeGmTmPBYmuY
 DILDDwQ82iet2ZqLY6EjMRf7yeLuW4RAtIDgB6fwJoROLEt8NoCktz98mycuYD9yjEW+
 1DOLY8avYf9lRpAfzZUVsTAnUmSVcp6YkDRcc5FtrU+gpkaX6vERiE+sPOL8yLbR6cm6
 D4f6Gu8f1H48fjgcCaVXOBI2XKl0tSHap1ewqmumUz0Un8j68P8RSOVp0Ib+C2/2DZ4/
 +cBjE0r2BnGnGvAoYzJIF/NS7j0WUmNdycOdY/+bq6vWJFfV5eurfucDM/4B+UN97kOx
 Pzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=GmmNZdO9FoNP+URm8CVNoqZEAE+6NAUH5yKD/2Xach0=;
 b=q7kQ1vctfLJOkDm8T+75DOyzRvpy7DHto7lJxcg+5bUauean+ZBv2hpbr0ipo2xxmI
 CUdNiUBxgIsOY5mNPkAkimdf4rWg2+xrcOkXNl8bK80yiy8/Fep0Few6tjXlcyZmr8NF
 NVpxWKKfbzzAt3C7GU5alMqPeGXOoXtT8/J1lp1JQXhz6F7Dn3Dhrv+O6vYmOGk/Dflj
 FPTKGTrRTPIpUEHpD8G04Pf+V4rD5wepmSvM89Lz6udEfqU3VvgCB7ymTD4xD/svjkxm
 b2T6YH8VwinMfQlpQ/KeNyXRPM+FEZ++6O5XCj1WacNSqJf+fFl4+qqHp4JFtSMwbQEn
 UjAw==
X-Gm-Message-State: AOAM531nVlO4MAb8rBFl4Mbp9QG+vYQ8EGA9tVuza/w30rUSr4GC04mK
 Z4crxHfMELFPoiyOcjQH95s=
X-Google-Smtp-Source: ABdhPJyxixB1OI/aDHOrXuCSWxO1sTnVnOdgtw1LfeEEZG1X/SV2T9BzrHfTlNyK4EM1OAwePFLTdA==
X-Received: by 2002:a17:903:20cc:b029:f0:cc11:51c2 with SMTP id
 i12-20020a17090320ccb02900f0cc1151c2mr9571799plb.32.1621410941336; 
 Wed, 19 May 2021 00:55:41 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id c191sm5878014pfc.94.2021.05.19.00.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 00:55:40 -0700 (PDT)
Date: Wed, 19 May 2021 17:55:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "ldv@altlinux.org"
 <ldv@altlinux.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
In-Reply-To: <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
MIME-Version: 1.0
Message-Id: <1621410291.c7si38sa9q.astroid@bobo.none>
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
Cc: "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Joakim Tjernlund's message of May 19, 2021 5:33 pm:
> On Wed, 2021-05-19 at 02:13 +0300, Dmitry V. Levin wrote:
>> Hi,
>>=20
>> On Thu, Jun 11, 2020 at 06:12:01PM +1000, Nicholas Piggin wrote:
>> [...]
>> > - Error handling: The consensus among kernel, glibc, and musl is to mo=
ve to
>> > =C2=A0=C2=A0using negative return values in r3 rather than CR0[SO]=3D1=
 to indicate error,
>> > =C2=A0=C2=A0which matches most other architectures, and is closer to a=
 function call.
>=20
> What about syscalls like times(2) which can return -1 without it being an=
 error?

They do become errors / indistinguishable and have to be dealt with by=20
libc or userspace. Which does follow what most architectures do (all=20
except ia64, mips, sparc, and powerpc actually).

Interesting question though, it should have been noted.

Thanks,
Nick
