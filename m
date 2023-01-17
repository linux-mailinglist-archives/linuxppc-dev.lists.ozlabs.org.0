Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 884CC66DF6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 14:52:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nx9M72cBwz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 00:52:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jsBx8wfv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.84; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jsBx8wfv;
	dkim-atps=neutral
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nx9L860H5z3bWC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 00:51:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1673963504; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VISLl0CEoN0NBmA5gO8nOOkJcpRsmpjnjbFeKaD4Ql+cdO3YXXLHIl0Eh6kNEq+9cf
    8CElogUtU/K8jrvMVNzh9Pfpth33cNiVTW+P3Oilqvp05NgpASHaA3C8QVbO0+sZ1VD1
    vu8Vi6zBKV6IDYHvqcz0ypzePAaKMZiYB9W4F0BI+PxWhojFYBF9wXDiw1a15L/7xUEw
    2ZHT2to1xOTbUSGaJOuZyjn2aoDUFnNaEQpCiGuIObTgYG+2hUYzmiRI3tTNlBpM6L7v
    J30+a0V9YqmNSZeGXA0+dHFK3vaItZ0rVZNB6ll69K88jcscC3qTkuErd3CRCbWq02c6
    7qGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1673963504;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ZwPwmnzs9X+ESAK/TGlo2iBPgQ+6K8p1lGVo8rQZdAs=;
    b=SOdHvGKgkqcHOXlG8sYkM7EOMiJHpVx1eCXxgzPf5OyEL8LunPJmhXUbsxzTsiqERN
    5fu1bseKQ3FS713+zwppReVdaIDL81OsoBhENH3N05e2d3rNs2balif+DhD9MRGUTyrE
    uHZolYshKwjREQzJu7Q6tnDCgvhb31pKzSBXPzUzG7btth7cRZdTKpZHn8m39LWDKV+M
    Ezk3FepiTL/J80DBfOeKyaH2+E1rbBRw+qqDyIXL/4czjKOfsIYZiCSYP9BGxKtnMVAA
    BbmkK8NyJG5YRNHz3c48QRPDhh5p+Zd7rinABGLEtAtz/7inn+HQhyRKmLCWSrqEIHW4
    jopA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1673963504;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ZwPwmnzs9X+ESAK/TGlo2iBPgQ+6K8p1lGVo8rQZdAs=;
    b=jsBx8wfvph1KumXDEJ5RujdZwz3u7sEDY70bvNJsxObWSJ/safkGTHCICMQuZ0/KOY
    N6IFBqjz2aUcGF7aNPnTSMvACgXyoJttNkuVx9xM1CnopAminpxXalU+yEMI0y1dakn/
    VB0Y6dcFoKcLsd5bMugGBlTfT5vig443WBLUq3crqbNqxLm7tK1ZxiHWY3mf0wsiIgDk
    kQxQJ4DADita/EFhloYXhfNHrF5Fj2HOE6FfczIXCssRZElqorG9wfr5EjA0t15Dtqv4
    QSm8/VQQDk+lxSSAU5OhzwihVi64Xt4sLLe8/OVKMWuw0CGFJoTze27p6KzFTNyTuryO
    3+AA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiH4xfG4rw4kVjaZcB8JtwO"
Received: from [IPV6:2a02:8109:8980:4474:b:cdc4:8c3:7d00]
    by smtp.strato.de (RZmta 48.6.2 AUTH)
    with ESMTPSA id i8cc1ez0HDphHoj
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 17 Jan 2023 14:51:43 +0100 (CET)
Message-ID: <aafbda4b-3a1a-cf7d-0a29-ba0b8b4adc4e@xenosoft.de>
Date: Tue, 17 Jan 2023 14:51:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PASEMI] Nemo board doesn't reboot anymore after the commit "HID:
 usbhid: Add ALWAYS_POLL quirk for some mice"
To: Jiri Kosina <jikos@kernel.org>
References: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de>
 <75f18191-c311-18f2-bfdb-ac82fb166e1b@xenosoft.de>
 <nycvar.YFH.7.76.2301061540530.1734@cbobk.fhfr.pm>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <nycvar.YFH.7.76.2301061540530.1734@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, linux-input@vger.kernel.org, Christian Zigotzky <info@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, anpatel@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06 January 2023 at 03:41 pm, Jiri Kosina wrote:
> On Fri, 6 Jan 2023, Christian Zigotzky wrote:
>
>> Hello,
>>
>> The reboot issue is still present in the RC2 of kernel 6.2. We still need the
>> usbhid.patch. [1]
>>
>> Please check the bad commit. [2]
> Ankit,
>
> have you tested with all the devices that you added the quirk for in your
> original patch?
>
> Unless I hear otherwise, I will just drop
> the quirk for USB_DEVICE_ID_CHERRY_MOUSE_000C before this gets clarified.
>
> Thanks,
>
The issue also affects the RC4.

-- Christian
