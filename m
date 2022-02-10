Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 175274B131C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 17:41:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvjFb5lXTz3cP3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 03:41:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PgzP+nVN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PgzP+nVN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvjDn5Df2z3bVL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 03:41:12 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21AGKRoZ016261; 
 Thu, 10 Feb 2022 16:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=t9OZ3594SU4/a09jso3KMq87+6/4x49d6b6Ji+d3FQw=;
 b=PgzP+nVNyPerdWhZp1vX4RIOTtTWvE05NFfMmhN4zzpimWTlUTD2UC0g9wj96IvRnNVL
 fUgynISaaCuz604d2TzkmJnloSg6bvySu/ygH5vW0R2R574MSPj33mgYGWSoHEqt90bn
 GZ794milf/lPkJv+sGPGElZhC3anKRdukTMyOWfTyg/HeGqgicDBacycIAbfGMsUzBaR
 Q8NDZDo5Zn/BM7MGKGGhdbwYr9OpXx30qjWTa8vHH+tMo+zpGcexwZ3qpendYpq0Bv46
 tMKyC1iURYMleuVMLT93J2c9x2/bAGkqeNx063iGXGkm82gaa7i2idA31zZRWdCpCjFT rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e4kt2r8yx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 16:40:35 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21AGbrdN003714;
 Thu, 10 Feb 2022 16:40:35 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e4kt2r8yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 16:40:35 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21AGW9IU026890;
 Thu, 10 Feb 2022 16:40:33 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3e1gva02em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 16:40:33 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21AGeUkR44433890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 16:40:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3DA75204F;
 Thu, 10 Feb 2022 16:40:30 +0000 (GMT)
Received: from localhost (unknown [9.43.10.20])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2D19D5204E;
 Thu, 10 Feb 2022 16:40:30 +0000 (GMT)
Date: Thu, 10 Feb 2022 16:40:28 +0000
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 2/3] powerpc/ftrace: Override ftrace_location_lookup()
 for MPROFILE_KERNEL
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
 <fadc5f2a295d6cb9f590bbbdd71fc2f78bf3a085.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220207102454.41b1d6b5@gandalf.local.home>
 <1644426751.786cjrgqey.naveen@linux.ibm.com>
 <20220209161017.2bbdb01a@gandalf.local.home>
 <1644501274.apfdo9z1hy.naveen@linux.ibm.com>
 <20220210095944.1fe98b74@gandalf.local.home>
In-Reply-To: <20220210095944.1fe98b74@gandalf.local.home>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1644508338.5ucomwqtts.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -4GhEyHmVJj-BzziOUROikWFNbY4d4zU
X-Proofpoint-ORIG-GUID: rTP3-_oQ4xfo9-Y7Lr21yhm7twpZoGFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_07,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100087
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
 Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 bpf@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Rostedt wrote:
> On Thu, 10 Feb 2022 13:58:29 +0000
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
>> index f9feb197b2daaf..68f20cf34b0c47 100644
>> --- a/kernel/trace/ftrace.c
>> +++ b/kernel/trace/ftrace.c
>> @@ -1510,6 +1510,7 @@ ftrace_ops_test(struct ftrace_ops *ops, unsigned l=
ong ip, void *regs)
>>  	}
>> =20
>> =20
>> +#ifndef ftrace_cmp_recs
>>  static int ftrace_cmp_recs(const void *a, const void *b)
>>  {
>>  	const struct dyn_ftrace *key =3D a;
>> @@ -1521,6 +1522,7 @@ static int ftrace_cmp_recs(const void *a, const vo=
id *b)
>>  		return 1;
>>  	return 0;
>>  }
>> +#endif
>> =20
>=20
> I don't really care for this part, as it seems somewhat ugly. But this
> patch does appear to solve your issue, and I can't think of a prettier wa=
y
> to do this.

Yes, this approach looks like it will solve a few different issues for=20
us. We would also like to nop-out the instruction before the branch to=20
_mcount(), so this helps ensure that kprobes won't also overwrite that=20
instruction.

>=20
> So, I will reluctantly ack it.

Since we don't want to change struct dyn_ftrace, we will need to contain=20
changes within the architecture code, so I don't see a way to do this in=20
a generic manner.

The other option is to mark ftrace_cmp_recs() as a __weak function, but=20
I have a vague recollection of you suggesting #ifdef rather than a=20
__weak function in the past. I might be mis-remembering, so if you think=20
making this a __weak function is better, I can do that.

>=20
> If anything, please add a comment above saying that architectures may nee=
d
> to override this function, and when doing so, they will define their own
> ftrace_cmp_recs.

Sure.


- Naveen

