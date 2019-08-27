Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3F59E594
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 12:22:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HlLb3rClzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 20:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UpAEwEXB"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HlJj256bzDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 20:21:08 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id w16so13834950pfn.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 03:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=J14gvLC84E8cVdW/Z5mrTkCI/MAQmtA3k+KyTLy6NPA=;
 b=UpAEwEXBLzl96/o7+jahOw5VDmooqnPEIG+i3r9jpdDFZ3/55dojGRbfZ7G9DPRcFH
 txp5JOz+/Y4Kwi/6esQSqblXhrHLd2RLisDiAgmyBoqVaXWs2MAZYxzNpTUG7lMW/rCR
 c4r201qUwHxYnZ9bhXJXYs0dR8hn/2h2Of+upqXWBxCAm3iyYOCz8f4CDyqluvRdnaf2
 sRArMxuoXKuRBpbzGhX+9HQvuZicbiCgM4xeMCfuBZiwr5CwOJqwO/13lIN5RIssdYe0
 TdnYUOuY6AGtHNy+NukpLToW84XdDKLoSrzcWdsDgIWDH8xGHhogm2ywkhb5PnU3kGBp
 xYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=J14gvLC84E8cVdW/Z5mrTkCI/MAQmtA3k+KyTLy6NPA=;
 b=QiNu0U9WZPM1d+4WBUV27CaEVS4n9seHKz2m8VSHiuZ2RAq+Xke7qvv1AOeY1925p2
 YYt1/xu4aiTssJjBTQw8xEoJilo3GfmVg3758xOagtsxOtQ6gwwEpz1iOSv/Vmer28r8
 Pcq/GXC7gfcrvzGCHm69erGxYGR/oAaL1yvD1IeivFDR6vSVz3R1Cvf2FKANKLnbiIQx
 6KWxrkzWehgNmcut7MTVknnzOIyXztecGP092ZZNfLqUXk5Y9HIZZJEivOPdv8msBXPX
 S3YtXZEDPo2t7ay8Y1XSTfm0tJ2SllRXaXIhoAdeB/BUJFy5v/qimn6QNKysF7rVgKgP
 WbLg==
X-Gm-Message-State: APjAAAU1QjGBbCEtVQRfBD9o+adEcop/eLNa3h9sl7NSEtAcfCzJrRWk
 XKbRGvMcdT5fA98CGodlaMfbVmss
X-Google-Smtp-Source: APXvYqwD/7mDwrzHisK/2FqzL8F2ulvvcBD4NlDSki6AN099AR8AalvA0Hsc64kZlvHTr/XUKTMlsQ==
X-Received: by 2002:a63:67c6:: with SMTP id b189mr1934050pgc.163.1566901266704; 
 Tue, 27 Aug 2019 03:21:06 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id f205sm19363504pfa.161.2019.08.27.03.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 03:21:06 -0700 (PDT)
Date: Tue, 27 Aug 2019 20:20:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/4] powerpc/64: remove support for kernel-mode syscalls
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190827033010.28090-1-npiggin@gmail.com>
 <20190827033010.28090-3-npiggin@gmail.com>
 <4bcfa6ed-07f7-f162-664f-134b40124dda@c-s.fr>
In-Reply-To: <4bcfa6ed-07f7-f162-664f-134b40124dda@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566900842.ttf5qhpflv.astroid@bobo.none>
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

Christophe Leroy's on August 27, 2019 4:13 pm:
>=20
>=20
> Le 27/08/2019 =C3=A0 05:30, Nicholas Piggin a =C3=A9crit=C2=A0:
>> There is support for the kernel to execute the 'sc 0' instruction and
>> make a system call to itself. This is a relic that is unused in the
>> tree, therefore untested. It's also highly questionable for modules to
>> be doing this.
>=20
> I like it.
>=20
> I dropped support for that in PPC32 when I added fast-path syscalls.

Good, then we'll match again.

>> -	beq	2f			/* if from kernel mode */
>>   #ifdef CONFIG_PPC_FSL_BOOK3E
>>   START_BTB_FLUSH_SECTION
>>   	BTB_FLUSH(r10)
>>   END_BTB_FLUSH_SECTION
>>   #endif
>>   	ACCOUNT_CPU_USER_ENTRY(r13, r10, r11)
>> -2:	std	r2,GPR2(r1)

Btw. there is a hunk which restores this optimisation but it leaked
into a later patch, I'll move it back here.

>> @@ -122,14 +118,13 @@ END_BTB_FLUSH_SECTION
>>  =20
>>   #if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC_S=
PLPAR)
>>   BEGIN_FW_FTR_SECTION
>> -	beq	33f
>> -	/* if from user, see if there are any DTL entries to process */
>> +	/* see if there are any DTL entries to process */
>>   	ld	r10,PACALPPACAPTR(r13)	/* get ptr to VPA */
>>   	ld	r11,PACA_DTL_RIDX(r13)	/* get log read index */
>>   	addi	r10,r10,LPPACA_DTLIDX
>>   	LDX_BE	r10,0,r10		/* get log write index */
>> -	cmpd	cr1,r11,r10
>> -	beq+	cr1,33f
>> +	cmpd	r11,r10
>> +	beq+	33f
>=20
> Any need to do this change ? Why not keep it as is ?

We don't need to keep cr0 alive with the MSR_PR compare, so I prefer
to keep the cr usage more compact, and I prefer to have cr0 for short
lived results and others for long running ones as a rule.

Thanks,
Nick
=
