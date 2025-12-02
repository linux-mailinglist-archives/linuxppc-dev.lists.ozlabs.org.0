Return-Path: <linuxppc-dev+bounces-14560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06598C9B48A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 12:18:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLJCv61Cmz3br7;
	Tue, 02 Dec 2025 22:18:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764674283;
	cv=none; b=ekW20k6KEOTWNE7Ncn0BL0vSdcbeKWdjDS/Xhz/pkGqT9NvogmWULWFh++ijaUrzRFamMWd4/TBpTLBtLB4RnAS5Of2d1aue69uq9GtspcxSRNSjwQVq7kWmuvl5sl60BwzBBFAkubQLDXgAJreQtODbt5z7ovOyVhJ0NdGA/ZKUhHIFgnD5NNoXs3nwRGo+APLjFKHtaZoKSMdje2NY/kL498U+A5U1NcTrSKADFlcSoiXK6L88adTOVOr8A68d33sfdLrqANQGkZ1Q0BfABNApcUmUvTOXK0uaaj1qetSrVfNqF6CDBGEcV+zBz5Oc6o884yRyWf6U1G/1Mbwiew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764674283; c=relaxed/relaxed;
	bh=kNHpGkDcRkyAOopIhY16WtauboSlSXtQ5i9UfYvgZRU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=aCjwMF10OGRe5u0ZwEgmGhCa6CoAjImdZusokS6LWHQMV9fLtAKIvkG+ofHQ/+8MeIxXldW8iJxHNIcwkzrWOIcYj9wh9L/Rnoz+zLAHACbPgISeDFsHXB/RbYBBr9qgIql//R4z8nuNwbF2OKk6wZbtVAIyMrCUz6pokUbVdguhwRGjlUpnlbLYDpbozXQMKdkNXUFMdkDAU7/UWRNjI7VwHNfFCY9cWQuxb1Heq2yqLO3jO62gtSs8n6lQOlywYkKA8aAn/X8TPnZyYCEHkTtZN8WpX/2yrsqqQPF1r+vH+JCFhcP0HMU0vpefhGlqH9cRCN8kq1KBEFHE8vGZrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VoY7WjrJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VoY7WjrJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLJCt2r9Hz3bqs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Dec 2025 22:18:01 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B25RZoi031790;
	Tue, 2 Dec 2025 11:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=kNHpGkDcRkyAOopIhY16WtauboSl
	SXtQ5i9UfYvgZRU=; b=VoY7WjrJYaDfRAxRJH/BSLZdAkH1B9YykV8TdKXmV/ZI
	39CRwVapY5A+PR9VAKKN9Q4Jq9A3vf1gTsL1y0aQrrGBPuhPbudH/ee1tXKifL7p
	Myf0A7XH+gkT+RAQIUPjVKzNLQWU7ZCLXNDGbSNxO10kIgRXeBv55O43WIQHYiSY
	IkUvUaOBmxRc7pLL5FddcnutYpqXLqFBjma1Duqc7MY+fAmzIAKts1zQgfaonj9E
	rkLAyZBt25gzbi/RRujCkKd4EOhZosrlzS5AmAocbFC5QgqzcHmWilVAT/DCGqar
	ywHnOt8dAOzF40FslaoSFvX60kUuTrX8zqK2PyVTzQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrg5cc1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 11:17:46 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B2BGLC6028393;
	Tue, 2 Dec 2025 11:17:45 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrg5cc1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 11:17:45 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B282EsB029334;
	Tue, 2 Dec 2025 11:17:44 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardv1bpac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 11:17:44 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B2BHghg65470902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Dec 2025 11:17:42 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC13358058;
	Tue,  2 Dec 2025 11:17:42 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66A275805C;
	Tue,  2 Dec 2025 11:17:39 +0000 (GMT)
Received: from [9.109.198.169] (unknown [9.109.198.169])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Dec 2025 11:17:39 +0000 (GMT)
Message-ID: <6af2c4c2-97f6-4758-be33-256638ef39e5@linux.ibm.com>
Date: Tue, 2 Dec 2025 16:47:37 +0530
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
From: Nilay Shroff <nilay@linux.ibm.com>
Subject: [bug report] powerpc: per device MSI irq domain
To: Nam Cao <namcao@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de,
        maz@kernel.org, gautam@linux.ibm.com, Gregory Joyce <gjoyce@ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: j8zSPVrSUfpLfRhqShd8_sXsHZ76oxco
X-Authority-Analysis: v=2.4 cv=Ir0Tsb/g c=1 sm=1 tr=0 ts=692ecada cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UZ5kDMcD7r91nqtgODUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfXyrGSKDi4d3sd
 X/V8k2SeVD1Q4M32+zH8v4sgUlTFUOwjXMfQShGwot2GR+a3uBzsys/S20+qOFX/UCC14ZBu58V
 SMuE8OnXx4/f+jFY4RhnX+GP2hJGjtwZrRLCfB4z+K3/giGdxB2sVux9x6WoMs4Ezd2keeMNaOw
 +jpICUjtJqkeAiLjAhloVkAuasvWiweX7F2P3RmY6jc3MwsYRO+A6wGMyVtDm6zxRvtOea2wyts
 TOArhHaKiCr3sRAhBtOHRqpIV4k+2C9Fx7OeCWG0yc0+0O9nd7NtI1cX1OT3VicpiGzWE7vKGVp
 nhGt+V1d0+gthgtuM57l8DH/qdFLzYJSSJokuNo1jrVFzv999Ah6e2FdnmTruIG5R0csVZX+qMS
 2035QOtJBx/S0Y7SU8ornA05gKSS5Q==
