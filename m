Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 658601627C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 15:11:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MN7m1l4hzDqkT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 01:11:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MN2b4BHlzDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 01:07:03 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01IDv3Rx079976
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 09:07:01 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y6bunhh8e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 09:07:00 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 18 Feb 2020 14:06:58 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Feb 2020 14:06:54 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01IE6rt919398782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 14:06:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2328A4C050;
 Tue, 18 Feb 2020 14:06:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B43B94C04E;
 Tue, 18 Feb 2020 14:06:52 +0000 (GMT)
Received: from localhost (unknown [9.199.60.10])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Feb 2020 14:06:52 +0000 (GMT)
Date: Tue, 18 Feb 2020 19:36:51 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/kprobes: Fix trap address when trap happened in
 real mode
To: Christophe Leroy <christophe.leroy@c-s.fr>, Masami Hiramatsu
 <mhiramat@kernel.org>
References: <b1451438f7148ad0e03306a1f1409f4ad1d6ec7c.1581684263.git.christophe.leroy@c-s.fr>
 <20200214225434.464ec467ad9094961abb8ddc@kernel.org>
 <e09d3c42-542e-48c1-2f1e-cfe605b05bec@c-s.fr>
 <20200216213411.824295a321d8fa979dedbbbe@kernel.org>
 <baee8186-549a-f6cf-3619-884b6d708185@c-s.fr>
 <20200217192735.5070f0925c4159ccffa4e465@kernel.org>
 <c6257b49-bf02-d30a-1e2e-99abba5955e6@c-s.fr>
 <20200218094421.6d402de389ce23a55a3ec084@kernel.org>
 <c93c5346-d964-9167-c4dd-3123917344cf@c-s.fr>
 <20200218192905.a3ed969e8565901c4f69fa22@kernel.org>
 <2b3f664e-d4ad-edd3-5bed-a4492f4ed213@c-s.fr>
 <20200218213317.533c78753cefb05bd42cc6ad@kernel.org>
In-Reply-To: <20200218213317.533c78753cefb05bd42cc6ad@kernel.org>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20021814-4275-0000-0000-000003A32911
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021814-4276-0000-0000-000038B73025
Message-Id: <1582033782.f2l6jsd36b.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_02:2020-02-17,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxlogscore=967 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180110
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
Cc: linux-kernel@vger.kernel.org,
 Anil =?iso-8859-1?q?S=0A?= Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Paul Mackerras <paulus@samba.org>, stable@kernel.vger.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masami, Christophe,
Apologies for pitching in late here...

Masami Hiramatsu wrote:
> On Tue, 18 Feb 2020 12:04:41 +0100
> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>=20
>> >> Nevertheless, if one symbol has been forgotten in the blacklist, I th=
ink
>> >> it is a problem if it generate Oopses.
>> >=20
>> > There is a long history also on x86 to make a blacklist. Anyway, how d=
id
>> > you get this error on PPC32? Somewhere would you like to probe and
>> > it is a real mode function? Or, it happened unexpectedly?
>>=20
>> The first Oops I got was triggered by a WARN_ON() kind of trap in real=20
>> mode. The trap exception handler called kprobe_handler() which tried to=20
>> read the instruction at the trap address (which was a real-mode address)=
=20
>> so it triggered a Bad Access Fault.
>>=20
>> This was initially the purpose of my patch.
>=20
> OK, then filtering the trap reason in kprobe handler is a bit strange.
> It should be done in the previous stage (maybe in trap.c)
> Can we filter it by exception flag or only by checking the instruction
> which causes the exception, or needs get_kprobe()...?

I think Masami's earlier patch proposal to bail out early from=20
kprobe_handler() is appropriate here. We don't support kprobe in real=20
mode since we don't have a way to ensure that the pre/post handlers work=20
properly.

We will obviously also have to blacklist some of the real mode code from=20
being probed to begin with. In addition, we will also have to blacklist=20
any location where we can't take a trap (MSR_RI being unset, as an=20
example)

Christophe,
See some of the below patch series:
https://patchwork.ozlabs.org/patch/752336/
https://patchwork.ozlabs.org/patch/752333/
https://patchwork.ozlabs.org/patch/782399/


- Naveen

