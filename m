Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC3F560E9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 03:11:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYKzC5RRfz3dpS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 11:11:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JI3uHkZ9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JI3uHkZ9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYKyV6pKpz3blt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 11:10:42 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U0F3a4020977;
	Thu, 30 Jun 2022 01:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=08maBmU2zwc18S1ZnhyuuxoF4jG8GN39u+vyXu7pUX8=;
 b=JI3uHkZ94NfhrDXcq6cCGaWaSUpgSz705XWt6bHujD1rjykwHeDIXH8aJdvDlfawxXUT
 NR2+6LduHLEP+wkqlK5Q0bmmE7Bzv2GtHydCQ98wX379GDu7VwNzR0pp5lRKJuImmDh1
 uoOBNFWWXbFfMsQZM+ofpisQ6SEsX8WPiQt4E7ISTpRTtQW0b5qjjihW2NRNj0v/z7ZP
 8xeZ0I8NY3nmpdwdCWliHzmVWfDmwHQh3NVku3aj3DF/e37PSpmYxy8vmsLbj/E9dwqx
 qm3f+ImYddDFNVTgIXbJGcP0zAer9It1pNyKI1+40vti7pQsgauMcjEACv6YFUCFGTfx ig== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h114fhh7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 01:10:27 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25U15Kav030434;
	Thu, 30 Jun 2022 01:10:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3gwsmj7a0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 01:10:24 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25U19K7u21758428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 01:09:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B663752057;
	Thu, 30 Jun 2022 01:10:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 60E3C5204F;
	Thu, 30 Jun 2022 01:10:22 +0000 (GMT)
Received: from [9.43.183.201] (unknown [9.43.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3117460213;
	Thu, 30 Jun 2022 11:10:15 +1000 (AEST)
Message-ID: <fbc5d92a4028349aea0d89232db4795fb189ced4.camel@linux.ibm.com>
Subject: Re: [PATCH] cxl: drop unexpected word "the" in the comments
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Michael Ellerman <patch-notifications@ellerman.id.au>, arnd@arndb.de,
        fbarrat@linux.ibm.com, Jiang Jian <jiangjian@cdjrlc.com>
Date: Thu, 30 Jun 2022 11:10:13 +1000
In-Reply-To: <165650492410.3004956.4938254521446368740.b4-ty@ellerman.id.au>
References: <20220621125321.122280-1-jiangjian@cdjrlc.com>
	 <165650492410.3004956.4938254521446368740.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: suRAP0RCY9WmH9RIQQEv05IIVyEhkbAu
X-Proofpoint-ORIG-GUID: suRAP0RCY9WmH9RIQQEv05IIVyEhkbAu
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-29_24,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=771 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300001
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-06-29 at 22:15 +1000, Michael Ellerman wrote:
> On Tue, 21 Jun 2022 20:53:21 +0800, Jiang Jian wrote:
> > there is an unexpected word "the" in the comments that need to be
> > dropped
> > 
> > file: drivers/misc/cxl/cxl.h
> > line: 1107
> > +/* check if the given pci_dev is on the the cxl vphb bus */
> > changed to
> > +/* check if the given pci_dev is on the cxl vphb bus */
> > 
> > [...]
> 
> Applied to powerpc/next.
> 
> [1/1] cxl: drop unexpected word "the" in the comments
>      
> https://git.kernel.org/powerpc/c/882c835b71e22ca82361dab3b60b85b557abd72f

I believe Greg's already merged this in char-misc...


Andrew


