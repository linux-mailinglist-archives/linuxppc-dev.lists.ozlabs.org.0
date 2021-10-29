Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359443F412
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 02:43:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgNw62tCqz3bTS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 11:43:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N8TEYC9V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=N8TEYC9V; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgNvS6Yflz2yPc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 11:43:16 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id v193so7603676pfc.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 17:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=tSttDyAs85YdRTHTE3emJ7S/OJ+s4acwF5FApsyQH08=;
 b=N8TEYC9VFnhGr03iDA2MxikpZv6D15vRjHi9ErTRCaIXKV5NNF58R9QAJHnx+PYplF
 VodrNw0xpo8p5lNRb8pzXg9F4I2/3WLTZmUYwvHWE2d3y6KUuUXq/FJ339wAHJtviFAo
 Z9OZf5bLJ3eCaIds2JWk9oTIAohI07wfv/tZIE+Gv3wi1PVYBYTvY+jbD7jlpxEGmJuJ
 wFx7Dny63fG6GJ4pqV5olEt1/NVUfuMi19bFEBaoc2GNYvV8yb2Xdy2m+ffnfrGMCrBX
 nd/3mIMAq0DuFPdm7prbLl+b+HyiwUfhwZ+0rFpbfzFObZbRMxdxA6nGtnhcwEi0C7bc
 b1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tSttDyAs85YdRTHTE3emJ7S/OJ+s4acwF5FApsyQH08=;
 b=4CGksKsvm1bZTgDJYg8aenSNe/Ylu069hWfdaHXeyh97QYqZ+UHlB+ARMc8b9IhLfD
 FCsj85SJ4QyOBOyh5AFEAS6E0qtn0mPVelaOllteU3dyASATqEjq6W5lIlil8G2k9m3Z
 RCBRCMnWcJmqJ3DNWwaP5AsoEJuwNpQcL38mDWbqE9htpCVss1yVMQzHY6ZyocLCMuCC
 YXBb+W6fRYvkaNsaSx2boZUaOfvA7FIv9QqBWNt/ie9XzsEMC/PFEZF4bXKmImF8IjdO
 BgQHBRN6bGoFfKb4EeiMWLwHSCHXR1X+axg+C+l4pOnBpAEP/nrl5qNgSnmTU8YSEhOE
 FFfQ==
X-Gm-Message-State: AOAM53145WxANx1Ge6FtudVdWREJ3Sff+0ZEqV62A2+ljCCqd5unqvIq
 FGNEF68+BmLLTnQtVbeMCyE=
X-Google-Smtp-Source: ABdhPJzikMR4bBiviHjA9U8Z5J/Z36wSPGzS11YKmJfPd66PWN6r54JYCWxaZogE+kiP4UFMTkOdYA==
X-Received: by 2002:a63:5453:: with SMTP id e19mr5810579pgm.178.1635468193784; 
 Thu, 28 Oct 2021 17:43:13 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id d21sm4777492pfl.59.2021.10.28.17.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 17:43:13 -0700 (PDT)
Date: Fri, 29 Oct 2021 10:43:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/32e: Ignore ESR in instruction storage interrupt
 handler
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211028133043.4159501-1-npiggin@gmail.com>
 <89fbff81-f70f-9e3e-eb5b-de7969b20638@csgroup.eu>
In-Reply-To: <89fbff81-f70f-9e3e-eb5b-de7969b20638@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1635468145.1z1rj8ivh5.astroid@bobo.none>
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
Cc: Jacques de Laval <jacques.delaval@protonmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of October 28, 2021 11:52 pm:
>=20
>=20
> Le 28/10/2021 =C3=A0 15:30, Nicholas Piggin a =C3=A9crit=C2=A0:
>> A e5500 machine running a 32-bit kernel sometimes hangs at boot,
>> seemingly going into an infinite loop of instruction storage interrupts.
>> The ESR SPR has a value of 0x800000 (store) when this happens, which is
>> likely set by a previous store. An instruction TLB miss interrupt would
>> then leave ESR unchanged, and if no PTE exists it calls directly to the
>> instruction storage interrupt handler without changing ESR.
>>=20
>> access_error() does not cause a segfault due to a store to a read-only
>> vma because is_exec is true. Most subsequent fault handling does not
>> check for a write fault on a read-only vma, and might do strange things
>> like create a writeable PTE or call page_mkwrite on a read only vma or
>> file. It's not clear what happens here to cause the infinite faulting in
>> this case, a fault handler failure or low level PTE or TLB handling.
>>=20
>> In any case this can be fixed by having the instruction storage
>> interrupt zero regs->dsisr rather than storing the ESR value to it.
>>=20
>> Link: https://lore.kernel.org/linuxppc-dev/1635306738.0z8wt7619v.astroid=
@bobo.none/
>> Fixes: a01a3f2ddbcd ("powerpc: remove arguments from fault handler funct=
ions")
>=20
> Should it go to stable as well ?

Yeah, I'm used to Fixes: tags getting picked up automatically, are we=20
not doing that anymore since someone flamed stable maintainers? :(

>=20
>> Reported-by: Jacques de Laval <jacques.delaval@protonmail.com>
>> Tested-by: Jacques de Laval <jacques.delaval@protonmail.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks,
Nick

