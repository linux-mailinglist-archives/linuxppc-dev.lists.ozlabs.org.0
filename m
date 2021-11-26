Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BDD45F351
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 19:01:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J12c568MJz3cRg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 05:01:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KT6a4dZC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KT6a4dZC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J12bQ1G8Wz307l
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 05:00:33 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AQHqWdR009504; 
 Fri, 26 Nov 2021 18:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=+/hqb/un2BjaAFHg8euyO7jucLh7BK71I9UgLS4ZUUY=;
 b=KT6a4dZC16WMYE4SNeALLpv8yOyyTzhKedYhaFdS4Ygzvs7IeOHgpBjgQb53PHaye8F9
 lltuvKAN9FmCmN3XkfsiqJw+Ps8REFYY3mLZHDjOp5JSd4BJdY5a1l9dZ40IC0nEK8oS
 1NCj4aoURIt0HpXyecUBNCvEy2jNB5c9QupfL2fPhYjunpVg/FVbTeHOZvZXLW0o72IT
 q2amK+F1zpDHG+fA3OHWMrDD44NWCbZnZLEA7rKrdCagfI8aitYTmz3ssWUtW/rQ/fZY
 0y22fdQWEAmjJ5yYxnIZDyAOyz8y2Kxe+yFVTIS+B65AaDRa8WQQmo2v8QE1j7gXFvgt 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ck4c7g2q5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 18:00:11 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AQHv24A024247;
 Fri, 26 Nov 2021 18:00:11 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ck4c7g2p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 18:00:10 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AQHvG29011045;
 Fri, 26 Nov 2021 18:00:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3cernawp6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 18:00:09 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AQHqmOL62980594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 17:52:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3649A4069;
 Fri, 26 Nov 2021 18:00:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CA8DA405C;
 Fri, 26 Nov 2021 18:00:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.184.185])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Nov 2021 18:00:05 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] powerpc/code-patching: Relax verification of patchability
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <68d7d57675e0963fe5e2c4b84b0cb2390c78638c.1637912333.git.christophe.leroy@csgroup.eu>
Date: Fri, 26 Nov 2021 23:30:02 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <2EB75A15-726B-44D4-8007-0FE2FF7CAE82@linux.vnet.ibm.com>
References: <68d7d57675e0963fe5e2c4b84b0cb2390c78638c.1637912333.git.christophe.leroy@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8TuRGswQ2D5ia17jkCNzZdQFpFLPflay
X-Proofpoint-ORIG-GUID: cLH4ecp3qMq9onUibW46OCXZyv0e0wYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_05,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111260099
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>  Running code patching self-tests ...
>  patch_instruction() called on invalid text address 0xe1011e58 from =
test_code_patching+0x34/0xd6c
>=20
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Fixes: 8b8a8f0ab3f5 ("powerpc/code-patching: Improve verification of =
patchability")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> arch/powerpc/lib/code-patching.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>=20

This fixes the problem for me.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
-Sachin

