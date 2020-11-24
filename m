Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EFA2C2D09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 17:37:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgV7N5ycRzDqZW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 03:37:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qH9LQCNV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgV5K1vHczDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 03:36:00 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AOGV8Vj120196; Tue, 24 Nov 2020 11:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : mime-version : message-id : content-type :
 content-transfer-encoding; s=pp1;
 bh=Kr0JycnOOtnJYYU3dEq7lvelJoVh6pLWR1C/tyHl9JE=;
 b=qH9LQCNVfLmRNmzcRsgJhPGO/e/pRgy04h+MtjinJWTAwr+FTRMOfj+l8h1EpgTuZp5i
 dtTNMwXrtSabXOW18Qa9BNMP+GCMRcm5pGrBVhyCwDj3mmh5e5KTeOTWuoX6lO7rRMcK
 RAJ5CQrAujAYMLjYq3UqQd/MAI5DtrazYxcecqeykVEHxRUlq7Z6LcxYFsCoEoTZrghC
 RW5qOi8arK2oHh220ZL5aa7ec6XNbJqe7rlu56+mtoIQYyJIF5OhstIwEwgm74A+MWGw
 vv5+BD1MYr2OWy7Dw3Qfwv8OaXjcQ12JfitcJwQpqjqCZlKO7vdS1n9CcJMBWqiuG6hE 8Q== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3513uwcgmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 11:35:50 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AOGWYta002773;
 Tue, 24 Nov 2020 16:35:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 34xth8knqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 16:35:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AOGZkAM7406230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 16:35:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 856D54203F;
 Tue, 24 Nov 2020 16:35:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D56D42042;
 Tue, 24 Nov 2020 16:35:46 +0000 (GMT)
Received: from localhost (unknown [9.85.88.148])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Nov 2020 16:35:45 +0000 (GMT)
Date: Tue, 24 Nov 2020 22:05:41 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: eBPF on powerpc
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <d69650b0-4024-5759-3ccb-ede5c0394500@csgroup.eu>
In-Reply-To: <d69650b0-4024-5759-3ccb-ede5c0394500@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1606234192.xvkulhfr3y.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_04:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Christophe Leroy wrote:
> Hi Naveen,
>=20
> Few years ago, you implemented eBPF on PPC64.
>=20
> Is there any reason for implementing it for PPC64 only ?

I focused on ppc64 since eBPF is a 64-bit VM and it was more=20
straight-forward to target.

> Is there something that makes it impossible to have eBPF for PPC32 as=20
> well ?

No, I just wasn't sure if it would be performant enough to warrant it. =20
Since then however, there have been arm32 and riscv 32-bit JIT=20
implementations and atleast the arm32 JIT seems to be showing ~50%=20
better performance compared to the interpreter (*). So, it would be=20
worthwhile to add support for ppc32.

Note that there might be a few instructions which would be difficult to=20
support on 32-bit, but those can fallback to the interpreter, while=20
allowing other programs to be JIT'ed.


- Naveen

(*)=20
http://lkml.kernel.org/r/CAGXu5jLYunVCJGCfHPebKDaoQ71hdMGq4HhdDxTYpBQw_HXUY=
Q@mail.gmail.com
(*) http://lkml.kernel.org/r/b63fae4b-cb74-1928-b210-80914f3c8995@fb.com
(*) http://lkml.kernel.org/r/20200305050207.4159-1-luke.r.nels@gmail.com
