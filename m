Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37BC74A90A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 04:33:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m0htwMp4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxyB64PXLz3c5V
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 12:33:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m0htwMp4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxy9D6vk5z3bVJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 12:32:32 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3672SNMF008960
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Jul 2023 02:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=E+P9UZpZ7VrelFrFpSGsW/nu713/Gvs0oaKN1A5EnPY=;
 b=m0htwMp41Q8ahpm4SkuqbaSibtTmQdfQlKt5CjkydFnFa5pYdnNbQ8BUsh/Fj9fKqnpC
 odMfSfaw8ln5qJLSfZz9pKrbyGH62OjQKtOTvT1XYH0/Niy2FKJOiePo0nFft/6yy4j9
 LJTQyzULL0scS4I3C9Klj7X7RBMqu6b6AqSncXwxDtUuJ4w0BEzvlKOh/JbJHSHGgB6M
 bkClvv8PGHm04f4Amv6WWGNC0huneFpUSkwlW+6+B38aXSCoIlWlPD77UqmmfOk4rJHy
 xnH0Cw2gseyeSop3W6qbJDSRqAHQsTWrbDh79Na+xIbu2VABzHmh0l4hS3kgoS/4WEFN 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rp9xy827s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jul 2023 02:32:28 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3672U5mh012744
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Jul 2023 02:32:28 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rp9xy827a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 02:32:28 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 366M1gdu006983;
	Fri, 7 Jul 2023 02:32:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3rjbs4ur2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 02:32:26 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3672WOIO45744626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jul 2023 02:32:24 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 870E620040;
	Fri,  7 Jul 2023 02:32:24 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F6BC20043;
	Fri,  7 Jul 2023 02:32:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Jul 2023 02:32:24 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 016F2600F0;
	Fri,  7 Jul 2023 12:32:21 +1000 (AEST)
Message-ID: <643ebc8519d22e0ed869989490f39780c1bde09d.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/powermac: Use early_* IO variants in
 via_calibrate_decr
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Fri, 07 Jul 2023 12:32:21 +1000
In-Reply-To: <20230706010816.72682-1-bgray@linux.ibm.com>
References: <20230706010816.72682-1-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lz9fiX64g5HdeGh6aVZL96DPikwMrDs7
X-Proofpoint-ORIG-GUID: zjUujOAGxezXGUmpLH-ahnERe8I3NIf5
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_17,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=632
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307070017
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-07-06 at 11:08 +1000, Benjamin Gray wrote:
> The issue is pre-existing, but is surfaced by commit 721255b9826b
> ("genirq: Use a maple tree for interrupt descriptor management").
> It's not clear to me why this causes it to surface.

From the thread chain in [1], it looks like the maple tree
implementation just has different allocation behaviour, which follows a
pre-existing code path to kmem_cache_alloc_bulk(), which
unconditionally enables interrupts.

(thanks Jordan Niethe for finding this thread)

[1]: https://lore.kernel.org/all/87o7qdzfay.ffs@tglx/
