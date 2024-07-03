Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7409F926608
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 18:23:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Gy2Siy32;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=XNCTpZau;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDlTD1gB7z3dSq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 02:23:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Gy2Siy32;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=XNCTpZau;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDlST4hn5z3cb1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 02:23:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1720023757; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VVORDbf2msCtWnL/pUXyiHuHFrAdVWz4sP9G4CxWWlzj1zgWlyQZcgZsNLKgRfHDgB
    iUIaBCEtFlaRTlkKP6cHPtxGZqApiIdEpTrgM6PqY4XvqSvuG1FYbVoEWroNtlDfLyvk
    XjaR831cZttF7l+SJ+l2HxyGa1Gm7SZKTchFp41+Vwsqn1z0K4+ltswfthwdDUVcA0u0
    tE5TLbnFT6DmLOB+UrVCxLOVz3Da6m3hSWQFz0igCsTXcai/UDbrweCZGt7upjEXlOlM
    zSetek/bJ2ZPtEUUn7QxO+lh+Iqml/rk6lid1dD7rGlRIz9HusaMDY1Ih77qauRi6dsZ
    strg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720023757;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Xefpm7kp1QKwRcK53B/u3dUPROD/z4fSpwFfZlUnT+g=;
    b=Rk+2LGsv65JAMuSX49Rsm5StceZtRGYDQphIByXVtrzj3Chft+nhQYfFV+yBH6NJzH
    zRUhRTGAfUqaD4m5BH1yw/wkgbnuYq0s3OqqdKh1DinQ/G8MgBhC5Ot8fXxFQg+V0stx
    8y+vQQPmurrZDCFDwfmUe2nR2fZbD3mptY7fbeGGT7sXyJbv3jGMfSYLks0677f9e5Yj
    WaHiFNmmQyRPkyzcVTHJphl6KNKtMtpFxo8QX+c1O6NFhjj/x3xpSBuxcQx/YLAB3MXI
    pV4eUcwTJWT0howC366TUYEWWg5Xx9w87FJGwukXn62mz7XQO806ZO6ohL+kPStmXEV2
    YwYQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720023757;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Xefpm7kp1QKwRcK53B/u3dUPROD/z4fSpwFfZlUnT+g=;
    b=Gy2Siy32RcwgdZf5tB5Uj9bQMnetV5Sl2cX2/66Ss8FEXnqx5987dyz/oC31uhM+bI
    dLLYN5VN8CdH2QQspkpypOWky7u4KrJH6qz/Dyau0dnyc/s9C412IrgwdAkb2OYU2Igs
    eHCZk8/lSviFmAls+HGQ21LL0y+VsZKlunOTMEkwFzxxNhmqKSX8De84owH9dsraGS7p
    MLhpdhD5tdybUBT1fX35u3Cj8XWZq6z3Q/0G7F3etYebt19IopXWHsR/M9+EgqAb7+px
    8VehuSuapGUlAgf2fXZvdUtjxprmsShnY0DTjSWYOqwFS0WnzqoIxvEbF2SlNA6hUiMG
    yn8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720023757;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Xefpm7kp1QKwRcK53B/u3dUPROD/z4fSpwFfZlUnT+g=;
    b=XNCTpZauLp8RFotnyZ1DbdXYQFNrHQ2YuynthNSaK3ibX4zCBTn4kpSyMKYocsfTnv
    HE5EQqHZe1stoIy6kWBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43J0mbSkY7T0LO5Dgwl/5WHn9PRLvYVKAUYGE"
Received: from [IPV6:2a01:599:817:c09:f2fd:d497:aff:32c3]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e08389063GMZQ2I
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 3 Jul 2024 18:22:35 +0200 (CEST)
Message-ID: <de910b52-4f46-47a5-896d-d60af85ae293@xenosoft.de>
Date: Wed, 3 Jul 2024 18:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
To: Marc Zyngier <maz@kernel.org>
References: <86cynv9dx7.wl-maz@kernel.org>
 <B550D4C4-6F82-409E-B5A8-E7D123ACB93D@xenosoft.de>
 <86a5iyahbc.wl-maz@kernel.org>
Content-Language: en-US
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <86a5iyahbc.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03.07.24 12:41, Marc Zyngier wrote:
> On Wed, 03 Jul 2024 11:26:17 +0100,
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>> On 3. Jul 2024, at 08:40, Marc Zyngier <maz@kernel.org> wrote:
>>
>> This isn't a DTS. This is a listing of all the nodes, not something I
>> can use to feed the kernel. I explained how to generate it.
>>
>> Download the compiled device tree for the Nemo board:
>> http://www.xenosoft.de/fdt-nemo-board.zip
>>
>> No, thank you.
>>
>> ————————
>>
>> You know already the device tree: https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/236587.html
> Do you think I keep this sort of things from almost three years ago? I
> have better things to do.
>
> Now, either you provide the required information in the required form
> or you don't. Either you test the proposed patches or you don't.
>
> If you do, great, and I'll do my best to help you. If you don't, also
> great, because I can go back to the stuff I'm actually interested in
> (i.e. not your machine).
>
> This is your call, and only yours.
>
> 	M.
>
OK, here is the dts file: 
https://github.com/chzigotzky/kernels/blob/main/dtb_src/X1000/nemo.dts

Thanks for your help.

