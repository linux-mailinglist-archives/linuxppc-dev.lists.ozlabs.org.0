Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23816ABF5F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 13:23:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVd5k5NDnz3cB8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 23:23:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=quu9mwhG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=quu9mwhG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVd4l4xJ9z3bhL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 23:22:31 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326BbTJI009007
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 Mar 2023 12:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=QmAhqNAd3+J+D0n6vJs2cKCz4d/ljZ9sfxSbaXlaTeY=;
 b=quu9mwhGLFUwB1rxdb3HvchxQcqA5hgIRVfC1unZgU66BdeP+DWMquNVYdXNu2QqWn4d
 jbrpBewznOmtfgLNPnmg0YeLAPXpoTDzPOE5/U9lKSlIvXcwa0Js0JvPpYmJUOwsqQXU
 pG/2M316PLDij+83Hh2UuGjbQJ3+b0Jgs81B86tfiMvoOmffKkVZbSb0XBJvh/tFGNSR
 sxxirW/x4WKjgnUvkxmHeU/bwgv5AOIfKdHUI1hIjyhmtMETOnUtlF5WPa/GFNEvxeEQ
 pZEaLqAzaW93rocPRGBVtX5Ou3BJhNAfROV5J+Ed+nQEzXSZICsR36tOntwJc2Nro1EC nA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4vp1wtv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 12:22:27 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326BqTXL007330
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 Mar 2023 12:22:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p4188apds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 12:22:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 326CMLpt31589046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Mar 2023 12:22:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1BBF20043;
	Mon,  6 Mar 2023 12:22:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0216120040;
	Mon,  6 Mar 2023 12:22:21 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.109.216.99])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  6 Mar 2023 12:22:20 +0000 (GMT)
Date: Mon, 6 Mar 2023 17:52:14 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
Message-ID: <ZAXa9kgkQ+vnWLEZ@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230220052355.109033-1-kconsul@linux.vnet.ibm.com>
 <20230220052355.109033-2-kconsul@linux.vnet.ibm.com>
 <2fa8dd2a-1650-4adc-de2b-0f14dca683ed@linux.ibm.com>
 <Y/MhON/N6vG8wYWq@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <9ee1f333-9cb7-d7fe-4e3f-ded4990030de@linux.ibm.com>
 <Y/MrOjca/C+bPmn1@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <Y/M6kFeUsLBwcbP0@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <Y/b1Hpk8rhrR+H9I@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <acb32fb3-c674-25fa-d6de-bcb6a4ce8f46@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acb32fb3-c674-25fa-d6de-bcb6a4ce8f46@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: elS2WDCanxnY_agciRfqsQRo9o0Bb0Yi
X-Proofpoint-GUID: elS2WDCanxnY_agciRfqsQRo9o0Bb0Yi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_05,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060106
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-02-24 16:45:45, Sathvika Vasireddy wrote:
> On 23/02/23 10:39, Kautuk Consul wrote:
> 
> > Hi Sathvika,
> > > Just one question though. Went through the code again and I think
> > > that this place shouldn't be proper to insert a SYM_FUNC_END
> > > because we haven't entered the guest at this point and the name
> > > of the function is kvmppc_hv_entry which  I think implies that
> > > this SYM_FUNC_END should be at some place after the HRFI_TO_GUEST.
> > > 
> > > What do you think ?
> > Any updates on this ? Is there any other way to avoid this warning ?
> Hmm, to mark the end of the kvmppc_hv_entry function, I think
> SYM_FUNC_END(kvmppc_hv_entry) should be placed before the next symbol, which
> is kvmppc_got_guest() in this case.
> 
> However, if you think it needs to be put at a different place, then it does
> not make sense to have any other symbols before that. You may want to
> consider checking if other macros like SYM_INNER_LABEL() can be used.

SYM_INNER_LABEL works fine for me. I will post a v2 with this change.

Thanks! :-)
> 
> - Sathvika
> 
