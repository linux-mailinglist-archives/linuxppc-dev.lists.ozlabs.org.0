Return-Path: <linuxppc-dev+bounces-51-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E6995033F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 13:06:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=opX3cwBQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjpVC210cz2xsd;
	Tue, 13 Aug 2024 21:06:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=opX3cwBQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjpVB5JQNz2xjk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 21:06:25 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D5vCCg006350;
	Tue, 13 Aug 2024 11:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	LrnWMI2sW0l9sbvkFKJxapnPOwSQwYnJ2B+oUehGzxo=; b=opX3cwBQmc8m0dlW
	Vvv3ZZMkX1lUYLWnYjAoqaWhBPIRE0vhGdA7/eKR+TweNA6lWfGZH3E2AKa+R0Mb
	yOE4b8si3iEW0RQwZo/jNsWE2/uXQWOQDZjiXQ1WOVniRfJ9MBiZil1FoiXFNnVN
	FgfArPERTAd4Gfi13wcLqqyHpN+aDeqtDwuhNs/mXmZgNGjyXW3AQ/abIALV4xH7
	3Oe/TqhpQf+eGRYB+8fuBSXOQ2pnlyo0d4Y5JPIEc9aRzmhJgN0diMoKVkgCXQ3U
	wkNduTpXUWmbhNXTzfDrFwGVbDxaEUZhAsnhAKC1NirmJSj6N0t6QNE0SAPGDAmC
	Z7Z55g==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40wyq8qn3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 11:06:18 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47D7VsWa011541;
	Tue, 13 Aug 2024 11:06:17 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 40xjhu3e3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 11:06:17 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47DB6EDL47776028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Aug 2024 11:06:16 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2728F20043;
	Tue, 13 Aug 2024 11:06:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD4FE20040;
	Tue, 13 Aug 2024 11:06:13 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Aug 2024 11:06:13 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.11.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B8E9F6047D;
	Tue, 13 Aug 2024 21:06:07 +1000 (AEST)
Message-ID: <0ff6502cda3c0a8e1da6bcb0e93c57bf79e0d822.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] cxl: Use of_property_ accessor functions
From: Andrew Donnellan <ajd@linux.ibm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Frederic Barrat
	 <fbarrat@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Tue, 13 Aug 2024 21:06:03 +1000
In-Reply-To: <20240729-dt-cxl-cleanup-v1-2-a75eea80d231@kernel.org>
References: <20240729-dt-cxl-cleanup-v1-0-a75eea80d231@kernel.org>
	 <20240729-dt-cxl-cleanup-v1-2-a75eea80d231@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jlTwPcSJ4WzeS86caMpvb9Nax8wP9JOx
X-Proofpoint-ORIG-GUID: jlTwPcSJ4WzeS86caMpvb9Nax8wP9JOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_02,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=834 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 clxscore=1011 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130079

On Mon, 2024-07-29 at 16:36 -0600, Rob Herring (Arm) wrote:
> The CXL driver has its own custom implementations of typed DT
> property
> accessors. Replace the custom property accessor functions with the
> common DT property functions.
>=20
> This clean-up is part of a larger effort to remove of_get_property()
> and
> other DT functions which leak pointers to DT node and property data.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

This patch leaves two uses of of_get_property() (in read_phys_addr()
and read_adapter_irq_config()) - are you planning to get rid of those
in a future patch?

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

