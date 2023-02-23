Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4396A0245
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 06:10:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMh1n1mR8z3cLm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 16:10:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ve+iw/Jf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ve+iw/Jf;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMh0p0bzTz3bjf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 16:10:01 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31N3hZ4m016412
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 05:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=QFTxXYwAdZ/uBDnhR++pxZRjQaYzGpd1MssC4tZGGRw=;
 b=Ve+iw/JfMLPOu3gYgHdtWZpepaEkmx+sYowREVACGuZ8rYsoURn+9kKyw2fTEruDDPW9
 TvEomOoqOec2pU1sZ82NcLqgT6SifJOWqayj6NM829Pbm/JSrWzPVQ1efEZ8qCTKJfw/
 Dw5tGuKPgncSmuV3UmEf3L6eTCqzknF3/bZKeasR0RQlyL4xYMIgmv7Vf8RgNccaZogG
 0xDAY1u+c8FCHkcTWClxMH49tto0ksv1/2pQjmyelbhqn/P+R6L4Mb/rdWmKadz49d38
 Ecto7toPdOGRt3KA/+69eiloaMZYTA5nn2c2feQ72+5N4K9EbcJSvILc4zCX6Cz20XjE bA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nx0g6haa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 05:09:58 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31M9OANZ014704
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 05:09:56 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3ntpa64qc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 05:09:56 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31N59rEf41353554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 05:09:53 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C6752004B;
	Thu, 23 Feb 2023 05:09:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E90C20040;
	Thu, 23 Feb 2023 05:09:52 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.109.216.99])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 23 Feb 2023 05:09:52 +0000 (GMT)
Date: Thu, 23 Feb 2023 10:39:50 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
Message-ID: <Y/b1Hpk8rhrR+H9I@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230220052355.109033-1-kconsul@linux.vnet.ibm.com>
 <20230220052355.109033-2-kconsul@linux.vnet.ibm.com>
 <2fa8dd2a-1650-4adc-de2b-0f14dca683ed@linux.ibm.com>
 <Y/MhON/N6vG8wYWq@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <9ee1f333-9cb7-d7fe-4e3f-ded4990030de@linux.ibm.com>
 <Y/MrOjca/C+bPmn1@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <Y/M6kFeUsLBwcbP0@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/M6kFeUsLBwcbP0@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 27eO-ONk-3zgqJxmmLrQwSaxzZve8S9r
X-Proofpoint-ORIG-GUID: 27eO-ONk-3zgqJxmmLrQwSaxzZve8S9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_02,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302230038
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

Hi Sathvika,
> 
> Just one question though. Went through the code again and I think
> that this place shouldn't be proper to insert a SYM_FUNC_END
> because we haven't entered the guest at this point and the name
> of the function is kvmppc_hv_entry which  I think implies that
> this SYM_FUNC_END should be at some place after the HRFI_TO_GUEST.
> 
> What do you think ?
Any updates on this ? Is there any other way to avoid this warning ?
