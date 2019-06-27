Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB0584E2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 16:51:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZNBS4Ry3zDqgS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 00:51:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZN8J3RBGzDqCs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 00:49:20 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5REhtVS077459
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 10:49:17 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tcwreykxk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 10:49:16 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 27 Jun 2019 15:49:12 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Jun 2019 15:49:09 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5REn8R040370222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 14:49:08 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90F2DAE051;
 Thu, 27 Jun 2019 14:49:08 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE059AE055;
 Thu, 27 Jun 2019 14:49:07 +0000 (GMT)
Received: from localhost (unknown [9.199.59.170])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jun 2019 14:49:07 +0000 (GMT)
Date: Thu, 27 Jun 2019 20:19:06 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/7] x86/ftrace: Fix use of flags in
 ftrace_replace_code()
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
 <abc56ad177f370ec423edcfc538d35b418c1808e.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
 <20190627092902.253971d2@gandalf.local.home>
In-Reply-To: <20190627092902.253971d2@gandalf.local.home>
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19062714-0028-0000-0000-0000037E3FDE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062714-0029-0000-0000-0000243E6A81
Message-Id: <1561646838.7py5mwzawl.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=642 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906270172
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

Steven Rostedt wrote:
> On Thu, 27 Jun 2019 16:53:50 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>> In commit a0572f687fb3c ("ftrace: Allow ftrace_replace_code() to be
>> schedulable), the generic ftrace_replace_code() function was modified to
>> accept a flags argument in place of a single 'enable' flag. However, the
>> x86 version of this function was not updated. Fix the same.
>>=20
>> Fixes: a0572f687fb3c ("ftrace: Allow ftrace_replace_code() to be schedul=
able")
>=20
> I don't mind this change, but it's not a bug, and I'm not sure it
> should have the fixes tag. The reason being, the
> FTRACE_MODIFY_ENABLE_FL is only set when ftrace is called by with the
> command flag FTRACE_MAY_SLEEP, which is never done on x86.

I guess you meant to say that *FTRACE_MODIFY_MAY_SLEEP_FL* is only set=20
with FTRACE_MAY_SLEEP.

>=20
> That said, I'm fine with the change as it makes it more robust, but by
> adding the fixes tag, you're going to get this into all the stable
> code, and I'm not sure that's really necessary.

Agreed. Thanks for pointing this out. We can drop this patch from this=20
series and I will re-post this as a simpler cleanup later on.


Thanks,
Naveen

=

