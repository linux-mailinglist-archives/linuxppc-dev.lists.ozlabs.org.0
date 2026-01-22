Return-Path: <linuxppc-dev+bounces-16172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOxBMZSbcmkFnAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:50:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D326DF10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:50:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxvqj1BxNz30Pr;
	Fri, 23 Jan 2026 08:50:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769066099;
	cv=none; b=QAcmsYY1JrxjY5eVQyHBqNsE00WPzzT5amuldkDNJOnDSF1k2yQros55hBrhQEerIAy62LgEiKBNloZgPJXPv0V5SrgoqRyYh0AfFk4C9ShefaHVIA5Yhd0GDmEthFM1HWQwhgtzFzWprc01ZF2XT1qpupSJU6CXXp/nH00p78Tejmvno+PNGtwOVzQtkm2Yw3sM7W+sn1XCgRk2wlPEX0jeuR3pVu/ykILtq0rTC/TlL57Zuj1J/LZUqYTNoI32lWBYWfEWGf+cOL34l4YG39TXXS+CSCb036EE2wPLkPhpBxwRa1H/Q2LpahHb5Qcri4PvSFPC3ceiqKJJ6Sh1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769066099; c=relaxed/relaxed;
	bh=Y9gY9EPIOCfX5PEhIg/pLH6vuJJU6y/EFzoU6HjZNgo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=bScodWI5yI+NG6YUIw53xyOg5VIlTOfSCrGa0E4j+6ezNsxk/+XRyZ0GHdMZzzqN9EwFA/osUT7OvW/bhWe2YqdH89v+2sX9qN2mWDx3Mu3zChNES9sAdXVrYZcjX9dZsLUB2xD8i1EmaWu/jcGSchR54So3tdcYNntXIOI4p6W54P0X65JVY5KdgWZgJVmeVE4PkayXnZiT/9xTvUGd06lbF0nh7pvKEoP81ylW0/+7XtapThHdkRVfoT2Mag8eii2W+dVIbl6NlUJeCa9vi0AmjcDR4gXcl82GMiC8Oq40lVBKTtbYHIXKZP3S/KwrWau0przqW4iI6+u/KP8LaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eXKPeB1G; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=trupti@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eXKPeB1G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=trupti@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxXPt6KSgz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 18:14:58 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60LNXdwY021306;
	Thu, 22 Jan 2026 07:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Y9gY9E
	PIOCfX5PEhIg/pLH6vuJJU6y/EFzoU6HjZNgo=; b=eXKPeB1GwlqVNdmF4XZXFQ
	HSzKofCQmTH4sotYCW7tmyLzuPLbqpO3Mu6wwFQX9EAvgO/cG0QPCs0XyVLQXlwR
	gw9GbcUHw38S590UkyPJCC5wTzubrlmteTee7H/d7EIyWDT1ynvoBHN/dSM/3V1v
	5Yk4cM29z6FOw1PdSa+nCaFOoZcsuleLdmXYmV6PXEfsQ7kg1cwoawAyqpz0k9Z+
	6WGeRNrBGffy0FkXhTxrNhlQ6svAqe2mEPNkMQwkavdVmNkWrYNWV2OE10+0kfIE
	W5H9RbM/QgBLNdf25955MKmWmZ6yhbRcKZrUVf0KQJaFsSZV7OXsk1Tb9FK41TVQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt612baa7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 07:14:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60M6pKpJ009266;
	Thu, 22 Jan 2026 07:14:48 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brp8kgndv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 07:14:48 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60M7Em2O2294420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 07:14:48 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AFED58053;
	Thu, 22 Jan 2026 07:14:48 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3F8558043;
	Thu, 22 Jan 2026 07:14:47 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Jan 2026 07:14:47 +0000 (GMT)
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
Precedence: list
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 12:44:47 +0530
From: Trupti <trupti@linux.ibm.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: debian-powerpc <debian-powerpc@lists.debian.org>,
        linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,
        gentoo-powerpc@lists.gentoo.org
Subject: Re: Github tracker for PowerPC issues
In-Reply-To: <1534D914-DAFF-4008-87ED-E887BA0DC070@physik.fu-berlin.de>
References: <f80cd9f9b91966862ece4bb270460198@linux.ibm.com>
 <1534D914-DAFF-4008-87ED-E887BA0DC070@physik.fu-berlin.de>
Message-ID: <7601fc49e07533b891609ec72e315db9@linux.ibm.com>
X-Sender: trupti@linux.ibm.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: upTOlzUUZahsdtEKvT5xRNQiz4JeCbGR
X-Authority-Analysis: v=2.4 cv=LaIxKzfi c=1 sm=1 tr=0 ts=6971ce69 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Bn48Lc1lnD29vORwN3EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: upTOlzUUZahsdtEKvT5xRNQiz4JeCbGR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA0MyBTYWx0ZWRfXxVdhNy7PmL/x
 6+domJRzomS/vxxY17GN+/pdmdVrCYeHCwhrWPId8MuSgZfER314OoeGUbBohOYkJ/jHsqBEYxv
 GAlo9u4kgWyUfpvs4PljCA65IDoVWb5Oq775X5ph0Br4BkTwSxqvdPR5MsGDUd+haECt9urqs46
 BVHq2/Vet7rddjpFZRIX1zRG8nGpodOPOkWVF2hf2U6r1IiQGDZheYBd/SWYv1O0AKl+47JQthk
 lJHDo/C3xj3xN5yHBhpTU3tIWd6p6cByIcKtq67OkmbqPP/uMTSxZhmFEe5EviSDv1CE6/g3nDQ
 2z+7u9RUr0wEDFrzvX3PvbEi3w9OsxwZgOOEeQfRyYUd7r6nvmo0m5U3U6+xYzpjvbgQGcp79kK
 VyCtrDRB+99xmzQ79DyztzvacTnI+hY3gBXyULjSHPcMzhDhRxkXSMtrj9y+FUOX6p6HRPP0Eo6
 d+Y0Rt7d8+lfmyhoIpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601220043
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	TAGGED_FROM(0.00)[bounces-16172-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:glaubitz@physik.fu-berlin.de,m:debian-powerpc@lists.debian.org,m:linuxppc-dev@lists.ozlabs.org,m:gentoo-powerpc@lists.gentoo.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[trupti@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[trupti@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.216];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D5D326DF10
X-Rspamd-Action: no action

On 2026-01-22 12:25, John Paul Adrian Glaubitz wrote:
> But I’m not talking about Debian-specific issues. Tracking
> Debian-specific issues happens in Debian.
> 
> When I report an issue in the GHC Haskell compiler on PowerPC, it
> belongs in the existing tracker. Doesn’t it?
> 
> Adrian

That makes sense, thanks for clarifying. I agree, we can use the 
existing issue tracker for this.


Thanks,
Trupti

