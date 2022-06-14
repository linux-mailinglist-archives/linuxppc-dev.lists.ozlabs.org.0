Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CCD54B47D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 17:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMscg5Lh0z3cdM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 01:22:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aEAQ3ibc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aEAQ3ibc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMsby3LY6z305g
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 01:21:49 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EFBuxw004488;
	Tue, 14 Jun 2022 15:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=21lpP9JTQRAj1ITO6rdeXuuAe+mToT52HieBzrIyNnQ=;
 b=aEAQ3ibcDdcge+zaYrwQ5JRrrJZhjGv5AqbBw1KOwLiUAjrSnAD+xg7kkwQFTlu2wHMA
 uD3OUrX5P5XGLap/ecb43Xoon85K+D1maOqT0jpEjbsqFL4fWbwLI0hZLCWVE0mEfIOz
 RLYxlfoOabRMZkdc4w5wumIaX9IdUYSfD+BL865kDX4UbD5dljmZsAOS6+hyCI2aCNEx
 Tq2RDXXuTaAs3iLAihB/R7z/+LerxvMcT4nsmfrlIKkW7JdK91+JFzbSunSp57T6kYC+
 RgG/lgkgRwd4VOv6dgjlswJAil879GfAwcVukGN8CW4SiqZseyx5Y8tpjyYoWsgxEuCU 3Q== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpbuqfy35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 15:21:46 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25EF5jht019101;
	Tue, 14 Jun 2022 15:21:45 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma04wdc.us.ibm.com with ESMTP id 3gmjp9n72n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 15:21:45 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25EFLiXe25231760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jun 2022 15:21:44 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C07ED6A051;
	Tue, 14 Jun 2022 15:21:44 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DDAE6A047;
	Tue, 14 Jun 2022 15:21:44 +0000 (GMT)
Received: from localhost (unknown [9.163.13.123])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jun 2022 15:21:44 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/rtas: Allow ibm,platform-dump RTAS call with
 null buffer address
In-Reply-To: <20220614134952.156010-1-ajd@linux.ibm.com>
References: <20220614134952.156010-1-ajd@linux.ibm.com>
Date: Tue, 14 Jun 2022 10:21:44 -0500
Message-ID: <87bkuv8e47.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DbMc3a7co7PNOi6UKZoopSp1Iw4lhkTD
X-Proofpoint-ORIG-GUID: DbMc3a7co7PNOi6UKZoopSp1Iw4lhkTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_05,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=926 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140059
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
Cc: Sathvika Vasireddy <sathvika@linux.ibm.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> Add a special case to block_rtas_call() to allow the ibm,platform-dump RTAS
> call through the RTAS filter if the buffer address is 0.
>
> According to PAPR, ibm,platform-dump is called with a null buffer address
> to notify the platform firmware that processing of a particular dump is
> finished.
>
> Without this, on a pseries machine with CONFIG_PPC_RTAS_FILTER enabled, an
> application such as rtas_errd that is attempting to retrieve a dump will
> encounter an error at the end of the retrieval process.
>
> Fixes: bd59380c5ba4 ("powerpc/rtas: Restrict RTAS requests from userspace")
> Cc: stable@vger.kernel.org
> Reported-by: Sathvika Vasireddy <sathvika@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

I agree this allows ibm,platform-dump to work without weakening the
filter for other calls. Thanks.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
