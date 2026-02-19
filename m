Return-Path: <linuxppc-dev+bounces-16950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KMPAFdKl2m2wQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 18:37:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069C7161491
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 18:37:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH0v62HSqz30GV;
	Fri, 20 Feb 2026 04:37:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771522642;
	cv=none; b=Nz74AGpD1Ssd3qWthGeDPM9U8Xf3wnXX+E3Ll32XR4I0BnrCOTJnRRqtbi2yoWU+FBco2iqbAxZuBBQT236Kd6umdRMI152MQedzQqe9VCKtGDDkQkwZX1fEuPJPck2mIYzAlszsX87QUF+r3ZPGCNn+R76A06TuZHl4gDjHDhLxwqow6s554K25okBYBPWD8acNhpB04kePIqZg7oRYVdOmVYFQGGhDzWu4v+OgzjFH6WDldJJfSmDZGBeOah4RmuzZP7vWuV67mweFX/IDeMdFCJeb9GwYu4eCnbQHl4f5CAtaGjEgxpMfNrH5Bkl2Zba6kL+NZYbMpNjoMMrPow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771522642; c=relaxed/relaxed;
	bh=KzUa/DAODjPXOJZk+zAZxaDHAy0uF4q50JpQeGI7vUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WyGvidQgKYEBqW5kvsGADCodyQUgNi9sa3+9D98rw8k3GBeRDc/DM/yFEZr1yFmC4PfpIK9cG2T2PMcYSSV0PNA1yJwrn+Yw0IPOkczSIptt2dsvqlAe2bsiHTiBSFUkfn1w2XLYgLq3E9c7eMjYeu78s9CMFcQdJPbm3hICB/e9IlQKOQR2y6aLx0BQ4ce3bQqZXboY75BLqG9Pz0S1RpLbeY0bvqRJqF18/kNtFyPFCEyv3YEzeZmBloh9+g+jguq3+eKF2s94DlSwBvUM2KVTpC2LUdkphb4nexjI28nPsO9Td16JM3VGSbTnyazrGoQX/vaAUSle83oOUtsIiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cs7eIaIO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cs7eIaIO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH0v53Zgcz2xlj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 04:37:20 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J99tXr1600918;
	Thu, 19 Feb 2026 17:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KzUa/D
	AODjPXOJZk+zAZxaDHAy0uF4q50JpQeGI7vUs=; b=Cs7eIaIOR6mpPx6OX2Wf4/
	rStp2r3A/nRexuR9jl8YKNfmCFmoFTxMgDB2tsSSWu7Tk60Psz31F+HJsQoCncv2
	2fcThhrONaaaTGgct0o/welIJO9zsrPxMFRzCzjysICLQf7v+8F7Xy4Tz4KUnyP/
	nc2KePRIV6QwWqduyHY89PGjV0NBQhTsKqFdW935Du+oPva5obrcDKOPtt/TQG3s
	0EGtrn9CjXS5rc+NdFMQhK79JSOXD0S2q1Vvp82KnI6GWUVbpwo7PYTqZMYWOOg5
	OiZZXlU1XV45/jf2cOF4ELDJPVc5LVUOsCOQ9XsM9C8zZkcfr5E2ZjyRShcdVi3A
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cajcr7bca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 17:37:05 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61JHZRq1024327;
	Thu, 19 Feb 2026 17:37:04 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb45d699-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 17:37:04 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61JHb3mN14680590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Feb 2026 17:37:03 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B94AF58062;
	Thu, 19 Feb 2026 17:37:03 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE5F458052;
	Thu, 19 Feb 2026 17:36:56 +0000 (GMT)
