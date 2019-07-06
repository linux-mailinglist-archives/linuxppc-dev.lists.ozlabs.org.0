Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5AE60FBB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 12:02:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gnLb6vyFzDqnn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 20:01:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eLI81Mfs"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gnGF5mKlzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 19:58:13 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id j2so5316588pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Jul 2019 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=OgkUq4pJERf+K84wuUBY9ElC3CYtDVn/5dx/H84BzWU=;
 b=eLI81MfsGLsYDUtJqfJvvW9gUP3wsy6ayJ8OKw/WhrqP2nrTIWDVoPzU9V9A1sQn+B
 E870ZLZmnP1qsu5kewCD03S/wAUCAtNrxn2JzPOlrcgnRK72Ba2qyairyzvvSwv3Dsix
 fDBwj6ZYie2XK9i6JNCIWUFA6S75aH33aLnWU19K0CsM0BahkHOBj7iuif/NbLoYdNtP
 w/+5sFvJcWqtLo6nkxSyCdPXXUjmbojBrKHrEqNgRJjvZm/aqieMotghAWCwNifcz+0f
 64IlzA42lapnXtaGbc5peoeEWOO7qOmBCfkmrttrQAiccC+mplbHwD6LY/ijxLLH2jes
 ++fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=OgkUq4pJERf+K84wuUBY9ElC3CYtDVn/5dx/H84BzWU=;
 b=dzLtm8KeTN2D4nMQCeJvmKhdkSxRxb7wHwqqJVcJwmEecmFCbDJ+VKhEPAaRJfNF0X
 ztzI4/fEMJwM/k52pC5KXOfX8Sf5T/IKb7oT320lIedukwwiZtUXhQOE8hhU1aolvMu9
 ozLlrBSSL922+OVaQDdDVhzgVV4FS53IFFGM9gkHO/pWoO0D4usjLKFA8Y0eUdRDt9XV
 hB3UNSuxA6bSWSUPv7SPHWYwA8AnAaCyAwvYsCn0mKkJB4jA+/E8v9sJOqpD3iMLJo3R
 ClUwnVlIfj17JOoqdpx+e1kd8jiN+JvUwaJqn7yHmL06pE/4fgAjBTeBVut7Q51x2ooG
 ieLw==
X-Gm-Message-State: APjAAAXP5OIEzeSom8crzfbpoeC2VnyouIwKCyebqMYMC4kSnI8ZOZ4p
 WJZFCRjRQi/SJIVBOwT/e7rlC/QN
X-Google-Smtp-Source: APXvYqxru/SUN9i3mpQxcmFOHhX7eQ+nvNAGGRSapdYmtVB+y3Wo1tQkKtqPygbRxVVPKMj6xDUHPA==
X-Received: by 2002:a17:90a:a404:: with SMTP id
 y4mr11152148pjp.58.1562407091661; 
 Sat, 06 Jul 2019 02:58:11 -0700 (PDT)
Received: from localhost (193-116-72-119.tpgi.com.au. [193.116.72.119])
 by smtp.gmail.com with ESMTPSA id s66sm15861712pgs.39.2019.07.06.02.58.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 02:58:11 -0700 (PDT)
Date: Sat, 06 Jul 2019 19:56:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v3 7/7] powerpc/64s: save r13 in MCE handler (simulator
 workaroud)
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj
 <santosh@fossix.org>
References: <20190705212647.21750-1-santosh@fossix.org>
 <20190705212647.21750-8-santosh@fossix.org>
In-Reply-To: <20190705212647.21750-8-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562406898.yw658lj3rp.astroid@bobo.none>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj's on July 6, 2019 7:26 am:
> From: Reza Arbab <arbab@linux.ibm.com>
>=20
> Testing my memcpy_mcsafe() work in progress with an injected UE, I get
> an error like this immediately after the function returns:
>=20
> BUG: Unable to handle kernel data access at 0x7fff84dec8f8
> Faulting instruction address: 0xc0080000009c00b0
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=3D2048 NUMA PowerNV
> Modules linked in: mce(O+) vmx_crypto crc32c_vpmsum
> CPU: 0 PID: 1375 Comm: modprobe Tainted: G           O      5.1.0-rc6 #26=
7
> NIP:  c0080000009c00b0 LR: c0080000009c00a8 CTR: c000000000095f90
> REGS: c0000000ee197790 TRAP: 0300   Tainted: G           O       (5.1.0-r=
c6)
> MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88002826=
  XER: 00040000
> CFAR: c000000000095f8c DAR: 00007fff84dec8f8 DSISR: 40000000 IRQMASK: 0
> GPR00: 000000006c6c6568 c0000000ee197a20 c0080000009c8400 fffffffffffffff=
2
> GPR04: c0080000009c02e0 0000000000000006 0000000000000000 c000000003c834c=
8
> GPR08: 0080000000000000 776a6681b7fb5100 0000000000000000 c0080000009c01c=
8
> GPR12: c000000000095f90 00007fff84debc00 000000004d071440 000000000000000=
0
> GPR16: 0000000100000601 c0080000009e0000 c000000000c98dd8 c000000000c98d9=
8
> GPR20: c000000003bba970 c0080000009c04d0 c0080000009c0618 c0000000001e582=
0
> GPR24: 0000000000000000 0000000000000100 0000000000000001 c000000003bba95=
8
> GPR28: c0080000009c02e8 c0080000009c0318 c0080000009c02e0 000000000000000=
0
> NIP [c0080000009c00b0] cause_ue+0xa8/0xe8 [mce]
> LR [c0080000009c00a8] cause_ue+0xa0/0xe8 [mce]
>=20
> After debugging we see that the first instruction at vector 200 is skippe=
d by
> the simulator, due to which r13 is not saved. Adding a nop at 0x200 fixes=
 the
> issue.
>=20
> (This commit is needed for testing this series. This should not be taken
> into the tree)

Would be good if this was testable in simulator upstream, did you
report it? What does cause_ue do? exc_mce in mambo seems to do the
right thing AFAIKS.

Thanks,
Nick

> ---
>  arch/powerpc/kernel/exceptions-64s.S | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index 73ba246ca11d..8e43abb2a744 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -255,6 +255,7 @@ EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
>  	 * some code path might still want to branch into the original
>  	 * vector
>  	 */
> +	nop
>  	SET_SCRATCH0(r13)		/* save r13 */
>  	EXCEPTION_PROLOG_0(PACA_EXMC)
>  BEGIN_FTR_SECTION
> --=20
> 2.20.1
>=20
>=20
=
