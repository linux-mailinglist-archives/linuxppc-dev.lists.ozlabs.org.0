Return-Path: <linuxppc-dev+bounces-3919-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D69EB502
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 16:30:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y72k12Kdgz2yyT;
	Wed, 11 Dec 2024 02:30:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733844633;
	cv=none; b=cV4riJxA86A8L1yie0g/6xVxycBkMhSI6XNgZ0aTef/IrbCb7pFhiBTWq+He9DSTd/IDNJZ2uCo9bmK0QMTLWVfNlBVEU/10hxs1laneFCFqj/C7mgBoJ6qK/1rE35G7YJ/YwKCNu1GBXrdzK1Xk4hWXDXo6HFYq3iYz46ST3EaiapoLUJ4/Kz2U26zBpTPm32ViWpfnGV1sYEt3VaukpuCqHAyW0uTbYtA/2zrf/F06WzZsRpYqhzD2thMWd7fXvi+f1jl8hY0rEtAD9eNBq9WgQ62phGxfxGdpyTeWOHFvi4gHlOpi/41zJIsG29F6NQzV1w+TfFxxf/7wfBKGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733844633; c=relaxed/relaxed;
	bh=3Owb5XSqlbYHN5e8UBAN77KeBXRDq0UmecajDR+D0Uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHnOAB2XLViUq2CU1YB6s7TE3lqIukEj6phkAyfNZGsYcPCmi/ECDF3UqqXH2qgWDcjdZ7EtBir+Rhf9z5oKeX3z58uibMvM5QDHM7Wupxbmzm5XQ9qBR+/K03I8oG4VNHVQYzSneIYZBgOVv93J2aJJhJGm6wZDxL3imIc9zQxqYp0gOzvJ1wN3fHGCEovAnNn7j1bvQMVDL2Fgiw+DYxHOQB/2MPrjvYafCPW5FHrimlG265KkGSwzGdyGh1xB2RWE+hKSLlrPlBgg1ximvYTPjlyk3DZrB6yFi44ezxhwr+gVPV97w/Jo5wBWLtLoSRq6OL1R5a2BJ8IyZ3eajA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eSDCpnlf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eSDCpnlf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y72jz45hMz2xbS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 02:30:31 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADraCF004058;
	Tue, 10 Dec 2024 15:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3Owb5X
	SqlbYHN5e8UBAN77KeBXRDq0UmecajDR+D0Uw=; b=eSDCpnlfbJ4B3NitoDywXd
	qfvPvbicps9nKjGR0P8C6RM1YfUO9h6/vzp653CTwd+iFsdYXFd1yCmyuOU6lfyj
	OUYB02n31VwPb081muL8wjys+UquGsR16eHt1AbA/ngMaTM+lCjSylJdwdlM1wpA
	Y7g83TEFNgjXlqzz8voo1zVe+8OW/zV8gBmNJ8e1A03XoFBeJYwii3FRSdxF1Qnw
	RUn7878ZxY+0ZlZMKppzHxrBCas2XSs8jXEbYSXOlPC5bS2t3TOZycheq0lxh4QQ
	RptiEdsDcT83EB2Sx8pneELtKNfcf432Ql2xigwcDHi0hhZpbdVA3wWnCWUJVbXw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce0xesc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:30:28 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADNnOW017428;
	Tue, 10 Dec 2024 15:30:27 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d3d1kur2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 15:30:27 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BAFUM2M20251178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 15:30:22 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 183B82004B;
	Tue, 10 Dec 2024 15:30:22 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C27B020043;
	Tue, 10 Dec 2024 15:30:21 +0000 (GMT)
Received: from [9.84.194.138] (unknown [9.84.194.138])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Dec 2024 15:30:21 +0000 (GMT)
Message-ID: <b1e849f7-269e-47f6-8f78-80d65b191bc8@linux.ibm.com>
Date: Tue, 10 Dec 2024 16:30:21 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] cxlflash: Remove driver
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ukrishn@linux.ibm.com, manoj@linux.ibm.com,
        clombard@linux.ibm.com, vaibhav@linux.ibm.com
References: <20241210072721.157323-1-ajd@linux.ibm.com>
 <20241210072721.157323-2-ajd@linux.ibm.com>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20241210072721.157323-2-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q75jYKPhQcdG50urwfxzvWpCl1QppcTc
X-Proofpoint-ORIG-GUID: Q75jYKPhQcdG50urwfxzvWpCl1QppcTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=717
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100115
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/12/2024 08:27, Andrew Donnellan wrote:
> Remove the cxlflash driver for IBM CAPI Flash devices.
> 
> The cxlflash driver has received minimal maintenance for some time, and
> the CAPI Flash hardware that uses it is no longer commercially available.
> 
> Thanks to Uma Krishnan, Matthew Ochs and Manoj Kumar for their work on
> this driver over the years.
> 
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>"

   Fred

