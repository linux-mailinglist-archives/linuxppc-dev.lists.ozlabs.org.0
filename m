Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2998A11C524
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 06:10:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YMLG1hv8zDqwV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 16:09:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YMHz06QSzDqSh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 16:07:58 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBC57O5C048562; Thu, 12 Dec 2019 00:07:29 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wtf704v95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 00:07:29 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBC57QtT048651;
 Thu, 12 Dec 2019 00:07:26 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wtf704v7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 00:07:26 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBC528Ih010339;
 Thu, 12 Dec 2019 05:07:24 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 2wr3q75s0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 05:07:24 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBC57NFE8454554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Dec 2019 05:07:23 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25032124054;
 Thu, 12 Dec 2019 05:07:23 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4878B124053;
 Thu, 12 Dec 2019 05:07:22 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Dec 2019 05:07:22 +0000 (GMT)
Subject: Re: [PATCH V2 00/13] powerpc/vas: Page fault handling for user
 space NX requests
From: Haren Myneni <haren@linux.ibm.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
In-Reply-To: <20191209083806.GA3152@gate.crashing.org>
References: <1575861522.16318.9.camel@hbabu-laptop>
 <8ba807dd-9d5a-e42a-60e8-f9ad648026bf@c-s.fr>
 <20191209083806.GA3152@gate.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Dec 2019 21:05:38 -0800
Message-ID: <1576127138.16318.43.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_01:2019-12-12,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912120030
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, hch@infradead.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-12-09 at 02:38 -0600, Segher Boessenkool wrote:
> Hi!
> 
> On Mon, Dec 09, 2019 at 06:37:09AM +0100, Christophe Leroy wrote:
> > What do you mean by NX ?
> 
> It is the Power9 "Nest Accelerator".  The patch series should ideally
> mention that right at the start, yeah.

Thanks, NX (Nest Accelerator) is introduced since power7+
(drivers/crypto/nx/)

Whereas on power9, VAS (Virtual Accelerator Switchboard) is introduced
which allows to open multiple channels to communicate with NX. kernel or
user space can interact with NX directly using copy/paste instructions.
Kernel support with NX-842 compression is already included in kernel. 

In the case of user space, NX can see page fault on the request buffer
and interrupts OS to handle this fault. This patch series adds page
fault handling in VAS for user space requests. 

I will repost this patch with more explanation on NX. 

> 
> > Up to now, NX has been standing for No-eXecute. That's a bit in segment 
> > registers on book3s/32 to forbid executing code.
> 
> That bit is called just N fwiw (and not really specific to 32-bit -- on
> 64-bit implementations it was part of segment table entries, and of SLB
> entries on newer machines).
> 
> 
> Segher


