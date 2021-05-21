Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D438238CE7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 22:01:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmyD46GMbz3091
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 06:01:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hLfRAjb/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msc@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hLfRAjb/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmyCZ63jdz306s
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 May 2021 06:00:58 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LJXTrJ029104; Fri, 21 May 2021 16:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=K59RhIwEEWnQcIteRBJOyIFsGYeKYqR866/ziffc5F0=;
 b=hLfRAjb/dGztkS5bFECtTgqzB5LJMQzmDROgh/AKBoLjId6zCouUQyAa8/sAvYo0yZdt
 eyH50PM/LI2/DSgpCOI2X+yq6rX7qwt+d3sHAmApHGXTpWu19BzHMfI5gH7TsEvq5iJs
 oER1iVoMjUnEaqcC/1gJuzCpPNoGo/WyfMs8Dgm3iQA4SxG0pxxbo24KYzmh8FsdVf8l
 DVGRHs8sZ3MTnqGFd7Lt5Pz7PzpdpVoBZisgUrLbmaFI+eJn8xMo2g1BPUJiQaJFQEMx
 Jw4sqvCQqomr3itfcYmH6Lm5y6BiuQuSZp34j77wrZ73YfYwjw/bWvN09tRSBPhq/O/u AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pjfj9bf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 16:00:41 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14LJlXPY075988;
 Fri, 21 May 2021 16:00:41 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pjfj9bej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 16:00:41 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LJpkwT010886;
 Fri, 21 May 2021 20:00:40 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 38j5xaesej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 20:00:40 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14LK0dTd37290306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 20:00:39 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A430112062;
 Fri, 21 May 2021 20:00:39 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EEEE112063;
 Fri, 21 May 2021 20:00:37 +0000 (GMT)
Received: from TP480.linux.ibm.com (unknown [9.160.176.31])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 20:00:37 +0000 (GMT)
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <1621385544.nttlk5qugb.astroid@bobo.none>
 <1621400263.gf0mbqhkrf.astroid@bobo.none> <87a6oo4312.fsf@linux.ibm.com>
 <87k0nr6ezw.fsf@oldenburg.str.redhat.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Matheus Castanho <msc@linux.ibm.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: Linux powerpc new system call instruction and ABI
In-reply-to: <87k0nr6ezw.fsf@oldenburg.str.redhat.com>
Date: Fri, 21 May 2021 17:00:36 -0300
Message-ID: <87eedz3li3.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k9YXHXmkCEfCHht_gu-gXPH1T7WlSSvg
X-Proofpoint-GUID: qW-bxH6-TgC73IAxn1qdzi1gG8N17u_Y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_09:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxscore=0 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210103
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
Cc: Matheus Castanho via Libc-alpha <libc-alpha@sourceware.org>,
 linux-api@vger.kernel.org, musl@lists.openwall.com,
 Nicholas Piggin <npiggin@gmail.com>, "Dmitry V. Levin" <ldv@altlinux.org>,
 libc-dev@lists.llvm.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Florian Weimer <fweimer@redhat.com> writes:

> * Matheus Castanho via Libc-alpha:
>
>> From: Nicholas Piggin <npiggin@gmail.com>
>> Subject: [PATCH 1/1] powerpc: Fix handling of scv return error codes
>>
>> When using scv on templated ASM syscalls, current code interprets any
>> negative return value as error, but the only valid error codes are in
>> the range -4095..-1 according to the ABI.
>>
>> Reviewed-by: Matheus Castanho <msc@linux.ibm.com>
>
> Please reference bug 27892 in the commit message.  I'd also appreciate a
> backport to the 2.33 release branch (where you need to add NEWS manually
> to add the bug reference).

No problem. [BZ #27892] appended to the commit title. I'll make sure to
backport to 2.33 as well.

Thanks

--
Matheus Castanho
