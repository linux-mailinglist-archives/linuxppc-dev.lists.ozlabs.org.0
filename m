Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9BD5914AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 19:15:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M49Kq1pXXz3c2h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 03:15:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EK9ni+ZT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EK9ni+ZT;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M49K514n1z2xGG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 03:14:48 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CHBmTa017251;
	Fri, 12 Aug 2022 17:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=UAruYGVa4NvslEz2npXzYbxALbCA++AXRFo8FeFH4Hw=;
 b=EK9ni+ZTueZABWJ1xRiAqrDAeeXOa3xWddmkJN90KglKsrIwzzkUMPvuK//Mbm1a3gnB
 qZLfFnGdGFotcpK7Stw/qdb+KKQYTBw2/LvNmcX9FcDqGdwroRj4wrwwFx4vysovRXKk
 ASg+j7RRiz3zCew9W9FeGR2fTJsomE9ftCpNO0DdOeMX+iZOAGXz+n0YgXTYX+XJ/nqM
 Iq3hOK5AfucScfDrjgwgVKL4maXw5UeQs47OWb5RKQjMqlx8uKPiNvVU1EJcwfpCDd+0
 PlNxJ0iWgGb05h8sf530KTvOvMDv0GcK4nKmvgqIF4IMusxW2RNOKGIyJflIEhPnG/Ve Ng== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwu220232-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Aug 2022 17:14:40 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CH6qfE011956;
	Fri, 12 Aug 2022 17:14:39 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma05wdc.us.ibm.com with ESMTP id 3hvcmrnx5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Aug 2022 17:14:39 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27CHEcoe60424560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Aug 2022 17:14:38 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C33752805C;
	Fri, 12 Aug 2022 17:14:38 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EF9B28058;
	Fri, 12 Aug 2022 17:14:38 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri, 12 Aug 2022 17:14:38 +0000 (GMT)
Message-ID: <935988a4-c245-7cb1-4e14-bc99d39220a1@linux.ibm.com>
Date: Fri, 12 Aug 2022 13:14:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 3/6] x86/kexec: Carry forward IMA measurement log on
 kexec
Content-Language: en-US
To: Borislav Petkov <bp@suse.de>
References: <20220812164305.2056641-1-stefanb@linux.ibm.com>
 <20220812164305.2056641-4-stefanb@linux.ibm.com> <YvaJc7bQjz61Y1jj@zn.tnic>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <YvaJc7bQjz61Y1jj@zn.tnic>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TlIACgSDS3X7lmgztrMtjqsgpTFaGqT0
X-Proofpoint-GUID: TlIACgSDS3X7lmgztrMtjqsgpTFaGqT0
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208120045
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
Cc: devicetree@vger.kernel.org, Jonathan McDowell <noodles@fb.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/12/22 13:10, Borislav Petkov wrote:
> On Fri, Aug 12, 2022 at 12:43:02PM -0400, Stefan Berger wrote:
>> From: Jonathan McDowell <noodles@fb.com>
>>
>> On kexec file load, the Integrity Measurement Architecture (IMA)
>> subsystem may verify the IMA signature of the kernel and initramfs, and
>> measure it. The command line parameters passed to the kernel in the
>> kexec call may also be measured by IMA.
>>
>> A remote attestation service can verify a TPM quote based on the TPM
>> event log, the IMA measurement list and the TPM PCR data. This can
>> be achieved only if the IMA measurement log is carried over from the
>> current kernel to the next kernel across the kexec call.
>>
>> PowerPC and ARM64 both achieve this using device tree with a
>> "linux,ima-kexec-buffer" node. x86 platforms generally don't make use of
>> device tree, so use the setup_data mechanism to pass the IMA buffer to
>> the new kernel.
>>
>> Signed-off-by: Jonathan McDowell <noodles@fb.com>
>> Signed-off-by: Borislav Petkov <bp@suse.de>
>> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com> # IMA function definitions
>> Link: https://lore.kernel.org/r/YmKyvlF3my1yWTvK@noodles-fedora-PC23Y6EG
> 
> Is there any particular reason to keep sending a patch which is already
> upstream?
> 

Yes, so this series can be tested by krobot. I only based this series on 
5.19 so far, so if it's upstreamed since then it will go missing next 
time when I base  it on 5.20-rc1 or so.
