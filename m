Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB6E55B87C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 10:10:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWgQb2Fy7z3cgQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 18:10:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K613IOti;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K613IOti;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWgPv3DC6z3brX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 18:10:10 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id p14so8264970pfh.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Kp9FmTyX7dGRB9FFbW8qRxYhCrBAW1WHUiTJLo4/9H4=;
        b=K613IOtiRm08GX4X7oLeBesl1pBHqqYHcDPxV7/3JEOF5n76WCWDPXYNIgN0NseE0r
         8bhO3DE3uflpJFhEfLuanvcY7ac1lLtGB/8aZNJ1w8d3jV6V1SXnxHfkCRZIkH+m60fi
         ilVcVdkV5hD1+m3AzPdKtBDW9iqf+vzUo0E9kO/Oxbv+90q0xA8uOJhRB2Gz3SW5oEWi
         yKk2yydgdryqRmqfaDuIl43PVHCXytxBCYpQ5I2V4y5AEhtLIR3BDFYDUcWk3s24zyZI
         ERJQUFowl0fWdYSG/t8vSvdCVgNdMU6LggXDVdbEtT+SZx0p1RxJ0xGekYMy+MddZSUr
         wYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Kp9FmTyX7dGRB9FFbW8qRxYhCrBAW1WHUiTJLo4/9H4=;
        b=mFe7Nm03bYjQJOE7CgIV2C/4WL6IeohSyyBuqxkJa8sArHDrV9lTohbAsO9Htk5sWF
         ajab23+x0KZzKQNQovg1sijzSp9mIzXfO2WkcNCSwj4kNg2H38OSVksloSPwxNJVlqah
         FER80AFUYw2eaTXF1ix3jx3Vyydd2RJsT89kPGWAYl3c7FHY4bQv1CtzGPSpT3U5W8hq
         tlOdig5tFg2vEj6XvmjcB2fNppCismjS/5qcG1KCj2NwvUndlS4lTY3HGvfPvGkiITZp
         2lzYzyoubSnVGJxSbpXXtBOhPsigZ+R1T05Ro651SzexA4BVwuIwEo/7t76UFflEKvm4
         aK1g==
X-Gm-Message-State: AJIora+yfJCxSKxZePJMsjR0zBTQN7/aW6g1GjmxzQlGhR39VDSD4ceY
	Jzn24sLfCeOnb2NRIydO1I8=
X-Google-Smtp-Source: AGRyM1sg7iF/y7vKHgXwujHvRSIecgmir4U7fRrNlW+Dv0GKekuR9SBw+l3PLY+27c36Xro7hy0FTA==
X-Received: by 2002:a63:794e:0:b0:40d:99b:bb4 with SMTP id u75-20020a63794e000000b0040d099b0bb4mr11868551pgc.133.1656317407267;
        Mon, 27 Jun 2022 01:10:07 -0700 (PDT)
Received: from [10.1.1.24] (222-155-0-244-adsl.sparkbb.co.nz. [222.155.0.244])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090ad70300b001ecdd9507b9sm6536341pju.26.2022.06.27.01.09.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:10:06 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
To: Arnd Bergmann <arnd@kernel.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAK8P3a1XfwkTOV7qOs1fTxf4vthNBRXKNu8A5V7TWnHT081NGA@mail.gmail.com>
 <6d1d88ee-1cf6-c735-1e6d-bafd2096e322@gmail.com>
 <CAK8P3a1KKPXr0ews9po_xjmnGYUWf18gBaZYYmnC+DvtxTKLmQ@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1fa7f932-ed3d-974c-dccb-de628191993d@gmail.com>
Date: Mon, 27 Jun 2022 20:09:46 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1KKPXr0ews9po_xjmnGYUWf18gBaZYYmnC+DvtxTKLmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd,

Am 26.06.2022 um 20:36 schrieb Arnd Bergmann:
>> There are no platform specific header files other than asm/amigahw.h and
>> asm/mvme147hw.h, currently only holding register address definitions.
>> Would it be OK to add m68k_virt_to_bus() in there if it can't remain in
>> asm/virtconvert.h, Geert?
>
> In that case, I would just leave it under the current name and not change
> m68k at all. I don't like the m68k_virt_to_bus() name because there is
> not anything CPU specific in what it does, and keeping it in a common
> header does nothing to prevent it from being used on other platforms
> either.

Fair enough.

>>>> 32bit powerpc is a different matter though.
>>>
>>> It's similar, but unrelated. The two apple ethernet drivers
>>> (bmac and mace) can again either get changed to use the
>>> dma-mapping interfaces, or get a custom pmac_virt_to_bus()/
>>> pmac_bus_to_virt() helper.
>>
>> Hmmm - I see Finn had done the DMA API conversion on macmace.c which
>> might give some hints on what to do about mace.c ... no idea about
>> bmac.c though. And again, haven't got hardware to test, so custom
>> helpers is it, then.
>
> Ok.

Again, no platform specific headers to shift renamed helpers to, so may 
as well keep this as-is.

Cheers,

	Michael


>
>           Arnd
>
