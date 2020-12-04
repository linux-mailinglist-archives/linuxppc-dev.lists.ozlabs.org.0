Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6982CF5CC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 21:45:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnl7w5m2GzDrNb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 07:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oByTVwGn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cnl654nkRzDqDb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 07:43:25 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4KWsWl012901
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Dec 2020 15:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=KUzJ7fcDPoRZp68V1ZpB/n38fHUIdzCbp+9Is6M2luc=;
 b=oByTVwGnJ8R9So32PmvoCv0IQbeKClibhx+zt4q1D1dqHxEfRS7ul0XFx46rogoYor1P
 65BMElHbks/1BlqgD53mhWuUmpVuo+zFD7YnGxj82a1Q0ptd9NAPbfPjNhWF73wezOCK
 1xaHp4paPgCIQa31A3ZMfbX5VNeeW2ne7bu/pBMnMpFby+HbMshBlM27kvpjnMhKg6P0
 ja8PqYY6dFKHynvMsoFAnS5vhz/uVMukMtVBUhnNT/WEri5dLJ6BuKCFFoIxAgsXWbtB
 akMs+kxxN8Cbh17MNGNN0NK/WLZf+qvgrlh9xT0lPUbEuOxfOl2JyWhws4/alM+lTf9O mw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357t8u3a2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 15:43:22 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4KQnOx015646
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Dec 2020 20:37:34 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 353e6a8s2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 20:37:34 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4KbXVi11338356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 20:37:33 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F97EAE05C;
 Fri,  4 Dec 2020 20:37:33 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71C33AE060;
 Fri,  4 Dec 2020 20:37:33 +0000 (GMT)
Received: from localhost (unknown [9.65.255.125])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 20:37:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 01/29] powerpc/rtas: move rtas_call_reentrant() out of
 pseries guards
In-Reply-To: <20201030011805.1224603-2-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-2-nathanl@linux.ibm.com>
Date: Fri, 04 Dec 2020 14:37:33 -0600
Message-ID: <87r1o51f5e.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_09:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=721 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012040114
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:

> rtas_call_reentrant() isn't platform-dependent; move it out of
> CONFIG_PPC_PSERIES-guarded code.

As reported by the 0-day CI, this is mistaken, and it breaks non-pseries
builds:

>> arch/powerpc/kernel/rtas.c:938:21: error: no member named 'rtas_args_reentrant' in 'struct paca_struct'
           args = local_paca->rtas_args_reentrant;
                  ~~~~~~~~~~  ^
   1 error generated.

https://lore.kernel.org/linuxppc-dev/202012050432.SFbbjWMw-lkp@intel.com/

I'll drop this and reroll the series.
