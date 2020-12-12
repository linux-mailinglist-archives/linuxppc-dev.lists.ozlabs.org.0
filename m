Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870D2D85BB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Dec 2020 11:10:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CtNh66Q8qzDqtv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Dec 2020 21:10:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bAbZb1lm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CtNf920VqzDqfs
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Dec 2020 21:08:47 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BCA22F1062998
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Dec 2020 05:08:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=oOZYHSEK94WlMqxLHnE4UbBVeQVPf8V2kFa+iR4CVT0=;
 b=bAbZb1lmiaddoaaCouzvZm164SRff7mdB+BXRwcOlWeabtzR2WyHbzeSYMN4+kDZA9A9
 OOZZk4Xdx6nm3+XwfHWwqCzz1PAKybm+h9e7UXTkNfhVNCw8y82lV2z+QGVqoXJS3jl8
 pG8wTYjx0ggg3+fZjRfa+NT2sae/GJQbIMOXaUK+U4RJKAyOSADVpVJLkr4n+WgdSsJf
 KQ8OA0E454tf51D9kQzkZhucreTSFN82ywAvhwCcepFT3c0USZOEOcTTOvYmH9XZu0+p
 f24aqIbF7O2SOOX48UPnaP3H/aVJap26IaGnYiz6r9idWxeqDWhOgr4euizg4CuPDtns OA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35cs4ejm11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Dec 2020 05:08:43 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BCA7h9p013645
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Dec 2020 10:08:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 35cng88c24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Dec 2020 10:08:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0BCA7NoL45941024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Dec 2020 10:07:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6B174C052;
 Sat, 12 Dec 2020 10:07:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 412F94C046;
 Sat, 12 Dec 2020 10:07:23 +0000 (GMT)
Received: from [9.85.69.244] (unknown [9.85.69.244])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 12 Dec 2020 10:07:23 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: [powerpc/merge] System crash during cpu offline/online operation 
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <F4809152-C7F5-4ED8-B071-85A9115BD29D@linux.vnet.ibm.com>
Date: Sat, 12 Dec 2020 15:37:22 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6F549097-B2C7-48AC-A0F2-C24E02FF0A82@linux.vnet.ibm.com>
References: <F4809152-C7F5-4ED8-B071-85A9115BD29D@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.104.17)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-12_02:2020-12-11,
 2020-12-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012120073
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 11-Dec-2020, at 3:47 PM, Sachin Sant <sachinp@linux.vnet.ibm.com> =
wrote:
>=20
> I am observing system crash during a cpu offline/online operation
> with latest merge branch code running in a PowerVM LPAR (P8 onwards)
>=20
> # uname -r
> 5.10.0-rc7-01792-g244569c777ca
> # ppc64_cpu --smt=3D1
> [  244.205194] cpu 1 (hwid 1) Ready to die=E2=80=A6
> =E2=80=A6=E2=80=A6=E2=80=A6
> =E2=80=A6=E2=80=A6...
> [  247.015113] cpu 30 (hwid 30) Ready to die...
> [  247.104973] cpu 31 (hwid 31) Ready to die=E2=80=A6
> # ppc64_cpu --smt=3D8
>=20
> At this point the LPAR reboots instantly without any trace message.

Git bisect leads me to the following commit:

3b47b7549ead0719e94022c6742199333c7c8d9f is the first bad commit
commit 3b47b7549ead0719e94022c6742199333c7c8d9f
Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Date:   Fri Nov 27 10:14:07 2020 +0530

    powerpc/book3s64/kuap: Move KUAP related function outside radix

Here is the bisect log:

# git bisect log
git bisect start
# bad: [244569c777ca638b08c75db88fe035bdec52ef80] Automatic merge of =
'next' into merge (2020-12-10 00:34)
git bisect bad 244569c777ca638b08c75db88fe035bdec52ef80
# good: [9acd775e4579bde0a6d937d72f9669e418aa87ad] Automatic merge of =
'master' into merge (2020-12-05 22:54)
git bisect good 9acd775e4579bde0a6d937d72f9669e418aa87ad
# good: [ab91292cb3e9f43d9c6839d7572d17b35bc21710] Merge tag =
'char-misc-5.10-rc7' of =
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect good ab91292cb3e9f43d9c6839d7572d17b35bc21710
# bad: [19b311ca51e108b6d8d679496af8635fdc1984a8] ocxl: Initiate a TLB =
invalidate command
git bisect bad 19b311ca51e108b6d8d679496af8635fdc1984a8
# bad: [d94b827e89dc3f92cd871d10f4992a6bd3c861e5] powerpc/book3s64/kuap: =
Use Key 3 for kernel mapping with hash translation
git bisect bad d94b827e89dc3f92cd871d10f4992a6bd3c861e5
# good: [1d15ffdfc94127d75e04a88344ee1ce8c79f05fd] KVM: PPC: Book3S HV: =
Ratelimit machine check messages coming from guests
git bisect good 1d15ffdfc94127d75e04a88344ee1ce8c79f05fd
# good: [9f378b9f007cc94beadea40df83cc62a76975c6f] KVM: PPC: BOOK3S: PR: =
Ignore UAMOR SPR
git bisect good 9f378b9f007cc94beadea40df83cc62a76975c6f
# bad: [3b47b7549ead0719e94022c6742199333c7c8d9f] powerpc/book3s64/kuap: =
Move KUAP related function outside radix
git bisect bad 3b47b7549ead0719e94022c6742199333c7c8d9f
# good: [39df17bc20059c84ddc6f91831fce2e2cc79a6f3] =
powerpc/book3s64/kuap/kuep: Move uamor setup to pkey init
git bisect good 39df17bc20059c84ddc6f91831fce2e2cc79a6f3
# first bad commit: [3b47b7549ead0719e94022c6742199333c7c8d9f] =
powerpc/book3s64/kuap: Move KUAP related function outside radix

Thanks
-Sachin=
