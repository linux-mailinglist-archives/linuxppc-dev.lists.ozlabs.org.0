Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C4E821DAA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 15:31:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qoxBGGkr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4Fdm574dz3cTg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 01:31:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qoxBGGkr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4Fcx11VRz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jan 2024 01:30:24 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 402DiaPn028526;
	Tue, 2 Jan 2024 14:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=L9wsvGMZSJp3/jakokQi4h502LASYRmsodDRfbt57OQ=;
 b=qoxBGGkriObmkRHbAbAUQjd2XgP7A9KuX2IVb8ThgO+8eZk82+1qkhA7fLA02shbeD1g
 SXf6lQW4K3H0WpHfLQYY3jjIVhi2KBFOdSVls4KhaDAGMq85HbyHlVIfilwhr5x7/4aZ
 abodRpg1wXpQqQ1NijOVp7ACRxB2rXiI/tB/xO3Plw3otNAgTo8z5eyVo+Fz6n36FF3R
 q7HnW7L1j7wNkEt1utZgh5yXlazwgUtFzqSF/Od+PkmqhaeWcD8rq2/oiGYYUb18Idaw
 kVv1xNEdMQnFJyO1/6vhFPTxfXbSb06a8f2zc5/fcsbQCcWODDvTuZCjjulxabGNd2rS Vg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vcjqut883-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 14:30:21 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 402EKUji019424;
	Tue, 2 Jan 2024 14:30:21 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vc30sce2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 14:30:21 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 402EUKVX20841146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jan 2024 14:30:20 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7427058057;
	Tue,  2 Jan 2024 14:30:20 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CC8A58058;
	Tue,  2 Jan 2024 14:30:20 +0000 (GMT)
Received: from localhost (unknown [9.61.111.122])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Jan 2024 14:30:20 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [Mainline/linux-next-netdev/net-next/scsi]Dlpar remove, drmgr
 phb and pci remove operations are failing
In-Reply-To: <2b1814f7-c7a2-4ea3-8bc7-abd8712ebef8@linux.vnet.ibm.com>
References: <2b1814f7-c7a2-4ea3-8bc7-abd8712ebef8@linux.vnet.ibm.com>
Date: Tue, 02 Jan 2024 08:30:20 -0600
Message-ID: <87v88breo3.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 95FaDXZkav18y2DRoiU7nROnM0bySmGv
X-Proofpoint-ORIG-GUID: 95FaDXZkav18y2DRoiU7nROnM0bySmGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-02_04,2024-01-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401020111
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
Cc: "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com> writes:
>  =C2=A0[Mainline/linux-next-netdev/net-next/scsi]

What does this mean? Are you reporting this issue against four separate
trees?

> Dlpar remove, drmgr phb and=20
> pci remove operations are failing
>
> command ---> chhwres -r io --rsubtype slot -m "managed system name" -o r=
=20
> --id 6 -l 21030014
>
> output --->
>
> HSCL2929 The dynamic removal of I/O resources failed: The I/O slot=20
> dynamic partitioning operation failed.=C2=A0 Here are the I/O slot IDs th=
at=20
> failed and the reasons for failure:
>
> Jan 02 02:20:22 caDlparCommand:execv to drmgr
> Validating PHB DLPAR capability...yes.
> Could not find drc index 0x20000014 to add to phb list
> There are no DR capable slots on this system
> Could not find PHB PHB 20
>
> The OS return code is 3.

This isn't really a useful report to send to kernel mailing lists. This
is a mixture of output from the HMC (Hardware Management Console) and
output from drmgr, a powerpc-specific utility that the HMC invokes
remotely on the host. There's no indication of a kernel problem.

This is just a guess, but please ensure your powerpc-utils package
(which contains drmgr) is reasonably recent. Versions up until something
like 3-4 years ago don't understand the ibm,drc-info properties in the
device tree and may experience failures like this.

If that doesn't help, there is likely some other issue (kernel or not)
to investigate here. Your best route to a resolution is probably to file
an internal bug and make the test environment available to a developer
who can look into it.
