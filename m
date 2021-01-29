Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DA7308655
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 08:21:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRpgS4048zDsGm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 18:21:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XkrHwCxD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRpbb4Qv6zDsGv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 18:18:35 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10T720Md018805; Fri, 29 Jan 2021 02:18:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RinXw3iMefdYx6Wv/owfv3D0i8ahrnJJDx/blDihZmw=;
 b=XkrHwCxDzQvwbtzvp54XrYkVKVLwODkz4gKw7TdyfNbXEfEMwNm4dav+URa362eKca7n
 O45lObUvK+VhsKdpcF0G4c2IIy29Ytni3qIa2F7rvTZD52fp6geJ4IPvxwlPo/VoJSvw
 US3C6YHq6j+RFkRp85SeFW97dqVOkL++CQ8LWdVO82kGFGe3uRsw2RznwOlB/hMdUFkH
 /+sYjWiltIzwqqsxfuWvR+WSdcYhsm7tkzSYrE4hK+j4XOxrnUwRFME947PLVOR93uWi
 76oosjXKO6Hk0laXrlTtG8b1HxGm4ZtTSu4RETqpRg7psoMI+YotuJM4BaqPLgs3WEnF jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36cbjq2xt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 02:18:29 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10T721XM018881;
 Fri, 29 Jan 2021 02:18:29 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36cbjq2xsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 02:18:29 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10T7HHMi012667;
 Fri, 29 Jan 2021 07:18:27 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 368b2h5jw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 07:18:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10T7IOhY31719922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 07:18:24 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD9E7AE051;
 Fri, 29 Jan 2021 07:18:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CA14AE058;
 Fri, 29 Jan 2021 07:18:22 +0000 (GMT)
Received: from [9.199.35.112] (unknown [9.199.35.112])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jan 2021 07:18:22 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH] powerpc/sstep: Fix array out of bound warning
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
References: <20210115061620.692500-1-ravi.bangoria@linux.ibm.com>
 <20210128172043.GB117@DESKTOP-TDPLP67.localdomain>
Message-ID: <5e77ece2-0baa-9f3e-f4b4-e159fd5044ff@linux.ibm.com>
Date: Fri, 29 Jan 2021 12:48:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128172043.GB117@DESKTOP-TDPLP67.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-29_02:2021-01-28,
 2021-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290034
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, paulus@samba.org,
 jniethe5@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/28/21 10:50 PM, Naveen N. Rao wrote:
> On 2021/01/15 11:46AM, Ravi Bangoria wrote:
>> Compiling kernel with -Warray-bounds throws below warning:
>>
>>    In function 'emulate_vsx_store':
>>    warning: array subscript is above array bounds [-Warray-bounds]
>>    buf.d[2] = byterev_8(reg->d[1]);
>>    ~~~~~^~~
>>    buf.d[3] = byterev_8(reg->d[0]);
>>    ~~~~~^~~
>>
>> Fix it by converting local variable 'union vsx_reg buf' into an array.
>> Also consider function argument 'union vsx_reg *reg' as array instead
>> of pointer because callers are actually passing an array to it.
> 
> I think you should change the function prototype to reflect this.
> 
> However, while I agree with this change in principle, it looks to be a
> lot of code churn for a fairly narrow use. Perhaps we should just
> address the specific bug. Something like the below (not tested)?

Yes, this would serve the same purpose and it's more compact as well. Sent v2.

> 
> @@ -818,13 +818,15 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
>                          break;
>                  if (rev) {
>                          /* reverse 32 bytes */
> -                       buf.d[0] = byterev_8(reg->d[3]);
> -                       buf.d[1] = byterev_8(reg->d[2]);
> -                       buf.d[2] = byterev_8(reg->d[1]);
> -                       buf.d[3] = byterev_8(reg->d[0]);
> -                       reg = &buf;
> +                       union vsx_reg buf32[2];
> +                       buf32[0].d[0] = byterev_8(reg[1].d[1]);
> +                       buf32[0].d[1] = byterev_8(reg[1].d[0]);
> +                       buf32[1].d[0] = byterev_8(reg[0].d[1]);
> +                       buf32[1].d[1] = byterev_8(reg[0].d[0]);
> +                       memcpy(mem, buf32, size);
> +               } else {
> +                       memcpy(mem, reg, size);
>                  }
> -               memcpy(mem, reg, size);
>                  break;
>          case 16:
>                  /* stxv, stxvx, stxvl, stxvll */
> 
> 
> - Naveen
> 
