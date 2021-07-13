Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F41D23C7238
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 16:31:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPNNp67lTz3bX8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 00:31:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HFiInlen;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HFiInlen; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPNNF5txxz2yP4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 00:30:53 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DEUYU8093242; Tue, 13 Jul 2021 10:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=n+n2TYUdeoc2QCrVdHF4l+/LdFU3J2bR/2Pq9aDke0s=;
 b=HFiInlen4DpXpGZNL7F8tgb776eBVBxxB10RDt9n2nOQCJ7T0WqeHKMpNcoq246CuM0o
 ql9BYSICOrqYJpHwsMdKZgC1/4tZGFsC7TcMpKndcb9LtVX642D7xIUMqiu277OjQQ+E
 VYVuTelgXCjrEdhGc9Lbdlea+4eIyQOTDpQtDrjg2pCfdSN/EKIMfZOIhm9rUfVMTeot
 7U6GPbxQoXzoNLKGwZVrIVIW9bkIZOQtRGmGUSbgAOEv3or58+T2kGsYbNxL0uGP0Ns1
 E45FehS/4wyZYLFsPsoN+zWIJshi1cUdNeMtR9weNLcUt2xMziHA2mi2iev0QfptwMsl qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrmcv4u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 10:30:46 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16DEUeod095305;
 Tue, 13 Jul 2021 10:30:45 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrmcv4qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 10:30:45 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16DEIA2H029799;
 Tue, 13 Jul 2021 14:30:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 39q368gq14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 14:30:42 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16DEUdT624379898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 14:30:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A1C0A407A;
 Tue, 13 Jul 2021 14:30:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ADD7A4069;
 Tue, 13 Jul 2021 14:30:38 +0000 (GMT)
Received: from [9.77.192.189] (unknown [9.77.192.189])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 14:30:38 +0000 (GMT)
Subject: Re: [PATCH v5 0/6] Add support for FORM2 associativity
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <ad91ae4e-7c2d-26d6-1a6e-88f2c365fade@gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <d0ef189e-1558-eac3-5fda-3c55eb27860c@linux.ibm.com>
Date: Tue, 13 Jul 2021 20:00:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ad91ae4e-7c2d-26d6-1a6e-88f2c365fade@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5BnxKJSS8qSitvQ7ZHeFkvIfacuM8N8l
X-Proofpoint-GUID: 1QH2fH99dgy_nLFztrmc1dqy1PCKpM3_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_05:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130090
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/13/21 7:57 PM, Daniel Henrique Barboza wrote:
> Aneesh,
> 
> This series compiles with a configuration made with "pseries_le_defconfig"
> but fails with a config based on an existing RHEL8 config.
> 
> The reason, which is hinted in the robot replies in patch 4, is that you 
> defined
> a "__vphn_get_associativity" inside a #ifdef CONFIG_PPC_SPLPAR guard but 
> didn't
> define how the function would behave without the config, and you ended up
> using the function elsewhere.
> 
> This fixes the compilation but I'm not sure if this is what you intended
> for this function:
> 
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index c68846fc9550..6e8551d16b7a 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -680,6 +680,11 @@ static int vphn_get_nid(long lcpu)
> 
>   }
>   #else
> +static int __vphn_get_associativity(long lcpu, __be32 *associativity)
> +{
> +       return -1;
> +}
> +
>   static int vphn_get_nid(long unused)
>   {
>          return NUMA_NO_NODE;
> 
> 
> I'll post a new version of the QEMU FORM2 changes using these patches as 
> is (with
> the above fixup), but I guess you'll want to post a v6.
> 

kernel test robot did report that earlier and I have that fixed in my 
local tree. I haven't posted v6 yet because I want to close the review 
on the approach with v5 patchset.

-aneesh
