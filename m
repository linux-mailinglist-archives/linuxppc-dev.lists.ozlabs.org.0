Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2955B4CAAE1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 17:56:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K80cj0xm9z3c2c
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 03:56:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RczdICXo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RczdICXo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K80bx3x8cz3bpX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 03:55:25 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222G5huS014880; 
 Wed, 2 Mar 2022 16:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wZcFO3l5BBSXg5OAlIy4KWclhKZPcMQGArAc4jV5xnw=;
 b=RczdICXoK3N8VBy8B3f4wrFHp7IyfDVSsNZAeijco2VegeIqtEkoetu9mnRdkre0EyLX
 YcL8TrZu/uZcbGTMiPCJBNDMgfRSaYECmFQLKYo87Rtu+/yz+V24VDwyNHqlqNXBeBkk
 ldxiRRhc3JI1+g4AqSp5PEhgxAYwC/3rRdsAURZSzDjXXrtibGrAZCcMQZyBAAEguCU9
 aSck1pOw3iFSMAzU/uARH6VRiWPVMd4LUU0k96dTiXu8sOezyHukDuTM6lbs2zYFjDw1
 es7dZBa1SjM2C1u90dgL8DNW/rZ4jyCTFWmNF0wlTkzXSnZs/vSTkQf+acF0mvtVHv2O EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej9ssccx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 16:54:59 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222GLPXs004308;
 Wed, 2 Mar 2022 16:54:58 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej9ssccwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 16:54:58 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222GnFwH017249;
 Wed, 2 Mar 2022 16:54:56 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj1ahbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 16:54:56 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222Gsr0X51315046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 16:54:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDD4552052;
 Wed,  2 Mar 2022 16:54:53 +0000 (GMT)
Received: from localhost (unknown [9.43.109.149])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 581725204E;
 Wed,  2 Mar 2022 16:54:53 +0000 (GMT)
Date: Wed, 02 Mar 2022 22:24:51 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/7] ftrace: Expose flags used for ftrace_replace_code()
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Masami Hiramatsu
 <mhiramat@kernel.org>, Ingo Molnar <mingo@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>
References: <cover.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
 <51cba452b38ae55049bd15b0aeac6060cc1105f2.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
 <2c2b0f65-38bd-d7b8-b146-0daf96b03559@csgroup.eu>
In-Reply-To: <2c2b0f65-38bd-d7b8-b146-0daf96b03559@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1646239696.58yt3q00pj.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f0Qx7Cf6q9MuJLS8P-Ofl7Efiwp8H6wI
X-Proofpoint-ORIG-GUID: 28kmnPfeN3fYSxpSLPIW0JrwPj_BsVWz
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 suspectscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020073
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 27/06/2019 =C3=A0 13:23, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Since ftrace_replace_code() is a __weak function and can be overridden,
>> we need to expose the flags that can be set. So, move the flags enum to
>> the header file.
>>=20
>> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>=20
> This series does apply anymore.
>=20
> We have a link to it in https://github.com/linuxppc/issues/issues/386
>=20
> I'll flag it "change requested"

There are a couple of changes being worked on as a prerequisite for this=20
series. See:
http://lkml.kernel.org/r/cover.1645096227.git.naveen.n.rao@linux.vnet.ibm.c=
om


- Naveen

