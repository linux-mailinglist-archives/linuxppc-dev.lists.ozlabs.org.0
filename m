Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B9454B2A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 15:58:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMqln0lvNz3f02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 23:58:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iFdnXNH1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iFdnXNH1;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMqkv4PTlz3dvT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 23:57:43 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EDBlRm007102;
	Tue, 14 Jun 2022 13:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=w+9akwkFHTiQ67uemYwVl8Xj4ZU6Hq+lsYsJB/kAb3Y=;
 b=iFdnXNH1IYmid/rV1sAkwR0vY4XC1y4tlxjoLgnfUciadudDfXyFuax+qzIZBGP/sjBJ
 edlx3eRKiN4O5DRHGQBMdXScYpL8Zr7iFwT7FBXla7qLiI2iJLLrwFQW54v6Vxm1zlpv
 WGh7E0KyEed2Supu9r9iWXq+RzGt8sCnesOP8GsFZYlSgGAgWB+VFW2SHFker0o5Acm/
 lwOSflhTtT1OilYBIXx1jE4gp2Q+ZGwzZrLTXjOKfLdlagAI2D9Amyt+EQEJS7wqJmLz
 EXwsXn81BBJ1d2yCDPFeQH9uK5CjfXmsqDe+JbMoXaV2OC/B5fef7KxSLHi5fcGJRNMo HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gppbr1sey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 13:57:38 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25EDF6Y2020296;
	Tue, 14 Jun 2022 13:57:38 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gppbr1sed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 13:57:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25EDpP2G007434;
	Tue, 14 Jun 2022 13:57:36 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3gmjp94dpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 13:57:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25EDvYI919661178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jun 2022 13:57:34 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 195AA11C04A;
	Tue, 14 Jun 2022 13:57:34 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B830D11C052;
	Tue, 14 Jun 2022 13:57:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jun 2022 13:57:33 +0000 (GMT)
Received: from [9.43.195.101] (unknown [9.43.195.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 08AD660236;
	Tue, 14 Jun 2022 23:57:29 +1000 (AEST)
Message-ID: <8de471d6c779dde1124d58c5ddd993d62a479763.camel@linux.ibm.com>
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rohan McLure
	 <rmclure@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 14 Jun 2022 23:57:26 +1000
In-Reply-To: <8e7f310d-00bd-7b49-32a4-af33dd124b25@csgroup.eu>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
	 <20220601054850.250287-2-rmclure@linux.ibm.com>
	 <d5a2d52a-a74b-3df8-8772-f37d61d47641@csgroup.eu>
	 <4900183A-EABD-427D-A930-F2D44DD59C94@linux.ibm.com>
	 <6683e7913a993251de2c491ece0879cae74d4402.camel@linux.ibm.com>
	 <8e7f310d-00bd-7b49-32a4-af33dd124b25@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BoDlOLwQZtJT73Ulc12ULgS7NgI-9V6Y
X-Proofpoint-ORIG-GUID: orfmNS8LoawqxdviJ2tTxxnwjPw18EG6
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_04,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=680
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206140054
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

On Fri, 2022-06-03 at 08:39 +0000, Christophe Leroy wrote:
> 
> 
> Le 03/06/2022 à 09:09, Andrew Donnellan a écrit :
> > On Fri, 2022-06-03 at 13:24 +1000, Rohan McLure wrote:
> > > The implementation of ppc_personality can be immediately reworked
> > > to
> > > call ksys_personality, but I can’t do the same for sys_old_select
> > > for
> > > example, which is required to implement ppc_select. As such we
> > > emit
> > > both
> > 
> > For ppc_select, I suggest we resurrect
> >  
> > https://lore.kernel.org/lkml/5811950d-ef14-d416-35e6-d694ef920a7d@csgroup.eu/T/#u
> > and just get rid of the hack.
> > 
> 
> Not sure I understand, what would you like to resurrect ? You want to
> resurrect the discussion, or revert commit fd69d544b0e7 
> ("powerpc/syscalls: Use sys_old_select() in ppc_select()") ?

We should get rid of ppc_select(), if we can. If Arnd's history is
correct, there's little reason to keep it around and we should just get
rid of it.


-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

