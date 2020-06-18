Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B271FFCF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 22:53:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nvKr2HbKzDrNP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 06:53:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nvHt1vdHzDr8r
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 06:51:54 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05IKYEJv036046; Thu, 18 Jun 2020 16:51:51 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rcbax30k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 16:51:51 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05IKp6kj001087;
 Thu, 18 Jun 2020 20:51:50 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 31q6c649u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 20:51:50 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05IKpn3W40894828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 20:51:49 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 938BCAC05E;
 Thu, 18 Jun 2020 20:51:49 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38D69AC05B;
 Thu, 18 Jun 2020 20:51:49 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.160.31.222])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jun 2020 20:51:49 +0000 (GMT)
Subject: Re: [PATCH net] ibmveth: Fix max MTU limit
To: Jakub Kicinski <kuba@kernel.org>
References: <1592495026-27202-1-git-send-email-tlfalcon@linux.ibm.com>
 <20200618085722.110f3702@kicinski-fedora-PC1C0HJN>
From: Thomas Falcon <tlfalcon@linux.ibm.com>
Message-ID: <ef46e726-5be4-de64-a34c-8a98823a920a@linux.ibm.com>
Date: Thu, 18 Jun 2020 15:51:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618085722.110f3702@kicinski-fedora-PC1C0HJN>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_15:2020-06-18,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0
 cotscore=-2147483648 mlxlogscore=999 bulkscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 adultscore=0 clxscore=1011 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006180157
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/18/20 10:57 AM, Jakub Kicinski wrote:
> On Thu, 18 Jun 2020 10:43:46 -0500 Thomas Falcon wrote:
>> The max MTU limit defined for ibmveth is not accounting for
>> virtual ethernet buffer overhead, which is twenty-two additional
>> bytes set aside for the ethernet header and eight additional bytes
>> of an opaque handle reserved for use by the hypervisor. Update the
>> max MTU to reflect this overhead.
>>
>> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
> How about
>
> Fixes: d894be57ca92 ("ethernet: use net core MTU range checking in more drivers")
> Fixes: 110447f8269a ("ethernet: fix min/max MTU typos")
>
> ?

Thanks, do you need me to send a v2 with those tags?

Tom

