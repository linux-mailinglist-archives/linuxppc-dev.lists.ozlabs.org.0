Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E99533A7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 12:15:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7RlM2Ltkz3cBV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 20:15:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XzrdeWWa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XzrdeWWa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Rkc0cSlz2xD3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 20:14:31 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24P80eDK015713;
 Wed, 25 May 2022 10:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=phHYpa7z0BJmLquNvAIYPBXZ3dFQoL0/vc58WbYCBWg=;
 b=XzrdeWWalNi3I1kkJERLU8Uu2HHOHd9yTo9XVPU6JcXktd+g4VaM5C2pZeYSVsZ1zocO
 BD4fAQueJfj+urdVVXyvQssMpoqQkwatQJeZ8fX5qE2AbPw8VfrRpJF33OXsbAdcw6/y
 CQoqpH+ei+tnJX/jEFBBEjGCLGah4jq1aVIkP0I7fOyCkkx+BVd1AoIiIWrRbQE4vzRZ
 W217y2+dZmYTFtcz8tmkm8J8SKK0fsLX7+RynAuLZmJwKJhArxG71w9AkIKXAHvimAHE
 NXCqoLB9vSxS6vwaFbOgLLmFqtGWMKTVzY79TJBLrCfYB26XY7gqoJ7uU8E23BDRgwkS 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9gjsjeau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 10:14:15 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24PA6lE1020855;
 Wed, 25 May 2022 10:14:15 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9gjsjea1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 10:14:15 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PA8Nco018242;
 Wed, 25 May 2022 10:14:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3g93ux0yds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 10:14:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PAE9po17891596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 10:14:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8A5E4C05E;
 Wed, 25 May 2022 10:14:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8CC94C04E;
 Wed, 25 May 2022 10:14:05 +0000 (GMT)
Received: from [9.43.54.165] (unknown [9.43.54.165])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 10:14:05 +0000 (GMT)
Message-ID: <ac4e3ceb-7de8-2c3f-4689-1730d811bf3d@linux.vnet.ibm.com>
Date: Wed, 25 May 2022 15:44:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 0/7] objtool: Enable and implement --mcount option
 on powerpc
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <cover.1653398233.git.christophe.leroy@csgroup.eu>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <cover.1653398233.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5XU3ainFsN7w3iSnDAL1z2VB6UmHGCx1
X-Proofpoint-ORIG-GUID: sLQKkSmvHZNtew25n-df0W8frbzAKxOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_03,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=961 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250046
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, jpoimboe@redhat.com,
 linux-kernel@vger.kernel.org, "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 Paul Mackerras <paulus@samba.org>, Sathvika Vasireddy <sv@linux.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, mbenes@suse.cz,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 24/05/22 18:47, Christophe Leroy wrote:
> This draft series adds PPC32 support to Sathvika's series.
> Verified on pmac32 on QEMU.
>
> It should in principle also work for PPC64 BE but for the time being
> something goes wrong. In the beginning I had a segfaut hence the first
> patch. But I still get no mcount section in the files.
Since PPC64 BE uses older elfv1 ABI, it prepends a dot to symbols.
And so, the relocation records in case of PPC64BE point to "._mcount",
rather than just "_mcount". We should be looking for "._mcount" to be
able to generate mcount_loc section in the files.

Like:

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 70be5a72e838..7da5bf8c7236 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2185,7 +2185,7 @@ static int classify_symbols(struct objtool_file *file)
                         if (arch_is_retpoline(func))
                                 func->retpoline_thunk = true;

-                       if ((!strcmp(func->name, "__fentry__")) || 
(!strcmp(func->name, "_mcount")))
+                       if ((!strcmp(func->name, "__fentry__")) || 
(!strcmp(func->name, "_mcount")) || (!strcmp(func->name, "._mcount")))
                                 func->fentry = true;

                         if (is_profiling_func(func->name))


With this change, I could see __mcount_loc section being
generated in individual ppc64be object files.

- Sathvika


