Return-Path: <linuxppc-dev+bounces-16949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNCcLmhJl2m2wQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 18:33:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B01613E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 18:33:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH0pY1KSvz30GV;
	Fri, 20 Feb 2026 04:33:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771522405;
	cv=none; b=JiTNCSN/4rDtn/8CTYb9iwd6Wz3MUt+bQB16Om/D5SgVVuxnxm0P55B0wCzvIwnpyIhAhFIqNIL4YQRa1hWwfcuNQfkRALR3WvUdTd17JFsE+vOeXA3K+BJsLrajnknIEoD/gAYxVScdxf8wnv6wNLa4LIXW2JrHPcoXO7Ewwp9nAVfhhGa3VYmJrh6OacxmTs+jXn7OLqoS05A/KOOALLEe2L6zLBj1J42/80YhO0hRJo4UM+nDdbBZ6LWRexYxIs/fFCDFun4/l2MA+1cLfzXT5XanpfkjBlkyOPVdh9Q+CbhCUgSybakz2zOZrrMU+2hrmJ2W7W2XYDISgWFVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771522405; c=relaxed/relaxed;
	bh=PgQSMLeDkj5nSmnmR4kutFgBv2sfucUa/iJg0BU1oXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5DBawCxtAVROjzWPnG8AwyfhudnaE8OIJDGUd1hF/HNwySMCpaFHlquaPvhpfPCXoKSmqfTECfwNpcIIFm+A6UOlWKbJ2Qg3QqyEEgTxZY/skchlwya1QExGQSup2yB+clhsWMfsGGlFMZjsbTIjq4PwYTiznKwGTe/Tio9mq4fSUz5M8i2jAPg3PIJC8PdQZIbqJEPnDPTlkmKaP4JEZPB1Yj3XJTyn3bA+YZmj5sJ/Cb8po0EibPF8uyyYOgwDeQMkBBBOzKRpv9HgtQKCfiL7wkrBMwmD6XSOM57lRJsw5REFB6KNUU+ptklvvYxRfoUGPG9IAwrdrz0Up60Ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CDvugY/I; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CDvugY/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH0pX0W0kz2xlj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 04:33:23 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J9A3A41295387;
	Thu, 19 Feb 2026 17:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PgQSML
	eDkj5nSmnmR4kutFgBv2sfucUa/iJg0BU1oXc=; b=CDvugY/IpG9Fpc2CoDWoeV
	OrA4sLnJhUr+sGpEvpL5zwl7BDrtoKLjJP75ezoKdsk9i2VlkaJDVog3jqMXVD7e
	IdccgP1tYora2qZGPyJI+Y5p0ZvJsrZAtRpn5bdOEFP46vsF/6XlJCiRt1erR/6m
	yGHRF8/oFXarCdItEeUloRqH5ENALIVEMVgK8O6ECY2Du/jLCmtJxsxmkXyu4HiC
	ZKa0oUWEpxiqYbU+aDcP9v0zjkawzROm7N8/eDxWFVAUeA6tjDhFacD52rwOjHsR
	OH7AArUevVJzSHS16M5vrY7cRcmBSHA1Z90+J6RfTbb2SEn4lnk1d18Z1lj+Nt2g
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj64e10c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 17:33:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61JDYesx001395;
	Thu, 19 Feb 2026 17:33:07 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb2bn4nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 17:33:07 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61JHX520852524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Feb 2026 17:33:05 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C1DF58056;
	Thu, 19 Feb 2026 17:33:05 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6398458052;
	Thu, 19 Feb 2026 17:33:00 +0000 (GMT)
Received: from [9.111.6.127] (unknown [9.111.6.127])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Feb 2026 17:32:59 +0000 (GMT)
Message-ID: <20554bdb-68b4-4ff2-96de-af6c3a434290@linux.ibm.com>
Date: Thu, 19 Feb 2026 23:02:57 +0530
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
Subject: Re: [PATCH] powerpc/pci: Initialize msi_addr_mask for OF-created PCI
 devices
To: Vivian Wang <wangruikang@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org,
        linux-pci@vger.kernel.org
