Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7F63888D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 09:57:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlQFw3Sz3z3bsq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 17:57:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OR0eliZr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OR0eliZr; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlQFS73fvz2xYt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 17:57:16 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so3000704pjv.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=KhG7DdiIupXeHhCtT3OzrIBr8xIgzyTCtv60R9AOj28=;
 b=OR0eliZr0wy/juooXT/WN9fNlZ1v+u38YQwZuxS0rVatYjKFsRf9/Lz33Y15Tvki+D
 0YhA0mtJF8GYUcmnT4LflZv06fK+up0uZrCxcXfsRySFKMfkwR3nNHd40WNXYzGq1gVS
 Y9ofSfBi2bvTI0nY/7PO0/js4np2UQlIdMWPwAO/e+oABp52H6GKs4eqk6+AEvfvYXCW
 qo8mCljXrRnBN4yGKow6W3yT5lHJysfgy5YZOM8mKM2eVu7gnklYhMNmvzTQzBi1b4Ix
 0KBRJ/9A/NjqnSyEiOFSlUOuF8q9FejwqkwMUVMT9F9vwril5flxM4gH0RpKkhliduOZ
 dB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=KhG7DdiIupXeHhCtT3OzrIBr8xIgzyTCtv60R9AOj28=;
 b=r3FuAbil7fvDQNAk62JuICzuElblqLM3iAdb3F3rabScDgx/vFVGWOwT9I/snMa7AP
 tdNF2KENyTB942tCXh/r76+SPHOT8K2Hi0S0Y5bGTDqk26DM/++53Oit5qnof/uHE/Og
 JWYy9jREZMfR1iAjy6A4LtlkxWBr+uNhDTOZ/imzrv2j3d4xRRaMRHdBcB4Eo2GxBZ1o
 VgkVqW5V4VS6EFrY37FAkJ74w9Xqbvz3xEx3nFH3e1CXM2NOcoB4znxh4SM5Rr4uZLZd
 j1cSD2zFLJU5A6d/h2euwhTtTP1lmVcSpkY8VvDcGNUQjEL3uqLRlL+d5p6tvuCdxpeE
 wPqw==
X-Gm-Message-State: AOAM532YilrWy4bt2cx1ByUioMBqUdwa5y31/vZ4kMi5uccSa1BeNvtd
 7EAp8SLzfoWAuvQMZwkQ/OA=
X-Google-Smtp-Source: ABdhPJwodw2G3AahH5x15v3WvTxAdf5SvVJDcjC0WYbwBARN1Msn6qODLQ/HYJ6/ayY/vCex5tJS2Q==
X-Received: by 2002:a17:902:e04f:b029:eb:66b0:6d08 with SMTP id
 x15-20020a170902e04fb02900eb66b06d08mr9485408plx.50.1621411033621; 
 Wed, 19 May 2021 00:57:13 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id n20sm14926827pjq.45.2021.05.19.00.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 00:57:13 -0700 (PDT)
Date: Wed, 19 May 2021 17:57:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [FSL P50x0] KVM HV doesn't work anymore
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Christian Zigotzky
 <chzigotzky@xenosoft.de>, "kvm-ppc@vger.kernel.org"
 <kvm-ppc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <04526309-4653-3349-b6de-e7640c2258d6@xenosoft.de>
 <34617b1b-e213-668b-05f6-6fce7b549bf0@xenosoft.de>
 <9af2c1c9-2caf-120b-2f97-c7722274eee3@csgroup.eu>
 <199da427-9511-34fe-1a9e-08e24995ea85@xenosoft.de>
 <1621236734.xfc1uw04eb.astroid@bobo.none>
 <e6ed7674-3df9-ec3e-8bcf-dcd8ff0fecf8@xenosoft.de>
In-Reply-To: <e6ed7674-3df9-ec3e-8bcf-dcd8ff0fecf8@xenosoft.de>
MIME-Version: 1.0
Message-Id: <1621410977.cgh0d6nvlo.astroid@bobo.none>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christian Zigotzky's message of May 17, 2021 7:42 pm:
> On 17 May 2021 at 09:42am, Nicholas Piggin wrote:
>> Excerpts from Christian Zigotzky's message of May 15, 2021 11:46 pm:
>>> On 15 May 2021 at 12:08pm Christophe Leroy wrote:
>>>>
>>>> Le 15/05/2021 =C3=A0 11:48, Christian Zigotzky a =C3=A9crit=C2=A0:
>>>>> Hi All,
>>>>>
>>>>> I bisected today [1] and the bisecting itself was OK but the
>>>>> reverting of the bad commit doesn't solve the issue. Do you have an
>>>>> idea which commit could be resposible for this issue? Maybe the
>>>>> bisecting wasn't successful. I will look in the kernel git log. Maybe
>>>>> there is a commit that affected KVM HV on FSL P50x0 machines.
>>>> If the uImage doesn't load, it may be because of the size of uImage.
>>>>
>>>> See https://github.com/linuxppc/issues/issues/208
>>>>
>>>> Is there a significant size difference with and without KVM HV ?
>>>>
>>>> Maybe you can try to remove another option to reduce the size of the
>>>> uImage.
>>> I tried it but it doesn't solve the issue. The uImage works without KVM
>>> HV in a virtual e5500 QEMU machine.
>> Any more progress with this? I would say that bisect might have just
>> been a bit unstable and maybe by chance some things did not crash so
>> it's pointing to the wrong patch.
>>
>> Upstream merge of powerpc-5.13-1 was good and powerpc-5.13-2 was bad?
>>
>> Between that looks like some KVM MMU rework. You could try the patch
>> before this one b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU
>> notifier callbacks"). That won't revert cleanly so just try run the
>> tree at that point. If it works, test the patch and see if it fails.
>>
>> Thanks,
>> Nick
> Hi Nick,
>=20
> Thanks a lot for your answer. Yes, there is a little bit of progress.=20
> The RC2 of kernel 5.13 successfully boots with -smp 3 in a virtual e5500=20
> QEMU machine.
> -smp 4 doesn't work anymore since the PowerPC updates 5.13-2. I used=20
> -smp 4 before 5.13 because my FSL P5040 machine has 4 cores.
>=20
> Could you please post a patch for reverting the commit before=20
> b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier callbacks"=
)?

You could `git checkout b1c5356e873c~1`

Thanks,
Nick
>=20
