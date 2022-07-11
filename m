Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B9570D74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 00:37:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhf0D5hsDz3cCh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 08:37:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LjF97rqG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=muriloo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LjF97rqG;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhdzY5YC8z2yMf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 08:36:57 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BMDoib011729;
	Mon, 11 Jul 2022 22:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=Xv634OTH60QX2RztipW8ScWcU8MHAMjaw/sJR/cHONs=;
 b=LjF97rqGnEJJ4CEsrwPTCdmQBuigp9RFJ7wyeoVU+cYNxOo7x2J04b1Wnfz0RZaXUiq7
 7iT6pspY5bZTbGmfxtAWNDNv/unZAX5PbnmIi9Aq47YuOSOmonU0o6i/dfaPLb+4QwZU
 DP2XX6ZUc8zGacolWLcHDyTcUEr+eXZ6KavFbp42HdkGX0wlM+fkQ8MNsd+QDc9ajPM4
 1JCKRwleR/YJ+BqNdPsf3vVdrpHeg1CkhSJAKi/tUg2Fuvf6BWIz+DtmUqVPT5OcDLXp
 7qY3CLJSrdyJrY56MZnBlEaPY3iPNouW7q4h8pBRnqUszMvHSYBXdNK7C/gxTQWS7cWh CA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8vfd8bvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:36:34 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26BMXaMA007097;
	Mon, 11 Jul 2022 22:36:33 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8vfd8bv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:36:33 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26BMKon8021115;
	Mon, 11 Jul 2022 22:36:32 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma04dal.us.ibm.com with ESMTP id 3h71a9pkr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:36:32 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26BMaV5D10158792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jul 2022 22:36:31 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A449C6072;
	Mon, 11 Jul 2022 22:36:31 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78E0EC606C;
	Mon, 11 Jul 2022 22:36:30 +0000 (GMT)
Received: from localhost (unknown [9.163.4.84])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Mon, 11 Jul 2022 22:36:30 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] KVM: PPC: Book3s HV: Cleanup unused function and declarations
Date: Mon, 11 Jul 2022 19:36:15 -0300
Message-Id: <20220711223617.63625-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BNvzsn6XrWp33fK86lTv5l7gMgFDGNNH
X-Proofpoint-ORIG-GUID: BM2qsaSrrzlvEP4SMh7fhV3CxFTLVyrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_25,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0
 mlxlogscore=243 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207110091
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
Cc: Juergen Gross <jgross@suse.com>, Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Nicholas Piggin <npiggin@gmail.com>, mopsfelder@gmail.com, Paul Mackerras <paulus@samba.org>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Minor cleanup to remove unused function and declarations.

Murilo Opsfelder Araujo (2):
  KVM: PPC: Book3S HV: Remove kvmhv_p9_[set,restore]_lpcr declarations
  KVM: PPC: Book3s HV: Remove unused function kvmppc_bad_interrupt

 arch/powerpc/include/asm/kvm_book3s.h |  3 ---
 arch/powerpc/kvm/book3s_hv_builtin.c  | 18 ------------------
 2 files changed, 21 deletions(-)

-- 
2.36.1

