Return-Path: <linuxppc-dev+bounces-14419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B89C7C544
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Nov 2025 04:49:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCykg41R0z30B4;
	Sat, 22 Nov 2025 14:49:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763751457;
	cv=none; b=S5w5SGkQ9Es1Y1Tv4+uqDckpKoNqVJRO976l0L5L7N3PEj/xuRhhpoR+URuPeVfmhxdjhB/9tWM5X0jovenQoOowWuJjD4wxF5iT/yppi9xSJ332E/oDQXiP6Y6uxIguaJIiYnKXEyihxWzIVpjPNLz5Q4h2QBMqyUbCyhoOAzwVtajy037aQMYW/aFzjvns6NqVk9Vs9c0zOgS7ZKUApL/PrKHzPkFWYJWCxdKctOMJT0HkmWHlJOqy/Yq4bfZHUdRxGE7ePdLxP/0ZZBLeRlgVAq5hYK0SAZKrjUz55ZHWYZSSa1Uw0Lg3o2yfVmZI1oagW3A0EypRXYrSW6ATnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763751457; c=relaxed/relaxed;
	bh=qyT3aVXUS0qy3xeo2Jt8io+s2fQtl6tf6g20n+ujMFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ao7TMmhfFfosyFdrJs6+CIn27BQZoSTRI7h/kD2go8O3gK2t9gdz/E8gFaGTGJwuP3a3Tqb4q7YuVne2M+mU70Sro9l11cMTPzeCsN3jV7gQPDjxIVkJBn0cdqb3LwxvM/xJPmFxtv/yQK2UHQS2Wz4q59HefRu60fR269q0I0G5BJFA/CALZoQuAcmzmEZCQHR7zW0No/yBi4OahgNDQfHB9MVpT0ZLPXOyMV6jmMO66tKpGJ3QGZhZPwnKQhibFmYb2yWEOfT6HMj7EbnoPc+m3hU2nT957W043vZQrKvIwX4X+VsKh1xWeanTgOs2W3HCDtTSfAz7h0yxHAMnyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oomZIlh5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=alifm@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oomZIlh5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=alifm@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCkxD0yqkz2yrQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Nov 2025 05:57:35 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ALEUr1g028867;
	Fri, 21 Nov 2025 18:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qyT3aV
	XUS0qy3xeo2Jt8io+s2fQtl6tf6g20n+ujMFY=; b=oomZIlh5i8ZgfusUL0jIO3
	yEPrQy6KLLHPDGGs08fGvw7ZM+U3/1tLWKppPyXi1mtv0Ub33cCcaget9qxws4lN
	5CQVvzPKb3Ql9IfmFMRSbU38uMbva/TqzoY49CPkulLhRsJDI4JXaY32SdVUNw5A
	Pb7shNKrPZ+X14J9SXg1ZHUPfPMNYONwJiN2mOpDDEYiI9gy/7dHJ4pu/dtzPaMb
	qJ5PrB8TlOtKWHCRaqnK+3FaaFGIyuZp4DLtgu7UOmztFnvVSZQAF0hLqh4NUPED
	rFptzgECpSgJp/WEfL+T5prmhQrHaWY/s/fScO4s0a3isUYM0P/CJ/8pbIAdrzcw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejkadtfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 18:57:30 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5ALIqxWp007111;
	Fri, 21 Nov 2025 18:57:30 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejkadtf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 18:57:29 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5ALGXlnL017381;
	Fri, 21 Nov 2025 18:57:29 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j25rnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 18:57:29 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5ALIvRjZ6423114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 18:57:28 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9DD85804B;
	Fri, 21 Nov 2025 18:57:27 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DAB658063;
	Fri, 21 Nov 2025 18:57:26 +0000 (GMT)
