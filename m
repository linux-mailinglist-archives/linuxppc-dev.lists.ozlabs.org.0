Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E597FBE23
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 16:33:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kiQxpjJw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfmhM36t1z3cZt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 02:33:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kiQxpjJw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfmgS62pFz3cTg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 02:33:08 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASF3qSP004877;
	Tue, 28 Nov 2023 15:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+uLx2NUTJQgaYUE5R8vKK1I9nYZ7V4+JkAq5i9EDaVM=;
 b=kiQxpjJw9bSR7fC6AgsqFkFF+C3FzH2o2QstjaW5qoIM3X/s6O6ky+rGgPYV5NEo2QKo
 R66jDw/xuIdRkfY+aUuvRIKWBKpae4BR1eCKhiFMCjL4IB5N4ElhSRpfXRdnraCUMwH5
 Ej0INgPrvSQbIqX9ISMp0C+XylF7W5ODQ0JdvipCaBnBNuylAf13euEwIh8/4rk2WSvI
 hOTEMjzzU1sXG2HRPkPwG1G2GgmuCCU7YxmRVT+c12W3r1Y9B58QHRlueEdtaIh8v2Ww
 tueu9+I/tANeyazsWui3u5pqRQfj64Sw4MX77w0B19ozUY0B1TeQbUfjo9jU5NiLRJ0z KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unhywj4f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 15:32:55 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ASF67hB012140;
	Tue, 28 Nov 2023 15:32:54 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unhywj4e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 15:32:54 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASDW2Zv018242;
	Tue, 28 Nov 2023 15:32:54 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwy1r2ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 15:32:54 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ASFWrV652363870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Nov 2023 15:32:53 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04B805805F;
	Tue, 28 Nov 2023 15:32:53 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDF535805B;
	Tue, 28 Nov 2023 15:32:52 +0000 (GMT)
Received: from localhost (unknown [9.61.20.55])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Nov 2023 15:32:52 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
        Nathan Lynch via B4
 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 06/13] powerpc/rtas: Serialize firmware activation
 sequences
In-Reply-To: <874jhglu6x.fsf@kernel.org>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-6-b794d8cb8502@linux.ibm.com>
 <874jhglu6x.fsf@kernel.org>
Date: Tue, 28 Nov 2023 09:32:52 -0600
Message-ID: <87zfyx28rf.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XT4FmgWT9RVkn2F0tO9NJgs_Etig6RZy
X-Proofpoint-GUID: yoO-7cspreYu4zFLzo2P4MznjlfBfmM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_17,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311280124
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
Cc: tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org> writes:
> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
> writes:
>
>>
>> Use the function lock API to prevent interleaving call sequences of
>> the ibm,activate-firmware RTAS function, which typically requires
>> multiple calls to complete the update. While the spec does not
>> specifically prohibit interleaved sequences, there's almost certainly
>> no advantage to allowing them.
>>
>
> Can we document what is the equivalent thing the userspace does?

I'm not sure what we would document.

As best I can tell, the activate_firmware command in powerpc-utils does
not make any effort to protect its use of the ibm,activate-firmware RTAS
function. The command is not intended to be run manually and I guess
it's relying on the platform's management console to serialize its
invocations.

drmgr (also from powerpc-utils) has some dead code for LPM that calls
ibm,activate-firmware; it should probably be removed. The command uses a
lock file to serialize all of its executions.

Something that could happen with interleaved ibm,activate-firmware
sequences is something like this:

1. Process A initiates an ibm,activate-firmware sequence and receives a
   "retry" status (-2/990x).
2. Process B calls ibm,activate-firmware and receives the "done" status
   (0), concluding the sequence A began.
3. Process A, unaware of B, calls ibm,activate-firmware again,
   inadvertently beginning a new sequence.

Seems mostly benign to me except that process A could fail to make
progress indefinitely under the right circumstances.
