Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C71DD52DCCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 20:30:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3z1X5l1Bz3bm1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 04:30:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BbEcvDyV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2d;
 helo=mail-oa1-x2d.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BbEcvDyV; dkim-atps=neutral
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3z0t1Bgqz2ywl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 04:29:49 +1000 (AEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e656032735so7851703fac.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=CebFhyYrHA9qyenphvt66UOHmXFE+xmKVw8/99ZVMrI=;
 b=BbEcvDyVv+Ydj5Curj0uOZzUm7Y2C3b1AoRxnMmnho5SbVkNnLXCW75iaiBllx0pC9
 9JfRUk7l8DPJxhocFrgzSX6+M7XEbWvgjPMrVaEgx2mX//tpwj6Bk3xq17A3/sEBTAuD
 VcBBQCt3M+AVOp4aNNUGhEvl8lCpIODBpGqn2chRmfvMHONRqIxQeE/XHp2A5A3lawzB
 WKMJ1UKmfn798brfXuF+cuuo7c/bC7Z0DMpbGIjSUh/4Leb9jUHt284UganttTbXyeKF
 BaClhqgexI0GkPcI/fU6zLgUc3uIwpfY5Sms1ODpeTt9ghi7c0+Hp1ilSOzr00nyjRrs
 FzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition;
 bh=CebFhyYrHA9qyenphvt66UOHmXFE+xmKVw8/99ZVMrI=;
 b=vH84FkQVSYvEPdhUoW14mQX1pEuMnOYuatChpR8seZsE4vLQvSFK5l1GUfFzsddJ3c
 KzVWW/mArhEi15YEHn7+5VgG4GXvMAXfAnIXcgcFzf1nMJS+cMvpzv7EO2MW+1KXzqsY
 Yov4Tv2zSJTpNZ59cVmpxBZjNIqic55H/WrxtL/nc+ne6QM7wyOuyfYyg+4Dojex6KIK
 64W5WUw9onjyJSFGVBZtVfp3XWTm1tMJ2XWyaR/IIeZl0Dqt1EOY2vzsuFkcwQht3+Cz
 nVfYfr5w0sUIC85PC81ByxUFbGtFBijzGnIOf2tFhXWsC1v5jU4LrPTBIkONsSAUPCVJ
 HjVA==
X-Gm-Message-State: AOAM5322d3rvDswjLrjEUdcg7vQKS6rrp81U8ZZBXZyAkT0XNQaeu8FK
 NAIrFLytHjDewdMKCP7JNLc=
X-Google-Smtp-Source: ABdhPJwV1DyKvn/eltAGDpEdsrre6oNgNJic/9ukILKyeBUu0/8OT0Jalw7WF7viVMdnavsUkifHgg==
X-Received: by 2002:a05:6870:23a8:b0:e9:85b0:83e9 with SMTP id
 e40-20020a05687023a800b000e985b083e9mr3931630oap.65.1652984980287; 
 Thu, 19 May 2022 11:29:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a056870e14b00b000f1a2378a12sm1892oaa.37.2022.05.19.11.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 11:29:39 -0700 (PDT)
Date: Thu, 19 May 2022 11:29:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/fsl_book3e: Don't set rodata RO too early
Message-ID: <20220519182937.GA80472@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 19, 2022 at 07:24:15PM +0200, Christophe Leroy wrote:
> On fsl_book3e, rodata is set read-only at the same time as
> init text is set NX at the end of init. That's too early.
> 
> As both action are performed at the same time, delay both
> actions to the time rodata is expected to be made read-only.
> 
> It means we will have a small window with init mem freed but
> still executable. It shouldn't be an issue though, especially
> because the said memory gets poisoned and should therefore
> result to a bad instruction fault in case it gets executer.

executed

> 
> mmu_mark_initmem_nx() is bailing out before doing anything when
> CONFIG_STRICT_KERNEL_RWX is not selected or rodata_enabled is false.
> 
> mmu_mark_rodata_ro() is called only when CONFIG_STRICT_KERNEL_RWX
> is selected and rodata_enabled is true so this is equivalent.
> 
> Move code from mmu_mark_initmem_nx() into mmu_mark_rodata_ro() and
> remove the call to strict_kernel_rwx_enabled() which is not needed
> anymore.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: d5970045cf9e ("powerpc/fsl_booke: Update of TLBCAMs after init")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter
