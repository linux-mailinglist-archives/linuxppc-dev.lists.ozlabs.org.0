Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E819F9E253
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 10:24:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HhkG0GbNzDqZL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 18:24:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pgDzoRmB"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HhYr3NrmzDqws
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 18:17:19 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id q139so13607946pfc.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=CEOf0nLY5lE/dBUnLidCi1FFv0rRk45f4HDPBb+0ltM=;
 b=pgDzoRmBycZ+4c89QIixN160GULFWde3fPzE/AV0y3eL8+4mR/OO+Ro4GDiqxbysCp
 tCyXYZsAVPMSf8tyedGSMUvbIw1L5yREQn5KEYFnpnc9Ql57FQO8QynC1TWVVN3HyCJV
 2xei4N0WpsoWLyh1QLoY1NPamfHMPRlvAbnj0TAdcPldq/EOV3Zad6zS+1BlhUEYcgIs
 7HTe+uS+3ffAH5j2I4sETeRXSl4XJxE/1oxjLcZtBODQ169MQb4HLmor0lTYhXS7V9Kj
 t+3sx8t/hjO8uniwZYI0KgLVNENOD3s8wKrrPEssN7ctu2+JLuIJH/6pWtj5EoiJAkd5
 /58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=CEOf0nLY5lE/dBUnLidCi1FFv0rRk45f4HDPBb+0ltM=;
 b=RHh2uCB1wLe02/Y25357BzPCum/fkXSJCwHyNrD2V3czgFiqaObsEe1dnsYsniQr3Q
 AhJnnNFVxe0p/gSKVrRFbBjzuKkxUpUtG8XSTlVn5GZL4usBZuYAoWsu0MB2SIxqqqTH
 2KCLBqWw43sXOY6Ph/YAUaXFyDfXHeX0nsz5rJ8yAWICzyUzwCZ9ct9xklxpn5RTCsOV
 f5kej3qKW8gSlmkZr6HXBL3TzDpTxdjPYj5bzf+z2AQNcb2Ip3Zq33mg3qBq8iPn/Xao
 yMgoVwoXjwfUH/ZLFmgIw6b7xdLLHt0Lmo7SEnMukBTPoQ+w7RE3odYUXG3mwLVs9Klc
 WGew==
X-Gm-Message-State: APjAAAWETkXP9vG7N7u+w4oTW2d4HgSTZJ15AoGNSS7MLTQGsMKIuN2g
 WjNWZcEQ5WsdIpDYH8tqqnQ=
X-Google-Smtp-Source: APXvYqwGdhAwdMHg+CjxhpKDmM633BIyjSauA2RTMlKTxDgzTRnPC0zVHfu5ciKIpJqaZ4K2wpQTmw==
X-Received: by 2002:a62:8343:: with SMTP id h64mr23828111pfe.170.1566893831604; 
 Tue, 27 Aug 2019 01:17:11 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id 143sm13795812pgc.6.2019.08.27.01.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:17:11 -0700 (PDT)
Date: Tue, 27 Aug 2019 18:16:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/3] powerpc/64: __ioremap_at clean up in the error case
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190610030818.17965-1-npiggin@gmail.com>
 <c11ab8b7-86ef-c5c6-1392-b5c20fc8e185@c-s.fr>
In-Reply-To: <c11ab8b7-86ef-c5c6-1392-b5c20fc8e185@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566893767.4ybhdme9jr.astroid@bobo.none>
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

Christophe Leroy's on August 20, 2019 5:44 pm:
> Hi Nick,
>=20
> Le 10/06/2019 =C3=A0 05:08, Nicholas Piggin a =C3=A9crit=C2=A0:
>> __ioremap_at error handling is wonky, it requires caller to clean up
>> after it. Implement a helper that does the map and error cleanup and
>> remove the requirement from the caller.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>=20
>> This series is a different approach to the problem, using the generic
>> ioremap_page_range directly which reduces added code, and moves
>> the radix specific code into radix files. Thanks to Christophe for
>> pointing out various problems with the previous patch.
>>=20
>>   arch/powerpc/mm/pgtable_64.c | 27 ++++++++++++++++++++-------
>>   1 file changed, 20 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
>> index d2d976ff8a0e..6bd3660388aa 100644
>> --- a/arch/powerpc/mm/pgtable_64.c
>> +++ b/arch/powerpc/mm/pgtable_64.c
>=20
> [...]
>=20
>> @@ -182,8 +197,6 @@ void __iomem * __ioremap_caller(phys_addr_t addr, un=
signed long size,
>>  =20
>>   		area->phys_addr =3D paligned;
>>   		ret =3D __ioremap_at(paligned, area->addr, size, prot);
>> -		if (!ret)
>> -			vunmap(area->addr);
>=20
> AFAICS, ioremap_range() calls unmap_kernel_range() in the error case,
> but I can't see that that function does the vunmap(), does it ?. If not,=20
> who frees the area allocated by __get_vm_area_caller() ?

Oh good catch, I guess we need to keep a free_vm_area here.

Thanks,
Nick
=
