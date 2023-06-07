Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20227725375
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 07:38:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbbk26nnYz3drZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 15:38:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IMiJwptC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IMiJwptC;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbbj62H4cz3bh0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 15:38:01 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3575GtVt009107;
	Wed, 7 Jun 2023 05:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=6UPkUrrbHWZ0vltGIZ5fI36KWUKm7XQNnWaiVmH72sw=;
 b=IMiJwptCS7eClrbhU3t9KJXnHyG+OpmFNSt0Ybi49PiXzNOOOyqtO5IiVYov17KyJ8xx
 xSXMYUtd/BHQDh8tFSd9CMa5Akv5XcoDV/E8VC7jHxQkv3uYeldKGw7ZjGt0Ke4xj4WB
 ilyFF2JtVfGVLPUg04vHqwb1z8thir418DBWc84gYNYZZMGqmUa9jvsbkx5VYpzpZfHe
 MnD2ABaeCN3lCAL3zVgpfTpqoLiHr6SQBAv5KP9pJGu5mRi88+Wn5xeAPpiekwykSpX/
 KtPgCFMZSWrqir5Q+rXL2hgcEGxtsVhj0P3KmRn+yY4//e5uS4nC0nmPZsZzC8RG0dfa nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2km0rba8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 05:37:57 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3575bRLD011272;
	Wed, 7 Jun 2023 05:37:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2km0rb90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 05:37:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 357306oD014126;
	Wed, 7 Jun 2023 05:37:55 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r2a7687rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 05:37:55 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3575bqpl21824244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 05:37:52 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F419C20040;
	Wed,  7 Jun 2023 05:37:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2651120049;
	Wed,  7 Jun 2023 05:37:50 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.206.66])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  7 Jun 2023 05:37:49 +0000 (GMT)
Date: Wed, 7 Jun 2023 11:07:40 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Jordan Niethe <jpn@linux.vnet.ibm.com>
Subject: Re: [PATCH RFC v2 6/6] docs: powerpc: Document nested KVM on POWER
Message-ID: <ZIAXpMpjb3V852rB@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
 <20230605064848.12319-7-jpn@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605064848.12319-7-jpn@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nhyPEmiVTiohnEtPdAJ0yVryMmgyTR2I
X-Proofpoint-GUID: RUDn3NoDOXKdcwtfQS7e2L7ibZTW03I0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_02,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306070044
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
Cc: mikey@neuling.org, kautuk.consul.1980@gmail.com, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, npiggin@gmail.com, sbhat@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 05, 2023 at 04:48:48PM +1000, Jordan Niethe wrote:
> From: Michael Neuling <mikey@neuling.org>

Hi,
There are some minor typos in the documentation pointed out below


> +H_GUEST_GET_STATE()
> +-------------------
> +
> +This is called to get state associated with an L2 (Guest-wide or vCPU specific).
> +This info is passed via the Guest State Buffer (GSB), a standard format as
> +explained later in this doc, necessary details below:
> +
> +This can set either L2 wide or vcpu specific information. Examples of

We are getting the info about vcpu here : s/set/get

> +H_GUEST_RUN_VCPU()
> +------------------
> +
> +This is called to run an L2 vCPU. The L2 and vCPU IDs are passed in as
> +parameters. The vCPU run with the state set previously using

Minor nit : s/run/runs

> +H_GUEST_SET_STATE(). When the L2 exits, the L1 will resume from this
> +hcall.
> +
> +This hcall also has associated input and output GSBs. Unlike
> +H_GUEST_{S,G}ET_STATE(), these GSB pointers are not passed in as
> +parameters to the hcall (This was done in the interest of
> +performance). The locations of these GSBs must be preregistered using
> +the H_GUEST_SET_STATE() call with ID 0x0c00 and 0x0c01 (see table
> +below).
> +
> 
> -- 
> 2.31.1
> 
