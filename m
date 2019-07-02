Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B44755C772
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 04:47:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45d7v0720vzDqTj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 12:47:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45d7sQ5xt4zDqSr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 12:46:01 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x622fw1U030906
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Jul 2019 22:45:59 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tfxgbghhj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:45:59 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 2 Jul 2019 03:45:58 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Jul 2019 03:45:55 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x622jsG347382998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jul 2019 02:45:54 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F156C6059;
 Tue,  2 Jul 2019 02:45:54 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B2ECC6055;
 Tue,  2 Jul 2019 02:45:52 +0000 (GMT)
Received: from [9.85.91.212] (unknown [9.85.91.212])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jul 2019 02:45:51 +0000 (GMT)
Subject: Re: ["RFC PATCH" 1/2] powerpc/mm: Fix node look up with numa=off boot
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20190629083629.29037-1-aneesh.kumar@linux.ibm.com>
 <1329fd62-c2ad-f2c9-d3df-731f543dd3ea@linux.ibm.com>
 <87imslso3u.fsf@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Tue, 2 Jul 2019 08:15:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87imslso3u.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19070202-0036-0000-0000-00000AD2A7DD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011363; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01226174; UDB=6.00645505; IPR=6.01007387; 
 MB=3.00027545; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-02 02:45:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070202-0037-0000-0000-00004C6F8AD9
Message-Id: <0beef991-6e3a-9f88-3c83-f9ff97c5d454@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907020027
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/1/19 10:12 PM, Nathan Lynch wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> I guess we should have here.
>>
>> modified   arch/powerpc/mm/numa.c
>> @@ -416,12 +416,11 @@ static int of_get_assoc_arrays(struct assoc_arrays
>> *aa)
>>    static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>>    {
>>    	struct assoc_arrays aa = { .arrays = NULL };
>> -	/* is that correct? */
>>    	int default_nid = 0;
>>    	int nid = default_nid;
>>    	int rc, index;
>>
>> -	if (!numa_enabled)
>> +	if ((min_common_depth < 0) || !numa_enabled)
>>    		return NUMA_NO_NODE;
>>
>>    	rc = of_get_assoc_arrays(&aa);
>>
>>
>> Nathan,
>>
>> Can you check this?
> 
> Looks like it would do the right thing.
> 
> Just checking: do people still need numa=off? Seems like it's a
> maintenance burden :-)
> 

That is used in kdump kernel.

-aneesh

