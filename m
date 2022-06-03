Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E991453C5BF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 09:10:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDvD16Wj6z3byk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 17:10:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LQw5xjvd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LQw5xjvd;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDvCG4GSZz2xTj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 17:09:45 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2534GVHD020211;
	Fri, 3 Jun 2022 07:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KZfRoad8SX8PkT9/OPMI8pGsib3g5BRL+ZPINcNFiY8=;
 b=LQw5xjvdUznXSIXDNf1AueU70N0Jf6WbJateSwsi8xQZeUZQqZ5ZjWCWcgJdenGIRpRv
 08d7zBr+555/3AS5udmNlNSmmPoVwoEK+xWmBYVd7orMI88CMXJRWR23pzhB5gGezbyP
 u1chDql1hbkP+zKUKeXm/FUPVDdL6JP8r28Jd9vaBSlCzzIJi5kCBjofiiM5/bJe/nxG
 hRHbR6qtsJyaaO/YdyTPOeFF6epMyDTnLHvyEX/mfpshu/ktQmqUo/n1LoWppixf+gk4
 wKWyJyiOc4trLeukex7uEK42a35Lz2QwKsa5RoMQ5PW83bNvc4fsDQLn35vu3bJTBMRB uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gf6t3x7jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jun 2022 07:09:39 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2536mSVW015822;
	Fri, 3 Jun 2022 07:09:39 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gf6t3x7j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jun 2022 07:09:39 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25375Exm006015;
	Fri, 3 Jun 2022 07:09:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma02fra.de.ibm.com with ESMTP id 3gbcc6e4a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jun 2022 07:09:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25379YKK49217878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jun 2022 07:09:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D078A404D;
	Fri,  3 Jun 2022 07:09:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 183DBA4040;
	Fri,  3 Jun 2022 07:09:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  3 Jun 2022 07:09:34 +0000 (GMT)
Received: from [9.43.199.24] (unknown [9.43.199.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DF39F600FE;
	Fri,  3 Jun 2022 17:09:30 +1000 (AEST)
Message-ID: <6683e7913a993251de2c491ece0879cae74d4402.camel@linux.ibm.com>
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 03 Jun 2022 17:09:27 +1000
In-Reply-To: <4900183A-EABD-427D-A930-F2D44DD59C94@linux.ibm.com>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
	 <20220601054850.250287-2-rmclure@linux.ibm.com>
	 <d5a2d52a-a74b-3df8-8772-f37d61d47641@csgroup.eu>
	 <4900183A-EABD-427D-A930-F2D44DD59C94@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2JTWmrYc2UPeTxX-Glpw_09q3HfXN_Pz
X-Proofpoint-ORIG-GUID: xJ59NvI5kHPmOKGxu6_sFM8oJIvdOVq3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_01,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 mlxlogscore=408 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206030030
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-06-03 at 13:24 +1000, Rohan McLure wrote:
> The implementation of ppc_personality can be immediately reworked to
> call ksys_personality, but I can’t do the same for sys_old_select for
> example, which is required to implement ppc_select. As such we emit
> both 

For ppc_select, I suggest we resurrect
https://lore.kernel.org/lkml/5811950d-ef14-d416-35e6-d694ef920a7d@csgroup.eu/T/#u
and just get rid of the hack.


Andrew

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

