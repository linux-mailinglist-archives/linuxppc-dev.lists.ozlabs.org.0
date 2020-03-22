Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4CE18EA3A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 17:19:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ljQ35NkWzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 03:19:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ljNG0NmxzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 03:17:48 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02MG2Y2X104866
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 12:17:45 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0jtet1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 12:17:45 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Sun, 22 Mar 2020 16:17:43 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 22 Mar 2020 16:17:41 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02MGHeMg47317044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 22 Mar 2020 16:17:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A39BBA404D;
 Sun, 22 Mar 2020 16:17:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41DCCA4040;
 Sun, 22 Mar 2020 16:17:40 +0000 (GMT)
Received: from localhost (unknown [9.85.74.144])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 22 Mar 2020 16:17:40 +0000 (GMT)
Date: Sun, 22 Mar 2020 21:47:36 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/64: ftrace don't trace real mode
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
References: <20200320152551.1468983-1-npiggin@gmail.com>
 <1584728788.91gvyrzbi3.naveen@linux.ibm.com>
 <1584759479.7ueu8qvhgs.astroid@bobo.none>
In-Reply-To: <1584759479.7ueu8qvhgs.astroid@bobo.none>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20032216-0020-0000-0000-000003B90263
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032216-0021-0000-0000-00002211798E
Message-Id: <1584893587.qg26sf1ty0.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-22_05:2020-03-21,
 2020-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=769 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003220094
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin wrote:
> Naveen N. Rao's on March 21, 2020 4:39 am:
>> Hi Nick,
>>=20
>> Nicholas Piggin wrote:
>>> This warns and prevents tracing attempted in a real-mode context.
>>=20
>> Is this something you're seeing often? Last time we looked at this, KVM=20
>> was the biggest offender and we introduced paca->ftrace_enabled as a way=
=20
>> to disable ftrace while in KVM code.
>=20
> Not often but it has a tendancy to blow up the least tested code at the
> worst times :)
>=20
> Machine check is bad, I'm sure HMI too but I haven't tested that yet.
>=20
> I've fixed up most of it with annotations, this is obviously an extra
> safety not something to rely on like ftrace_enabled. Probably even the
> WARN_ON here is dangerous here, but I don't want to leave these bugs
> in there.

Ok, makes sense.

>=20
> Although the machine check and hmi code touch a fair bit of stuff and
> annotating is a bit fragile. It might actually be better if the
> paca->ftrace_enabled could be a nesting counter, then we could use it
> in machine checks too and avoid a lot of annotations.

I'm not too familiar with MC/HMI, but I suppose those aren't re-entrant? =20
If those have access to an emergency stack, can we save/restore=20
ftrace_enabled state across the handlers?

We're primarily disabling ftrace across idle/offline/KVM right now. I'm=20
not sure if nesting is useful there.

>=20
>> While this is cheap when handling ftrace_regs_caller() as done in this=20
>> patch, for simple function tracing (see below), we will have to grab the=
=20
>> MSR which will slow things down slightly.
>=20
> mfmsr is not too bad these days.=20

That's great!


Thanks,
Naveen

