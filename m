Return-Path: <linuxppc-dev+bounces-15018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAAACDF400
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 05:24:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddTrz5sqzz2yNX;
	Sat, 27 Dec 2025 15:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766809459;
	cv=none; b=D+/ZEhA03jENF8FieDCpGzxEqkPm3Usp6oVfeGzBiyh4h4blsaVaGe1TjWPJAecxjsfvRkBDIizaVuT7WrArsS2Ix/VmfW49npEyfi6rpn2CubzOpJKOKh8OsLmtrMlD7aVC4HU37+tvsAhBzKuG3+B2AjjM/a0Q89OosWMwb+T3rcy7t5wARRomZzUv+p/cgrrCH5DNkHuDwmUESVwV3cCRCIlsmVmd8gN4+XzX9KylSKzz1yrQZm4P+KxctKu1jj8aZTGTV8No1z4Xi9dNMIc4SwSWgD+ABlCHln5H0ZPSXmKSkuAsQGJ6gzqFWDPs04/CgAFrWPN4zJ5KFqn+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766809459; c=relaxed/relaxed;
	bh=T4SjjNiM3QrHUXvGqwS/8fjEUNdNG98kgkLuHsi/dGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRmkiiqFJ6wgj+qGc6atf4aqdY1UgMHmJsMrQ6tiqe60577n76M8mXqm+TNUVH3IMar9vQoUppwxh/Gkx3pXVmpCNzjXPP3Aw51bi4rjyDquki6JKdPWD9xj7j4wUBa8L8VYmkFKyiloQLqLtlkfDmKyJcv3E/oT2JXF1iKdDtDfs9N351TN0W1dPfotRm59p+QgxUMnhA8e9NbolEYOexh5B8uz6mnhZ3m4D8YrEX0swTMaDk57eDXVzs2jkNo1Go2JowmnAxlxG9xOzRZPkM4uggCn0w8WKZ1X/vo7rPA61tEIkhmFaLITC4X7Big58ZV7Oy5hraJD5v2LdcxWHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o53IPqlG; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o53IPqlG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddTrz1NZzz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 15:24:19 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BR3H236020943;
	Sat, 27 Dec 2025 04:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=T4SjjN
	iM3QrHUXvGqwS/8fjEUNdNG98kgkLuHsi/dGc=; b=o53IPqlGV8tVO/fUx2Gjej
	9tEFGVez1QoqhkpsnHbDhkRJRFYMqBcWrcl/9LLZAt3Ixetuo902zmCw1Mu+OVec
	B+aQWDkxVgn3BsGhAxq5jC6yD4ErxdlVM1aAbYyLhFSuE9erF/cEszErPPIIRpiM
	lpHaWLgrbfQVUtq8xYme0XpHmmRd+SpOMirsIpt5VNlNytky+ez7pcwTM7jS76zd
	uPL4/J+kSWiVscbm3f5bSiDwW1/GgisdnRcjSBAxZ0gsS18PC5t23253Xnrv/731
	dWl26aad7bcLKVmWnGUDm8QNyZRRwngQdSV+1rH6LLi/zU0aowqkJs/duZvJMjWw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba764g4sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:24:01 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BR4JsqF029278;
	Sat, 27 Dec 2025 04:24:01 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba764g4sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:24:00 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BQNqTeT032307;
	Sat, 27 Dec 2025 04:24:00 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b68u1j9d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:23:59 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BR4NwCM30409202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 27 Dec 2025 04:23:58 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5569020043;
	Sat, 27 Dec 2025 04:23:58 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88C3320040;
	Sat, 27 Dec 2025 04:23:55 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.124.212.100])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 27 Dec 2025 04:23:55 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc: Cedar Maxwell <cedarmaxwell@mac.com>, Stan Johnson <userm57@yahoo.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] powerpc: Add reloc_offset() to font bitmap pointer used for bootx_printf()
Date: Sat, 27 Dec 2025 09:53:54 +0530
Message-ID: <176680916368.22434.818943585854783800.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <22b3b247425a052b079ab84da926706b3702c2c7.1762731022.git.fthain@linux-m68k.org>
References: <22b3b247425a052b079ab84da926706b3702c2c7.1762731022.git.fthain@linux-m68k.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDAzNSBTYWx0ZWRfX7YD+772Jl7hL
 gv2DTJTqI5rKea2XNqxU33v24SBIdmG3g7QiQx6/aMIuHh6WMDqSdi251W3ffGzYTNjyLrfz4kt
 LtlfBkbcOp0K3BnwneYs+UvCggOfqkK594/2jVRpSL3JXsW5IYV+7Az9EqRZtLjvB9tIAmQlUe4
 JoknniGGkOC7IHf2BXH1psKKXj8qOEcTa+aHa6ktJ07+KcXIxgC98OXZfb3B+jeVtFbxV0QJ71F
 WBfkCleJX+DyB3hLtBTJI5hbM8xJvNMgQQMDd1qU6DFFPZDVvshlbeFLNb1D8GiiQxwl+BOkOx6
 g1kAzD11xmZgbMROKZAN16CLhH0ra0TLMhGlDWCo/6hhO4/HG0YtNpZcUFFwXW8wI5ZD2ZPaS/Z
 KwbfJeV3WkfxXWVams8YXhCCjTsluXkoAgZz8pMSu14PNJ7yJuOl1bfMfBBt9cxEOeN6TRl4Ri4
 62NoHTneu7btBVAcixw==
X-Proofpoint-GUID: 7W8Z8S-viCpKr8bXbvNZem5mZaqEfon8
X-Authority-Analysis: v=2.4 cv=B4+0EetM c=1 sm=1 tr=0 ts=694f5f61 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=gOFnQ4ukdvCLGlC3dh8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: hPqcJbTMXXTVhr5jiATGI2hbu7Y8nAZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2512270035
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 10 Nov 2025 10:30:22 +1100, Finn Thain wrote:
> Since Linux v6.7, booting using BootX on an Old World PowerMac produces
> an early crash. Stan Johnson writes, "the symptoms are that the screen
> goes blank and the backlight stays on, and the system freezes (Linux
> doesn't boot)."
> 
> Further testing revealed that the failure can be avoided by disabling
> CONFIG_BOOTX_TEXT. Bisection revealed that the regression was caused by
> a change to the font bitmap pointer that's used when btext_init() begins
> painting characters on the display, early in the boot process.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Add reloc_offset() to font bitmap pointer used for bootx_printf()
      https://git.kernel.org/powerpc/c/b94b73567561642323617155bf4ee24ef0d258fe

cheers

