Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B693F9EEB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 20:37:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx7jW2CbYz3bXP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 04:37:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=oZQ9vnqX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=oZQ9vnqX; 
 dkim-atps=neutral
X-Greylist: delayed 211 seconds by postgrey-1.36 at boromir;
 Sat, 28 Aug 2021 04:36:21 AEST
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx7hj1ryFz2yPb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 04:36:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1630089149;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=5mdElpZXJ+jk8vGDUEWDmgxZEV8zOnUmFS4yScwUY8U=;
 b=oZQ9vnqXQcVpVviJvg2mjMKEOsMFdPevRR0ejJFHxqsbRhdf7B3ouvOPAgKipw3wco
 i81sNAkOmkB0QS7wjPbWY+F9IGHS2HPv0a53RCpIkb9/TxUffluKn+w2Eaw4tBl1bgLH
 zlbeyMHYg6sw8LhM2CJY/FTsI6jt2p+Z4GZdXDivjBw87KxMeZ6VV8fdMpgWAnchsVUx
 WCwi6ZzcBhTUGS1WF3JvL9g6N4e0pc6k4adcEzlJgKa51iExtWBgdcT0FabCw8+3wiSl
 TVsedzGNtMKPamCkHEimqcRfZvb9JUSVcRmTZ4xfLDqe7e6fCo81UsFlulqw7pGH4wrd
 C6qA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aWdygroxw3H4w9GNHIcDAyoPO7x8hH3ftnkY6F8d"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple by smtp.strato.de (RZmta 47.31.0 AUTH)
 with ESMTPSA id j01e29x7RIWRTRS
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 27 Aug 2021 20:32:27 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [FSL P50x0] lscpu reports wrong values since the RC1 of kernel
 5.13
Date: Fri, 27 Aug 2021 20:32:26 +0200
Message-Id: <AD9F0A67-C930-49DC-9A45-F72FAD3FC6A4@xenosoft.de>
References: <20210826034310.GA296102@linux.vnet.ibm.com>
In-Reply-To: <20210826034310.GA296102@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
X-Mailer: iPhone Mail (18G69)
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>, qemu-devel@nongnu.org,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 26. Aug 2021, at 05:43, Srikar Dronamraju <srikar@linux.vnet.ibm.com> w=
rote:
>=20
> =EF=BB=BF* Christian Zigotzky <chzigotzky@xenosoft.de> [2021-08-16 14:29:2=
1]:
>=20
>=20
> Hi Christian,
>=20
>> I tested the RC6 of kernel 5.14 today and unfortunately the issue still
>> exists. We have figured out that only P5040 SoCs are affected. [1]
>> P5020 SoCs display the correct values.
>> Please check the CPU changes in the PowerPC updates 5.13-1 and 5.13-2.
>>=20
>=20
> Thanks for reporting the issue.
> Would it be possible to try
> https://lore.kernel.org/linuxppc-dev/20210821092419.167454-3-srikar@linux.=
vnet.ibm.com/t/#u

Hi Srikar,

This patch works! Thanks a lot!

Cheers,
Christian

>=20
> If the above patch is not helping, then can you please collect the output o=
f
>=20
> cat /sys/devices/system/cpu/cpu*/topology/core_siblings
>=20
> Were all the CPUs online at the time of boot?
> Did we do any CPU online/offline operations post boot?
>=20
> If we did CPU online/offline, can you capture the output just after the
> boot along with lscpu output..
>=20
> Since this is being seen on few SOCs, can you summarize the difference
> between P5040 and P5020.
>>=20
>> [1] https://forum.hyperion-entertainment.com/viewtopic.php?p=3D53775#p537=
75
>>=20
>>=20
>>> On 09 August 2021 um 02:37 pm, Christian Zigotzky wrote:
>>> Hi All,
>>>=20
>>> Lscpu reports wrong values [1] since the RC1 of kernel 5.13 on my FSL
>>> P5040 Cyrus+ board (A-EON AmigaOne X5000). [2]
>>> The differences are:
>>>=20
>>> Since the RC1 of kernel 5.13 (wrong values):
>>>=20
>>> Core(s) per socket: 1
>>> Socket(s): 3
>>>=20
>=20
> I know that the socket count was off by 1, but I cant explain how its off b=
y
> 2 here.
>=20
>>> Before (correct values):
>>>=20
>>> Core(s) per socket: 4
>>> Socket(s): 1
>>>=20
>=20
> --=20
> Thanks and Regards
> Srikar Dronamraju

