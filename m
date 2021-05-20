Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61718389BF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 05:37:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlwRP25rQz307T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 13:37:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=IvlORQaz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=IvlORQaz; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlwQt38Bfz2xYZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 13:37:10 +1000 (AEST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 12209806B6;
 Thu, 20 May 2021 15:36:59 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1621481819;
 bh=VRbO4+naf38qOxw5jDMURFAeVwM1Gn4WAr6oIe/Om1Q=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=IvlORQazLNUXOxWwca6w0GSF/LVUilQq1KeoC5OsjkvkYhSWiohrXByKd4bikWAoc
 puuOF8foJdJQiD/ZFbzhVtPz5B23V25hX64edzsVFw/oiwh8zrTG9+PufAKpOB4RRQ
 ZO6Rux5xpqjxYL0lsCgVDh7K/yvuKhF4RnCJF0C4qa12ScAiMh/YrUzzgQugFHui+9
 Nj2kwGDRTR4VtYg+D9vHPpBJuP5GlCZPemxCWr1q6T9QNpqnXRZCW5xJdy7bNUyj9K
 BUgYQtUhHZaCxuQpnRodTXWeXWKIb2BSj9fp5VvuVfTNn+OhZgVvfnGsPTHVpLF1hK
 JRkX8tLfRX1hg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B60a5d95a0000>; Thu, 20 May 2021 15:36:58 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 20 May 2021 15:36:58 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.018; Thu, 20 May 2021 15:36:58 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "wsa@kernel.org" <wsa@kernel.org>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>
Subject: Re: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Thread-Topic: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Thread-Index: AQHXRquHhXA6XgnPF0OPgP79h3OVQ6reDlyAgAA9BACAAHfVAIAAZZwAgAvTcoA=
Date: Thu, 20 May 2021 03:36:58 +0000
Message-ID: <ae39c62a-7dc7-81f5-ea10-edfdbf905e9d@alliedtelesis.co.nz>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <b90f48cfdc31af08190e7a8eaa71b7bd488fcbaa.camel@infinera.com>
 <ec3cdcc8-5869-9e7d-30c0-59ff4ec67a58@alliedtelesis.co.nz>
 <4e96247275d559bab133d6c318276fa6be4d7be0.camel@infinera.com>
 <20210512150118.GA1004@ninjato>
In-Reply-To: <20210512150118.GA1004@ninjato>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <458C7B1C38153849A89C7527D57D2E44@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=WOcBoUkR c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=N659UExz7-8A:10 a=5FLXtPjwQuUA:10 a=VwQbUJbxAAAA:8 a=T-qbRSzZqTrywjUDPykA:9
 a=pILNOxqGKmIA:10 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 13/05/21 3:01 am, wsa@kernel.org wrote:
>>> I've been doing my recent work with a P2040 and prior to that I did tes=
t
>>> out the recovery on a T2081 (which isn't documented to have this
>>> erratum) when I was re-working the driver. The "new" recovery actually
>>> seems better but I don't have a reliably faulty i2c device so that's
>>> only based on me writing some code to manually trigger the recovery
>>> (using the snippet below) and observing it with an oscilloscope.
>> You don't need a faulty device, just an aborted I2C read/write op.
> If you can wire GPIOs to the bus, you can use the I2C fault injector:
>
> 	Documentation/i2c/gpio-fault-injection.rst
>
> There are already two "incomplete transfer" injectors.
>
Just giving this thread a poke. I have been looking at my options for=20
triggering an i2c recovery but haven't really had time to do much. I=20
think the best option given what I've got access to is a modified SFP=20
that grounds the SDA line but I need to find a system where I can attach=20
an oscilloscope (should be a few of these in the office when I can get=20
on-site).

I can confirm that when manually triggered the existing recovery and the=20
new erratum workaround produce what I'd expect to observe on an=20
oscilloscope.

I haven't explored Joakim's alternative recovery but I don't think that=20
should hold up these changes, any improvement to the existing recovery=20
can be done later as a follow-up.