Received: from [9.111.6.127] (unknown [9.111.6.127])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Feb 2026 17:36:56 +0000 (GMT)
Message-ID: <4eaa7872-6bae-4419-9281-203c04f1996d@linux.ibm.com>
Date: Thu, 19 Feb 2026 23:06:54 +0530
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
To: Bjorn Helgaas <helgaas@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        wangruikang@iscas.ac.cn, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, gjoyce@ibm.com,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org
References: <20260219173149.GA3486808@bhelgaas>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20260219173149.GA3486808@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: i2oEi-oEaCIUdP7mOfcn8jNXprvsrnrx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE1NSBTYWx0ZWRfX6fztuDLfQP78
 bs3iMVzUMjYjN4HReCzlptyDs1e/aVd5gc28eUa3+0C2e1fLhqAb6j5XVUcJ1S1avz9ojUvbIBj
 tjkOk+P7R3piB88A/3A1AIPjRdb92BdQQ34C4asuNzbUhmqB7K8O1AbimaSnriwRjj5kanTjBtj
 jP3rZTrbdtCl1Tg1dRoocVhJ7uRQGzWvEPkfmAUIgG042ydXE2JYTGKXMp35dpN/USEqr5n4uui
 ZdnSXYcZkDqbRlXNtr809t0+tSMD9Z/Aa/daO6pvSuFfONTLf3pyAMqKmQNFvqNhwFCtQDWR1/X
 LIQiEL2f7q1uhFWG5ReA/9GqUazbW0/gBrevjUxe8k2pYbjY3JE8XaknSh5cVkqjYVf+YOmqypM
 RGH8ABSvkly4bWHGRuLRS5fG/izUxaNvGDAIAVbppjSynUyMjREnZ7G8bkKFqsPDST1Fdnz7W0n
 G52t2XnceWl9Dhwe/2A==
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=69974a42 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=3Jw2BVf9RI64lIZzIOoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xgNA2-reBvL-KTMEoudIcSE0TvYu7ral
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190155
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16950-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:tglx@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:wangruikang@iscas.ac.cn,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gjoyce@ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nilay@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,iscas.ac.cn,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,ibm.com,davemloft.net,gaisler.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[nilay@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 069C7161491
X-Rspamd-Action: no action



On 2/19/26 11:01 PM, Bjorn Helgaas wrote:
> [+cc sparc folks, PCI enumeration via OF likely broken]
> 
> On Tue, Feb 17, 2026 at 11:15:26PM +0530, Nilay Shroff wrote:
>> Recent changes [1] replaced the use of no_64bit_msi with msi_addr_mask.
>> As a result, msi_addr_mask is now expected to be initialized to
>> DMA_BIT_MASK(64) when a pci_dev is set up. However, this initialization
>> was missed on powerpc due to differences in the device initialization
>> path compared to other architectures. Due to this, now pci device probe
>> method fails on powerpc system.
> 
> s/pci/PCI/ to match below.
Ack
> 
>> On powerpc systems, struct pci_dev instances are created from device
>> tree nodes via of_create_pci_dev(). Because msi_addr_mask was not
>> initialized there, it remained zero. Later, during MSI setup,
>> msi_verify_entries() validates the programmed MSI address against
>> pdev->msi_addr_mask. Since the mask was not set correctly, the
>> validation fails, causing PCI driver probe failures for devices on
>> powerpc systems.
>>
>> Initialize pdev->msi_addr_mask to DMA_BIT_MASK(64) in
>> of_create_pci_dev() so that MSI address validation succeeds and device
>> probe works as expected.
>>
>> [1] https://lore.kernel.org/all/20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn/
>>
>> Fixes: 386ced19e9a3 ("PCI/MSI: Convert the boolean no_64bit_msi flag to a DMA address mask")
>> Signed-off-by: Nilay Shroff <nilay@linux.ibm.com>
> 
> Looks like this and a similar sparc fix need to be in v7.0.  Would be
> great if they could make v7.0-rc1 (Sunday), but that's pretty close.
> 
> Thomas, you merged 386ced19e9a3.  I'm happy to merge the powerpc and
> sparc fixes, given acks from you and the powerpc & sparc folks, or
> feel free to take them yourself.
> 
>> ---
>>  arch/powerpc/kernel/pci_of_scan.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
>> index 756043dd06e9..26ec97ce6b40 100644
>> --- a/arch/powerpc/kernel/pci_of_scan.c
>> +++ b/arch/powerpc/kernel/pci_of_scan.c
>> @@ -211,6 +211,12 @@ struct pci_dev *of_create_pci_dev(struct device_node *node,
>>  	dev->current_state = PCI_UNKNOWN;	/* unknown power state */
>>  	dev->error_state = pci_channel_io_normal;
>>  	dev->dma_mask = 0xffffffff;
> 
> It's typical to add a blank line between the code above and the
> comment below, as was done in 386ced19e9a3.

Okay will fix this in v2.
> 
>> +	/*
>> +	 * Assume 64-bit addresses for MSI initially. Will be changed to 32-bit
>> +	 * if MSI (rather than MSI-X) capability does not have
>> +	 * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
>> +	 */
>> +	dev->msi_addr_mask = DMA_BIT_MASK(64);
>>  
>>  	/* Early fixups, before probing the BARs */
>>  	pci_fixup_device(pci_fixup_early, dev);
>> -- 
>> 2.52.0
>>

Thanks,
--Nilay



