Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1881895A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 07:21:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j0LQ38RbzDqww
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 17:21:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j0J51gh0zDqst
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 17:19:49 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I62lNY163734
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 02:19:46 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8actc3y-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 02:19:46 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 18 Mar 2020 06:19:43 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 06:19:38 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02I6JbgL62259362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 06:19:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B639A405C;
 Wed, 18 Mar 2020 06:19:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDB4CA4060;
 Wed, 18 Mar 2020 06:18:43 +0000 (GMT)
Received: from [9.199.62.91] (unknown [9.199.62.91])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Mar 2020 06:18:35 +0000 (GMT)
Subject: Re: [PATCH 05/15] powerpc/watchpoint: Provide DAWR number to set_dawr
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-6-ravi.bangoria@linux.ibm.com>
 <4704ba5d-2bc3-38f6-8097-b8a850592461@c-s.fr>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Wed, 18 Mar 2020 11:48:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4704ba5d-2bc3-38f6-8097-b8a850592461@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031806-0016-0000-0000-000002F2FFC3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031806-0017-0000-0000-000033568365
Message-Id: <16bc7420-0e46-0600-62b4-e5ac97f833fb@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_02:2020-03-17,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=752
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003180028
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
Cc: apopple@linux.ibm.com, mikey@neuling.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, peterz@infradead.org,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, fweisbec@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/17/20 3:58 PM, Christophe Leroy wrote:
> 
> 
> Le 09/03/2020 à 09:57, Ravi Bangoria a écrit :
>> Introduce new parameter 'nr' to set_dawr() which indicates which DAWR
>> should be programed.
> 
> While we are at it (In another patch I think), we should do the same to set_dabr() so that we can use both DABR and DABR2

This series is for DAWR only and does not support DABR2. I'll look
at how other book3s family processors provides DABR2 supports.

Thanks,
Ravi

