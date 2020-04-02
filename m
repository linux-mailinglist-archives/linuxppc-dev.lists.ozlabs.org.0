Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C14B719BD1D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 09:55:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tFj80FSMzDqX9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 18:55:08 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tFFn4nCyzDr13
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 18:34:53 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03273usK134814
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Apr 2020 03:34:45 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304r50ea6p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 03:34:43 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 2 Apr 2020 08:34:22 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 Apr 2020 08:34:20 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0327XYfx50856230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 07:33:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B990642041;
 Thu,  2 Apr 2020 07:34:37 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 559CF4203F;
 Thu,  2 Apr 2020 07:34:37 +0000 (GMT)
Received: from localhost (unknown [9.85.74.67])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 07:34:37 +0000 (GMT)
Date: Thu, 02 Apr 2020 13:04:34 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 6/6] pseries/sysfs: Minimise IPI noise while reading
 [idle_][s]purr
To: ego@linux.vnet.ibm.com, Michael Ellerman <mpe@ellerman.id.au>
References: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585308760-28792-7-git-send-email-ego@linux.vnet.ibm.com>
 <1585734367.oqwn7dzljo.naveen@linux.ibm.com>
 <20200401120127.GC17237@in.ibm.com>
In-Reply-To: <20200401120127.GC17237@in.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040207-0020-0000-0000-000003C00DC9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040207-0021-0000-0000-00002218B769
Message-Id: <1585811157.uig8s95yst.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020063
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
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R Shenoy wrote:
> Hello Naveen,
>=20
>=20
> On Wed, Apr 01, 2020 at 03:28:48PM +0530, Naveen N. Rao wrote:
>> Gautham R. Shenoy wrote:
>> >From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>> >
>  [..snip..]
>=20
>> >+
>> >+static ssize_t show_purr(struct device *dev,
>> >+			 struct device_attribute *attr, char *buf)
>> > {
>> >-	u64 *ret =3D val;
>> >+	struct cpu *cpu =3D container_of(dev, struct cpu, dev);
>> >+	struct util_acct_stats *stats;
>> >
>> >-	*ret =3D read_this_idle_purr();
>> >+	stats =3D get_util_stats_ptr(cpu->dev.id);
>> >+	return sprintf(buf, "%llx\n", stats->latest_purr);
>>=20
>> This alters the behavior of the current sysfs purr file. I am not sure i=
f it
>> is reasonable to return the same PURR value across a 10ms window.
>=20
>=20
> It does reduce it to 10ms window. I am not sure if anyone samples PURR
> etc faster than that rate.
>=20
> I measured how much time it takes to read the purr, spurr, idle_purr,
> idle_spurr files back-to-back. It takes not more than 150us.  From
> lparstat will these values be read back-to-back ? If so, we can reduce
> the staleness_tolerance to something like 500us and still avoid extra
> IPIs. If not, what is the maximum delay between the first sysfs file
> read and the last sysfs file read ?

Oh, for lparstat usage, this is perfectly fine.

I meant that there could be other users of [s]purr who might care. I=20
don't know of one, but since this is an existing sysfs interface, I=20
wanted to point out that the behavior might change.

>=20
>>
>> I wonder if we should introduce a sysctl interface to control thresholdi=
ng.
>> It can default to 0, which disables thresholding so that the existing
>> behavior continues. Applications (lparstat) can optionally set it to sui=
t
>> their use.
>=20
> We would be introducing 3 new sysfs interfaces that way instead of
> two.
>=20
> /sys/devices/system/cpu/purr_spurr_staleness
> /sys/devices/system/cpu/cpuX/idle_purr
> /sys/devices/system/cpu/cpuX/idle_spurr
>=20
> I don't have a problem with this. Nathan, Michael, thoughts on this?
>=20
>=20
> The alternative is to have a procfs interface, something like
> /proc/powerpc/resource_util_stats
>=20
> which gives a listing similar to /proc/stat, i.e
>=20
>       CPUX  <purr>  <idle_purr>  <spurr>  <idle_spurr>
>=20
> Even in this case, the values can be obtained in one-shot with a
> single IPI and be printed in the row corresponding to the CPU.

Right -- and that would be optimal requiring a single system call, at=20
the cost of using a legacy interface.

The other option would be to drop this patch and to just go with patches=20
1-5 introducing the new sysfs interfaces for idle_[s]purr. It isn't=20
entirely clear how often this would be used, or its actual impact. We=20
can perhaps consider this optimization if and when this causes=20
problems...


Thanks,
Naveen

