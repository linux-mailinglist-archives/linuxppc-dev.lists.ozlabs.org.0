Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4500619D51C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 12:36:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48txF30p40zDrDl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 21:36:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48txCJ0Z26zDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 21:35:07 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 033AXVj9185316
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Apr 2020 06:35:04 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 302072ehea-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:35:04 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Fri, 3 Apr 2020 11:34:43 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Apr 2020 11:34:41 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 033AXubl43581948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 10:33:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 032B24C04A;
 Fri,  3 Apr 2020 10:35:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9570F4C044;
 Fri,  3 Apr 2020 10:34:59 +0000 (GMT)
Received: from localhost (unknown [9.85.72.61])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Apr 2020 10:34:59 +0000 (GMT)
Date: Fri, 03 Apr 2020 16:04:56 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 2/6] powerpc/idle: Add accessor function to always read
 latest idle PURR
To: ego@linux.vnet.ibm.com
References: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585308760-28792-3-git-send-email-ego@linux.vnet.ibm.com>
 <1585734073.0qmf6bbdoa.naveen@linux.ibm.com>
 <20200403061536.GA9066@in.ibm.com>
In-Reply-To: <20200403061536.GA9066@in.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040310-0020-0000-0000-000003C0CAAD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040310-0021-0000-0000-000022197A4A
Message-Id: <1585909343.fw0f8jg7ug.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_07:2020-04-02,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004030087
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R Shenoy wrote:
> On Wed, Apr 01, 2020 at 03:12:53PM +0530, Naveen N. Rao wrote:
>> Hi Gautham,
>>=20
>> Gautham R. Shenoy wrote:
>> >From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>> >
>> >+
>> >+static inline u64 read_this_idle_purr(void)
>> >+{
>> >+	/*
>> >+	 * If we are reading from an idle context, update the
>> >+	 * idle-purr cycles corresponding to the last idle period.
>> >+	 * Since the idle context is not yet over, take a fresh
>> >+	 * snapshot of the idle-purr.
>> >+	 */
>> >+	if (unlikely(get_lppaca()->idle =3D=3D 1)) {
>> >+		update_idle_purr_accounting();
>> >+		snapshot_purr_idle_entry();
>> >+	}
>> >+
>> >+	return be64_to_cpu(get_lppaca()->wait_state_cycles);
>> >+}
>> >+
>>=20
>> I think this and read_this_idle_spurr() from the next patch should be mo=
ved
>> to Patch 4/6, where they are actually used.
>=20
> The reason I included this function in this patch was to justify why
> we were introducing snapshotting the purr values in a global per-cpu
> variable instead of on a stack variable. The reason being that someone
> might want to read the PURR value from an interrupt context which had
> woken up the CPU from idle. At this point, since epilog() function
> wasn't called, the idle PURR count corresponding to this latest idle
> period would have been accumulated in lppaca->wait_cycles. Thus, this
> helper function safely reads the value by
>    1) First updating the lppaca->wait_cycles with the latest idle_purr
>    count.
>    2) Take a fresh snapshot, since the time from now to the epilog()
>    call is also counted under idle CPU. So the PURR cycle increment
>    during this short period should also be accumulated in lppaca->wait_cy=
cles.
>=20
>=20
> prolog()
> |	snapshot PURR
> |
> |
> |
> Idle
> |
> | <----- Interrupt . Read idle PURR ---- update idle PURR;
> |                              	         snapshot PURR;
> |                                   	 Read idle PURR.      =20
> |
> epilog()
> 	update idle PURR
>=20

Yes, I understand. It makes sense.

>=20
> However, if you feel that moving this function to Patch 4 where it is
> actually used makes it more readable, I can do that.

My suggestion was from a bisectability standpoint though. This is a=20
fairly simple function, but it is generally recommended to ensure that=20
newly added code gets exercized in the patch that it is introduced in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/process/5.Posting.rst#n119


Regards,
Naveen

