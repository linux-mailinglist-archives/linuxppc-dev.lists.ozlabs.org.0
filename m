Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD7C3F1325
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 08:16:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gqvg06tfQz3cQ8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 16:16:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SqMel5pT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SqMel5pT; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqvfH5Cf3z2yyS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 16:16:07 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17J652Le057146; Thu, 19 Aug 2021 02:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6TbvAzD2x08Z6Kv2ojMrdJe9dumJ+/MAiXzQa5vjj8Q=;
 b=SqMel5pTYtKqz8Y4VFW7F4xkTubLjrS9j8Lhiw/mx0Egu1ZhWbF4TZlddwKS/bQFwOQo
 0K0nED9FBbi1zx+Fe6LGtHt4UeKokR4MndvzC9I4irq4Yxs/Wd/uOrvZLgCrscJHPM0e
 r3vMUcxUvOkhK5Eoj1fxfwErTIvNEp1g4TM8YM/qLYBkQT8BUgkcLQRvRfQT5mrWXRrv
 fgtBEFyKLD0RLaZW+OoG3Ju4TlotNvvECyeQ8LE2intxAY7pMxecOsu+GmGgZBWCtDI6
 rreiev1h1bn3ZQ2gj7yUUZeJ8lwiXMMpqRhOT2X2hzEcvspO+jYD0E73NPilullRId3i mA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ahhqk094v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 02:16:01 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17J6DFAg013317;
 Thu, 19 Aug 2021 06:15:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3ae53hys9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 06:15:59 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17J6CRUb44106194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 06:12:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5227A52052;
 Thu, 19 Aug 2021 06:15:56 +0000 (GMT)
Received: from Nageswaras-MacBook-Pro-2.local (unknown [9.43.70.163])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 3B37552054;
 Thu, 19 Aug 2021 06:15:53 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf/hv-gpci: Fix the logic to compute counter
 value from the hcall result buffer.
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
References: <20210813082158.429023-1-kjain@linux.ibm.com>
From: Nageswara Sastry <rnsastry@linux.ibm.com>
Message-ID: <742bfbd3-6390-280b-39d0-1d849757ab2c@linux.ibm.com>
Date: Thu, 19 Aug 2021 11:45:51 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210813082158.429023-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JjEsUJaTRL9afso_TN7SWRkwQ7XXPC86
X-Proofpoint-ORIG-GUID: JjEsUJaTRL9afso_TN7SWRkwQ7XXPC86
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_02:2021-08-17,
 2021-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108190030
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
Cc: suka@us.ibm.com, maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/08/21 1:51 pm, Kajol Jain wrote:
> H_GetPerformanceCounterInfo (0xF080) hcall returns the counter data in the
> result buffer. Result buffer has specific format defined in the PAPR
> specification. One of the field is counter offset and width of the counter
> data returned.
> 
> Counter data are returned in a unsigned char array. To
> get the final counter data, these values should be left shifted
> byte at a time. But commit 220a0c609ad17 ("powerpc/perf: Add support
> for the hv gpci (get performance counter info) interface") made the
> shifting bitwise. Because of this, hcall counters values could end up
> in lower side, which messes the counter prev vs now calculation. This
> lead to huge counter value reporting
> 
> [command]#: perf stat -e hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>             -C 0 -I 1000
>          time             counts unit events
>       1.000078854 18,446,744,073,709,535,232      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>       2.000213293                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>       3.000320107                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>       4.000428392                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>       5.000537864                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>       6.000649087                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>       7.000760312                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>       8.000865218             16,448      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>       9.000978985 18,446,744,073,709,535,232      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>      10.001088891             16,384      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>      11.001201435                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
>      12.001307937 18,446,744,073,709,535,232      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
> 
> Patch here fixes the shifting logic to make is byte-wise with which no more the issue seen.
> 
> Fixes: e4f226b1580b3 ("powerpc/perf/hv-gpci: Increase request buffer size")
> Reported-by: Nageswara R Sastry<rnsastry@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Tested-by: Nageswara R Sastry<rnsastry@linux.ibm.com>

Now not seeing huge numbers.

# perf stat -e 
hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/ -C 0 -I 1000
#           time             counts unit events
      1.001023931             26,624 
hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
      2.002176767                  0 
hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
      3.003296382                  0 
hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
      4.004385311             33,280 
hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/


> ---
>   arch/powerpc/perf/hv-gpci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
> index d48413e28c39..c756228a081f 100644
> --- a/arch/powerpc/perf/hv-gpci.c
> +++ b/arch/powerpc/perf/hv-gpci.c
> @@ -175,7 +175,7 @@ static unsigned long single_gpci_request(u32 req, u32 starting_index,
>   	 */
>   	count = 0;
>   	for (i = offset; i < offset + length; i++)
> -		count |= arg->bytes[i] << (i - offset);
> +		count |= (u64)(arg->bytes[i]) << ((length - 1 - (i - offset)) * 8);
>   
>   	*value = count;
>   out:
> 

-- 
Thanks and Regards
R.Nageswara Sastry
