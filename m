Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1740B26B900
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 02:54:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrhSy068XzDqRt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 10:54:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iYk+kKA3; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrhPm40WBzDqKv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 10:51:55 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id v196so2977212pfc.1;
 Tue, 15 Sep 2020 17:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=4VG52NZ5PylUbTv0Q7EDPuFbreo6io19OqglSpd2cD4=;
 b=iYk+kKA3vmB4m0bCyZfbroS+2sCVjoLIS/stfocvV6oUe+sCR6FeTKps5z0e3jWiCD
 T/yNexv7sL15rvODycGRaZId38woG+toYb4aJ17X5uwu/7ZPNmkxvGqfJGaBmbU+A2U2
 Lr0UNOl1rPDbLUgwjA6vkzpfmCxB2SQf9X9qSNwFRtkD9QhoOTYZ8W0vjIGEAcFCiqG8
 6Qt0Pqumw7AcfddW/9g+J8bSkE4Y81CK0jHkAMxFQUC093N8ItSE/jS6g2hli+Dydbp+
 wcqa7pznO82ZAPjfSQ/WKMjkgSXsUgBlMwYFwEoKpopFzDedgYUjkJceHtsRLkp9Jwkx
 rUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4VG52NZ5PylUbTv0Q7EDPuFbreo6io19OqglSpd2cD4=;
 b=Psoiin711QnIF9A8JQMvyqbpsvoWNRfYPv+ijqMFPRiX4weXCDBrIDsWQIrxkrVFSd
 JgG5s1oyszXC9bl4cxUVvuvoFtKMtyf2v7dpNPiZvp0O7wp9O+YmJzvUduYywIsZTTvo
 eaP/ogvkvArJR6BtO0v6PTwuGSgLTnpkTMQXlacUOHcA01VlrswbEVuUfJ6WMQ9dTatd
 DNF4YNzni2MKM1i1O3rP77HQ4Juuq2hzuBkBjqDeQ75p6ZibPedA8NcqOdu7mW+paWK4
 bKXhL8LrTQ8d6tZYuC0ZuLDiDgpjjVJrFPym46C4ikJAgnEb8rv5ky/voRDGeZY4VQmI
 HOnQ==
X-Gm-Message-State: AOAM530NKYF+ZI/RR1h57DteqeU0LbPVC+DEEXxYrc1G0mTiJun87Q+L
 VCbNxGiwxdUxJd/eb2BY6ylUMfP28Jx9Yw==
X-Google-Smtp-Source: ABdhPJykdFxYQHIpMnh8nQ1FL0zlz4bPSng6Kem9+6L9xgZeOow4kF8BNsWCc7U1lLS2kdop7q1Zew==
X-Received: by 2002:a63:1a19:: with SMTP id a25mr16025701pga.359.1600217512373; 
 Tue, 15 Sep 2020 17:51:52 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id nl10sm583701pjb.11.2020.09.15.17.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 17:51:51 -0700 (PDT)
Date: Wed, 16 Sep 2020 10:51:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Injecting SLB miltihit crashes kernel 5.9.0-rc5
To: linuxppc-dev@lists.ozlabs.org, mahesh@lists.ozlabs.org, Michael Ellerman
 <mpe@ellerman.id.au>, Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>
References: <20200915084302.GG29778@kitsune.suse.cz>
 <87bli7p5dx.fsf@mpe.ellerman.id.au>
In-Reply-To: <87bli7p5dx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1600217251.rwlk7zedhj.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of September 15, 2020 10:54 pm:
> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> Hello,
>>
>> Using the SLB mutihit injection test module (which I did not write so I
>> do not want to post it here) to verify updates on my 5.3 frankernekernel
>> I found that the kernel crashes with Oops: kernel bad access.
>>
>> I tested on latest upstream kernel build that I have at hand and the
>> result is te same (minus the message - nothing was logged and the kernel
>> simply rebooted).
>=20
> That's disappointing.

It seems to work okay with qemu and mambo injection on upstream
(powernv_defconfig). I wonder why that nmi_enter is crashing.
Can you post the output of a successful test with the patch
reverted?


qemu injection test output -=20
[  195.279885][    C0] Disabling lock debugging due to kernel taint
[  195.280891][    C0] MCE: CPU0: machine check (Warning) Host SLB Multihit=
 DAR: 00000000deadbeef [Recovered]
[  195.282117][    C0] MCE: CPU0: NIP: [c00000000003c2b4] isa300_idle_stop_=
mayloss+0x68/0x6c
[  195.283631][    C0] MCE: CPU0: Initiator CPU
[  195.284432][    C0] MCE: CPU0: Probable Software error (some chance of h=
ardware cause)
[  220.711577][   T90] MCE: CPU0: machine check (Warning) Host SLB Multihit=
 DAR: 00000000deadbeef [Recovered]
[  220.712805][   T90] MCE: CPU0: PID: 90 Comm: yes NIP: [00007fff7fdac2e0]
[  220.713553][   T90] MCE: CPU0: Initiator CPU
[  220.714021][   T90] MCE: CPU0: Probable Software error (some chance of h=
ardware cause)

Thanks,
Nick
