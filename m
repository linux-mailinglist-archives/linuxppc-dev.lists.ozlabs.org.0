Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EF73ECEB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 08:45:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp4Rg0STvz3bWS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 16:45:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WS3s9lNS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WS3s9lNS; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp4Qv1wN0z2ymN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 16:44:54 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17G6YNWf092102; Mon, 16 Aug 2021 02:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=pKEqbxofS2k5SBaY0QC5mg41fhGw6/kfeb/V+Oy7FbQ=;
 b=WS3s9lNST898qyYSCv82/Q3OQfQbQ3+Zd3cr4uAvGKYIPqySEFcSFTIZINYEa+nUFg0i
 B0FyZXjImx0Fu+ZXc4ae3rhLMIUI/5PsMdMb9pPIsUSQDU645ZR+EpIEsGLvdfP5YWH6
 lDk0lF9+JYCIANvlrNrilUyS4mtx+CGD3sHSJhJqJm3Z0dPkFAEDgYZaRwARJESsJdUg
 xrrPCjI9LNslDUVY316DkbQh700UBt1s81UH7WpYUU0QBhxhE5cRyVH0oJ8o49VLSxlO
 fEsKu93Wxk+XNtAOZ1Kt2+hnaGxtvpWjho2pgUj5zkTyGYF19PcK/tdmx2MSt9GaIXCm og== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aeu4bw7dn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 02:44:42 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17G6gqrG004727;
 Mon, 16 Aug 2021 06:44:41 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 3ae5fawu00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 06:44:41 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17G6ieKP42598680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 06:44:40 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1712DAE06D;
 Mon, 16 Aug 2021 06:44:40 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5B17AE067;
 Mon, 16 Aug 2021 06:44:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.38.67])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 16 Aug 2021 06:44:37 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] powerpc/perf: Return regs->nip as instruction
 pointer value when SIAR is 0
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210813082450.429320-1-kjain@linux.ibm.com>
 <20210813082450.429320-2-kjain@linux.ibm.com>
 <c6110aa1-90e2-77aa-1ab5-355975037227@csgroup.eu>
 <871r6wmc16.fsf@mpe.ellerman.id.au>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <0068dbc4-fa4b-ce98-9e89-3f02f939720d@linux.ibm.com>
Date: Mon, 16 Aug 2021 12:14:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <871r6wmc16.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IsmklTSOjq7i-isVtHB1Q2G880Gf32Pr
X-Proofpoint-GUID: IsmklTSOjq7i-isVtHB1Q2G880Gf32Pr
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_02:2021-08-13,
 2021-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160043
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/14/21 6:14 PM, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 13/08/2021 à 10:24, Kajol Jain a écrit :
>>> Incase of random sampling, there can be scenarios where SIAR is not
>>> latching sample address and results in 0 value. Since current code
>>> directly returning the siar value, we could see multiple instruction
>>> pointer values as 0 in perf report.
> 
> Can you please give more detail on that? What scenarios? On what CPUs?
> 

Hi Michael,
    Sure I will update these details in my next patch-set.

>>> Patch resolves this issue by adding a ternary condition to return
>>> regs->nip incase SIAR is 0.
>>
>> Your description seems rather similar to 
>> https://github.com/linuxppc/linux/commit/2ca13a4cc56c920a6c9fc8ee45d02bccacd7f46c
>>
>> Does it mean that the problem occurs on more than the power10 DD1 ?
>>
>> In that case, can the solution be common instead of doing something for power10 DD1 and something 
>> for others ?
> 
> Agreed.
> 
> This change would seem to make that P10 DD1 logic superfluous.
> 
> Also we already have a fallback to regs->nip in the else case of the if,
> so we should just use that rather than adding a ternary condition.
> 
> eg.
> 
> 	if (use_siar && siar_valid(regs) && siar)
> 		return siar + perf_ip_adjust(regs);
> 	else if (use_siar)
> 		return 0;		// no valid instruction pointer
> 	else
> 		return regs->nip;
> 
> 
> I'm also not sure why we have that return 0 case, I can't think of why
> we'd ever want to do that rather than using nip. So maybe we should do
> another patch to drop that case.

Yeah make sense. I will remove return 0 case in my next version.

Thanks,
Kajol Jain
> 
> cheers
> 
