Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC17E48AFBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 15:41:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYD065P1cz3bbW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 01:41:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KKPr4f/f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KKPr4f/f; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYCyv5fGgz30Ll
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 01:40:07 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BCvdWB017467; 
 Tue, 11 Jan 2022 14:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=xMcSPmVEaL+k0jKh/+ZfWLpH/NUdagkI7qfXcLR8/AM=;
 b=KKPr4f/fVY/G0cm+nzp5A/N1n9lYan4wSXlBaORHlxTX/7f9Xd6fpGk+OVkS22uzOdrT
 yC/FU5EmErSGObKQw1RnqsA+S6Ha9ijnHcrYq4xyvmNStaVqj7IrYONe4cjVBYZODUZT
 czuVlre6DFf7zyDA6orK6emPjenHqN4P/YoEiBKMxZooymT6kyJvmpLdI3+5tSqrBWRD
 hHQKQ5uK5drCbewa60IDwhJWcTABhiIoUHcdrV2IcVLox2Vk+44+yDOIqIhVHmUISaoX
 30GC6xuQYtCPy2G8rnZtT+K66vLlepS94H8Z99/8M450StCfsAbAietXMoEh5xhhmMvv 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhabytfh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:40:02 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20BDsTFg022744;
 Tue, 11 Jan 2022 14:40:01 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhabytfgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:40:01 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20BENhai032074;
 Tue, 11 Jan 2022 14:40:00 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 3df28adhuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:40:00 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20BEdxsB23790060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 14:39:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F5BB112071;
 Tue, 11 Jan 2022 14:39:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ACEB11208B;
 Tue, 11 Jan 2022 14:39:58 +0000 (GMT)
Received: from localhost (unknown [9.163.2.124])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 11 Jan 2022 14:39:57 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v3 5/6] KVM: PPC: mmio: Return to guest after emulation
 failure
In-Reply-To: <1641870717.tcavxuxzck.astroid@bobo.none>
References: <20220107210012.4091153-1-farosas@linux.ibm.com>
 <20220107210012.4091153-6-farosas@linux.ibm.com>
 <1641799578.6dxlxsaaos.astroid@bobo.none>
 <bf61f021-15b3-7093-f991-cdcda93d059d@ozlabs.ru>
 <1641870717.tcavxuxzck.astroid@bobo.none>
Date: Tue, 11 Jan 2022 11:39:54 -0300
Message-ID: <87o84i8hfp.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4aIHZu7pS3C4UlnyU-8_50atAB74U5TT
X-Proofpoint-ORIG-GUID: ZDkzGYpAM42FhgcEiI2lIBbPz2MPkJgx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201110087
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Excerpts from Alexey Kardashevskiy's message of January 11, 2022 9:51 am:
>> 
>> 
>> On 1/10/22 18:36, Nicholas Piggin wrote:
>>> Excerpts from Fabiano Rosas's message of January 8, 2022 7:00 am:
>>>> If MMIO emulation fails we don't want to crash the whole guest by
>>>> returning to userspace.
>>>>
>>>> The original commit bbf45ba57eae ("KVM: ppc: PowerPC 440 KVM
>>>> implementation") added a todo:
>>>>
>>>>    /* XXX Deliver Program interrupt to guest. */
>>>>
>>>> and later the commit d69614a295ae ("KVM: PPC: Separate loadstore
>>>> emulation from priv emulation") added the Program interrupt injection
>>>> but in another file, so I'm assuming it was missed that this block
>>>> needed to be altered.
>>>>
>>>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>>>> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>> ---
>>>>   arch/powerpc/kvm/powerpc.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>>>> index 6daeea4a7de1..56b0faab7a5f 100644
>>>> --- a/arch/powerpc/kvm/powerpc.c
>>>> +++ b/arch/powerpc/kvm/powerpc.c
>>>> @@ -309,7 +309,7 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
>>>>   		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
>>>>   		kvmppc_core_queue_program(vcpu, 0);
>>>>   		pr_info("%s: emulation failed (%08x)\n", __func__, last_inst);
>>>> -		r = RESUME_HOST;
>>>> +		r = RESUME_GUEST;
>>> 
>>> So at this point can the pr_info just go away?
>>> 
>>> I wonder if this shouldn't be a DSI rather than a program check.
>>> DSI with DSISR[37] looks a bit more expected. Not that Linux
>>> probably does much with it but at least it would give a SIGBUS
>>> rather than SIGILL.
>> 
>> It does not like it is more expected to me, it is not about wrong memory 
>> attributes, it is the instruction itself which cannot execute.
>
> It's not an illegal instruction though, it can't execute because of the
> nature of the data / address it is operating on. That says d-side to me.
>
> DSISR[37] isn't perfect but if you squint it's not terrible. It's about
> certain instructions that have restrictions operating on other than
> normal cacheable mappings.

I think I agree with Nick on this one. At least the DSISR gives _some_
information while the Program is maybe too generic. I would probably be
staring at the opcode wondering what is wrong with it.