X-Proofpoint-GUID: ruf_UQj_pIGCNuPSnHntJQFeVQ_CdoVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_FILL_THIS_FORM_SHORT autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Nam,

I have been using an NVMe disk on my PowerPC system that supports up to
129 MSI-X interrupt vectors. Everything worked fine until Linux kernel
v6.18, after which the NVMe driver stopped detecting the disk because
the driver probe now fails.

After further investigation, I found that the probe failure in v6.18
occurs during PCI/MSI-X vector allocation. A git bisect identified
commit daaa574aba6f (“powerpc/pseries/msi: Switch to msi_create_parent_
irq_domain()”) as the first bad commit.

Additional debugging showed that the driver probe fails when calling
msi_create_device_irq_domain(). My working hypothesis is that, although
the PCIe NVMe device advertises support for 129 MSI-X vectors, the pSeries
firmware can supply only 128 MSI vectors to the device. This mismatch 
appears to cause MSI-X domain creation to fail, which ultimately results
in the NVMe driver failing to probe the device.

Device & MSI-X capability:
==========================

# lspci 
0524:28:00.0 Non-Volatile memory controller: KIOXIA Corporation NVMe SSD Controller CM7 2.5" (rev 01)

# lspci -vvv -s 0524:28:00.0 | grep -A2 MSI-X
	Capabilities: [b0] MSI-X: Enable+ Count=129 Masked-
		Vector table: BAR=0 offset=00005200
		PBA: BAR=0 offset=0000d600

Relevant device tree excerpt (DTS):

pci@800000020000585 {
    ...
    ibm,pe-total-#msi = <0x80>;            /* 128 available under this PHB */
    ...
    pci1014,6d1@0 {
        ...
        ibm,msi-x-ranges = <0x1c 0x01>;
        ibm,req#msi-x        = <0x81>;     /* device supports 0x81 == 129 */
        ...
    }
}

As shown above, The device supports 0x81 (129) MSI-X vectors (ibm,req#msi-x),
but the PHB reports ibm,pe-total-#msi = 0x80 (128), indicating the platform/firmware
provides only 128 MSI vectors for devices under that PHB.

Debugfs IRQ domain (on a kernel just before the bad commit):
===========================================================

# cat /sys/kernel/debug/irq/domains/:pci@800000020000524-3
name:   :pci@800000020000524-3
 size:   0
 mapped: 65
 flags:  0x00000013
    IRQ_DOMAIN_FLAG_HIERARCHY
    IRQ_DOMAIN_NAME_ALLOCATED
    IRQ_DOMAIN_FLAG_MSI
 parent: pSeries-MSI-1316
    name:   pSeries-MSI-1316
     size:   128
     mapped: 65
     flags:  0x00000003
        IRQ_DOMAIN_FLAG_HIERARCHY
        IRQ_DOMAIN_NAME_ALLOCATED
     parent: :interrupt-controller@400209f0000
        ...

This shows the parent domain (pSeries-MSI-1316) has size: 128.
From this, it appears the pseries firmware or parent IRQ domain only
provides 128 MSI vectors to the device, though, the device could
support 129 MSI vectors. But then, the device eventually clamped the MSI 
requests to 65 irq vectors and those were mapped successfully. 

Debugfs IRQ domain (running the latest kernel):
===============================================

# cat   /sys/kernel/debug/irq/domains/\:pci@800000020000524-5 
name:   :pci@800000020000524-5
 size:   128
 mapped: 0
 flags:  0x00000103
            IRQ_DOMAIN_FLAG_HIERARCHY
            IRQ_DOMAIN_NAME_ALLOCATED
            IRQ_DOMAIN_FLAG_MSI_PARENT
 parent: :interrupt-controller@400209f0000
    name:   :interrupt-controller@400209f0000
     size:   0
     mapped: 135
     flags:  0x00000003
                IRQ_DOMAIN_FLAG_HIERARCHY
                IRQ_DOMAIN_NAME_ALLOCATED

I do not see a per-device domain such as pSeries-PCI-MSI-0524:28:00.0 created;
and the device probe aborts with -22 during MSI/MSI-X allocation as shown below.

# dmesg | grep "nvme 0524:28:00.0"
[   15.000370] nvme 0524:28:00.0: ibm,query-pe-dma-windows(53) 280000 8000000 20000524 returned 0, lb=1000000 ps=103 wn=1
[   15.000772] nvme 0524:28:00.0: ibm,create-pe-dma-window(54) 280000 8000000 20000524 15 25 returned 0 (liobn = 0x70000524 starting addr = 8000000 0)
[   15.010030] nvme 0524:28:00.0: lsa_required: 0, lsa_enabled: 0, direct mapping: 1
[   15.015637] nvme 0524:28:00.0: lsa_required: 0, lsa_enabled: 0, direct mapping: 1
[   15.021223] nvme 0524:28:00.0: enabling device (0140 -> 0142)
[   15.028379] nvme 0524:28:00.0: probe with driver nvme failed with error -22


Summary / hypothesis:
=====================
- The adapter advertises 129 MSI-X vectors, but the PHB/firmware reports 128 available
  MSI vectors for devices in that PCI subtree (ibm,pe-total-#msi = 0x80).

- After the daaa574aba6f change an allocation request for 129 vectors fails when the
  parent only has 128 slots. This leads to msi_create_device_irq_domain() failing and
  the NVMe driver probe aborting.

- Previously, the kernel ended up clamping the device’s request (to fewer vectors — e.g., 65)
  and probe succeeded; after the change the strict parent-domain allocation prevents this
  graceful fall-back.

Please let me know if you want an additional details to be captured.

Thanks,
--Nilay

