Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2682541B6CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 20:58:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJpfx5LD4z3051
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 04:58:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YyZ0h/CJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YyZ0h/CJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJpf74tpKz2xr9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 04:57:18 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18SHj583027117
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 14:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wDcB6cLgJz0K6y0t+YVpmDF+y5mx5lwtkuat4ooZrbQ=;
 b=YyZ0h/CJ+YSvpOx3jQY/QoDSz+RJ7ErcW2vNkotP0gKghGXSPAt/yqIfsy2lSt1bI9iP
 rBEcWdK4049NJ45CB/Qw0zn74Fq6nM9HIitDIkbKnCNjaLwOMvxK1WzmExXZCQzeph6y
 M67e2D/ehYLEDgs0LziIVHT9UK5CLExde2TM3gx4Yf0v5zImwb3P3zog2vosJHMOBQi2
 Cnpg0tlzz59yMrb+m/8aqH7cLTZZj383zdVsm0HDpcb9A9OazkH9W6Xy/Pr6tUoNzV54
 upEfsq1FY8/kpqVaX7A5nCYBeEq9rQPh9PyqUuQgVK59QQfENMnHfHTV56EYeJjWimz1 LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bc092mqu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 14:57:15 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18SIWuAP008325
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 14:57:14 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bc092mqtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 14:57:14 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18SIrFAS010917;
 Tue, 28 Sep 2021 18:57:14 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3b9udb7nyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 18:57:14 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18SIvDlb32309620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 18:57:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CD68AE06A;
 Tue, 28 Sep 2021 18:57:13 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D97DAE060;
 Tue, 28 Sep 2021 18:57:12 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.61.158])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 28 Sep 2021 18:57:12 +0000 (GMT)
Subject: Re: [PATCH] powerpc: fix unbalanced node refcount in check_kvm_guest()
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210928124550.132020-1-nathanl@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <1afd9f63-fc20-0717-63f4-21cae7933df2@linux.ibm.com>
Date: Tue, 28 Sep 2021 11:57:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928124550.132020-1-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XQuXEnK3a0cFXP8MC9lGdmFmv5mfKjVl
X-Proofpoint-GUID: NQkN2ZBPOvS_5deFXsn6j83jP2Wx8q6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280109
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
Cc: srikar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/28/21 5:45 AM, Nathan Lynch wrote:
> When check_kvm_guest() succeeds in looking up a /hypervisor OF node, it
> returns without performing a matching put for the lookup, leaving the
> node's reference count elevated.
> 
> Add the necessary call to of_node_put(), rearranging the code slightly to
> avoid repetition or goto.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: 107c55005fbd ("powerpc/pseries: Add KVM guest doorbell restrictions")

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
