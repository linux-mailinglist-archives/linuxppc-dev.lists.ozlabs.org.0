Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776F326D8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 05:13:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HKrL0t2xzDqKr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 13:13:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HKpx3BYfzDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 13:12:08 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x533C2X2141392
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 2 Jun 2019 23:12:05 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2svnvq952w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jun 2019 23:12:04 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Mon, 3 Jun 2019 04:11:56 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 3 Jun 2019 04:11:53 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x533BqZA51380410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jun 2019 03:11:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B657042041;
 Mon,  3 Jun 2019 03:11:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6ED24203F;
 Mon,  3 Jun 2019 03:11:51 +0000 (GMT)
Received: from [9.109.244.70] (unknown [9.109.244.70])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jun 2019 03:11:51 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [next-20190530] Boot failure on PowerPC
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <CAA42JLYcPi4ypvX=Ma8yWzUCF=B=FkDrzLex=bJiLyryuWTE2g@mail.gmail.com>
Date: Mon, 3 Jun 2019 08:41:50 +0530
Content-Transfer-Encoding: quoted-printable
References: <79EEB945-661A-41AD-8B26-2FD3B3F84697@linux.vnet.ibm.com>
 <87h89aohnu.fsf@concordia.ellerman.id.au>
 <CAA42JLYcPi4ypvX=Ma8yWzUCF=B=FkDrzLex=bJiLyryuWTE2g@mail.gmail.com>
To: Dexuan-Linux Cui <dexuan.linux@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19060303-4275-0000-0000-0000033B7B11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060303-4276-0000-0000-0000384B83EB
Message-Id: <D8C9598F-4A51-4402-9344-894EC6B6CE47@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=766 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906030021
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 v-lide@microsoft.com, Dexuan Cui <decui@microsoft.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 31-May-2019, at 11:43 PM, Dexuan-Linux Cui <dexuan.linux@gmail.com> =
wrote:
>=20
> On Fri, May 31, 2019 at 6:52 AM Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>>>=20
>>> Machine boots till login prompt and then panics few seconds later.
>>>=20
>>> Last known next build was May 24th. Will attempt few builds till May =
30 to
>>> narrow down this problem.
>>=20
>> My CI was fine with next-20190529 (9a15d2e3fd03e3).
>>=20
>> cheers
>=20
> Hi Sachin,
> It looks this patch may fix the issue:
> https://lkml.org/lkml/2019/5/30/1630 , but I'm not sure.

It does not help fix the kernel panic issue, but it fixes the =
get_swap_device warning
messages during the boot.

Thanks
-Sachin

