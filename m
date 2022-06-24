Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296D65599D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 14:46:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTxhH0Mxjz3cfG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 22:46:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XxbyCBOU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XxbyCBOU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTxgX67Z6z3bpy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 22:46:00 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OCfutX015325;
	Fri, 24 Jun 2022 12:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=U2/9YArPeR4A0exNf3XtNGgMv7CtlE/RHX3Ooijd5jE=;
 b=XxbyCBOU9YU9DSNeUTRQ4aFazwcyvTZWOOLHuM1lIJgRBALWd9TwxYtJ9ZwM6HP81sCo
 bDJXRZzeRYh2uF+Nihuys129rHGlDLt2FqENWOaevjzDnUZrW+laXEDt139svUwh8FHK
 Qyc0+tPmaQkVtggm4j0kukPEiBYp/6FCeJCUvdCUk5bp9WTgVozT41GeSMYo65p769H7
 AEvARL8GClYqq3nJojl6duOz/cxvfnVZwpfR3R2rAGZmBR2DLVf6UnjT1/KO9/eOFfhR
 R/CqMDJ/oToik8FvPQ//iLPTd/Bcl50JoOQLJDhz8EMBnyCpqLSCB2aCt/QkH0+2v7D7 KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwdgeg30u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 12:45:43 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25OCg7ee015690;
	Fri, 24 Jun 2022 12:45:43 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwdgeg2yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 12:45:43 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25OCJwGG009871;
	Fri, 24 Jun 2022 12:45:40 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma02fra.de.ibm.com with ESMTP id 3gv3mbahg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 12:45:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25OCilDZ21692714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 12:44:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 358CDA404D;
	Fri, 24 Jun 2022 12:45:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDC2EA4051;
	Fri, 24 Jun 2022 12:45:37 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 24 Jun 2022 12:45:37 +0000 (GMT)
Message-ID: <97ae3ac2-c0a8-d675-50a4-0daf960c7f05@linux.ibm.com>
Date: Fri, 24 Jun 2022 14:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/4] watchdog: export watchdog_mutex and
 lockup_detector_reconfigure
Content-Language: fr
To: Christoph Hellwig <hch@infradead.org>
References: <20220614135414.37746-1-ldufour@linux.ibm.com>
 <20220614135414.37746-3-ldufour@linux.ibm.com>
 <YrWF0w3mpYA//BX6@infradead.org>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <YrWF0w3mpYA//BX6@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nSKlA-sfknZJQa0Ka38-SLnvKhTv4gFO
X-Proofpoint-GUID: vX6G5QeXuE40TcchbWa2XA4NgLHmUbJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_07,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 phishscore=0 adultscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240049
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
Cc: nathanl@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/06/2022, 11:37:23, Christoph Hellwig wrote:
> On Tue, Jun 14, 2022 at 03:54:12PM +0200, Laurent Dufour wrote:
>> The watchdog_mutex is exported to allow some variable to be changed under
>> its protection and prevent any conflict.
>> The lockup_detector_reconfigure() function is exported and is expected to
>> be called under the protection of watchdog_mutex.
> 
> Please provide an actual function accessor instead of directly touching
> a global lock.

Thanks Christoph,

I'll try to not touch to that mutex, if that's not doable, I'll create
function accessor as you're suggesting.

