Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF56D306867
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 01:11:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR1991C7NzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 11:11:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s2cUeiab; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR17316B9zDr4Y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 11:09:34 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id r38so2943680pgk.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 16:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=LtvkvqQCUJkw1ya8AZPrp+Rv0mXVWWoYZ+0SsP2O21o=;
 b=s2cUeiabrUHT8YH6qFHDehBNSDtrd7AgjhR9Qjdultm5x86qSu/f7/Ns3D6Lj/rFTk
 Buqr426C+c8B88QPaUwD2uvnHPTbWXfEpZqHdVPkHr21pe7OpXI4D9jbY8SsfSwYnuC+
 b1Jog5CCZGde6qJ98HkzLmTxDXgkHzoHcDsm1Tu4z8Z/mS28tHJq/luwlz/oFkpCaez7
 mjEjCoX33wS5q14Bl9TJt0Mt1UUinXOu/IM/O0DuveQUdBWcPr8psfrUtIyql2TXq0+p
 AQuEyZOC7s29EfgHFuyQvBZbXkaoK4WKdu1Oo1cULxLP3xzSVi0cPngSXWgvkhVyRdHG
 vCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=LtvkvqQCUJkw1ya8AZPrp+Rv0mXVWWoYZ+0SsP2O21o=;
 b=OcXC2a8Eg+7V7X5mYWe6BEl0wOJqRUcFa8x7QhQH4QBz48n5qjE4jyXfekuHtZ7mAi
 SmoEtdFdUKu/nOhqWZCzGCQckfCrznxcq8oq9yA8dbZIRsx0u/v1/lxYSn5dN5TfX2JD
 fZJUqFvOmw2grh/cjymINQVENTgja3prIR7qLNs+L9gS90w/nzppiaRqZ1XdvMVNkLf5
 9j71jLbTMksUXdGscRUwkWL8jiRmyf4dIdeaw5CH5g2fK4js+FOJCgeu77JD1CNjV3aB
 9BZQ1i9KN3UJsxFJtyUzcQqF/3ozYHCeodsS4HAFs+M7oIdA2HoOrd8L8wJ20kR35uf+
 tCkQ==
X-Gm-Message-State: AOAM530ECZUrnsSSwu1AcyQKHmonFmUlku8yq7y9jI+Qq5cSsw9ZAdHm
 oAvb/XXELMvYl/fU6KKIUA6MVq0vYHg=
X-Google-Smtp-Source: ABdhPJwLUlAfK994bA7dtK7s5M8OCKqvNe/NU6vWlC5rTIOSxqHIpsDUfNwvGZQlLcyppli/QOHJ9w==
X-Received: by 2002:a05:6a00:2286:b029:1ae:6c7f:31ce with SMTP id
 f6-20020a056a002286b02901ae6c7f31cemr13107196pfe.6.1611792572204; 
 Wed, 27 Jan 2021 16:09:32 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id t206sm3360179pgb.84.2021.01.27.16.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:09:31 -0800 (PST)
Date: Thu, 28 Jan 2021 10:09:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 28/32] powerpc/64s: interrupt implement exit logic in C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-29-npiggin@gmail.com>
 <a6357db2-51d4-f116-85d4-f774fe7115fd@csgroup.eu>
In-Reply-To: <a6357db2-51d4-f116-85d4-f774fe7115fd@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1611792394.usasuctror.astroid@bobo.none>
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
Cc: Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of January 27, 2021 6:54 pm:
>=20
>=20
> Le 25/02/2020 =C3=A0 18:35, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Implement the bulk of interrupt return logic in C. The asm return code
>> must handle a few cases: restoring full GPRs, and emulating stack store.
>>=20
>> The stack store emulation is significantly simplfied, rather than creati=
ng
>> a new return frame and switching to that before performing the store, it
>> uses the PACA to keep a scratch register around to perform thestore.
>>=20
>> The asm return code is moved into 64e for now. The new logic has made
>> allowance for 64e, but I don't have a full environment that works well
>> to test it, and even booting in emulated qemu is not great for stress
>> testing. 64e shouldn't be too far off working with this, given a bit
>> more testing and auditing of the logic.
>>=20
>> This is slightly faster on a POWER9 (page fault speed increases about
>> 1.1%), probably due to reduced mtmsrd.
>>=20
>=20
> How do you measure 'page fault' speed ?

mmap 1000 pages, store to each one, mprotect(PROT_READ) then=20
mprotect(PROT_READ|PROT_WRITE), then store a byte to each page
and measure the cost. Something like that IIRC.

Thanks,
Nick
