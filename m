Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA01114E0E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 10:16:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Tn5517HmzDqcv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 20:16:09 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Tn2z6sLxzDqYj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 20:14:18 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6973se023704
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Dec 2019 04:14:14 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq55t83f1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Dec 2019 04:14:14 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Fri, 6 Dec 2019 09:14:11 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Dec 2019 09:14:09 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB69E8sr38338590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 09:14:08 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A0C9AE051;
 Fri,  6 Dec 2019 09:14:08 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD41DAE056;
 Fri,  6 Dec 2019 09:14:07 +0000 (GMT)
Received: from localhost (unknown [9.124.35.239])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Dec 2019 09:14:07 +0000 (GMT)
Date: Fri, 06 Dec 2019 14:44:06 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] pseries: Track and expose idle PURR and SPURR ticks
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Nathan Lynch
 <nathanl@linux.ibm.com>
References: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
 <87r21ju3ud.fsf@linux.ibm.com>
 <48823589-b105-0da3-e532-f633ade8f0d9@linux.vnet.ibm.com>
 <87k17au4rw.fsf@linux.ibm.com> <1575566328.nhfi897fmd.naveen@linux.ibm.com>
In-Reply-To: <1575566328.nhfi897fmd.naveen@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19120609-0016-0000-0000-000002D21208
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120609-0017-0000-0000-000033341B13
Message-Id: <1575623305.dgcux6u43j.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_02:2019-12-04,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912060080
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N. Rao wrote:
> Hi Nathan,
>=20
> Nathan Lynch wrote:
>> Hi Kamalesh,
>>=20
>> Kamalesh Babulal <kamalesh@linux.vnet.ibm.com> writes:
>>> On 12/5/19 3:54 AM, Nathan Lynch wrote:
>>>> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
>>>>>
>>>>> Tools such as lparstat which are used to compute the utilization need
>>>>> to know [S]PURR ticks when the cpu was busy or idle. The [S]PURR
>>>>> counters are already exposed through sysfs.  We already account for
>>>>> PURR ticks when we go to idle so that we can update the VPA area. Thi=
s
>>>>> patchset extends support to account for SPURR ticks when idle, and
>>>>> expose both via per-cpu sysfs files.
>>>>=20
>>>> Does anything really want to use PURR instead of SPURR? Seems like we
>>>> should expose only SPURR idle values if possible.
>>>>=20
>>>
>>> lparstat is one of the consumers of PURR idle metric
>>> (https://groups.google.com/forum/#!topic/powerpc-utils-devel/fYRo69xO9r=
4).=20
>>> Agree, on the argument that system utilization metrics based on SPURR
>>> accounting is accurate in comparison to PURR, which isn't proportional =
to
>>> CPU frequency.  PURR has been traditionally used to understand the syst=
em
>>> utilization, whereas SPURR is used for understanding how much capacity =
is
>>> left/exceeding in the system based on the current power saving mode.
>>=20
>> I'll phrase my question differently: does SPURR complement or supercede
>> PURR? You seem to be saying they serve different purposes. If PURR is
>> actually useful rather then vestigial then I have no objection to
>> exposing idle_purr.
>=20
> SPURR complements PURR, so we need both. SPURR/PURR ratio helps provide=20
> an indication of the available headroom in terms of core resources, at=20
> maximum frequency.

Re-reading this today morning, I realize that this isn't entirely=20
accurate. SPURR alone is sufficient to understand core resource=20
utilization.

Kamalesh is using PURR to display non-normalized utilization values=20
(under 'actual' column), as reported by lparstat on AIX. I am not=20
entirely sure if it is ok to derive these based on the SPURR busy/idle=20
ratio.

- Naveen

