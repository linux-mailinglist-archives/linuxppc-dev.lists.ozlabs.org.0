Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EB463C3EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 16:38:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NM61l265jz3bYL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 02:38:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=coh2eOLW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=coh2eOLW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NM60l6KcRz2xf2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 02:37:43 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATEPme1027497
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 15:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=iXqdUUGw1y/cMzqQnwVqqbn7N3UugOG0d8YVuE93vLI=;
 b=coh2eOLWjWI88CPtHojXB51r735w4pmuF5HabJMnYOzn6nq8pAHU7FdtGbfWF74P2Uyq
 hK6AqsMlrjALLh+Inme6Ci/apAQuGMg20POKtKBzDZFTD5sDC229hzeagM/Izc0gkSeJ
 NVqM/H3ono6wgBAPzKOxeC78XkKs35BSjjXPlNMQX04p6aA8PpfDUB4te/+hGQ5FP+z/
 Kp0qDW2jsT9N7wX0W1f54pq4FGWChE1b6AxuASoJp8eVpj18gYv7PEn8McMrxnQWgFAl
 ew1HhIzNq7pwBcXzcNHxHWsTEZXUoXp4oZo9z/wHkdjrKF0uhTfi/a5xNtnpw5hcYUjR Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5ebuk4fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 15:37:40 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ATFLaTO015435
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 15:37:40 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5ebuk4f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 15:37:40 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATFbPSN013998;
	Tue, 29 Nov 2022 15:37:38 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma03wdc.us.ibm.com with ESMTP id 3m3ae9desm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 15:37:38 +0000
Received: from smtpav02.wdc07v.mail.ibm.com ([9.208.128.114])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ATFbYGx48759316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 15:37:35 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CDD258059;
	Tue, 29 Nov 2022 15:37:37 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11B1458058;
	Tue, 29 Nov 2022 15:37:37 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 15:37:36 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 03/13] powerpc/rtas: avoid device tree lookups in
 rtas_os_term()
In-Reply-To: <COOKSD5PYV9N.3AHJPTBH1S081@bobo>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-4-nathanl@linux.ibm.com>
 <CONKPQU112NE.1K5YZVFHQ7XU9@bobo> <875yez9bq5.fsf@linux.ibm.com>
 <COOKSD5PYV9N.3AHJPTBH1S081@bobo>
Date: Tue, 29 Nov 2022 09:37:36 -0600
Message-ID: <87lent93gf.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lMn67VH68noxFYAQnrjuDOOBzNFWnuaz
X-Proofpoint-ORIG-GUID: skxW4t4XNOotEkf8b04vyrxahQlx71L7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_10,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=626 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290086
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Tue Nov 29, 2022 at 4:26 AM AEST, Nathan Lynch wrote:
>> "Nicholas Piggin" <npiggin@gmail.com> writes:
>> > On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
>> >> rtas_os_term() is called during panic. Its behavior depends on a
>> >> couple of conditions in the /rtas node of the device tree, the
>> >> traversal of which entails locking and local IRQ state changes. If the
>> >> kernel panics while devtree_lock is held, rtas_os_term() as currently
>> >> written could hang.
>> >
>> > Nice.
>> >
>> >>
>> >> Instead of discovering the relevant characteristics at panic time,
>> >> cache them in file-static variables at boot. Note the lookup for
>> >> "ibm,extended-os-term" is converted to of_property_read_bool() since
>> >> it is a boolean property, not a RTAS function token.
>> >
>> > Small nit, but you could do that at the query site unless you
>> > were going to start using ibm,os-term without the extended
>> > capability.
>>
>> I'm unsure that this is what you're suggesting, but we don't want to use
>> of_property_read_bool() in this context either, because it has the same
>> undesirable qualities as rtas_token().
>
> I mean rtas_initialize() could do
>
> 	if (of_property_read_bool(rtas.dev, "ibm,extended-os-term"))
> 		ibm_os_term_token = rtas_token("ibm,os-term");

Oh of course, thanks. Since I need to do a v2 anyway, I'll make that
change.
