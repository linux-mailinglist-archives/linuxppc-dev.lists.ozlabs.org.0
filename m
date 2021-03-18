Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5AF33FDE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 04:47:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1Cdp5rDKz3bvK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 14:47:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=Wxm/LTQu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=Wxm/LTQu; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1CdL3Gkhz302q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 14:47:02 +1100 (AEDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 26D0A891AC;
 Thu, 18 Mar 2021 16:46:59 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1616039219;
 bh=YhRnUFVrl7/8nydokzr/5/OXltn4aUhYU1Fr4pawvfs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=Wxm/LTQu9rRmMleCZxX+Ed3aTU/MrYR953tJJ3AjUCRaHDfmOyiz16R/OdsjSXSLU
 +Zg9JLw8VUflvEdzqQWdjr6Q61COrRVacgwceND/GKLES3eygfopp/cXQ6HuDAaAJ7
 Ui+J3gmmt/12WDWPXwswkczpmXeF9oG4CV3T3BIGWiqlbjUv2ZXZH1ExG/vMNvE9uI
 LzB7QwhQyZzbVwi4BWpvQzihgzw2dC1veQ+GM8PYIIx/Ry2nwVRrwVp5n0QmW5Ufz1
 etnHMCubJlFKDq6VQHE+RgweuEJMf9kZiuGIUHwnz0+2VxbSc94plTpTF3/TTOG+pI
 zF7c1rXLztH+A==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B6052cd330000>; Thu, 18 Mar 2021 16:46:59 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 16:46:58 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Thu, 18 Mar 2021 16:46:58 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEDagCAAfS7gIAALq8AgAEX54CAAKWsgIAACmIAgADZp4CAAATLAIAJ1fMA
Date: Thu, 18 Mar 2021 03:46:58 +0000
Message-ID: <9c912424-2cc9-8753-1352-1a5c27722cd2@alliedtelesis.co.nz>
References: <20210311081842.GA1070@ninjato>
 <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
 <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
In-Reply-To: <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <0D62E11FAE39D940A8C764469E59E569@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=N659UExz7-8A:10 a=dESyimp9J3IA:10 a=VNwDg8RZYkgfWyEnbsYA:9
 a=pILNOxqGKmIA:10
X-SEG-SpamProfiler-Score: 0
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 12/03/21 10:34 am, Guenter Roeck wrote:
> On 3/11/21 1:17 PM, Chris Packham wrote:
>> On 11/03/21 9:18 pm, Wolfram Sang wrote:
>>>> Bummer. What is really weird is that you see clock stretching under
>>>> CPU load. Normally clock stretching is triggered by the device, not
>>>> by the host.
>>> One example: Some hosts need an interrupt per byte to know if they
>>> should send ACK or NACK. If that interrupt is delayed, they stretch the
>>> clock.
>>>
>> It feels like something like that is happening. Looking at the T2080
>> Reference manual there is an interesting timing diagram (Figure 14-2 if
>> someone feels like looking it up). It shows SCL low between the ACK for
>> the address and the data byte. I think if we're delayed in sending the
>> next byte we could violate Ttimeout or Tlow:mext from the SMBUS spec.
>>
> I think that really leaves you only two options that I can see:
> Rework the driver to handle critical actions (such as setting TXAK,
> and everything else that might result in clock stretching) in the
> interrupt handler, or rework the driver to handle everything in
> a high priority kernel thread.
I've made some reasonable progress on making i2c-mpc more interrupt=20
driven. Assuming it works out for my use-case is there an opinion on=20
making interrupt support mandatory? Looking at all the in-tree dts files=20
that use one of the compatible strings from i2c-mpc.c they all have=20
interrupt properties so in theory nothing is using the polling mode. But=20
there may be some out-of-tree boards or boards using an old dtb that=20
would be affected?=
