Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB911C66A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 08:34:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YQXd2RG7zDqwD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 18:34:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (access neither permitted nor denied)
 smtp.mailfrom=zonnet.nl (client-ip=82.215.18.104;
 helo=filter01asd2-vif3.se.isp-net.nl; envelope-from=jjhdiederen@zonnet.nl;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zonnet.nl
Received: from filter01asd2-vif3.se.isp-net.nl
 (filter01asd2-vif3.se.isp-net.nl [82.215.18.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YQVd3FMCzDqvL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 18:32:22 +1100 (AEDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 12 Dec 2019 08:32:07 +0100
From: jjhdiederen <jjhdiederen@zonnet.nl>
To: Romain Dolbeau <romain@dolbeau.org>
Subject: Re: Call for report - G5/PPC970 status
In-Reply-To: <CADuzgbq-P8mgf9zLaxhdqUfQcqfRpSzjgRoofF84rp+-S064xg@mail.gmail.com>
References: <CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
 <e87e2397-a8d4-c928-d3d4-7ae700603770@physik.fu-berlin.de>
 <CA+7wUsxBkmG-jW_UVBUuMriZbDkJko3kg0hzmMrVMoJLu2+rPw@mail.gmail.com>
 <CADuzgbqoX3DQ6OVqdR6dw1oqnNn-Q0zLPshDi23DwDtYukDYdg@mail.gmail.com>
 <CADuzgboWQtVqp7-Ru4uQQaPerkhLnaS9=WiwX2dD4-5VypT2MA@mail.gmail.com>
 <CADuzgboYv69FQxQRvJ_Bd563OPO0e=USd+cTChfDK60D5x75hw@mail.gmail.com>
 <b2256437-efe1-909d-1488-174b6522f9e0@physik.fu-berlin.de>
 <87eexbk3gw.fsf@linux.ibm.com>
 <CADuzgbq-P8mgf9zLaxhdqUfQcqfRpSzjgRoofF84rp+-S064xg@mail.gmail.com>
Message-ID: <716dc1da300bb8e9132b4ff44c02110f@zonnet.nl>
X-Sender: jjhdiederen@zonnet.nl
User-Agent: Roundcube Webmail/1.3.9
X-Originating-IP: 217.149.195.13
X-SpamExperts-Domain: zonnet.nl
X-SpamExperts-Username: 217.149.195.13
Authentication-Results: se.isp-net.nl;
 auth=pass smtp.auth=217.149.195.13@zonnet.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.15)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fi3oD8HEy9ysrsB6Ile+oipSDasLI4SayDByyq9LIhVUZbR67CQ7/vm
 /hHDJU4RXkTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kle49VoyZYmPTUwdMhJ27Ev93
 j4SW7QLcfCmgmx/QmYuh9B/SxgyS33r6YFLD63EcEPMUNiZMEmYRmrdWon7KUDUWUjp7HoRoxNFE
 ClPhjcBMydPxIxpiLhC4+Y5ZUEbBLOLBsWUHLTO3E3S6M7zMblbibouwNUYxWVj8CNZxeOmd6IQm
 YMsaOCJH20uG7hLQfyMfQAVVS9C5p2FpBpJtRV1B6x4efEU3002fR7x3mODW47lOfJOnXWRFHpqf
 ts+9xHe8ilnssnDpSKZ4WlyMj1MGlr329Vz9yVVI7dLDI+hW3QbOjhteiw6msNgA4CApapzvIMT6
 jX0XtsPHCWirLzBZ22Ev3c2k8XtVCf9puj6cwbYyJ+ckOEO/071LZhQw/q2Qs/PBgnBT7yBLMCAh
 KdlhjJyLReSLqwtkb9k0UdI2HiAS43bCsSuBhsG6lWdQskEhCIrnbrTLMhcG7767eRCzAvA98jmn
 +n6ql82xhSIAjXp9P9MCIw62tAItAUrO/20Q80IsV2w9XepOZA3u8fg5gAhPMnZHMtWSSV+EVcW4
 o5GbQtWjGIG/dQ5xX4q25YE5enyccp7RH4WQio3uGaY9pmvAsj3vmOo0GhvdSkd7IPoWAXBKAFxS
 HS9zanPTNR/4YexlEimPxJEhnganFnoSKlHMxVnkurBPHtW+f1LDebN9X2UaVcwbob/99DsgPh5b
 +reVBakGx3B6TOTNhlYR9+Rin9F0O+0ePGl6IGYqcRVh4EGeFt+FuCVczYmAB5hQ6nsDvccjqgmD
 vD9Wh95yBHI5zSMIR7v2v34cLxS9Mvil4wUzcHf4c1Fk/W1wzviPJ4VRwQ47yNwjElPTzlug5y6E
 6ErZ9EnFgzC1NGU0NNvNfQ7HmekZAHkDEtV8uHVtSkIjk3GLu2RN+YVUlRHk2wR5fLQKjxBf5d7K
 upWPuP6Tuj0pdeMY+nPMjKsPg+vunCRgBkZhjYwBuL8K16wH80Kj88zQwZDA2cRx1Ks+WvlPuRkK
 WGgkhw/GSaFTjzjUQ5prqLyRgLMxEGarGJRKH6jdEL2rk+lGIONVjNvEq/KrYlWz5uhiFKgQ7Tb1
 6j3a1v9dg8utFXxc3VLreAj32jZqUl8Vt/4OvxxkUG40lg3YqmmPuel2GVjvvspVd8WrMAxmbkKP
 nKcXfOaF6Q==
X-Report-Abuse-To: spam@master01nm.se.isp-net.nl
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerMac 7,3 G5 2.5 DP PCI-X Mid-2004 is affected with this bug. The 
machine freezes at boot due to the new ppc64 kernel.


Regards,
Jeroen Diederen

Romain Dolbeau schreef op 2019-12-11 08:19:
> Le mer. 11 déc. 2019 à 03:20, Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> a écrit :
>> The PowerMac system we have internally was not able to recreate this.
> 
> To narrow down the issue - is that a PCI/PCI-X (7,3 [1]) or PCIe G5 
> (11,2 [1]) ?
> Single, dual or quad ?
> 
> Same question to anyone else with a G5 / PPC970 - what is it and does
> it boot recent PPC64 Linux kernel ?
> 
> Christian from the original report has a quad, like me (so 
> powermac11,2).
> 
> There was also a report of a powermac7.3 working in the original 
> discussion,
> single or dual unspecified.
> 
> So this might be a Quad thing, or a more general 11,2 thing...
> 
>> At this point, I am not sure what would cause the Machine check with
>> that patch series because we have not changed the VA bits in that 
>> patch.
> 
> Any test I could run that would help you tracking the bug ?
> 
> Cordially,
> 
> Romain
> 
> [1] 
> <https://en.wikipedia.org/wiki/Power_Mac_G5#Product_revision_history>
> 
> 
> --
> Romain Dolbeau
