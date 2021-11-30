Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6CD4634AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 13:40:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3MJ53xL5z3cTc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 23:40:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k4D5g0SC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3MHL4wjHz2xsr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 23:39:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k4D5g0SC; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J3MHL3N2Gz4xdQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 23:39:42 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J3MHL3KLSz4xdS; Tue, 30 Nov 2021 23:39:42 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k4D5g0SC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J3MHL11q6z4xdQ
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 23:39:41 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AUAMPCQ003678
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 12:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+3Rrl8+P4ynrW+zAEM++PLlGzHxKktgz1cc+A1Lugf0=;
 b=k4D5g0SCUmXG/Z886abMTJVaTAUcqnyQ2H9pCygNQoPXo0iaTyM2fK4D/zcikCUli/WQ
 lK7poiMt7SP+lQbN+E6m4hJzSrXrimjUJ9vGAk5awqyisKiggnzHtOeH8yoqDYx+zrB0
 8cLIVcTV3QtJm/4Mnx28DObiNRu0ZHLLBKZA8QcmVoGOxIBSBYLWXnRhCqs7wfOgT4NJ
 Bf2GXXKZP9PnGdvUPG0KRX52xGqrA4i28GeD5JoNZzdlJRrpGqizKKQQZQIcX+Hi4R0F
 2/0XTqJeRN1UqNXfakb9SEBSaPh4FER2jCSq3bAZNFvlr7L+stSs7CrDsGJmvdKpmEDS ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnj55jpt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 12:39:39 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AUCZrKw030694
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Nov 2021 12:39:39 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnj55jpss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 12:39:39 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AUCY0eO032532;
 Tue, 30 Nov 2021 12:39:38 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3ckcabsq0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 12:39:38 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AUCdb6K50528736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 12:39:37 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0116328067;
 Tue, 30 Nov 2021 12:39:37 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCE1128065;
 Tue, 30 Nov 2021 12:39:36 +0000 (GMT)
Received: from localhost (unknown [9.211.63.38])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Nov 2021 12:39:36 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: mahesh@linux.ibm.com
Subject: Re: [PATCH] powerpc/rtas: Introduce rtas_get_sensor_nonblocking()
 for pci hotplug driver.
In-Reply-To: <20211130093144.zpjcxnbkz3jsxfql@in.ibm.com>
References: <163817631601.2016996.16085383012429651821.stgit@jupiter>
 <87o862nt0q.fsf@linux.ibm.com>
 <20211130093144.zpjcxnbkz3jsxfql@in.ibm.com>
Date: Tue, 30 Nov 2021 06:39:35 -0600
Message-ID: <87lf15om0o.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: j4omlfrZjmFM6gS6kl_hLhNeEXc28My6
X-Proofpoint-GUID: VFciNv20lBm1wTlbxSzWWOV_auS1v9rJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_07,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=637 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111300072
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh J Salgaonkar <mahesh@linux.ibm.com> writes:

> On 2021-11-29 22:53:41 Mon, Nathan Lynch wrote:
>> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
>> > When certain PHB HW failure causes phyp to recover PHB, it marks the PE
>> > state as temporarily unavailable until recovery is complete. This also
>> > triggers an EEH handler in Linux which needs to notify drivers, and perform
>> > recovery. But before notifying the driver about the pci error it uses
>> > get_adapter_state()->get-sesnor-state() operation of the hotplug_slot to
>> > determine if the slot contains a device or not. if the slot is empty, the
>> > recovery is skipped entirely.
>> >
>> > However on certain PHB failures, the rtas call get-sesnor-state() returns
>> > extended busy error (9902) until PHB is recovered by phyp. Once PHB is
>> > recovered, the get-sensor-state() returns success with correct presence
>> > status. The rtas call interface rtas_get_sensor() loops over the rtas call
>> > on extended delay return code (9902) until the return value is either
>> > success (0) or error (-1). This causes the EEH handler to get stuck for ~6
>> > seconds before it could notify that the pci error has been detected and
>> > stop any active operations.
>> 
>> I am curious whether you see any difference with "powerpc/rtas:
>> rtas_busy_delay() improvements" which was recently applied. It will
>> cause the the calling task to sleep in response to a 990x status instead
>> of immediately retrying:
>
> If it is still sleeping it may not help, however I will give a try.

Thanks. My thought is that with the old behavior of rtas_busy_delay(),
the repeated retries (potentially hundreds or thousands of
get-sensor-state calls) that occur before finally sleeping may be
prolonging the ongoing PHB recovery.

