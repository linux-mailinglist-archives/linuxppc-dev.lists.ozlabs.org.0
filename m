Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA64C26A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:59:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46K93qKLz3dl6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:59:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b518rUrD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::129;
 helo=mail-il1-x129.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=b518rUrD; dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K46F61YDDz2yfm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:55:38 +1100 (AEDT)
Received: by mail-il1-x129.google.com with SMTP id j5so1212626ila.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 00:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=FxQHatlTrRq7n3gKv7MI+frHpxxNsIq5DRZG8efWFS4=;
 b=b518rUrDU5aRRQEoulnpVrkWEE0YPug819IuLWcpCyw32P6K+H9akNr8b0UtmTFe/U
 KWQYZ7ciC7LMs1CnnACaZjAewODXu/w7X5GEv4ryE0UcfgzVl7er9Aygco8Vg1eahP+t
 dx1+mgnszHtWeJ2ychRMEh5WrE4KI6f+UvskHoGNnCRD9EDYXfOU06jGhf8+67aZbrJ2
 QypI3Zdy2GqCWAptTEM2iFnb8mAa5VYIMZEkK7DgoWbDIcJJPqCunk8x5VVSGb2Tp5m2
 Rt2D4tJL903ktJ68WxQo8qUL1SajUJi9yOAN738rWLH3Q03YPeRNQ33HsIVB2MONKUQ0
 VS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=FxQHatlTrRq7n3gKv7MI+frHpxxNsIq5DRZG8efWFS4=;
 b=pCcrq0aEmTh0PtO6xf638fwETI6HQ/3mrXJk1TKQxwNIDjNZHtiEZr9JhT7i2i00rk
 rKKrfH3cEy6hMnnHm91sXBlGTSDmgf8vfH/yNRZjjudwytGZA+cH37wLKkBP+KPt/g7m
 3xO8LhBuVpk22Ygn4DClTC7FG/rpxdrnG0YvDltgNymSUyEcdgddid/MTvnIPhUMg3pT
 d5OtQRRRQ7kiDh03Q5us/Kr4znKGBfLnl5uKfTGRtLgVoZepkcHcvVaT1Qtp6aIwrRdW
 ox34cqBQK5M/qHKgPS6VSDXWnyLIP/5kgM4QTZibcH7y5nZYtxMahf0o6JiPADdn5oDm
 f37g==
X-Gm-Message-State: AOAM530hmq2TWoJ0VuoGMpdDOt6uZypriPMt/cm91TzKo4vwlPglMJ8c
 4Xm/MYK8pSu4G+HIc1RUvKcak9CG9ak=
X-Google-Smtp-Source: ABdhPJyFv+lwxjKmKEwPGxhmxZsPA6m+LPm+lRZgyA+/E+lsDACEN1iWas9d9jL/8UIqCUseD6JRew==
X-Received: by 2002:a63:375b:0:b0:374:915e:d893 with SMTP id
 g27-20020a63375b000000b00374915ed893mr674932pgn.494.1645671299350; 
 Wed, 23 Feb 2022 18:54:59 -0800 (PST)
Received: from localhost (115-64-212-59.static.tpgi.com.au. [115.64.212.59])
 by smtp.gmail.com with ESMTPSA id s6sm949926pfk.86.2022.02.23.18.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 18:54:58 -0800 (PST)
Date: Thu, 24 Feb 2022 12:54:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Anders Roxell <anders.roxell@linaro.org>, mpe@ellerman.id.au
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
In-Reply-To: <20220223135820.2252470-2-anders.roxell@linaro.org>
MIME-Version: 1.0
Message-Id: <1645670923.t0z533n7uu.astroid@bobo.none>
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
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Anders Roxell's message of February 23, 2022 11:58 pm:
> Building tinyconfig with gcc (Debian 11.2.0-16) and assembler (Debian
> 2.37.90.20220207) the following build error shows up:
>=20
>  {standard input}: Assembler messages:
>  {standard input}:1190: Error: unrecognized opcode: `stbcix'
>  {standard input}:1433: Error: unrecognized opcode: `lwzcix'
>  {standard input}:1453: Error: unrecognized opcode: `stbcix'
>  {standard input}:1460: Error: unrecognized opcode: `stwcix'
>  {standard input}:1596: Error: unrecognized opcode: `stbcix'
>  ...
>=20
> Rework to add assembler directives [1] around the instruction. Going
> through the them one by one shows that the changes should be safe.  Like
> __get_user_atomic_128_aligned() is only called in p9_hmi_special_emu(),
> which according to the name is specific to power9.  And __raw_rm_read*()
> are only called in things that are powernv or book3s_hv specific.
>=20
> [1] https://sourceware.org/binutils/docs/as/PowerPC_002dPseudo.html#Power=
PC_002dPseudo

Thanks for doing this. There is a recent patch committed to binutils to wor=
k
around this compiler bug.

https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dcebc89b9328

Not sure on the outlook for GCC fix. Either way unfortunately we have=20
toolchains in the wild now that will explode, so we might have to take=20
your patches for the time being.

Thanks,
Nick
