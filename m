Return-Path: <linuxppc-dev+bounces-4215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFF09F4142
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 04:38:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC2Zq6vzdz2yhM;
	Tue, 17 Dec 2024 14:38:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734406691;
	cv=none; b=gexPhUWFmqRq5M2dkS+a70NZBYZ3XbtcgBS4c8NhT1+qjdAyDra63xxZXvA3WF5utnOgiVfoEuOdZAp4MS4lxry7cviC0b/jyO9RDaoUG6p+YFt7Lc5PHifk+iEcWsDvY9kyqyA5s4N0Sk8Xrb3HCeWVc1yEft6KKLkMJtdaWS27AuiaWKbiMdfR+K/3RiobxL+vugJ421vsV9c9TWrrnjtoevMJ0E3x1nmYLrEALf2iPQYtV9mF2bNSh9QL48PASQ/OWI7PLRHSvEPh/Ql7XtIqh7ZZxo302+2d6d02wJHJGFcq4tLAnnxdaN9MpWElmCY7cQAqEoI1Fz5mJWkmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734406691; c=relaxed/relaxed;
	bh=W/EYExNw7bDLI6vxKJi1hTwK7cusd4HrTgeSMRBNl00=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A1xHhwM8deS80x1AoR7F5KERkhpZrkIA4+MZOEta7SyBUVpF09iCSj+tgWWykEYFI9lKNEIpgJ3AjiYmnEmOCe6sXi7uZYsc2k48vH9yfJRhhS7hxLLSi3/k9fZ6EX4pvdP5N0SJI31k7QEY9a0osaBtBJaE+xerLnE6wKHd1tFaY+mTwQ60RasXE995bF1Y3or7TOGiybvjfJOdVwgpPsv3IvAG+uZdcRy4lj54vJ1r0wZXP3J7+YzGf97Oa0p0BQ+YuRMZ7hUXdLrEIubY4em5D+Lh/nczB3jR1lDdrq8K8WlYDAgM3kqQaQKzf+lzCLeMLpc6ZfLJcj+SeB21SA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DACmA3vP; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DACmA3vP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC2Zp4FqTz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 14:38:10 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH20V3W012693;
	Tue, 17 Dec 2024 03:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=W/EYEx
	Nw7bDLI6vxKJi1hTwK7cusd4HrTgeSMRBNl00=; b=DACmA3vPLI03Wiw9HnOMU3
	HYTXKNpNr+RRBbkirlSSj/eOp0N9gyif2UOC2evgYGK1Kv4Zly1qMXbl5qSRO0rd
	DXTJAk7/YlZjm9hYbaegOYKE8rR5/z7+ruafb0z6jZ3tOX9zrXBCmKmzORNd7PeG
	TgJyCU1aGPFOqvsjvwbpHUtyYeKjbPUZT4Q7shvaAMAk9sUhokIWUWvy2DSBd6hC
	vD169jIhoVwlyg0O7I5JwIeugK2YW7SBaoDE+WmyUwh7TXa51kDPXUhBQIV6I+H4
	RW2KzvnPbV7QMbLSAoht6bgvXJDwL/D93PxwCzIVs855gJfplR/+3V9mBqPICEqw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jnp4k5gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 03:37:59 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH1MNct029329;
	Tue, 17 Dec 2024 03:37:58 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hmbsh803-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 03:37:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH3bvcK54133060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 03:37:57 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C8EA2004B;
	Tue, 17 Dec 2024 03:37:57 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91D3320043;
	Tue, 17 Dec 2024 03:37:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 03:37:56 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.9.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 778366012E;
	Tue, 17 Dec 2024 14:37:49 +1100 (AEDT)
Message-ID: <304976a5672d282dea6158725a49f5148790609b.camel@linux.ibm.com>
Subject: Re: [PATCH 0/2] Remove cxl and cxlflash drivers
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Michael Ellerman <mpe@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, ukrishn@linux.ibm.com,
        manoj@linux.ibm.com, clombard@linux.ibm.com, vaibhav@linux.ibm.com
Date: Tue, 17 Dec 2024 14:37:39 +1100
In-Reply-To: <87y10f2do3.fsf@mpe.ellerman.id.au>
References: <20241210072721.157323-1-ajd@linux.ibm.com>
	 <87y10f2do3.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3zvAuoMJTgqJv1zFjUgFGI8yN0Sjfntq
X-Proofpoint-ORIG-GUID: 3zvAuoMJTgqJv1zFjUgFGI8yN0Sjfntq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=667
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 2024-12-17 at 14:26 +1100, Michael Ellerman wrote:
> It would be good to explain that this only removes support for the
> original CAPI interface - not the Power9 "OpenCAPI", which is still
> supported by drivers/misc/ocxl.

Agreed, will mention if/when I respin this

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

