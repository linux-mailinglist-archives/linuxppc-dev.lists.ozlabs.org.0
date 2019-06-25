Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126B55767
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 20:53:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YFg11YMtzDqWb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 04:53:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YFd32lPczDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 04:51:50 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PImHJW074333
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 14:51:47 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tbs0urm2j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 14:51:47 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Tue, 25 Jun 2019 19:51:46 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 19:51:43 +0100
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PIpfNL37224814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 18:51:41 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2F0D136051;
 Tue, 25 Jun 2019 18:51:41 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60A6013604F;
 Tue, 25 Jun 2019 18:51:41 +0000 (GMT)
Received: from localhost (unknown [9.85.210.126])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 18:51:41 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Juliet Kim <julietk@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: retry when cpu offline races with
 suspend/migration
In-Reply-To: <5a825cec-234a-ee8a-a776-8ba305f9cb26@linux.vnet.ibm.com>
References: <20190621060518.29616-1-nathanl@linux.ibm.com>
 <f3b54ef4394bdbf4887d2185bb951c80@linux.vnet.ibm.com>
 <87h88eucbn.fsf@linux.ibm.com>
 <5a825cec-234a-ee8a-a776-8ba305f9cb26@linux.vnet.ibm.com>
Date: Tue, 25 Jun 2019 13:51:40 -0500
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19062518-0004-0000-0000-000015210BD9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011329; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01223180; UDB=6.00643682; IPR=6.01004352; 
 MB=3.00027465; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-25 18:51:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062518-0005-0000-0000-00008C38646F
Message-Id: <877e99ts5f.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250140
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
Cc: ego@linux.vnet.ibm.com, mmc <mmc@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Juliet Kim <julietk@linux.vnet.ibm.com> writes:

> There's some concern this could retry forever, resulting in live lock.

First of all the system will make progress in other areas even if there
are repeated retries; we're not indefinitely holding locks or anything
like that.

Second, Linux checks the H_VASI_STATE result on every retry. If the
platform wants to terminate the migration (say, if it imposes a
timeout), Linux will abandon it when H_VASI_STATE fails to return
H_VASI_SUSPENDING. And it seems incorrect to bail out before that
happens, absent hard errors on the Linux side such as allocation
failures.

