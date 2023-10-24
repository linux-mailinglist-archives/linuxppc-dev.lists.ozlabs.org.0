Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE227D46F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 07:36:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rer6wF2w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF15L6t2Kz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 16:36:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rer6wF2w;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF14T2LN7z2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 16:35:53 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SF14S3LpHz4x5h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 16:35:52 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SF14S3H8Zz4x5K; Tue, 24 Oct 2023 16:35:52 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rer6wF2w;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SF14R6cSHz4x5G;
	Tue, 24 Oct 2023 16:35:51 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39O5MvAK027023;
	Tue, 24 Oct 2023 05:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=Dnw0Sc+ZPooqYDvmLp2dm3V3IZFzlR2ATixGCsAkyiM=;
 b=rer6wF2wLZ3Q/WCfl0/hBAeMM90PhpW6Fju2A8GkXOJh33Nfq1PaYJFEMTiP4fFGVqNk
 0chA22Jk01klt9nsdxaVU00ywlsb9LorP6a8jwtKxj/8YbmEQEJJz5sqNVFuvefSvmyO
 +njjacGyP9KWKt0VhOs76Tmmv6PSfXJUauEH68QhkZ3yyEaNR0R1XnJH8urfOGlJ7Whs
 Irg3suzgTD+uVlBUj/c5kBUcLpeGz3JrTvrtVR7K1oq7K96FI9NXfbr/SDqxeA+9L5AF
 RcVE/ojvhsWuhYnsLTCDzMH8vc2MUH/MCLdi1KjTu18ZMGxu46qHTG710jJY1sM7Gj/b vw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tx7qq0d2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 05:35:46 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39O2riBQ012344;
	Tue, 24 Oct 2023 05:35:45 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tvup1mvag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 05:35:45 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39O5ZgrG25100924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Oct 2023 05:35:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D65E2006A;
	Tue, 24 Oct 2023 05:35:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D004520040;
	Tue, 24 Oct 2023 05:35:40 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.171.77.208])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 24 Oct 2023 05:35:40 +0000 (GMT)
Date: Tue, 24 Oct 2023 11:05:34 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v3 1/3] powerpc: make fadump resilient with memory
 add/remove events
Message-ID: <se7qehosb7xx4ueguq7v3rlrhcqpwblz3thzzr2hkyz2ambp4u@veaocw6z57m6>
References: <20231009041953.36139-1-sourabhjain@linux.ibm.com>
 <20231009041953.36139-2-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009041953.36139-2-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XjeDjO37wNAOv2Wb8DdwvT_siCrVtHnW
X-Proofpoint-ORIG-GUID: XjeDjO37wNAOv2Wb8DdwvT_siCrVtHnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_04,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 mlxlogscore=576 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310240046
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
Cc: mahesh@linux.vnet.ibm.com, linuxppc-dev@ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi sourabh, found a typo in comment.

On Mon, Oct 09, 2023 at 09:49:51AM +0530, Sourabh Jain wrote:
>
> +/*
> + * Process an active dump in four steps. First, verify the crash info header
> + * signature/magic number for integrity and accuracy. Second, if the fadump
> + * version is greater than 0, prepare the elfcorehdr; for fadump version 0,
> + * it's already created in the first kernel as part of the fadump reserved
> + * area. Third, let the platform update CPU notes in elfcorehdr. Finally,
> + * set elfcorehdr_addr so that the vmcore module can export the elfcore
> + * header through '/proc/vmcore'.
> + */
> +static void process_fadump(void)
> +{
>
> ...
>
> +     /*
> +      * fadump version zero indicates that fadump crash info header
> +      * is corrupted.
> +      */
> +     if (fadump_version < 0) {
> +             pr_err("Crash info header is not valid.\n");
> +             goto err_out;
> +     }
> +

Here, comment says 0 indicates header is corrupted. But as per my understanding,
version 0 means the earlier case (when MAGIC number was FADUMPINF).
Maybe it should be:

/*
 * fadump version less than zero indicates that fadump crash info header
 * is corrupted.
 */

Or:

/*
 * Negative fadump version indicates that fadump crash info header
 * is corrupted.
 */

Thanks,
Aditya Gupta

