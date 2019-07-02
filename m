Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0AA5C937
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 08:21:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dDdW10x2zDqSk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 16:21:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KkqJZOpf"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dDbl4X3hzDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 16:19:31 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id 196so7155150pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 23:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=5mRd6FQHcgCnSqT2g/bRGXaiKnjHcLrey9U3bhNY2RM=;
 b=KkqJZOpflqhCj9arHhSkXN2You+pOPuwJNiVuyz35vWGulfmZtlkvuIKPPp4zGu3Oh
 1sb8ihw0bzpUHy0/E+L/J3+JXQQynOk5JXClB5SMnM7PyuryoaiQbKZiCVMOmoORGgWC
 mAAUS+c+T3tA8o/CbmkSGKa+tXcbvwMk0M6a9yBCieH6v/6V3T+kJYn4auG5u6GdCjot
 AbxMER/nm8cdunpWdud1olXVoWD2Rcd4IpIr+1+7s7jz87yt82cd4ajJEywxqZGZLeLp
 uoc+A8m/JFLa9M76/P+VIoBF79ulT8DN/6pB62V54kD6uC1plqJN/l4Y0t9BYQevYUvr
 c5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=5mRd6FQHcgCnSqT2g/bRGXaiKnjHcLrey9U3bhNY2RM=;
 b=XJ3UuXmebf+V+KdZXZwptq6HdwgvCEGG8SKeNLB9P1zbePEuG88LatMlRkYFd3uqoN
 EfMNnJ6JGMno/5/BGjGfGn6wBjDZ0WzIobsvEqHOHdRqFv2wBCgKB7NSQ+9mceFwDM0F
 tFd419K+v7pbOeG3amzaby/2fclBhGXv2z7B24A2V9kqw4LYMl3RhfVYawnA5D9+xpUE
 hjmLYfRmETfIz48cxaoHlQ7KtA0Xe7/uZDIABaOxUPMEktxb3eOg14t5dJ7lP62vKAyh
 eTOvBdDpQVYgdF38pGaoAMIwbeKaGGPl2It1kQA+8fkePZFSipnOBQoDUoeEa/e1Dg0b
 N4JQ==
X-Gm-Message-State: APjAAAW8btMGY35k43NHQ8t0iZ9g7d/aZzIHpWerYfctrXs0wAjhPhzO
 32TzJn8du662ivPzSSByC2ZM73PF
X-Google-Smtp-Source: APXvYqy2mxxBWEMCKswjPaShPzn6iOJAkTZtfMjZm1iaRnTk1cmy0MwnXmGRjvkXFdy2Bh9tc9F5TA==
X-Received: by 2002:a17:90a:9604:: with SMTP id
 v4mr3605117pjo.66.1562048369395; 
 Mon, 01 Jul 2019 23:19:29 -0700 (PDT)
Received: from localhost ([175.45.73.101])
 by smtp.gmail.com with ESMTPSA id x65sm14526091pfd.139.2019.07.01.23.19.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 23:19:29 -0700 (PDT)
Date: Tue, 02 Jul 2019 16:19:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v2 12/12] powerpc/64s: Save r13 in machine_check_common_early
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj
 <santosh@fossix.org>
References: <20190702051932.511-1-santosh@fossix.org>
 <20190702051932.511-13-santosh@fossix.org>
In-Reply-To: <20190702051932.511-13-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562048251.j2f6zct1ph.astroid@bobo.none>
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

Santosh Sivaraj's on July 2, 2019 3:19 pm:
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
> To fix, ensure that r13 is properly restored after an MCE.
>=20
> This commit is needed for testing this series, this is a possible simulat=
or
> bug.

This introduces a bug, of course -- MCE occurring when r13 !=3D PACA
will corrupt r13.

> ---
>  arch/powerpc/kernel/exceptions-64s.S | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index 311f1392a2ec..932d8d05892c 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -265,6 +265,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
>  EXC_REAL_END(machine_check, 0x200, 0x100)
>  EXC_VIRT_NONE(0x4200, 0x100)
>  TRAMP_REAL_BEGIN(machine_check_common_early)
> +	SET_SCRATCH0(r13)		/* save r13 */
>  	EXCEPTION_PROLOG_1(PACA_EXMC, NOTEST, 0x200)
>  	/*
>  	 * Register contents:
> --=20
> 2.20.1
>=20
>=20
=
