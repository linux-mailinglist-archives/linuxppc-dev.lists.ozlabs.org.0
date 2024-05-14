Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACCA8C5202
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 13:34:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b4WsIwr8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdvQ8471Gz3c2K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 21:34:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b4WsIwr8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdvMG1tfTz30Vv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 21:31:37 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44EANCY7030176;
	Tue, 14 May 2024 11:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=yXOdXwxnUSH4P8a7AOTpMor36F3JDzt6190nMqMER5k=;
 b=b4WsIwr8zy19hJwwFMUUOO8FPazTRB/qxKEMKmax7SWjFgB55pJPn48OCp8Xjz0aCRV6
 PFqEErF1Ts6j/z5WkeHDcsmoJw60AOP/vnTpCXYJcKdLxtEEXCvRN9iMWrZDMDpCiONv
 DxT2ox9yzZNkkNJytUs6J2+I2QXrRDDfgR+R9K0C6t9kwsFI/BUiHrd9tl6/tO3ZbrCk
 3Va8UsSZn666yvBtpfPdW9ju9erjTOBu38xECGaWbnjWd+xwGuG9kNZ5Rxf7l3Kb45/W
 CWUvDkkLwlB+wRXYKDeTrYqSBXQ9PC7V8g300yiz9p2yQM42qkw2KsXEHc9o5GjsxLxG Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4656g4ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 11:21:55 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44EBLsSD022184;
	Tue, 14 May 2024 11:21:54 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4656g4ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 11:21:54 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44E8cclE006189;
	Tue, 14 May 2024 11:21:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmcxqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 11:21:53 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44EBLnTJ54001924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 11:21:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9989F20043;
	Tue, 14 May 2024 11:21:49 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5874E20040;
	Tue, 14 May 2024 11:21:48 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.206.66])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 14 May 2024 11:21:48 +0000 (GMT)
Date: Tue, 14 May 2024 16:51:41 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH] arch/powerpc: Remove the definition of unused cede
 function
Message-ID: <bbz5jnemmpzaz4577fured3vyettp677qgacvifgfgnq4nbeqi@gvqz4r4hc4jc>
References: <20240514100507.271681-1-gautam@linux.ibm.com>
 <vfx2z4dn6afpkl4z7ygewadw7mohfd7l3tfazdya4sbxniurkg@vrubq25slkvs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vfx2z4dn6afpkl4z7ygewadw7mohfd7l3tfazdya4sbxniurkg@vrubq25slkvs>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3bgrU1ZxcOf30zPoKAqInHN_9dgFBylG
X-Proofpoint-ORIG-GUID: FiGjcpiVqSb0OJDqIa9WUvmLQP5-qZ19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=403 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405140081
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 14, 2024 at 04:20:04PM GMT, Naveen N Rao wrote:
> On Tue, May 14, 2024 at 03:35:03PM GMT, Gautam Menghani wrote:
> > Remove extended_cede_processor() definition as it has no callers since
> > commit 48f6e7f6d948("powerpc/pseries: remove cede offline state for CPUs")
> 
> extended_cede_processor() was added in commit 69ddb57cbea0 
> ("powerpc/pseries: Add extended_cede_processor() helper function."), 
> which also added [get|set]_cede_latency_hint(). Those can also be 
> removed if extended_cede_processor() is no longer needed.

Yes thanks for pointing it out, will remove them as well.

Thanks,
Gautam
