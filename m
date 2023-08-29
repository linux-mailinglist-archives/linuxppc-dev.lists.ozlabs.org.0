Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE0B78BD11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 04:55:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJjaitgE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZX9436jmz3bN9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 12:55:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJjaitgE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=quic_eberman@quicinc.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZX884L3Sz2yVN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 12:54:30 +1000 (AEST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37T2NYix025517;
	Tue, 29 Aug 2023 02:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cKhR/hXI9TfQVMxJKBEpbKXuPkzD/6c5MCP4RSxTLCw=;
 b=aJjaitgE+MNEcv6pStestGm3ovNl2PCHIDgAS0ezUu1PJhWjiVAJkaWbVdyPPMxXqeuv
 J8TGIrU+0GAuxQX7eIIapM8gHoJ/i/+3Lg86ilvRhCdks0OYIgvIXDu+m1F9qvPig1n9
 qmaPZSttzxHapTHsQhqj+8ez1Mh6AU41gyUZuYSjEw/M6ix2alFl2clZcq2fzw9TRV8m
 T3VdqIsiJZXsGkuNzRqG8q7Wyez0X9VKsY1Jq2v4Bt+32v5og2RtpbTDAMPn6awuDbIF
 bXfmOhB1JZWgA6QKAkE/ndq/tn0aSh7gBLV6EKEnJxvPb+roMqUGXj3Ar6OaLs3F+VbY DQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss7mer1wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 02:53:30 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37T2rTft030498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 02:53:29 GMT
Received: from [10.110.29.109] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 28 Aug
 2023 19:53:26 -0700
Message-ID: <253965df-6d80-bbfd-ab01-f9e69b274bf3@quicinc.com>
Date: Mon, 28 Aug 2023 19:53:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
Content-Language: en-US
To: Ackerley Tng <ackerleytng@google.com>,
        Sean Christopherson
	<seanjc@google.com>
References: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
From: Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j_S7WCFYaAduXo62GgrPKoDWB6xd2scP
X-Proofpoint-GUID: j_S7WCFYaAduXo62GgrPKoDWB6xd2scP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_20,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308290024
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/28/2023 3:56 PM, Ackerley Tng wrote:
 > 1. Since the physical memory's representation is the inode and should be
 >     coupled to the virtual machine (as a concept, not struct kvm), should
 >     the binding/coupling be with the file, or the inode?
 >

I've been working on Gunyah's implementation in parallel (not yet posted 
anywhere). Thus far, I've coupled the virtual machine struct to the 
struct file so that I can increment the file refcount when mapping the 
gmem to the virtual machine.

 > 2. Should struct kvm still be bound to the file/inode at gmem file
 >     creation time, since
 >
 >     + struct kvm isn't a good representation of a "virtual machine"
 >     + we currently don't have anything that really represents a "virtual
 >       machine" without hardware support
 >
 >
 > I'd also like to bring up another userspace use case that Google has:
 > re-use of gmem files for rebooting guests when the KVM instance is
 > destroyed and rebuilt.
 >
 > When rebooting a VM there are some steps relating to gmem that are
 > performance-sensitive:
 >
 > a.      Zeroing pages from the old VM when we close a gmem file/inode
 > b. Deallocating pages from the old VM when we close a gmem file/inode
 > c.   Allocating pages for the new VM from the new gmem file/inode
 > d.      Zeroing pages on page allocation
 >
 > We want to reuse the gmem file to save re-allocating pages (b. and c.),
 > and one of the two page zeroing allocations (a. or d.).
 >
 > Binding the gmem file to a struct kvm on creation time means the gmem
 > file can't be reused with another VM on reboot. Also, host userspace is
 > forced to close the gmem file to allow the old VM to be freed.
 >
 > For other places where files pin KVM, like the stats fd pinning vCPUs, I
 > guess that matters less since there isn't much of a penalty to close and
 > re-open the stats fd.

I had a 3rd question that's related to how to wire the gmem up to a 
virtual machine:

I learned of a usecase to implement copy-on-write for gmem. The premise 
would be to have a "golden copy" of the memory that multiple virtual 
machines can map in as RO. If a virtual machine tries to write to those 
pages, they get copied to a virtual machine-specific page that isn't 
shared with other VMs. How do we track those pages?

Thanks,
Elliot