Received: from [9.61.252.112] (unknown [9.61.252.112])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 18:57:25 +0000 (GMT)
Message-ID: <ab3158f0-7954-4a89-88da-6d7d69111e3b@linux.ibm.com>
Date: Fri, 21 Nov 2025 10:57:24 -0800
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
Subject: Re: [PATCH] Documentation: PCI: Amend error recovery doc with
 pci_save_state() rules
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Benjamin Block <bblock@linux.ibm.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Linas Vepstas <linasvepstas@gmail.com>, linux-doc@vger.kernel.org
References: <077596ba70202be0e43fdad3bb9b93d356cbe4ec.1763746079.git.lukas@wunner.de>
Content-Language: en-US
From: Farhan Ali <alifm@linux.ibm.com>
In-Reply-To: <077596ba70202be0e43fdad3bb9b93d356cbe4ec.1763746079.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fs6KLg9GEKleGzJvCp6K6fCRZECaWYD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX5aCXAO1F2cPP
 uElBjQhxOAEeVYKYpPU3ckb9J9WKYdgjfRX+yP+lghOa+L/8Zg5tH6RCFS1HOErPhQaBL4lXmtv
 BXBFLz4ng4AtWDfEaFnG7Ycfs19Yn1+DG/CFD/ehAJBOTSha635k2L5o20fhKpR+VBRumJWCnRD
 DFGQvDtzBN6HZThvWycmCH5E+GSTq7qDJuCQGoCOHZP5aYwEYmMruNmkpbJONGxkheXJ3+psQag
 Ms6Ok9OwMcjIXKRx8M/SxBZfJDXF6QoPnupeG8/ys9FknWNKefZvZujlhmT0JnnSV3H1ixqkMx7
 LFZeLpu9tjJnBP+T8+cvN0NGGVR7ySAc/5j6Sl+3KSapZgmTe8KSS8YVK7CNXF+wZaQDpiDakf9
 qVyVFm+pJ8XPo5CgOFEgBzuFbfejeA==
X-Proofpoint-ORIG-GUID: _dRHeuwYC4Sk6IJN0TT_cCPjuBL6GKfp
X-Authority-Analysis: v=2.4 cv=XtL3+FF9 c=1 sm=1 tr=0 ts=6920b61a cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=RJpQON7kbKqcj-e44qYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Lukas,

Thanks for the update to documentation.

On 11/21/2025 9:31 AM, Lukas Wunner wrote:
> After recovering from a PCI error through reset, affected devices are in
> D0_uninitialized state and need to be brought into D0_active state by
> re-initializing their Config Space registers (PCIe r7.0 sec 5.3.1.1).
>
> To facilitate that, the PCI core provides pci_restore_state() and
> pci_save_state() helpers.  Document rules governing their usage.
>
> As Bjorn notes, so far no file in "Documentation/ includes anything about
> the idea of a driver using pci_save_state() to capture the state it wants
> to restore after an error", even though it is a common pattern in drivers.
> So that's obviously a gap that should be closed.
>
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/r/20251113161556.GA2284238@bhelgaas/
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>   Documentation/PCI/pci-error-recovery.rst | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
> index 5df481a..43bc4e3 100644
> --- a/Documentation/PCI/pci-error-recovery.rst
> +++ b/Documentation/PCI/pci-error-recovery.rst
> @@ -326,6 +326,21 @@ be recovered, there is nothing more that can be done;  the platform
>   will typically report a "permanent failure" in such a case.  The
>   device will be considered "dead" in this case.
>   
> +Drivers typically need to call pci_restore_state() after reset to
> +re-initialize the device's config space registers and thereby
> +bring it from D0\ :sub:`uninitialized` into D0\ :sub:`active` state
> +(PCIe r7.0 sec 5.3.1.1).  The PCI core invokes pci_save_state()
> +on enumeration after initializing config space to ensure that a
> +saved state is available for subsequent error recovery.
> +Drivers which modify config space on probe may need to invoke
> +pci_save_state() afterwards to record those changes for later
> +error recovery.  When going into system suspend, pci_save_state()
> +is called for every PCI device and that state will be restored
> +not only on resume, but also on any subsequent error recovery.

Nit: Should we clarify in the above sentence on what calls the 
pci_save_state() when going into suspend? My assumption is the 
pci_save_state() is called by the PCI core and not the drivers?

> +In the unlikely event that the saved state recorded on suspend
> +is unsuitable for error recovery, drivers should call
> +pci_save_state() on resume.
> +

What should the PCI core do if the saved state recorded is bad? should 
we continue to restore the device with the recorded bad state? On s390 
restoring the device with the bad state can break the device put into 
error again.

Thanks

Farhan



