Return-Path: <linuxppc-dev+bounces-17397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGYUKhS2oWm+vwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 16:19:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24CC1B99FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 16:19:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMsSd1gXlz30N8;
	Sat, 28 Feb 2026 02:19:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772205585;
	cv=none; b=hZ6H1A+BxUeWN032rVbSOWEAdfDTlWnk5BGmRsJLrQIJX+MXAwa0eizd+JQ4AteBXGoCVQsSYgrQ6IdMxmCOOUX5RcmLThgAxkitUSCZDqEMThLEW72Xbac6K8i1/VnS9d3xif9Dyfkoerbz8wima2SYmc5DBBVZHeZH+ygmk8Z/xtBYZbNSm+6ylZtlald86bM8SZOqi4s0GdSnImQUr4DxTOiHbEGj7GvmAaGjgeh3/NwcTfv8+LU+bwqgWtLfADYDEclPLD0B1wkBcfES1rsTDN+IEEoDhFkRyl92AJsVos/f99IzjrmL1jyFcUhNktLTYA4KfXPGmopJqWtsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772205585; c=relaxed/relaxed;
	bh=6ie7j0ETZydojrLXiV55waTujL3xYchaVyY759cX0Wk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=PTWIFcXTRucS9g9eLkKLTEnuVmDKGYS6DTPMLJMxnsv1PJgVTIu8SfTKuLJEbcdbXeXzBm8SMxUY44sdXk67qQ7ZNk/qRqzHPGaJR5OzYP74uBykiphlRgs56iWo0JHwSrNIT+cHKpMBx7w0KumYYUhQq2KNKa01/H0LYCJaedHEOuVJKy2+qEZP143E1GuYFodjF1DrhmJm+Wnb8yM6f5Zm/sLxnnRvJxX/dlprMnWzo3xgUBriBLYFThvs4U294waDjFzuIJO4wOh7oysJzeaKfM5Xnpia5OI+hNj8eDI1TOVtnr4Tr/fCugtF162U/RrOcqjUkDbk4/3MxUXcPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Knxf/aNG; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Knxf/aNG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMsSc1pLGz2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 02:19:44 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61REOpGm3172107;
	Fri, 27 Feb 2026 15:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=6ie7j0ETZydojrLXiV55waTujL3x
	YchaVyY759cX0Wk=; b=Knxf/aNGGkN1UJLS6JinFBaQgpznLPMlt9LAon9YaL7H
	mxGhAlmgwDD1pZ74uO4rZqAHDoBba5SwrZZG7HwhCvupDVa/yPOUf9G2lbefwXZi
	JHP2MuBo5Bit/i8LjS24CeVsWeRsOvvGWpIj+tpy27sFyQeK3NmIuJ7MJRNnzdNN
	wuobKHyq/Q4TfekGII44AxFTY9OrxNsfs4wMvoBeJIUBLtIpiNeKKfgeZSl8ILZa
	TDWjcsy9+XJgxUyaMJyHHRNMOC+H4CmPR5SBk6QxA+KVxpoXxVA3PmwLMD3R/Ltv
	7ywJ/0pK1XBVEsAPRzrsQxUHykOKltPINv8nwV2Tzw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4crda0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 15:19:36 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61RF4wO7027794;
	Fri, 27 Feb 2026 15:19:36 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfsr2ahuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 15:19:35 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61RFJWFr42270994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 15:19:32 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DCB820040;
	Fri, 27 Feb 2026 15:19:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3C2420043;
	Fri, 27 Feb 2026 15:19:29 +0000 (GMT)
Received: from [9.124.211.61] (unknown [9.124.211.61])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Feb 2026 15:19:29 +0000 (GMT)
Message-ID: <4c338a29-d190-44f3-8874-6cfa0a031f0b@linux.ibm.com>
Date: Fri, 27 Feb 2026 20:49:28 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc: Donet Tom <donettom@linux.ibm.com>, Hari Bathini
 <hbathini@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: powerpc/fadump: CMA init is failing
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: tAjiTAn18PmSiVH73jyACStrzxevGv60
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEzNSBTYWx0ZWRfXzl4Yk5QBELcY
 /csjJwDKGdsXolpCfBH2otERPBm0a58nl5MjMOzYjbLUxztICYGhL6+2IxlevW4SCRbYM3iDhe7
 QTnFMMHRdGQ88sMDPCMYJenwjswaFXEZz+jwKA0WuwrgJmouFEkZ7jZFQncmnk7LGF61fgT/TUt
 iDpnQ68hbNy0+zqOgWE6LKzpDF5R98mIT1iJmWy054jmCFytjpQ2PK82yDwPKRW0s+7Zqc4u/tZ
 SbqdeQkoZTL1Ksz0mfy2Xu4vqd596EodgcyQ4al2NxfO9cJMf6cIvLake82VCS0pMIlA6O+mSgR
 fhRFSMyE2Lo2U2nn9U7adrxvIRcS6/ztVJCEdc5D0ynPCecnz7BsWa5Fe2JnUEM/FHWz+NwGZnR
 mTCGxZTDyF0eLgJqRRx3SrL6tGquVtyW82MXaz3UcPFNWz6s+XvAUK349y6z02gra/fAieeLk1m
 oWoy4XKzcTQ/90mmvFw==
X-Proofpoint-GUID: gXTaiRpLPCX6tNTpgiTseeqyNbfGQh7c
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=69a1b609 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=6I1ujiDytcYDFxb-EcoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602270135
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:mpe@ellerman.id.au,m:donettom@linux.ibm.com,m:hbathini@linux.ibm.com,m:mahesh@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17397-lists,linuxppc-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.ibm.com,lists.ozlabs.org,ellerman.id.au];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid,54.174.64.0:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_PROHIBIT(0.00)[1.201.195.198:email];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C24CC1B99FA
X-Rspamd-Action: no action

I noticed CMA init for fadump crashkernel memory is failing.

[    0.000000] cma: pageblock_order not yet initialized. Called during 
early boot?
[    0.000000] fadump: Failed to init cma area for firmware-assisted 
dump,-22


kernel command-line:
BOOT_IMAGE=(ieee1275//vdevice/v-scsi@30000070/disk@8100000000000000,msdos2)/vmlinuz-7.0.0-rc1+ 
root=/dev/mapper/rhel_ltcden3--lp12-root ro 
rd.lvm.lv=rhel_ltcden3-lp12/root rd.lvm.lv=rhel_ltcden3-lp12/swap 
fadump=on crashkernel=3G


Same issue with kdump CMA reservation:

[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 200 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 100 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 50 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 25 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 12 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 6 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 3 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 1 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 0 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 0 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 0 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 0 MiB
[    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
during early boot?
[    0.000000][    T0] cma: Failed to reserve 0 MiB
[    0.000000][    T0] crashkernel CMA reservation failed: 200 MB 
requested, 0 MB reserved in 0 ranges



kernel command-line:
# cat /proc/cmdline
noreboot crashkernel=200M crashkernel=200M,cma

Should be easy to reproduce it with powerpc defconfig:
make ARCH=powerpc defconfig

The crashkernel CMA init for fadump and kdump happens in:
arch/powerpc/kernel/setup-common.c -> setup_arch()

     initmem_init();

     /*
      * Reserve large chunks of memory for use by CMA for kdump, fadump, 
KVM and
      * hugetlb. These must be called after initmem_init(), so that
      * pageblock_order is initialised.
      */
     fadump_cma_init();
     kdump_cma_reserve();
     kvm_cma_reserve();

Has something changed for pageblock_order initialization?

- Sourabh Jain

