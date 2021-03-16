Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0C733CEBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 08:36:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F04q66Kvfz303m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:36:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=H0PbIoKK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H0PbIoKK; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F04pk0WPVz2yq9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 18:36:13 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id e2so11275132pld.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 00:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=SG7xGv2vEoLCMq35gZdaaOfUxupWlJtB1dpOm6BCIw4=;
 b=H0PbIoKKo0jn+LTNwGdv3U3Z0C/NNSo/Ug6OsexMTUBnQzNW9OmssFQvGspDJ+xV82
 a4Ap+D0kLysYJCil1nz94Y1Thh5Neym9pp54mtLOTICFS5bQrlV+R9JySGWfNnMkp0yT
 OFtf4qhtRNU5YfUK1ARUyvXAiJbHdGdjLkuRkrmLB8aTIGm3dwmnWYFDYjsWudA95SdE
 hMorGAkQt1AqEy+9vItjt2NWAVHUXBw72Nlius5zLSNBexMTiZ5r87E5r4q2UXb6H3Iq
 dEW0UYo9/LHYORt/iwzFCgWdzL+z/bQ+9NrGtKfT85rf4IdlIuECk5qNrLQXhpe6DIVu
 6QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=SG7xGv2vEoLCMq35gZdaaOfUxupWlJtB1dpOm6BCIw4=;
 b=ZG2wc005u/R9g8H25koJ8X3DD0GvRqe9exHGH97gY65+tHs5DVs8vJd45CMpPv0ODy
 A26qqnbGTzuLB5Wi5LaZhdq/icUimns+FcS5qgX+umk6WxSXyqAjIgxzcAeFSZEm7UoK
 gahSYFyqKGpWO03ZgzmUTTfwZpaiBKyijyAl85nkb703UvrMXnVzw4iM5efUi3nmU/xg
 wrc2yRENP5u+dbp7uFeb1T6bFSLoMUPgLUFgvRI6SmWWJUqUCx5mMfGr9X2BS09ppXAA
 0Qfhk9t+6AxztJE7PGuJxStkOUOvWFufKgC5lbJHmTITd0AMsHq2ueawb5/HlZbyTW4f
 LTbQ==
X-Gm-Message-State: AOAM5324CN2gpGfqR+4/hhXmx0FiOqAmf9QRfddgcDGzZFCJsRY+2t1w
 zrKZ2bAKWEV+QJnJOI2TyLg=
X-Google-Smtp-Source: ABdhPJw2XT/tXllIemjv47OFWUl1cuSrq6zclPD/pnYItiaXQOBykWZGBquvoo8Sr7fdtQ50b32PgA==
X-Received: by 2002:a17:90a:540c:: with SMTP id
 z12mr3349175pjh.163.1615880170776; 
 Tue, 16 Mar 2021 00:36:10 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id o1sm1942262pjp.4.2021.03.16.00.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 00:36:10 -0700 (PDT)
Date: Tue, 16 Mar 2021 17:36:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 28/32] powerpc/64s: interrupt implement exit logic in C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-29-npiggin@gmail.com>
 <2d68d9ad-c3a2-2372-a5b2-1a1e3fdb41e4@csgroup.eu>
In-Reply-To: <2d68d9ad-c3a2-2372-a5b2-1a1e3fdb41e4@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615879834.64tfygznle.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of March 15, 2021 11:41 pm:
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
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>> ---
>=20
> ...
>=20
>> +notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs,=
 unsigned long msr)
>> +{
>=20
> ...
>=20
>> +
>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> +	local_paca->tm_scratch =3D regs->msr;
>> +#endif
>=20
> Could we define a helper for that in asm/tm.h, that voids when CONFIG_PPC=
_TRANSACTIONAL_MEM is not=20
> selected ?

Yeah I wanted to do something about that. I don't know what it's used=20
for here. I guess it saves the return MSR so if that causes a crash then=20
the next oops would see it, but I wonder if we can just get that from=20
SRR1 + program check error codes, or if there is something we can't
reconstruct from there. Have to check with someone who knows TM better.

Thanks,
Nick
