Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03757536812
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 22:26:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8xD80S9xz3c1r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 06:26:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sJFdoBcI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sJFdoBcI;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8xBs2vSkz3bsL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 06:25:40 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24RJsbpj005100
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 20:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=pMRqcM4imwK9cZXz02yzpav1nT5W0Sc0xsFsg7+5SdE=;
 b=sJFdoBcIm7e4ttRM2q9m+VC4zl3obMx1adYlnzhdmrM2QdoZ6i9k7JiE3yVluRRPLNkb
 iv+/3+VMDzCetIYavh5lDFDsXKPrR9NW0VKVYhPnrf1DnAqrO3AYFoSEXNpnDY0zBEzU
 uW0Vvs6JZASBh70pD19cyErJfrdihgwGA6e2olNRVeMiWirGOP46Pl83SGlD/WugxxYr
 onZR6RLspYbPUjxvRFQWwBPbtdz1JA6YmnsRqDYYL8UgWX6t8/zWgRY/6/aSD9eFUk48
 njCzflpKcm6wFWr9ASWN7eLrtL/xSG4SzVr+M1b8FQWFF2PS0ocPLGbyXDM0Z+KWn3AI nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb57c0eva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 20:25:38 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24RKPc1R027087
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 20:25:38 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb57c0ev4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 20:25:38 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24RKKb6e025085;
	Fri, 27 May 2022 20:25:37 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma01wdc.us.ibm.com with ESMTP id 3gaas1hjyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 20:25:37 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24RKPahu36176236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 May 2022 20:25:36 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1256C605B;
	Fri, 27 May 2022 20:25:36 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DBFBC6065;
	Fri, 27 May 2022 20:25:36 +0000 (GMT)
Received: from localhost (unknown [9.77.139.3])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Fri, 27 May 2022 20:25:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/4] KVM: PPC: Book3S HV: Implement scheduling wait
 interval counters in the VPA
In-Reply-To: <20220518133935.3878954-3-npiggin@gmail.com>
References: <20220518133935.3878954-1-npiggin@gmail.com>
 <20220518133935.3878954-3-npiggin@gmail.com>
Date: Fri, 27 May 2022 17:25:34 -0300
Message-ID: <87fskulo3l.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N1CPNRa2zT9_ouaoItunmNj1DQJdpM1g
X-Proofpoint-ORIG-GUID: 2lGhOitPm76Pp1t8NFGXlSCfIGHoTGzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_06,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=531
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205270097
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> PAPR specifies accumulated virtual processor wait intervals that relate
> to partition scheduling interval times. Implement these counters in the
> same way as they are repoted by dtl.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

