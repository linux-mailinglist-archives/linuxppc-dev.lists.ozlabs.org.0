Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A5F4A9BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 20:25:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SxMY3H0pzDqg7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 04:25:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SxKP58DPzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 04:23:21 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IIMYoI058959
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 14:23:19 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t74dnj7bj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 14:23:18 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 18 Jun 2019 19:23:17 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 19:23:14 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5IINDrb52691166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 18:23:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5554111C05B;
 Tue, 18 Jun 2019 18:23:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E438611C050;
 Tue, 18 Jun 2019 18:23:12 +0000 (GMT)
Received: from localhost (unknown [9.85.74.6])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jun 2019 18:23:12 +0000 (GMT)
Date: Tue, 18 Jun 2019 23:53:11 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 5/7] powerpc/ftrace: Update ftrace_location() for powerpc
 -mprofile-kernel
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <186656540d3e6225abd98374e791a13d10d86fab.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <20190618114509.5b1acbe5@gandalf.local.home>
 <1560881411.p0i6a1dkwk.naveen@linux.ibm.com>
In-Reply-To: <1560881411.p0i6a1dkwk.naveen@linux.ibm.com>
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19061818-0016-0000-0000-0000028A2FFF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061818-0017-0000-0000-000032E7827C
Message-Id: <1560881840.vz9llflvnf.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906180146
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N. Rao wrote:
> Steven Rostedt wrote:
>> On Tue, 18 Jun 2019 20:17:04 +0530
>> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>>=20
>>> @@ -1551,7 +1551,7 @@ unsigned long ftrace_location_range(unsigned long=
 start, unsigned long end)
>>>  	key.flags =3D end;	/* overload flags, as it is unsigned long */
>>> =20
>>>  	for (pg =3D ftrace_pages_start; pg; pg =3D pg->next) {
>>> -		if (end < pg->records[0].ip ||
>>> +		if (end <=3D pg->records[0].ip ||
>>=20
>> This breaks the algorithm. "end" is inclusive. That is, if you look for
>> a single byte, where "start" and "end" are the same, and it happens to
>> be the first ip on the pg page, it will be skipped, and not found.
>=20
> Thanks. It looks like I should be over-riding ftrace_location() instead. =
=20
> I will update this patch.

I think I will have ftrace own the two instruction range, regardless of=20
whether the preceding instruction is a 'mflr r0' or not. This simplifies=20
things and I don't see an issue with it as of now. I will do more=20
testing to confirm.

- Naveen


--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -951,6 +951,16 @@ void arch_ftrace_update_code(int command)
 }
=20
 #ifdef CONFIG_MPROFILE_KERNEL
+/*
+ * We consider two instructions -- 'mflr r0', 'bl _mcount' -- to be part
+ * of ftrace. When checking for the first instruction, we want to include
+ * the next instruction in the range check.
+ */
+unsigned long ftrace_location(unsigned long ip)
+{
+	return ftrace_location_range(ip, ip + MCOUNT_INSN_SIZE);
+}
+
 /* Returns 1 if we patched in the mflr */
 static int __ftrace_make_call_prep(struct dyn_ftrace *rec)
 {
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 21d8e201ee80..122e2bb4a739 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1573,7 +1573,7 @@ unsigned long ftrace_location_range(unsigned long sta=
rt, unsigned long end)
  * the function tracer. It checks the ftrace internal tables to
  * determine if the address belongs or not.
  */
-unsigned long ftrace_location(unsigned long ip)
+unsigned long __weak ftrace_location(unsigned long ip)
 {
 	return ftrace_location_range(ip, ip);
 }

=

