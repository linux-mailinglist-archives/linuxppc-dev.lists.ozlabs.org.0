Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5925F1B7F1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 21:40:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4984JX03BGzDr8C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 05:40:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4984GQ65QRzDr73
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 05:38:22 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OJWoYn010975
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 15:38:19 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jrxp4tbw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 15:38:19 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Fri, 24 Apr 2020 20:37:50 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 24 Apr 2020 20:37:48 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03OJcDAj63373418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 19:38:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 604D75204E;
 Fri, 24 Apr 2020 19:38:13 +0000 (GMT)
Received: from localhost (unknown [9.85.74.26])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E1CFB52054;
 Fri, 24 Apr 2020 19:38:12 +0000 (GMT)
Date: Sat, 25 Apr 2020 01:08:07 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/kprobes: Check return value of
 patch_instruction()
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <3a132ac385340244b8d74179ac7bbbda7bf1f503.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <e2fae53a-f00b-b692-d638-f75c8f04feb8@c-s.fr>
 <20200424092202.71cfc549@gandalf.local.home>
 <1587751684.agx3nt8uvf.naveen@linux.ibm.com>
 <20200424143119.4d9b159c@gandalf.local.home>
In-Reply-To: <20200424143119.4d9b159c@gandalf.local.home>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20042419-0012-0000-0000-000003AA7135
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042419-0013-0000-0000-000021E7CA77
Message-Id: <1587756732.wdc4ystdeq.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_11:2020-04-24,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 mlxlogscore=943 mlxscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240148
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
> On Fri, 24 Apr 2020 23:56:25 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>> > #define PATCH_INSN(addr, instr) \
>> > ({
>> > 	int rc =3D patch_instruction((unsigned int *)(addr), instr);	     \
>> > 	if (rc)								     \
>> > 		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
>> > 				__func__, __LINE__,			     \
>> > 				(void *)(addr), (void *)(addr), rc);	     \
>> > 	rc;								     \
>> > })
>> >=20
>> >=20
>> > Then you can just do:
>> >=20
>> > 	ret =3D PATCH_INSN(...);
>> > 	if (ret)
>> > 		return ret;
>> >=20
>> > in the code. =20
>>=20
>> That's really nice. However, in this case, I guess I can simply use an=20
>> inline function? The primary reason I used the macro was for including a=
=20
>> 'return' statement in it.
>=20
> I thought the primary reason was the __func__, __LINE__ which wont work a=
s
> expected as an inline.

Ugh, you're right indeed. I clearly didn't think it through. :facepalm:

I'll use this variant.


Regards,
Naveen

