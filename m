Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA9C570D29
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 00:06:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhdJB3YYGz3cDt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 08:06:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H94rq4Wc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H94rq4Wc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhdH21CScz3c3v
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 08:05:17 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BL1eOW026600;
	Mon, 11 Jul 2022 22:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=0UYMY/8LSqYL9C1gfOyC9V3xGiHgeAVl6rhJahtce6Q=;
 b=H94rq4WcoObqeBYWGSXJURwJUm5ci5Mc/ycO4GQ/G1sZrqEOYRdO/ShJka+NP6Art3bI
 QN6XBNv7+ii1qKmkEbHaYt2IJz0XIy7TMDLUAjdr2sV/64tlDhSXRIMw+k4D4IecYYfP
 rwscuPYr2NUp1jZgp/qfJGU5bpH6O0Ci3PbO0aNpUGF4KakrVSR5MKQa1uxNueJKUR8Q
 XtHSpO1svbyrVIKvJMEhebHsGsJ+4EX5oAWyQ5DsPjP/XR7bI50clr+O5OP4U5FfpM/w
 tOsRhwKeTlcqmSnnJC2oSoxca5aayfMRgIfKQ8ozEPhqAqdtVOuIEgj1Csy4oA4OrH2O Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8udv16r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:05:11 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26BM14qi028560;
	Mon, 11 Jul 2022 22:05:11 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8udv16ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:05:10 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26BLqFHo008582;
	Mon, 11 Jul 2022 22:05:08 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma05fra.de.ibm.com with ESMTP id 3h71a8tf37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:05:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26BM3bYY18809274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jul 2022 22:03:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4452A4053;
	Mon, 11 Jul 2022 22:05:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19098A4051;
	Mon, 11 Jul 2022 22:05:02 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.211.107.19])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 11 Jul 2022 22:05:01 +0000 (GMT)
Message-ID: <5f205957701fd4927d822221fcb5552134091e1e.camel@linux.ibm.com>
Subject: Re: [PATCH v6 5/6] of: kexec: Refactor IMA buffer related functions
 to make them reusable
From: Mimi Zohar <zohar@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, kexec@lists.infradead.org,
        devicetree@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Date: Mon, 11 Jul 2022 18:05:00 -0400
In-Reply-To: <20220707172026.831614-6-stefanb@linux.ibm.com>
References: <20220707172026.831614-1-stefanb@linux.ibm.com>
	 <20220707172026.831614-6-stefanb@linux.ibm.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hqoOL2CMUJUn5qgWL5bRBtIiAkrrg-ZD
X-Proofpoint-ORIG-GUID: iG-GAhJJtFe1gvh7lTleTLoaSt3-nQll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_25,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207110089
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
Cc: nayna@linux.ibm.com, nasastry@in.ibm.com, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-07-07 at 13:20 -0400, Stefan Berger wrote:
> Refactor IMA buffer related functions to make them reusable for carrying
> TPM logs across kexec.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Mimi Zohar <zohar@linux.ibm.com>

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

