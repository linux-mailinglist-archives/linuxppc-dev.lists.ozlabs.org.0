Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DC57A0860
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 17:02:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gylOju2s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmgXF5l6Mz3cRN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 01:02:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gylOju2s;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmgWC60mlz3c2D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 01:01:11 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RmgW94tCHz4xDB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 01:01:09 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RmgW94mpLz4x7q; Fri, 15 Sep 2023 01:01:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gylOju2s;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RmgW90cZ4z4x5q;
	Fri, 15 Sep 2023 01:01:08 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38EEtpg2004252;
	Thu, 14 Sep 2023 15:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=I59NJlH3Hba3fjGCDQvlGbry9L7rQPaqYtAtNWmBNOE=;
 b=gylOju2sng2EmEDwONlhb4530dGu/Jx7q5uW2VNhu/gSh1UMuutbpitcHd4scCRvhLTV
 ES+Zceeql1j0t7zQjdaqN3fRp84BvmZPMV/eeZRkbWxj2WjuiGV1DYH3TTPDid837qcZ
 vtpjiJo6weaDQ7ism3HHcd0h3iEqSLjQVcrW5MVjY/4LyvBzxakucnBzDjabosFGh/00
 +vmOytTPnNmspXc2CaNbTNkS7FDBfm20BbnkkGIonz7PqsEmwbunzOWwSkx3p9CU0499
 /i7ZHYHbkxqVu95A/e+rDROb/aNrYPfy2d/+v5OWAc1eG1L6sSRqm3BWW5l14oUMT2ys kw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t44ccr4b4-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 15:01:02 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38EDg4Y3002806;
	Thu, 14 Sep 2023 14:37:45 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t14hmbe4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 14:37:45 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38EEbgAe41878222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Sep 2023 14:37:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 892032004E;
	Thu, 14 Sep 2023 14:37:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3351020040;
	Thu, 14 Sep 2023 14:37:41 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.52.45])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Sep 2023 14:37:41 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <87sf7g7uu7.fsf@mail.lhotse>
Date: Thu, 14 Sep 2023 20:07:30 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <E74C5EA6-8720-47D5-ABD4-5AC6CE38BAE7@linux.ibm.com>
References: <20230911091409.415662-1-adityag@linux.ibm.com>
 <A4BD07EC-C0B1-4957-9201-35C15706F40B@linux.ibm.com>
 <87sf7g7uu7.fsf@mail.lhotse>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HKJULZC9FtwBmjCetfADYoVIaCV6CYys
X-Proofpoint-GUID: HKJULZC9FtwBmjCetfADYoVIaCV6CYys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=990 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309140125
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org, Aditya Gupta <adityag@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 14-Sep-2023, at 6:52 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Sachin Sant <sachinp@linux.ibm.com> writes:
>>> On 11-Sep-2023, at 2:44 PM, Aditya Gupta <adityag@linux.ibm.com> =
wrote:
>>>=20
>>> Presently, while reading a vmcore, makedumpfile uses
>>> `cur_cpu_spec.mmu_features` to decide whether the crashed system had
>>> RADIX MMU or not.
>>>=20
>>> Currently, makedumpfile fails to get the `cur_cpu_spec` symbol =
(unless
>>> a vmlinux is passed with the `-x` flag to makedumpfile), and hence
>>> assigns offsets and shifts (such as pgd_offset_l4) incorrecly =
considering
>>> MMU to be hash MMU.
>>>=20
>>> Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
>>> `cpu_spec` struct, to VMCOREINFO, so that the symbol address and =
offset
>>> is accessible to makedumpfile, without needing the vmlinux file
>>>=20
>>> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
>>> ---
>>=20
>> Thanks for the patch. With this patch applied (along with =
makedumpfile changes)
>> I am able to capture vmcore against a kernel which contains commit =
8dc9a0ad0c3e
>=20
> I can't find that commit? Was just wondering if it should be =
referenced
> in the commit message.
>=20

My bad, I copied that commit id from the email when I first reported =
this issue
against linux-next.

The commit should be=20
368a0590d954: (powerpc/book3s64/vmemmap: switch radix to use a
different vmemmap handling function)


