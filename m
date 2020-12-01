Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2422F2CA440
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 14:49:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clk3v0Wp8zDqSV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 00:49:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mAMuRfTr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clk140KzVzDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 00:47:03 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B1DW7sT123297; Tue, 1 Dec 2020 08:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=18Fac/MEWExn20Bjt6+tNWvHuYIjWyqinvH4ZsDeOt4=;
 b=mAMuRfTrhWR/wm9K7jInD4HeW2CXs0a7ReWrS7lObQPDoBJN1ToKzDIXtIbxjJMAcb5s
 ker3/bkXVuodjalHeBsXOQMD2acZC5HTQMxCfKpPYoUgaPYtX4jwb2fEh8LuYxjoutSY
 4tJ+yGSi/vUicxRZ1F2tqB/RWltZlH3sgmIk9gqYiFrBEl8OFRam9KZkAawdao+JBYGN
 am1JVvmxdAf7etD/nFyOjehs7G/I2/VCRqnwYe0BSeb+UCWw65avM3MAGLtiUN/HlA8j
 geyITHHZJCeD0smc1Gw2vgacaTouuAWfY4vk4e/n8n+rhEboPZmbgjlYR2GxOwTferTr ug== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 355k527nww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 08:46:30 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B1DcMfF005462;
 Tue, 1 Dec 2020 13:46:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 353e689nhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 13:46:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B1DkQDx35258876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Dec 2020 13:46:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 817004204D;
 Tue,  1 Dec 2020 13:46:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1FDB4203F;
 Tue,  1 Dec 2020 13:46:25 +0000 (GMT)
Received: from localhost (unknown [9.85.93.73])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Dec 2020 13:46:25 +0000 (GMT)
Date: Tue, 01 Dec 2020 19:16:21 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 01/14] ftrace: Fix updating FTRACE_FL_TRAMP
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
 <56c113aa9c3e10c19144a36d9684c7882bf09af5.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
 <20201130212346.31e2a8b7@oasis.local.home>
In-Reply-To: <20201130212346.31e2a8b7@oasis.local.home>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1606830090.lipn68ihsf.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_05:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012010083
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

Steven Rostedt wrote:
> On Thu, 26 Nov 2020 23:38:38 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>> On powerpc, kprobe-direct.tc triggered FTRACE_WARN_ON() in
>> ftrace_get_addr_new() followed by the below message:
>>   Bad trampoline accounting at: 000000004222522f (wake_up_process+0xc/0x=
20) (f0000001)
>>=20
>> The set of steps leading to this involved:
>> - modprobe ftrace-direct-too
>> - enable_probe
>> - modprobe ftrace-direct
>> - rmmod ftrace-direct <-- trigger
>>=20
>> The problem turned out to be that we were not updating flags in the
>> ftrace record properly. From the above message about the trampoline
>> accounting being bad, it can be seen that the ftrace record still has
>> FTRACE_FL_TRAMP set though ftrace-direct module is going away. This
>> happens because we are checking if any ftrace_ops has the
>> FTRACE_FL_TRAMP flag set _before_ updating the filter hash.
>>=20
>> The fix for this is to look for any _other_ ftrace_ops that also needs
>> FTRACE_FL_TRAMP.
>=20
> I'm applying this now and sending this for -rc and stable.
>=20
> The code worked on x86 because x86 has a way to make all users use
> trampolines, so this was never an issue (everything has a trampoline).
> I modified the kernel so that x86 would not create its own trampoline
> (see the weak function arch_ftrace_update_trampoline(), and I was able
> to reproduce the bug.

Good to know that you were able to reproduce this.

>=20
> I'm adding:
>=20
> Cc: stable@vger.kernel.org
> Fixes: a124692b698b0 ("ftrace: Enable trampoline when rec count returns b=
ack to one")

That looks good to me. Thanks for picking the two patches and for your=20
review on the others!


- Naveen

