Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA5948AFB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 15:40:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYCzL0SL1z3bVL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 01:40:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=og6BNbP3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=og6BNbP3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYCyd0bz6z2yPL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 01:39:52 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BE0VE2008213; 
 Tue, 11 Jan 2022 14:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=EArZvkvIKVGDjjQBrVdcqI9KtmABamO+HWMxTD7VQco=;
 b=og6BNbP3o2BROOBGhcQuN9118ERLYhMijA3vjiH1uwOY503u6pUruE2QenCLn3L8Vfk5
 aot5M2p5Ip9PQE0l1NKYgd4zbAitWDres/R0OP4I5DSbZun2S/a18hsIZJZA4n4/QtV2
 tXkGv/AW7CQTRUF4sMLp2U4dXQ/aPxdxQhXvioHr++tM4roxIaM00dp5bw6/S0RgjAmQ
 ZJAkNHIkd4q+ZAmiL4YnomGs2FQSyfpJ6MDIVjCl2MyLptQSuJqE/jeAQncUQqW6YOPV
 bsib9choTw2XDszSWYML+1QLeJUkCJZRhi8mwkN63TYV8aTpupPyfwPx2S+h9DV2f0k4 pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dfm05gaae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:39:46 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20BDOaLu017865;
 Tue, 11 Jan 2022 14:39:45 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dfm05gaa2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:39:45 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20BEMZsf000686;
 Tue, 11 Jan 2022 14:39:44 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3df28ajjrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 14:39:44 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20BEdhbR7799442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 14:39:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C932AE077;
 Tue, 11 Jan 2022 14:39:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DE3FAE06A;
 Tue, 11 Jan 2022 14:39:42 +0000 (GMT)
Received: from localhost (unknown [9.163.2.124])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 11 Jan 2022 14:39:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v3 3/6] KVM: PPC: Don't use pr_emerg when mmio emulation
 fails
In-Reply-To: <1641791924.shozt0u4v5.astroid@bobo.none>
References: <20220107210012.4091153-1-farosas@linux.ibm.com>
 <20220107210012.4091153-4-farosas@linux.ibm.com>
 <1641791924.shozt0u4v5.astroid@bobo.none>
Date: Tue, 11 Jan 2022 11:39:39 -0300
Message-ID: <87pmoy8hg4.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LPgsO4XYqxnudGCFJuFsPy1PdjzPqeXd
X-Proofpoint-ORIG-GUID: rEsKKSsWmUDGDixscx6xei5pXOGAxTga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=713 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201110087
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Excerpts from Fabiano Rosas's message of January 8, 2022 7:00 am:
>> If MMIO emulation fails we deliver a Program interrupt to the
>> guest. This is a normal event for the host, so use pr_info.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>
> Should it be rate limited to prevent guest spamming host log? In the 
> case of informational messages it's always good if it gives the 
> administrator some idea of what to do with it. If it's normal
> for the host does it even need a message? If yes, then identifying which
> guest and adding something like "(this might becaused by a bug in guest 
> driver)" would set the poor admin's mind at rest.

I'll drop this message then and improve the other one that is emitted
earlier at the emulation code.
