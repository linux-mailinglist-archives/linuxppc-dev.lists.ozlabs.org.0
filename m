Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 588CB30D190
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 03:30:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVlz02YBdzDwmF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:30:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=c1Lq/Hk2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVSSr2LzczDqB5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 01:51:56 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 112EXroj060695; Tue, 2 Feb 2021 09:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lYIDxVJVGO+fVsl8Su0TwXhgX4+VOhHia1vz+F1z58E=;
 b=c1Lq/Hk2cQ++7X5cNZSnQboa9chru/9KlWqkhiQ7FcQDYNfKXRoY6VL4itynlxTiXa4O
 7Zo6FHQahe8SruI2mDwHPwjccH8rupr38HV/9JahXpGppMIR+YWgLeYDG+uqfm0+20i3
 qezlAgKIoe9ye7Tyy7ZFzS9C0tWBqXpnKndnp4D2KXQ1CScIFaD2Pnp8uVr1P5PFtHLO
 UFbp6UqPHJGu5BZJC35V8iTJxHWsMMslaftEfA2SBPb6AQy0wx+8MsmY3EtTkHBk65Un
 LaB3tLl7FgFF1kGn035Srk6QLZlSM/CvnT8HwXLkOiKC8K5GHDQ9RlTLmXhd+E3Awomx bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36f6k04y05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 09:51:46 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 112EYArG061760;
 Tue, 2 Feb 2021 09:51:46 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36f6k04xye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 09:51:46 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112EpiaT010700;
 Tue, 2 Feb 2021 14:51:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 36cxqh9j57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 14:51:44 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 112EpXli34800046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 14:51:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 496DCA405B;
 Tue,  2 Feb 2021 14:51:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 000B7A4054;
 Tue,  2 Feb 2021 14:51:39 +0000 (GMT)
Received: from [9.199.35.92] (unknown [9.199.35.92])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  2 Feb 2021 14:51:39 +0000 (GMT)
Subject: Re: [RFC PATCH 1/6] selftest/mremap_test: Update the test to handle
 pagesize other than 4K
To: Li Xinhai <lixinhai_lxh@126.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
 <19298b0c-2db5-3755-722d-74baeb35f1ef@126.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <41ab0ed1-7d30-3ba5-d3fd-390983a01a07@linux.ibm.com>
Date: Tue, 2 Feb 2021 20:21:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <19298b0c-2db5-3755-722d-74baeb35f1ef@126.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_06:2021-02-02,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=958
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020096
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
Cc: peterz@infradead.org, linuxppc-dev@lists.ozlabs.org, joel@joelfernandes.org,
 kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/2/21 6:59 PM, Li Xinhai wrote:
> what is the overall purpose of this patch set? maybe need a cover
> letter?
> 


The goal of the patch series was to enable MOVE_PMD/PUD on ppc64. But 
the series itself achieves that by fixing the existing code rather than 
adding changes to arch/ppc64. With that we could consider the series as 
a bug fix series.

-aneesh
