Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F945FC6B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 15:48:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnYsJ4Xtgz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 00:48:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HeBwuEU/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HeBwuEU/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnYrJ5HNLz2xgb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 00:47:59 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CCm6uK007754;
	Wed, 12 Oct 2022 13:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=gcwlcDkSbiXzSkIE1la7GPJMtot1ddfaQvrcqhJVYWM=;
 b=HeBwuEU/tLqK6dnuN6OkENy5xp7/bc1h2imhrJSeKRZqpeplngldpcmqHb1u5CofSyNo
 9ligIi91Pf/DPYzR/MzH4m9IRhbSqcEF10IO11hxbFpTZlhlhx4MEg+XBNNNwS2Cs5uM
 QsENy1eVCD8+x7q2kYO7mthu43zx6vmu7HBJ8d+6ETYcwQCJgo8N51CGfYuhBF6BrWWi
 wIi3AeXmHN9DWzSbVCtQeSVJWgkb+opoY7Dc+kcAIqfzXHWzb4KWE+m9tclbwrHAX+Vv
 XXzqEzgB1ptTPEwR3Lwh3qqprhZjEByd+qZ3Lf3eFEQyPakPypS0ohbSPq6vtqZe0wAI CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5v5p5f7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 13:47:36 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29CAvE8r011571;
	Wed, 12 Oct 2022 13:47:36 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5v5p5f5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 13:47:36 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29CDZdbs032265;
	Wed, 12 Oct 2022 13:47:33 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03fra.de.ibm.com with ESMTP id 3k30u9ck3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 13:47:33 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29CDlVaG60752326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Oct 2022 13:47:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA0E1A4054;
	Wed, 12 Oct 2022 13:47:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A32BA405C;
	Wed, 12 Oct 2022 13:47:30 +0000 (GMT)
Received: from localhost (unknown [9.43.87.244])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 12 Oct 2022 13:47:30 +0000 (GMT)
Date: Wed, 12 Oct 2022 19:17:29 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 11/16] objtool: Add --mnop as an option to --mcount
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20221002104240.1316480-1-sv@linux.ibm.com>
	<20221002104240.1316480-12-sv@linux.ibm.com>
	<1665401725.d3dolquorh.naveen@linux.ibm.com>
	<20221011203332.zzmv6awd5eiydxgw@treble>
In-Reply-To: <20221011203332.zzmv6awd5eiydxgw@treble>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1665582234.mk6z7nug7r.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iymZSnfnhIoj72GV350C7WEnf4S2fkTS
X-Proofpoint-GUID: TIjhMEWQitVB-KEzow5hVt3tzFTH_mwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_06,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210120089
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
Cc: aik@ozlabs.ru, chenzhongjin@huawei.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, rostedt@goodmis.org, jpoimboe@redhat.com, Sathvika Vasireddy <sv@linux.ibm.com>, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Josh Poimboeuf wrote:
> On Mon, Oct 10, 2022 at 05:07:46PM +0530, Naveen N. Rao wrote:
>> > +++ b/scripts/Makefile.lib
>> > @@ -234,6 +234,7 @@ objtool_args =3D								\
>> >  	$(if $(CONFIG_HAVE_NOINSTR_HACK), --hacks=3Dnoinstr)		\
>> >  	$(if $(CONFIG_X86_KERNEL_IBT), --ibt)				\
>> >  	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)		\
>> > +	$(if $(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT), --mnop)                 \
>>=20
>> This still won't help: for instance, if CONFIG_FTRACE itself is disabled=
. I
>> think we should make this depend on CONFIG_FTRACE_MCOUNT_USE_OBJTOOL. Th=
e
>> below change works for me:
>>=20
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 54d2d6451bdacc..fd3f55a1fdb7bb 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -245,8 +245,8 @@ objtool_args =3D                                    =
                          \
>>        $(if $(CONFIG_HAVE_JUMP_LABEL_HACK), --hacks=3Djump_label)       =
 \
>>        $(if $(CONFIG_HAVE_NOINSTR_HACK), --hacks=3Dnoinstr)             =
 \
>>        $(if $(CONFIG_X86_KERNEL_IBT), --ibt)                           \
>> -       $(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)             =
\
>> -       $(if $(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT), --mnop)                 =
\
>> +        $(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL),                      =
 \
>> +             $(if $(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT), --mcount --mnop, -=
-mcount)) \
>>        $(if $(CONFIG_UNWINDER_ORC), --orc)                             \
>>        $(if $(CONFIG_RETPOLINE), --retpoline)                          \
>>        $(if $(CONFIG_RETHUNK), --rethunk)                              \
>=20
> This has a new conflict, may need something like:
>=20
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -256,6 +256,9 @@ objtool-args-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+=3D --h=
acks=3Djump_label
>  objtool-args-$(CONFIG_HAVE_NOINSTR_HACK)		+=3D --hacks=3Dnoinstr
>  objtool-args-$(CONFIG_X86_KERNEL_IBT)			+=3D --ibt
>  objtool-args-$(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL)	+=3D --mcount
> +ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
> +objtool-args-$(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT)		+=3D --mnop
> +endif
>  objtool-args-$(CONFIG_UNWINDER_ORC)			+=3D --orc
>  objtool-args-$(CONFIG_RETPOLINE)			+=3D --retpoline
>  objtool-args-$(CONFIG_RETHUNK)				+=3D --rethunk

Thanks. That's definitely simpler.

I haven't checked if there are any other conflicts with=20
tip/objtool/core though. Not sure how to proceed here.


- Naveen
