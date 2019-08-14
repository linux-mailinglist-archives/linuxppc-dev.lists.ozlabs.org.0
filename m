Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A518CC72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 09:17:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467grw21cXzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 17:17:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467gnS1dchzDqV3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:14:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 467gnS0Pxxz8tTq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:14:36 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 467gnR70Y2z9sNC; Wed, 14 Aug 2019 17:14:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 467gnR3Dc2z9sN1
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 17:14:35 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7E7DtSH032816
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 03:14:32 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uccsat9ph-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 03:14:32 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 14 Aug 2019 08:14:30 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 14 Aug 2019 08:14:27 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7E7EPlf32899138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 07:14:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 535FE11C054;
 Wed, 14 Aug 2019 07:14:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F145911C050;
 Wed, 14 Aug 2019 07:14:22 +0000 (GMT)
Received: from [9.199.56.240] (unknown [9.199.56.240])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Aug 2019 07:14:22 +0000 (GMT)
Subject: Re: [PATCH v4 13/25] powernv/fadump: support copying multiple kernel
 memory regions
To: mahesh@linux.vnet.ibm.com
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327681058.27462.16887222537196117647.stgit@hbathini.in.ibm.com>
 <20190813150347.n4jawlh4jugrxn3c@in.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Wed, 14 Aug 2019 12:44:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813150347.n4jawlh4jugrxn3c@in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19081407-0020-0000-0000-0000035F9EEE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081407-0021-0000-0000-000021B4B797
Message-Id: <24e0c7dd-14c2-2f91-5dc6-4ccda68c92b3@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=430 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140069
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver <oohall@gmail.com>, Vasant Hegde <hegdevasant@linux.ibm.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/08/19 8:33 PM, Mahesh J Salgaonkar wrote:
> On 2019-07-16 17:03:30 Tue, Hari Bathini wrote:
>> Firmware uses 32-bit field for region size while copying/backing-up
>> memory during MPIPL. So, the maximum copy size for a region would
>> be a page less than 4GB (aligned to pagesize) but FADump capture
>> kernel usually needs more memory than that to be preserved to avoid
>> running into out of memory errors.
>>
>> So, request firmware to copy multiple kernel memory regions instead
>> of just one (which worked fine for pseries as 64-bit field was used
>> for size there). With support to copy multiple kernel memory regions,
>> also handle holes in the memory area to be preserved. Support as many
>> as 128 kernel memory regions. This allows having an adequate FADump
>> capture kernel size for different scenarios.
> 
> Can you split this patch into 2 ? One for handling holes in boot memory
> and other for handling 4Gb region size ? So that it will be easy to
> review changes.

Sure. Let me split and have the patch that handles holes in boot memory
as the last patch in the series.

