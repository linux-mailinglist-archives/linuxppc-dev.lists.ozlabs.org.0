Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA8A25BA1D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 07:33:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhqGG3BfWzDr5l
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 15:33:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P/1oVpN+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhqDM6GFHzDr2g
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 15:31:30 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08352OFG053557; Thu, 3 Sep 2020 01:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4HGc7/6+Pw+aIlehXfflhn1TuMbzH3zeJUxuQa5CQaE=;
 b=P/1oVpN+XIULm43HcP2/i56HkLqraf+8hhOq+RhppUR7w608E83av0w1QuErodbyDu7g
 HsYoQUzYMtQopLWsvf9AmGGhezqig+UP7oSG4ZEHhxb+TnHU6WLkZgETnRc0mHlWxtlx
 8kmPut7cPoLhvKs4te2A1feiCVjudwFC4KWTX5zt1ZqK/Oj1hxbPqh7R7XZrPOdU/fu2
 YRF0+E8eWOwntx4gkxjHBqocmbWRBMQmHR8v25VLTu7jPevH1jIP740MONg1Jr02Fuw+
 TDFW+7BQ6gQAK1RRdY9dppIIG0/sHM0wFvmUKPE2MH4gKF4o8cTWpCnFO/a9qQWyF5dT 6g== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33ahswv4bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Sep 2020 01:31:24 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0835RTXg015452;
 Thu, 3 Sep 2020 05:31:23 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 337en9xnd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Sep 2020 05:31:23 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0835VMwQ41681180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Sep 2020 05:31:23 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC015AE060;
 Thu,  3 Sep 2020 05:31:22 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 021E3AE068;
 Thu,  3 Sep 2020 05:31:21 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.215.230])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Sep 2020 05:31:21 +0000 (GMT)
Subject: Re: [PATCH v2] scsi: ibmvfc: interface updates for future FPIN and MQ
 support
To: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20200901002420.648532-1-tyreld@linux.ibm.com>
 <yq1y2lrd2ys.fsf@ca-mkp.ca.oracle.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <3fe3e9be-9671-aa0a-b18b-10f77433ab56@linux.ibm.com>
Date: Wed, 2 Sep 2020 22:31:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <yq1y2lrd2ys.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_17:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009030042
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
Cc: james.bottomley@hansenpartnership.com, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/2/20 7:11 PM, Martin K. Petersen wrote:
> 
> Tyrel,
> 
>> 	Fixup complier errors from neglected commit --amend
> 
> Bunch of formatting-related checkpatch warnings. Please fix.
> 
> Thanks!
> 

So, I stuck to the existing style already in that header. If I'm going to fixup
to make checkpatch happy I imagine it makes sense to send a prerequisite patch
that fixes up the rest of the header.

-Tyrel
