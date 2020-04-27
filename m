Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F17C1BAAF5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 19:17:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499rzx4frZzDqcm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 03:17:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499rvy6TBtzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 03:13:34 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RH37St170294; Mon, 27 Apr 2020 13:13:15 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mguv29f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 13:13:14 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03RHAsCd023937;
 Mon, 27 Apr 2020 17:13:11 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 30mcu6v9g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 17:13:11 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03RHD9AB64028832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 17:13:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A01842045;
 Mon, 27 Apr 2020 17:13:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E5C742042;
 Mon, 27 Apr 2020 17:13:08 +0000 (GMT)
Received: from localhost (unknown [9.85.118.151])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 17:13:07 +0000 (GMT)
Date: Mon, 27 Apr 2020 22:43:01 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/kprobes: Check return value of
 patch_instruction()
To: Christophe Leroy <christophe.leroy@c-s.fr>, Steven Rostedt
 <rostedt@goodmis.org>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <3a132ac385340244b8d74179ac7bbbda7bf1f503.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <e2fae53a-f00b-b692-d638-f75c8f04feb8@c-s.fr>
 <20200424092202.71cfc549@gandalf.local.home>
 <1587751684.agx3nt8uvf.naveen@linux.ibm.com>
 <e743c9db-847a-2612-bf36-c23a57a056c5@c-s.fr>
 <20200425100645.7aa85ee0@oasis.local.home>
In-Reply-To: <20200425100645.7aa85ee0@oasis.local.home>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1588007533.v9i79pb5nv.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_12:2020-04-27,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270139
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

Steven Rostedt wrote:
> On Sat, 25 Apr 2020 10:11:56 +0000
> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>=20
>> Sure it's be more explicit, but then more lines also. 3 lines for only=20
>> one really usefull.
>>=20
>> With goto, I would look like:
>>=20
>> diff --git a/arch/powerpc/kernel/optprobes.c=20
>> b/arch/powerpc/kernel/optprobes.c
>> index 046485bb0a52..938208f824da 100644
>> --- a/arch/powerpc/kernel/optprobes.c
>> +++ b/arch/powerpc/kernel/optprobes.c
>> @@ -139,14 +139,14 @@ void arch_remove_optimized_kprobe(struct=20
>> optimized_kprobe *op)
>>   	}
>>   }
>>=20
>> -#define PATCH_INSN(addr, instr)						     \
>> +#define PATCH_INSN(addr, instr, label)						     \
>=20
> With the explicit label as a parameter, makes it more evident that it
> will do something (like jump) with that label.

I think I will also rename the macro to PATCH_INSN_OR_GOTO() to make it=20
super evident :)

>=20
> I like this solution the best!

Thanks for the feedback.


- Naveen

