Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E525630F2C0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 12:56:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWcTV25mpzDqZH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 22:56:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=k9HPa6S0; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWbwr4r5NzDwjd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 22:31:40 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id j11so1590273plt.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 03:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=3CB4MCZ85DwaLiKzKVgeQnD5vf+U92x4kLCLMykOTg8=;
 b=k9HPa6S0LtYpXOnoVSCPOt4rydV4uPwVB2Tkn5XOxADxPmUQDWGNaM1j0+Y6UTGemM
 yZA3vqxMQIoeltwYMf7q364NdCj96ObSe/BcHrj+IkZizFO2VMmIzbh1KD6FzW/TAqFL
 DNMcN7s//utk+cN+fskPKsI9nbdeIiKYndQa8zUrkkTidgkWKfqE0bHPO2IPIpFMPE27
 In7drNa2VSCITxPG1pokWOA0ThuUnYB5zoSs9MBKNmL6NuEhxuroBWDGxpQYoRyngODB
 01lufziCA6vkikWBrJbot3o2PbWZHvM29YpMj419XjiP/aUzAp+acx9o2BZAG5Gdcsq5
 GWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=3CB4MCZ85DwaLiKzKVgeQnD5vf+U92x4kLCLMykOTg8=;
 b=Vbu70mHsOHkBvAowhG0kqJN89gHuUqwvWyaJSpptkOxXq2nGVr/z3gt9toN1JqckHQ
 kGoQYQw9ljixy5GmtX9ZVNyyFCEHe1Kbly394lKy1NGrKw2Clr/x31FsRRA2QNd0DcJs
 PfItK8uoaC/EvXuSsqYAXnmq97RA7G0BFgX0LPDJwwuJh07GbGYIS0ULu7WpI4DiaK8p
 qloMXm4tz390h5S+MR+7tlJYjiB1+6g2AQE2WUyMCsDNW5fV4E3fUBHORFGFri7cvRE3
 z8AZjzDho3t0oSCsvqtbgWfRMN9W3Zf6jBosNgleMQe0OCQGJypAYWS95X7Ae0MB9Eah
 VGsA==
X-Gm-Message-State: AOAM531X7ytY16TaU+YNExgAkoulgrhYHsd8antTJC9BRUG/K0CuhJb7
 4pdhTs9aA3vINxfVpAIFVgyI0zGgx1E=
X-Google-Smtp-Source: ABdhPJzU6G772RBRtPVusr8C3u2H+xcr9IKn9k5gzpA4p3jxYM7bf6Isy8W44qsQ2lAtS04mu40uOA==
X-Received: by 2002:a17:90a:1e:: with SMTP id 30mr7710927pja.115.1612438296129; 
 Thu, 04 Feb 2021 03:31:36 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id v31sm6313489pgl.76.2021.02.04.03.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:31:35 -0800 (PST)
Date: Thu, 04 Feb 2021 21:31:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 39/42] powerpc: move NMI entry/exit code into wrapper
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-40-npiggin@gmail.com>
 <87k0rop29e.fsf@mpe.ellerman.id.au>
In-Reply-To: <87k0rop29e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1612438069.44myr3nzfs.astroid@bobo.none>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of February 4, 2021 8:15 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> This moves the common NMI entry and exit code into the interrupt handler
>> wrappers.
>>
>> This changes the behaviour of soft-NMI (watchdog) and HMI interrupts, an=
d
>> also MCE interrupts on 64e, by adding missing parts of the NMI entry to
>> them.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/interrupt.h | 28 ++++++++++++++++++++++
>>  arch/powerpc/kernel/mce.c            | 11 ---------
>>  arch/powerpc/kernel/traps.c          | 35 +++++-----------------------
>>  arch/powerpc/kernel/watchdog.c       | 10 ++++----
>>  4 files changed, 38 insertions(+), 46 deletions(-)
>=20
> This is unhappy when injecting SLB multi-hits:
>=20
>   root@p86-2:~# echo PPC_SLB_MULTIHIT > /sys/kernel/debug/provoke-crash/D=
IRECT
>   [  312.496026][ T1344] kernel BUG at arch/powerpc/include/asm/interrupt=
.h:152!
>   [  312.496037][ T1344] Oops: Exception in kernel mode, sig: 5 [#1]
>   [  312.496045][ T1344] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048=
 NUMA pSeries

pseries hash. Blast!

> 147 static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, s=
truct interrupt_nmi_state *state)
> 148 {
> 149 	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
> 150 			!firmware_has_feature(FW_FEATURE_LPAR) ||
> 151 			radix_enabled() || (mfmsr() & MSR_DR))
> 152 		nmi_exit();
>=20
>=20
> So presumably it's:
>=20
> #define __nmi_exit()						\
> 	do {							\
> 		BUG_ON(!in_nmi());				\

Yes that would be it, pseries machine check enables MMU half way through=20
so only one side of this triggers.

The MSR_DR check is supposed to catch the other NMIs that run with MMU=20
on (perf, watchdog, etc). Suppose it could test TRAP(regs) explicitly
although I wonder if we should also do this to keep things balanced

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/=
pseries/ras.c
index 149cec2212e6..f57ca0c570be 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -719,6 +719,7 @@ static int mce_handle_err_virtmode(struct pt_regs *regs=
,
=20
 static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *e=
rrp)
 {
+       unsigned long msr;
        struct pseries_errorlog *pseries_log;
        struct pseries_mc_errorlog *mce_log =3D NULL;
        int disposition =3D rtas_error_disposition(errp);
@@ -747,9 +748,12 @@ static int mce_handle_error(struct pt_regs *regs, stru=
ct rtas_error_log *errp)
         *       SLB multihit is done by now.
         */
 out:
-       mtmsr(mfmsr() | MSR_IR | MSR_DR);
+       msr =3D mfmsr();
+       mtmsr(msr | MSR_IR | MSR_DR);
        disposition =3D mce_handle_err_virtmode(regs, errp, mce_log,
                                              disposition);
+       mtmsr(msr);
+
        return disposition;
 }
=20

