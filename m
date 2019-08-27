Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B69E6CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 13:31:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HmsN0n0zzDqss
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 21:31:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hmq41khzzDqc6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 21:29:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46Hmq31g4Lz8syQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 21:29:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46Hmq30dJ5z9sDB; Tue, 27 Aug 2019 21:29:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46Hmq24GmFz9sNC
 for <linuxppc-dev@ozlabs.org>; Tue, 27 Aug 2019 21:29:01 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7RBIVJ5098846
 for <linuxppc-dev@ozlabs.org>; Tue, 27 Aug 2019 07:28:58 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2un0s1f47x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 27 Aug 2019 07:28:58 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Tue, 27 Aug 2019 12:28:56 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 27 Aug 2019 12:28:53 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7RBSq0O53346356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 11:28:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11646AE051;
 Tue, 27 Aug 2019 11:28:52 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4917EAE04D;
 Tue, 27 Aug 2019 11:28:51 +0000 (GMT)
Received: from [9.199.196.173] (unknown [9.199.196.173])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Aug 2019 11:28:51 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [powerpc]WARN : arch/powerpc/platforms/powernv/smp.c:160
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <B641A885-76DF-4976-81AE-73D41AD71BAF@linux.vnet.ibm.com>
Date: Tue, 27 Aug 2019 16:58:50 +0530
Content-Transfer-Encoding: quoted-printable
References: <AB1A20B4-523B-491E-AB89-124AD2810C17@linux.vnet.ibm.com>
 <87imqk4nad.fsf@concordia.ellerman.id.au>
 <B641A885-76DF-4976-81AE-73D41AD71BAF@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19082711-0020-0000-0000-0000036474C9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082711-0021-0000-0000-000021B9C14C
Message-Id: <42157B13-A906-4F0F-90F8-CA88A5A829BE@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-27_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908270129
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
Cc: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, ego@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 26-Aug-2019, at 3:42 PM, Sachin Sant <sachinp@linux.vnet.ibm.com> =
wrote:
>=20
>> On 26-Aug-2019, at 8:59 AM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>>=20
>> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
>>> linux-next is currently broken on POWER8 non virtualized. Kernel
>>> fails to reach login prompt with following kernel warning
>>> repeatedly shown during boot.
>>=20
>> I don't see it on my test systems.
>>=20
>> The backtrace makes it look like you're doing CPU hot_un_plug during
>> boot, which seems a bit odd.
>>=20
> There is no explicit hot un plug operation being done. This happens
> during boot.
>=20
> For some reason cpu=E2=80=99s are being off lined. =20

So this machine was configured as a KVM host. Hence the SMT=3D1
configuration at boot. Removing QEMU/libvirt packages and unloading
kvm module gets me to SMT 8 config.

Disabling kvm also allows me to boot next kernels without the warning.
The warning is only seen with kvm configured.

Thanks
-Sachin

