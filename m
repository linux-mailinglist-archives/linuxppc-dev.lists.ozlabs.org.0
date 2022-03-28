Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9714E9D57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 19:21:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRzxg0ngXz3c4c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 04:21:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TUXEo0ar;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TUXEo0ar; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRzww30JRz2yfm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 04:20:31 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22SH9AK2020194; 
 Mon, 28 Mar 2022 17:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=ecg/6pTzoQtrA/oT8TLJCc3v287LP7hz/3rydMPZ1g4=;
 b=TUXEo0arWZXDaGNAk1cp1IDaTGb9BlJX0799GwH0gEgHf23gtENSVOmPU91MJlboJFMr
 KoSBppYX5UeSz29mdv81ijhC9Ak9BHUV9XNKSqjquFYiJVa9H1R+u/o8zclJtCXTqspw
 jzXqUsjvAQIMZ6SPklJbjwBmZlTbRQLikJqUz6+4bSdGQjxGh8nMQp6WwbQDzE4jw1Lq
 ls20EULg+7JU176CyE188pTatFGqvPLe4QDkQFwzTwz1G9R6SdCvTbn0VBFjWlsdgqam
 v7wH4KY6qF67hlmT0AQRLJBc7ul9WcwajzuCWJJwmSfTN0/99XajC6RYvbGijuU0z/2e bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3gum8jqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 17:20:20 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22SHBAa4026618;
 Mon, 28 Mar 2022 17:20:20 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3gum8jpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 17:20:19 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22SH7RxF032587;
 Mon, 28 Mar 2022 17:20:18 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3f1tf8krsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 17:20:17 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22SHKFrO55706098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Mar 2022 17:20:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78666AE053;
 Mon, 28 Mar 2022 17:20:15 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A199AE04D;
 Mon, 28 Mar 2022 17:20:15 +0000 (GMT)
Received: from localhost (unknown [9.43.40.48])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 28 Mar 2022 17:20:14 +0000 (GMT)
Date: Mon, 28 Mar 2022 22:50:13 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc: Reject probes on instructions that can't be
 single stepped
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Murilo Opsfelder =?iso-8859-1?q?Ara=FAjo?= <mopsfelder@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <cover.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
 <e81779aa105d67799742c3e3f59075dce9f05cfb.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
 <9b5ec756-a074-390a-0955-6d973eacac28@gmail.com>
 <8735j7gdpi.fsf@mpe.ellerman.id.au>
In-Reply-To: <8735j7gdpi.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1648487815.ub2owcvzpb.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gHb8RI0wYUDdl1_RxNvcZmB_a_tZCQXz
X-Proofpoint-ORIG-GUID: skjhBVhXieBKnrRH2-5QZzhZnMMcW-mF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_07,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=781 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203280093
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

Michael Ellerman wrote:
> Murilo Opsfelder Ara=C3=BAjo <mopsfelder@gmail.com> writes:
>> On 3/23/22 08:51, Naveen N. Rao wrote:
>>> +static inline bool can_single_step(u32 inst)
>>> +{
>>> +	switch (inst >> 26) {
>>=20
>> Can't ppc_inst_primary_opcode() be used instead?

I didn't want to add a dependency on inst.h. But I guess I can very well=20
move this out of the header into some .c file. I will see if I can make=20
that work.

>>> +	case 31:
>>> +		switch ((inst >> 1) & 0x3ff) {
>>> +		case 4:		/* tw */
>>> +			return false;
>>> +		case 68:	/* td */
>>> +			return false;
>>> +		case 146:	/* mtmsr */
>>> +			return false;
>>> +		case 178:	/* mtmsrd */
>>> +			return false;
>>> +		}
>>> +		break;
>>> +	}
>>> +	return true;
>>> +}
>>> +
>>
>> Can't OP_* definitions from ppc-opcode.h be used for all of these switch=
-case statements?
>=20
> Yes please. And add any that are missing.

We only have OP_31 from the above list now. I'll add the rest.


Thanks,
Naveen

