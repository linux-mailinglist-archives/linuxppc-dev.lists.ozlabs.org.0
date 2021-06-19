Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A86BE3AD6E4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 04:59:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6L9X0H7sz3c60
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 12:59:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PJjYOaMG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=aoo4=ln=gmail.com=npiggin@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PJjYOaMG; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6L9433FHz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 12:59:04 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4G6L8y70S0z9sWk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 12:58:58 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G6L8y6LXWz9sWM; Sat, 19 Jun 2021 12:58:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PJjYOaMG; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G6L8y2cCRz9sRf;
 Sat, 19 Jun 2021 12:58:58 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id x19so5652051pln.2;
 Fri, 18 Jun 2021 19:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=lMEMpwYchn7TkZ4L7Na/k1orPpTEbyexUEVGgzOCaCY=;
 b=PJjYOaMGOh4G/MzBX/s3FYdADSj+fVTm9lptW/J0Ws0HCqW6u8yMOZpeR0X6nWF09a
 0qyy/SJ67A7XSzkVA2E+0rtllta4i19N++cRFxBwL63TxNJcXwF6nnTAzLwgCmxSpo1S
 UgtW6sb1CI1Fk4IDHXRAF2ce6Fa1ogw6nEgY0Vord3TMPP2+WI6VoJe03RZ3aJUkjbP9
 Nj4Kqz+Em2KtGuXew6nUNVYciX0vZYYKsea0rTA2SWq7rHLyU7S3v5xhtKlVa2X1BU1g
 /zYaN0bQFe4yRUGKedmhTj7DieUZkz+CHJH549b+heGuKmuE/npBasvff0iLIAKAK/t1
 rYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=lMEMpwYchn7TkZ4L7Na/k1orPpTEbyexUEVGgzOCaCY=;
 b=h7vO3/g9Qh3tXn2PmChXnH05JyeJichMt71BOvFIWCMFIJTQNEZ3pHvqGZZf+VIw0A
 QMtTiQ02+eIP4fjwm2u7DwuUCuUptjWPpR9SCTgEhkIjlEBJdJ8tlsLkOqPTLf/Il/hZ
 Bhk+3cZ54fGUE7crnh8piPH6+rHkTw/gfTgvkS7kbWv/RW1RZ1IsiRRmdGr9PKghiczV
 +68iNvIY6u1W/G14/OWH8UGI480K/wlm0pwCrs8uJ7YwfVOAXoFEzODy9PsFRnwJntYd
 q1V0EE+2iz5jFcrKZZ2T19/sq/g/jZwnERBd3qfTfODHfIo4wiYpdQ7xRQDL4L6h8KSj
 1e0A==
X-Gm-Message-State: AOAM5329H+WIwJ4ggQhl/as5dyfrfKBNH2tcdXKXIxut618020rqyFCz
 nfUUVIplrtQ+aDL5nN7fdMZzwSmdSDc=
X-Google-Smtp-Source: ABdhPJxNKqW2q6ZtaKqwkW17yMNhaa+Bu3hoZ5E3MSMHa3B+YCVZcJi3kPtddhsLzg0M1zJ9Uzhtaw==
X-Received: by 2002:a17:902:aa04:b029:ec:f779:3a2b with SMTP id
 be4-20020a170902aa04b02900ecf7793a2bmr7496061plb.44.1624071534724; 
 Fri, 18 Jun 2021 19:58:54 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id m2sm9225821pjf.24.2021.06.18.19.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 19:58:54 -0700 (PDT)
Date: Sat, 19 Jun 2021 12:58:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 5/9] powerpc/microwatt: Use standard 16550 UART for
 console
To: Paul Mackerras <paulus@ozlabs.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
 <YMwXGCTzedpQje7r@thinks.paulus.ozlabs.org>
 <1624001539.de8wj3qkjv.astroid@bobo.none>
 <YMyNpLwqttl4IGSH@thinks.paulus.ozlabs.org>
In-Reply-To: <YMyNpLwqttl4IGSH@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1624071299.ppzoru83yx.astroid@bobo.none>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of June 18, 2021 10:12 pm:
> On Fri, Jun 18, 2021 at 05:40:40PM +1000, Nicholas Piggin wrote:
>> Excerpts from Paul Mackerras's message of June 18, 2021 1:46 pm:
>> > From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> >=20
>> > This adds support to the Microwatt platform to use the standard
>> > 16550-style UART which available in the standalone Microwatt FPGA.
>> >=20
>> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> > Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ...
>> > +#ifdef CONFIG_PPC_EARLY_DEBUG_MICROWATT
>> > +
>> > +#define UDBG_UART_MW_ADDR	((void __iomem *)0xc0002000)
>> > +
>> > +static u8 udbg_uart_in_isa300_rm(unsigned int reg)
>> > +{
>> > +	uint64_t msr =3D mfmsr();
>> > +	uint8_t  c;
>> > +
>> > +	mtmsr(msr & ~(MSR_EE|MSR_DR));
>> > +	isync();
>> > +	eieio();
>> > +	c =3D __raw_rm_readb(UDBG_UART_MW_ADDR + (reg << 2));
>> > +	mtmsr(msr);
>> > +	isync();
>> > +	return c;
>> > +}
>>=20
>> Why is realmode required? No cache inhibited mappings yet?
>=20
> Because it's EARLY debug, for use in the very early stages of boot
> when the kernel's radix tree may or may not have been initialized.
> The easiest way to make a function that works correctly whether or not
> the radix tree has been initialized and the MMU turned on is to
> temporarily turn off the MMU for data accesses and use lbzcix/stbcix

Ah makes sense.

> (which Microwatt has, even though it doesn't implement hypervisor
> mode).
>=20
> (I don't know which "yet" you meant - "yet" in the process of booting a
> kernel, or "yet" in the process of Microwatt's development?  Microwatt
> certainly does have cache-inhibited mappings and has done since the
> MMU was first introduced.)

I did mean mappings to the UART, but good to get both answers :D

>=20
> In fact the defconfig I add later in the series doesn't enable
> CONFIG_PPC_EARLY_DEBUG_MICROWATT, but it's there if it's needed for
> debugging.
>=20
>> mtmsrd with L=3D0 is defined to be context synchronizing in isa 3, so I=20
>> don't think the isync would be required. There is a bit of code around=20
>> arch/powerpc that does this, maybe it used to be needed or some other
>> implementations needed it?
>>=20
>> That's just for my curiosity, it doesn't really hurt to have them
>> there.
>=20
> Right, and in fact mtmsrd is marked as a single-issue instruction in
> Microwatt, so it should work with no isyncs or eieios.  Presumably Ben
> copied the isync/eieio pattern from somewhere else.

Makes sense. Well I don't have any objection to the series.

Thanks,
Nick
