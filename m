Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7DC4CAC41
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 18:39:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K81ZC5hTdz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 04:38:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oEZuBX1C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oEZuBX1C; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K81YV4Jy2z3bfR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 04:38:22 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222Glqq6035806; 
 Wed, 2 Mar 2022 17:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Ecxe9LLMG9xx4krEwKq6taQLZQxhaBcP7bOcaDDpxio=;
 b=oEZuBX1CyjNuOwt5Y/65/3Ew02lHWmmTjITF0dDMTdTQkt8PUvKQKzwezbV5oPE58WjY
 98tnjMF3Gl5RI3k5o55faLQkCBq/bM2O2gRsKrMbC1C/goD9DUYLsafCNvPu3fDw1iPe
 UPe4VhB/EtQBuPtQof+6Bst+9wNh5G/UVyHS4k0bbL+8in/uCWzlIvh3blxKWW3PnkuK
 kEgJ4bxIhps3x0JSlANtbcV243KKbfCZlqs+oftHRIZF6xqb0BkPSwg4+kwRgMbf0NbC
 sgcK2u8GtIvKzMzn7YZbvnwnc49Tpmm6AB4P1Hozs47fazS1imy5ccWyJHiYXbYLuC5K HA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ejcdv91wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:38:14 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222HCnMB027063;
 Wed, 2 Mar 2022 17:38:12 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3efbu8wxrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:38:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222Hc9Ve46203144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 17:38:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAFB5A4055;
 Wed,  2 Mar 2022 17:38:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D0B0A4057;
 Wed,  2 Mar 2022 17:38:09 +0000 (GMT)
Received: from localhost (unknown [9.43.109.149])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Mar 2022 17:38:09 +0000 (GMT)
Date: Wed, 02 Mar 2022 23:08:07 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/security: Provide stubs for when
 PPC_BARRIER_NOSPEC isn't enabled
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20220110100745.711970-1-naveen.n.rao@linux.vnet.ibm.com>
 <a6751b0c-23ad-0f22-218a-cc808ad1e92c@csgroup.eu>
In-Reply-To: <a6751b0c-23ad-0f22-218a-cc808ad1e92c@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1646242090.aoirhcmddz.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xoOmECEZDMhpRMNwf5dwO5JMLdOCvWPO
X-Proofpoint-ORIG-GUID: xoOmECEZDMhpRMNwf5dwO5JMLdOCvWPO
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1011 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020076
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "lkp@intel.com" <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 10/01/2022 =C3=A0 11:07, Naveen N. Rao a =C3=A9crit=C2=A0:
>> kernel test robot reported the below build error with a randconfig:
>>    powerpc64-linux-ld: arch/powerpc/net/bpf_jit_comp64.o:(.toc+0x0):
>>    undefined reference to `powerpc_security_features'
>>=20
>> This can happen if CONFIG_PPC_BARRIER_NOSPEC is not enabled. Address
>> this by providing stub functions for security_ftr_enabled() and related
>> helpers when the config option is not enabled.
>=20
> Looks like this can happen only when E500 is not selected.
>=20
> But what kind of CPU do we have if it's not a E500 ?
>=20
> AFAICS in cputable.c, if not a PPC32 and not a BOOK3S_64 is must be a=20
> E500 otherwise there's just no CPU.

This was triggered for a 64-bit build and the bug report is:
http://lkml.kernel.org/r/202201082018.ACTZm4jh-lkp@intel.com

The randconfig used is:
https://download.01.org/0day-ci/archive/20220108/202201082018.ACTZm4jh-lkp@=
intel.com/config

It just selects the generic cpu and BOOK3E_64:

#
# Processor support
#
# CONFIG_PPC_BOOK3S_64 is not set
CONFIG_PPC_BOOK3E_64=3Dy
CONFIG_GENERIC_CPU=3Dy
CONFIG_PPC_BOOK3E=3Dy
CONFIG_PPC_FPU_REGS=3Dy
CONFIG_PPC_FPU=3Dy
CONFIG_BOOKE=3Dy
CONFIG_PPC_MMU_NOHASH=3Dy
CONFIG_PPC_BOOK3E_MMU=3Dy
CONFIG_PMU_SYSFS=3Dy
# CONFIG_SMP is not set
CONFIG_NR_CPUS=3D1
CONFIG_PPC_DOORBELL=3Dy
# end of Processor support

>=20
> Should we make Kconfig stricter instead to avoid the Robot selecting a=20
> crazy config ?

If that config is indeed not possible, it sure will be nice to prevent=20
that.


- Naveen

