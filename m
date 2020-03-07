Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 815D017C9F2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 01:56:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z5fD4Lz5zDrQp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 11:56:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.193;
 helo=mail-pg1-f193.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UGqV6+j2; dkim-atps=neutral
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z5cn0p4dzDqw2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 11:55:20 +1100 (AEDT)
Received: by mail-pg1-f193.google.com with SMTP id d9so1854896pgu.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2020 16:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=thzwk5SGx+uMlt9vi40Zw9madvFB2zG4Qsxcm0q/Mw0=;
 b=UGqV6+j2E7QzldiiDtyJrqSWXFULvB2vFCR8eAnvxQbLNuxU0bfAriGq1s2aPUkJoZ
 o4VRg0CI6H4RYFXoyWPsA5v7yJ2RiZGtNtKQCAlhqS3gqAB4KkoUas2K8BO1yc1fqozq
 Pt0ItH7pXsqprdRFlaQujtplaVndcAlVs8FNMNcuMIkRVnnSLcVj9sPXqzET83iE2NnX
 1t2D2eytcWrbNrnyyHfTNlW71HMuM50JgCNqHVsMc+0KAWaVvgSxnP2pU8hsFaPSEH3w
 3pXROLWU8L2LtaZApK7a4jBbKbfo3YSoZ3Q0OkStp65mbJS/oYMSzV0db5IZCThhGc3Q
 7Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=thzwk5SGx+uMlt9vi40Zw9madvFB2zG4Qsxcm0q/Mw0=;
 b=D7k6YAmsJB70tQUfiDNgLau6dwXkwEcudX8scHH7tLOc4UjWy8rlbghlXlAmIZnFSK
 3OX+xO5dCriaLCF/GM6QFiOz0DHz7zu+tSTFMfws6/+hWb+zQJLMOW1E8cllpNH/WV+J
 YcKD99hogCflt6f9mfNla2n2PIxdXjF+oMjtJ4ittucDdA7TO/LikasNWl6wgx0FewoJ
 5GRHiqUXB2tNGrqXHDpw8guRpkeMPvYZUw3EmqwInzMBYk6c4saiRSzlIDMMDTaF6/UF
 9l7G1Nq0BUS3V7K6P/Q2uDOuSPieI7toI5VxN+1ABLZRHazXfleQoucBh0E4cMY/aatx
 gEqg==
X-Gm-Message-State: ANhLgQ0JREAl9WtQghtwPP1NmpUL6ebIDJyBMHQ9zjhvFBLPCrm2hx98
 CHTHrFDwEkGv/J4/MIHJXvdO+birdJo=
X-Google-Smtp-Source: ADFU+vsPU+A89SwVf7M+bzsddmQ9D1nbWXx/++wJ+zxedCkZ1XVEpvfKawVchBewwEMdHY2IlIGPNw==
X-Received: by 2002:a63:e4d:: with SMTP id 13mr5556637pgo.343.1583542457079;
 Fri, 06 Mar 2020 16:54:17 -0800 (PST)
Received: from localhost (193-116-204-226.tpgi.com.au. [193.116.204.226])
 by smtp.gmail.com with ESMTPSA id bb4sm10536865pjb.8.2020.03.06.16.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 16:54:16 -0800 (PST)
Date: Sat, 07 Mar 2020 10:54:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] Fix powerpc/64: system call zero volatile registers when
 returning
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-27-npiggin@gmail.com>
 <20200225212032.GI22482@gate.crashing.org>
In-Reply-To: <20200225212032.GI22482@gate.crashing.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1583542224.q2gru1acfu.astroid@bobo.none>
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

Here's an incremental fix that can be folded into the patch.

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
>=20
> This also deserves a big fat comment imo, it is very important after
> all, and not so obvious.
>=20
>=20
> Segher
>=20

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.=
S
index 0e2c56573a41..ea534375250b 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -135,6 +135,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
=20
 	cmpdi	r3,0
 	bne	.Lsyscall_restore_regs
+	/* Zero volatile regs that may contain sensitive kernel data */
 	li	r0,0
 	li	r4,0
 	li	r5,0
--=20
2.23.0
=
