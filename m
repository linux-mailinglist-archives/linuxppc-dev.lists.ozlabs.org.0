Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3161145E4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 18:27:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TN2C1msKzDqb9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 04:27:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TMzy4c9vzDqZb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 04:25:18 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB5HM5RP136723
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Dec 2019 12:25:15 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq5t8s0t0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2019 12:25:14 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 5 Dec 2019 17:25:10 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Dec 2019 17:25:08 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB5HP67N59506886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Dec 2019 17:25:06 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB11AA4069;
 Thu,  5 Dec 2019 17:25:06 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67935A404D;
 Thu,  5 Dec 2019 17:25:06 +0000 (GMT)
Received: from localhost (unknown [9.199.48.150])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Dec 2019 17:25:06 +0000 (GMT)
Date: Thu, 05 Dec 2019 22:55:05 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] pseries: Track and expose idle PURR and SPURR ticks
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Nathan Lynch
 <nathanl@linux.ibm.com>
References: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
 <87r21ju3ud.fsf@linux.ibm.com>
 <48823589-b105-0da3-e532-f633ade8f0d9@linux.vnet.ibm.com>
 <87k17au4rw.fsf@linux.ibm.com>
In-Reply-To: <87k17au4rw.fsf@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19120517-0012-0000-0000-00000371BA17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120517-0013-0000-0000-000021AD7FD0
Message-Id: <1575566328.nhfi897fmd.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_05:2019-12-04,2019-12-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912050146
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

Hi Nathan,

Nathan Lynch wrote:
> Hi Kamalesh,
>=20
> Kamalesh Babulal <kamalesh@linux.vnet.ibm.com> writes:
>> On 12/5/19 3:54 AM, Nathan Lynch wrote:
>>> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
>>>>
>>>> Tools such as lparstat which are used to compute the utilization need
>>>> to know [S]PURR ticks when the cpu was busy or idle. The [S]PURR
>>>> counters are already exposed through sysfs.  We already account for
>>>> PURR ticks when we go to idle so that we can update the VPA area. This
>>>> patchset extends support to account for SPURR ticks when idle, and
>>>> expose both via per-cpu sysfs files.
>>>=20
>>> Does anything really want to use PURR instead of SPURR? Seems like we
>>> should expose only SPURR idle values if possible.
>>>=20
>>
>> lparstat is one of the consumers of PURR idle metric
>> (https://groups.google.com/forum/#!topic/powerpc-utils-devel/fYRo69xO9r4=
).=20
>> Agree, on the argument that system utilization metrics based on SPURR
>> accounting is accurate in comparison to PURR, which isn't proportional t=
o
>> CPU frequency.  PURR has been traditionally used to understand the syste=
m
>> utilization, whereas SPURR is used for understanding how much capacity i=
s
>> left/exceeding in the system based on the current power saving mode.
>=20
> I'll phrase my question differently: does SPURR complement or supercede
> PURR? You seem to be saying they serve different purposes. If PURR is
> actually useful rather then vestigial then I have no objection to
> exposing idle_purr.

SPURR complements PURR, so we need both. SPURR/PURR ratio helps provide=20
an indication of the available headroom in terms of core resources, at=20
maximum frequency.


- Naveen

