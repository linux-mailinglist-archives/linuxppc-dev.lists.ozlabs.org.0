Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA2D1A05C8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 06:32:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xDzX3rgBzDqNQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 14:32:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZaDq1mbj; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xDy072c5zDqNQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 14:31:36 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id t4so742333plq.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 21:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=8i1MwcXlY8EBZ3BuPjkQu79jXdi+9MUicUqjb/S8YfM=;
 b=ZaDq1mbjAH1/Bdumakc5LVetyw93bRdE6Mx31pin+jC7jg+gcVpP7adeZU6M94xgLb
 AHGc9jUNihqJsHebOa/QBpM5iW6HmGH5ZmZGC1JABCKTpA9N4npfG7y9N/2K/xmi8/Od
 sQog6v9zjdLmUzPnAhp2kcCTW4aaEclF3j43dykKIwY0KlEZKRiUQpZ8I8gtpU+AnmeO
 SgY1YDmxuKNdd8m3yJOC0KXOFsVkJhwzlAxGwRMQJGrL/aT8NNx26+J/pZQMAy7IiZQ5
 iHTAim6rn0tP520+8O7rPoIXaCDPvh0kutl9aFkMJw0GtW3zhlL7aiTHRQVbux/gSSJN
 ZMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=8i1MwcXlY8EBZ3BuPjkQu79jXdi+9MUicUqjb/S8YfM=;
 b=PYNSqphN+uEFtremtz4wtT/aI6Pq+542p1ua545fUmwW6IOn3AYy7VE6kIQyTNvs2Z
 IffvW95QN+1ZFg/YN+06YCxKN2U6LRKtkWiMhRygk7/bUJl7vPblT1Zc+9RQtwqeWM1q
 OcOGiOhnlvq2n5Wx3lJOmre+W2mJgCPV0C7zurpef13QVYhnDu8QUIle/tHlg5XThJsv
 yZkSA5dSrFeoj9j1VBjDy2ShPL/rGdw0kXLsCdDA4N+zmO59SlitoHDNTCOB3EveEjnz
 Vi1mX3H5rLOksjq48lRqQcJ0RMzZ+2DvndRcrYFLIBa8r+Yo1xr64B08pyKB3CpvIFFv
 f4+A==
X-Gm-Message-State: AGi0PuZe47JcBo8FNLSZdDfKTPQGTYEHlkaRCy/U+rh2dFuozNvKhtef
 oxAw7n7Zyd3QtBhUfkehGa0=
X-Google-Smtp-Source: APiQypK1pnqxEkW24KyZ6botQvsU2un4W5Jpny3gHYO+T79cVoGrsRfaxE8HssT9kZllEFyLdom6tA==
X-Received: by 2002:a17:902:9f8e:: with SMTP id
 g14mr630830plq.289.1586233893510; 
 Mon, 06 Apr 2020 21:31:33 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id f45sm375718pjg.29.2020.04.06.21.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 21:31:33 -0700 (PDT)
Date: Tue, 07 Apr 2020 14:30:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 13/14] powerpc/64s: system reset do not trace
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20200403132622.130394-1-npiggin@gmail.com>
 <20200403132622.130394-14-npiggin@gmail.com>
 <2c306b0a-eaac-c2c0-5fab-075398dc6b30@c-s.fr>
In-Reply-To: <2c306b0a-eaac-c2c0-5fab-075398dc6b30@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586233783.st9p14irnp.astroid@bobo.none>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 4, 2020 12:45 am:
>=20
>=20
> Le 03/04/2020 =C3=A0 15:26, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Similarly to the previous patch, do not trace system reset. This code
>> is used when there is a crash or hang, and tracing disturbs the system
>> more and has been known to crash in the crash handling path.
>>=20
>> Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/kernel/traps.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>=20
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index 1845fd7e161a..ed7b7a6e2dc0 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>> @@ -443,6 +443,9 @@ void system_reset_exception(struct pt_regs *regs)
>>   	unsigned long hsrr0, hsrr1;
>>   	bool nested =3D in_nmi();
>>   	bool saved_hsrrs =3D false;
>> +	u8 ftrace_enabled =3D local_paca->ftrace_enabled;
>> +
>> +	local_paca->ftrace_enabled =3D 0;
>=20
> I predict a build failure here in the near future ...

Will fix. Naveen suggested some helper functions for this too.

Thanks,
Nick
=
