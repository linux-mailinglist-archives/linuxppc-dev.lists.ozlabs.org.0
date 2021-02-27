Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9141326C12
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 08:14:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dnd7Q66k4z3cl3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 18:14:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=IYwYcNgX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.217;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=IYwYcNgX; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.217])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dnd6y0GSkz30Nj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 18:13:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1614410016; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=hojqjc2y0in+ICZtkmXJugwCKo0om5VBwiL2MGc24kACICGHoU8dQOP3dA7qb55l/r
 8ODaBcXs8NbNrcInMkZJ8C1fEUMJaVyrbFJrpYb5TV2aPJRPeixRWKx1SFWzDuv7kJ6f
 mZCvRMMIus/CRB1EycNlEX1yln59DRt/se+1zzppI5K+6b+YGe9g/MCXicMavvk2xj7+
 o4dEwfgGLoCk4e2wSE2t91oNLbeuF40GWqVEpIgy9yw01V7+Vy2O092NrxzECz7Vq1JF
 sFjHly8nbf/0eK/ACq5KTb8bKgvMLYZb1sBfJ41TuqssQSD+fEd5JAP50v+qMn3NEfqN
 Rpsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1614410016;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=izTNyvtibI5vBoqoDgV5FX6LCdeyPdv3emfkjC+qsL4=;
 b=hG3sYymN5KOcs+5E6Zb2QQRiva/ZFmDf6Qy97KoV0ggdt5yjKZ8RsQtc3nuxpeEvtU
 GiZXlvqw8fZjjUFbrF8kHm5SQkf6j+t7IVDYa5wXV2Qwj9p5K751qumJDGZrSr7+u+FW
 FstBn/3ZkVXJbWOZeGAF7qWv20f81IkONQwcXFemxpf92Lf8kZbtfl+5j4bT6uoAJ2af
 BU5qgOTZ7b7AOxPDhK8v2e0U0mciEf2mFyC18HMy9OMwFpS4F0bpmrKtQ2KIZ5Eyes06
 mh7+AH66pCSKYKkL5kTepykxKnEexJrjP5nhogPDwVUmwSnlMDAvHe3ciO/z5K91Nha6
 p7UQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1614410016;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=izTNyvtibI5vBoqoDgV5FX6LCdeyPdv3emfkjC+qsL4=;
 b=IYwYcNgXq23sVLQLmtsAjIu/h82DkapAkxjnQ4Z/dPTmxMJ1W60sRBvBmGYlwjCK5Q
 mMzvHQgKYC7MOE0Hzxvm19/l98gh70ggjw1sGqOSKQy8+/UWC4e0W1ghM5Tb8bdHIwTV
 nkPc8a1C7ju0fWocQKhcG/KFi3KOSel8ozD0rId6Q5rJVenEw1/3rzF1/EosCwJgVGKt
 AEG5gZeiT2/rBV7KWm0H9ok5HmluY3heEDpaED/VfeL+uQl+fq1I9pKDCI1evxNVVk6g
 lPWsZHFAkG5Rxxq+CcNZAANesr9pnztCL+RSBF11zrGTJ6YOjZtjTyXlpwCG9/oOBMph
 2jqw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hZUhZXBExZ2DJ7fOPvoOcBplJxYbZrRQ/FrPTuY3"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:a902:b981:69b5:8f24:7a5d:3459]
 by smtp.strato.de (RZmta 47.19.0 AUTH)
 with ESMTPSA id a070ddx1R7DYPSa
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 27 Feb 2021 08:13:34 +0100 (CET)
Subject: Re: Latest Git kernel doesn't compile because of the
 LINUX_VERSION_CODE issue
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <13741214-bafc-1ee5-4157-854c14dae17c@xenosoft.de>
 <CAOesGMgtAXPQRThhkF5QR25R+F68F5C_HSUvFPW0Wk1DcpCwvA@mail.gmail.com>
 <877dmythcr.fsf@mpe.ellerman.id.au>
 <CAOSf1CHQ=QDwH=J4kLYqboe481poa7EdbC6gzq29W7KYHhn1YQ@mail.gmail.com>
 <99f6d05a-d431-7444-bb0a-180c042c2afd@xenosoft.de>
 <e73a866b-f755-f227-e60a-4be05f467221@csgroup.eu>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <93173e85-3663-8d79-ca4b-f38b505e6e05@xenosoft.de>
Date: Sat, 27 Feb 2021 08:13:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e73a866b-f755-f227-e60a-4be05f467221@csgroup.eu>
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

Hello Christophe,

Thanks a lot for compiling the latest git kernel.

I have solved the compiling issue through setting up a value for the 
SUBLEVEL variable in "a/Makefile". Before it wasn't necessary to set up 
a value for the SUBLEVEL variable.

Cheers,
Christian

On 26 February 21 at 5:10 pm, Christophe Leroy wrote:
>
>
> Le 26/02/2021 à 13:34, Christian Zigotzky a écrit :
>> Hello,
>>
>> I tried to compile the latest Git kernel today. Unfortunately it 
>> doesn't compile.
>
> I have no such problem with latest git kernel.
>
> Christophe
>
>>
>> Error messages:
>>
>>    CC      arch/powerpc/kernel/udbg_16550.o
>> In file included from ./include/linux/stackprotector.h:10:0,
>>                   from arch/powerpc/kernel/smp.c:35:
>> ./arch/powerpc/include/asm/stackprotector.h: In function 
>> ‘boot_init_stack_canary’:
>> ./arch/powerpc/include/asm/stackprotector.h:29:30: error: expected 
>> expression before ‘;’ token
>>    canary ^= LINUX_VERSION_CODE;
>>                                ^
>> scripts/Makefile.build:271: recipe for target 
>> 'arch/powerpc/kernel/smp.o' failed
>> make[2]: *** [arch/powerpc/kernel/smp.o] Error 1
>>
>> ----
>>
>> drivers/media/cec/core/cec-api.c: In function ‘cec_adap_g_caps’:
>> drivers/media/cec/core/cec-api.c:85:35: error: expected expression 
>> before ‘;’ token
>>    caps.version = LINUX_VERSION_CODE;
>>
>> ----
>>
>> I have found the bad commit. It's "Merge tag 'kbuild-v5.12' of 
>> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild" 
>> [1]
>>
>> The changes in the Makefile (a/Makefile) are responsible for the 
>> compiling errors. [2]
>>
>> I was able to revert this bad commit. After that it compiled without 
>> any problems.
>>
>> Could you please compile the latest Git kernel and confirm this issue?
>>
>> Thanks,
>> Christian
>>
>> [1] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6fbd6cf85a3be127454a1ad58525a3adcf8612ab 
>>
>> [2] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/Makefile?id=6fbd6cf85a3be127454a1ad58525a3adcf8612ab 
>>

