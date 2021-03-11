Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 234F1337F83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 22:18:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxMHZ1RVCz3d4M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 08:18:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=2I4l3FFn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=2001:df5:b000:5::4;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=2I4l3FFn; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxMH52VG4z30Mx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 08:17:52 +1100 (AEDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2D53E806B5;
 Fri, 12 Mar 2021 10:17:44 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1615497464;
 bh=1DcFBkSZ1GEMK4IGgLLSPohVm5dNWmmK5gXKKqQb5SE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=2I4l3FFnAYyE+DGHLdQLbYSxuXARGckSj2PvrusoNEIBwVD97nFEDz8CEAHpO82NE
 HTgpeW0lzhI0O2CCS3hi0F8mev9yd0qeMfllU/2iMKfZMtZQWCyod5vjlsmn2cbXim
 n/X189mL9CAZY/VOGf/T7cny7II/DKVTtTVuwBVuBdf2D6NcBxzlVMGXqoVQ0LRoUS
 Piqvc6LmD8HcAbb0xvvJrt8FQiidwHfOm839d2enaDkds/C+Q527t8EJ8i4lNjhT34
 hA+mvaIxzApx4tOlg072hdCKv2z+LSZ5Tl5Yo7dACUQ+QJHszj97dwaOhEy4tF022l
 CmXEeHhh4OlNA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B604a88f80000>; Fri, 12 Mar 2021 10:17:44 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 10:17:43 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Fri, 12 Mar 2021 10:17:43 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Wolfram Sang <wsa@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEDagCAAfS7gIAALq8AgAEX54CAAKWsgIAACmIAgADZp4A=
Date: Thu, 11 Mar 2021 21:17:43 +0000
Message-ID: <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
References: <20210311081842.GA1070@ninjato>
In-Reply-To: <20210311081842.GA1070@ninjato>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <0B4D89C4CA0DE1478530916CB5DE73E1@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=N659UExz7-8A:10 a=dESyimp9J3IA:10 a=No7XfMmhj-zxftOn39MA:9
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


On 11/03/21 9:18 pm, Wolfram Sang wrote:
>> Bummer. What is really weird is that you see clock stretching under
>> CPU load. Normally clock stretching is triggered by the device, not
>> by the host.
> One example: Some hosts need an interrupt per byte to know if they
> should send ACK or NACK. If that interrupt is delayed, they stretch the
> clock.
>
It feels like something like that is happening. Looking at the T2080=20
Reference manual there is an interesting timing diagram (Figure 14-2 if=20
someone feels like looking it up). It shows SCL low between the ACK for=20
the address and the data byte. I think if we're delayed in sending the=20
next byte we could violate Ttimeout or Tlow:mext from the SMBUS spec.=
