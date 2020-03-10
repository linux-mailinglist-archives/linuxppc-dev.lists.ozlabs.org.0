Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9E180625
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 19:23:12 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cNkK0ZnVzDqWr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 05:23:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cNdZ6rRmzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 05:18:58 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02AHxDEx097191; Tue, 10 Mar 2020 14:18:42 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ynr9m8grf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 14:18:42 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02AIFqMd008758;
 Tue, 10 Mar 2020 18:18:41 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 2ym386urqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 18:18:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02AIIfmj50266604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 18:18:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDC0BAC062;
 Tue, 10 Mar 2020 18:18:40 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 009E2AC059;
 Tue, 10 Mar 2020 18:18:39 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.64.73])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 10 Mar 2020 18:18:39 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: fix of_read_drc_info_cell() to point at
 next record
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20200307024547.5748-1-tyreld@linux.ibm.com>
 <87tv2w2kc2.fsf@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <e99f5e39-4788-a9ef-30d7-8096df7ee36e@linux.ibm.com>
Date: Tue, 10 Mar 2020 11:18:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87tv2w2kc2.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_12:2020-03-10,
 2020-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003100109
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
Cc: mwb@linux.vnet.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/10/20 10:25 AM, Nathan Lynch wrote:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> The expectation is that when calling of_read_drc_info_cell()
>> repeatedly to parse multiple drc-info records that the in/out curval
>> parameter points at the start of the next record on return. However,
>> the current behavior has curval still pointing at the final value of
>> the record just parsed. The result of which is that if the
>> ibm,drc-info property contains multiple properties the parsed value
>> of the drc_type for any record after the first has the power_domain
>> value of the previous record appended to the type string.
>>
>> Ex: observed the following 0xffffffff prepended to PHB
>>
>> [   69.485037] drc-info: type: \xff\xff\xff\xffPHB, prefix: PHB , index_start: 0x20000001
>> [   69.485038] drc-info: suffix_start: 1, sequential_elems: 3072, sequential_inc: 1
>> [   69.485038] drc-info: power-domain: 0xffffffff, last_index: 0x20000c00
>>
>> Fix by incrementing curval past the power_domain value to point at
>> drc_type string of next record.
>>
>> Fixes: a29396653b8bf ("pseries/drc-info: Search DRC properties for CPU indexes")
> 
> I have a different commit hash for that:
> e83636ac3334 pseries/drc-info: Search DRC properties for CPU indexes

Oof, looks like I grabbed the commit hash from the SLES 15 SP1 branch. You have
the correct upstream commit.

Fixes: e83636ac3334 ("pseries/drc-info: Search DRC properties for CPU indexes")

Michael, let me know if you want me to resubmit, or if you will fixup the Fixes
tag on your end?

-Tyrel

> 
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> 
> Otherwise:
> Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
> 

