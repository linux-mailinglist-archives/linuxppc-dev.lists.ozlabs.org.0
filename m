Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C860F16F63A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 04:44:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S1rx5hH2zDqc3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 14:44:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lne9Mkb8; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S1qF4JSczDqbq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 14:43:19 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id b1so397904pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 19:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Ec3p/2YtEgejtWYzQ4A9j1vyLnORs9Ek6vcUrAYJKzY=;
 b=Lne9Mkb8E3F8e2qoDlafGbXvOq/KAmdGUH68FPTKvY08EhdcRG+4vsq9PatH+WfGrb
 CLQt3gn+o+0yK4U1sjEPwb6jLLp8npF8hB1+b1MLQ8mzlw93zNYywpURCwSCIPxPooSZ
 zGwpSl0YwBzd0qVgP2AscTeuDStJnkFovE61eMd75Jzp3OQxKIg8O1X3rT5b9fUTXYic
 ZVZW+j/XPpEtHYbnjJs9rWWc/iVMiKqu8fWqFhGkWqrWUxA7yHn1bV1dB+Qxfm4+I6OX
 Cs7lVbnxbZN+2YkcZO37MMO32rlmSZdb7wIfzDC5SUcUvTL5qAZPuCFdqmNEBe49aaTW
 qihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Ec3p/2YtEgejtWYzQ4A9j1vyLnORs9Ek6vcUrAYJKzY=;
 b=X7CfNfSv5Yq3FJYSPt3qwZfq8WM3AAHTnaQQzRn6qYqzqgQZJ+nMO5taAau+M6OUh5
 kaQqrYhETXHGz6vWH/jujDZ5t0+/q6pmUF5nEHTExTFaUabtzj705OHNXH8RZihq3x8Z
 FRNC8HZU6mptZ2xJqrjX6am6T+gJTi6wG1vsz0e/QKX5NX4elP47/88EoPV9lpBILEGb
 uaBhPMmX2XtWholtOzVP1Fdx/AKkb1paPq3B1MNQ0Ri7g2cHN94Q6/Neglo0ikfZgT/i
 anrKXdt9gfgdeXagjiEdkYkx9lIRCMwYdYOGFLhk7ZFthis8lqZPWlzglXAuOXLNFIVQ
 spLQ==
X-Gm-Message-State: APjAAAWgFJ2QRNMU5VfmT1cXsMcHvuQ+H3mMhlpfDCe5GtJYFDTG89wW
 eF2LgxVPsjWVNbxAG5jcZySSqKMT
X-Google-Smtp-Source: APXvYqzueetDOANHMdMgpL+o627j0KL9H1opnk20guTgHGSoyZJEDrkA7ptHMcMME6yjNrjTscQwCw==
X-Received: by 2002:a63:7a02:: with SMTP id v2mr1691948pgc.13.1582688594928;
 Tue, 25 Feb 2020 19:43:14 -0800 (PST)
Received: from localhost ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id a195sm575162pfa.120.2020.02.25.19.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 19:43:14 -0800 (PST)
Date: Wed, 26 Feb 2020 13:39:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 26/32] powerpc/64: system call zero volatile registers
 when returning
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-27-npiggin@gmail.com>
 <20200225212032.GI22482@gate.crashing.org>
In-Reply-To: <20200225212032.GI22482@gate.crashing.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582687351.ebw6qerd1f.astroid@bobo.none>
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
Cc: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool's on February 26, 2020 7:20 am:
> Hi!
>=20
> On Wed, Feb 26, 2020 at 03:35:35AM +1000, Nicholas Piggin wrote:
>> Kernel addresses and potentially other sensitive data could be leaked
>> in volatile registers after a syscall.
>=20
>>  	cmpdi	r3,0
>>  	bne	.Lsyscall_restore_regs
>> +	li	r0,0
>> +	li	r4,0
>> +	li	r5,0
>> +	li	r6,0
>> +	li	r7,0
>> +	li	r8,0
>> +	li	r9,0
>> +	li	r10,0
>> +	li	r11,0
>> +	li	r12,0
>> +	mtctr	r0
>> +	mtspr	SPRN_XER,r0
>>  .Lsyscall_restore_regs_cont:
>=20
> What about LR?  Is that taken care of later?

LR is preserved by sc as per ABI.

> This also deserves a big fat comment imo, it is very important after
> all, and not so obvious.

Sure I can add something.

Thanks,
Nick
=
