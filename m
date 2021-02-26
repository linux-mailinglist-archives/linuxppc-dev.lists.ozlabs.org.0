Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7B83262C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 13:35:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dn8Hz52Mkz3clJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 23:35:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QVWfGSVa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.25;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=QVWfGSVa; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dn8HS2hJRz3cY9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 23:34:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1614342864; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=dw+q1WLmGzOsGMmAJOvfwsS4BTIXf/hkYZF3tiu7RulYKbSl85h9KdMbxlzrnMmuBR
 X7vU+MBPhKHS+SYNbvqAkHiByXlAwbwPNDrUVAX4oWkatkWInDV2M9Qkg7rRhOj2Rv+l
 TsushvBh3JLvTfYFVhVdEUI4+E1qnQCpmbffSpYARqyoM+Y/4kRio9R5tdaVtUiFSKZk
 KSAK2CmAJfMt4wsHS58+KOIaSMWKT5ewNWd7jSaIDf5m9WRWtjg5PnWgb1q7RHemXiqQ
 tAJJGEURQP4v9b+NjUriLeg3MbrDwO2fB19gfMjzU8VwZpphqWbBb8rYVTdrte3JdBol
 BJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1614342864;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=BqVNl0fLElTLe0UGbmS3ufCrrjrJeu0ku3dq8TET8X4=;
 b=iiaQr0A459S+0Vh6bBTZw4L8b2nqXLj6j0i/qqThtDkpFC8cvg/5AuZ9IypT2i4TS6
 J9R1zOKZVfBqPNQgBFCebZtgCVFLtH1mTrz/78g/WSqd1ErT2OmTJp4YgNcc6QpHvhz+
 AiFlRIkHZhHLTUWZEDT6U8ky+qv8sNe4kQoOFELnFXvH2JWmmOYerazGa9U39uq1SuSR
 QCjkc/7k2bxixA5IMQjazGhybA5efz7B3OFAj8/UYZzIi1kBoM17wzCN7NPym3qWGGk/
 ONzPt5kKI9paDoZCbeinYCZvTj/9dj2JtogLnC5W1jBXLjBwPV/iYSnJorDLmnZ01Mwl
 c/4g==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1614342864;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=BqVNl0fLElTLe0UGbmS3ufCrrjrJeu0ku3dq8TET8X4=;
 b=QVWfGSVabr3Li1J4vr1AID9HgQ1bQLX9ddtskVT47seWvfB52MsRbBVrHA5IIQoCsk
 cx+oKkf9aNl03Jx5LLsKQ0fYoqmPYSbgRKY3rl2wjsxs5RbXB0SJOuOXVjXK/H+kMn8R
 U7xjkSUkwLTE2c1arSmT6WjvZUn5SvezQcyOPEj62dgDLEc71IVP0JS0h3/QEcVD+3H4
 QQNezJJ2TvK6SlF/fUtL1xp4bvf1Zp8WK8Xl0Z5XaYLzbLPfMxSCpgCl450N4fcwFKKo
 NGQvh28V9isR5TH5RfOW9VW3HXesKDkPxB3LAWY8YT+oF0hSVLTS1pdtWGPzFZetCGjI
 zjdQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hZUhZXBExZ2DJ7LHPgWa3z87SbrHJ42YbESqWpiG"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:a902:b981:30b1:c800:338c:5f10]
 by smtp.strato.de (RZmta 47.19.0 AUTH)
 with ESMTPSA id a070ddx1QCYMNSG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 26 Feb 2021 13:34:22 +0100 (CET)
Subject: Latest Git kernel doesn't compile because of the LINUX_VERSION_CODE
 issue
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <13741214-bafc-1ee5-4157-854c14dae17c@xenosoft.de>
 <CAOesGMgtAXPQRThhkF5QR25R+F68F5C_HSUvFPW0Wk1DcpCwvA@mail.gmail.com>
 <877dmythcr.fsf@mpe.ellerman.id.au>
 <CAOSf1CHQ=QDwH=J4kLYqboe481poa7EdbC6gzq29W7KYHhn1YQ@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <99f6d05a-d431-7444-bb0a-180c042c2afd@xenosoft.de>
Date: Fri, 26 Feb 2021 13:34:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CHQ=QDwH=J4kLYqboe481poa7EdbC6gzq29W7KYHhn1YQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I tried to compile the latest Git kernel today. Unfortunately it doesn't 
compile.

Error messages:

   CC      arch/powerpc/kernel/udbg_16550.o
In file included from ./include/linux/stackprotector.h:10:0,
                  from arch/powerpc/kernel/smp.c:35:
./arch/powerpc/include/asm/stackprotector.h: In function 
‘boot_init_stack_canary’:
./arch/powerpc/include/asm/stackprotector.h:29:30: error: expected 
expression before ‘;’ token
   canary ^= LINUX_VERSION_CODE;
                               ^
scripts/Makefile.build:271: recipe for target 
'arch/powerpc/kernel/smp.o' failed
make[2]: *** [arch/powerpc/kernel/smp.o] Error 1

----

drivers/media/cec/core/cec-api.c: In function ‘cec_adap_g_caps’:
drivers/media/cec/core/cec-api.c:85:35: error: expected expression 
before ‘;’ token
   caps.version = LINUX_VERSION_CODE;

----

I have found the bad commit. It's "Merge tag 'kbuild-v5.12' of 
git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild" [1]

The changes in the Makefile (a/Makefile) are responsible for the 
compiling errors. [2]

I was able to revert this bad commit. After that it compiled without any 
problems.

Could you please compile the latest Git kernel and confirm this issue?

Thanks,
Christian

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6fbd6cf85a3be127454a1ad58525a3adcf8612ab
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/Makefile?id=6fbd6cf85a3be127454a1ad58525a3adcf8612ab