Cc: tglx@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, gjoyce@ibm.com
References: <20260217174537.1154686-1-nilay@linux.ibm.com>
 <6f02c046-1ff6-4086-8fd0-a276eabece10@iscas.ac.cn>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <6f02c046-1ff6-4086-8fd0-a276eabece10@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: g68hyux_Y7EgdCHBX6K4888FqFyiH6X8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE1NSBTYWx0ZWRfXzop2EIr17vje
 qbbY7d1VVSBWxiqAUY03d3j9LO8BeuPlyfrVd+x0eOEOFO7jB9RuZdpJJeU5N+AoBRtsIoeVKWu
 BY0vrEDFjE597t+u3x8te32IU18/j4AOrRGymB57Lbp/hSA+B8OuNdthAyhMB4eb/PMmJ4X9+Eg
 074g3kxg2r7T/0OWDwUa6mhBswf+N4+8QNjh2svjdKCfwCzzDECQpNy8bYyWuuQl+yyDuZc+PCd
 0A6U7eMxjTW7AKmlozCM+iXvV0b7E0OJlojKzzHgMRzh1QAAdpHzgRkpnxkOfcfHxeTMSCxZKnM
 Xw6cTlAb445b9XFgS93Lj0gkuGanK0R2hQn2zs/on6Jvvg4ZIb6kaK/Ll37WnvGh8zHXd05Psq8
 CppNhlt4yPuvUdTllkEuGcoGx6uBwPo9KFbo56MvqEoSIGH052M8O8GcKhpceQ0e5CGSsNTgSvH
 2sdatbOFu5pRZzRu7sQ==
X-Proofpoint-GUID: NMa6vD6-26Rr1YT02QhRe_z9t9mZU6Az
X-Authority-Analysis: v=2.4 cv=U+mfzOru c=1 sm=1 tr=0 ts=69974954 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=3Jw2BVf9RI64lIZzIOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190155
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16949-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,ibm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wangruikang@iscas.ac.cn,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:tglx@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gjoyce@ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nilay@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nilay@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CF3B01613E5
X-Rspamd-Action: no action



On 2/19/26 12:52 PM, Vivian Wang wrote:
> On 2/18/26 01:45, Nilay Shroff wrote:
> 
>> Recent changes [1] replaced the use of no_64bit_msi with msi_addr_mask.
>> As a result, msi_addr_mask is now expected to be initialized to
>> DMA_BIT_MASK(64) when a pci_dev is set up. However, this initialization
>> was missed on powerpc due to differences in the device initialization
>> path compared to other architectures. Due to this, now pci device probe
>> method fails on powerpc system.
>>
>> On powerpc systems, struct pci_dev instances are created from device
>> tree nodes via of_create_pci_dev(). Because msi_addr_mask was not
>> initialized there, it remained zero. Later, during MSI setup,
>> msi_verify_entries() validates the programmed MSI address against
>> pdev->msi_addr_mask. Since the mask was not set correctly, the
>> validation fails, causing PCI driver probe failures for devices on
>> powerpc systems.
> 
> Thanks for catching this. I had naively assumed that pci_setup_device()
> was the right place for adding this initialization, and didn't think of
> other possibilities.
> 
> I grep'd for pci_alloc_dev() and found these uses:
> 
>   * of_create_pci_dev() in arch/powerpc/kernel/pci_of_scan.c (this patch)
>   * of_create_pci_dev() in arch/sparc/kernel/pci.c (*same missed init*)
>   * drivers/char/agp/{alpha,parisc}-agp.c (fake pci_dev, should be fine)
>   * drivers/scsi/megaraid.c (copying from existing pci_dev, should be fine)
> 
> So, while we're at it, can we fix the SPARC one as well in v2? The code
> seems similar to what we do for powerpc.

Yes I can do that but I don't have access to SPARC machine so I can't validate 
it. However I'd add SPARC maintainers and mailing list for review and so someone
might help.

> 
>> Initialize pdev->msi_addr_mask to DMA_BIT_MASK(64) in
>> of_create_pci_dev() so that MSI address validation succeeds and device
>> probe works as expected.
>>
>> [1] https://lore.kernel.org/all/20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn/
> 
> Nit: Link seems redundant given the Fixes tag below.
> 
Ack

Thanks,
--Nilay


