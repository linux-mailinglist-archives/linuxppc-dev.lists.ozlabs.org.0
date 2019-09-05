Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE3AAE81
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 00:32:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Pb6L75XPzDr5D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 08:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GXRdKrgL"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Pb485zT7zDr5n
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 08:30:31 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id 4so2232274pgm.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2019 15:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=hiVLruuS610U5KXu/rLH4E6cgqoHwaQnK6C0kYLeaGE=;
 b=GXRdKrgLUnjJ7CGIWiIUyTgca9vRRw6U7vaEg5T9fJAR9dJZwzMMqhlnd9C7eJ25YQ
 SiGW6Ll+bAKr/VCrZ5dz2aHJ07mBAPNw29aFupNNC4TNAWrisciJbuv7vl0CTss1m+K1
 5V7GxkvPNMawu2Bo8Fv7My13Ey1IrMDydwy/LvYbRCeXbqKPaTd1t7f6DHFwZIlkPUHv
 U+AJkD1RB11uFaOBxVcuK2lrhxgReTUpkQO3ODj05Xmd+aRJgM3ccrGpaWXvvC4hKjzb
 o6QwnC8r3Er/CWLFKQFVdGDk6LbOsYbE67wwEaiGd8JC8+nNinLEE9SCb3tmd70X9d/K
 kAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=hiVLruuS610U5KXu/rLH4E6cgqoHwaQnK6C0kYLeaGE=;
 b=CZC+JlMDSBrH8QrtBcd9OZfd5WzUR7ZbX4Blx7j/6zVKLjKii5KWJksxGfTBBjdD04
 2x9n5slBPWEo8gT+PMhg/0ShsHqhmMDuyNOtKrqN1/rtUKpgvredh2dtKTD+zbZ5tstP
 Qtv/cQ2yrBSgCUqXixooQZNlPXoYxys0jIOTgB6eNOeLgLfCwqzaKBssfE53/4/4L+fC
 KR1uJoVzdZU6Tw+9bjBzVnXkya0QcwgHnJ/sUb0q357Yq/UdUtkdN/wuaxbGCT0DB+6F
 b4lbY8rmKykZQNulBu63HtU2fC7xy+gVGtRCuhZQJ+YzGFxv0hg6TaXF1WSvpsm/EYLE
 Eerg==
X-Gm-Message-State: APjAAAW4nTuc54sASCYsyfPtEt2ru4GCdxs39kMTjMH97ir6KxZ4ijIh
 irQzWUusOkVHKPZDbbyUYx0=
X-Google-Smtp-Source: APXvYqzonKp1npXOVf+7+xDsQ8V716ESJICZmHVDMVRbsjnXLSCVJITToCWTYnJc9oSLVPMPkwAuAA==
X-Received: by 2002:a17:90a:e38b:: with SMTP id
 b11mr6748291pjz.142.1567722627917; 
 Thu, 05 Sep 2019 15:30:27 -0700 (PDT)
Received: from localhost ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id m9sm3112409pgr.24.2019.09.05.15.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 15:30:27 -0700 (PDT)
Date: Fri, 06 Sep 2019 08:29:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3] powerpc/64: system call implement the bulk of the
 logic in C
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190905123512.24311-1-npiggin@gmail.com>
 <5407d893-5d04-5363-906b-32607479c925@c-s.fr>
In-Reply-To: <5407d893-5d04-5363-906b-32607479c925@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1567722266.e46t8f2fyp.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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

Christophe Leroy's on September 6, 2019 2:29 am:
>=20
>=20
> Le 05/09/2019 =C3=A0 14:35, Nicholas Piggin a =C3=A9crit=C2=A0:
>> -.Lsyscall_error_cont:
>> -	ld	r7,_NIP(r1)
>>   BEGIN_FTR_SECTION
>>   	stdcx.	r0,0,r1			/* to clear the reservation */
>>   END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>> -	andi.	r6,r8,MSR_PR
>> -	ld	r4,_LINK(r1)
>>  =20
>> -	kuap_check_amr r10, r11
>> +	mtspr	SPRN_SRR0,r4
>> +	mtspr	SPRN_SRR1,r5
>=20
> That looks dangerous. Once you have modified SRR0 and SRR1, your=20
> exception becomes unrecoverable, so this should be done as close as=20
> possible to the rfi.

Worse than that even, when we set MSR[RI]=3D0 the exception becomes
unrecoverable, and that happens in the C code!

> Here you seem to do many thinks inbetween,=20
> including restoring some registers from the stack.

The code it replaces has a pretty large non-recoverable window as
well, interrupt entry has large ones particularly for KVM. It's an
unfortunate quirk of the architecture but it's not worth getting
too worried about or sacrificing too much performance for.

I do have some later patches which improves this a lot, but that will
wait until after the interrupt return is also changed to C.

Thanks,
Nick

=
