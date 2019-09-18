Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 620E2B5DC3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 09:06:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y9y23FZrzF4YX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 17:06:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y9fV36h3zDqRW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 16:53:05 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8I6mf36032476
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 02:53:00 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v3dhpbuba-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 02:52:59 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 18 Sep 2019 07:52:58 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Sep 2019 07:52:56 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8I6qsBs42533330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 06:52:54 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B0FAA4054;
 Wed, 18 Sep 2019 06:52:54 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C648CA4064;
 Wed, 18 Sep 2019 06:52:53 +0000 (GMT)
Received: from localhost (unknown [9.199.38.30])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Sep 2019 06:52:53 +0000 (GMT)
Date: Wed, 18 Sep 2019 12:22:48 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] pseries/hotplug: Change the default behaviour of
 cede_offline
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Tyrel Datwyler <tyreld@linux.ibm.com>
References: <1568284541-15169-1-git-send-email-ego@linux.vnet.ibm.com>
 <87r24ew5i0.fsf@mpe.ellerman.id.au>
In-Reply-To: <87r24ew5i0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19091806-0012-0000-0000-0000034D719A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091806-0013-0000-0000-00002187EE3A
Message-Id: <1568788924.kxcnnog4r7.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-18_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909180071
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Kamalesh Babulal <kamaleshb@in.ibm.com>,
 linux-kernel@vger.kernel.org,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
>> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>>
>> Currently on Pseries Linux Guests, the offlined CPU can be put to one
>> of the following two states:
>>    - Long term processor cede (also called extended cede)
>>    - Returned to the Hypervisor via RTAS "stop-self" call.
>>
>> This is controlled by the kernel boot parameter "cede_offline=3Don/off".
>>
>> By default the offlined CPUs enter extended cede.
>=20
> Since commit 3aa565f53c39 ("powerpc/pseries: Add hooks to put the CPU int=
o an appropriate offline state") (Nov 2009)
>=20
> Which you wrote :)
>=20
> Why was that wrong?
>=20
>> The PHYP hypervisor considers CPUs in extended cede to be "active"
>> since the CPUs are still under the control fo the Linux Guests. Hence, w=
hen we change the
>> SMT modes by offlining the secondary CPUs, the PURR and the RWMR SPRs
>> will continue to count the values for offlined CPUs in extended cede
>> as if they are online.
>>
>> One of the expectations with PURR is that the for an interval of time,
>> the sum of the PURR increments across the online CPUs of a core should
>> equal the number of timebase ticks for that interval.
>>
>> This is currently not the case.
>=20
> But why does that matter? It's just some accounting stuff, does it
> actually break something meaningful?

Yes, this broke lparstat at the very least (though its quite unfortunate=20
we took so long to notice).

With SMT disabled, and under load:
  $ sudo lparstat 1 10

  System Configuration
  type=3DShared mode=3DUncapped smt=3DOff lcpu=3D2 mem=3D7759616 kB cpus=3D=
6 ent=3D1.00=20

  %user  %sys %wait    %idle    physc %entc lbusy  vcsw phint
  ----- ----- -----    -----    ----- ----- ----- ----- -----
  100.00  0.00  0.00     0.00     1.10 110.00 100.00 128784460     0
  100.00  0.00  0.00     0.00     1.07 107.00 100.00 128784860     0
  100.00  0.00  0.00     0.00     1.07 107.00 100.00 128785260     0
  100.00  0.00  0.00     0.00     1.07 107.00 100.00 128785662     0
  100.00  0.00  0.00     0.00     1.07 107.00 100.00 128786062     0
  100.00  0.00  0.00     0.00     1.07 107.00 100.00 128786462     0
  100.00  0.00  0.00     0.00     1.07 107.00 100.00 128786862     0
  100.00  0.00  0.00     0.00     1.07 107.00 100.00 128787262     0
  100.00  0.00  0.00     0.00     1.07 107.00 100.00 128787664     0
  100.00  0.00  0.00     0.00     1.07 107.00 100.00 128788064     0


With cede_offline=3Doff:
  $ sudo lparstat 1 10

  System Configuration
  type=3DShared mode=3DUncapped smt=3DOff lcpu=3D2 mem=3D7759616 kB cpus=3D=
6 ent=3D1.00=20

  %user  %sys %wait    %idle    physc %entc lbusy  vcsw phint
  ----- ----- -----    -----    ----- ----- ----- ----- -----
  100.00  0.00  0.00     0.00     1.94 194.00 100.00 128961588     0
  100.00  0.00  0.00     0.00     1.91 191.00 100.00 128961988     0
  100.00  0.00  0.00     0.00      inf   inf 100.00 128962392     0
  100.00  0.00  0.00     0.00     1.91 191.00 100.00 128962792     0
  100.00  0.00  0.00     0.00     1.91 191.00 100.00 128963192     0
  100.00  0.00  0.00     0.00     1.91 191.00 100.00 128963592     0
  100.00  0.00  0.00     0.00     1.91 191.00 100.00 128963992     0
  100.00  0.00  0.00     0.00     1.91 191.00 100.00 128964392     0
  100.00  0.00  0.00     0.00     1.91 191.00 100.00 128964792     0
  100.00  0.00  0.00     0.00     1.91 191.00 100.00 128965194     0

[The 'inf' values there show a different bug]

Also, since we expose [S]PURR through sysfs, any tools that make use of=20
that directly are also affected due to this.


- Naveen

