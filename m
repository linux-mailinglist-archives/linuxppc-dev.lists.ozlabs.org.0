Return-Path: <linuxppc-dev+bounces-12721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BBEBC7040
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 02:41:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chrfF1rT0z30NF;
	Thu,  9 Oct 2025 11:41:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759970485;
	cv=none; b=CG6M1oLVWp7Meke3Diwewjj7gMSiKNf28oSQm5m0UMEY4hIX8OrqJ3CvmrJ7KkvGy2PcEf52Pszl4QTyEUqbcCCyPT0jbFnf9PslZJv7d6r2Ex0m1t+HvLGizQmpiWP1O8zehL9Fxde2x/OL4rpZDxPpjSpnkNDIkIS808P0jf6wmKePdejfiEumwz6m2bjwCF4Y9LKcIdy3FNbzNquspb/Ra8A3goBzQwlfEKndUK1nMYicvWdoVnMzdtUeYCAblxlUi67wQKN8oEMx2hRmg5+OkXIF//j5mYKZIdPKHLRNLjPM4YEb+pl95cLlNq4ofSsGBQmdWrhT5+u7DNYf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759970485; c=relaxed/relaxed;
	bh=X1uEAUo9Wl+a6bB3iejTxXaXf2cfXqGB4eT/Jgnc1b0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aAgaHldT9w4y5QBuk56kWzbR0ATLzR5+zO6b3cLyQ7jrWdmNz1SXD1ZVrrpVJrukcKuaZ5C+wMhAgSsNmt7U6399k0IFIth/O4ydsa6azgILnCV1UTpaBjO8FHYELxGgxFU4u7UJ/rWP+yxmeC1K6n0NcgqqTUA1XCLZ3Rh+N64KX0OIVcaAjcWtwIrsub8XrTi8OGlsM8uhO5chFVf2aDHOZOTc3b6rR9tDI3XKnnxbwoTTQMIoceGNR5aKEWMxMM3FppqnXsQs4MUnV6n/PIvsSX+/vSw7qOjWclfyVRSxGTcipAs86wq1oNikH0TwnBdOZpz4Jmk4iEOkP3NF6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ilzzWjVG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ilzzWjVG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chrfC1GwCz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 11:41:22 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598HIG4J014342;
	Thu, 9 Oct 2025 00:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=X1uEAU
	o9Wl+a6bB3iejTxXaXf2cfXqGB4eT/Jgnc1b0=; b=ilzzWjVG8shBBOmqPtOtde
	ffbCTT+hU5za5QivClVwRTqv35cCALKeMJPel/8iZoddfT0vfkUkje6yfmKVbcQS
	5C5uyRxyXd0h7bh/yDJPHrLmRZ+OjDqZ7UXtNO15Rsm2vJpZqLoLP/H+/I8MHc8S
	ecilEond6nPMcOUYD8FEqTvo0Xo/Gvu2XavZ/4VRUx5C0eDuKBQm5eAjEInTVQ6p
	4rd2BH11KG/9eupeW73mulkXYODjXtrWHWNRLA5EgpKkLM8XTTzPki615W8iBruy
	jMPq55rx5fyO4ICdm6OEW0ySlzSyspRdV/BZ4Fu/9N2JAlnkGktiuf+UHPtgxMyw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49nv84hm0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 00:41:05 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5990d4cT005253;
	Thu, 9 Oct 2025 00:41:05 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49nv84hm0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 00:41:05 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 598L0RDw020966;
	Thu, 9 Oct 2025 00:41:04 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49nv9mskam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 00:41:04 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5990f3CQ24707826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Oct 2025 00:41:03 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F054158056;
	Thu,  9 Oct 2025 00:41:02 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A808758052;
	Thu,  9 Oct 2025 00:40:57 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.21.155])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Oct 2025 00:40:57 +0000 (GMT)
Message-ID: <19ffe9eeb8703656285cab6f0d819602860bb28b.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc, ocxl: Fix extraction of struct xive_irq_data
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nam Cao <namcao@linutronix.de>, Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael
 Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy	
 <christophe.leroy@csgroup.eu>,
        Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Ritesh Harjani (IBM)"	
 <ritesh.list@gmail.com>
Date: Thu, 09 Oct 2025 11:40:55 +1100
In-Reply-To: <20251008081359.1382699-1-namcao@linutronix.de>
References: <20251008081359.1382699-1-namcao@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
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
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=HKPO14tv c=1 sm=1 tr=0 ts=68e704a1 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=ORaXvX-jSRnqCH-k56AA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: qc41LZ5LRnou00jqr-qzsnTD1f3s1L5B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+AiqY55t6yVt
 WkA5/FNZiY0LVjd/uT6RSzioj0FQal/yJIwS9t+LRVcHY81T/QPAVkreq0692NRukSOtfS43Aly
 wtL+cyieojn+lukv3ur34R8wBiDE4ASh/0q0Ge2WrPXBwDi4EMTv5JkZEZOOT02FHjpDR38QDtt
 BAnzmg/Ne7ZrlETNWTBYKhvTxnUxOGue9f5UAIn8Rbp3J9gSsXurbeC8kvPHeGkdBAQvqQU5v9U
 aAcGwVoXm6MzhcuSIkvj8gRZQERCV6NXEsoPUIOfR/rlsFQ6UQtYhD0//ioC2UR2Z0doRjgeZPl
 CDhVPfGEJn4nKAIS2Kf1ltdeS/IJGJVGjjEdNzbeTZVkjemNTH0mjGFXsjz3w5oNVVPBgz4tbFt
 yW85omm8KpnYqxsekaNtEc98nEyy2Q==
X-Proofpoint-ORIG-GUID: 5rcrvfIYB7kqsqOT9o5GxnxQPaRznZJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 clxscore=1011 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-10-08 at 08:13 +0000, Nam Cao wrote:
> Commit cc0cc23babc9 ("powerpc/xive: Untangle xive from child interrupt
> controller drivers") changed xive_irq_data to be stashed to chip_data
> instead of handler_data. However, multiple places are still attempting to
> read xive_irq_data from handler_data and get a NULL pointer deference bug=
.
>=20
> Update them to read xive_irq_data from chip_data.
>=20
> Non-XIVE files which touch xive_irq_data seem quite strange to me,
> especially the ocxl driver. I think there ought to be an alternative
> platform-independent solution, instead of touching XIVE's data directly.
> Therefore, I think this whole thing should be cleaned up. But perhaps I
> just misunderstand something. In any case, this cleanup would not be
> trivial; for now, just get things working again.

ocxl has always done quite a few weird things...

>=20
> Fixes: cc0cc23babc9 ("powerpc/xive: Untangle xive from child interrupt
> controller drivers")
> Reported-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Closes:
> https://lore.kernel.org/linuxppc-dev/68e48df8.170a0220.4b4b0.217d@mx.goog=
le.com/
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>  # ocxl

> ---
> VAS and OCXL has not been tested. I noticed them while grepping.

Unfortunately I don't have convenient ocxl hardware on hand to test with an=
y
more (I'm sure the cards are floating around *somewhere* in the company...)=
, but
this looks like a straightforward change.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

