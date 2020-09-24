Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F8D27703A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 13:48:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxtb420XczDqW3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 21:48:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QwUZCb8Q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxtYM0xXfzDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 21:46:30 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08OBgKL0028663; Thu, 24 Sep 2020 07:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=cy9i3HKP06eSsk3EkUuP4ft7WU/EvISxSMpaosLKxSg=;
 b=QwUZCb8Q0xh6cMlgBmGwtgF3hQsUGhD7AXJADvr5CuXwTXIMMi0salXUAhjaigoNBBiL
 Eo55mdZAt70TgDWb321Xo4D43PxFy3uediLOMJLO4ek6gfk5hdHtVnqKiqLLC9gt7Q1f
 5+9qszMsHrpHqcn7krv2m69rmZ6bZ2McBr4dxt0FHFe5grWo/E850dEf4rqy0ayVlt41
 WEwLEONXo6oYldYs/0gRcqpyERKQtFkPJ6VDpEUjXs5Lh/VrNJDiPhWDKt6Y7WOqER1s
 VbEbZATbHEeLEIeVvkdXYgfE/5o/Uzae7dZI6EJSjQiBJ6I4IP3xkPWMSimZ5GxF2CZZ Mw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33rttgr2u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 07:46:09 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08OBhfn3009184;
 Thu, 24 Sep 2020 11:46:07 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 33n9m7tpfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 11:46:07 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08OBk5BB30802264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 11:46:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F81F52051;
 Thu, 24 Sep 2020 11:46:05 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.113.96])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 9954A5204F;
 Thu, 24 Sep 2020 11:46:01 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Thu, 24 Sep 2020 17:16:00 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Wang Wensheng <wangwensheng4@huawei.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH -next] powerpc/papr_scm: Fix warnings about undeclared
 variable
In-Reply-To: <20200918085951.44983-1-wangwensheng4@huawei.com>
References: <20200918085951.44983-1-wangwensheng4@huawei.com>
Date: Thu, 24 Sep 2020 17:16:00 +0530
Message-ID: <87lfgz9z47.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_08:2020-09-24,
 2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=1 phishscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=984 bulkscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240085
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
Cc: santosh@fossix.org, linux-kernel@vger.kernel.org, paulus@samba.org,
 aneesh.kumar@linux.ibm.com, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Thanks for the patch. This looks good to me.

Wang Wensheng <wangwensheng4@huawei.com> writes:

> Build the kernel with 'make C=2':
> arch/powerpc/platforms/pseries/papr_scm.c:825:1: warning: symbol
> 'dev_attr_perf_stats' was not declared. Should it be static?

> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>

-- 
Cheers
~ Vaibhav
